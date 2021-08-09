Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 531783E4375
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 12:00:10 +0200 (CEST)
Received: from localhost ([::1]:55608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD24n-0001aC-Bq
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 06:00:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mD23T-0008F1-WC
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:58:48 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:38604)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mD23R-0000MA-8f
 for qemu-devel@nongnu.org; Mon, 09 Aug 2021 05:58:47 -0400
Received: by mail-wm1-x331.google.com with SMTP id
 i10-20020a05600c354ab029025a0f317abfso14120083wmq.3
 for <qemu-devel@nongnu.org>; Mon, 09 Aug 2021 02:58:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=AK8AjX99wYRxqisExXIEQIctZmnsOuMIhdowkr2iUwA=;
 b=cZesh/SsRDv3qXUu3roxZ/q+KR/dbWScm5kPm+RTIBLiRwq/qLvQzWsPzK751orcZo
 YHl4DQCkDYfqtTVfstRvDxkJRc0wgGGluA94+na5SuZLCY/eK8dyXe3poQyLQ5g8/uFN
 y+ywcwCKZyDDEKP5iXn7qS9RcGbsPCuQJHjJN0/71aQspevecDKQFFAbQkHHDIXJI/u0
 7PP2db0vHNG58yHOWlZVs8oUOSDF7IpM1afhARCPhdg6ircQcE8bypffhonHUMpu6GjW
 TJGvrYwO8hl6y59gbCFvIRDxu6ozGZ7HYGEFGzIb89clcECZ2zR/3izt+UwJZR7zucSy
 puLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=AK8AjX99wYRxqisExXIEQIctZmnsOuMIhdowkr2iUwA=;
 b=erm5VTiGEWfW+uNami8r3E65mRPLSpnlYDOmAmm9qPonYVaRKMfDlTAfKZV6dqaIfZ
 i15a7sT6jmaHifPN65+iO2yncoC2Pt1KQDcqwDpzlXp4ugeeUU4C7yq6zTJ6afkgeeAP
 yT3eLFyQE/rw4yOWWt9gkAb+m2WxAxUmkTc1F5ouC1RUQ8eGgzDA7p/yUCQxgBWvhkY5
 p9F5BABcLfKxvpWYUzQwkLtVOjGxFwWQSVyCXQ8KhnVyt2NLgJpH+WolFFWMT/xUM1vp
 tF7q2dzjY3DLo2BgX3T2/clSWAr0WvuiPyZTG38By7y29ViS2KJ8kmPZtU0vdgsToewH
 /edQ==
X-Gm-Message-State: AOAM533WXOLL1NdJ1u03mbFU/9sYLfT04DTUjvY42n8e+6xFtdzy9t4W
 rlCcUI1GhdgCUo8IW0dtNnxxJA==
X-Google-Smtp-Source: ABdhPJxFj0MjCTTd3yMvNmngkEb1q1LEyQT1CwGn8AXalQgZa1gCWpQhgs59lNwVPLVt7Jvxib1xUg==
X-Received: by 2002:a1c:188:: with SMTP id 130mr15899072wmb.184.1628503123050; 
 Mon, 09 Aug 2021 02:58:43 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id l18sm8949020wmc.30.2021.08.09.02.58.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 02:58:41 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 0FD501FF96;
 Mon,  9 Aug 2021 10:58:41 +0100 (BST)
