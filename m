Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D7AA455EBD
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 15:54:36 +0100 (CET)
Received: from localhost ([::1]:46402 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnio6-0000i5-BC
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 09:54:35 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1mnigu-0003SF-Be; Thu, 18 Nov 2021 09:47:08 -0500
Received: from [2a00:1450:4864:20::129] (port=45624
 helo=mail-lf1-x129.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1mnigs-0006J9-5B; Thu, 18 Nov 2021 09:47:08 -0500
Received: by mail-lf1-x129.google.com with SMTP id m27so27087921lfj.12;
 Thu, 18 Nov 2021 06:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=e0iNmG+ALESer+7as8Y80bQsaMjkBuVSGgYvNOKD/AQ=;
 b=RH/KT4i83xrYkkJraDa5Q+98foYJMSqc+OlhLxqYiD3ONt79mi/R4qoPOo2093XqAX
 4mw6VG4BYejHIVn798zizIBzRMalz298UC3HnlqzJqR/1LLjsmU9UVtKQZBSd7Qp1vTk
 Bztj0PQnBu17l5EX9zfaOVXTtPDQLy1oqblrEVLC5eUra49alY9ADdx2pdcibpNI3utQ
 tFV/yDcOJcBT8adGcdqaEN0VUfv5o5eG9fqjzpiXtc16/c4ROA7+bpGehup6+HzgbqEe
 pbNdZXbDfMa1Aql/oBBGU4ryxw3vS9SXeOLXXMqSwAcI9CSRrBDFRun33YLPV+OSevbt
 iCjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=e0iNmG+ALESer+7as8Y80bQsaMjkBuVSGgYvNOKD/AQ=;
 b=VkLNgqQJIpeRNbtYT3Ea4A7ycVY1OMnvbyrNHEQdqnZJNiads+zqUDibdcFR7RJ9Id
 acqJfLHuN4LB6zWESWAJg6poMj9nTy1kYCWV+CKYozoNOvu4rIqvtDo+dAzsrj1rf7tb
 03/eJxC8+nbYFGSD1vsLsRyJ1E5LhCHbzCB1eUDFSSAJXvcpZ2H1hcPw3O0CRbqAY2Cr
 fOHbt21i0giNKuKz85XXlkPjZbRWjdbMOQpt73FZlRJqq1IVKjweZz9aXfrUat+usk+7
 6Ynt83O80M09ItRXmRqrXJKaYlPLnSqjfK0zJbSM421RliWfzD4sRD6Ai1qQDU5/UIpV
 KsfA==
X-Gm-Message-State: AOAM531O2ZW7PSaZLtFz9qO/UhPlH0Wvrf+GipN1c32KIlGg8dc8n3I5
 l5/GqfGSXhrE5/rmMNiEucM=
X-Google-Smtp-Source: ABdhPJxFmEe9y7ZFII2ZikEDgUr7NUA3+hOs462F24QRMm+vL/7bikjLICk9CvIq5AHW37jwk6Sckw==
X-Received: by 2002:a05:651c:1213:: with SMTP id
 i19mr17419776lja.123.1637246823064; 
 Thu, 18 Nov 2021 06:47:03 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id j20sm8172lfu.84.2021.11.18.06.47.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 06:47:02 -0800 (PST)
Date: Thu, 18 Nov 2021 15:47:02 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 08/13] hw/arm/xlnx-versal-virt: Replace
 drive_get_next() by drive_get()
Message-ID: <20211118144702.GR3586016@toto>
References: <20211117163409.3587705-1-armbru@redhat.com>
 <20211117163409.3587705-9-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211117163409.3587705-9-armbru@redhat.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::129
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 FSL_HELO_FAKE=0.001, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 17, 2021 at 05:34:04PM +0100, Markus Armbruster wrote:
> drive_get_next() is basically a bad idea.  It returns the "next" block
> backend of a certain interface type.  "Next" means bus=0,unit=N, where
> subsequent calls count N up from zero, per interface type.
> 
> This lets you define unit numbers implicitly by execution order.  If the
> order changes, or new calls appear "in the middle", unit numbers change.
> ABI break.  Hard to spot in review.
> 
> Machine "xlnx-versal-virt" connects backends with drive_get_next() in
> a counting loop.  Change it to use drive_get() directly.  This makes
> the unit numbers explicit in the code.

Acked-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Cc: Alistair Francis <alistair@alistair23.me>
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: qemu-arm@nongnu.org
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/arm/xlnx-versal-virt.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/arm/xlnx-versal-virt.c b/hw/arm/xlnx-versal-virt.c
> index d2f55e29b6..0c5edc898e 100644
> --- a/hw/arm/xlnx-versal-virt.c
> +++ b/hw/arm/xlnx-versal-virt.c
> @@ -669,7 +669,8 @@ static void versal_virt_init(MachineState *machine)
>  
>      /* Plugin SD cards.  */
>      for (i = 0; i < ARRAY_SIZE(s->soc.pmc.iou.sd); i++) {
> -        sd_plugin_card(&s->soc.pmc.iou.sd[i], drive_get_next(IF_SD));
> +        sd_plugin_card(&s->soc.pmc.iou.sd[i],
> +                       drive_get(IF_SD, 0, i));
>      }
>  
>      s->binfo.ram_size = machine->ram_size;
> -- 
> 2.31.1
> 

