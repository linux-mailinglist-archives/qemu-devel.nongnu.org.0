Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D928543CEC4
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Oct 2021 18:30:42 +0200 (CEST)
Received: from localhost ([::1]:40142 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mflp3-000437-VQ
	for lists+qemu-devel@lfdr.de; Wed, 27 Oct 2021 12:30:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mflFs-0001mc-Pe
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:54:20 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:44902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mflFd-0005v7-Q5
 for qemu-devel@nongnu.org; Wed, 27 Oct 2021 11:54:20 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 j2-20020a1c2302000000b0032ca9b0a057so2729379wmj.3
 for <qemu-devel@nongnu.org>; Wed, 27 Oct 2021 08:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KdAf9/6u13sdqBIEmKGXwiHPDcdZ/0BtJUjO8KFHHM4=;
 b=BbyLoffI5q/KdaxLh8u9vrKdgI6kKzWDTHrz47a/rv62y6sE5d7q2F81qeiujPbzHi
 Oq6FAYwSSbb1PzdV2pTqISSoqbFuo8gk1VZZvgRiAcRqYSWR4jEbLsDgKmDPz8Vgg1KT
 IN4jcu/dERpXDAipLOicJZmEfQsjka6sdcMR5kTELPBBd/yYu4/OEZlGvWC+jbpU1EgF
 4E0qXEm8FLspbDjDq/P4UJuj2tBsU8F9G9guetdwgL5AvlH9p2tSO/l0u+DtHmj9SU60
 u9L8O/v3AvsZOEb+O2wedBwCghMRa16p0Ixgkt4CjnnMNyHkw9C885UP22+lQn9040S7
 paXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=KdAf9/6u13sdqBIEmKGXwiHPDcdZ/0BtJUjO8KFHHM4=;
 b=YPhvn/uaI9MAHYtCo3FK2NKOG7JYogsu6oAixoP31fQR1JYUTCpzsLVY25vh/WYBAK
 bmebsNt6EcUCqJGDe2hOu3lC8zYHBQpBV3BOHN7p2nGUovz8cmZtvdhuSosAgzcCRUsN
 fUkDKEf7sbk+FEoIDL3fJ9xKmpl3JGeCMQqPujYaL8OjGFCo3bg/DGyNH68x2KYHsEEZ
 aPOfd2+eWIdGEaGm5OrKKvEMunrRB9ylHU7jy1Sb6Xs4GEsszBRXsLahDrCr1NLjZC2/
 0gDm6edIb4yniDM08eBEHF5nT3yDsJlVbUCmn7rMecVr3GxE/SqeWwiL/1wLfkNNKlJS
 6zwA==
X-Gm-Message-State: AOAM5319xmuZ5IsovvRPZsfCozViOau83lI3ie4/QDKLx4C9uBXfgvLt
 koZx9MhHBz2/+zbVRvecNIE=
X-Google-Smtp-Source: ABdhPJxrAqrx1+8LtZn0q9STx3FzsTxF2R8L+szSZFDLg9Od/WosrocDi6OBdHTLnBcEsV3+bK1NVA==
X-Received: by 2002:a1c:f316:: with SMTP id q22mr6698578wmq.55.1635350043348; 
 Wed, 27 Oct 2021 08:54:03 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id n5sm3685241wme.6.2021.10.27.08.54.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 27 Oct 2021 08:54:02 -0700 (PDT)
Message-ID: <f40a2ecb-0596-5821-7fdf-4b9528ce342f@amsat.org>
Date: Wed, 27 Oct 2021 17:54:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 02/11] hw//sh4: Use qemu_log instead of fprintf to
 stderr
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org
References: <cover.1635342377.git.balaton@eik.bme.hu>
 <c788cbcd379e42908b55df5785c031e437f81a5b.1635342377.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <c788cbcd379e42908b55df5785c031e437f81a5b.1635342377.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.847, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Magnus Damm <magnus.damm@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Yoshinori Sato <ysato@users.sourceforge.jp>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/27/21 15:46, BALATON Zoltan wrote:
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  hw/char/sh_serial.c |  7 ++++---
>  hw/sh4/sh7750.c     | 13 ++++++-------
>  2 files changed, 10 insertions(+), 10 deletions(-)

>      case SH7750_GPIOIC_A7:
>          s->gpioic = mem_value;
>          if (mem_value != 0) {
> -            fprintf(stderr, "I/O interrupts not implemented\n");
> +            qemu_log_mask(LOG_UNIMP, "I/O interrupts not implemented\n");
>              abort();

This change is annoying. Before you'd get an error message and the abort
signal. Now if you don't use "-d unimp" you get an abort without
explanation. Can we use error_report() instead?

>          }
>          return;
> 