References: <20210617121707.764126-1-ma.mandourr@gmail.com>
User-agent: mu4e 1.6.1; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [RFC PATCH v2] Add a post for the new TCG cache modelling plugin
Date: Mon, 09 Aug 2021 10:39:36 +0100
In-reply-to: <20210617121707.764126-1-ma.mandourr@gmail.com>
Message-ID: <87h7fzndm7.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: stefanha@gmail.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> This post introduces the new TCG plugin `cache` that's used for cache
> modelling. This plugin is a part of my GSoC 2021 participation.
>
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
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
>     posted until now.=20
>
>  .../2021-06-17-tcg-cache-modelling-plugin.md  | 266 ++++++++++++++++++
>  screenshots/2021-06-17-cache-structure.png    | Bin 0 -> 19675 bytes
>  2 files changed, 266 insertions(+)
>  create mode 100644 _posts/2021-06-17-tcg-cache-modelling-plugin.md
>  create mode 100644 screenshots/2021-06-17-cache-structure.png
>
> diff --git a/_posts/2021-06-17-tcg-cache-modelling-plugin.md b/_posts/202=
1-06-17-tcg-cache-modelling-plugin.md
> new file mode 100644
> index 0000000..5360916
> --- /dev/null
> +++ b/_posts/2021-06-17-tcg-cache-modelling-plugin.md
> @@ -0,0 +1,266 @@
> +---
> +layout: post
> +title:  "Cache Modelling TCG Plugin"
> +date:   2021-06-17 06:00:00 +0200
> +author: Mahmoud Mandour
> +categories: [TCG plugins, GSOC]
> +---
> +
> +TCG plugins provide means to instrument generated code for both user-mod=
e and
> +full system emulation. This includes the ability to intercept every memo=
ry
> +access and instruction execution. This post introduces a new TCG plugin =
that's
> +used to simulate configurable L1 separate instruction cache and data
> cache.

I think we should maybe add a sentence or two just to briefly explain
the purpose of a cache - perhaps with a link to a more complete
description on wikipedia? Perhaps:

  "Caches are a key way modern CPUs keep running at full speed by
  avoiding the need to fetch data and instructions from the
  comparatively slow system memory. As a result understanding cache
  behaviour is a key part of performance optimisation."

> +
> +The plugin aims to simply model different configurations of icache and d=
cache
> +rather than simulate intricate microarchitectural details. That's becaus=
e those
> +details generally vary from one microarchitecture to another.

Maybe reflow:

  "While different microarchitectures often have different different
  approaches at the very low level the core concepts of caching are
  universal. As QEMU is not microarchitectural emulator we model an
  ideal cache with a few simple parameters..."


