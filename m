Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8AB1316B2
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jan 2020 18:23:48 +0100 (CET)
Received: from localhost ([::1]:55608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioW6V-0007U6-7E
	for lists+qemu-devel@lfdr.de; Mon, 06 Jan 2020 12:23:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53481)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1ioW5j-0006zW-IY
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 12:23:00 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1ioW5h-0006cg-TV
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 12:22:59 -0500
Received: from 1.mo179.mail-out.ovh.net ([178.33.111.220]:59441)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1ioW5h-0006aw-Mk
 for qemu-devel@nongnu.org; Mon, 06 Jan 2020 12:22:57 -0500
Received: from player779.ha.ovh.net (unknown [10.108.57.44])
 by mo179.mail-out.ovh.net (Postfix) with ESMTP id 556B915499A
 for <qemu-devel@nongnu.org>; Mon,  6 Jan 2020 18:22:55 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player779.ha.ovh.net (Postfix) with ESMTPSA id 866E6DE03DA5;
 Mon,  6 Jan 2020 17:22:53 +0000 (UTC)
Date: Mon, 6 Jan 2020 18:22:52 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v2 4/9] tests/virtio-9p: added readdir test
Message-ID: <20200106182252.58dd6712@bahia.lan>
In-Reply-To: <a8d6dab2625554d425bd44a4d54d84459f083b18.1576678644.git.qemu_oss@crudebyte.com>
References: <cover.1576678644.git.qemu_oss@crudebyte.com>
 <a8d6dab2625554d425bd44a4d54d84459f083b18.1576678644.git.qemu_oss@crudebyte.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 7849211201066735936
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrvdehtddguddtudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeejledrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 178.33.111.220
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 18 Dec 2019 14:30:43 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> This first readdir test simply checks the amount of directory
> entries returned by 9pfs server, according to the created amount
> of virtual files on 9pfs synth driver side.
> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  tests/virtio-9p-test.c | 124 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 124 insertions(+)
> 
> diff --git a/tests/virtio-9p-test.c b/tests/virtio-9p-test.c
> index 06263edb53..48c0eca292 100644
> --- a/tests/virtio-9p-test.c
> +++ b/tests/virtio-9p-test.c
> @@ -68,6 +68,11 @@ static void v9fs_memread(P9Req *req, void *addr, size_t len)
>      req->r_off += len;
>  }
>  
> +static void v9fs_uint8_read(P9Req *req, uint8_t *val)
> +{
> +    v9fs_memread(req, val, 1);
> +}
> +
>  static void v9fs_uint16_write(P9Req *req, uint16_t val)
>  {
>      uint16_t le_val = cpu_to_le16(val);
> @@ -101,6 +106,12 @@ static void v9fs_uint32_read(P9Req *req, uint32_t *val)
>      le32_to_cpus(val);
>  }
>  
> +static void v9fs_uint64_read(P9Req *req, uint64_t *val)
> +{
> +    v9fs_memread(req, val, 8);
> +    le64_to_cpus(val);
> +}
> +
>  /* len[2] string[len] */
>  static uint16_t v9fs_string_size(const char *string)
>  {
> @@ -191,6 +202,7 @@ static const char *rmessage_name(uint8_t id)
>          id == P9_RLOPEN ? "RLOPEN" :
>          id == P9_RWRITE ? "RWRITE" :
>          id == P9_RFLUSH ? "RFLUSH" :
> +        id == P9_RREADDIR ? "READDIR" :
>          "<unknown>";
>  }
>  
> @@ -348,6 +360,79 @@ static void v9fs_rwalk(P9Req *req, uint16_t *nwqid, v9fs_qid **wqid)
>      v9fs_req_free(req);
>  }
>  
> +/* size[4] Treaddir tag[2] fid[4] offset[8] count[4] */
> +static P9Req *v9fs_treaddir(QVirtio9P *v9p, uint32_t fid, uint64_t offset,
> +                            uint32_t count, uint16_t tag)
> +{
> +    P9Req *req;
> +
> +    req = v9fs_req_init(v9p, 4 + 8 + 4, P9_TREADDIR, tag);
> +    v9fs_uint32_write(req, fid);
> +    v9fs_uint64_write(req, offset);
> +    v9fs_uint32_write(req, count);
> +    v9fs_req_send(req);
> +    return req;
> +}
> +
> +struct v9fs_dirent {

The QEMU coding style calls for a CamelCase typedef,

ie.

typedef struct V9fsDirent V9fsDirent;

> +    v9fs_qid qid;

Yeah... I should have done the same when I introduced this type ;-)

