Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E22842321C9
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Jul 2020 17:44:19 +0200 (CEST)
Received: from localhost ([::1]:37116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k0oFe-0001WB-Of
	for lists+qemu-devel@lfdr.de; Wed, 29 Jul 2020 11:44:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1k0oEa-00015e-B3
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 11:43:12 -0400
Received: from 1.mo173.mail-out.ovh.net ([178.33.111.180]:53763)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1k0oEX-0006Mr-NT
 for qemu-devel@nongnu.org; Wed, 29 Jul 2020 11:43:12 -0400
Received: from player716.ha.ovh.net (unknown [10.108.35.12])
 by mo173.mail-out.ovh.net (Postfix) with ESMTP id BA075146F8B
 for <qemu-devel@nongnu.org>; Wed, 29 Jul 2020 17:42:57 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player716.ha.ovh.net (Postfix) with ESMTPSA id E28F514BCE29C;
 Wed, 29 Jul 2020 15:42:55 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001c63f6575-e41e-46c3-8dab-d9096b42c7df,A40F6FE0CFFE28C23AB4AFBB3D5D665E11D39731)
 smtp.auth=groug@kaod.org
Date: Wed, 29 Jul 2020 17:42:54 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v8 1/7] tests/virtio-9p: added split readdir tests
Message-ID: <20200729174254.58aaccc6@bahia.lan>
In-Reply-To: <569b2e05ab1d0223b14a12dfbdf3ad5e8b3ac131.1596012787.git.qemu_oss@crudebyte.com>
References: <cover.1596012787.git.qemu_oss@crudebyte.com>
 <569b2e05ab1d0223b14a12dfbdf3ad5e8b3ac131.1596012787.git.qemu_oss@crudebyte.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 11025093363178248512
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrieeggdelvdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepheekhfdtheegheehjeeludefkefhvdelfedvieehhfekhfdufffhueeuvdfftdfhnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejudeirdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=178.33.111.180; envelope-from=groug@kaod.org;
 helo=1.mo173.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/29 11:42:59
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 29 Jul 2020 10:10:23 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> The previous, already existing 'basic' readdir test simply used a
> 'count' parameter big enough to retrieve all directory entries with a
> single Treaddir request.
> 
> In the 3 new 'split' readdir tests added by this patch, directory
> entries are retrieved, split over several Treaddir requests by picking
> small 'count' parameters which force the server to truncate the
> response. So the test client sends as many Treaddir requests as
> necessary to get all directory entries.
> 
> The following 3 new tests are added (executed in this sequence):
> 
> 1. Split readdir test with count=512
> 2. Split readdir test with count=256
> 3. Split readdir test with count=128
> 
> This test case sequence is chosen because the smaller the 'count' value,
> the higher the chance of errors in case of implementation bugs on server
> side.
> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---

The existing fs_readdir() function for the 'basic' test is a subset
of the new fs_readdir_split() introduced by this patch (quite visible
if you sdiff the code).

To avoid code duplication, I would have probably tried to do the changes
in fs_readdir() and implement the 'basic' test as:

static void fs_readdir_basic(void *obj, void *data,
                             QGuestAllocator *t_alloc)
{
    /*
     * submit count = msize - 11, because 11 is the header size of Rreaddir
     */
    fs_readdir(obj, data, t_alloc, P9_MAX_SIZE - 11);
}

but anyway this looks good to me so:

Reviewed-by: Greg Kurz <groug@kaod.org>

