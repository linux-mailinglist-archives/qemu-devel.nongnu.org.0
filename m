Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD8E51465D9
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Jan 2020 11:35:14 +0100 (CET)
Received: from localhost ([::1]:54320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iuZpR-0004qj-St
	for lists+qemu-devel@lfdr.de; Thu, 23 Jan 2020 05:35:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44041)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iuZoe-0004RW-Mq
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 05:34:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iuZod-0003pA-2R
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 05:34:24 -0500
Received: from 20.mo6.mail-out.ovh.net ([178.32.124.17]:50480)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iuZoc-0003mi-SQ
 for qemu-devel@nongnu.org; Thu, 23 Jan 2020 05:34:23 -0500
Received: from player760.ha.ovh.net (unknown [10.108.42.83])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 2024B1FB68E
 for <qemu-devel@nongnu.org>; Thu, 23 Jan 2020 11:34:19 +0100 (CET)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player760.ha.ovh.net (Postfix) with ESMTPSA id 5E632E8CCEA0;
 Thu, 23 Jan 2020 10:34:18 +0000 (UTC)
Date: Thu, 23 Jan 2020 11:34:15 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH v4 08/11] 9pfs: readdir benchmark
Message-ID: <20200123113415.33ba5b2a@bahia.lan>
In-Reply-To: <b1eae734604cdbda0cecf1fbb7d103dd249642ee.1579567020.git.qemu_oss@crudebyte.com>
References: <cover.1579567019.git.qemu_oss@crudebyte.com>
 <b1eae734604cdbda0cecf1fbb7d103dd249642ee.1579567020.git.qemu_oss@crudebyte.com>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 8550928320850270528
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrvddvgdduiecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepfffhvffukfgjfhfogggtgfesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrvdehfedrvddtkedrvdegkeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejiedtrdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.32.124.17
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

On Tue, 21 Jan 2020 01:23:55 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> This patch is not intended to be merged. It just provides a

Well I like the idea of having such a benchmark available.
It could probably be merged after a few changes...

> temporary benchmark foundation for coneniently A/B comparison
> of the subsequent 9p readdir optimization patches:
> 
> * hw/9pfs/9p-synth: increase amount of simulated files for
>   readdir test to 2000 files.
> 

... the 9p-synth backend could maybe always create this number
of files ?

> * tests/virtio-9p: measure wall time that elapsed between
>   sending T_readdir request and arrival of R_readdir response
>   and print out that measured duration, as well as amount of
>   directory entries received, and the amount of bytes of the
>   response message.
> 

... maybe we should make the printing optional and off by
default so that it doesn't pollute CI logs.

> * tests/virtio-9p: increased msize to 256kiB to allow
>   retrieving all 2000 files (simulated by 9pfs synth driver)
>   with only one T_readdir request.
> 

... always use 256k for both the basic test and a revisited
split test ?