> Also, those
> +details will be very different between TCG and real behavior. L1 caches =
are
> +usually of low associativity, so simulating them will give us a good ide=
a of
> +what happens in real life with code that thrashes the cache.
> +
> +## Overview
> +
> +The plugin simulates how L1 user-configured caches would behave when giv=
en a
> +working set defined by a program in user-mode, or system-wide working se=
t.
> +Subsequently, it logs performance statistics along with the most N
> +cache-thrashing instructions.
> +
> +### Configurability
> +
> +The plugin is configurable in terms of:
> +
> +* icache size parameters: `arg=3D"I=3DCACHE_SIZE ASSOC BLOCK_SIZE"`
> +* dcache size parameters: `arg=3D"D=3DCACHE_SIZE ASSOC BLOCK_SIZE"`
> +* Eviction policy: `arg=3D"evict=3Dlru|rand|fifo"`
> +* How many top-most thrashing instructions to log: `arg=3D"limit=3DTOP_N=
"`
> +* How many core caches to keep track of: `arg=3D"cores=3DN_CORES"`
> +
> +### Multicore caching
> +
> +Multicore caching is achieved by having independent L1 caches for each a=
vailable
> +core.
> +
> +In __full-system emulation__, the number of available vCPUs is known to =
the
> +plugin at plugin installation time, so separate caches are maintained fo=
r those.
> +
> +In __user-space emulation__, the index of the vCPU initiating a memory a=
ccess
> +monotonically increases and is limited with however much the kernel allo=
ws
> +creating. The approach used is that we allocate a static number of cache=
s, and
> +fit all memory accesses into those cores. This is viable having more thr=
eads
> +than cores will result in interleaving those threads between the availab=
le cores
> +so they might thrash each other anyway.
> +
> +## Design and implementation
> +
> +### General structure
> +
> +A generic cache data structure, `struct Cache`, is used to model either =
an
> +icache or dcache. For each known core, the plugin maintains an icache an=
d a
> +dcache. On a memory access coming from a core, the corresponding cache is
> +interrogated.
> +
> +Each cache has a number of cache sets that are used to store the actual =
cached
> +locations alongside metadata that backs eviction algorithms. The structu=
re of a
> +cache with `n` sets, and `m` blocks per sets is summarized in the follow=
ing
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
> +On a cache miss that requires eviction, a randomly chosen block is evict=
ed to
> +make room for the newly-fetched block.
> +
> +Using random eviction effectively requires no metadata for each set.
> +
> +#### Least recently used (LRU)
> +
> +For each set, a generation number is maintained that is incremented on e=
ach
> +memory access and. The current generation number is assigned to the block
> +currently being accessed. On a cache miss, the block with the least gene=
ration
> +number is evicted.
> +
> +#### FIFO eviction
> +
> +A FIFO queue instance is maintained for each set. On a cache miss, the e=
victed
> +block is the first-in block, and the newly-fetched block is enqueued as =
the
> +last-in block.
> +
> +## Usage
> +
> +Now a simple example usage of the plugin is demonstrated by running a pr=
ogram
> +that has does matrix multiplication, and how the plugin helps identify c=
ode that
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
> +./x86_64-linux-user/qemu-x86_64 $(QEMU_ARGS) \
> +  -plugin ./contrib/plugins/libcache.so,arg=3D"D=3D8192 4 64",arg=3D"I=
=3D8192 4 64" \
> +  -d plugin \
> +  -D matmul.log \
> +  ./mm_test
> +```

You can drop the leading "./x86_64-linux-user/" as the build system
leaves the binaries in the top of build directory these days.

> +
> +The preceding command will run QEMU and attach the plugin with the follo=
wing
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
> +core #, data accesses, data misses, dmiss rate, insn accesses, insn miss=
es, imiss rate
> +0       4908419        274545          5.5933%  8002457        1005     =
       0.0126%
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
> +* The most cache-thrashing instructions belong to a symbol called `mm`, =
which
> +    happens to be the matrix multiplication function.
> +* Some array-indexing instructions are generating the greatest share of =
data
> +    misses.
> +
> +`test_mm` does a bunch of other operations other than matrix multiplicat=
ion.
> +However, Using the plugin data, we can narrow our investigation space to=
 `mm`,
> +which happens to be generating about 98% of the overall number of misses.
> +
> +Now we need to find out why is the instruction at address `0x4000001224`
> +thrashing the cache. Looking at the disassembly of the program, using
> +`objdump -Sl test_mm`:
> +
> +```
> +/path/to/test_mm.c:11 (discriminator 3)
> +                int op2 =3D m2[k][j];  <- The line of code we're interes=
ted in
> +    1202:	8b 75 c0             	mov    -0x40(%rbp),%esi
> +    1205:	48 63 fe             	movslq %esi,%rdi
> +    1208:	48 63 f2             	movslq %edx,%rsi
> +    120b:	48 0f af f7          	imul   %rdi,%rsi
> +    120f:	48 8d 3c b5 00 00 00 	lea    0x0(,%rsi,4),%rdi
> +    1216:	00
> +    1217:	48 8b 75 a8          	mov    -0x58(%rbp),%rsi
> +    121b:	48 01 f7             	add    %rsi,%rdi
> +    121e:	8b 75 c8             	mov    -0x38(%rbp),%esi
> +    1221:	48 63 f6             	movslq %esi,%rsi
> +    1224:	8b 34 b7             	mov    (%rdi,%rsi,4),%esi
> +                                	^^^^^^^^^^^^^^^^^^^^^^^^^
> +    1227:	89 75 d4             	mov    %esi,-0x2c(%rbp)
> +```
> +
> +It can be seen that the most problematic instruction is associated with =
loading
> +`m2[k][j]`. This happens because we're traversing `m2` in a column-wise =
order.
> +So if the matrix `m2` is larger than the data cache, we end up with fetc=
hing
> +blocks that we only use one integer from and not use again before getting
> +evicted.
> +
> +A simple solution to this problem is to [transpose](https://en.wikipedia=
.org/wiki/Transpose)
> +the second matrix and access it in a row-wise order.
> +
> +By editing the program to transpose `m2` before calling `mm` and run it =
inside
> +QEMU with the plugin attached and using the same configuration as previo=
usly,
> +the following data is logged in `matmul.log`:
> +
> +```
> +core #, data accesses, data misses, dmiss rate, insn accesses, insn miss=
es, imiss rate
> +0       4998994        24235           0.4848%  8191937        1009     =
       0.0123%
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
> +It can be seen that a minor number of misses is generated at transpositi=
on time
> +in `tran`. The rest of the matrix multiplication is carried out using th=
e same
> +procedure but to multiply `m1[i][k]` by `m2[j][k]`. So `m2` is traversed
> +row-wise and hence utilized cache space much more optimally.