>  tests/qtest/virtio-9p-test.c | 108 +++++++++++++++++++++++++++++++++++
>  1 file changed, 108 insertions(+)
> 
> diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
> index 2167322985..de30b717b6 100644
> --- a/tests/qtest/virtio-9p-test.c
> +++ b/tests/qtest/virtio-9p-test.c
> @@ -578,6 +578,7 @@ static bool fs_dirents_contain_name(struct V9fsDirent *e, const char* name)
>      return false;
>  }
>  
> +/* basic readdir test where reply fits into a single response message */
>  static void fs_readdir(void *obj, void *data, QGuestAllocator *t_alloc)
>  {
>      QVirtio9P *v9p = obj;
> @@ -631,6 +632,89 @@ static void fs_readdir(void *obj, void *data, QGuestAllocator *t_alloc)
>      g_free(wnames[0]);
>  }
>  
> +/* readdir test where overall request is split over several messages */
> +static void fs_readdir_split(void *obj, void *data, QGuestAllocator *t_alloc,
> +                             uint32_t count)
> +{
> +    QVirtio9P *v9p = obj;
> +    alloc = t_alloc;
> +    char *const wnames[] = { g_strdup(QTEST_V9FS_SYNTH_READDIR_DIR) };
> +    uint16_t nqid;
> +    v9fs_qid qid;
> +    uint32_t nentries, npartialentries;
> +    struct V9fsDirent *entries, *tail, *partialentries;
> +    P9Req *req;
> +    int fid;
> +    uint64_t offset;
> +
> +    fs_attach(v9p, NULL, t_alloc);
> +
> +    fid = 1;
> +    offset = 0;
> +    entries = NULL;
> +    nentries = 0;
> +    tail = NULL;
> +
> +    req = v9fs_twalk(v9p, 0, fid, 1, wnames, 0);
> +    v9fs_req_wait_for_reply(req, NULL);
> +    v9fs_rwalk(req, &nqid, NULL);
> +    g_assert_cmpint(nqid, ==, 1);
> +
> +    req = v9fs_tlopen(v9p, fid, O_DIRECTORY, 0);
> +    v9fs_req_wait_for_reply(req, NULL);
> +    v9fs_rlopen(req, &qid, NULL);
> +
> +    /*
> +     * send as many Treaddir requests as required to get all directory
> +     * entries
> +     */
> +    while (true) {
> +        npartialentries = 0;
> +        partialentries = NULL;
> +
> +        req = v9fs_treaddir(v9p, fid, offset, count, 0);
> +        v9fs_req_wait_for_reply(req, NULL);
> +        v9fs_rreaddir(req, &count, &npartialentries, &partialentries);
> +        if (npartialentries > 0 && partialentries) {
> +            if (!entries) {
> +                entries = partialentries;
> +                nentries = npartialentries;
> +                tail = partialentries;
> +            } else {
> +                tail->next = partialentries;
> +                nentries += npartialentries;
> +            }
> +            while (tail->next) {
> +                tail = tail->next;
> +            }
> +            offset = tail->offset;
> +        } else {
> +            break;
> +        }
> +    }
> +
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
> +
> +    g_free(wnames[0]);
> +}
> +
>  static void fs_walk_no_slash(void *obj, void *data, QGuestAllocator *t_alloc)
>  {
>      QVirtio9P *v9p = obj;
> @@ -793,6 +877,24 @@ static void fs_flush_ignored(void *obj, void *data, QGuestAllocator *t_alloc)
>      g_free(wnames[0]);
>  }
>  
> +static void fs_readdir_split_128(void *obj, void *data,
> +                                 QGuestAllocator *t_alloc)
> +{
> +    fs_readdir_split(obj, data, t_alloc, 128);
> +}
> +
> +static void fs_readdir_split_256(void *obj, void *data,
> +                                 QGuestAllocator *t_alloc)
> +{
> +    fs_readdir_split(obj, data, t_alloc, 256);
> +}
> +
> +static void fs_readdir_split_512(void *obj, void *data,
> +                                 QGuestAllocator *t_alloc)
> +{
> +    fs_readdir_split(obj, data, t_alloc, 512);
> +}
> +
>  static void register_virtio_9p_test(void)
>  {
>      qos_add_test("config", "virtio-9p", pci_config, NULL);
> @@ -810,6 +912,12 @@ static void register_virtio_9p_test(void)
>      qos_add_test("fs/flush/ignored", "virtio-9p", fs_flush_ignored,
>                   NULL);
>      qos_add_test("fs/readdir/basic", "virtio-9p", fs_readdir, NULL);
> +    qos_add_test("fs/readdir/split_512", "virtio-9p",
> +                 fs_readdir_split_512, NULL);
> +    qos_add_test("fs/readdir/split_256", "virtio-9p",
> +                 fs_readdir_split_256, NULL);
> +    qos_add_test("fs/readdir/split_128", "virtio-9p",
> +                 fs_readdir_split_128, NULL);
>  }
>  
>  libqos_init(register_virtio_9p_test);


