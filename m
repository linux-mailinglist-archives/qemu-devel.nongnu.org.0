Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 762694232C5
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 23:22:45 +0200 (CEST)
Received: from localhost ([::1]:39302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXrtb-0007xy-LP
	for lists+qemu-devel@lfdr.de; Tue, 05 Oct 2021 17:22:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mXrqw-0005vq-Pr
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 17:19:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47922)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1mXrqt-0005gL-1R
 for qemu-devel@nongnu.org; Tue, 05 Oct 2021 17:19:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633468793;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5f023AmZjf9/sq+1NQVmQqHfZ8jts2AIjFGOecFbn0k=;
 b=Lhgt5YMDtOD2/FVNRV6WK/RkpVVN1+b5mxIvmHMBlJLvRgeewyHSMcESowhlFHZ5Ms6xjI
 VWILOhbAXhHTS+anZ3J/o6iT8RGB6m3np9NWW2XnJuePT2Z5CofkvrAWAHLNRuaTKOpBon
 fqj5SpxsiuJQiwZSVYYmVm1BvciLnIQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-84-7ixmsceKNr-PKAcXU6crWA-1; Tue, 05 Oct 2021 17:19:48 -0400
X-MC-Unique: 7ixmsceKNr-PKAcXU6crWA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CF6FA83DBC1;
 Tue,  5 Oct 2021 21:19:46 +0000 (UTC)
Received: from redhat.com (ovpn-113-79.phx2.redhat.com [10.3.113.79])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EAF5660853;
 Tue,  5 Oct 2021 21:18:18 +0000 (UTC)
Date: Tue, 5 Oct 2021 16:18:17 -0500
From: Eric Blake <eblake@redhat.com>
To: Jonah Palmer <jonah.palmer@oracle.com>
Subject: Re: [PATCH v7 1/8] virtio: drop name parameter for virtio_init()
Message-ID: <20211005211424.kxa65zl4r6qoekqd@redhat.com>
References: <1633452353-7169-1-git-send-email-jonah.palmer@oracle.com>
 <1633452353-7169-2-git-send-email-jonah.palmer@oracle.com>
MIME-Version: 1.0
In-Reply-To: <1633452353-7169-2-git-send-email-jonah.palmer@oracle.com>
User-Agent: NeoMutt/20210205-814-5cca94
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: fam@euphon.net, mst@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com,
 si-wei.liu@oracle.com, joao.m.martins@oracle.com, qemu-block@nongnu.org,
 david@redhat.com, armbru@redhat.com, marcandre.lureau@redhat.com,
 thuth@redhat.com, amit@kernel.org, michael.roth@amd.com, dgilbert@redhat.com,
 eric.auger@redhat.com, dmitrii.stepanov@cloud.ionos.com, stefanha@redhat.com,
 boris.ostrovsky@oracle.com, kwolf@redhat.com, laurent@vivier.eu,
 mreitz@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 05, 2021 at 12:45:46PM -0400, Jonah Palmer wrote:
> This patch drops the name parameter for the virtio_init function.
> 
> The pair between the numeric device ID and the string device ID
> (name) of a virtio device already exists, but not in a way that
> let's us map between them.

s/let's/lets/

> 
> This patch will let us do this and removes the need for the name
> parameter in virtio_init().
> 
> Signed-off-by: Jonah Palmer <jonah.palmer@oracle.com>
> ---

> +++ b/hw/virtio/virtio.c
> @@ -133,6 +133,43 @@ struct VirtQueue
>      QLIST_ENTRY(VirtQueue) node;
>  };
>  
> +const char *virtio_device_names[] = {
> +    [VIRTIO_ID_NET] = "virtio-net",
> +    [VIRTIO_ID_BLOCK] = "virtio-blk",
> +    [VIRTIO_ID_CONSOLE] = "virtio-serial",
> +    [VIRTIO_ID_RNG] = "virtio-rng",
> +    [VIRTIO_ID_BALLOON] = "virtio-balloon",
> +    [VIRTIO_ID_IOMEM] = "virtio-iomem",
> +    [VIRTIO_ID_RPMSG] = "virtio-rpmsg",
> +    [VIRTIO_ID_SCSI] = "virtio-scsi",
> +    [VIRTIO_ID_9P] = "virtio-9p",
> +    [VIRTIO_ID_MAC80211_WLAN] = "virtio-mac-wlan",
> +    [VIRTIO_ID_RPROC_SERIAL] = "virtio-rproc-serial",
> +    [VIRTIO_ID_CAIF] = "virtio-caif",
> +    [VIRTIO_ID_MEMORY_BALLOON] = "virtio-mem-balloon",
> +    [VIRTIO_ID_GPU] = "virtio-gpu",
> +    [VIRTIO_ID_CLOCK] = "virtio-clk",
> +    [VIRTIO_ID_INPUT] = "virtio-input",
> +    [VIRTIO_ID_VSOCK] = "vhost-vsock",
> +    [VIRTIO_ID_CRYPTO] = "virtio-crypto",
> +    [VIRTIO_ID_SIGNAL_DIST] = "virtio-signal",
> +    [VIRTIO_ID_PSTORE] = "virtio-pstore",
> +    [VIRTIO_ID_IOMMU] = "virtio-iommu",
> +    [VIRTIO_ID_MEM] = "virtio-mem",
> +    [VIRTIO_ID_SOUND] = "virtio-sound",
> +    [VIRTIO_ID_FS] = "vhost-user-fs",
> +    [VIRTIO_ID_PMEM] = "virtio-pmem",
> +    [VIRTIO_ID_MAC80211_HWSIM] = "virtio-mac-hwsim",
> +    [VIRTIO_ID_I2C_ADAPTER] = "vhost-user-i2c",
> +    [VIRTIO_ID_BT] = "virtio-bluetooth"
> +};

Are these IDs consecutive, or can the array have gaps?

> +
> +static const char *virtio_id_to_name(uint16_t device_id)
> +{
> +    assert(device_id < G_N_ELEMENTS(virtio_device_names));
> +    return virtio_device_names[device_id];

If the latter, you may also want to assert that you aren't returning NULL.

> +++ b/include/standard-headers/linux/virtio_ids.h
> @@ -55,6 +55,7 @@
>  #define VIRTIO_ID_FS			26 /* virtio filesystem */
>  #define VIRTIO_ID_PMEM			27 /* virtio pmem */
>  #define VIRTIO_ID_MAC80211_HWSIM	29 /* virtio mac80211-hwsim */
> +#define VIRTIO_ID_I2C_ADAPTER           34 /* virtio I2C adapater */
>  #define VIRTIO_ID_BT			40 /* virtio bluetooth */

And it looks like the array has gaps.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


