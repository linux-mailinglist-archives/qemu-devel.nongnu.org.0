Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2114A95B1
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 10:03:43 +0100 (CET)
Received: from localhost ([::1]:51168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFuVK-0008C8-Dc
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 04:03:42 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFtSX-0005gD-Hq
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 02:56:50 -0500
Received: from [2607:f8b0:4864:20::72c] (port=37636
 helo=mail-qk1-x72c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nFtSV-00009j-32
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 02:56:44 -0500
Received: by mail-qk1-x72c.google.com with SMTP id 71so4143137qkf.4
 for <qemu-devel@nongnu.org>; Thu, 03 Feb 2022 23:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vs299XgWtXokVd0R497H1BklWXrKvDQxuEzJHjnYzw0=;
 b=DbiJKMn2g7ZxcdAdE5MLODkMh5dUFgUmntK/kM3UuP6qs5toRvWgzciuQ1PZyo2oHS
 ZR5hBj7DDd5bkh/ROOS6Xui+sbFfctz5kaCBGe3rdY87ZGSFL6oHAr6rVxtI9uS8FJOh
 tptyeWUoy+nqUPawPTvUsJ8JmNuciy6kBi2hTJiInR86koqD57ad5YQAWoudcSRW9ns0
 r5FMgFuFQqi1LcSJPh8tK1f+H/lViAGUrTIUp6FkeFWFGFBu3EAVEDTjNHbydqn5Egzu
 Use29zbjaPcno6xQGG+ntr1vobGeqPElmUCbT0iwHcp7E+HPrk2dRdjofI74Mki0IgKM
 dKIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=vs299XgWtXokVd0R497H1BklWXrKvDQxuEzJHjnYzw0=;
 b=R36WzxKgNoPMwVfCeYjujCyVntMwwvhH/XtVafLL3IIK0wsqTAZspoYcfKBc3ClI+9
 F6+dn1ZHQ1FzPjNSGEfJPYw7MaVeP1QeOveiGDAMZvw7z2tnicguYr6werLT3cd7bp7i
 1VVrGkPNm/pfl37gcF1EnKuY5rj67GNiFzF08gGoX/cgbh4ks3sijGacXDGVMG8sfaWK
 nqlmGBU4Z2nGJrlkDPYIURV/2k9k2qcvIdNeNxkSkCjet5Q/m6F7vZfwKZC6YJK2Lm5P
 fBXvl/JQrIrgRgVrEcvHIpvJZCRdus+mtshAfmERx3ZiDPKPgtTUUUcDhaOD/Lkeswom
 y0sQ==
X-Gm-Message-State: AOAM531UGNg0qz/b6uengjiXv2SNerpx5A10P6IRr8Jrj3jV3jC9Io03
 p0T//22nRiIXU+2h7D7m1Xs73rh+Z98=
X-Google-Smtp-Source: ABdhPJxVWHuI2eFpvUKbkncGGoSB42LECN35+zWK20o6xaJ/YOIOm8sP26bs4eTEe09MrVpIWoF7Cg==
X-Received: by 2002:a37:c85:: with SMTP id 127mr840561qkm.6.1643961401920;
 Thu, 03 Feb 2022 23:56:41 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id s1sm774145qta.0.2022.02.03.23.56.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Feb 2022 23:56:41 -0800 (PST)
Message-ID: <f0493dc1-e365-f753-e740-e164ce94dc70@amsat.org>
Date: Fri, 4 Feb 2022 08:56:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: [PATCH v4 2/5] tcg/sparc: Improve code gen for shifted 32-bit
 constants
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org
References: <20220204070011.573941-1-richard.henderson@linaro.org>
 <20220204070011.573941-3-richard.henderson@linaro.org>
In-Reply-To: <20220204070011.573941-3-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::72c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::72c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-qk1-x72c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 4/2/22 08:00, Richard Henderson wrote:
> We had code for checking for 13 and 21-bit shifted constants,
> but we can do better and allow 32-bit shifted constants.
> This is still 2 insns shorter than the full 64-bit sequence.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   tcg/sparc/tcg-target.c.inc | 12 ++++++------
>   1 file changed, 6 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

