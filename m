Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 312D652BB9E
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 15:55:10 +0200 (CEST)
Received: from localhost ([::1]:56394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrK8r-0003hf-1b
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 09:55:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nrK0L-0008LJ-RU
 for qemu-devel@nongnu.org; Wed, 18 May 2022 09:46:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51293)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nrK0K-0005qv-Cf
 for qemu-devel@nongnu.org; Wed, 18 May 2022 09:46:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652881579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ci8qeBnfC0llbsW5XAFFwWe7HOQqdfxxz8bikl16bhw=;
 b=eq+o45qXTuu3+Hhpy/QBq+qKeqNfRn7wDyAOBzTvlXidcGPsDnMoUaK5rB0+L5NgG86VHw
 2DFDH4SxPexHol84dMixc6oKiWgLYfaqB8BvWTV3cTKWKs+sv1P3zol0w6jBVrmdxCLdcF
 2UEraNWUeI8qlT8xwTgt0yHddvCCWtM=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-300-roXNDIqqNL6cwIrffX-wOQ-1; Wed, 18 May 2022 09:46:16 -0400
X-MC-Unique: roXNDIqqNL6cwIrffX-wOQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 03D4A3810D22;
 Wed, 18 May 2022 13:46:16 +0000 (UTC)
Received: from localhost (unknown [10.39.192.212])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90E4540CF8EE;
 Wed, 18 May 2022 13:46:15 +0000 (UTC)
Date: Wed, 18 May 2022 14:46:14 +0100
From: Stefan Hajnoczi <stefanha@redhat.com>
To: Xie Yongji <xieyongji@bytedance.com>
Cc: mst@redhat.com, jasowang@redhat.com, sgarzare@redhat.com,
 kwolf@redhat.com, mreitz@redhat.com, mlureau@redhat.com,
 jsnow@redhat.com, eblake@redhat.com, Coiby.Xu@gmail.com,
 hreitz@redhat.com, qemu-block@nongnu.org, qemu-devel@nongnu.org
Subject: Re: [PATCH v5 5/8] libvduse: Add VDUSE (vDPA Device in Userspace)
 library
Message-ID: <YoT4piGYvCmV1GK2@stefanha-x1.localdomain>
References: <20220504074051.90-1-xieyongji@bytedance.com>
 <20220504074051.90-6-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="5tbVh7hcv5+EIhgn"
Content-Disposition: inline
In-Reply-To: <20220504074051.90-6-xieyongji@bytedance.com>
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.1
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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


--5tbVh7hcv5+EIhgn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 04, 2022 at 03:40:48PM +0800, Xie Yongji wrote:
> +static int vduse_queue_update_vring(VduseVirtq *vq, uint64_t desc_addr,
> +                                    uint64_t avail_addr, uint64_t used_addr)
> +{
> +    struct VduseDev *dev = vq->dev;
> +    uint64_t len;
> +
> +    len = sizeof(struct vring_desc);
> +    vq->vring.desc = iova_to_va(dev, &len, desc_addr);
> +    assert(len == sizeof(struct vring_desc));
> +
> +    len = sizeof(struct vring_avail);
> +    vq->vring.avail = iova_to_va(dev, &len, avail_addr);
> +    assert(len == sizeof(struct vring_avail));
> +
> +    len = sizeof(struct vring_used);
> +    vq->vring.used = iova_to_va(dev, &len, used_addr);
> +    assert(len == sizeof(struct vring_used));

Can these assertions be triggered by a malicious virtio driver? For
example, if a guest is accessing this device, will the vDPA/VDUSE kernel
code forward the address to QEMU without validation?

If yes, then it's necessary to return an error here instead of aborting.
A qemu-storage-daemon process might contain multiple VDUSE exports and
an error in one export shouldn't kill the entire process.

I haven't audited the code, but this is a general issue: if vDPA/VDUSE
kernel code forwards untrusted inputs to us then we cannot abort or
crash. Usually the kernel is trusted by userspace but maybe not in this
case since it may just forward inputs from a malicious VIRTIO driver?

--5tbVh7hcv5+EIhgn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEhpWov9P5fNqsNXdanKSrs4Grc8gFAmKE+KYACgkQnKSrs4Gr
c8iPNAf/RChaWisN0wezUT6wxonlH1VZ9wt5rS1GmEJoJDDyP+ujNC6L/4c0cmpo
InVYpv/YRhIQJSecvKIFpAzufseW26GcEZq9j3oH+NhQNS8SZe1uW6GK/ZbMKwsZ
rnVAQyvdh7RIWmPh98KyNzjhxoOymPTjubaSyONO3uzeH9jm//+XK3R4TuKjuBQ9
12uBCQWjRr7a8v7rDuGFA5pcMF8bpFFCwkwRR6MNDZJpaFLe8Ut/zoy9FDD1HXTu
TJ6iA2b37+SLNhzZzB30eIqhtrTqPUMVn05IuLEhOPvAc/lfDzdd+RbMCNZ3ldOf
TXo54z9G+D8ODUoNdB/IF4HRR5xhng==
=ZQww
-----END PGP SIGNATURE-----

--5tbVh7hcv5+EIhgn--


