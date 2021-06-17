Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD413ABDA7
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 22:42:15 +0200 (CEST)
Received: from localhost ([::1]:33472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltyq6-0003x2-E0
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 16:42:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47384)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ltyom-0003Ee-Ve
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 16:40:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1ltyok-0000tk-FT
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 16:40:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623962449;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=py/TuJIvkr+EPQHm6jdymvcqD6p1C/EizhmVNLC/BZo=;
 b=gxrz3HQamPUWqpKwkmKQi+/nGUHavdPgXufGXiPnkjcVN3tAO7JeFAypVjVDlSml6C2SaF
 KYxyko53hH4I7eZu3NQcV7Mb1VCA0ezC04mtr4VCoccATCGe0MSuyL6O1VpvB6jbEG6SG5
 uOJcMVKrjFB0Qx1AJe0+hYFjJ30C92A=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-381-WMv1Dtq9MYCrhglqBL06Aw-1; Thu, 17 Jun 2021 16:40:48 -0400
X-MC-Unique: WMv1Dtq9MYCrhglqBL06Aw-1
Received: by mail-wm1-f72.google.com with SMTP id
 h9-20020a05600c3509b02901b985251fdcso2674078wmq.9
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 13:40:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=py/TuJIvkr+EPQHm6jdymvcqD6p1C/EizhmVNLC/BZo=;
 b=fjix8z6kRUoClK9SWB918BSlErTg8jLl6DErj2Er+4cbaaOhoJi6CUaWEDj+DeiR0X
 bMuCxqedtFbm2JWB1DEmxTLAB9/gvGl4LgELHKh0V4KCBjxIXGyk3qz/QKNJdcKBF4b2
 65CKjGIVuFEWPN0NFayYA/xUrAWFUkWYnsLqt2EOMmYr78qLnPiWytKUMwLXKXKW1pVE
 OHGM2PhOE5vJxoSW59dxVKiuRXlz3etR9AHon6FaH9G8O0uPlRryW0SQf/q/bGYsdQjt
 1Ha4RzrmQO1Dv8mbJdXBrOV/cgurWhhyp8TcE0xwjMDe/a8Yoh12zuLyFa/ss0LRCXuT
 BARw==
X-Gm-Message-State: AOAM530KCEc3IsbMqEfQhBEHKp3qrZwoKfhmz57w4P8zEq8IkXiyYUR0
 XOawTxoQ1JlBIM2TQgryw8w8jf4qJd0Ftluqc55SC1BmHiTlzgEhJfY0sEZ0R1+mFN+zC5fqK7u
 BI+tO287j9aZ3xwo=
X-Received: by 2002:adf:fac6:: with SMTP id a6mr8245988wrs.251.1623962446403; 
 Thu, 17 Jun 2021 13:40:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxPSCZMj8YBYPWFvzmg1gjWHokGDBu9hZSO8Zoh7zO5Qa6A+Di7koLoNau5L9ybmYpDDLSQIw==
X-Received: by 2002:adf:fac6:: with SMTP id a6mr8245974wrs.251.1623962446214; 
 Thu, 17 Jun 2021 13:40:46 -0700 (PDT)
Received: from redhat.com ([77.126.22.11])
 by smtp.gmail.com with ESMTPSA id y7sm2315427wma.22.2021.06.17.13.40.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 13:40:44 -0700 (PDT)
Date: Thu, 17 Jun 2021 16:40:40 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 20/23] hw/acpi: Do not restrict ACPI core routines to
 x86 architecture
Message-ID: <20210617164026-mutt-send-email-mst@kernel.org>
References: <20210616204328.2611406-1-philmd@redhat.com>
 <20210616204328.2611406-21-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210616204328.2611406-21-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laszlo Ersek <lersek@redhat.com>, Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Connor Kuehl <ckuehl@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 16, 2021 at 10:43:25PM +0200, Philippe Mathieu-Daudé wrote:
> ACPI core routines (in core.c) are not really x86-specific.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  hw/acpi/meson.build | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/acpi/meson.build b/hw/acpi/meson.build
> index dd69577212a..c23c67f4283 100644
> --- a/hw/acpi/meson.build
> +++ b/hw/acpi/meson.build
> @@ -3,6 +3,7 @@
>    'acpi_interface.c',
>    'aml-build.c',
>    'bios-linker-loader.c',
> +  'core.c',
>    'utils.c',
>  ))
>  acpi_ss.add(when: 'CONFIG_ACPI_CPU_HOTPLUG', if_true: files('cpu.c'))
> @@ -14,7 +15,7 @@
>  acpi_ss.add(when: 'CONFIG_ACPI_HW_REDUCED', if_true: files('generic_event_device.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_HMAT', if_true: files('hmat.c'))
>  acpi_ss.add(when: 'CONFIG_ACPI_APEI', if_true: files('ghes.c'))
> -acpi_ss.add(when: 'CONFIG_ACPI_X86', if_true: files('core.c', 'piix4.c', 'pcihp.c'), if_false: files('acpi-stub.c'))
> +acpi_ss.add(when: 'CONFIG_ACPI_X86', if_true: files('piix4.c', 'pcihp.c'))


So is acpi-stub.c still useful then?

>  acpi_ss.add(when: 'CONFIG_ACPI_X86_ICH', if_true: files('ich9.c', 'tco.c'))
>  acpi_ss.add(when: 'CONFIG_IPMI', if_true: files('ipmi.c'), if_false: files('ipmi-stub.c'))
>  acpi_ss.add(when: 'CONFIG_PC', if_false: files('acpi-x86-stub.c'))
> -- 
> 2.31.1


