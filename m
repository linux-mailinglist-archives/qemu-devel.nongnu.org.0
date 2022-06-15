Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5162C54CD40
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 17:42:13 +0200 (CEST)
Received: from localhost ([::1]:44760 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1V9o-0004hP-C5
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 11:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51274)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1o1Ud6-00052a-WE
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:08:26 -0400
Received: from us-smtp-delivery-44.mimecast.com ([207.211.30.44]:57319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1o1Ud2-0004hA-2a
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 11:08:23 -0400
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-609-TtXlTjt9MNqkgL3osPub3g-1; Wed, 15 Jun 2022 11:08:07 -0400
X-MC-Unique: TtXlTjt9MNqkgL3osPub3g-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BD9B33804516;
 Wed, 15 Jun 2022 15:08:06 +0000 (UTC)
Received: from bahia (unknown [10.39.192.131])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3BDF9492CA5;
 Wed, 15 Jun 2022 15:08:06 +0000 (UTC)
Date: Wed, 15 Jun 2022 17:08:05 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Cc: qemu-devel@nongnu.org
Subject: Re: [PATCH v4 3/7] tests/9pfs: compare QIDs in fs_walk_none() test
Message-ID: <20220615170805.1dca73a9@bahia>
In-Reply-To: <5bbe9c6931b4600a9a23742f5ff2d38c1188237d.1647339025.git.qemu_oss@crudebyte.com>
References: <cover.1647339025.git.qemu_oss@crudebyte.com>
 <5bbe9c6931b4600a9a23742f5ff2d38c1188237d.1647339025.git.qemu_oss@crudebyte.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Received-SPF: softfail client-ip=207.211.30.44; envelope-from=groug@kaod.org;
 helo=us-smtp-delivery-44.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_NONE=0.001, SPF_SOFTFAIL=0.665,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

On Tue, 15 Mar 2022 11:08:35 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> Extend previously added fs_walk_none() test by comparing the QID
> of the root fid with the QID of the cloned fid. They should be
> equal.
> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---

LGTM.

Reviewed-by: Greg Kurz <groug@kaod.org>

>  tests/qtest/virtio-9p-test.c | 87 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 87 insertions(+)
> 
> diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
> index 6c00da03f4..a1160f4659 100644
> --- a/tests/qtest/virtio-9p-test.c
> +++ b/tests/qtest/virtio-9p-test.c
> @@ -371,8 +371,15 @@ static P9Req *v9fs_tattach(QVirtio9P *v9p, uint32_t fid, uint32_t n_uname,
>      return req;
>  }
>  
> +/* type[1] version[4] path[8] */
>  typedef char v9fs_qid[13];
>  
> +static inline bool is_same_qid(v9fs_qid a, v9fs_qid b)
> +{
> +    /* don't compare QID version for checking for file ID equalness */
> +    return a[0] == b[0] && memcmp(&a[5], &b[5], 8) == 0;
> +}
> +
>  /* size[4] Rattach tag[2] qid[13] */
>  static void v9fs_rattach(P9Req *req, v9fs_qid *qid)
>  {
> @@ -425,6 +432,79 @@ static void v9fs_rwalk(P9Req *req, uint16_t *nwqid, v9fs_qid **wqid)
>      v9fs_req_free(req);
>  }
>  
> +/* size[4] Tgetattr tag[2] fid[4] request_mask[8] */
> +static P9Req *v9fs_tgetattr(QVirtio9P *v9p, uint32_t fid, uint64_t request_mask,
> +                            uint16_t tag)
> +{
> +    P9Req *req;
> +
> +    req = v9fs_req_init(v9p, 4 + 8, P9_TGETATTR, tag);
> +    v9fs_uint32_write(req, fid);
> +    v9fs_uint64_write(req, request_mask);
> +    v9fs_req_send(req);
> +    return req;
> +}
> +
> +typedef struct v9fs_attr {
> +    uint64_t valid;
> +    v9fs_qid qid;
> +    uint32_t mode;
> +    uint32_t uid;
> +    uint32_t gid;
> +    uint64_t nlink;
> +    uint64_t rdev;
> +    uint64_t size;
> +    uint64_t blksize;
> +    uint64_t blocks;
> +    uint64_t atime_sec;
> +    uint64_t atime_nsec;
> +    uint64_t mtime_sec;
> +    uint64_t mtime_nsec;
> +    uint64_t ctime_sec;
> +    uint64_t ctime_nsec;
> +    uint64_t btime_sec;
> +    uint64_t btime_nsec;
> +    uint64_t gen;
> +    uint64_t data_version;
> +} v9fs_attr;
> +
> +#define P9_GETATTR_BASIC    0x000007ffULL /* Mask for fields up to BLOCKS */
> +
> +/*
> + * size[4] Rgetattr tag[2] valid[8] qid[13] mode[4] uid[4] gid[4] nlink[8]
> + *                  rdev[8] size[8] blksize[8] blocks[8]
> + *                  atime_sec[8] atime_nsec[8] mtime_sec[8] mtime_nsec[8]
> + *                  ctime_sec[8] ctime_nsec[8] btime_sec[8] btime_nsec[8]
> + *                  gen[8] data_version[8]
> + */
> +static void v9fs_rgetattr(P9Req *req, v9fs_attr *attr)
> +{
> +    v9fs_req_recv(req, P9_RGETATTR);
> +
> +    v9fs_uint64_read(req, &attr->valid);
> +    v9fs_memread(req, &attr->qid, 13);
> +    v9fs_uint32_read(req, &attr->mode);
> +    v9fs_uint32_read(req, &attr->uid);
> +    v9fs_uint32_read(req, &attr->gid);
> +    v9fs_uint64_read(req, &attr->nlink);
> +    v9fs_uint64_read(req, &attr->rdev);
> +    v9fs_uint64_read(req, &attr->size);
> +    v9fs_uint64_read(req, &attr->blksize);
> +    v9fs_uint64_read(req, &attr->blocks);
> +    v9fs_uint64_read(req, &attr->atime_sec);
> +    v9fs_uint64_read(req, &attr->atime_nsec);
> +    v9fs_uint64_read(req, &attr->mtime_sec);
> +    v9fs_uint64_read(req, &attr->mtime_nsec);
> +    v9fs_uint64_read(req, &attr->ctime_sec);
> +    v9fs_uint64_read(req, &attr->ctime_nsec);
> +    v9fs_uint64_read(req, &attr->btime_sec);
> +    v9fs_uint64_read(req, &attr->btime_nsec);
> +    v9fs_uint64_read(req, &attr->gen);
> +    v9fs_uint64_read(req, &attr->data_version);
> +
> +    v9fs_req_free(req);
> +}
> +
>  /* size[4] Treaddir tag[2] fid[4] offset[8] count[4] */
>  static P9Req *v9fs_treaddir(QVirtio9P *v9p, uint32_t fid, uint64_t offset,
>                              uint32_t count, uint16_t tag)
> @@ -1009,6 +1089,7 @@ static void fs_walk_none(void *obj, void *data, QGuestAllocator *t_alloc)
>      v9fs_qid root_qid;
>      g_autofree v9fs_qid *wqid = NULL;
>      P9Req *req;
> +    struct v9fs_attr attr;
>  
>      do_version(v9p);
>      req = v9fs_tattach(v9p, 0, getuid(), 0);
> @@ -1021,6 +1102,12 @@ static void fs_walk_none(void *obj, void *data, QGuestAllocator *t_alloc)
>  
>      /* special case: no QID is returned if nwname=0 was sent */
>      g_assert(wqid == NULL);
> +
> +    req = v9fs_tgetattr(v9p, 1, P9_GETATTR_BASIC, 0);
> +    v9fs_req_wait_for_reply(req, NULL);
> +    v9fs_rgetattr(req, &attr);
> +
> +    g_assert(is_same_qid(root_qid, attr.qid));
>  }
>  
>  static void fs_walk_dotdot(void *obj, void *data, QGuestAllocator *t_alloc)


