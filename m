Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E40750DE09
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 12:38:33 +0200 (CEST)
Received: from localhost ([::1]:45258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1niw6y-000070-Mg
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 06:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nivSN-0006K6-Ac
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 05:56:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nivSJ-0008Cb-4B
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 05:56:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650880589;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=VupFjuqf2gtN45dvir/a+HkC3lHyFglapXo9o9H5LCo=;
 b=AKpMT/YgXIxvzO8mUJ+V8bnPAX5CbDzTny3cCIRuMVP8U3YII08KuUlQri8oQJ1dON0xfA
 QeUdJbtX883cu6s0kc8R4HxU2twayf5A5pIwaYlw2VaovZMMRj7MAAsivCAQ1KWup4OosF
 fG6p9237XR2HVcRRw5VCja4v47E/O18=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-83-IwsZBm-FOLe_xchclAGVCg-1; Mon, 25 Apr 2022 05:56:25 -0400
X-MC-Unique: IwsZBm-FOLe_xchclAGVCg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E512F85A5BC;
 Mon, 25 Apr 2022 09:56:24 +0000 (UTC)
Received: from localhost (unknown [10.39.192.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 94102C52C93;
 Mon, 25 Apr 2022 09:56:24 +0000 (UTC)
Date: Mon, 25 Apr 2022 10:56:23 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Jagannathan Raman <jag.raman@oracle.com>
Subject: Re: [PATCH v8 13/17] vfio-user: handle DMA mappings
Message-ID: <YmZwRzW/FW97l/tp@stefanha-x1.localdomain>
References: <cover.1650379269.git.jag.raman@oracle.com>
 <e786c5991ac8b5830624305acaec31d8072716ee.1650379269.git.jag.raman@oracle.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="Oca/g57Ynx+EoNPe"
Content-Disposition: inline
In-Reply-To: <e786c5991ac8b5830624305acaec31d8072716ee.1650379269.git.jag.raman@oracle.com>
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: eduardo@habkost.net, elena.ufimtseva@oracle.com, thuth@redhat.com,
 john.g.johnson@oracle.com, berrange@redhat.com, bleal@redhat.com,
 john.levon@nutanix.com, mst@redhat.com, armbru@redhat.com, quintela@redhat.com,
 f4bug@amsat.org, qemu-devel@nongnu.org, thanos.makatos@nutanix.com,
 kanth.ghatraju@oracle.com, marcandre.lureau@redhat.com, pbonzini@redhat.com,
 eblake@redhat.com, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--Oca/g57Ynx+EoNPe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 19, 2022 at 04:44:18PM -0400, Jagannathan Raman wrote:
> +static void dma_unregister(vfu_ctx_t *vfu_ctx, vfu_dma_info_t *info)
> +{
> +    VfuObject *o = vfu_get_private(vfu_ctx);
> +    AddressSpace *dma_as = NULL;
> +    MemoryRegion *mr = NULL;
> +    ram_addr_t offset;
> +
> +    mr = memory_region_from_host(info->vaddr, &offset);
> +    if (!mr) {
> +        return;
> +    }
> +
> +    dma_as = pci_device_iommu_address_space(o->pci_dev);
> +
> +    memory_region_del_subregion(dma_as->root, mr);
> +
> +    object_unparent((OBJECT(mr)));

Where is obj->parent set?

If it is not set then this call is a nop and mr is not freed:

  void object_unparent(Object *obj)
  {
      if (obj->parent) {
          object_property_del_child(obj->parent, obj);
      }
  }

--Oca/g57Ynx+EoNPe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmJmcEcACgkQnKSrs4Gr
c8ha4AgArFdpl70Dw8zL0OjKbVCPkUH1qniauHUvEFrvHDtO3hlzWj2XWNKWXSsW
LV1STisFMyoH3NNEBvmJFcXFzDNykV5yN/sN65qlXqyKVz4x+kpX+GDLntHkAixh
zYWaP/9P3z6kQxU+VK72uB9K/QKe2pL1sW/Ytc3ryhVinC2Y+IA32HXmwcLoneOm
UbcGOIKAagUVhFAOEWhbUcV09xtausTePdgtWX3H6XdYkvmFNcq+RRkuOUj91h1C
+2kngFkPbWAyudufiu/PzOjyCY0LA1xAAyj74ylJRDqKj7NpRgTKhR8u7t/Qs8oH
pqofhwhLaQIDDDTsgPryeEZ0cSRvQQ==
=iAoh
-----END PGP SIGNATURE-----

--Oca/g57Ynx+EoNPe--


