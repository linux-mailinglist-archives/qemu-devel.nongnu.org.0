Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEA33A83FB
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 17:29:01 +0200 (CEST)
Received: from localhost ([::1]:42962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltAzs-0003YX-85
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 11:29:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltAv3-0004yU-IH
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:24:01 -0400
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b]:36609)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltAux-00077H-Tk
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:24:01 -0400
Received: by mail-wm1-x32b.google.com with SMTP id
 h11-20020a05600c350bb02901b59c28e8b4so2060656wmq.1
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 08:23:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=ybUuTNpxK90exmz47m9QEftFwbdHyQ72201XQ9l1D+k=;
 b=qFPNlp5rUmfJLz/XE3kq8LV5XlTMh7IDr7pJoP/kDQDtW2/6F0Bz3djseE5lQw8OfF
 GURa9ZVXhXhpGZnm4P+ylCvFBmikY9cki0JGlpg4KOUY3wyPZgly5rcdE3U7Gop3jC8k
 oWI0qftQdXFAfurWlUycskw0qvZrhG7qTjng5p1j7hTdbTj5o7OFfYwZm+/rHZpaLamg
 iHe+Df2FCzFGDjVV45zl88rUVu6K2Ojz+MHFwYSpzh6UuBZbTaFPAjWxOuowMZ2UM7qf
 B9Z2UhUrgxzGcjm6cRi2hfGewL66QaH6+ThFaQt0LLniv9Vbb3/aU4xgemWQbnd0uA5n
 zEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:references:date:in-reply-to
 :message-id:user-agent:mime-version:content-transfer-encoding;
 bh=ybUuTNpxK90exmz47m9QEftFwbdHyQ72201XQ9l1D+k=;
 b=FVqJke7Pqxayi4mBvEcuul6RvEiiqVE2o4mireftMLSgRh/GbLY3Vy2CsgAqZ1I0Lx
 ufBhPs4EZqc947SaONddskC3RmJ/0j/yWy0ssdb0qS46oo6rS/QIA4Nc/IV7+1h55NY4
 KpzDE9hkPKwSC4dW9NincoEMvuasNLjs0FR7A4Z7JwrIUqEfs73RlJRniXYMdI4Wv5wN
 fUO6Evvf46Aw9mQtEjvJwEA5ADROQIJjbwqith10r8I8r2CZTV045CuvA8k6mnbSNRAG
 0LdzI6fAR2d/I2AR4HhPzoQCqVyxvXQ5zhKjYx35uq5zNPD5sg2fRTRlZuFZQeWVms6u
 iY/Q==
X-Gm-Message-State: AOAM531yycgfYJgad2NkNmorrzThyGdyCp+8fpThvMJjfbOlp2iVJ/Wz
 56TNFr/1tkpQCp+aaibnurWx9Q==
X-Google-Smtp-Source: ABdhPJxoeS1D6f0NgJ5DCaW1f/qEAuAvTRxNP/4qGjI/IIJOK5saKnTzXbnsQcuz1slcSP9ouhSMOw==
X-Received: by 2002:a7b:c417:: with SMTP id k23mr5788132wmi.71.1623770633981; 
 Tue, 15 Jun 2021 08:23:53 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id 25sm2425355wmk.20.2021.06.15.08.23.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 08:23:52 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 3399B1FF7E;
 Tue, 15 Jun 2021 16:23:52 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [RFC PATCH] Add a post for the new TCG cache modelling plugin
