Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 295E3368E3D
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Apr 2021 10:01:48 +0200 (CEST)
Received: from localhost ([::1]:59276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lZql1-00084x-8m
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 04:01:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lZqjR-0007Xg-Pp
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 04:00:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35980)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1lZqjP-0005yw-3y
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 04:00:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619164804;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p2swGo3/mD9rXnyugUamB/2Z5yI9gxRWgXfZ1F6fKCY=;
 b=WG/1NGa7P/oiyLa0LYEUAt+31yObX8cghQ5v4LoDcPNp4/DiCybXVGTxdtDZZ9ACw9pYeB
 e8PtpXzJsSg46TlsyPQJ651mtANYA0+Aub5yJGbHqz8r6SQbV9ue3VadU8bSRKBgKUGskY
 aaFfJC7nN9EtZzLvqhlmBNBkC2d/HzI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-gTotalTMMsO09-ugqBOQpA-1; Fri, 23 Apr 2021 04:00:02 -0400
X-MC-Unique: gTotalTMMsO09-ugqBOQpA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3FA7E1927802;
 Fri, 23 Apr 2021 08:00:01 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-225.pek2.redhat.com
 [10.72.13.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 75B961037E86;
 Fri, 23 Apr 2021 07:59:51 +0000 (UTC)
Subject: Re: [PATCH RFC 1/1] msix: add hmp interface to dump MSI-X info
To: Dongli Zhang <dongli.zhang@oracle.com>, qemu-devel@nongnu.org
References: <20210423044713.3403-1-dongli.zhang@oracle.com>
 <20210423044713.3403-2-dongli.zhang@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c4d7bc63-cb44-0795-a37c-dbe2cc9f6fb8@redhat.com>
Date: Fri, 23 Apr 2021 15:59:49 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210423044713.3403-2-dongli.zhang@oracle.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 MIME_CHARSET_FARAWAY=2.45, NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: berrange@redhat.com, ehabkost@redhat.com, mst@redhat.com,
 joe.jin@oracle.com, dgilbert@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


ÔÚ 2021/4/23 ÏÂÎç12:47, Dongli Zhang Ð´µÀ:
> This patch is to add the HMP interface to dump MSI-X table and PBA, in
> order to help diagnose the loss of IRQ issue in VM (e.g., if an MSI-X
> vector is erroneously masked permanently). Here is the example with
> vhost-scsi:
>
> (qemu) info msix /machine/peripheral/vscsi0
> MSI-X Table
> 0xfee01004 0x00000000 0x00000022 0x00000000
> 0xfee02004 0x00000000 0x00000023 0x00000000
> 0xfee01004 0x00000000 0x00000023 0x00000000
> 0xfee01004 0x00000000 0x00000021 0x00000000
> 0xfee02004 0x00000000 0x00000022 0x00000000
> 0x00000000 0x00000000 0x00000000 0x00000001
> 0x00000000 0x00000000 0x00000000 0x00000001
> MSI-X PBA
> 0 0 0 0 0 0 0
>
> Since the number of MSI-X entries is not determined and might be very
> large, it is sometimes inappropriate to dump via QMP.
>
> Therefore, this patch dumps MSI-X information only via HMP, which is
> similar to the implementation of hmp_info_mem().


Besides PBA, I think it should be also useful to introduce device 
specifc callbacks for dump the MSI messages used by the device.

Thanks


>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Joe Jin <joe.jin@oracle.com>
> Signed-off-by: Dongli Zhang <dongli.zhang@oracle.com>
> ---
>   hmp-commands-info.hx   | 13 +++++++++++
>   hw/pci/msix.c          | 49 ++++++++++++++++++++++++++++++++++++++++++
>   include/hw/pci/msix.h  |  2 ++
>   include/monitor/hmp.h  |  1 +
>   softmmu/qdev-monitor.c | 25 +++++++++++++++++++++
>   5 files changed, 90 insertions(+)
>
> diff --git a/hmp-commands-info.hx b/hmp-commands-info.hx
> index ab0c7aa5ee..cbd056442b 100644
> --- a/hmp-commands-info.hx
> +++ b/hmp-commands-info.hx
> @@ -221,6 +221,19 @@ SRST
>       Show PCI information.
>   ERST
>   
> +    {
> +        .name       = "msix",
> +        .args_type  = "dev:s",
> +        .params     = "dev",
> +        .help       = "dump MSI-X information",
> +        .cmd        = hmp_info_msix,
> +    },
> +
> +SRST
> +  ``info msix`` *dev*
> +    Dump MSI-X information for device *dev*.
> +ERST
> +
>   #if defined(TARGET_I386) || defined(TARGET_SH4) || defined(TARGET_SPARC) || \
>       defined(TARGET_PPC) || defined(TARGET_XTENSA) || defined(TARGET_M68K)
>       {
> diff --git a/hw/pci/msix.c b/hw/pci/msix.c
> index ae9331cd0b..a93d31da9f 100644
> --- a/hw/pci/msix.c
> +++ b/hw/pci/msix.c
> @@ -22,6 +22,7 @@
>   #include "sysemu/xen.h"
>   #include "migration/qemu-file-types.h"
>   #include "migration/vmstate.h"
> +#include "monitor/monitor.h"
>   #include "qemu/range.h"
>   #include "qapi/error.h"
>   #include "trace.h"
> @@ -669,3 +670,51 @@ const VMStateDescription vmstate_msix = {
>           VMSTATE_END_OF_LIST()
>       }
>   };
> +
> +static void msix_dump_table(Monitor *mon, PCIDevice *dev)
> +{
> +    int vector, i, offset;
> +    uint32_t val;
> +
> +    monitor_printf(mon, "MSI-X Table\n");
> +
> +    for (vector = 0; vector < dev->msix_entries_nr; vector++) {
> +        for (i = 0; i < 4; i++) {
> +            offset = vector * PCI_MSIX_ENTRY_SIZE + i * 4;
> +            val = pci_get_long(dev->msix_table + offset);
> +
> +            monitor_printf(mon, "0x%08x ", val);
> +        }
> +        monitor_printf(mon, "\n");
> +    }
> +}
> +
> +static void msix_dump_pba(Monitor *mon, PCIDevice *dev)
> +{
> +    int vector;
> +
> +    monitor_printf(mon, "MSI-X PBA\n");
> +
> +    for (vector = 0; vector < dev->msix_entries_nr; vector++) {
> +        monitor_printf(mon, "%d ", !!msix_is_pending(dev, vector));
> +
> +        if (vector % 16 == 15) {
> +            monitor_printf(mon, "\n");
> +        }
> +    }
> +
> +    if (vector % 16 != 15) {
> +        monitor_printf(mon, "\n");
> +    }
> +}
> +
> +void msix_dump_info(Monitor *mon, PCIDevice *dev, Error **errp)
> +{
> +    if (!msix_present(dev)) {
> +        error_setg(errp, "MSI-X not available");
> +        return;
> +    }
> +
> +    msix_dump_table(mon, dev);
> +    msix_dump_pba(mon, dev);
> +}
> diff --git a/include/hw/pci/msix.h b/include/hw/pci/msix.h
> index 4c4a60c739..10a4500295 100644
> --- a/include/hw/pci/msix.h
> +++ b/include/hw/pci/msix.h
> @@ -47,6 +47,8 @@ int msix_set_vector_notifiers(PCIDevice *dev,
>                                 MSIVectorPollNotifier poll_notifier);
>   void msix_unset_vector_notifiers(PCIDevice *dev);
>   
> +void msix_dump_info(Monitor *mon, PCIDevice *dev, Error **errp);
> +
>   extern const VMStateDescription vmstate_msix;
>   
>   #define VMSTATE_MSIX_TEST(_field, _state, _test) {                   \
> diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
> index 605d57287a..46e0efc213 100644
> --- a/include/monitor/hmp.h
> +++ b/include/monitor/hmp.h
> @@ -36,6 +36,7 @@ void hmp_info_irq(Monitor *mon, const QDict *qdict);
>   void hmp_info_pic(Monitor *mon, const QDict *qdict);
>   void hmp_info_rdma(Monitor *mon, const QDict *qdict);
>   void hmp_info_pci(Monitor *mon, const QDict *qdict);
> +void hmp_info_msix(Monitor *mon, const QDict *qdict);
>   void hmp_info_tpm(Monitor *mon, const QDict *qdict);
>   void hmp_info_iothreads(Monitor *mon, const QDict *qdict);
>   void hmp_quit(Monitor *mon, const QDict *qdict);
> diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
> index a9955b97a0..2a37d03fb7 100644
> --- a/softmmu/qdev-monitor.c
> +++ b/softmmu/qdev-monitor.c
> @@ -19,6 +19,7 @@
>   
>   #include "qemu/osdep.h"
>   #include "hw/sysbus.h"
> +#include "hw/pci/msix.h"
>   #include "monitor/hmp.h"
>   #include "monitor/monitor.h"
>   #include "monitor/qdev.h"
> @@ -1006,3 +1007,27 @@ bool qmp_command_available(const QmpCommand *cmd, Error **errp)
>       }
>       return true;
>   }
> +
> +void hmp_info_msix(Monitor *mon, const QDict *qdict)
> +{
> +    const char *name = qdict_get_str(qdict, "dev");
> +    DeviceState *dev = find_device_state(name, NULL);
> +    PCIDevice *pci_dev;
> +    Error *err = NULL;
> +
> +    if (!dev) {
> +        error_setg(&err, "Device %s not found", name);
> +        goto exit;
> +    }
> +
> +    if (!object_dynamic_cast(OBJECT(dev), TYPE_PCI_DEVICE)) {
> +        error_setg(&err, "Not a PCI device");
> +        goto exit;
> +    }
> +
> +    pci_dev = PCI_DEVICE(dev);
> +    msix_dump_info(mon, pci_dev, &err);
> +
> +exit:
> +    hmp_handle_error(mon, err);
> +}


