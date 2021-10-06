Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74FF6424383
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 18:57:44 +0200 (CEST)
Received: from localhost ([::1]:41856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYAEh-0006FH-9F
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 12:57:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41416)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYA9s-0000F2-0E
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 12:52:44 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:51790)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYA9q-0001sv-42
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 12:52:43 -0400
Received: by mail-pj1-x102c.google.com with SMTP id kk10so2683063pjb.1
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 09:52:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=N41lxli0Wt4ZR69Me9t4SZX+RIjcEDdGYMPwv2qpIFo=;
 b=Szpqh5mEuOykjjcrzi/H9Q3mRfj0wO2fDIflcFKIh3qtneATiYb6uK3ZmcQ4Qa57wQ
 Bg3pDbNfUXXI9sVDzFiJ1+xILDUgmM5IQLebOW8MyyAw96Ymyrp/MJVhybpe3FP02Dkc
 RZCiPF15iiygGBPTTSZ5wHaeaoE5/FBZW/6kHAvoQQYVSNaTUVQIc0E3sQT9hB1C3/sD
 DoqHSHCGmrZIlP2OYc1zcqnhX0vGXMGOI+XAZUMl3b4/A2ZQxOsYZbEr7KmtKTdMAFDC
 TF2+kprsM2GETlIAx/pSDhcUTpwKICMVwZ7n+NHiM8DaQWDuH7fMyNagz/8nGwQES4ng
 BeIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=N41lxli0Wt4ZR69Me9t4SZX+RIjcEDdGYMPwv2qpIFo=;
 b=ZGNWN3aXvsl6Y/7BaQWiinISJ9l7qJzrdDraKkMCRzbze7/JWaEDZz1w7OKoTSqHpR
 k4ounPK5u2Yv43GLbarfueUD2cPYp/ZAw9Rz5wuNOE65Urvz/D2H6oFuzF6lONJV7tls
 bKnNKW7gCCqtLUfVsW/pt7oE3cowXF14+Dlr5rq613Pl5jiszGSUg67dD8AslMiQ5cyy
 lMd8zxJN9FTgGVLHGKAxhW1nmQ72T5FZJ1kdQihJyHuNQrfBPP3fVJYOsjQcYH6Gr4h4
 KQ4kmlmlFchWqMbOQmuSpVgQ2P/yRX+PlA1npiAR4KD0Eoq2NGQ3QYDEZ5ZiRIeJuqmS
 iizA==
X-Gm-Message-State: AOAM530kMV3oY4kwN+Y8DM/J+FgpgqWEATeZ9aamc2lkBHX6yV3KSWSn
 w/135DUWcYJwerBmbZldgf9afk0Ety+lRA==
X-Google-Smtp-Source: ABdhPJzjOfhSkmZVmR3qJYJHkCYCGbn8sLVAo9ZELXjEr3D8w2nTC3bZ3103mTJpXfWbHs2SEwgaPg==
X-Received: by 2002:a17:902:7e0a:b0:13e:8617:b98 with SMTP id
 b10-20020a1709027e0a00b0013e86170b98mr12060948plm.74.1633539160134; 
 Wed, 06 Oct 2021 09:52:40 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id l14sm5862596pjq.13.2021.10.06.09.52.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Oct 2021 09:52:39 -0700 (PDT)
Subject: Re: [PULL 12/12] meson: show library versions in the summary
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211005164408.288128-1-pbonzini@redhat.com>
 <20211005164408.288128-13-pbonzini@redhat.com>
 <2fe71843-bcbe-cbc7-dfed-d9beb60e9f2b@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <658443a3-35ea-67ad-64f5-eb25059a454b@linaro.org>
Date: Wed, 6 Oct 2021 09:52:38 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <2fe71843-bcbe-cbc7-dfed-d9beb60e9f2b@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.964,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/6/21 9:22 AM, Philippe Mathieu-Daudé wrote:
> There seems to be something wrong here:
> 
> The Meson build system
> Version: 0.59.1
> [..]
>      rbd support                  : YES
>      xfsctl support               : NO
>      smartcard support            : [<mesonbuild.mlog.AnsiDecorator
> object at 0x7f00880538e0>, ' ', <mesonbuild.mlog.AnsiDecorator object at
> 0x7f0087ee6850>]

Paolo said in the cover letter that 0.59.[01] are broken, and that's why 0.58 is allowed 
but we default to 0.59.2 (from the submodule).


r~