> Running this benchmark is fairly quick & simple and does not
> require any guest OS installation or other prerequisites:
> 
> cd build
> make && make tests/qtest/qos-test
> export QTEST_QEMU_BINARY=x86_64-softmmu/qemu-system-x86_64
> tests/qtest/qos-test -p $(tests/qtest/qos-test -l | grep readdir/basic)
> 
> Since this benchmark uses the 9pfs synth driver, the host
> machine's I/O hardware (SSDs/HDDs) is not relevant for the
> benchmark result, because the synth backend's readdir
> implementation returns immediately (without any blocking I/O
> that would incur with a real-life fs driver) and just returns
> already prepared, simulated directory entries directly from RAM.
> So this benchmark focuses on the efficiency of the 9pfs
> controller code (or top half) for readdir request handling.
> 
> Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> ---
>  hw/9pfs/9p-synth.h           |  2 +-
>  tests/qtest/virtio-9p-test.c | 37 +++++++++++++++++++++++++++++++++++-
>  2 files changed, 37 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/9pfs/9p-synth.h b/hw/9pfs/9p-synth.h
> index 036d7e4a5b..7d6cedcdac 100644
> --- a/hw/9pfs/9p-synth.h
> +++ b/hw/9pfs/9p-synth.h
> @@ -58,7 +58,7 @@ int qemu_v9fs_synth_add_file(V9fsSynthNode *parent, int mode,
>  /* for READDIR test */
>  #define QTEST_V9FS_SYNTH_READDIR_DIR "ReadDirDir"
>  #define QTEST_V9FS_SYNTH_READDIR_FILE "ReadDirFile%d"
> -#define QTEST_V9FS_SYNTH_READDIR_NFILES 100
> +#define QTEST_V9FS_SYNTH_READDIR_NFILES 2000
>  
>  /* Any write to the "FLUSH" file is handled one byte at a time by the
>   * backend. If the byte is zero, the backend returns success (ie, 1),
> diff --git a/tests/qtest/virtio-9p-test.c b/tests/qtest/virtio-9p-test.c
> index e47b286340..d71b37aa6c 100644
> --- a/tests/qtest/virtio-9p-test.c
> +++ b/tests/qtest/virtio-9p-test.c
> @@ -15,6 +15,18 @@
>  #include "libqos/virtio-9p.h"
>  #include "libqos/qgraph.h"
>  
> +/*
> + * to benchmark the real time (not CPU time) that elapsed between start of
> + * a request and arrival of its response
> + */
> +static double wall_time(void)
> +{
> +    struct timeval t;
> +    struct timezone tz;
> +    gettimeofday(&t, &tz);
> +    return t.tv_sec + t.tv_usec * 0.000001;
> +}
> +
>  #define QVIRTIO_9P_TIMEOUT_US (10 * 1000 * 1000)
>  static QGuestAllocator *alloc;
>  
> @@ -36,7 +48,7 @@ static void pci_config(void *obj, void *data, QGuestAllocator *t_alloc)
>      g_free(tag);
>  }
>  
> -#define P9_MAX_SIZE 4096 /* Max size of a T-message or R-message */
> +#define P9_MAX_SIZE (256 * 1024) /* Max size of a T-message or R-message */
>  
>  typedef struct {
>      QTestState *qts;
> @@ -600,12 +612,35 @@ static void fs_readdir(void *obj, void *data, QGuestAllocator *t_alloc)
>      v9fs_req_wait_for_reply(req, NULL);
>      v9fs_rlopen(req, &qid, NULL);
>  
> +    const double start = wall_time();
> +
>      /*
>       * submit count = msize - 11, because 11 is the header size of Rreaddir
>       */
>      req = v9fs_treaddir(v9p, 1, 0, P9_MAX_SIZE - 11, 0);
> +    const double treaddir = wall_time();
>      v9fs_req_wait_for_reply(req, NULL);
> +    const double waitforreply = wall_time();
>      v9fs_rreaddir(req, &count, &nentries, &entries);
> +    const double end = wall_time();
> +
> +    printf("\nTime client spent on sending T_readdir: %fs\n\n",
> +           treaddir - start);
> +
> +    printf("Time client spent for waiting for reply from server: %fs "
> +           "[MOST IMPORTANT]\n", waitforreply - start);
> +    printf("(This is the most important value, because it reflects the time\n"
> +           "the 9p server required to process and return the result of the\n"
> +           "T_readdir request.)\n\n");
> +
> +    printf("Total client time: %fs\n", end - start);
> +    printf("(NOTE: this time is not relevant; this huge time comes from\n"
> +           "inefficient qtest_memread() calls. So you can discard this\n"
> +           "value as a problem of this test client implementation while\n"
> +           "processing the received server T_readdir reply.)\n\n");
> +
> +    printf("Details of response message data: R_readddir nentries=%d "
> +           "rbytes=%d\n", nentries, count);
>  
>      /*
>       * Assuming msize (P9_MAX_SIZE) is large enough so we can retrieve all


