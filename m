Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC77B43F6D6
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 07:53:19 +0200 (CEST)
Received: from localhost ([::1]:45122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgKpK-0002JH-SC
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 01:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgKax-0006NX-35
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 01:38:27 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36812)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mgKat-0000kG-LV
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 01:38:26 -0400
Received: by mail-wr1-x434.google.com with SMTP id s13so7173886wrb.3
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 22:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=thtBfG8DzbE50vJTiCDxD7eeXYrPAxk4gwUTHaHJB6g=;
 b=VUzXMp+ndbP5Pl12W8jkvxOxqMcpfvPvXD97VECEOI1t3WvaIl35zfXjvsBgCh+RzX
 aCGSWkcEkXOeuYuy2ymjprd9CQbYwkazr79fwIugt0Pvnvozo6zbCwpjnrwokxM+fmGw
 0sqrFuWF9uDNwlbGfY1s01nPjRxelMwuIT/8WNkmd3vsi5VmtfVEjr+63fWTJDXRwzFo
 oMBwABDFAC2okuGnGPP2byt/aToAfxx6Qsft9qRRy+OpbeqMUnCuYPbiRm5vBANeYC3W
 cF3LDpE03cYYE7NKLCP3LSeSqIJYVjCWfIttzKIFSp9XoA0d7TgeCAJvImEGZ333m6CG
 ZBlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=thtBfG8DzbE50vJTiCDxD7eeXYrPAxk4gwUTHaHJB6g=;
 b=1nwsZM/2IPFTssIcKbz4ZlIk4TyuFPkk5d7ISrjrAV/asksEDHb+mPg1RqkrwkMTBx
 f889F2/01E8KXHkCT96ofnkGjCXZrzL4zhREukSt6nCziKaogSrpNrNWWbUInjR240wm
 In+0r1nBeKVolNuTH7dX9g7PmXCZIsRec9w/bGTS7u+DNNT+RzKJRPH1QbfgppJCTTlb
 ALdjJkWxJccNszl6gNV4spnLqLP1K4f+UDq9AqaCSMWItvtHljvO43awonaS0/p2VGyq
 /I0Ko5s33yjP1zBTrUiZ4fpux7X+3G4BiAEFhvTzMTZ0fxemyJxgVCkty5FQ8qdzfUPB
 xW5Q==
X-Gm-Message-State: AOAM5318+qm1zZmkFseZjtAytuXQ+8IYysgbgyJKh2yhb+pwgFO1P5Qp
 83vSVLiQCsNIkc8BR1e65paA8757kLA=
X-Google-Smtp-Source: ABdhPJzyhoSHf8oRoVJCg4aVOoX984TdXNPMt3bCmQP3oT53QUCI4dS6BeB6IByRvCLtMYcbrniBjg==
X-Received: by 2002:a5d:4210:: with SMTP id n16mr11673545wrq.426.1635485902042; 
 Thu, 28 Oct 2021 22:38:22 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id c16sm4870584wrm.46.2021.10.28.22.38.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Oct 2021 22:38:21 -0700 (PDT)
Message-ID: <872302f8-76f1-4613-10af-9c61773e1f58@amsat.org>
Date: Fri, 29 Oct 2021 07:38:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v4 02/23] hw/char/sh_serial: Use hw_error instead of
 fprintf and abort
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635449225.git.balaton@eik.bme.hu>
 <1ecc1748443a161ecb988aab6b89c68e5ae631ff.1635449225.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <1ecc1748443a161ecb988aab6b89c68e5ae631ff.1635449225.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.847,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/28/21 21:27, BALATON Zoltan wrote:
> It does the same with dumping some more state but avoids calling abort
> directly and printing to stderr from the device model.

hw_error() is unfortunately misnamed, it is meant for CPU code,
and we want to get ride of it. What you probably want here is
error_report() which also reports to the monitor.

> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>  hw/char/sh_serial.c | 9 +++------
>  1 file changed, 3 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/char/sh_serial.c b/hw/char/sh_serial.c
> index 1b1e6a6a04..dbefb51d71 100644
> --- a/hw/char/sh_serial.c
> +++ b/hw/char/sh_serial.c
> @@ -26,6 +26,7 @@
>   */
>  
>  #include "qemu/osdep.h"
> +#include "hw/hw.h"
>  #include "hw/irq.h"
>  #include "hw/sh4/sh.h"
>  #include "chardev/char-fe.h"
> @@ -200,9 +201,7 @@ static void sh_serial_write(void *opaque, hwaddr offs,
>          }
>      }
>  
> -    fprintf(stderr, "sh_serial: unsupported write to 0x%02"
> -            HWADDR_PRIx "\n", offs);
> -    abort();
> +    hw_error("sh_serial: unsupported write to 0x%02"HWADDR_PRIx"\n", offs);
>  }
>  
>  static uint64_t sh_serial_read(void *opaque, hwaddr offs,
> @@ -307,9 +306,7 @@ static uint64_t sh_serial_read(void *opaque, hwaddr offs,
>  #endif
>  
>      if (ret & ~((1 << 16) - 1)) {
> -        fprintf(stderr, "sh_serial: unsupported read from 0x%02"
> -                HWADDR_PRIx "\n", offs);
> -        abort();
> +        hw_error("sh_serial: unsupported read from 0x%02"HWADDR_PRIx"\n", offs);
>      }
>  
>      return ret;
> 


