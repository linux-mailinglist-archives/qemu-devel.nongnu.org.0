Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01F0A455EA6
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 15:52:15 +0100 (CET)
Received: from localhost ([::1]:40838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnilq-0005BM-4K
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 09:52:14 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1mnigl-0002vm-OP; Thu, 18 Nov 2021 09:46:59 -0500
Received: from [2a00:1450:4864:20::135] (port=34696
 helo=mail-lf1-x135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1mnigh-0006I5-Bb; Thu, 18 Nov 2021 09:46:57 -0500
Received: by mail-lf1-x135.google.com with SMTP id n12so27318178lfe.1;
 Thu, 18 Nov 2021 06:46:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=hIwiOcEBNnHlAsKG5l7NsT6ydB1gsNL/+mXlCz9Az+M=;
 b=cQPJO90cNK543x8Xf8Gg5zCucBxXblh39VKsqbSDsjH6c0pLGxiBg1g9p/iQUjsw46
 U7JdYETe9F07KlUWR3hhui0zspEhJ3Rc/7iWoDxgKQ1b17WdqzRPgOb+5mmVY0B28+x0
 TjFQodAtpm5sHhvHBW3RfX9mj23YrQ4RlqEoGedFzLhKOyevqAi1Tt46jellOiLWlDZ6
 IXjH7L/g/4iNptL/oUoH2MHVgicmg1Fcd3+LaQUwvohC/93W1DKtYrKmRzjRmGuHtl/8
 AZug+D6Y8tH2zQTKZwNHJiVDKq4f8BILoZfVeq3Xpsac4XF64ryYoaOTv/TPxxJCoAoR
 OdkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=hIwiOcEBNnHlAsKG5l7NsT6ydB1gsNL/+mXlCz9Az+M=;
 b=ss/MJQxiZRpJZDTQIuf61V+YGmIT3YPovbEOGu5TOQd84m2mqzpfSh8ZVJJ8yQZA3i
 LR4gyW2w6VpRvcxi/pQ3DcVBjHA8PUIJj4tU23QPYB3SvjEMqiet5lz1ICFI6Hz704Ju
 uT5fIQXOrjrrqav+ewl5LEhatXhJ4/fraYpy/PuZq6VYFnYkMmCKELLUAKENeXnzOM9i
 80GcJmD7EvgQ1S4eqO8s/Bv28D792DsncxgtY6XnNnHLX60Cxf5VaTm4RmSwemWgoRdv
 c8Pl9h/ROVYggt5wvdIlilzbuzff2AHRgCWfwIQOL2Kf+LzM2ImyOSTSCtNz46x4Fiwe
 MI0Q==
X-Gm-Message-State: AOAM533Hkplu/Q1/YUmY2D4nPXhZ+X6ARfZs+7RmB4MXI2LtbdkRoucW
 kWLLlB6ASZ31e5AhS8GdFvgFKt9rLuNg6Q==
X-Google-Smtp-Source: ABdhPJyavX0MM+tOsVkZrBqBaFrD71lppykl3pi5cKOrCEKpwuUT5MtqOUp4A3QwXMsGxM0rOUVZ2g==
X-Received: by 2002:a2e:974e:: with SMTP id f14mr17813582ljj.153.1637246813198; 
 Thu, 18 Nov 2021 06:46:53 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id h17sm7561lfj.160.2021.11.18.06.46.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Nov 2021 06:46:52 -0800 (PST)
Date: Thu, 18 Nov 2021 15:46:52 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v2 09/13] hw/microblaze: Replace drive_get_next() by
 drive_get()
Message-ID: <20211118144652.GQ3586016@toto>
References: <20211117163409.3587705-1-armbru@redhat.com>
 <20211117163409.3587705-10-armbru@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211117163409.3587705-10-armbru@redhat.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::135
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x135.google.com
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 17, 2021 at 05:34:05PM +0100, Markus Armbruster wrote:
> drive_get_next() is basically a bad idea.  It returns the "next" block
> backend of a certain interface type.  "Next" means bus=0,unit=N, where
> subsequent calls count N up from zero, per interface type.
> 
> This lets you define unit numbers implicitly by execution order.  If the
> order changes, or new calls appear "in the middle", unit numbers change.
> ABI break.  Hard to spot in review.
> 
> Machine "petalogix-ml605" connects backends with drive_get_next() in a
> counting loop.  Change it to use drive_get() directly.  This makes the
> unit numbers explicit in the code.


Acked-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  hw/microblaze/petalogix_ml605_mmu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/microblaze/petalogix_ml605_mmu.c b/hw/microblaze/petalogix_ml605_mmu.c
> index 159db6cbe2..a24fadddca 100644
> --- a/hw/microblaze/petalogix_ml605_mmu.c
> +++ b/hw/microblaze/petalogix_ml605_mmu.c
> @@ -183,7 +183,7 @@ petalogix_ml605_init(MachineState *machine)
>          spi = (SSIBus *)qdev_get_child_bus(dev, "spi");
>  
>          for (i = 0; i < NUM_SPI_FLASHES; i++) {
> -            DriveInfo *dinfo = drive_get_next(IF_MTD);
> +            DriveInfo *dinfo = drive_get(IF_MTD, 0, i);
>              qemu_irq cs_line;
>  
>              dev = qdev_new("n25q128");
> -- 
> 2.31.1
> 

