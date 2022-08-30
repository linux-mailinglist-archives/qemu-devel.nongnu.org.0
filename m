Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02ED55A6397
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Aug 2022 14:39:10 +0200 (CEST)
Received: from localhost ([::1]:47280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oT0WL-0004LB-Px
	for lists+qemu-devel@lfdr.de; Tue, 30 Aug 2022 08:39:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34650)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oT0Ia-0006np-K7; Tue, 30 Aug 2022 08:24:58 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:37886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oT0IX-0001Se-Ta; Tue, 30 Aug 2022 08:24:55 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 i5-20020a17090a2a0500b001fd8708ffdfso8553210pjd.2; 
 Tue, 30 Aug 2022 05:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=0vDNokwweObaPKUA8M6fhM0Fh8UI0DkJc3cOzL0vyDo=;
 b=E7G2YhgJm20E8h7xHpQomREkQ1NRvpRTff++ABDW0G22XFK5UvNPPeyQLO4t7JWjax
 t69sDNZ7gXaQmDI1OyiwHl3BMKICziKVQJATMG1xNvBDwXP1pcDhTh94DSjD4XO3gtRA
 /dMv4Ub2aju26ghi/u2vkMto8kjduJMsXeurA5dSgKRUzlBvpTljZG5yylNOHSRZmlOe
 KfGkyAJxxnyPttybEyWXL1LbNbwyuv0AW0NcSUPmKIiAOshx13RkiTFk+7ppoNdxDMWV
 DRMbPfz5cxrD0bokbj5pUVy28yj27uuPYnEecMZGiGRVAkL77lpTDq0Ht73CjzHgxaR3
 Ykrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=0vDNokwweObaPKUA8M6fhM0Fh8UI0DkJc3cOzL0vyDo=;
 b=I6DY4LWPAXRbybgdrn0nYQnyPL4f54EFzWMiCVrhJKnYW40V4ZIYX5bxG/n4WwLx1p
 jpGEY7eq7gocUCDczUIVfYOkV/ovEE5qtoSstEewAJ5nWxHYVzf3kudiMljNaT9iK5Pm
 SL/Y0d7dw+DtiyWSxwmN7eAPkXtu+Cx66TSiNjB0suUm1DAJJ5GHYEYRJHv39R9Bk89W
 64vc0SeuAZBvu6DRZ5Ycxv/gFg93H7fRge1xiAzkiKajRXwwy5TjuAxleD26OQHGAYaE
 3v2pEdvB+/lIdo+4yPgFEpdirwrM5LY9qS2wSPS3sqOt59bkHOGg2I1IzFd9mafbY08e
 Sgjw==
X-Gm-Message-State: ACgBeo3AaX3wJyS3cg17NsKqs4YlPn3+g5ABQAshfaYqvdJ9/43mRZ3W
 W55g39VxGmHnePPErDeP8Z2qZyMuokQ=
X-Google-Smtp-Source: AA6agR5fCGCt7OBqvqgKe1JCXRnUkH4mQXUsTZzj2yqXzpZW/+yZLpgYP8blqVHDlm8C4iJmg52okQ==
X-Received: by 2002:a17:90a:6001:b0:1fa:e851:3480 with SMTP id
 y1-20020a17090a600100b001fae8513480mr23622957pji.153.1661862292353; 
 Tue, 30 Aug 2022 05:24:52 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r1-20020a17090aad0100b001fd77933fb3sm7222959pjq.17.2022.08.30.05.24.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Aug 2022 05:24:51 -0700 (PDT)
Message-ID: <334b5c23-0f22-6a1e-7a60-c208ecdfa5f0@amsat.org>
Date: Tue, 30 Aug 2022 14:24:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH 1/2] target/arm: Remove useless TARGET_BIG_ENDIAN check in
 armv7m_load_kernel()
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shiny Saana <shinysaana@gmail.com>
References: <20220823160417.3858216-1-peter.maydell@linaro.org>
 <20220823160417.3858216-2-peter.maydell@linaro.org>
In-Reply-To: <20220823160417.3858216-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1032.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 23/8/22 18:04, Peter Maydell wrote:
> Arm system emulation targets always have TARGET_BIG_ENDIAN clear, so
> there is no need to have handling in armv7m_load_kernel() for the
> case when it is defined.  Remove the unnecessary code.
> 
> Side notes:
>   * our M-profile implementation is always little-endian (that is, it
>     makes the IMPDEF choice that the read-only AIRCR.ENDIANNESS is 0)
>   * if we did want to handle big-endian ELF files here we should do it
>     the way that hw/arm/boot.c:arm_load_elf() does, by looking at the
>     ELF header to see what endianness the file itself is
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/arm/armv7m.c | 9 +--------
>   1 file changed, 1 insertion(+), 8 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

