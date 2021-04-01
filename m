Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 93701351107
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Apr 2021 10:42:43 +0200 (CEST)
Received: from localhost ([::1]:37788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRsuY-0006aP-Mx
	for lists+qemu-devel@lfdr.de; Thu, 01 Apr 2021 04:42:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41616)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lRstj-00069r-VF
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:41:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43263)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lRstg-0007gZ-5m
 for qemu-devel@nongnu.org; Thu, 01 Apr 2021 04:41:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617266507;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=hW0bLOQ8feL6J+TSFQjSXJXpjtqVU/nA4oRqzWmvWjM=;
 b=GEM3qwqvIqMijgiylcYN2lcc1sKGSKSZgmAP3V7NQZDcgNkouHZWi/TRfBD5/+hDY2cE1J
 CfVZb/aFP/coWAMTO/ZpQZfUtLs/W7lhsen19724nwlZR5CGrT52hYfrYb2jIlznBUTyfl
 f0qZ6beJcwDTawZUovo8Wi9ssmN7Kv4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-y8w8kWjYN4WIva0Yf8YhKg-1; Thu, 01 Apr 2021 04:41:42 -0400
X-MC-Unique: y8w8kWjYN4WIva0Yf8YhKg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B98F1881278;
 Thu,  1 Apr 2021 08:41:41 +0000 (UTC)
Received: from redhat.com (ovpn-114-106.ams2.redhat.com [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1D7DD19C44;
 Thu,  1 Apr 2021 08:41:36 +0000 (UTC)
Date: Thu, 1 Apr 2021 09:41:33 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Vincent Bernat <vincent@bernat.ch>
Subject: Re: [PATCH v2 1/2] hw/smbios: support for type 41 (onboard devices
 extended information)
Message-ID: <YGWHPWSrOLxEQtMA@redhat.com>
References: <20210401082544.16522-1-vincent@bernat.ch>
MIME-Version: 1.0
In-Reply-To: <20210401082544.16522-1-vincent@bernat.ch>
User-Agent: Mutt/2.0.5 (2021-01-21)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=63.128.21.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 01, 2021 at 10:25:43AM +0200, Vincent Bernat wrote:
> Type 41 defines the attributes of devices that are onboard. The
> original intent was to imply the BIOS had some level of control over
> the enablement of the associated devices.
> 
> If network devices are present in this table, by default, udev will
> name the corresponding interfaces enoX, X being the instance number.
> Without such information, udev will fallback to using the PCI ID and
> this usually gives ens3 or ens4. This can be a bit annoying as the
> name of the network card may depend on the order of options and may
> change if a new PCI device is added earlier on the commande line.
> Being able to provide SMBIOS type 41 entry ensure the name of the
> interface won't change and helps the user guess the right name without
> booting a first time.
> 
> This can be invoked with:
> 
>     $QEMU -netdev user,id=internet
>           -device virtio-net-pci,mac=50:54:00:00:00:42,netdev=internet \
>           -smbios type=41,designation='Onboard LAN',instance=1,kind=ethernet,pci=0000:00:09.0
> 
> Which results in the guest seeing dmidecode data and the interface
> exposed as "eno1":
> 
>     $ dmidecode -t 41
>     # dmidecode 3.3
>     Getting SMBIOS data from sysfs.
>     SMBIOS 2.8 present.Handle 0x2900, DMI type 41, 11 bytes
>     Onboard Device
>             Reference Designation: Onboard LAN
>             Type: Ethernet
>             Status: Enabled
>             Type Instance: 1
>             Bus Address: 0000:00:09.0
>     $ udevadm info -p /sys/class/net/eno1 | grep ONBOARD
>     E: ID_NET_NAME_ONBOARD=eno1
>     E: ID_NET_LABEL_ONBOARD=Onboard LAN
> 
> Signed-off-by: Vincent Bernat <vincent@bernat.ch>
> ---
>  hw/smbios/smbios.c           | 119 +++++++++++++++++++++++++++++++++++
>  include/hw/firmware/smbios.h |  11 ++++
>  qemu-options.hx              |   7 ++-
>  3 files changed, 136 insertions(+), 1 deletion(-)
> 
> diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> index f22c4f5b734e..46a08652dff4 100644
> --- a/hw/smbios/smbios.c
> +++ b/hw/smbios/smbios.c


>  static void smbios_register_config(void)
>  {
>      qemu_add_opts(&qemu_smbios_opts);
> @@ -773,6 +826,26 @@ static void smbios_build_type_32_table(void)
>      SMBIOS_BUILD_TABLE_POST;
>  }
>  
> +static void smbios_build_type_41_table(void)
> +{
> +    unsigned instance = 0;
> +    struct type41_instance *t41;
> +
> +    QTAILQ_FOREACH(t41, &type41, next) {
> +        SMBIOS_BUILD_TABLE_PRE(41, 0x2900 + instance, true);
> +
> +        SMBIOS_TABLE_SET_STR(41, reference_designation_str, t41->designation);
> +        t->device_type = t41->kind;
> +        t->device_type_instance = t41->instance;
> +        t->segment_group_number = cpu_to_le16(t41->pci.segment);
> +        t->bus_number = t41->pci.bus;
> +        t->device_number = t41->pci.device;
> +
> +        SMBIOS_BUILD_TABLE_POST;
> +        instance++;
> +    }
> +}
> +
>  static void smbios_build_type_127_table(void)
>  {
>      SMBIOS_BUILD_TABLE_PRE(127, 0x7F00, true); /* required */
> @@ -928,6 +1001,7 @@ void smbios_get_tables(MachineState *ms,
>  
>          smbios_build_type_32_table();
>          smbios_build_type_38_table();
> +        smbios_build_type_41_table();
>          smbios_build_type_127_table();
>  
>          smbios_validate_table(ms);
> @@ -1224,6 +1298,51 @@ void smbios_entry_add(QemuOpts *opts, Error **errp)
>              save_opt(&type17.part, opts, "part");
>              type17.speed = qemu_opt_get_number(opts, "speed", 0);
>              return;
> +        case 41: {
> +            struct type41_instance *t;
> +            Error *local_err = NULL;
> +            int pseg, pbus, pdevice, pfunction;
> +
> +            if (!qemu_opts_validate(opts, qemu_smbios_type41_opts, errp)) {
> +                return;
> +            }
> +            t = calloc(1, sizeof(struct type41_instance));
> +            if (!t) {
> +                error_setg(errp,
> +                           "Unable to allocate memory for a new type 41 instance");
> +                return;
> +            }

QEMU uses GLib allocation functions throughout, which abort
on OOM. So replace this with g_new0.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


