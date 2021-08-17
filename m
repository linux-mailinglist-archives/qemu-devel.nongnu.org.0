Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBF993EEB8A
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Aug 2021 13:23:47 +0200 (CEST)
Received: from localhost ([::1]:52962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mFxC6-0006NH-VQ
	for lists+qemu-devel@lfdr.de; Tue, 17 Aug 2021 07:23:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1mFxB3-0005gc-0P
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 07:22:41 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:35563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1mFxAw-0004jA-Td
 for qemu-devel@nongnu.org; Tue, 17 Aug 2021 07:22:40 -0400
Received: by mail-io1-xd32.google.com with SMTP id a15so8553487iot.2
 for <qemu-devel@nongnu.org>; Tue, 17 Aug 2021 04:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=weAszxCI6DNp49rBZ8mcc+hxAwIRvnpzHlnser31AQk=;
 b=L9z8Ouls374dl4sQLnsNvV2+OZc3aNA5jUyOLey0TbSEKXPpFIyV1W//VtgF6hEIPn
 iSAETlKNkaBRrtUwl2f8kur5nnjvc6nUMJVYdATDKPN/9pR9rwImGIJNyKeMP5LyiYmJ
 hQqVTJB1elCrLQrCHcxrROObmXS73kUdXDW668SLNCdRyaU9XDcDNZ0LZC/BQEW42wOB
 6/JpW92btqybu7uLKVNs6CFW1rTQyXJJIzT8GzkEU7ZntbVZaWV7VMjYsVdKQmb8YC72
 9rePfITQTxhoMLZfnVcHKMc5LAn0gXdXWqNYV/PdoZ1J6beBJpyoETJXi6qeqN0hFjCS
 22pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=weAszxCI6DNp49rBZ8mcc+hxAwIRvnpzHlnser31AQk=;
 b=oaN5pfu2ITx03Oh+cG7cmTVpMit/ZpGb8085zdotsOMQBYOBqcFYbH3PD19AanETt0
 b6d5EkznMKuteuHE7cpiXMOQGLcpdj3WEW8OjKNmSghyxlKULEbe9tMgJhTqZAnLf8Rw
 QdIinfTCrn+TvoAf/0HoR2Z9Ss5/4WHhqqAu1F00yRqsD90Jabm4U3teo5YuBhE13aQ3
 2gfE/xvnR7DIxm/MTBmlXnTdUemeuuvGeaGWO7yeMV2pbfgzh7+yNbduYW0JUwYwXH7p
 S3Td8PSKbvR12L8q2Gb8mmQ1UICUqBnsoPNPrE4dmsYHl1qA4a15dcCKvcrUBujDywzQ
 P5uQ==
X-Gm-Message-State: AOAM531jpWsOCfSsyWjZAJpMZvdGCk2A3noqj4dcqL0KZVsQKjvvRe4F
 7vONQ0Y9EKs97vb+MXosDx7+4xCCRgwrCONE66XVZ8M5
X-Google-Smtp-Source: ABdhPJwNpxM8qhwAXSjakrPgf4uZJWTFw68cytOzHFFEpmg1gjm+xidMnI06xnrArwHul7xo6EK9NEMuIYh6x0sHz04=
X-Received: by 2002:a05:6638:3048:: with SMTP id
 u8mr2460898jak.91.1629199352715; 
 Tue, 17 Aug 2021 04:22:32 -0700 (PDT)
MIME-Version: 1.0
References: <20210809164559.66638-1-ma.mandourr@gmail.com>
In-Reply-To: <20210809164559.66638-1-ma.mandourr@gmail.com>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Tue, 17 Aug 2021 13:22:21 +0200
Message-ID: <CAD-LL6iv8n-1Jo4UJ6EQxLEu5a13VK_B1RPK3VMZiyPrX_dgAg@mail.gmail.com>
Subject: Re: [PATCH v3] blog: add a post for the new TCG cache modelling plugin
To: "open list:All patches CC here" <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="000000000000afdc4805c9bf8858"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=ma.mandourr@gmail.com; helo=mail-io1-xd32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000afdc4805c9bf8858
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

CC Stefan Hajnoczi and Thomas Huth

On Mon, Aug 9, 2021 at 6:46 PM Mahmoud Mandour <ma.mandourr@gmail.com>
wrote:

> This post introduces the new TCG plugin `cache` that's used for cache
> modelling. This plugin is a part of my GSoC 2021 participation.
>
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>
> v2 -> v3:
>     Added a prologue briefly explaining the importance of caching.
>
>     Explained the multi-threaded linux-user appoximation we use briefly i=
n
> the
>     Mult-core caching section.
>
>     Dropped using the directory "./x86_64-linux-user" from CLI commands.
>
>     Updated the list of patches to include all patches posted related to
> the
>     cache plugin.
>
> v1 -> v2:
>     Elaborated some more in the introduction and broken up some
>     sentences.
>
>     Changed the example of blocked matrix multiplication to a simpler
>     solution that requires less explanation since matrix multiplication
>     itself is out of the scope of the post.
>
>     Added the code for the `mm` function but did not directly give away
>     the cache-problematic portion and preferred to "investigate" the
>     problem since it's the job of the plugin to help knowing where the
>     problem is.
>
>     Added an epilogue in which I summarize the work and the patches
>     posted until now.
>
>  .../2021-08-09-tcg-cache-modelling-plugin.md  | 288 ++++++++++++++++++
>  screenshots/2021-06-17-cache-structure.png    | Bin 0 -> 19675 bytes
>  2 files changed, 288 insertions(+)
>  create mode 100644 _posts/2021-08-09-tcg-cache-modelling-plugin.md
>  create mode 100644 screenshots/2021-06-17-cache-structure.png
>
> diff --git a/_posts/2021-08-09-tcg-cache-modelling-plugin.md
> b/_posts/2021-08-09-tcg-cache-modelling-plugin.md
> new file mode 100644
> index 0000000..ae75c93
> --- /dev/null
> +++ b/_posts/2021-08-09-tcg-cache-modelling-plugin.md
> @@ -0,0 +1,288 @@
> +---
> +layout: post
> +title:  "Cache Modelling TCG Plugin"
> +date:   2021-08-09 15:00:00 +0200
> +author: Mahmoud Mandour
> +categories: [TCG plugins, GSOC]
> +---
> +
> +[Caches](https://en.wikipedia.org/wiki/CPU_cache) are a key way that
> enables
> +modern CPUs to keep running at full speed by avoiding the need to fetch
> data
> +and instructions from the comparatively slow system memory. As a result
> +understanding cache behaviour is a key part of performance optimisation.
> +
> +TCG plugins provide means to instrument generated code for both user-mod=
e
> and
> +full system emulation. This includes the ability to intercept every memo=
ry
> +access and instruction execution. This post introduces a new TCG plugin
> that's
> +used to simulate configurable L1 separate instruction cache and data
> cache.
> +
> +While different microarchitectures often have different approaches at th=
e
> very
> +low level, the core concepts of caching are universal. As QEMU is not a
> +microarchitectural emulator we model an ideal caching system with a few
> simple
> +parameters. By doing so, we can adequately simulate the behaviour of L1
> private
> +(per-core) caches.
> +
> +## Overview
> +
> +The plugin simulates how L1 user-configured caches would behave when
> given a
> +working set defined by a program in user-mode, or system-wide working se=
t.
> +Subsequently, it logs performance statistics along with the most N
> +cache-thrashing instructions.
> +
> +### Configurability
> +
> +The plugin is configurable in terms of:
> +
> +* icache size parameters: `icachesize`, `iblksize`, `iassoc`, All of
> which take
> +  a numeric value
> +* dcache size parameters: `dcachesize`, `dblksize`, `dassoc`. All of
> which take
> +  a numeric value
> +* Eviction policy: `evict=3Dlru|rand|fifo`
> +* How many top-most thrashing instructions to log: `limit=3DTOP_N`
> +* How many core caches to keep track of: `cores=3DN_CORES`
> +
> +### Multicore caching
> +
> +Multicore caching is achieved by having independent L1 caches for each
> available
> +core.
> +
> +In __full-system emulation__, the number of available vCPUs is known to
> the
> +plugin at plugin installation time, so separate caches are maintained fo=
r
> those.
> +
> +In __user-space emulation__, the index of the vCPU initiating memory
> access
> +monotonically increases and is limited with however much the kernel allo=
ws
> +creating. The approach used is that we allocate a static number of
> caches, and
> +fit all memory accesses into those cores. This approximation is
> sufficiently
> +similar to real systems since having more threads than cores will result
> in
> +interleaving those threads between the available cores so they might
> thrash each
> +other anyway.
> +
> +## Design and implementation
> +
> +### General structure
> +
> +A generic cache data structure, `Cache`, is used to model either an
> icache or
> +dcache. For each known core, the plugin maintains an icache and a dcache=
.
> On a
> +memory access coming from a core, the corresponding cache is interrogate=
d.
> +
> +Each cache has a number of cache sets that are used to store the actual
> cached
> +locations alongside metadata that backs eviction algorithms. The
> structure of a
> +cache with `n` sets, and `m` blocks per sets is summarized in the
> following
> +figure:
> +
> +![cache structure](/screenshots/2021-06-17-cache-structure.png)
> +
> +### Eviction algorithms
> +
> +The plugin supports three eviction algorithms:
> +
> +* Random eviction
> +* Least recently used (LRU)
> +* FIFO eviction
> +
> +#### Random eviction
> +
> +On a cache miss that requires eviction, a randomly chosen block is
> evicted to
> +make room for the newly-fetched block.
> +
> +Using random eviction effectively requires no metadata for each set.
> +
> +#### Least recently used (LRU)
> +
> +For each set, a generation number is maintained that is incremented on
> each
> +memory access and. The current generation number is assigned to the bloc=
k
> +currently being accessed. On a cache miss, the block with the least
> generation
> +number is evicted.
> +
> +#### FIFO eviction
> +
> +A FIFO queue instance is maintained for each set. On a cache miss, the
> evicted
> +block is the first-in block, and the newly-fetched block is enqueued as
> the
> +last-in block.
> +
> +## Usage
> +
> +Now a simple example usage of the plugin is demonstrated by running a
> program
> +that does matrix multiplication, and how the plugin helps identify code
> that
> +thrashes the cache.
> +
> +A program, `test_mm` uses the following function to carry out matrix
> +multiplication:
> +
> +```
> +void mm(int n, int m1[n][n], int m2[n][n], int res[n][n])
> +{
> +    for (int i =3D 0; i < n; i++) {
> +        for (int j =3D 0; j < n; j++) {
> +            int sum =3D 0;
> +            for (int k =3D 0; k < n; k++) {
> +                int op1 =3D m1[i][k];
> +                int op2 =3D m2[k][j];
> +                sum +=3D op1 * op2;
> +            }
> +            res[i][j] =3D sum;
> +        }
> +    }
> +}
> +```
> +
> +Running `mm_test` inside QEMU using the following command:
> +
> +```
> +./qemu-x86_64 $(QEMU_ARGS) \
> +  -plugin
> ./contrib/plugins/libcache.so,dcachesize=3D8192,dassoc=3D4,dblksize=3D64,=
\
> +      icachesize=3D8192,iassoc=3D4,iblksize=3D64 \
> +  -d plugin \
> +  -D matmul.log \
> +  ./mm_test
> +```
> +
> +The preceding command will run QEMU and attach the plugin with the
> following
> +configuration:
> +
> +* dcache: cache size =3D 8KBs, associativity =3D 4, block size =3D 64B.
> +* icache: cache size =3D 8KBs, associativity =3D 4, block size =3D 64B.
> +* Default eviction policy is LRU (used for both caches).
> +* Default number of cores is 1.
> +
> +The following data is logged in `matmul.log`:
> +
> +```
> +core #, data accesses, data misses, dmiss rate, insn accesses, insn
> misses, imiss rate
> +0       4908419        274545          5.5933%  8002457        1005
>       0.0126%
> +
> +address, data misses, instruction
> +0x4000001244 (mm), 262138, movl (%rdi, %rsi, 4), %esi
> +0x400000121c (mm), 5258, movl (%rdi, %rsi, 4), %esi
> +0x4000001286 (mm), 4096, movl %edi, (%r8, %rsi, 4)
> +0x400000199c (main), 257, movl %edx, (%rax, %rcx, 4)
> +
> +...
> +```
> +
> +We can observe two things from the logs:
> +
> +* The most cache-thrashing instructions belong to a symbol called `mm`,
> which
> +    happens to be the matrix multiplication function.
> +* Some array-indexing instructions are generating the greatest share of
> data
> +    misses.
> +
> +`test_mm` does a bunch of other operations other than matrix
> multiplication.
> +However, Using the plugin data, we can narrow our investigation space to
> `mm`,
> +which happens to be generating about 98% of the overall number of misses=
.
> +
> +Now we need to find out why is the instruction at address `0x4000001224`
> +thrashing the cache. Looking at the disassembly of the program, using
> +`objdump -Sl test_mm`:
> +
> +```
> +/path/to/test_mm.c:11 (discriminator 3)
> +                int op2 =3D m2[k][j];  <- The line of code we're interes=
ted
> in
> +    1202:      8b 75 c0                mov    -0x40(%rbp),%esi
> +    1205:      48 63 fe                movslq %esi,%rdi
> +    1208:      48 63 f2                movslq %edx,%rsi
> +    120b:      48 0f af f7             imul   %rdi,%rsi
> +    120f:      48 8d 3c b5 00 00 00    lea    0x0(,%rsi,4),%rdi
> +    1216:      00
> +    1217:      48 8b 75 a8             mov    -0x58(%rbp),%rsi
> +    121b:      48 01 f7                add    %rsi,%rdi
> +    121e:      8b 75 c8                mov    -0x38(%rbp),%esi
> +    1221:      48 63 f6                movslq %esi,%rsi
> +    1224:      8b 34 b7                mov    (%rdi,%rsi,4),%esi
> +                                       ^^^^^^^^^^^^^^^^^^^^^^^^^
> +    1227:      89 75 d4                mov    %esi,-0x2c(%rbp)
> +```
> +
> +It can be seen that the most problematic instruction is associated with
> loading
> +`m2[k][j]`. This happens because we're traversing `m2` in a column-wise
> order.
> +So if the matrix `m2` is larger than the data cache, we end up with
> fetching
> +blocks that we only use one integer from and not use again before gettin=
g
> +evicted.
> +
> +A simple solution to this problem is to [transpose](
> https://en.wikipedia.org/wiki/Transpose)
> +the second matrix and access it in a row-wise order.
> +
> +By editing the program to transpose `m2` before calling `mm` and run it
> inside
> +QEMU with the plugin attached and using the same configuration as
> previously,
> +the following data is logged in `matmul.log`:
> +
> +```
> +core #, data accesses, data misses, dmiss rate, insn accesses, insn
> misses, imiss rate
> +0       4998994        24235           0.4848%  8191937        1009
>       0.0123%
> +
> +address, data misses, instruction
> +0x4000001244 (mm), 16447, movl (%rdi, %rsi, 4), %esi
> +0x4000001359 (tran), 3994, movl (%rcx, %rdx, 4), %ecx
> +0x4000001aa7 (main), 257, movl %edx, (%rax, %rcx, 4)
> +0x4000001a72 (main), 257, movl %ecx, (%rax, %rdx, 4)
> +
> +...
> +```
> +
> +It can be seen that a minor number of misses is generated at
> transposition time
> +in `tran`. The rest of the matrix multiplication is carried out using th=
e
> same
> +procedure but to multiply `m1[i][k]` by `m2[j][k]`. So `m2` is traversed
> +row-wise and hence utilized cache space much more optimally.
> +
> +### Multi-core caching
> +
> +The plugin accepts a `cores=3DN_CORES` argument that represents the numb=
er
> of
> +cores that the plugin must keep track of. Memory accesses generated by
> excess
> +threads will be served through the available core caches. The model is a=
n
> +approximation, as described, and is most-akin to idealized behaviour whe=
n
> the
> +number of threads generated by the program is less than cores available,
> +otherwise inter-thread thrashing will invariably occur.
> +
> +An example usage of the plugin using the `cores` argument to use 4
> per-core
> +caches against a multithreaded program:
> +
> +```
> +./qemu-x86_64 $(QEMU_ARGS) \
> +    -plugin ./contrib/plugins/libcache.so,cores=3D4 \
> +    -d plugin \
> +    -D logfile \
> +    ./threaded_prog
> +```
> +
> +This reports out the following:
> +
> +```
> +core #, data accesses, data misses, dmiss rate, insn accesses, insn
> misses, imiss rate
> +0       76739          4195          5.411666%  242616         1555
>       0.6409%
> +1       29029          932           3.211106%  70939          988
>      1.3927%
> +2       6218           285           4.511835%  15702          382
>      2.4328%
> +3       6608           297           4.411946%  16342          384
>      2.3498%
> +sum     118594         5709          4.811139%  345599         3309
>       0.9575%
> +
> +...
> +```
> +
> +## Conclusion
> +
> +By emulating simple configurations of icache and dcache we can gain
> insights
> +into how a working set is utilizing cache memory. Simplicity is sought
> and L1
> +cache is emphasized since its under-utilization can be severe to the
> overall
> +system performance.
> +
> +This plugin is made as part of my GSoC participation for the year 2021
> under the
> +mentorship of Alex Benn=C3=A9e.
> +
> +List of posted patches related to the plugin:
> +
> +* [[PATCH v4 0/5] plugins: New TCG plugin for cache modelling](
> https://patchew.org/QEMU/20210623125458.450462-1-ma.mandourr@gmail.com/)
> +* [[PATCH v4 1/5] plugins: Added a new cache modelling plugin](
> https://patchew.org/QEMU/20210623125458.450462-1-ma.mandourr@gmail.com/20=
210623125458.450462-2-ma.mandourr@gmail.com/
> )
> +* [[PATCH v4 2/5] plugins/cache: Enable cache parameterization](
> https://patchew.org/QEMU/20210623125458.450462-1-ma.mandourr@gmail.com/20=
210623125458.450462-3-ma.mandourr@gmail.com/
> )
> +* [[PATCH v4 3/5] plugins/cache: Added FIFO and LRU eviction policies](
> https://patchew.org/QEMU/20210623125458.450462-1-ma.mandourr@gmail.com/20=
210623125458.450462-4-ma.mandourr@gmail.com/
> )
> +* [[PATCH v4 4/5] docs/devel: Added cache plugin to the plugins docs](
> https://patchew.org/QEMU/20210623125458.450462-1-ma.mandourr@gmail.com/20=
210623125458.450462-5-ma.mandourr@gmail.com/#20210628053808.17422-1-ma.mand=
ourr@gmail.com
> )
> +* [[PATCH v5] MAINTAINERS: Added myself as a reviewer for TCG Plugins](
> https://patchew.org/QEMU/20210623125458.450462-1-ma.mandourr@gmail.com/20=
210623125458.450462-6-ma.mandourr@gmail.com/#20210707092756.414242-1-ma.man=
dourr@gmail.com
> )
> +* [[PATCH 1/6] plugins/cache: Fixed a bug with destroying FIFO metadata]=
(
> https://patchew.org/QEMU/20210714172151.8494-1-ma.mandourr@gmail.com/2021=
0714172151.8494-2-ma.mandourr@gmail.com/
> )
> +* [[PATCH 2/6] plugins/cache: limited the scope of a mutex lock](
> https://patchew.org/QEMU/20210714172151.8494-1-ma.mandourr@gmail.com/2021=
0714172151.8494-3-ma.mandourr@gmail.com/
> )
> +* [[PATCH 6/6] plugins/cache: Fixed "function decl. is not a prototype"
> warnings](
> https://patchew.org/QEMU/20210714172151.8494-1-ma.mandourr@gmail.com/2021=
0714172151.8494-7-ma.mandourr@gmail.com/
> )
> +* [[PATCH v5 0/2] plugins/cache: multicore cache modelling](
> https://patchew.org/QEMU/20210803151301.123581-1-ma.mandourr@gmail.com/)
> +* [[PATCH v5 1/2] plugins/cache: supported multicore cache modelling](
> https://patchew.org/QEMU/20210803151301.123581-1-ma.mandourr@gmail.com/20=
210803151301.123581-3-ma.mandourr@gmail.com/
> )
> +
> +The first series, (plugins: New TCG plugin for cache modelling), along
> with the
> +bug fixes patches are already merged to the QEMU main tree, the remainin=
g
> +patches are merged to the [plugins/next](
> https://github.com/stsquad/qemu/tree/plugins/next)
> +tree, awaiting merging to the main tree, since we're in a release cycle
> as of
> +the time of posting.
> diff --git a/screenshots/2021-06-17-cache-structure.png
> b/screenshots/2021-06-17-cache-structure.png
> new file mode 100644
> index
> 0000000000000000000000000000000000000000..82a9dc07710e3d9be738d20c675c69a=
a90a48942
> GIT binary patch
> literal 19675
> zcmeHv2T)Vpw=3DYdV4NU|hEfj%Ik*4$(6ciBwMUYNJM0!U$1S|wailU$*f=3DH3B(mN6n
> z1*I27T0jg%AoKtsdHV#v|JD2Mo4NPRn>Vj~GYrEV&e><}b$0eyzp`@soS`nu9^O4P
> zG&C%Fr*({JXz1x_XlNOj8Nm_1%BeRrG(t3bI>$`{ZRhIt_L`ZNts}Wi{@P~KJKDxq
> zoLn36kt1w(mi<_rPV>R@qwn;y?_M~>qOf>0?%D~dT7rx50Ug^D=3DXF$WSNNs>1;dz`
> zFn8D1`^(ct3K=3D&(qdaQEKW7S*_Wi7~KIlqWTUUC2K;Tk1{@L;|ylsQR`XpZbCL41E
> z&2K+iQoG%Z+Y0W<|8@-eza3nQ^Uo6vc3*<ObjICN{Nv0^a4oj~%6VE7`-svUVUMH9
> zMibf5pR{Ngz|Ro|S(y3M@x63HG;~3njj{;=3DVeA6XZ5|lXV6~>jv_Q(}gkEt(da`%H
> zMF#IjU)|SLaeGQsMD<~`v~b4f=3DqY!RO>T~DWCo$l3+Yi$-+3#VEW=3D@=3Dt)mX(*U=3D#=
b
> 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
k
> z_)JGPRmHEokz7EZ1)N+zJjG%=3Dj2BdGo-QjRXCPf)Fm;q2+X%Hj&kx)r@<b3*BltWj
> zBN<uw;o&&U=3Dq@60BK|h2p8x2T(}DLMp-9k2bQ*XZ_BM$4fej49b2G?kOc%q*Cdfa+
> zHm1fzia7;o=3DwUyOrR}~!gLHXE4kV7X#1M<#Zm*9bqGH#6mZr3>-Ep%Boq0!9PfL1p
> z3}XZUiIU{)Owp@5vu&|iWjGtFiyXKO+T${}f4WP=3DcI^17i5DcmRswtn1sK|R2H#aX
> z(5;mwnfwT+d;f-#L@qK^<#gV%4By|&e@;$#S}xDY5m?R4VjqL|xilBTIW%cC-w+Ev
> zzLo6{*HBLf$_wRSf#*z!Ae(t+H?8w@z^lSh;0$4seLxy~z8_vdwuuyFKLn0Ul!6OY
> z;0T3Y8vnV@DnM@OMT%)Y0#~Og+brXtQVYD6?_2yvHvV7P_w~O)2{&>XuppUk1VHa_
> zQ{}ReBQA<5BTqpSXd!EKg*A}j(&RN^XzwtFUuEX(mp#}Brjx`ENjr|tX6YiazimHD
> zY1|JtZwN5IV<*hxAKB}>`NkXFr+3TK2eqFa{G~^lkPj_YT}~6)^(dlIm8x>GWzj{#
> zcjUh2S5fY(JA!!MESnDhajJsHb8pYt;}MW(i8#YRC$}T9#@MlZo7s^O^9B&n%GY;<
> zXc4YQ*J+|?SG2S_K7?s})~JtiVLVvEK~=3DYDSiW@bsOBszh>umARMmWbH`Y%3R~`I3
> zh5lm|iZso9D2i6zTAPz#`>AeQK|b^#-jG@|S4qGyECxG;aFhq@K@9b4U2GX@d3-(5
> zwn0rs8asWy!6vj8!8?7v9r>(;L<w;F<nQfT&mM7@+AuqXchqSp9x`gL?qv#U1#&!M
> z3(LgNdT^{tGX#$ds}E{nLdP0_jB#ng<o$CKY=3D)UHEt^!_!6$pRr{s{FghkjpIU9qE
> z9htJ&B28vBqG;2C-|qdR!`dVcG?lkLgwg)d<{iNX+Q&8dal8KLyFRQ7y0ItEL`D43
> zKHi7{SwzGU=3D>F*EekcmMynV#98~<oaAJeA6MzHAy(*DsW-U_~;>0H%);Y)w?a}$Ik
> z>>4qmzrJB<=3DbLvTv?if1N3#CNF8jwUh(O05!*baE*%|Kxdeu#et}w&@m_;ZUfq-L{
> z`6IA%Dxe4cu-Q=3Dt*dMdd1S1f=3DZu0yQ*h_wpoQIMJ=3Doo*W1ucSZHYyU3dYgg&?tGfa
> zGwg7n2)K8bICk(H=3D8(G1@W+MhUSb3ay_lZ=3DYgeUjyTF&0(deBt)G0b~>H2>IKV3-k
>
> literal 0
> HcmV?d00001
>
> --
> 2.25.1
>
>

--000000000000afdc4805c9bf8858
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>CC Stefan Hajnoczi and Thomas Huth</div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 9, 2021=
 at 6:46 PM Mahmoud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail.com">ma=
.mandourr@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">This post introduces the new TCG plugin `cache` that&#39=
;s used for cache<br>
modelling. This plugin is a part of my GSoC 2021 participation.<br>
<br>
Signed-off-by: Mahmoud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail.com"=
 target=3D"_blank">ma.mandourr@gmail.com</a>&gt;<br>
---<br>
<br>
v2 -&gt; v3:<br>
=C2=A0 =C2=A0 Added a prologue briefly explaining the importance of caching=
.<br>
<br>
=C2=A0 =C2=A0 Explained the multi-threaded linux-user appoximation we use b=
riefly in the<br>
=C2=A0 =C2=A0 Mult-core caching section.<br>
<br>
=C2=A0 =C2=A0 Dropped using the directory &quot;./x86_64-linux-user&quot; f=
rom CLI commands.<br>
<br>
=C2=A0 =C2=A0 Updated the list of patches to include all patches posted rel=
ated to the<br>
=C2=A0 =C2=A0 cache plugin.=C2=A0 =C2=A0 <br>
<br>
v1 -&gt; v2:<br>
=C2=A0 =C2=A0 Elaborated some more in the introduction and broken up some<b=
r>
=C2=A0 =C2=A0 sentences.<br>
<br>
=C2=A0 =C2=A0 Changed the example of blocked matrix multiplication to a sim=
pler<br>
=C2=A0 =C2=A0 solution that requires less explanation since matrix multipli=
cation<br>
=C2=A0 =C2=A0 itself is out of the scope of the post.<br>
<br>
=C2=A0 =C2=A0 Added the code for the `mm` function but did not directly giv=
e away<br>
=C2=A0 =C2=A0 the cache-problematic portion and preferred to &quot;investig=
ate&quot; the<br>
=C2=A0 =C2=A0 problem since it&#39;s the job of the plugin to help knowing =
where the<br>
=C2=A0 =C2=A0 problem is.<br>
<br>
=C2=A0 =C2=A0 Added an epilogue in which I summarize the work and the patch=
es<br>
=C2=A0 =C2=A0 posted until now. <br>
<br>
=C2=A0.../2021-08-09-tcg-cache-modelling-plugin.md=C2=A0 | 288 ++++++++++++=
++++++<br>
=C2=A0screenshots/2021-06-17-cache-structure.png=C2=A0 =C2=A0 | Bin 0 -&gt;=
 19675 bytes<br>
=C2=A02 files changed, 288 insertions(+)<br>
=C2=A0create mode 100644 _posts/2021-08-09-tcg-cache-modelling-plugin.md<br=
>
=C2=A0create mode 100644 screenshots/2021-06-17-cache-structure.png<br>
<br>
diff --git a/_posts/2021-08-09-tcg-cache-modelling-plugin.md b/_posts/2021-=
08-09-tcg-cache-modelling-plugin.md<br>
new file mode 100644<br>
index 0000000..ae75c93<br>
--- /dev/null<br>
+++ b/_posts/2021-08-09-tcg-cache-modelling-plugin.md<br>
@@ -0,0 +1,288 @@<br>
+---<br>
+layout: post<br>
+title:=C2=A0 &quot;Cache Modelling TCG Plugin&quot;<br>
+date:=C2=A0 =C2=A02021-08-09 15:00:00 +0200<br>
+author: Mahmoud Mandour<br>
+categories: [TCG plugins, GSOC]<br>
+---<br>
+<br>
+[Caches](<a href=3D"https://en.wikipedia.org/wiki/CPU_cache" rel=3D"norefe=
rrer" target=3D"_blank">https://en.wikipedia.org/wiki/CPU_cache</a>) are a =
key way that enables<br>
+modern CPUs to keep running at full speed by avoiding the need to fetch da=
ta<br>
+and instructions from the comparatively slow system memory. As a result<br=
>
+understanding cache behaviour is a key part of performance optimisation.<b=
r>
+<br>
+TCG plugins provide means to instrument generated code for both user-mode =
and<br>
+full system emulation. This includes the ability to intercept every memory=
<br>
+access and instruction execution. This post introduces a new TCG plugin th=
at&#39;s<br>
+used to simulate configurable L1 separate instruction cache and data cache=
.<br>
+<br>
+While different microarchitectures often have different approaches at the =
very<br>
+low level, the core concepts of caching are universal. As QEMU is not a<br=
>
+microarchitectural emulator we model an ideal caching system with a few si=
mple<br>
+parameters. By doing so, we can adequately simulate the behaviour of L1 pr=
ivate<br>
+(per-core) caches.<br>
+<br>
+## Overview<br>
+<br>
+The plugin simulates how L1 user-configured caches would behave when given=
 a<br>
+working set defined by a program in user-mode, or system-wide working set.=
<br>
+Subsequently, it logs performance statistics along with the most N<br>
+cache-thrashing instructions.<br>
+<br>
+### Configurability<br>
+<br>
+The plugin is configurable in terms of:<br>
+<br>
+* icache size parameters: `icachesize`, `iblksize`, `iassoc`, All of which=
 take<br>
+=C2=A0 a numeric value<br>
+* dcache size parameters: `dcachesize`, `dblksize`, `dassoc`. All of which=
 take<br>
+=C2=A0 a numeric value<br>
+* Eviction policy: `evict=3Dlru|rand|fifo`<br>
+* How many top-most thrashing instructions to log: `limit=3DTOP_N`<br>
+* How many core caches to keep track of: `cores=3DN_CORES`<br>
+<br>
+### Multicore caching<br>
+<br>
+Multicore caching is achieved by having independent L1 caches for each ava=
ilable<br>
+core.<br>
+<br>
+In __full-system emulation__, the number of available vCPUs is known to th=
e<br>
+plugin at plugin installation time, so separate caches are maintained for =
those.<br>
+<br>
+In __user-space emulation__, the index of the vCPU initiating memory acces=
s<br>
+monotonically increases and is limited with however much the kernel allows=
<br>
+creating. The approach used is that we allocate a static number of caches,=
 and<br>
+fit all memory accesses into those cores. This approximation is sufficient=
ly<br>
+similar to real systems since having more threads than cores will result i=
n<br>
+interleaving those threads between the available cores so they might thras=
h each<br>
+other anyway.<br>
+<br>
+## Design and implementation<br>
+<br>
+### General structure<br>
+<br>
+A generic cache data structure, `Cache`, is used to model either an icache=
 or<br>
+dcache. For each known core, the plugin maintains an icache and a dcache. =
On a<br>
+memory access coming from a core, the corresponding cache is interrogated.=
<br>
+<br>
+Each cache has a number of cache sets that are used to store the actual ca=
ched<br>
+locations alongside metadata that backs eviction algorithms. The structure=
 of a<br>
+cache with `n` sets, and `m` blocks per sets is summarized in the followin=
g<br>
+figure:<br>
+<br>
+![cache structure](/screenshots/2021-06-17-cache-structure.png)<br>
+<br>
+### Eviction algorithms<br>
+<br>
+The plugin supports three eviction algorithms:<br>
+<br>
+* Random eviction<br>
+* Least recently used (LRU)<br>
+* FIFO eviction<br>
+<br>
+#### Random eviction<br>
+<br>
+On a cache miss that requires eviction, a randomly chosen block is evicted=
 to<br>
+make room for the newly-fetched block.<br>
+<br>
+Using random eviction effectively requires no metadata for each set.<br>
+<br>
+#### Least recently used (LRU)<br>
+<br>
+For each set, a generation number is maintained that is incremented on eac=
h<br>
+memory access and. The current generation number is assigned to the block<=
br>
+currently being accessed. On a cache miss, the block with the least genera=
tion<br>
+number is evicted.<br>
+<br>
+#### FIFO eviction<br>
+<br>
+A FIFO queue instance is maintained for each set. On a cache miss, the evi=
cted<br>
+block is the first-in block, and the newly-fetched block is enqueued as th=
e<br>
+last-in block.<br>
+<br>
+## Usage<br>
+<br>
+Now a simple example usage of the plugin is demonstrated by running a prog=
ram<br>
+that does matrix multiplication, and how the plugin helps identify code th=
at<br>
+thrashes the cache.<br>
+<br>
+A program, `test_mm` uses the following function to carry out matrix<br>
+multiplication:<br>
+<br>
+```<br>
+void mm(int n, int m1[n][n], int m2[n][n], int res[n][n])<br>
+{<br>
+=C2=A0 =C2=A0 for (int i =3D 0; i &lt; n; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (int j =3D 0; j &lt; n; j++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int sum =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 for (int k =3D 0; k &lt; n; k++)=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int op1 =3D m1[i][=
k];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int op2 =3D m2[k][=
j];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sum +=3D op1 * op2=
;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 res[i][j] =3D sum;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+```<br>
+<br>
+Running `mm_test` inside QEMU using the following command:<br>
+<br>
+```<br>
+./qemu-x86_64 $(QEMU_ARGS) \<br>
+=C2=A0 -plugin ./contrib/plugins/libcache.so,dcachesize=3D8192,dassoc=3D4,=
dblksize=3D64,\<br>
+=C2=A0 =C2=A0 =C2=A0 icachesize=3D8192,iassoc=3D4,iblksize=3D64 \<br>
+=C2=A0 -d plugin \<br>
+=C2=A0 -D matmul.log \<br>
+=C2=A0 ./mm_test<br>
+```<br>
+<br>
+The preceding command will run QEMU and attach the plugin with the followi=
ng<br>
+configuration:<br>
+<br>
+* dcache: cache size =3D 8KBs, associativity =3D 4, block size =3D 64B.<br=
>
+* icache: cache size =3D 8KBs, associativity =3D 4, block size =3D 64B.<br=
>
+* Default eviction policy is LRU (used for both caches).<br>
+* Default number of cores is 1.<br>
+<br>
+The following data is logged in `matmul.log`:<br>
+<br>
+```<br>
+core #, data accesses, data misses, dmiss rate, insn accesses, insn misses=
, imiss rate<br>
+0=C2=A0 =C2=A0 =C2=A0 =C2=A04908419=C2=A0 =C2=A0 =C2=A0 =C2=A0 274545=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 5.5933%=C2=A0 8002457=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 1005=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0.0126%<br>
+<br>
+address, data misses, instruction<br>
+0x4000001244 (mm), 262138, movl (%rdi, %rsi, 4), %esi<br>
+0x400000121c (mm), 5258, movl (%rdi, %rsi, 4), %esi<br>
+0x4000001286 (mm), 4096, movl %edi, (%r8, %rsi, 4)<br>
+0x400000199c (main), 257, movl %edx, (%rax, %rcx, 4)<br>
+<br>
+...<br>
+```<br>
+<br>
+We can observe two things from the logs:<br>
+<br>
+* The most cache-thrashing instructions belong to a symbol called `mm`, wh=
ich<br>
+=C2=A0 =C2=A0 happens to be the matrix multiplication function.<br>
+* Some array-indexing instructions are generating the greatest share of da=
ta<br>
+=C2=A0 =C2=A0 misses.<br>
+<br>
+`test_mm` does a bunch of other operations other than matrix multiplicatio=
n.<br>
+However, Using the plugin data, we can narrow our investigation space to `=
mm`,<br>
+which happens to be generating about 98% of the overall number of misses.<=
br>
+<br>
+Now we need to find out why is the instruction at address `0x4000001224`<b=
r>
+thrashing the cache. Looking at the disassembly of the program, using<br>
+`objdump -Sl test_mm`:<br>
+<br>
+```<br>
+/path/to/test_mm.c:11 (discriminator 3)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int op2 =3D m2[k][=
j];=C2=A0 &lt;- The line of code we&#39;re interested in<br>
+=C2=A0 =C2=A0 1202:=C2=A0 =C2=A0 =C2=A0 8b 75 c0=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 -0x40(%rbp),%esi<br>
+=C2=A0 =C2=A0 1205:=C2=A0 =C2=A0 =C2=A0 48 63 fe=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 movslq %esi,%rdi<br>
+=C2=A0 =C2=A0 1208:=C2=A0 =C2=A0 =C2=A0 48 63 f2=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 movslq %edx,%rsi<br>
+=C2=A0 =C2=A0 120b:=C2=A0 =C2=A0 =C2=A0 48 0f af f7=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0imul=C2=A0 =C2=A0%rdi,%rsi<br>
+=C2=A0 =C2=A0 120f:=C2=A0 =C2=A0 =C2=A0 48 8d 3c b5 00 00 00=C2=A0 =C2=A0 =
lea=C2=A0 =C2=A0 0x0(,%rsi,4),%rdi<br>
+=C2=A0 =C2=A0 1216:=C2=A0 =C2=A0 =C2=A0 00<br>
+=C2=A0 =C2=A0 1217:=C2=A0 =C2=A0 =C2=A0 48 8b 75 a8=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0mov=C2=A0 =C2=A0 -0x58(%rbp),%rsi<br>
+=C2=A0 =C2=A0 121b:=C2=A0 =C2=A0 =C2=A0 48 01 f7=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 add=C2=A0 =C2=A0 %rsi,%rdi<br>
+=C2=A0 =C2=A0 121e:=C2=A0 =C2=A0 =C2=A0 8b 75 c8=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 -0x38(%rbp),%esi<br>
+=C2=A0 =C2=A0 1221:=C2=A0 =C2=A0 =C2=A0 48 63 f6=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 movslq %esi,%rsi<br>
+=C2=A0 =C2=A0 1224:=C2=A0 =C2=A0 =C2=A0 8b 34 b7=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 (%rdi,%rsi,4),%esi<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^^^^^^^^^=
^^^^^^^^^^^^^^^^<br>
+=C2=A0 =C2=A0 1227:=C2=A0 =C2=A0 =C2=A0 89 75 d4=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 mov=C2=A0 =C2=A0 %esi,-0x2c(%rbp)<br>
+```<br>
+<br>
+It can be seen that the most problematic instruction is associated with lo=
ading<br>
+`m2[k][j]`. This happens because we&#39;re traversing `m2` in a column-wis=
e order.<br>
+So if the matrix `m2` is larger than the data cache, we end up with fetchi=
ng<br>
+blocks that we only use one integer from and not use again before getting<=
br>
+evicted.<br>
+<br>
+A simple solution to this problem is to [transpose](<a href=3D"https://en.=
wikipedia.org/wiki/Transpose" rel=3D"noreferrer" target=3D"_blank">https://=
en.wikipedia.org/wiki/Transpose</a>)<br>
+the second matrix and access it in a row-wise order.<br>
+<br>
+By editing the program to transpose `m2` before calling `mm` and run it in=
side<br>
+QEMU with the plugin attached and using the same configuration as previous=
ly,<br>
+the following data is logged in `matmul.log`:<br>
+<br>
+```<br>
+core #, data accesses, data misses, dmiss rate, insn accesses, insn misses=
, imiss rate<br>
+0=C2=A0 =C2=A0 =C2=A0 =C2=A04998994=C2=A0 =C2=A0 =C2=A0 =C2=A0 24235=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A00.4848%=C2=A0 8191937=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 1009=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0.0123%<br>
+<br>
+address, data misses, instruction<br>
+0x4000001244 (mm), 16447, movl (%rdi, %rsi, 4), %esi<br>
+0x4000001359 (tran), 3994, movl (%rcx, %rdx, 4), %ecx<br>
+0x4000001aa7 (main), 257, movl %edx, (%rax, %rcx, 4)<br>
+0x4000001a72 (main), 257, movl %ecx, (%rax, %rdx, 4)<br>
+<br>
+...<br>
+```<br>
+<br>
+It can be seen that a minor number of misses is generated at transposition=
 time<br>
+in `tran`. The rest of the matrix multiplication is carried out using the =
same<br>
+procedure but to multiply `m1[i][k]` by `m2[j][k]`. So `m2` is traversed<b=
r>
+row-wise and hence utilized cache space much more optimally.<br>
+<br>
+### Multi-core caching<br>
+<br>
+The plugin accepts a `cores=3DN_CORES` argument that represents the number=
 of<br>
+cores that the plugin must keep track of. Memory accesses generated by exc=
ess<br>
+threads will be served through the available core caches. The model is an<=
br>
+approximation, as described, and is most-akin to idealized behaviour when =
the<br>
+number of threads generated by the program is less than cores available,<b=
r>
+otherwise inter-thread thrashing will invariably occur.<br>
+<br>
+An example usage of the plugin using the `cores` argument to use 4 per-cor=
e<br>
+caches against a multithreaded program:<br>
+<br>
+```<br>
+./qemu-x86_64 $(QEMU_ARGS) \<br>
+=C2=A0 =C2=A0 -plugin ./contrib/plugins/libcache.so,cores=3D4 \<br>
+=C2=A0 =C2=A0 -d plugin \<br>
+=C2=A0 =C2=A0 -D logfile \<br>
+=C2=A0 =C2=A0 ./threaded_prog<br>
+```<br>
+<br>
+This reports out the following:<br>
+<br>
+```<br>
+core #, data accesses, data misses, dmiss rate, insn accesses, insn misses=
, imiss rate<br>
+0=C2=A0 =C2=A0 =C2=A0 =C2=A076739=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 4195=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 5.411666%=C2=A0 242616=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A01555=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0.6409%<br>
+1=C2=A0 =C2=A0 =C2=A0 =C2=A029029=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 932=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03.211106%=C2=A0 70939=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 988=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01.3=
927%<br>
+2=C2=A0 =C2=A0 =C2=A0 =C2=A06218=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02=
85=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04.511835%=C2=A0 15702=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 382=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A02.4328%<br>
+3=C2=A0 =C2=A0 =C2=A0 =C2=A06608=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02=
97=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A04.411946%=C2=A0 16342=C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 384=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A02.3498%<br>
+sum=C2=A0 =C2=A0 =C2=A0118594=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A05709=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 4.811139%=C2=A0 345599=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A03309=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 0.9575%<br>
+<br>
+...<br>
+```<br>
+<br>
+## Conclusion<br>
+<br>
+By emulating simple configurations of icache and dcache we can gain insigh=
ts<br>
+into how a working set is utilizing cache memory. Simplicity is sought and=
 L1<br>
+cache is emphasized since its under-utilization can be severe to the overa=
ll<br>
+system performance.<br>
+<br>
+This plugin is made as part of my GSoC participation for the year 2021 und=
er the<br>
+mentorship of Alex Benn=C3=A9e.<br>
+<br>
+List of posted patches related to the plugin:<br>
+<br>
+* [[PATCH v4 0/5] plugins: New TCG plugin for cache modelling](<a href=3D"=
https://patchew.org/QEMU/20210623125458.450462-1-ma.mandourr@gmail.com/" re=
l=3D"noreferrer" target=3D"_blank">https://patchew.org/QEMU/20210623125458.=
450462-1-ma.mandourr@gmail.com/</a>)<br>
+* [[PATCH v4 1/5] plugins: Added a new cache modelling plugin](<a href=3D"=
https://patchew.org/QEMU/20210623125458.450462-1-ma.mandourr@gmail.com/2021=
0623125458.450462-2-ma.mandourr@gmail.com/" rel=3D"noreferrer" target=3D"_b=
lank">https://patchew.org/QEMU/20210623125458.450462-1-ma.mandourr@gmail.co=
m/20210623125458.450462-2-ma.mandourr@gmail.com/</a>)<br>
+* [[PATCH v4 2/5] plugins/cache: Enable cache parameterization](<a href=3D=
"https://patchew.org/QEMU/20210623125458.450462-1-ma.mandourr@gmail.com/202=
10623125458.450462-3-ma.mandourr@gmail.com/" rel=3D"noreferrer" target=3D"_=
blank">https://patchew.org/QEMU/20210623125458.450462-1-ma.mandourr@gmail.c=
om/20210623125458.450462-3-ma.mandourr@gmail.com/</a>)<br>
+* [[PATCH v4 3/5] plugins/cache: Added FIFO and LRU eviction policies](<a =
href=3D"https://patchew.org/QEMU/20210623125458.450462-1-ma.mandourr@gmail.=
com/20210623125458.450462-4-ma.mandourr@gmail.com/" rel=3D"noreferrer" targ=
et=3D"_blank">https://patchew.org/QEMU/20210623125458.450462-1-ma.mandourr@=
gmail.com/20210623125458.450462-4-ma.mandourr@gmail.com/</a>)<br>
+* [[PATCH v4 4/5] docs/devel: Added cache plugin to the plugins docs](<a h=
ref=3D"https://patchew.org/QEMU/20210623125458.450462-1-ma.mandourr@gmail.c=
om/20210623125458.450462-5-ma.mandourr@gmail.com/#20210628053808.17422-1-ma=
.mandourr@gmail.com" rel=3D"noreferrer" target=3D"_blank">https://patchew.o=
rg/QEMU/20210623125458.450462-1-ma.mandourr@gmail.com/20210623125458.450462=
-5-ma.mandourr@gmail.com/#20210628053808.17422-1-ma.mandourr@gmail.com</a>)=
<br>
+* [[PATCH v5] MAINTAINERS: Added myself as a reviewer for TCG Plugins](<a =
href=3D"https://patchew.org/QEMU/20210623125458.450462-1-ma.mandourr@gmail.=
com/20210623125458.450462-6-ma.mandourr@gmail.com/#20210707092756.414242-1-=
ma.mandourr@gmail.com" rel=3D"noreferrer" target=3D"_blank">https://patchew=
.org/QEMU/20210623125458.450462-1-ma.mandourr@gmail.com/20210623125458.4504=
62-6-ma.mandourr@gmail.com/#20210707092756.414242-1-ma.mandourr@gmail.com</=
a>)<br>
+* [[PATCH 1/6] plugins/cache: Fixed a bug with destroying FIFO metadata](<=
a href=3D"https://patchew.org/QEMU/20210714172151.8494-1-ma.mandourr@gmail.=
com/20210714172151.8494-2-ma.mandourr@gmail.com/" rel=3D"noreferrer" target=
=3D"_blank">https://patchew.org/QEMU/20210714172151.8494-1-ma.mandourr@gmai=
l.com/20210714172151.8494-2-ma.mandourr@gmail.com/</a>)<br>
+* [[PATCH 2/6] plugins/cache: limited the scope of a mutex lock](<a href=
=3D"https://patchew.org/QEMU/20210714172151.8494-1-ma.mandourr@gmail.com/20=
210714172151.8494-3-ma.mandourr@gmail.com/" rel=3D"noreferrer" target=3D"_b=
lank">https://patchew.org/QEMU/20210714172151.8494-1-ma.mandourr@gmail.com/=
20210714172151.8494-3-ma.mandourr@gmail.com/</a>)<br>
+* [[PATCH 6/6] plugins/cache: Fixed &quot;function decl. is not a prototyp=
e&quot; warnings](<a href=3D"https://patchew.org/QEMU/20210714172151.8494-1=
-ma.mandourr@gmail.com/20210714172151.8494-7-ma.mandourr@gmail.com/" rel=3D=
"noreferrer" target=3D"_blank">https://patchew.org/QEMU/20210714172151.8494=
-1-ma.mandourr@gmail.com/20210714172151.8494-7-ma.mandourr@gmail.com/</a>)<=
br>
+* [[PATCH v5 0/2] plugins/cache: multicore cache modelling](<a href=3D"htt=
ps://patchew.org/QEMU/20210803151301.123581-1-ma.mandourr@gmail.com/" rel=
=3D"noreferrer" target=3D"_blank">https://patchew.org/QEMU/20210803151301.1=
23581-1-ma.mandourr@gmail.com/</a>)<br>
+* [[PATCH v5 1/2] plugins/cache: supported multicore cache modelling](<a h=
ref=3D"https://patchew.org/QEMU/20210803151301.123581-1-ma.mandourr@gmail.c=
om/20210803151301.123581-3-ma.mandourr@gmail.com/" rel=3D"noreferrer" targe=
t=3D"_blank">https://patchew.org/QEMU/20210803151301.123581-1-ma.mandourr@g=
mail.com/20210803151301.123581-3-ma.mandourr@gmail.com/</a>)<br>
+<br>
+The first series, (plugins: New TCG plugin for cache modelling), along wit=
h the<br>
+bug fixes patches are already merged to the QEMU main tree, the remaining<=
br>
+patches are merged to the [plugins/next](<a href=3D"https://github.com/sts=
quad/qemu/tree/plugins/next" rel=3D"noreferrer" target=3D"_blank">https://g=
ithub.com/stsquad/qemu/tree/plugins/next</a>)<br>
+tree, awaiting merging to the main tree, since we&#39;re in a release cycl=
e as of<br>
+the time of posting.<br>
diff --git a/screenshots/2021-06-17-cache-structure.png b/screenshots/2021-=
06-17-cache-structure.png<br>
new file mode 100644<br>
index 0000000000000000000000000000000000000000..82a9dc07710e3d9be738d20c675=
c69aa90a48942<br>
GIT binary patch<br>
literal 19675<br>
zcmeHv2T)Vpw=3DYdV4NU|hEfj%Ik*4$(6ciBwMUYNJM0!U$1S|wailU$*f=3DH3B(mN6n<br>
z1*I27T0jg%AoKtsdHV#v|JD2Mo4NPRn&gt;Vj~GYrEV&amp;e&gt;&lt;}b$0eyzp`@soS`nu9=
^O4P<br>
zG&amp;C%Fr*({JXz1x_XlNOj8Nm_1%BeRrG(t3bI&gt;$`{ZRhIt_L`ZNts}Wi{@P~KJKDxq<b=
r>
zoLn36kt1w(mi&lt;_rPV&gt;R@qwn;y?_M~&gt;qOf&gt;0?%D~dT7rx50Ug^D=3DXF$WSNNs&=
gt;1;dz`<br>
zFn8D1`^(ct3K=3D&amp;(qdaQEKW7S*_Wi7~KIlqWTUUC2K;Tk1{@L;|ylsQR`XpZbCL41E<br=
>
z&amp;2K+iQoG%Z+Y0W&lt;|8@-eza3nQ^Uo6vc3*&lt;ObjICN{Nv0^a4oj~%6VE7`-svUVUMH=
9<br>
zMibf5pR{Ngz|Ro|S(y3M@x63HG;~3njj{;=3DVeA6XZ5|lXV6~&gt;jv_Q(}gkEt(da`%H<br>
zMF#IjU)|SLaeGQsMD&lt;~`v~b4f=3DqY!RO&gt;T~DWCo$l3+Yi$-+3#VEW=3D@=3Dt)mX(*U=
=3D#b<br>
z(BGcY5aB(e&lt;H^y*b9+i$WH2uJ;=3DZo++fJ-5w9rk3&amp;dJch8D~sAuYed5kdZR%UDhI-=
<br>
zqo4V&lt;LvB0yFTdZG(dkWzww1_0ah&amp;JmNCo4nTWjguh&lt;&gt;TYQKzFL!QMsIS$Xl}_=
$68n<br>
z1Mv){Cro$nx2Je?R$N6?Bch4Ql$hv?_;_ZH&gt;(s;tax}`0o!l1=3DO}!D*$Sk7zEIQ8J<br>
zfBlfiX5~hE&lt;3*j)jEw~&amp;k&amp;K?(Q(huZdev#H2S}b21jlx2^eIKkmfUA_hZ$vyqsu=
{O<br>
zMOWl&lt;4O)@%?U;_ACWpp+B4h2&amp;qcDl2iHbaIvRe+^vG+C&amp;3bz0v-d{&gt;~JEN1#=
*~Rf0<br>
z{q@Dh`RCfVoftU`+y(box+;b`rcZWEL{A+O3C?-An3IBGTD!5cQnU=3D1!E@Jpeove^<br>
zLd$`f!0si&amp;5mwljoi-{k=3D17(i&amp;nRZ^dh=3DtQ-cVFTkdfF&lt;gJfJOx%!z^r}R#=
=3D;mFv)<br>
zP0Ogrm}n&lt;K4tJXahne?7Pg^UU9VC0t+dVl@=3DF`PrX&gt;fd&amp;$N-PXNXL(fLt}t+Uu=
KjG<br>
zenKbIY^&gt;-9&amp;)tn2Z45_O*5?~^4M#|B%dZ;a8Oq4cUHt)jzTo?G{M0zY$~Uqm7UU7S<b=
r>
z0_r!R5ozf9L?Z0cEmu#Jg1=3DXV2nHgXyEzus=3D;GxmPuP*8ln{~4v&amp;$12FH%sO+Xl;O<=
br>
zG;SRY((h(fDNj1T{6KNKc*4g}oa4y}0dC=3D*W0oSD4jKdzeRdjJcA7|T5P0X_otymn<br>
zeeMD{=3D3*I`$wFO7)cb&gt;ff%EA9XU|iI5zy^|2&lt;k1tU3Y#WpKvf^wJvb}h&lt;wr~Fuk=
*s<br>
zcAj?c(?;&lt;Ww|(L9yjZQze6-Uye*1j)#)Flx*~fq2_k$5yLJ@W}v44lU6Q+U~$XWI+<br>
z-N8Si2Ipz~bKd_+c@bI`G_UcOGI)ISmZ8ezgIJNUxv~MLchMXxO?zd|72DQ1HQn4T<br>
zf2lFz)3FnQ*Tg%|BabD2OqA&amp;P&gt;X&gt;GbC~lC!X{h|X{bfSPE@r&gt;p4m4&gt;3G5y=
rH{W%XR<br>
z^j`Tl4&gt;evj|04pvpX9hc&gt;=3DC}Mr5&gt;p(7&lt;6-O$k%Al4kIw$T)01mTPnjdY}RU}=
U2UPW<br>
zHfZ^5y-*U^u!S5=3D?}&amp;M&gt;=3D*9~guxS#&lt;PPI^4&amp;FW9+@_RFE6EMikt@)bxd=
dl`f&amp;unpn<br>
zVTyaX#i7^Z=3D|Y_cBI7nU23?D@EK06+)hyKO^H_V)Mn$$?8Xwh{0D&amp;)*bZD;3d7@M5<br=
>
z*XtI#ux!Y)*eI444dm70m0Y8+yp&gt;808s&lt;Pw&lt;+U&amp;NSlh`q6#32I&gt;K!i0&gt=
;*T2y@!1EC<br>
zUA+W9mw1=3DwGCbNb`(lA@-II3p&lt;+D$YIkJY47F+x}k2BrM-x#h5V2kaL*!S({n&gt;J~A<=
br>
z?{S?$pEjx7fQ6A#ziH!{(FWw=3D_u-`=3D%J#bRfK31krN7K|fH1JVxhgtxP9T)&lt;b_OoY<b=
r>
zKzoR`Bm9Sbd#YOU+He3$_2(;W6PM}GfrN{6{(=3DnZTaOpugyF&amp;-BV^d{X6&lt;UfRgZ6n=
<br>
z22a0xsFsi;ooD@qcxv!WF0Ki-VA`%aTkr~r&gt;v$w*Kh&lt;yLDK?@m=3D&lt;`9?uETry+CU=
eY<br>
zj7N8`ee*=3DjM+l%vi?iJmYW5@sdQU=3DH;P~ya&lt;tRQ6W}c%;qyp=3Dz`y(L&gt;bp$j?AV=
Q6P<br>
zx|#v2rP?olZN_A?uQ;5mXrF?DLf0)G+tb&lt;@Ru&amp;X%$XuD3^7+k`Y3%`PUzX3$G*Yq+<b=
r>
zQn=3D;SW!(ZDBPe0tKipgC)|V-48_P^I%y@f)3B$&gt;QVE^k$gd?&amp;dZnaaJty%V*-{Kfr=
<br>
zl&lt;wr}F~rn#PFl8S=3Dmg&amp;ih`uX3#beK=3DP=3DZ3_Lil&lt;OuB%*MrtU$K3`$V?^3t=
x&gt;7Qv9a<br>
z()Gk~uj7d_7ngRW9KXSMD`#KeLQ}{?mIW9gs@`+79yfhUG+zDweC0%(EQ}zSUDuIl<br>
zq&lt;Py;$QyGBewz6yUnr4)vlAM-U2Rq2ft#ur^4U8azBRYfNY8c?x$HOeLYHlmfMuJ0<br>
z7BcVb3nyX`WUXXtA3frI=3DM94COPR1~eR-GOmp3hN=3DdOv3eeD1*|G|?R-)&amp;5g4U6yj<=
br>
z&gt;^S`&lt;VwLu&gt;RTCq$&lt;{5}H$OXCZwUV?h^43CwM})@2-D6Ji8f(n);&gt;(ycr^?N=
leCHpZ<br>
z9t*J2llC*PaglI)A8ALycHfYTiVRhy#cGXP68a&gt;_#$%2K4I7_5yDPmXoJhn)zm3V{<br>
z3mwli22Nrn+OO~08{LpTSbeN9Q6=3DrsULI-d9GsP}uE4eZ^RR&lt;O&amp;Z%tpJ}AT?5aRrB=
<br>
zN9`i++T($s@UwIX_Lp?D;h$oaHb^&amp;ENvDr`k~c&amp;|*9jMlG`QyX5HJYg%^|#|ZinWU<=
br>
z8wN|mh9#YlMH3B=3Dx1|}WFX{xZbm?M8kt?0rxbu$Wv39LZ&gt;9?{8&amp;w`Z4-#D~I8!?1?=
<br>
zczkoOV2P(61`CSsWY38Gi5MQ4?9_mf$3*l-Dm|HyLQ+?T@hiW|Eb#hLz3&lt;i9v8c#u<br>
zf5T@%AuGoykFYol!cb{6)He_b17V6pnxVoJ)c356Qnp8NO=3D3t^zmXuk`-3yO@w&gt;~E<br>
zU&lt;9&gt;zMA*uCLfL1&lt;Zv|V6oG|)nwOv@P6F&amp;w}XpJz!TPEB|J~BbZfKWq6I%Y{~&=
lt;0Qd`<br>
z=3DW7-WJHTf;@Hl2J$0*Iv%;uVD;HmhSzD=3Dx*&lt;&amp;w;v#Tbo%;cI4rZqY_VNj!Hrv!k=
^8<br>
z5+VYS6+-XS=3DoQ?uVa99ojw4!&amp;`U#&lt;3Od!O4wBeKl)aImtI&lt;lyCG&lt;@q;%VP&=
gt;2O~!&lt;S<br>
zO%l^`y?oF`vU)l@#cBDoQcjPdS}b{PlpI@ByVRQQyzLw&amp;5kU#ZA}g9f)SDh4kqIiO<br>
zW;}j#qhGE;$G?%5snaujImN53aB|@0#X?Ii!=3DvGEqlyX3R;wia6QOEFlZsaQA3Phj<br>
z{ox0R+yV_ZKQ-8P`J_nMSt^?t&gt;&lt;(N%wmwhVSa$yWM4&gt;lJKiMmeaPAZGV&gt;BD{eu=
Ku6<br>
zv&lt;(efvT3DM`IpOeuQrBd$z9CU-6iz+eRTSjkN3sw1b&amp;1uB3nPDNfuR#49$&amp;S+l)=
bx<br>
zE`Py&gt;;`XALwdp9tk4E83i3HzjskBFS5u^9MAHRvdbZdJ#{q4eE1etxf3rA&gt;S^vz4R<br=
>
z0{*T=3Ds1?bFBv4wo&gt;ECGFso{V9PB#ao&amp;z;G=3D3xAXm2~uE$uStxNk-ya@5n8W7-M_=
z$<br>
zXXH2)1^gO8$O??`Mv8@w{$I5Z_#^T%fFFM)$&lt;+Q?$drQ-u2}IhF#b_|HScSbJ$D2Z<br>
z$n?huZeWBD&lt;?_rhY7zSPE$=3D{ek9j?T^^Xz0f)Ntjo!Q}kfSvvN0FJy4#R&gt;c|!W%Gx<=
br>
z(6??O*+0_rSCSSEOM{&gt;R8)l-`g$oxRV_IGx2Xiw|E0HpAr^9Yqrx=3DTN-Q9ig0HfC%<br>
z$01r4L0+XwM~dBY?-&lt;L4$d%fyuRW+;1mSmgnFEVEMsn@y*2VXrUo#jNf{oy^B&gt;mPI<br=
>
z4g&amp;ej;+ol^N6h7ZbR*mNxne&amp;p=3D5%8QpM{2@iF}jS9B%TF54JIOLe=3DW*CbuKjKY=
pJp<br>
zK68Y_b%UXHtK%DL&lt;0kv@hs@tc&amp;{ZvFS(c*xfpmwq*sxlmVd*c~X%`YdenZ_lC(;XJ<b=
r>
z4qQ*GXn?T`-`vCTp^oAcUwk6#)XP28lOr;;5=3D&lt;~VBdZ?daAw^Zne{Ha_O)Llr=3DAft<b=
r>
zW}$|mbwSwauy*6tm8CVa0}0IXd#N$Y&gt;^;q#ar9TrXP&lt;Mtyrb1h#&gt;%E2=3DFl+}9t%=
4f<br>
zw3WX{_uXSA+6D6RS~8QE&amp;Ur4ns&amp;&amp;--qG?up^aWiZ2Z|lMvyVCN4m&amp;~faqY=
G#gJ{#I<br>
zn-Kw&amp;psh9r&amp;Zd{lkwaTD&gt;%_yxS8wJXOn5_)h5Z%7V4=3DVqn09uAoOhh#{ErijH=
I&amp;-z<br>
z$)?@jCO5R^x06Fc`(7T+=3D-qevEBY&amp;pp8xc)W)kHQL*U2iW+-xrHoA*Kgxw&amp;T#7%5=
4<br>
z=3DRo9`*o4&gt;|^05*+e`sR411{(*0`BsLm+?r-#M3&gt;0-EOwLl5e}u-cWHcw5)o~CwUWl<=
br>
zRj4SWQUAUEAo{5160T{hvYXiYrsRifU-H9&gt;wMuZBs{7N|s?MS24dWlKC*MsjrCb?N<br>
zEpL(?JANLAg+}A&gt;$=3D&amp;B(Z&lt;*R68-cqxa&amp;+X{eMA+%J~$$&lt;sZ!K_vHfD0=
b?Ky)&gt;vG?W<br>
zvBQyABbVgE^BM8&gt;p9k_}RFR$(=3DmrKPIHP&lt;ozkI)l)hg?ugV&amp;yaHp|EUI8;&gt;=
o`^B9d<br>
z-U&lt;~y&lt;uel*QlpkB#TSzg+dGFE*O++ogz&gt;x9UkvNo2-+I&gt;k&gt;BS$-Xfd+{73q=
0?yq?P<br>
zr-gI(LXjvMc~6%8b}=3DSAF2Cwwi7A4|eWM&gt;rg~&lt;W^iNwLIJ2g`i=3DF4R&gt;G3_1S8=
Wd55<br>
zhMdSKS{4PS*s&gt;27&gt;$Lai**Jk|yb8J_S^V3@sw=3D+Mp9`NBZdN+ARrG@pvRch~(|V;%<=
br>
zhfX3|o)nv+{K7}bWg9Nno)G0=3DPA^rQ3Qm^K2pFH9IRU1D`Fz1T=3D=3DY1Cr%kwcOuF^8<br=
>
zoV2Ph10hJ8zV9Yx`sa&gt;IZz}hP7H(!NFRvAY1oga&amp;x6{)8eB55@jp;(d31c28lWxz(<b=
r>
zTU~#&lt;n01@q%vaJeUsHN;sSpYw_h{04i86hzfUcI;;2HCzrd6P!hbJBmqvv&amp;D&lt;#oM=
R<br>
z7&gt;wC}zq%7l!)|%MneFcvPvI+{SgBa8dUqvx7J?A;AHJ5?%(cm@jM0o!K;_p@k!rW0<br>
z=3DPbWy5AQtZ+i4!-)~A-4(0dC^gEb|ma&gt;??yi?xw0eM7BZ^WtO5LtQ}#HhFim7WL+g<br>
zn{8IS3pOlQPvY@&amp;D3G9&gt;+X!q#)RP&lt;U!CD&amp;;zLhCm3a0Tzz4_t5Zx=3D&amp;=
L?Z@w{&lt;)5YY<br>
z|I1P{^MOB73y@CrYTCVmM^b`bJZ*{P(_Q}Y`NeKdah&gt;I&lt;51y`$#dT}Ev2eNTwt=3D`^<=
br>
zGky7H%KZ_v^ciuEQa*R&lt;-E3i3m%e}WTl?zRlc|?@V(v0hZlipykh=3DVZe_#HGwyJ)v<br>
zGR`hb^d*I-DRgiC47;k|p_H2%5bCh;$A)R}6wYXQK2iD^YNOR`Dq1uy9YH2w{6@pp<br>
zyVe^hVZqz01I{I%6*&amp;hQEx*IVzM|R(Y(u0#B^5Igwr*2Bc73lb%&amp;k+*VSp(mXVc?Z<=
br>
z=3D4^CtQHg=3Dmofrl4w295Cd;N}!Jg+*&gt;4Xzv4@VB!Stb5~iZK5VyS?M7#Y9FT(HD5g|<b=
r>
zJ$N}rY6@VU3;&lt;=3D$&amp;&amp;s4EqrxAztKj)9OPx5b&amp;GyH&gt;zk5I%0tKmF&gt;=
%##(V#(GgB+ZIo<br>
zs`b?km)&gt;5#7Qo+MV4;l&gt;@P~)ZxuRa|m8ta_?p_3Fqo=3D55{)~RIbXJi~O;p3eKrv$R<=
br>
zdN8Pl_a?(L9yPy^%8?5maZ75&gt;cUb%uFd9a0RKzq7D?oL&lt;!O()Osh*$LdHJA?Zl=3DE!<=
br>
zKEz^{r5|6pP;$yDtr^vLLfd&amp;%f6fQa_-bSzpl;#ioTM6z-&gt;Z?&lt;jz)QVrDys_iYF`=
I<br>
zwwY~^!?0{4r9a0AQ4Ij{6odjdmhnB2OoFG?xd7GhWOHp!-w3%aKL=3D2n-;j4p*KsBR<br>
z9l#lUueQ4c&amp;||6poaN?fF}hB$;cJN_C*&gt;PJfu-{cUnyg6Z%h}IwC|Iao5n=3DG2`ppu=
<br>
znR&lt;@740n2=3D-OAtpDkyLLhhFvVdxK?e{;igtuQXf2(i8?akC5rOdCzRwx?t=3D!I0&gt;d=
W<br>
z(;U01H`vC;NP6durAbg1^K1g-|1xBK{vBV+H;)&gt;r+GDc8D^ss&lt;ly9SCZr*q#$(nMK<br=
>
z$3~|uN$Q1jPj=3DVJbPsm4*s|;}(YflF7kLBU)0=3Dx?`YjW}I$*WIVGhEK?DKySgu0e+<br>
zk&gt;B-EoBLvU70y(?dzT7xSBcel+&amp;bRpgi&lt;t~H&amp;%0d=3D7(Z+a98Z=3DNR{zcA=
4)14xfB++<br>
zrRiE4K3}UgaU^rLvX^yMqkroW&gt;)q*mc*ES&gt;p`e_h-rn9Tt9{wFPww^&gt;O&lt;qw2B*=
t`M<br>
z#fW9VCnNM`5AIejATVy)jeR=3DSk%_}%iXE3h8dIZK1$YG)?fB|nbZ+)6iM_u;i@feP<br>
zTUg=3Dopy#QI@6_F6?diAn@)T`VOvEFf#i`D`ELea&amp;XwL7dcgqYrT;@9M=3D=3DMwzck*;=
8<br>
z&lt;HM@2I&gt;-Q9ks&gt;4Nx&lt;L2oE`{|wZ4U(nytg&lt;#;GHYbA2KX^u7BM=3DwLQLd&l=
t;iHqyd1DV!<br>
zqA`A(phgRUKr4?bhdMR-(Dh3_21+anbATza37*bc0m&lt;upaOlDmSh{TJ4lHeh+N&amp;!c<b=
r>
z_l@gXJVTQ=3D2o1&gt;XX(KG5a}(S0B?zC2eNFUWKm&amp;HEgV0W^RItKX5?HF#-0b!Y%B)0U=
<br>
zsfV!|tfE&gt;5^F}dc3g2#~JaY3tky*(g#|YHmWHM$Wj|8X(wd$o-Ni2Kk5}h1!wgYer<br>
zq8buup+1$aULS-pH`7EXTdoJM&amp;l`ktIYWRxfc*&lt;&lt;Hh_`%^+I^p!%-IEPe){ppjtR=
b<br>
z5~&gt;NOdrz5B^L&gt;7CeRY@UNdc}Fu$O4yZN-bZSpyx@=3Di(ZF9GZV!bu&gt;s}5G&gt;ue=
({q-J<br>
zY7Rw8U&lt;ax1;B^iw_lQ&gt;P)dx#=3Dz$g5Yd0Y*rHFxnTs|B@hi5ETKf%8@PrUlY+N63;&l=
t;<br>
z$kJ_P@9}qpeO^`#;=3DMjx=3D$~I+&lt;9OVOzWCIDs2T&gt;ziv`R9w2CAJ;qr~QY~flEU&lt=
;^d3<br>
zuVN_kR-&gt;ET8e2b0aLKob70VlKGCy|msRx$8=3Da{dAy+fqE1|(+g(OjJFD&lt;Y3&gt;CPG=
T4<br>
zu&amp;Aywlbq@QMSZ$xKUfoPnV%C&amp;jk5edWkWl!@6fu1Xkkb90%vY&amp;=3D|Yyj`NHcF=
{gC*%<br>
z%bSPadxnIxwzAOoXZm(pfwBYNC?w7ZRTZsvG@$Z0S?p#TTN-r#8N#^ck*}(w6;v^{<br>
zyA|-{SkC(54}z)`W2X`hZw!_RNp7#c&gt;cwUce`RbkWzWsl(QL-y!o3fKCOs*eu&lt;MdN<br=
>
zJ18^i&lt;VfFrpt=3D&amp;29q;}rJN~I~|EX|)!$bdoDRMy+tpS~Bzr2D%E*9U^H}?WJ8Fo}}=
<br>
zTW^jxD+&amp;T}dEUJMU&lt;JYGP3_%c%}Pc}`8j7x?$!q&amp;+u{ya+y@9P5uxI#4{cH-eu{=
C1<br>
z5Dda4ewIz&amp;Ey&amp;A0br%pE2UjtlwHzN&gt;P)6VW!tOdF&lt;jj^^0?e|2VKCxF^cPo#=
Gs+y0<br>
zai)B%z2&lt;hyuJMLQ=3DoNh`+mS4#%#b9uLtu!&gt;Gdz^q;UwO$dP%?f+Y2Cdgw9u(%1=3D~=
2<br>
zfEoITQJIgnhkWC$i92LQB5y|P!ySI2s-MeygB|b_aK=3Dy&lt;Mw!R^sLY4M9Tq!&gt;GgLBT<=
br>
z=3DTD(^a+^l|*|s~co-$|tY;cRBRoCVo&amp;;W!5$W72zq64iYI}xHv^tSElZqI5F?l0b7<br=
>
zOZ$}4U^&gt;6J;RuUY;Q+U=3DV4+V!d49-^xNi=3DjXfe4TS6%=3Dl&gt;M9eEi*#cguV$*fQk=
%Ig<br>
zu`G^|u8o(BEk2?KCD9_tH9jB0%&lt;m86C%(t5O2!=3Dt{1~XWW%Q%aUJ^zxxSvZC8jVXh<br>
z`Eb|HbAfwIN=3D?{EY}{*m4LvCU%4ghu!`1(Q@&amp;+6x5{OUTP;vF(g5mA)V;)1wPn0|b<br=
>
z4Iarp*B&lt;snZ&amp;|6%mG)$Wmb?bsNmvN260eM&gt;p)uOHX6pS%lS_d9&gt;DaGdW9JO$0=
v`cJ<br>
zUiUg@+)tYv?uOX+`F|PO&amp;PD=3DaA=3DS*&lt;VGCj@l2g$?7a{iI^&lt;vpiJtg6c&gt;&=
lt;nA~2jZe-<br>
zF$POOJ4)|*q1$tVO%pEm5Jvy$=3DW-fFy&gt;5LZ&lt;b1uaAR}*VasUeY;9cg+=3D~AQzyur1=
I<br>
zode@&lt;gk4Hkv!}v6&lt;ZVx`nz|t_o5zV&gt;Ele?uk9q99df(hJ%yF!l2bIYodaCohuE0s)=
<br>
zA;&lt;tscehOV;@)b2u%`OVP+7&amp;{tND;J6Q%C&gt;=3D@EzGcD`A0wvGSSTjGXKPlJ+FY;=
}HE<br>
zZEACU!6;sRiFp`EdGc33!7WR!vVhbWLWOd7oZ9?pL^x46)%*Pc`H;1r1pM~ew|Iz&lt;<br>
zpNFY0e&gt;x`b^ZmnE4v&gt;^qz`UL^vheBvr7UZ@C#MI&lt;Y6fiT1TFZU!8fk??EQ()r8ENF=
<br>
z&amp;knW*X~%;+t9{fP9L)ZG&amp;USUL2X@c;F3$Q|KUA$Ke~L&amp;ASs0?54a48%-Pk%mi1=
vOk<br>
zSl%8CA8YXgD2k6UlAcXH!BBJKN-z+Hus@y_w|dshm9Ml)7T?tMSQ~Ve2_C;K@zN+w<br>
z)9&lt;swz)gegQs*A0nciGG?T!FOAi2^H0`&lt;$8Oxm!!qztOS8*9l8BnS9WaieEvk2$ty<br=
>
zHURY%5{13a_OHzj#J6j#TdS`2UYG`wVh&amp;&lt;^O1IPtcfztZP;TxOmenp{%qYY^H;R^U<b=
r>
znA~&lt;M*yr-{{tETTUtHw(c**i&gt;)&amp;)v)7Z_zMn1a_!e!ldPgy_oeXTR?IwHx%mHeJK=
g<br>
zpdwMFPUk&lt;217-Dvn0`_xad85h22g51^&gt;Vu!Hli`buU@qy?V+TZalD{LllV4J&gt;MVc|=
<br>
z)KF;t8q!+wFSR_;OBCOceKBlo0c@vYdAZ233r7jwL2zOVl6*YHvtH%eboVU?#}7h)<br>
zLLiz26S?-&amp;n3aC4Ow)ZKQE!GVC9-mI_pi9FA^_ekHK?u&amp;XDq%v;0QtBOgvw|%%Lu$<=
br>
zpMP_*TnNTE%}u9ZAo6H)0~8&lt;hWeOFx+K1~1nXi%&lt;_W$O-^2I*&gt;7JBw;3BKAbSq5de=
<br>
zm-|RM1Sy7P2_0ziu`e1xP&lt;tDP*uv@FA}&amp;4$qP6-^kW&lt;isKv2l9&lt;RG^XIV}LJO=
i&lt;p3<br>
zw0zg$){&amp;~FL|TZ#YK8b8!hn3QQS*I_{onHa6HC*dQfWt1d&amp;ed%D@&gt;*=3D@tLQ2L=
#B?J<br>
zAfxP&amp;&lt;bd!iXh*F#flH!lB;`)&lt;DXclKTONKkdV#^(yO|5;odFP~Dr_IgRZAWA6bQw=
*<br>
zu5^%l8Q@4FEjxdG&lt;AA%D4yF`K1!sSCt1Z-O*9ET*I&gt;CuROz$qT@xW@O2I}$nP8*A_<br=
>
z4vZw&lt;$V`(P3O8m6hwZApv+Z-btK*ubr)8dl3T5^k;Iq3|zkW01P0JdAa6-jEMK^hQ<br>
zYAXuPNW3)~w)Rz`7Qjc=3DMYUa|%Y@Yd6vCEJH&lt;Op|)c#ZjH=3D{YqMciIMBj)$O_!N%}<b=
r>
zIS0&lt;&lt;=3D0u}4qDSQdfkt_I;V|Kn7a%&lt;_xQHB6LAq-HIbK1;xEd$PmKJ%q6bOb4TS_=
B=3D<br>
zFKlY&amp;hig1dBwg=3DG#TcaqTBvxME9WBh!)8hk0C47UAbBmVH@`P6D{Z!PByhzS%xueO<br=
>
zuw%r(n|K7z)W20}mu?8&amp;W%#aj7CG3@1`2sL+#niF8$G(a5*NkiG}ai2;|V9)M8qS&gt;<b=
r>
z%A~u)3BuY&lt;G4Dv@3lGg~^;!f1tchIDV`S=3D;YlS{((&lt;4&gt;o0|{e&lt;aGFt-F_e5T=
@Ec4Y<br>
zOWQaLXCR&amp;zU2DNIA#L9Uu*`#d$hws}&lt;_w#&gt;KYO=3DZGWXgzwQ8}b=3Dl?H&lt;Y{=
5n^xckQp<br>
zBoJttNy}m54&gt;Cc!f07JF)t&amp;KG(0#wf1~&gt;4YUOl`DY8^qP0P1UcKD1WaW3pWjR4-e=
V<br>
zal8JgUNV|65C&lt;&gt;v-B=3D7Fx@XUghYcCy_Og0_Hwn+pM-Oj995Z0M!+&amp;S&amp;{$a=
a8z4U}3<br>
zufW;G#Te6ZEB~7=3Dwr%Um{msNdg)=3DOLfMqwGcnRvFWjJHr`!Br3SL&gt;Wr#QPl&amp;ge`=
&lt;8<br>
z37C3_0bDGB^chKlO4izGH~v&amp;e62VHO*lBU9%LBU%kmaa5TKnM=3Da&gt;I?kH)P7L%elxe=
<br>
zky&lt;d?h446)@^=3D@(^OV^QJbn&gt;&gt;$VVKSZ+?}P-28NH_jk(5eZ1FOlXl9=3DuiV^`R=
Xb&amp;+<br>
z^%+Kqs-3cOvX#YqQg25i(_=3DY5d1j}qw4S|F84AiuB#d5D;YRY=3D-BdyCXmix7qhe#j<br>
z=3Dn?YHp9vw9NkLS$!%1^P2IDnE6m3q%TZ3l|wMOEe=3DpbWl6L6Dxq$j${N837RA5~qH<br>
z&gt;Bti~EVH97n)QuI=3D+lizBvv#Wc`p3Y4and?igbG`{OZVVs&amp;1L=3DaGv7&lt;A5~p!=
EOhgF<br>
zAiASl#(iSHP`@KZ)_-TWh}%&amp;Y+g@i!e~hQ9i(_U=3DfvpKt-BL#T3iBcR9Vyb@k6B8a<br=
>
zuAgjG7p$&lt;o)j&amp;~8^=3D()28+6XO1#5{%7$r&amp;=3DWrL0WD5*+{@6aCC(C&amp;#w=
R)#@H?~{e4<br>
zGx0sy(LtZ%L{$Q)&lt;8^4*DZ4p=3D@wR{uB^R)gD=3D5k;%5OR=3DneifzjUR^%c&amp;z|}b=
dZ2A<br>
zcgs9ixTqITug2ae8zD#&amp;Nw+&amp;t=3DEn$m&amp;sl*YKHyjYYNo5!_tUvrJJKhYId5fq=
1T&gt;S&gt;<br>
zNZ6h@_B*0fxF9L*8|a}!y&gt;&amp;6iW6_-PUlOdf!&lt;Y)wj=3D0Opr3&lt;^oLB$JPNy_|=
62dSuJ<br>
zAffY~iQP_?BnxD{p6&amp;uEHLJ0UKpj#2o}fMDo3_RO`Kd}G;8Kr=3DZLMWZwk7ur2aFmx<br=
>
zKJ`AuZIIx~ZaRU7AVphQd$gp{&amp;fL!wy3EEXpghC+h?D(jzJAelV(k_ac?n9FixSMO<br>
zV%Q&amp;YCGjeI39%qFp8^XKr&gt;(kWrI#I%Vr8q^nlH9=3DJKKdsT`2vn7w6hWpA=3DWrg9A=
Xh<br>
zPAk(iwL%qa1kdKbm#HAPg~4AA22T!;UPPNtBrlO(4$EG07oW;MNd;eySr%n7XxI9Y<br>
z&amp;Ai2BXswN`MmD?`hZZI`s;@tPsJg&lt;11TD?Tp=3Dz$h%AG}DCBD~@#fZA-6+&amp;qf(=
j|8g<br>
zn{^DW&lt;5vh30egZZl5XiBHSNovxaxV+b{-OGkC3*}&amp;O-|7r&gt;kEQr7n)|W@w%7r&gt=
;WuK<br>
zA04*ti=3DdvIe|&amp;dBhUm`7{Q9(J2O!BA&amp;Un;~=3DH_?Zos*LfsrN&lt;hoUF}~@B*=
=3DOGU+g_<br>
zk;-rSw1I)a%!9Z3QSJW=3D1nTv*WKR2c_mNbAJ8^K*=3Dp6TRAT`=3D@J7`{{&gt;b8&amp;dC=
$Iz_<br>
zGmc+q(W&gt;PloKgL+!=3DaG&amp;D0xEKGy`mJC9L%3KgS1mfvT(Zr=3DxYjy}sze+S!9hAC)=
BP<br>
z7#3&amp;#)7r0k6c94LOO5{n4gb+=3D|FH)Ao3G#&gt;YrwyEp&gt;+8FJ6*c=3D{cpN7e(2t)=
lcPH`<br>
z8Q{il75r0enR=3Dp#JM&lt;Fr|7ouJ&lt;B`4Mn^Nu|?J(0Ixkta5rS~X!&amp;c2w;g0$%XMf=
2a&gt;<br>
z6wCAYJgT}A(r{+hH`HH1G83QD+pbpshGYT!EN!h;A=3DXr%hau$i5O4x&amp;H)3&lt;GqQPKv=
<br>
zYh-;2I3u&amp;|uu)wo%BI&lt;7Z;oc!vsTORrw%X{)vZ}RQE=3Dt11Ab}0x4U&gt;Q!M)~NOy=
+C1<br>
zR7{5)1a#Z&lt;^RcqPd{ofkEr2RpRgtb~FU-PQy$D6vo6pxuD3&amp;@suv3|}i%{wgHQffn<b=
r>
zaRzV%UiYY;7Uz|BVlS&amp;dMp$Z-!ALGb7H*H&gt;&gt;Mr0jcKVPY{M;5`awQv|k7A`hldb6=
!<br>
zYP$iVH4kX90}8p{7duSXK&gt;eCRHKA$mK)yEs&gt;QfTPjorh*!;G6}KrGj9&amp;F&gt;93s=
QAt8<br>
zSnyaRlT({ig|$%$sA;^eZLRbe&lt;v^-6`djd9;dB-L*$bP1;WC0&lt;x=3DSsb8D%#F?y4&lt=
;N<br>
z85bMuNMmL^QPgPq&amp;`dvxwCgo6UT?-zi1CV?$sR`)_q$#@320lZ9TC{nJ1lOrwYgBg<br>
zd--MFEKk&amp;AC96v&amp;H0QAhdRAt78qXr&amp;sQ&amp;S)3qASJte=3DIR&lt;QcZP^1M=
yD=3DB}aY^uZ@c<br>
zw5CAdSmX+DoOc0RLM|{FuYf3fAWjG%IDP?O3itbdPq&amp;DV@l+hY9%&lt;L&amp;EQ%8Rf^`=
aL<br>
z*Kl?sg{X{w79zbk_8Mr*U66vUHoCzIs+U@9JI)?G!8e*-F%lf3IPBNcgo!-7tO|$#<br>
zIoK8A7ruIapv6B6TeGMpZ_Z+GG24oQr&amp;Apzz?fG%;&amp;uL&amp;W?Mr?-W$!9)WTFNea=
u4n<br>
zJnWLWN1CT7!KD&lt;M+a&amp;-!OG7t&amp;X1cTXh5&lt;a&gt;TNe@#3@qu&gt;z^}j8Yzlb=
p1r$l&gt;t#6~z<br>
zoVX5Pw3y0&gt;k&lt;M^vOX`9cB2ZZ27R&amp;&amp;&gt;MJgRSK!yE)Gg=3DwD!B$jrXSDiS=
5IhioQ^@eX<br>
z0;Kb(mT)3BFB%xpj|&gt;9OuXFFq^K&lt;@Ne4e!&amp;jPc&lt;2y+GmB`lf;Yk0uVbrW&lt;=
eGCezRR<br>
zl?6B^ba;mk#SYwFoM-{A*ty&lt;Ltk%N;KCnnf9ZfCL)J8{IEX?~uU~S&amp;uc#uNV#=3DTWp=
<br>
zub;15qVi{?(x_VZ&gt;-+!Gx?yH`t8by(v#6Zs+L$P-6*p|aeoM4@2kNpqoFIA{&lt;kvMt<br=
>
zpbc&lt;Kle2yKJQ_eWe}|=3D~JVug~_l^pW&gt;Bh$?k4F;%F#JBupg%&amp;4M3Jdm*$4UMaj=
fsV<br>
zbP;pG4zHRmtgu?9LEeU@Dvt@15o$K~)ow`f?BU&amp;L*E0P(YRj~V^37B$tA9mp&gt;Oko}<b=
r>
z-{PnN;|HdH+#V#;$NydlPoI=3D~O5Wb;$x608g9s%Y|MGMcP1zPk3$hZ2BLV+)GZw$x<br>
zfkcqk0SV*`7gQvjj-n0si{4(uj5?34!)(#p*HlRaES9|~UaV~Wp7c&gt;;4K@|i?|t`C<br>
zriS9q!@P6tEJc~`ZS)GUvgev1b#{xVVsKM4e{geXV@&lt;QY&gt;CK3}c^n^OUTgmOsL29M<br=
>
zWcc&gt;xEuexQ-ujPJaQ&amp;to6}-`GYU36v{75un@iFL(n0wtKh-0POa@}rk{Q0#6yG0+G<b=
r>
zHC2+f{WCaK@&amp;F^z&lt;82h8-l{Qx)lhx$9jlqZv&lt;T-hn8`h}KHx97=3D9;OdRC%8lEm=
p&gt;g<br>
z)#8FuImbrt9+qb69v1g)CcwkpVnOam3kyA%(rLVIIhKY(*AdMj+GMXxlGNm%dUu-&gt;<br>
z+qYH@I2X__0a&amp;6MGO10TR0UCmHrKf%FW#)7;Uhm`|3(^PLZ(-YhO5;gJ2zi|pk}6}<br>
zYkuyV-&amp;aZ=3D0t_hMa9D!$(Qdo+JGIJ6Bj*S)qog)N(iHb74yRi|oXqcsRByvp8yB-a<br=
>
zDBQf7`-4-z!WBTS4fe~PD_gBvo(p?=3DYh~+2VGI(UGyyv4mYQVQy)~VUvZJ+4x=3DmV7<br>
zR(~xxcr!Y^thQ8DG9Xk%XMgfvuq{xB&amp;w{=3D{(~Y+0U6{zqnTs8R)gI=3DnrlQ%PCf0A(<=
br>
z&lt;sFUkhbO5Oof9SGjW&gt;Ua%ez098fhXCV$lK~cE5qM#YPaq4D9hGKAtz5S;3xIoVjEl<br=
>
z8(ML1^x8NZCEyg1r&amp;*CyoZz};oWDHpxUj6Igod&lt;m4|UZTU7%PESg6}lqydG1=3DQ8^m=
<br>
z4q5sf@Q9F5NR)RAb^FJ&gt;_%G+&lt;Kjy`Me6s(K`(!&amp;@;GGB0IT&amp;2Hkf&lt;6eZ9=
S~XYYS+!<br>
z-n8DL^Da(+!7b+1g{spQ*&gt;ei-`vVnb4cg&gt;hYqm{=3D{H^8~t8Ls{E-wXIAl|@nVhXYV<=
br>
z^J)S+{FAZgw2|$Qdmd62+sBJr8&gt;~RNo8OeXdi8wC*Oecj#lYp7R_!E2=3D4CG05o2aW<br>
z|6~f9bju&lt;7FBf^l-&amp;=3D~-_NZ+)IWb5S80$5pe`-bS(0UkY7q=3Db0%6{E=3Du4EZ9_=
V?9m<br>
z(XgMSQZgsS=3DqCm_cX|=3DlSbE23sPqk^XLfZCm4?a&gt;2}?lpQ&lt;*KEWR`+i!yU@9dfn&=
amp;+<br>
zJ`I@j4=3D@rQX&lt;1uA{3+BEVU)D1Kx&gt;Q&gt;&amp;{h(wm{sv2`o9%^^2Mqae43p44;&g=
t;)~ih}~o<br>
z$@XPiu9w_vi0Wv0_vA()U}uZ!p4M$oHgd~&gt;HV8;b*PF}Jelv0U-&gt;6&lt;_-$z6&gt;RN=
na)<br>
z8H-vbDjiO_GZ?L(cyBQ1VCoGvAen#CsNPLO1G@u#FF+V8?DA#E5N?5?J&gt;oCdxBdN2<br>
zz_8{Mg^Ew%{qL;$o&lt;Oc{(}}-dD*v(ZeZw4B{J-C&amp;`pfN!A15IWKOR`KB!W@`2lT?f<b=
r>
z`y7GvU4SB0|F1WgvmjvwHZ@7vXCI%)dFpd!f13Bi`!3L#3bnxs%!GrwxZ61=3Dm3uNJ<br>
zwh(v@zU{5-3JmgvDEX60hS_wGT_M|ikVPN7L6c`?JDp|?_Bt-8mJ!{7Ozpj7$(9LB<br>
z^0niKzr{n2`=3D2EHc&amp;Hg5CbrnYXs~kuRts&gt;EeDI1B&lt;jH+Ogep35(!UqPA@_(xS&=
amp;YZi<br>
zv%4T-|Lp5a@TpAM*z%G68Zdd@;-QWZsIlV9wY;vVhK!E*Qxm2psIoqc#pr&gt;+#bzF7<br>
z(An$PdtSGzz@o%yx;twHv~FDo@If_rwa;uiAGLjWIB+6XxELy-4JZKCI49fqKflc&gt;<br>
z(Vb-Fp;s5O&amp;RPvsrJ$Aa1k@uLd*E0U&lt;TX~CE9D#pz^rs4POTe*2tN(TTt?6UszwTG<b=
r>
z*j{^Knt$&lt;@8a-&amp;PgT?Zz93@Wo7xHbB@W&gt;qCZtm)QuI&amp;t9MJdqydw^!m9(BF^=
=3DODdj<br>
z(A&amp;~NaoXZoy%6f|pcbkUdV;3*O6u5Wpjphu7HA5%`@hoUY0zvj&amp;GmI{+vuuVZ&lt;p=
eA<br>
zCrSpxo#eqbFk73bTJhn3tcNRgLzdn;VCS?GeGMGkU7SYh$02;@T2v+OHj`tJa_T~k<br>
zAq!tH0J@M36)4+A%lHm9dMxOC7AS2XP0C;s&lt;bsy2JW=3Dr#-v)AH4lO&lt;7P5U?HsD^Mq<=
br>
z;K1z8&amp;3SePDlCB-j?4fy+V1h@7-!(gX1&gt;9I9xTyUfJK-sq7=3DImFSrbB9ICEA`9jK{=
<br>
z=3Do39lvrvD3)3uFt)?llQUd95Y4{R=3D&lt;N6&amp;yy{iO2RulAsdxWYFGM&amp;ce)#&gt=
;toy+~5Hn<br>
zkg|Al^L;!5L9PW@zX$YG9$;h`$z1LWB10{_fNAGYoL&amp;dc*lN27ihJ`NuF}4XR=3Dd&gt;t=
<br>
z&amp;pwgAEf`L;&lt;JAletPGI_9jpY;(B#PYHf$r3yvQ~fy8Jm8*u_^sYh*X*(B_}la#Mzt<b=
r>
zIwt$TX^K~!sZRz_vq=3D(vn|(-eXG2n~3Y6Rv|4{Sc&lt;lof%i;H$+P)9ZB&lt;ve!98&lt;-=
O?<br>
zv1DMz5FpnAINS|LlvBVuYfh|qrV&amp;!q&lt;`10MrI+5)1uuP+7+|5NfJJj-Ses2_|4-s;<b=
r>
zM7T*b0zm~ishFhX$d)((ec*LYyS@exICH${;)|1{vx7rbzF3OKzoHJs&amp;|2%cqve{C<br>
zZ@8(flYJ64U5ho%J;xz;f`3?2&gt;Pa8T*^Nj$m3b0P@lt#I&amp;jr|NZlmxk7z9%_SfENX<b=
r>
zwf*tC7gHmk&amp;PR2_QqX^mIes0@5{-!j%STR~7ivP?g}|qwHKnY|kErh}g|Iz@(*#cj<br>
z1Iz78vtnC57JBqX8)~qu%^m)dQ)c?I^mcH&lt;Cida+-)#eHYV^SCtEe_+I&amp;xJv*s!!5<b=
r>
z=3D=3D1&lt;PO#NF6mrFDdREWclX&lt;&lt;zvbfhWvh6{}{j41T&gt;DsI&lt;keo^%u&amp;=
_T&gt;uG{0;UIZ7d~<br>
z&lt;BA$z*&lt;qVfqjH`F-ysg%APU^jMT9*d7SXXWG9f~};H-g`lfvn)14Xz+;re557q|#7<br=
>
zPJDAKF?fXr_L#x4*^#=3DfQ&gt;L%Dzxo{QyPf=3DSIqFv8W=3DStoK(*%c_5kC9DLJZ;*=3Dw=
ck<br>
z_)JGPRmHEokz7EZ1)N+zJjG%=3Dj2BdGo-QjRXCPf)Fm;q2+X%Hj&amp;kx)r@&lt;b3*BltWj=
<br>
zBN&lt;uw;o&amp;&amp;U=3Dq@60BK|h2p8x2T(}DLMp-9k2bQ*XZ_BM$4fej49b2G?kOc%q*C=
dfa+<br>
zHm1fzia7;o=3DwUyOrR}~!gLHXE4kV7X#1M&lt;#Zm*9bqGH#6mZr3&gt;-Ep%Boq0!9PfL1p<=
br>
z3}XZUiIU{)Owp@5vu&amp;|iWjGtFiyXKO+T${}f4WP=3DcI^17i5DcmRswtn1sK|R2H#aX<br=
>
z(5;mwnfwT+d;f-#L@qK^&lt;#gV%4By|&amp;e@;$#S}xDY5m?R4VjqL|xilBTIW%cC-w+Ev<b=
r>
zzLo6{*HBLf$_wRSf#*z!Ae(t+H?8w@z^lSh;0$4seLxy~z8_vdwuuyFKLn0Ul!6OY<br>
z;0T3Y8vnV@DnM@OMT%)Y0#~Og+brXtQVYD6?_2yvHvV7P_w~O)2{&amp;&gt;XuppUk1VHa_<b=
r>
zQ{}ReBQA&lt;5BTqpSXd!EKg*A}j(&amp;RN^XzwtFUuEX(mp#}Brjx`ENjr|tX6YiazimHD<b=
r>
zY1|JtZwN5IV&lt;*hxAKB}&gt;`NkXFr+3TK2eqFa{G~^lkPj_YT}~6)^(dlIm8x&gt;GWzj{#=
<br>
zcjUh2S5fY(JA!!MESnDhajJsHb8pYt;}MW(i8#YRC$}T9#@MlZo7s^O^9B&amp;n%GY;&lt;<b=
r>
zXc4YQ*J+|?SG2S_K7?s})~JtiVLVvEK~=3DYDSiW@bsOBszh&gt;umARMmWbH`Y%3R~`I3<br>
zh5lm|iZso9D2i6zTAPz#`&gt;AeQK|b^#-jG@|S4qGyECxG;aFhq@K@9b4U2GX@d3-(5<br>
zwn0rs8asWy!6vj8!8?7v9r&gt;(;L&lt;w;F&lt;nQfT&amp;mM7@+AuqXchqSp9x`gL?qv#U1=
#&amp;!M<br>
z3(LgNdT^{tGX#$ds}E{nLdP0_jB#ng&lt;o$CKY=3D)UHEt^!_!6$pRr{s{FghkjpIU9qE<br>
z9htJ&amp;B28vBqG;2C-|qdR!`dVcG?lkLgwg)d&lt;{iNX+Q&amp;8dal8KLyFRQ7y0ItEL`D=
43<br>
zKHi7{SwzGU=3D&gt;F*EekcmMynV#98~&lt;oaAJeA6MzHAy(*DsW-U_~;&gt;0H%);Y)w?a}$=
Ik<br>
z&gt;&gt;4qmzrJB&lt;=3DbLvTv?if1N3#CNF8jwUh(O05!*baE*%|Kxdeu#et}w&amp;@m_;Z=
Ufq-L{<br>
z`6IA%Dxe4cu-Q=3Dt*dMdd1S1f=3DZu0yQ*h_wpoQIMJ=3Doo*W1ucSZHYyU3dYgg&amp;?tGf=
a<br>
zGwg7n2)K8bICk(H=3D8(G1@W+MhUSb3ay_lZ=3DYgeUjyTF&amp;0(deBt)G0b~&gt;H2&gt;I=
KV3-k<br>
<br>
literal 0<br>
HcmV?d00001<br>
<br>
-- <br>
2.25.1<br>
<br>
</blockquote></div></div>

--000000000000afdc4805c9bf8858--

