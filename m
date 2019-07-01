Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 08FE71611E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 May 2019 11:38:09 +0200 (CEST)
Received: from localhost ([127.0.0.1]:43357 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNwY4-0003om-8C
	for lists+qemu-devel@lfdr.de; Tue, 07 May 2019 05:38:08 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47323)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1hNwX0-0003Ta-OA
	for qemu-devel@nongnu.org; Tue, 07 May 2019 05:37:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <groug@kaod.org>) id 1hNwWy-00042Y-VA
	for qemu-devel@nongnu.org; Tue, 07 May 2019 05:37:02 -0400
Received: from 6.mo179.mail-out.ovh.net ([46.105.56.76]:52339)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <groug@kaod.org>) id 1hNwWy-00040O-Hs
	for qemu-devel@nongnu.org; Tue, 07 May 2019 05:37:00 -0400
Received: from player730.ha.ovh.net (unknown [10.108.42.142])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id 5B19C121002
	for <qemu-devel@nongnu.org>; Tue,  7 May 2019 11:36:56 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
	[82.253.208.248]) (Authenticated sender: groug@kaod.org)
	by player730.ha.ovh.net (Postfix) with ESMTPSA id 7F96C55F0D32;
	Tue,  7 May 2019 09:36:53 +0000 (UTC)
Date: Tue, 7 May 2019 11:36:52 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Message-ID: <20190507113652.7c10ad5c@bahia.lan>
In-Reply-To: <37974785.mUsUI7CtV2@silver>
References: <cover.1556896526.git.qemu_oss@crudebyte.com>
	<37974785.mUsUI7CtV2@silver>
X-Mailer: Claws Mail 3.16.0 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 5888175039960553792
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddrkedtgddukecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.56.76
Subject: Re: [Qemu-devel] [PATCH v2 2/4] 9P: trivial cleanup of QID path
 collision mitigation
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-devel@nongnu.org, Antonios Motakis <antonios.motakis@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 03 May 2019 18:22:12 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> Addresses trivial changes regarding the previous patch as requested
> on the mailing list a while ago.
> 

Ah... so that explains why I couldn't find the changes in the other
patch.

> * Removed unneccessary parantheses:
>   https://lists.gnu.org/archive/html/qemu-devel/2018-02/msg02661.html
> 
> * Removed unneccessary g_malloc() result checks:
>   https://lists.gnu.org/archive/html/qemu-devel/2018-02/msg02814.html
> 
> * Unsigned type changes:
>   https://lists.gnu.org/archive/html/qemu-devel/2018-02/msg02581.html
> 

I'd prefer to see these applied to Antonio's original patches
along with your rebase changes. It will be easier for me to
review, ie. more likely for your contribution to be merged fast. :)

> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  fsdev/9p-marshal.h   |  2 +-
>  hw/9pfs/9p.c         | 16 +++++-----------
>  hw/9pfs/trace-events | 14 +++++++-------
>  3 files changed, 13 insertions(+), 19 deletions(-)
> 
> diff --git a/fsdev/9p-marshal.h b/fsdev/9p-marshal.h
> index d1ad3645c4..8f3babb60a 100644
> --- a/fsdev/9p-marshal.h
> +++ b/fsdev/9p-marshal.h
> @@ -9,7 +9,7 @@ typedef struct V9fsString
>  
>  typedef struct V9fsQID
>  {
> -    int8_t type;
> +    uint8_t type;
>      uint32_t version;
>      uint64_t path;
>  } V9fsQID;
> diff --git a/hw/9pfs/9p.c b/hw/9pfs/9p.c
> index b9bbdcbaee..2b893e25a1 100644
> --- a/hw/9pfs/9p.c
> +++ b/hw/9pfs/9p.c
> @@ -587,13 +587,13 @@ static uint32_t qpf_hash(QpfEntry e)
>  static bool qpp_cmp_func(const void *obj, const void *userp)
>  {
>      const QppEntry *e1 = obj, *e2 = userp;
> -    return (e1->dev == e2->dev) && (e1->ino_prefix == e2->ino_prefix);
> +    return e1->dev == e2->dev && e1->ino_prefix == e2->ino_prefix;
>  }
>  
>  static bool qpf_cmp_func(const void *obj, const void *userp)
>  {
>      const QpfEntry *e1 = obj, *e2 = userp;
> -    return (e1->dev == e2->dev) && (e1->ino == e2->ino);
> +    return e1->dev == e2->dev && e1->ino == e2->ino;
>  }
>  
>  static void qp_table_remove(void *p, uint32_t h, void *up)
> @@ -630,9 +630,6 @@ static int qid_path_fullmap(V9fsPDU *pdu, const struct stat *stbuf,
>          }
>  
>          val = g_malloc0(sizeof(QppEntry));
> -        if (!val) {
> -            return -ENOMEM;
> -        }
>          *val = lookup;
>  
>          /* new unique inode and device combo */
> @@ -673,9 +670,6 @@ static int qid_path_prefixmap(V9fsPDU *pdu, const struct stat *stbuf,
>          }
>  
>          val = g_malloc0(sizeof(QppEntry));
> -        if (!val) {
> -            return -ENOMEM;
> -        }
>          *val = lookup;
>  
>          /* new unique inode prefix and device combo */
> @@ -870,9 +864,9 @@ static int donttouch_stat(V9fsStat *stat)
>  {
>      if (stat->type == -1 &&
>          stat->dev == -1 &&
> -        stat->qid.type == -1 &&
> -        stat->qid.version == -1 &&
> -        stat->qid.path == -1 &&
> +        stat->qid.type == 0xff &&
> +        stat->qid.version == (uint32_t) -1 &&
> +        stat->qid.path == (uint64_t) -1 &&
>          stat->mode == -1 &&
>          stat->atime == -1 &&
>          stat->mtime == -1 &&
> diff --git a/hw/9pfs/trace-events b/hw/9pfs/trace-events
> index c0a0a4ab5d..6964756922 100644
> --- a/hw/9pfs/trace-events
> +++ b/hw/9pfs/trace-events
> @@ -6,7 +6,7 @@ v9fs_rerror(uint16_t tag, uint8_t id, int err) "tag %d id %d err %d"
>  v9fs_version(uint16_t tag, uint8_t id, int32_t msize, char* version) "tag %d id %d msize %d version %s"
>  v9fs_version_return(uint16_t tag, uint8_t id, int32_t msize, char* version) "tag %d id %d msize %d version %s"
>  v9fs_attach(uint16_t tag, uint8_t id, int32_t fid, int32_t afid, char* uname, char* aname) "tag %u id %u fid %d afid %d uname %s aname %s"
> -v9fs_attach_return(uint16_t tag, uint8_t id, int8_t type, int32_t version, int64_t path) "tag %d id %d type %d version %d path %"PRId64
> +v9fs_attach_return(uint16_t tag, uint8_t id, uint8_t type, uint32_t version, uint64_t path) "tag %d id %d type %d version %d path %"PRId64
>  v9fs_stat(uint16_t tag, uint8_t id, int32_t fid) "tag %d id %d fid %d"
>  v9fs_stat_return(uint16_t tag, uint8_t id, int32_t mode, int32_t atime, int32_t mtime, int64_t length) "tag %d id %d stat={mode %d atime %d mtime %d length %"PRId64"}"
>  v9fs_getattr(uint16_t tag, uint8_t id, int32_t fid, uint64_t request_mask) "tag %d id %d fid %d request_mask %"PRIu64
> @@ -14,9 +14,9 @@ v9fs_getattr_return(uint16_t tag, uint8_t id, uint64_t result_mask, uint32_t mod
>  v9fs_walk(uint16_t tag, uint8_t id, int32_t fid, int32_t newfid, uint16_t nwnames) "tag %d id %d fid %d newfid %d nwnames %d"
>  v9fs_walk_return(uint16_t tag, uint8_t id, uint16_t nwnames, void* qids) "tag %d id %d nwnames %d qids %p"
>  v9fs_open(uint16_t tag, uint8_t id, int32_t fid, int32_t mode) "tag %d id %d fid %d mode %d"
> -v9fs_open_return(uint16_t tag, uint8_t id, int8_t type, int32_t version, int64_t path, int iounit) "tag %d id %d qid={type %d version %d path %"PRId64"} iounit %d"
> +v9fs_open_return(uint16_t tag, uint8_t id, uint8_t type, uint32_t version, uint64_t path, int iounit) "tag %d id %d qid={type %d version %d path %"PRId64"} iounit %d"
>  v9fs_lcreate(uint16_t tag, uint8_t id, int32_t dfid, int32_t flags, int32_t mode, uint32_t gid) "tag %d id %d dfid %d flags %d mode %d gid %u"
> -v9fs_lcreate_return(uint16_t tag, uint8_t id, int8_t type, int32_t version, int64_t path, int32_t iounit) "tag %d id %d qid={type %d version %d path %"PRId64"} iounit %d"
> +v9fs_lcreate_return(uint16_t tag, uint8_t id, uint8_t type, uint32_t version, uint64_t path, int32_t iounit) "tag %d id %d qid={type %d version %d path %"PRId64"} iounit %d"
>  v9fs_fsync(uint16_t tag, uint8_t id, int32_t fid, int datasync) "tag %d id %d fid %d datasync %d"
>  v9fs_clunk(uint16_t tag, uint8_t id, int32_t fid) "tag %d id %d fid %d"
>  v9fs_read(uint16_t tag, uint8_t id, int32_t fid, uint64_t off, uint32_t max_count) "tag %d id %d fid %d off %"PRIu64" max_count %u"
> @@ -26,21 +26,21 @@ v9fs_readdir_return(uint16_t tag, uint8_t id, uint32_t count, ssize_t retval) "t
>  v9fs_write(uint16_t tag, uint8_t id, int32_t fid, uint64_t off, uint32_t count, int cnt) "tag %d id %d fid %d off %"PRIu64" count %u cnt %d"
>  v9fs_write_return(uint16_t tag, uint8_t id, int32_t total, ssize_t err) "tag %d id %d total %d err %zd"
>  v9fs_create(uint16_t tag, uint8_t id, int32_t fid, char* name, int32_t perm, int8_t mode) "tag %d id %d fid %d name %s perm %d mode %d"
> -v9fs_create_return(uint16_t tag, uint8_t id, int8_t type, int32_t version, int64_t path, int iounit) "tag %d id %d qid={type %d version %d path %"PRId64"} iounit %d"
> +v9fs_create_return(uint16_t tag, uint8_t id, uint8_t type, uint32_t version, uint64_t path, int iounit) "tag %d id %d qid={type %d version %d path %"PRId64"} iounit %d"
>  v9fs_symlink(uint16_t tag, uint8_t id, int32_t fid,  char* name, char* symname, uint32_t gid) "tag %d id %d fid %d name %s symname %s gid %u"
> -v9fs_symlink_return(uint16_t tag, uint8_t id, int8_t type, int32_t version, int64_t path) "tag %d id %d qid={type %d version %d path %"PRId64"}"
> +v9fs_symlink_return(uint16_t tag, uint8_t id, uint8_t type, uint32_t version, uint64_t path) "tag %d id %d qid={type %d version %d path %"PRId64"}"
>  v9fs_flush(uint16_t tag, uint8_t id, int16_t flush_tag) "tag %d id %d flush_tag %d"
>  v9fs_link(uint16_t tag, uint8_t id, int32_t dfid, int32_t oldfid, char* name) "tag %d id %d dfid %d oldfid %d name %s"
>  v9fs_remove(uint16_t tag, uint8_t id, int32_t fid) "tag %d id %d fid %d"
>  v9fs_wstat(uint16_t tag, uint8_t id, int32_t fid, int32_t mode, int32_t atime, int32_t mtime) "tag %u id %u fid %d stat={mode %d atime %d mtime %d}"
>  v9fs_mknod(uint16_t tag, uint8_t id, int32_t fid, int mode, int major, int minor) "tag %d id %d fid %d mode %d major %d minor %d"
> -v9fs_mknod_return(uint16_t tag, uint8_t id, int8_t type, int32_t version, int64_t path) "tag %d id %d qid={type %d version %d path %"PRId64"}"
> +v9fs_mknod_return(uint16_t tag, uint8_t id, uint8_t type, uint32_t version, uint64_t path) "tag %d id %d qid={type %d version %d path %"PRId64"}"
>  v9fs_lock(uint16_t tag, uint8_t id, int32_t fid, uint8_t type, uint64_t start, uint64_t length) "tag %d id %d fid %d type %d start %"PRIu64" length %"PRIu64
>  v9fs_lock_return(uint16_t tag, uint8_t id, int8_t status) "tag %d id %d status %d"
>  v9fs_getlock(uint16_t tag, uint8_t id, int32_t fid, uint8_t type, uint64_t start, uint64_t length)"tag %d id %d fid %d type %d start %"PRIu64" length %"PRIu64
>  v9fs_getlock_return(uint16_t tag, uint8_t id, uint8_t type, uint64_t start, uint64_t length, uint32_t proc_id) "tag %d id %d type %d start %"PRIu64" length %"PRIu64" proc_id %u"
>  v9fs_mkdir(uint16_t tag, uint8_t id, int32_t fid, char* name, int mode, uint32_t gid) "tag %u id %u fid %d name %s mode %d gid %u"
> -v9fs_mkdir_return(uint16_t tag, uint8_t id, int8_t type, int32_t version, int64_t path, int err) "tag %u id %u qid={type %d version %d path %"PRId64"} err %d"
> +v9fs_mkdir_return(uint16_t tag, uint8_t id, uint8_t type, uint32_t version, uint64_t path, int err) "tag %u id %u qid={type %d version %d path %"PRId64"} err %d"
>  v9fs_xattrwalk(uint16_t tag, uint8_t id, int32_t fid, int32_t newfid, char* name) "tag %d id %d fid %d newfid %d name %s"
>  v9fs_xattrwalk_return(uint16_t tag, uint8_t id, int64_t size) "tag %d id %d size %"PRId64
>  v9fs_xattrcreate(uint16_t tag, uint8_t id, int32_t fid, char* name, uint64_t size, int flags) "tag %d id %d fid %d name %s size %"PRIu64" flags %d"