> +    uint64_t offset;
> +    uint8_t type;
> +    char *name;
> +    struct v9fs_dirent *next;
> +};
> +
> +/* size[4] Rreaddir tag[2] count[4] data[count] */
> +static void v9fs_rreaddir(P9Req *req, uint32_t *count, uint32_t *nentries,
> +                          struct v9fs_dirent **entries)
> +{
> +    uint32_t sz;
> +    struct v9fs_dirent *e = NULL;
> +    uint16_t slen;
> +    uint32_t n = 0;
> +
> +    v9fs_req_recv(req, P9_RREADDIR);
> +    v9fs_uint32_read(req, &sz);
> +
> +    if (count) {
> +        *count = sz;
> +    }
> +
> +    for (int32_t togo = (int32_t)sz;
> +         togo >= 13 + 8 + 1 + 2;
> +         togo -= 13 + 8 + 1 + 2 + slen, ++n)
> +    {
> +        if (!e) {
> +            e = g_malloc(sizeof(struct v9fs_dirent));
> +            if (entries)
> +                *entries = e;
> +        } else {
> +            e = e->next = g_malloc(sizeof(struct v9fs_dirent));
> +        }
> +        e->next = NULL;
> +        /* qid[13] offset[8] type[1] name[s] */
> +        v9fs_memread(req, &e->qid, 13);
> +        v9fs_uint64_read(req, &e->offset);
> +        v9fs_uint8_read(req, &e->type);
> +        v9fs_string_read(req, &slen, &e->name);
> +    }
> +
> +    if (nentries) {
> +        *nentries = n;
> +    }
> +}
> +
> +static void v9fs_free_dirents(struct v9fs_dirent *e)
> +{
> +    struct v9fs_dirent *next = NULL;
> +
> +    for (; e; e = next) {
> +        next = e->next;
> +        g_free(e->name);
> +        g_free(e);
> +    }
> +}
> +
>  /* size[4] Tlopen tag[2] fid[4] flags[4] */
>  static P9Req *v9fs_tlopen(QVirtio9P *v9p, uint32_t fid, uint32_t flags,
>                            uint16_t tag)
> @@ -480,6 +565,44 @@ static void fs_walk(void *obj, void *data, QGuestAllocator *t_alloc)
>      g_free(wqid);
>  }
>  
> +static void fs_readdir(void *obj, void *data, QGuestAllocator *t_alloc)
> +{
> +    QVirtio9P *v9p = obj;
> +    alloc = t_alloc;
> +    char *const wnames[] = { g_strdup(QTEST_V9FS_SYNTH_READDIR_DIR) };
> +    uint16_t nqid;
> +    v9fs_qid qid;
> +    uint32_t count, nentries;
> +    struct v9fs_dirent *entries = NULL;
> +    P9Req *req;
> +
> +    fs_attach(v9p, NULL, t_alloc);
> +    req = v9fs_twalk(v9p, 0, 1, 1, wnames, 0);
> +    v9fs_req_wait_for_reply(req, NULL);
> +    v9fs_rwalk(req, &nqid, NULL);
> +    g_assert_cmpint(nqid, ==, 1);
> +
> +    req = v9fs_tlopen(v9p, 1, O_DIRECTORY, 0);
> +    v9fs_req_wait_for_reply(req, NULL);
> +    v9fs_rlopen(req, &qid, NULL);
> +
> +    req = v9fs_treaddir(v9p, 1, 0, P9_MAX_SIZE - P9_IOHDRSZ, 0);
> +    v9fs_req_wait_for_reply(req, NULL);
> +    v9fs_rreaddir(req, &count, &nentries, &entries);
> +
> +    /*
> +     * Assuming msize (P9_MAX_SIZE) is large enough so we can retrieve all
> +     * dir entries with only one readdir request.
> +     */
> +    g_assert_cmpint(
> +        nentries, ==,
> +        QTEST_V9FS_SYNTH_READDIR_NFILES + 2 /* "." and ".." */
> +    );

What about coming up with a version of this test that loops until
it could read all the entries instead of this assumption ?

> +
> +    v9fs_free_dirents(entries);
> +    g_free(wnames[0]);
> +}
> +
>  static void fs_walk_no_slash(void *obj, void *data, QGuestAllocator *t_alloc)
>  {
>      QVirtio9P *v9p = obj;
> @@ -658,6 +781,7 @@ static void register_virtio_9p_test(void)
>                   NULL);
>      qos_add_test("fs/flush/ignored", "virtio-9p", fs_flush_ignored,
>                   NULL);
> +    qos_add_test("fs/readdir/basic", "virtio-9p", fs_readdir, NULL);
>  }
>  
>  libqos_init(register_virtio_9p_test);


