Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0073BA785
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 08:20:48 +0200 (CEST)
Received: from localhost ([::1]:48822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzZ1C-0002CO-Vc
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 02:20:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46844)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lzZ04-0001Vo-9n
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 02:19:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lzZ00-0008KK-Ms
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 02:19:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625293170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=puuMC/Mskze0JcSwEa7ZgAX3kq/POgOXHopARfRMfU8=;
 b=R0N879WXQeRIwx0+XfubU1/TjUmjtjrLnlJsP/NdC+ORvZqZ4O0WuHQTBtVGidb5dtULoe
 RVb/8BGUf2NwCxgNtdbdGbL1WjSM+Bn20ewsV/aPlm0DlPsyjVhkX3sa2cXMS1qfMBCpKY
 wOcz/PwD3nlOr69GNUS6Jua2LiZgAfo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-317-1DUwbxG5O8adc9FpiyZ4cQ-1; Sat, 03 Jul 2021 02:19:28 -0400
X-MC-Unique: 1DUwbxG5O8adc9FpiyZ4cQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 j38-20020a05600c1c26b02901dbf7d18ff8so7350881wms.8
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 23:19:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=puuMC/Mskze0JcSwEa7ZgAX3kq/POgOXHopARfRMfU8=;
 b=TS/+ZhhSX3Q4s5N1L/Uuz9oO5uHzSb6NdYz869l6JGFW6A2IFVcrGellE9f8pzUSrD
 DQly3wuO0GvKmqg6NgQwJH3YFuuNJPUDjzlQjzZUjnIUYa7xzvccP6lJVqgbI8A26346
 7X+VCtNyiozZ98ukTf7WUg1rHdV+8ZtbqjxiwkAiQ0vpW5poAGcsD9B1XARl3sIU5sDi
 go6xZs7sax1kSTLaGgPwub5y/+/vlb9My4gP5Ck2OxHaJT1TPDKuXs7tpCl4hy2XNcU/
 wfD5WGB96NLXnvlIkgtUvSOZsOlwbOP7eUx7HLz0TxGFhSf/LtGVzfcQitMz1LM4yQGx
 bYUw==
X-Gm-Message-State: AOAM531zMWZQYMM9bXUfm0RQB+rtNAmDVTsyjQi+YHC9mZwC/FmMMkOc
 6fXlNjQN3tIZfrV8zvILb1+e8pzy4C46parjgP8alwS4eoeem2SFLw+2tjeiOcnhweOZnkFiYd2
 w3tpPDcFm2pF+gEQ=
X-Received: by 2002:a05:600c:4b99:: with SMTP id
 e25mr3436350wmp.176.1625293167805; 
 Fri, 02 Jul 2021 23:19:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIQVAzt28+l0L2aEYVyMd/7GKEt3ZwzMbQ6DQfA0vaKLOMLfjJxVrcaY7zz8jfAXKPdxMKHQ==
X-Received: by 2002:a05:600c:4b99:: with SMTP id
 e25mr3436329wmp.176.1625293167599; 
 Fri, 02 Jul 2021 23:19:27 -0700 (PDT)
Received: from redhat.com ([2.55.4.39])
 by smtp.gmail.com with ESMTPSA id x21sm10506400wmj.6.2021.07.02.23.19.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 23:19:27 -0700 (PDT)
Date: Sat, 3 Jul 2021 02:19:23 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Julia Suvorova <jusual@redhat.com>
Subject: Re: [PATCH v5 1/7] hw/acpi/pcihp: Enhance
 acpi_pcihp_disable_root_bus() to support Q35
Message-ID: <20210703021734-mutt-send-email-mst@kernel.org>
References: <20210617190739.3673064-1-jusual@redhat.com>
 <20210617190739.3673064-2-jusual@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210617190739.3673064-2-jusual@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.377,
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 17, 2021 at 09:07:33PM +0200, Julia Suvorova wrote:
> PCI Express does not allow hot-plug on pcie.0. Check for Q35 in
> acpi_pcihp_disable_root_bus() to be able to forbid hot-plug using the
> 'acpi-root-pci-hotplug' flag.
> 
> Signed-off-by: Julia Suvorova <jusual@redhat.com>
> Reviewed-by: Igor Mammedov <imammedo@redhat.com>
> ---
>  hw/acpi/pcihp.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
> index 4999277d57..09f531e941 100644
> --- a/hw/acpi/pcihp.c
> +++ b/hw/acpi/pcihp.c
> @@ -122,13 +122,14 @@ static void acpi_set_pci_info(void)
>  static void acpi_pcihp_disable_root_bus(void)
>  {
>      static bool root_hp_disabled;
> +    Object *host = acpi_get_i386_pci_host();
>      PCIBus *bus;

This breaks build for mips malta which needs piix4.c and thus
uses pcihp.c

Just try a full build you will see the failure.

I suggest changing the API to return the actual bus.

>  
>      if (root_hp_disabled) {
>          return;
>      }
>  
> -    bus = find_i440fx();
> +    bus = PCI_HOST_BRIDGE(host)->bus;
>      if (bus) {
>          /* setting the hotplug handler to NULL makes the bus non-hotpluggable */
>          qbus_set_hotplug_handler(BUS(bus), NULL);
> -- 
> 2.30.2


