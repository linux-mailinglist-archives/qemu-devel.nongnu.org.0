Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3661DB266
	for <lists+qemu-devel@lfdr.de>; Wed, 20 May 2020 13:55:45 +0200 (CEST)
Received: from localhost ([::1]:59744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jbNK4-0003WO-Gt
	for lists+qemu-devel@lfdr.de; Wed, 20 May 2020 07:55:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1jbNJB-000373-0t
 for qemu-devel@nongnu.org; Wed, 20 May 2020 07:54:49 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:54935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1jbNJ9-000082-6R
 for qemu-devel@nongnu.org; Wed, 20 May 2020 07:54:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=rnWX03BHLF392dwQU+ParX+v1Pe5URzj+DFBIS40txA=; b=rdIBDmxkoHNcoi2aXjef0PSBOP
 4AXVDTJsfhmvajjK4m1v3PQ/vxtVBTscCg/ySw1znG0n2x1/WsppqbQoO8ETnwQzZb8JX/8xnoF4X
 jGLzwLBmYk02yXI5d4oXubilmKsg2Er9mHS8rz3tw3aVk6xs+Dz89UxjRxte8FGOYfx24tLBUluqz
 obIVh1Tdjy5qKsTs/7Pi4UZSlTvT9CDvT8KHkJZ3jDB8uMmCVmFoXQGq3SFr0dNv5TCIbTLXOlusa
 i+7gs3cQXslyFuIgW4wuxf5S88iKqB2/LCqJuRQ9EW9BFkfzqzP/CVgh9fqc1eAgAiGvAdnS+3G+h
 1XCm3OWtJ/7AwlOQbR8mgEKuOMWE3uJ2psmhJwaAA90+diyCRvxdJcvebFi4ezwIK+OomRgEv+Abh
 VXGe80nBOgfwl9RHwINVFsII869JfRISqy3Ngi+FsvPUEewwLW0YYzJeoowAgCo06IGsPiGAr5vkv
 QbU9RJDm7wtBiuxqWcNNKdC8qz9Jr7tkWAxLzPqk/r1S9FiORhZ1T1PHB1ignilg4+J7JDUP99onH
 XZ7tZaU9jsizQ2p9ecKWpW86rQroyTJgGEsDN/6c3kvII7DdI9kZCAFJJnG5esAq3bpbfIIk0SM7+
 L7HCrJHDFMl+w3om2EUTDpzvEjqp9I58t2dLqwFcI=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>, groug@kaod.org,
 anthony.perard@citrix.com, Stefano Stabellini <stefano.stabellini@xilinx.com>,
 paul@xen.org
Subject: Re: [PATCH 1/2] Revert "9p: init_in_iov_from_pdu can truncate the
 size"
Date: Wed, 20 May 2020 13:54:13 +0200
Message-ID: <1727767.QC7mgPDRgF@silver>
In-Reply-To: <20200520014712.24213-1-sstabellini@kernel.org>
References: <alpine.DEB.2.21.2005191651130.27502@sstabellini-ThinkPad-T480s>
 <20200520014712.24213-1-sstabellini@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/20 07:23:30
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mittwoch, 20. Mai 2020 03:47:11 CEST Stefano Stabellini wrote:
> From: Stefano Stabellini <stefano.stabellini@xilinx.com>
> 
> This reverts commit 16724a173049ac29c7b5ade741da93a0f46edff7.
> It causes https://bugs.launchpad.net/bugs/1877688.
> 
> Signed-off-by: Stefano Stabellini <stefano.stabellini@xilinx.com>
> ---

Reviewed-by: Christian Schoenebeck <qemu_oss@crudebyte.com>

>  hw/9pfs/9p.c               | 33 +++++++++++----------------------
>  hw/9pfs/9p.h               |  2 +-
>  hw/9pfs/virtio-9p-device.c | 11 ++++-------
>  hw/9pfs/xen-9p-backend.c   | 15 ++++++---------
>  4 files changed, 22 insertions(+), 39 deletions(-)
> 
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index a2a14b5979..d39bfee462 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -2102,29 +2102,22 @@ out_nofid:
>   * with qemu_iovec_destroy().
>   */
>  static void v9fs_init_qiov_from_pdu(QEMUIOVector *qiov, V9fsPDU *pdu,
> -                                    size_t skip, size_t *size,
> +                                    size_t skip, size_t size,
>                                      bool is_write)
>  {
>      QEMUIOVector elem;
>      struct iovec *iov;
>      unsigned int niov;
> -    size_t alloc_size = *size + skip;
> 
>      if (is_write) {
> -        pdu->s->transport->init_out_iov_from_pdu(pdu, &iov, &niov,
> alloc_size); +        pdu->s->transport->init_out_iov_from_pdu(pdu, &iov,
> &niov, size + skip); } else {
> -        pdu->s->transport->init_in_iov_from_pdu(pdu, &iov, &niov,
> &alloc_size); -    }
> -
> -    if (alloc_size < skip) {
> -        *size = 0;
> -    } else {
> -        *size = alloc_size - skip;
> +        pdu->s->transport->init_in_iov_from_pdu(pdu, &iov, &niov, size +
> skip); }
> 
>      qemu_iovec_init_external(&elem, iov, niov);
>      qemu_iovec_init(qiov, niov);
> -    qemu_iovec_concat(qiov, &elem, skip, *size);
> +    qemu_iovec_concat(qiov, &elem, skip, size);
>  }
> 
>  static int v9fs_xattr_read(V9fsState *s, V9fsPDU *pdu, V9fsFidState *fidp,
> @@ -2132,14 +2125,15 @@ static int v9fs_xattr_read(V9fsState *s, V9fsPDU
> *pdu, V9fsFidState *fidp, {
>      ssize_t err;
>      size_t offset = 7;
> -    size_t read_count;
> +    uint64_t read_count;
>      QEMUIOVector qiov_full;
> 
>      if (fidp->fs.xattr.len < off) {
>          read_count = 0;
> -    } else if (fidp->fs.xattr.len - off < max_count) {
> -        read_count = fidp->fs.xattr.len - off;
>      } else {
> +        read_count = fidp->fs.xattr.len - off;
> +    }
> +    if (read_count > max_count) {
>          read_count = max_count;
>      }
>      err = pdu_marshal(pdu, offset, "d", read_count);
> @@ -2148,7 +2142,7 @@ static int v9fs_xattr_read(V9fsState *s, V9fsPDU *pdu,
> V9fsFidState *fidp, }
>      offset += err;
> 
> -    v9fs_init_qiov_from_pdu(&qiov_full, pdu, offset, &read_count, false);
> +    v9fs_init_qiov_from_pdu(&qiov_full, pdu, offset, read_count, false);
>      err = v9fs_pack(qiov_full.iov, qiov_full.niov, 0,
>                      ((char *)fidp->fs.xattr.value) + off,
>                      read_count);
> @@ -2277,11 +2271,9 @@ static void coroutine_fn v9fs_read(void *opaque)
>          QEMUIOVector qiov_full;
>          QEMUIOVector qiov;
>          int32_t len;
> -        size_t size = max_count;
> 
> -        v9fs_init_qiov_from_pdu(&qiov_full, pdu, offset + 4, &size, false);
> +        v9fs_init_qiov_from_pdu(&qiov_full, pdu, offset + 4, max_count,
> false); qemu_iovec_init(&qiov, qiov_full.niov);
> -        max_count = size;
>          do {
>              qemu_iovec_reset(&qiov);
>              qemu_iovec_concat(&qiov, &qiov_full, count, qiov_full.size -
> count); @@ -2532,7 +2524,6 @@ static void coroutine_fn v9fs_write(void
> *opaque) int32_t len = 0;
>      int32_t total = 0;
>      size_t offset = 7;
> -    size_t size;
>      V9fsFidState *fidp;
>      V9fsPDU *pdu = opaque;
>      V9fsState *s = pdu->s;
> @@ -2545,9 +2536,7 @@ static void coroutine_fn v9fs_write(void *opaque)
>          return;
>      }
>      offset += err;
> -    size = count;
> -    v9fs_init_qiov_from_pdu(&qiov_full, pdu, offset, &size, true);
> -    count = size;
> +    v9fs_init_qiov_from_pdu(&qiov_full, pdu, offset, count, true);
>      trace_v9fs_write(pdu->tag, pdu->id, fid, off, count, qiov_full.niov);
> 
>      fidp = get_fid(pdu, fid);
> diff --git a/hw/9pfs/9p.h b/hw/9pfs/9p.h
> index dd1c6cb8d2..1b9e110605 100644
> --- a/hw/9pfs/9p.h
> +++ b/hw/9pfs/9p.h
> @@ -436,7 +436,7 @@ struct V9fsTransport {
>      ssize_t     (*pdu_vunmarshal)(V9fsPDU *pdu, size_t offset, const char
> *fmt, va_list ap);
>      void        (*init_in_iov_from_pdu)(V9fsPDU *pdu, struct iovec **piov,
> -                                        unsigned int *pniov, size_t *size);
> +                                        unsigned int *pniov, size_t size);
> void        (*init_out_iov_from_pdu)(V9fsPDU *pdu, struct iovec **piov,
> unsigned int *pniov, size_t size); void        (*push_and_notify)(V9fsPDU
> *pdu);
> diff --git a/hw/9pfs/virtio-9p-device.c b/hw/9pfs/virtio-9p-device.c
> index e5b44977c7..36f3aa9352 100644
> --- a/hw/9pfs/virtio-9p-device.c
> +++ b/hw/9pfs/virtio-9p-device.c
> @@ -147,22 +147,19 @@ static ssize_t virtio_pdu_vunmarshal(V9fsPDU *pdu,
> size_t offset, }
> 
>  static void virtio_init_in_iov_from_pdu(V9fsPDU *pdu, struct iovec **piov,
> -                                        unsigned int *pniov, size_t *size)
> +                                        unsigned int *pniov, size_t size)
>  {
>      V9fsState *s = pdu->s;
>      V9fsVirtioState *v = container_of(s, V9fsVirtioState, state);
>      VirtQueueElement *elem = v->elems[pdu->idx];
>      size_t buf_size = iov_size(elem->in_sg, elem->in_num);
> 
> -    if (buf_size < P9_IOHDRSZ) {
> +    if (buf_size < size) {
>          VirtIODevice *vdev = VIRTIO_DEVICE(v);
> 
>          virtio_error(vdev,
> -                     "VirtFS reply type %d needs %zu bytes, buffer has %zu,
> less than minimum", -                     pdu->id + 1, *size, buf_size);
> -    }
> -    if (buf_size < *size) {
> -        *size = buf_size;
> +                     "VirtFS reply type %d needs %zu bytes, buffer has
> %zu", +                     pdu->id + 1, size, buf_size);
>      }
> 
>      *piov = elem->in_sg;
> diff --git a/hw/9pfs/xen-9p-backend.c b/hw/9pfs/xen-9p-backend.c
> index f04caabfe5..fc197f6c8a 100644
> --- a/hw/9pfs/xen-9p-backend.c
> +++ b/hw/9pfs/xen-9p-backend.c
> @@ -188,7 +188,7 @@ static void xen_9pfs_init_out_iov_from_pdu(V9fsPDU *pdu,
> static void xen_9pfs_init_in_iov_from_pdu(V9fsPDU *pdu,
>                                            struct iovec **piov,
>                                            unsigned int *pniov,
> -                                          size_t *size)
> +                                          size_t size)
>  {
>      Xen9pfsDev *xen_9pfs = container_of(pdu->s, Xen9pfsDev, state);
>      Xen9pfsRing *ring = &xen_9pfs->rings[pdu->tag % xen_9pfs->num_rings];
> @@ -198,19 +198,16 @@ static void xen_9pfs_init_in_iov_from_pdu(V9fsPDU
> *pdu, g_free(ring->sg);
> 
>      ring->sg = g_new0(struct iovec, 2);
> -    xen_9pfs_in_sg(ring, ring->sg, &num, pdu->idx, *size);
> +    xen_9pfs_in_sg(ring, ring->sg, &num, pdu->idx, size);
> 
>      buf_size = iov_size(ring->sg, num);
> -    if (buf_size  < P9_IOHDRSZ) {
> -        xen_pv_printf(&xen_9pfs->xendev, 0, "Xen 9pfs reply type %d needs "
> -                      "%zu bytes, buffer has %zu, less than minimum\n", - 
>                     pdu->id + 1, *size, buf_size);
> +    if (buf_size  < size) {
> +        xen_pv_printf(&xen_9pfs->xendev, 0, "Xen 9pfs request type %d"
> +                "needs %zu bytes, buffer has %zu\n", pdu->id, size,
> +                buf_size);
>          xen_be_set_state(&xen_9pfs->xendev, XenbusStateClosing);
>          xen_9pfs_disconnect(&xen_9pfs->xendev);
>      }
> -    if (buf_size  < *size) {
> -        *size = buf_size;
> -    }
> 
>      *piov = ring->sg;
>      *pniov = num;

Best regards,
Christian Schoenebeck



