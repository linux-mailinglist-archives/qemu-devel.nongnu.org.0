Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FDD4AAD1A
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 00:52:54 +0100 (CET)
Received: from localhost ([::1]:46880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGUrN-0004IK-BL
	for lists+qemu-devel@lfdr.de; Sat, 05 Feb 2022 18:52:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUp1-0001HU-Jq
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:50:27 -0500
Received: from [2607:f8b0:4864:20::102f] (port=43568
 helo=mail-pj1-x102f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nGUot-0005tt-B5
 for qemu-devel@nongnu.org; Sat, 05 Feb 2022 18:50:20 -0500
Received: by mail-pj1-x102f.google.com with SMTP id
 v15-20020a17090a4ecf00b001b82db48754so9728310pjl.2
 for <qemu-devel@nongnu.org>; Sat, 05 Feb 2022 15:50:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=CcTskkdcx+rrQ6DLiJKW8bTvuVJ8irZbSJawT5ad2ws=;
 b=f1T2+I5MJHs7GJAm5kTdC6mmE35SySe0JyX2T/VD4x3FKHgbugUfTBfxgp4yppNULm
 bf5yHJH9v8sQk6OG86pJ3vUlovyrRV2GLFJUNzPe0pEb6sAKuxbreVMBWxAbxz8Hf2lv
 59WtdBPyQi2Nu62q+WuUdYQoF7g//rb1+O5LTZvzEIrnu3FEls9He+KGLuOBC358q6MT
 fvG5zA7ibLOdTGPpC+9zraM+Rs59HZpw/7KEMDXQKz3ismizSehbl/4bSYCyMa899Fpk
 kW4twAlFxgzSXzjJfvzR8fnEO/VBxLqoRkNTtjl2DM8FGVaaCrFBN1RA4bC9JKreFOvh
 KhEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=CcTskkdcx+rrQ6DLiJKW8bTvuVJ8irZbSJawT5ad2ws=;
 b=nBAfChGR6G64Aglc8cR4n/0EIl+b1jasRbMl7+aqDGP3+sTocJmQUmnY4nH5rL7mNp
 I1iKtiU4ZhDEOGrDVckrzojIIy+vcTvIdFp7Uiifkra1f1KfjCDzG5uZ3jBD5CjHB+75
 U52yP8a3FDe+kQzFktvY+4iRk6D3mBigNQA7z4fM29pG60Ul0qw1/Rbl+46Ua41PUQXS
 Qrwww6t7d/O6NquZf4V/QodGLx0znlU++S3uPQTz1UAZwaRfDGiLiZ2J1Ky5Aa3ptUdl
 xBpai+FFC5FnyRf0pFip67N55vFdySBlaRdiBVwZnbkFLDW4KJ+hQBDtLgmVfvdlQsZ2
 lH8g==
X-Gm-Message-State: AOAM532uNRYIuPCq0BgCAwD0zaHOuJ7zJ+boF4l9G0YQlNx+9wa68qxH
 TLzrIkz+NvxObT7UAwULV3UrDX1kbKD5iKNc
X-Google-Smtp-Source: ABdhPJwekdC19QxbyOdPMHOl7TIlhzAAyIvGM1FezQ7HTBJEjDjKKW2PdBWpBhD93wQH/3J4sSXYig==
X-Received: by 2002:a17:90b:388d:: with SMTP id
 mu13mr6500803pjb.226.1644105017859; 
 Sat, 05 Feb 2022 15:50:17 -0800 (PST)
Received: from [192.168.1.118] ([220.235.247.127])
 by smtp.gmail.com with ESMTPSA id r7sm9128392pjp.2.2022.02.05.15.50.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 05 Feb 2022 15:50:17 -0800 (PST)
Message-ID: <4ea01ced-2c43-edd5-b42a-f3e3dc594ff4@linaro.org>
Date: Sun, 6 Feb 2022 10:50:13 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 05/10] qtest: Add missing 'hw/qdev-core.h' include
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220203193803.45671-1-f4bug@amsat.org>
 <20220203193803.45671-6-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220203193803.45671-6-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102f
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/4/22 06:37, Philippe Mathieu-Daudé wrote:
> Add "hw/qdev-core.h" to avoid when refactoring include/:
> 
>    softmmu/qtest.c:404:9: error: use of undeclared identifier 'NamedGPIOList'
>          NamedGPIOList *ngl;
>          ^
> 
> Signed-off-by: Philippe Mathieu-Daudé<f4bug@amsat.org>
> ---
>   softmmu/qtest.c | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

