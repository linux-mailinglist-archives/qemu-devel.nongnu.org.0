Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C47E589440
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Aug 2022 00:02:23 +0200 (CEST)
Received: from localhost ([::1]:48856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oJMRZ-0001Ek-Lz
	for lists+qemu-devel@lfdr.de; Wed, 03 Aug 2022 18:02:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oJMPc-0007FB-Li
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 18:00:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1oJMPZ-0005jI-7i
 for qemu-devel@nongnu.org; Wed, 03 Aug 2022 18:00:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659564015;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=XIHrvPxSyOXCWjMsle/lK0GPyj7l2k3hJwj0lzY+z0A=;
 b=g+iUrxDV9MIZub0ofrhkVa6sD3bIQZdNCtgytHej0uwxk9vu1At4dPTsW0L/kZE4v9ALYh
 qBrmg/lBF7WBNqJWuAi/j/+ujfaLlDFfm6/w9pX+2U17IHTTYzstZtT++3ld4d2fj44n8P
 dEfMuV51EO5zh8NrUaFnuXUELiqTyac=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-216-t_osXawjO-SblQdlgQh7fQ-1; Wed, 03 Aug 2022 18:00:11 -0400
X-MC-Unique: t_osXawjO-SblQdlgQh7fQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 v64-20020a1cac43000000b003a4bea31b4dso1629574wme.3
 for <qemu-devel@nongnu.org>; Wed, 03 Aug 2022 15:00:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
 bh=XIHrvPxSyOXCWjMsle/lK0GPyj7l2k3hJwj0lzY+z0A=;
 b=UzbyMPAAF1olRBrwyjglwpQgyAlc/t/DxIB9E8Jh+/HkfHGOq/hi+2g9hWhn76U1+d
 1WmglpAOKbCg/Bic9T7eBIBKongjxir1L4UDhvFNYOiZW6ogQsUcljUJpR0RFsumsU1S
 uAhhQ/Y8w7yrJP41WIUkPjJrgXmLVpY7VYj6QWDp4sRQe2RN33BhxgoXA97g6icQ6X4K
 4qooD5Uhk396B3UX6Lo8/8gaZG1D9XT6NaKkM2X6qLEM7fG5koCLTmVGUHLynLNCASSj
 G8sbRJOngYZ6sTc7jS/eQTF+fWzJzRgdVzt52lvN8G1Az7z9qi7k1Pp49tHrWiHP/E3p
 Gt+A==
X-Gm-Message-State: ACgBeo0JhQWhJ3hPIdDJDn3QfsiXIzobazBhlU020Z2IKWZwi4xvNjic
 HG4BwxceCu18ZMIliZbDko9n2C7w+4STpyv/WLlqjvrN/oUCiEVzoGgyczPDiRVIejV+TLTGovq
 bJryuc/Vf5Aj8vK8=
X-Received: by 2002:a1c:f718:0:b0:3a3:2416:634d with SMTP id
 v24-20020a1cf718000000b003a32416634dmr4236531wmh.83.1659564010562; 
 Wed, 03 Aug 2022 15:00:10 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7S3zFNQf78ss0rtX98rKRN4G5tIExmAut6fUWBRnqLsLnyhBU4ln+RJq64AGhUQ0E+IpQfSw==
X-Received: by 2002:a1c:f718:0:b0:3a3:2416:634d with SMTP id
 v24-20020a1cf718000000b003a32416634dmr4236511wmh.83.1659564010276; 
 Wed, 03 Aug 2022 15:00:10 -0700 (PDT)
Received: from redhat.com ([2.54.191.86]) by smtp.gmail.com with ESMTPSA id
 y4-20020a5d6144000000b002205c907474sm12982766wrt.107.2022.08.03.15.00.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Aug 2022 15:00:09 -0700 (PDT)
Date: Wed, 3 Aug 2022 18:00:05 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Igor Mammedov <imammedo@redhat.com>
Cc: qemu-devel@nongnu.org, f4bug@amsat.org, aurelien@aurel32.net,
 jiaxun.yang@flygoat.com, peter.maydell@linaro.org, ani@anisinha.ca,
 dgilbert@redhat.com
Subject: Re: [PATCH for-7.1] hw/mips/malta: turn off x86 specific features of
 PIIX4_PM
Message-ID: <20220803175930-mutt-send-email-mst@kernel.org>
References: <20220728115034.1327988-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220728115034.1327988-1-imammedo@redhat.com>
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Thu, Jul 28, 2022 at 07:50:34AM -0400, Igor Mammedov wrote:
> QEMU crashes trying to save VMSTATE when only MIPS target are compiled in
>   $ qemu-system-mips -monitor stdio
>   (qemu) migrate "exec:gzip -c > STATEFILE.gz"
>   Segmentation fault (core dumped)
> 
> It happens due to PIIX4_PM trying to parse hotplug vmstate structures
> which are valid only for x86 and not for MIPS (as it requires ACPI
> tables support which is not existent for ithe later)
> 
> Issue was probably exposed by trying to cleanup/compile out unused
> ACPI bits from MIPS target (but forgetting about migration bits).
> 
> Disable compiled out features using compat properties as the least
> risky way to deal with issue.
> 
> Signed-off-by: Igor Mammedov <imammedo@redhat.com>


For 7.1 this seems like the lesser evil.

Acked-by: Michael S. Tsirkin <mst@redhat.com>

> ---
> PS:
> another approach could be setting defaults to disabled state and
> enabling them using compat props on PC machines (which is more
> code to deal with => more risky) or continue with PIIX4_PM
> refactoring to split x86-shism out (which I'm not really
> interested in due to risk of regressions for not much of
> benefit)
> ---
>  hw/mips/malta.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/hw/mips/malta.c b/hw/mips/malta.c
> index 7a0ec513b0..0e932988e0 100644
> --- a/hw/mips/malta.c
> +++ b/hw/mips/malta.c
> @@ -1442,6 +1442,14 @@ static const TypeInfo mips_malta_device = {
>      .instance_init = mips_malta_instance_init,
>  };
>  
> +GlobalProperty malta_compat[] = {
> +    { "PIIX4_PM", "memory-hotplug-support", "off" },
> +    { "PIIX4_PM", "acpi-pci-hotplug-with-bridge-support", "off" },
> +    { "PIIX4_PM", "acpi-root-pci-hotplug", "off" },
> +    { "PIIX4_PM", "x-not-migrate-acpi-index", "true" },
> +};
> +const size_t malta_compat_len = G_N_ELEMENTS(malta_compat);
> +
>  static void mips_malta_machine_init(MachineClass *mc)
>  {
>      mc->desc = "MIPS Malta Core LV";
> @@ -1455,6 +1463,7 @@ static void mips_malta_machine_init(MachineClass *mc)
>      mc->default_cpu_type = MIPS_CPU_TYPE_NAME("24Kf");
>  #endif
>      mc->default_ram_id = "mips_malta.ram";
> +    compat_props_add(mc->compat_props, malta_compat, malta_compat_len);
>  }
>  
>  DEFINE_MACHINE("malta", mips_malta_machine_init)
> -- 
> 2.31.1


