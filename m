Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF834AB23C
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Feb 2022 22:13:32 +0100 (CET)
Received: from localhost ([::1]:44252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nGoqh-0001da-El
	for lists+qemu-devel@lfdr.de; Sun, 06 Feb 2022 16:13:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGopL-0000tf-E3
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 16:12:07 -0500
Received: from [2a00:1450:4864:20::335] (port=44760
 helo=mail-wm1-x335.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nGopI-00029l-S7
 for qemu-devel@nongnu.org; Sun, 06 Feb 2022 16:12:07 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 l35-20020a05600c1d2300b0034d477271c1so7331148wms.3
 for <qemu-devel@nongnu.org>; Sun, 06 Feb 2022 13:12:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GXH7Bns1hsyQp5xnDr1EjG+mAau/+IKhz4r0DVxX568=;
 b=X3r11LvZYnRPFRfFYwnSOep9sPe9aYRg+Xs8zdeQJCOaN1nrB/lJpJBT1BL9yNWZwF
 rNGofGrPgNC1AiOzrin44kr+lreXA2VFaRxI4QHrIKeSdxNnW9R1/0HWC0U+3mbxmL4W
 Ucowao/2tQEHi0IAUE3NBorX22RN+UCffFp8nPYQsxO0H9EYBJ2NHDC2clIbvqyPxqiF
 wu6pNUg6CYKRGOW/1F7cfm49SqpESbEmy3VdSKR4+KR7Tg8uvGBebE4wbnp2u8wgfIGi
 cbbkjtFyQ8s4UKMD7Rq7JojUynK8r5R8DHBsNn4249zadIQdyx7+NvXm+GJfZpZOBnev
 +tgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=GXH7Bns1hsyQp5xnDr1EjG+mAau/+IKhz4r0DVxX568=;
 b=XbdsHp1opMs0+I2E5uQK99a7Tl2FkWQkZAoY5Gkf7Do972MISXU85xQONsuOF9PAIe
 kzBkwmFzjJNwYnjxttQb+BYs1kWebmdmwMRi+9NgWON31N0UfW+wG9V1OB7LHA27GiQA
 BBm1Rbyfy+oSoQow3Y/tQivgC7sH3fkgZmSKyLg+K8yI1on4vcMg1V3NqhQcgRRTUbh6
 jfyK/Tj0ySOJJPaS3oG2WwReCVgBiyBnVHBGMox14Bd+M1jidNfS7Wd9flrydCc94hgO
 7YET6ZaEV8HTi05U/j/Fnvo+x+MrI/zE4d0CwlYPGSSkScEIAepmF4xMFybN/TPzusRY
 niHQ==
X-Gm-Message-State: AOAM530U0oLnHDYwOJoxcH6z7u1y5GivxmFNYPvfBBmFHwFab9jsSdpP
 ZgjZ/qpc0xb/rrC+N0sgGgE=
X-Google-Smtp-Source: ABdhPJxubhatTIZrTrjyqFVAYZicDSbzRDZWzIazPY1MfY72chqUMUoFWgamqYdwH7OesRTXq8krOg==
X-Received: by 2002:a05:600c:1d17:: with SMTP id
 l23mr8173725wms.174.1644181922857; 
 Sun, 06 Feb 2022 13:12:02 -0800 (PST)
Received: from [192.168.1.33] (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id y7sm7724584wrr.74.2022.02.06.13.12.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Feb 2022 13:12:02 -0800 (PST)
Message-ID: <d1e8e3f9-d8bc-17de-17d0-d5c47d9fb81d@amsat.org>
Date: Sun, 6 Feb 2022 22:12:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.1
Subject: Re: Add TCG support for UMIP
Content-Language: en-US
To: Gareth Webb <Gareth.Webb@umbralsoftware.co.uk>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "eduardo@habkost.net" <eduardo@habkost.net>
References: <CWXP265MB2632458273BF3C50900DF150D32B9@CWXP265MB2632.GBRP265.PROD.OUTLOOK.COM>
In-Reply-To: <CWXP265MB2632458273BF3C50900DF150D32B9@CWXP265MB2632.GBRP265.PROD.OUTLOOK.COM>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::335
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
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

On 6/2/22 21:27, Gareth Webb wrote:
> Dear Maintainers,
> 
> Please find attached a .patch that adds support for the UMIP cpu feature to x86 TCG. Apologies for the patch being via attachment, I can not get git send-email to play nice with office365.

Can you try posting from sourcehut? It worked for other contributors
with the same problem you are having. See https://sr.ht/

> 
> This is my first time committing to the project, so please be nice and point out any issues or omissions.
> 
> Kind Regards
> Gareth Webb


