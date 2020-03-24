Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 692451912A7
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Mar 2020 15:18:25 +0100 (CET)
Received: from localhost ([::1]:49640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jGkNs-0006Vd-7d
	for lists+qemu-devel@lfdr.de; Tue, 24 Mar 2020 10:18:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56550)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1jGkMk-00066Q-Mx
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 10:17:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1jGkMi-0005iY-SF
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 10:17:14 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:51806)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1jGkMi-0005gY-OL
 for qemu-devel@nongnu.org; Tue, 24 Mar 2020 10:17:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585059431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5+ir3/YXWwtGMW/jqL7GJv1mlO7peyDXMLoUy0hzKXc=;
 b=DH0eEE/MlFarbLheo+eaGHv5/NI2mUS4JiKY3snzoItYDjdxMFzQv19b+/jn8P6tAvOwYu
 n1JcDyT0o/+HibWYF3WLCYUTpNfR1RCueI+LQ02hYoRUhZHgKgqpekIoiGrePWyc/EnMiw
 LATbY2ywtV4SIgRLQ60TWbSMPyZv6EM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-212-WFlHEucNOD-nLOtdGdxnuA-1; Tue, 24 Mar 2020 10:17:10 -0400
X-MC-Unique: WFlHEucNOD-nLOtdGdxnuA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 286F096F60;
 Tue, 24 Mar 2020 14:17:09 +0000 (UTC)
Received: from localhost (unknown [10.40.208.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 67718A7D6;
 Tue, 24 Mar 2020 14:17:04 +0000 (UTC)
Date: Tue, 24 Mar 2020 15:17:02 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Ani Sinha <ani.sinha@nutanix.com>
Subject: Re: Hot unplug disabling on pci-pci bridge
Message-ID: <20200324151702.4c2eb79e@redhat.com>
In-Reply-To: <90435944-E1E5-49AB-A039-ADBEC58EFB0B@nutanix.com>
References: <BF9E6F48-E047-4D1B-BEF1-A58024DE0C6E@nutanix.com>
 <20200324121703.472b034b@redhat.com>
 <90435944-E1E5-49AB-A039-ADBEC58EFB0B@nutanix.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Laine Stump <laine@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 24 Mar 2020 13:29:10 +0000
Ani Sinha <ani.sinha@nutanix.com> wrote:

> On Mar 24, 2020, at 4:47 PM, Igor Mammedov <imammedo@redhat.com<mailto:imammedo@redhat.com>> wrote:
> 
> you probably have APCI hotplug for bridges enabled (which applies to
> all  cold-plugged bridges).
> You can disable it by setting following property
> -global PIIX4_PM.acpi-pci-hotplug-with-bridge-support=off
> then it should fall back to SHPC which are are tying to disable
> 
> Ok I patched to change the default :
> 
> ---
> hw/acpi/piix4.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
> index d706360..db888cb 100644
> --- a/hw/acpi/piix4.c
> +++ b/hw/acpi/piix4.c
> @@ -675,7 +675,7 @@ static Property piix4_pm_properties[] = {
>     DEFINE_PROP_UINT8(ACPI_PM_PROP_S4_DISABLED, PIIX4PMState, disable_s4, 1),
>     DEFINE_PROP_UINT8(ACPI_PM_PROP_S4_VAL, PIIX4PMState, s4_val, 2),
>     DEFINE_PROP_BOOL("acpi-pci-hotplug-with-bridge-support", PIIX4PMState,
> -                     use_acpi_pci_hotplug, true),
> +                     use_acpi_pci_hotplug, false),
>     DEFINE_PROP_BOOL("memory-hotplug-support", PIIX4PMState,
>                      acpi_memory_hotplug.is_enabled, true),
>     DEFINE_PROP_END_OF_LIST(),
> --
> 1.9.4
> 
> This seems to work but now Windows is giving an option to eject pci bridges. Clicking it does not do anything. I wonder if we can disable that as well. AFAIK hot unplugging bridges would not take effect until ACPI tables are updated and the OS kernel re-reads the updated tables. See https://bugzilla.redhat.com/show_bug.cgi?id=1339875

if you are interested in hacking ACPI PCI hotplug more, look at how build_append_pci_bus_devices() works

> 
> Ani
> [cid:809BEDB4-EEF6-4197-A083-4AF2E9999CEB]


