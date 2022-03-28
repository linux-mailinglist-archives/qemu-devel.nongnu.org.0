Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2290F4E8C3F
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Mar 2022 04:42:04 +0200 (CEST)
Received: from localhost ([::1]:53728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nYfKV-0006YE-8Q
	for lists+qemu-devel@lfdr.de; Sun, 27 Mar 2022 22:42:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:43716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYfJJ-0005nv-I7
 for qemu-devel@nongnu.org; Sun, 27 Mar 2022 22:40:49 -0400
Received: from [2607:f8b0:4864:20::c2b] (port=34515
 helo=mail-oo1-xc2b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nYfJH-0006ma-Ma
 for qemu-devel@nongnu.org; Sun, 27 Mar 2022 22:40:49 -0400
Received: by mail-oo1-xc2b.google.com with SMTP id
 p34-20020a4a95e5000000b003248d73d460so2361618ooi.1
 for <qemu-devel@nongnu.org>; Sun, 27 Mar 2022 19:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=pKj/LNWoxcRLRKk1fph/Ca9Q9/4SclgqCuenY2+y5mg=;
 b=i7PptS7xAj1Ltcx+cW68Av96iGHiJHdHZ0+lCihUaJovBpcZ+URCMXqu+fOei9dCiN
 W0QFif1ckb7aaVmCSOdrBZIA6KY58WzRL8gAGt8zkVHbZcfFnl0lUTfzImgZgc6Yx1k1
 SXMdAGgabMJuwsBzFXJagxuLoZV8oGaQfwak+Mbg7OFa9aqGuMom9n4ahTYfRlKeum3h
 38N0mCuF19insHJmIaTnd9/SOC6s+i0hr3UmlWqcaT7bTFtDZZzIClEdaAoRh5GGbZIt
 jFWtx3MtC3R9yPhJGnkRwjB7C8PwnQSdGfMtdLJBsNN5Cc1B3BOgzJmlIevqIiWSAIeg
 6kxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=pKj/LNWoxcRLRKk1fph/Ca9Q9/4SclgqCuenY2+y5mg=;
 b=clTPWEKSKJvtMzGhjyNIGh+O1GN2CqdCsggVODNTsT7K6lj4C4cN4K+29+gYgPXE7F
 +MkGN6u0F+NvshrDDSveRJo36mNNbrXIUF26QWzN+dqfA+LBZyPye2f2vljtHYw3rptj
 C0qt4WgcLBZKjOeHnHMmJ+KFUEmVLNnz/jsMiGD46m/XhdrA6kJN+FBocPKsU3ZgYfXd
 pkYkSRQ7D291sbS6TckEs9ZkM75vC0w+7BZAAolUlj88GS/aC37gqEXan3m+BLGUsF5Z
 AwD1070xL2nFvx4r4zhEC4ge2oZG9HAqYWUAHaVXk7Fkqax3jMSv3SMGFv7/qkKbwlGr
 0d6g==
X-Gm-Message-State: AOAM5307S35xmwissYkcqk7LcNxny1jRZIR0ng2F6tAzlp/7NxwEYT/0
 N3M9nHcR6kCE+oNl+0fNL/+ndg==
X-Google-Smtp-Source: ABdhPJxH2rczEps5ccqWd3TLz9i/Hp4jVO/zgKXK7TjsWtBexXdqYai0KtXwqyzWKlnoOVvC1YmUlA==
X-Received: by 2002:a4a:d5cc:0:b0:31c:36b:6338 with SMTP id
 a12-20020a4ad5cc000000b0031c036b6338mr8234945oot.66.1648435245492; 
 Sun, 27 Mar 2022 19:40:45 -0700 (PDT)
Received: from [172.24.1.26] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168]) by smtp.gmail.com with ESMTPSA id
 m5-20020a056870194500b000d9a0818925sm5845403oak.25.2022.03.27.19.40.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 27 Mar 2022 19:40:43 -0700 (PDT)
Message-ID: <d92dafb0-5a84-eff5-62fa-4fb7b10d0837@linaro.org>
Date: Sun, 27 Mar 2022 20:40:40 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH] target/mips: Fix address space range declaration on n32
Content-Language: en-US
To: WANG Xuerui <xen0n@gentoo.org>, qemu-devel@nongnu.org
References: <20220327053456.2552855-1-xen0n@gentoo.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220327053456.2552855-1-xen0n@gentoo.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::c2b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2b;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc2b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 =?UTF-8?Q?Andreas_K_=2e_H=c3=bcttel?= <dilfridge@gentoo.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/26/22 23:34, WANG Xuerui wrote:
> This bug is probably lurking there for so long, I cannot even git-blame
> my way to the commit first introducing it.
> 
> Anyway, because n32 is also TARGET_MIPS64, the address space range
> cannot be determined by looking at TARGET_MIPS64 alone. Fix this by only
> declaring 48-bit address spaces for n64, or the n32 user emulation will
> happily hand out memory ranges beyond the 31-bit limit and crash.
> 
> Confirmed to make the minimal reproducing example in the linked issue
> behave.
> 
> Closes:https://gitlab.com/qemu-project/qemu/-/issues/939
> Signed-off-by: WANG Xuerui<xen0n@gentoo.org>
> Cc: Philippe Mathieu-Daudé<f4bug@amsat.org>
> Cc: Aurelien Jarno<aurelien@aurel32.net>
> Cc: Jiaxun Yang<jiaxun.yang@flygoat.com>
> Cc: Aleksandar Rikalo<aleksandar.rikalo@syrmia.com>
> Cc: Andreas K. Hüttel<dilfridge@gentoo.org>
> ---
>   target/mips/cpu-param.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

This is what I was expecting, when I read the issue report.
Thanks,

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