References: <20210615142222.525516-1-ma.mandourr@gmail.com>
Date: Tue, 15 Jun 2021 16:23:52 +0100
In-Reply-To: <20210615142222.525516-1-ma.mandourr@gmail.com> (Mahmoud
 Mandour's message of "Tue, 15 Jun 2021 16:22:22 +0200")
Message-ID: <87czsngnhz.fsf@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32b.google.com
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
Cc: stefanha@gmail.com, berrange@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Mahmoud Mandour <ma.mandourr@gmail.com> writes:

> This post introduces the new TCG plugin `cache` that's used for cache
> modelling. This plugin is a part of my GSoC 2021 participation.
>
> Signed-off-by: Mahmoud Mandour <ma.mandourr@gmail.com>
> ---
>
> This initial RFC patch reflects the latest version that I have for the
> plugin (the multi-core part is not yet reviewed). That's mainly because
> I think we have settled a plan and design for this part and the missing.
> This post analyses the approach that we plan on taking and represents
> the output logs in it's (hopefully) last form.
>
>  .../2021-06-15-tcg-cache-modelling-plugin.md  | 191 ++++++++++++++++++
>  screenshots/2021-06-15-cache-structure.png    | Bin 0 -> 19675 bytes
>  2 files changed, 191 insertions(+)
>  create mode 100644 _posts/2021-06-15-tcg-cache-modelling-plugin.md
>  create mode 100644 screenshots/2021-06-15-cache-structure.png
>
> diff --git a/_posts/2021-06-15-tcg-cache-modelling-plugin.md b/_posts/202=
1-06-15-tcg-cache-modelling-plugin.md
> new file mode 100644
> index 0000000..ca9694a
> --- /dev/null
> +++ b/_posts/2021-06-15-tcg-cache-modelling-plugin.md
> @@ -0,0 +1,191 @@
> +---
> +layout: post
> +title:  "Cache Modelling TCG Plugin"
> +date:   2021-06-14 06:00:00 +0000
> +author: Mahmoud Mandour
> +categories: [TCG plugins, GSOC]
> +---
> +
> +TCG plugins provide means to instrument generated code for both user-mod=
e and
> +full system emulation, including the ability to intercept every
> memory access

Try and trim the sentences to be a bit shorter maybe?

  "full system emulation. This includes the ability...""

> +and instruction execution; this post introduces a new TCG plugin
> that's used to

 "This post introduces a new TCG plugin that simulates a simple L1
 instruction and data cache."

You could expand on why we don't do microarchitectural stuff in a follow
up sentence.

> +simulate configurable L1 separate instruction cache and data cache with
> +simplicity in mind rather than simulate the intricate microarchitectural
> +details.
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
> +* How many top-most thrashing insns to log: `arg=3D"limit=3DTOP_N"`
> +* How many core caches to keep track of: `arg=3D"cores=3DN_CORES"`
> +
> +### Multicore caching
> +
> +Multicore caching is achieved through having independent L1 caches for e=
ach
> +available core.
> +
> +In __full-system emulation__, the number of available vCPUs is known to =
the
> +plugin at plugin-installation time, so separate caches are maintained fo=
r those.
> +
> +In __user-space emulation__, the index of the vCPU initiating a memory a=
ccess
> +monotonically increases and is limited with however much the kernel allo=
ws to
> +create. The approach used is that we allocate a static number of caches,=
 and fit
> +all memory accesses into those cores. This is viable having more threads=
 than
> +cores will result in interleaving those threads between the available co=
res so
> +they might thrash each other anyway.
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
> +locations alongside with metadata that back eviction algorithms. The
> +structure of a cache with `n` sets, and `m` blocks per sets is summarize=
d in
> +the following figure:
> +
> +![cache structure](/screenshots/2021-06-15-cache-structure.png)
> +
> +### Eviction algorithms
> +
> +The plugin supports three eviction algorithms:
> +
> +* Random eviction
> +* Least recently used (LRU)
> +* FIFO eviction
> +
> +##### Random eviction
> +
> +On a cache miss that requires eviction, a randomly-chosen block is evict=
ed to
> +make room for the newly-fetched block.
> +
> +Using random eviction effectively requires no meta data for each set.
> +
> +#### Least recently used (LRU)
> +
> +For each set, a generation number is maintained that is incremented on e=
ach
> +memory access and. Current generation number is assigned to the block
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
> +An example usage of the plugin with comparing naive matrix multiplicatio=
n and
> +blocked matrix multiplication with matrix block size matching the cache =
block
> +size:
> +
> +```
> +./x86_64-linux-user/qemu-x86_64 $(QEMU_ARGS) \
> +  -plugin ./contrib/plugins/libcache.so,arg=3D"D=3D8192 4 64",arg=3D"I=
=3D8192 4 64" \
> +  -d plugin \
> +  -D naive.log \
> +  ./naive_matmul
> +```
> +
> +```
> +./x86_64-linux-user/qemu-x86_64 $(QEMU_ARGS) \
> +  -plugin ./contrib/plugins/libcache.so,arg=3D"D=3D8192 4 64",arg=3D"I=
=3D8192 4 64" \
> +  -d plugin \
> +  -D blocked.log \
> +  ./blocked_matmul
> +```
> +
> +This will run QEMU and attaches the plugin for both programs. Both runs =
have the
> +same configuration:
> +
> +* dcache: cachesize =3D 8KBs, associativity =3D 4, blocksize =3D 64B.
> +* icache: cachesize =3D 8KBs, associativity =3D 4, blocksize =3D 64B.
> +* Default eviction policy is LRU (used for both caches).
> +* Single core cache
> +
> +Running both instances will log the following:

Perhaps instead of delving into the logs we could but snippet of the mm
function as a block and annotate where the cache drop instructions are.=20

> +
> +* naive.log
> +
> +```
> +core #, data accesses, data misses, dmiss rate, insn accesses, insn miss=
es, imiss rate
> +0       6832990        272871          3.9934%  15429566       10308    =
       0.0668%
> +
> +address, data misses, instruction
> +0x40000017cf (mm), 262143, movl (%rax, %rsi, 4), %eax
> +0x40000017a8 (mm), 5293, movl (%rax, %rcx, 4), %ecx
> +0x40019ad54e, 511, movzwl 6(%rcx), %edi
> +0x4000001886 (mm), 377, movl (%rax, %rdx, 4), %eax
> +...
> +```
> +
> +* blocked.log
> +
> +```
> +core #, data accesses, data misses, dmiss rate, insn accesses, insn miss=
es, imiss rate
> +0       7240895        8882            0.1227%  16161159       10058    =
       0.0622%
> +
> +address, data misses, instruction
> +0x400000180c (bmm), 2088, movl (%rax, %rsi, 4), %eax
> +0x40000017ba (bmm), 980, movl (%rax, %rdx, 4), %edx
> +0x40000017e5 (bmm), 640, movl (%rax, %rcx, 4), %ecx
> +0x40019ad54e, 511, movzwl 6(%rcx), %edi
> +...
> +```
> +
> +We can note that a mov instrution that belongs to a symbol calls `mm`(in=
 this
> +case, `mm` is the function that carries out naive matrix multiplication)=
 is the
> +causing about 96% of the overall instruction caches. On the other hand, =
in case
> +of the blocked matrix multiplication data miss rate is much less.

Is this because the cache miss has been pushed to an outer function? I
think having the hot inner loop shown as a whole will help show the
differences.

> +
> +#### Multi-core caching
> +
> +The plugin accepts a `cores=3DN_CORES` argument that represents the numb=
er of
> +cores that the plugin must keep track of. Memory accesses generated by e=
xcess
> +threads will be served through the available core caches.
> +
> +An example usage of the plugin using the `cores` agrument against a
> program that

argument

> +creates 4 threads:
> +
> +```
> +./x86_64-linux-user/qemu-x86_64 $(QEMU_ARGS) \
> +    -plugin ./contrib/plugins/libcache.so,arg=3D"cores=3D4" \
> +    -d plugin \
> +    -D logfile \
> +    ./threaded_prog
> +```
> +
> +This reports out the following:
> +
> +```
> +core #,data accesses,data misses,dmiss rate,insn accesses,insn misses,im=
iss rate
> +0      76739         4195         5.411666% 242616        1555          =
 0.6409%
> +1      29029         932          3.211106% 70939         988           =
 1.3927%
> +2      6218          285          4.511835% 15702         382           =
 2.4328%
> +3      6608          297          4.411946% 16342         384           =
 2.3498%
> +sum    118594        5709         4.811139% 345599        3309          =
 0.9575%
> +

You can drop the summary of instructions from here unless you are going
to talk about it in more detail.

> +address, data misses, instruction
> +0x40019d254e, 510, movzwl 6(%rcx), %edi
> +0x40019d24fe, 290, movq 8(%rcx), %rbp
> +0x4001814304, 238, movq %rdx, (%rcx)
> +0x40018142e0, 161, movq (%rax), %rcx
> +0x40018142f9, 159, movq 0x10(%rax), %rdx
> +...
> +```

And perhaps an brief outro summarising the work and pointing to the
patches on list (patchew archive links are good for this).

> diff --git a/screenshots/2021-06-15-cache-structure.png b/screenshots/202=
1-06-15-cache-structure.png
> new file mode 100644
> index 0000000000000000000000000000000000000000..82a9dc07710e3d9be738d20c6=
75c69aa90a48942
> GIT binary patch
> literal 19675
> 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
>
> literal 0
> HcmV?d00001

--=20
Alex Benn=C3=A9e

