Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA94140E53
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 16:52:49 +0100 (CET)
Received: from localhost ([::1]:59368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isTvU-0002MJ-PA
	for lists+qemu-devel@lfdr.de; Fri, 17 Jan 2020 10:52:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40040)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1isTuP-0001Sj-B4
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 10:51:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1isTuL-0002ZW-Ll
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 10:51:41 -0500
Received: from 1.mo178.mail-out.ovh.net ([178.33.251.53]:49729)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1isTuL-0002Yg-EF
 for qemu-devel@nongnu.org; Fri, 17 Jan 2020 10:51:37 -0500
Received: from player787.ha.ovh.net (unknown [10.108.35.110])
 by mo178.mail-out.ovh.net (Postfix) with ESMTP id 9D0E28CE83
 for <qemu-devel@nongnu.org>; Fri, 17 Jan 2020 16:51:35 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player787.ha.ovh.net (Postfix) with ESMTPSA id 64B5DE86F5D8;
 Fri, 17 Jan 2020 15:51:31 +0000 (UTC)
Date: Fri, 17 Jan 2020 16:51:29 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v3 05/11] tests/virtio-9p: added readdir test
Message-ID: <20200117165129.064fbb30@bahia.lan>
In-Reply-To: <d48e21f83d8a8c766368190e872c7b72a5f7e881.1578957500.git.qemu_oss@crudebyte.com>
References: <cover.1578957500.git.qemu_oss@crudebyte.com>
 <d48e21f83d8a8c766368190e872c7b72a5f7e881.1578957500.git.qemu_oss@crudebyte.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 15566410639475579200
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrtdejgdekudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeekjedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 178.33.251.53
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

On Tue, 14 Jan 2020 00:08:51 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> The first readdir test simply checks the amount of directory
> entries returned by 9pfs server, according to the created amount
> of virtual files on 9pfs synth driver side. Then the subsequent
> readdir test also checks whether all directory entries have the
> expected file names (as created on 9pfs synth driver side),
> ignoring their precise order in result list though.
> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---

LGTM but I'm afraid this needs rebasing because virtio-9p-test.c got moved
to tests/qtest/ by this commit (merged earlier this week):

commit 1e8a1fae7464ef79c9e50aa0f807d2c511be3c8e
Author: Thomas Huth <thuth@redhat.com>
Date:   Mon Sep 9 12:04:01 2019 +0200

    test: Move qtests to a separate directory
    
    The tests directory itself is pretty overcrowded, and it's hard to
    see which test belongs to which test subsystem (unit, qtest, ...).
    Let's move the qtests to a separate folder for more clarity.
    
    Message-Id: <20191218103059.11729-6-thuth@redhat.com>
    Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>
    Signed-off-by: Thomas Huth <thuth@redhat.com>

>  tests/virtio-9p-test.c | 149 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 149 insertions(+)
> 
> diff --git a/tests/virtio-9p-test.c b/tests/virtio-9p-test.c
> index 06263edb53..721f13c1fb 100644
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
> @@ -348,6 +360,82 @@ static void v9fs_rwalk(P9Req *req, uint16_t *nwqid, v9fs_qid **wqid)
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
> +struct V9fsDirent {
> +    v9fs_qid qid;
> +    uint64_t offset;
> +    uint8_t type;
> +    char *name;
> +    struct V9fsDirent *next;
> +};
> +
> +/* size[4] Rreaddir tag[2] count[4] data[count] */
> +static void v9fs_rreaddir(P9Req *req, uint32_t *count, uint32_t *nentries,
> +                          struct V9fsDirent **entries)
> +{
> +    uint32_t local_count;
> +    struct V9fsDirent *e = NULL;
> +    uint16_t slen;
> +    uint32_t n = 0;
> +
> +    v9fs_req_recv(req, P9_RREADDIR);
> +    v9fs_uint32_read(req, &local_count);
> +
> +    if (count) {
> +        *count = local_count;
> +    }
> +
> +    for (int32_t togo = (int32_t)local_count;
> +         togo >= 13 + 8 + 1 + 2;
> +         togo -= 13 + 8 + 1 + 2 + slen, ++n)
> +    {
> +        if (!e) {
> +            e = g_malloc(sizeof(struct V9fsDirent));
> +            if (entries) {
> +                *entries = e;
> +            }
> +        } else {
> +            e = e->next = g_malloc(sizeof(struct V9fsDirent));
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
> +
> +    v9fs_req_free(req);
> +}
> +
> +static void v9fs_free_dirents(struct V9fsDirent *e)
> +{
> +    struct V9fsDirent *next = NULL;
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
> @@ -480,6 +568,66 @@ static void fs_walk(void *obj, void *data, QGuestAllocator *t_alloc)
>      g_free(wqid);
>  }
>  
> +static bool fs_dirents_contain_name(struct V9fsDirent *e, const char* name)
> +{
> +    for (; e; e = e->next) {
> +        if (!strcmp(e->name, name)) {
> +            return true;
> +        }
> +    }
> +    return false;
> +}
> +
> +static void fs_readdir(void *obj, void *data, QGuestAllocator *t_alloc)
> +{
> +    QVirtio9P *v9p = obj;
> +    alloc = t_alloc;
> +    char *const wnames[] = { g_strdup(QTEST_V9FS_SYNTH_READDIR_DIR) };
> +    uint16_t nqid;
> +    v9fs_qid qid;
> +    uint32_t count, nentries;
> +    struct V9fsDirent *entries = NULL;
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
> +
> +    /*
> +     * Check all file names exist in returned entries, ignore their order
> +     * though.
> +     */
> +    g_assert_cmpint(fs_dirents_contain_name(entries, "."), ==, true);
> +    g_assert_cmpint(fs_dirents_contain_name(entries, ".."), ==, true);
> +    for (int i = 0; i < QTEST_V9FS_SYNTH_READDIR_NFILES; ++i) {
> +        char *name = g_strdup_printf(QTEST_V9FS_SYNTH_READDIR_FILE, i);
> +        g_assert_cmpint(fs_dirents_contain_name(entries, name), ==, true);
> +        g_free(name);
> +    }
> +
> +    v9fs_free_dirents(entries);
> +    g_free(wnames[0]);
> +}
> +
>  static void fs_walk_no_slash(void *obj, void *data, QGuestAllocator *t_alloc)
>  {
>      QVirtio9P *v9p = obj;
> @@ -658,6 +806,7 @@ static void register_virtio_9p_test(void)
>                   NULL);
>      qos_add_test("fs/flush/ignored", "virtio-9p", fs_flush_ignored,
>                   NULL);
> +    qos_add_test("fs/readdir/basic", "virtio-9p", fs_readdir, NULL);
>  }
>  
>  libqos_init(register_virtio_9p_test);