Very nicely worked through example ;-)

> +
> +### Multi-core caching
> +
> +The plugin accepts a `cores=3DN_CORES` argument that represents the numb=
er of
> +cores that the plugin must keep track of. Memory accesses generated by e=
xcess
> +threads will be served through the available core caches.

We should probably expand a bit on the approach here that this model is
an approximation that works well when threads < physical cores available
and there is a good chance the threads aren't exposed to scheduling
pressure which will invariably trigger cache flushes.

> +
> +An example usage of the plugin using the `cores` argument against a prog=
ram that
> +creates 4 threads:
> +
> +```
> +./x86_64-linux-user/qemu-x86_64 $(QEMU_ARGS) \
> +    -plugin ./contrib/plugins/libcache.so,arg=3D"cores=3D4" \
> +    -d plugin \
> +    -D logfile \
> +    ./threaded_prog
> +```

Again drop the leading "x86_64-linux-user"

> +
> +This reports out the following:
> +
> +```
> +core #, data accesses, data misses, dmiss rate, insn accesses, insn miss=
es, imiss rate
> +0       76739          4195          5.411666%  242616         1555     =
       0.6409%
> +1       29029          932           3.211106%  70939          988      =
       1.3927%
> +2       6218           285           4.511835%  15702          382      =
       2.4328%
> +3       6608           297           4.411946%  16342          384      =
       2.3498%
> +sum     118594         5709          4.811139%  345599         3309     =
       0.9575%
> +
> +...
> +```
> +
> +## Conclusion
> +
> +By emulating simple configurations of icache and dcache we can gain insi=
ghts
> +about how a working set is utilizing cache memory. Simplicity is sought =
and
> +L1 cache is emphasized since its under-utilization can be severe to the =
overall
> +system performance.
> +
> +This plugin is made as part of my GSoC participation for the year 2021 u=
nder the
> +mentorship of Alex Benn=C3=A9e.
> +
> +List of posted patches related to the plugin:
> +
> +[[RFC PATCH v3 0/4] Cache TCG plugin & symbol-resolution API](https://pa=
tchew.org/QEMU/20210608040532.56449-1-ma.mandourr@gmail.com/)=20=20
> +[[RFC PATCH v3 1/4] plugins/api: expose symbol lookup to plugins](https:=
//patchew.org/QEMU/20210608040532.56449-1-ma.mandourr@gmail.com/20210608040=
532.56449-2-ma.mandourr@gmail.com/)=20=20
> +[[RFC PATCH v3 2/4] plugins: Added a new cache modelling plugin.](https:=
//patchew.org/QEMU/20210608040532.56449-1-ma.mandourr@gmail.com/20210608040=
532.56449-3-ma.mandourr@gmail.com/)=20=20
> +[[RFC PATCH v3 3/4] plugins/cache: Enabled cache parameterization](https=
://patchew.org/QEMU/20210608040532.56449-1-ma.mandourr@gmail.com/2021060804=
0532.56449-4-ma.mandourr@gmail.com/)=20=20
> +[[RFC PATCH v3 4/4] plugins/cache: Added FIFO and LRU eviction policies]=
(https://patchew.org/QEMU/20210608040532.56449-1-ma.mandourr@gmail.com/2021=
0608040532.56449-5-ma.mandourr@gmail.com/)
<snip>

As mentioned in IRQ this can be updated and maybe a reference to the
plugins/next tree (as we are in a release cycle).

Otherwise looking pretty good.

--=20
Alex Benn=C3=A9e

