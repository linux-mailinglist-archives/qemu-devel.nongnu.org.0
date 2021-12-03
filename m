Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1605467C98
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 18:33:24 +0100 (CET)
Received: from localhost ([::1]:35856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtCR1-0006GW-GJ
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 12:33:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mtCPR-0005ZL-H1
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 12:31:49 -0500
Received: from [2a00:1450:4864:20::333] (port=56213
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1mtCPO-0006xs-6n
 for qemu-devel@nongnu.org; Fri, 03 Dec 2021 12:31:45 -0500
Received: by mail-wm1-x333.google.com with SMTP id p18so2883581wmq.5
 for <qemu-devel@nongnu.org>; Fri, 03 Dec 2021 09:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=6M7s8ahB8VEl3Syn32UwLkgK24VVjS50bA02n4NiDq4=;
 b=SO/DzLmXZNtMMWydokL+AhMlLAa8EAKIGcPh97ss5o5ZAr9PuHwNLxsdDsxb1hnQw+
 FfmOEkYokyjTrt60Lds1bMtrNStB9z6SSq4CjKf7ismOy4zILThk4EBTt40pA7OvlPf7
 EIQBhDZWjplxX+DHde5vtclsqKA+GbHzwevZs1Xv8QpldLvnvudlJMe7n8/mqEj9y0/x
 dOt4f7psfhq4cBY/PF8ZFoX8Xa4cYHlo5kvqX/KzYjWISEUYAnAQwhsT5CqgT8KSBejC
 AQJZKKViaFeKre6pha5z0WYsSdYm0GRLt1g/WXwQhCXl8jeB3MlvPXHprBgo3saf22sQ
 waDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=6M7s8ahB8VEl3Syn32UwLkgK24VVjS50bA02n4NiDq4=;
 b=Nk4WX+N4Sek8JFK/6aDF5AttVu7BZC7g+RF91t4bLVy/C+sXsQ7H9eLfpnzyUluuqk
 /EvgCKzHpCg0/YKy6pJa7JbWa6edneT0G507xBLGnu5gGCYsS8h7k1tbtP5PT0jaG1ZF
 PxzzxU7ROAQuAt6CZx8an4sFMUH/k4eESp8q24d3dtmKcQxNaWJScp0X1VlRM1YHhxr+
 bQjvyY/j7sQHcZ1qEJYEZIdkatfP6cf7Qu5KteAkymd8W9VAtyGJ4icEwxyLlMmZu7qH
 /JgZmgTvkMjy9yshQVjRBp/Xhu7nBwMUOyc6Ev8cKK6yO/LQFYmYrApGNlSm2heHJDRG
 Q2QQ==
X-Gm-Message-State: AOAM530GUyeBAF/VBnjJWiFAjgH0S2M2yEYgQyu/zF/h0ADsu86It7xu
 mlmpLybEEqS9qzF76D63gR1XPA==
X-Google-Smtp-Source: ABdhPJzpRa/JyJfcW1NPAkpwto4R+d0hs5rk8IgxaMBFtYa3/PKxgEHZdNP1SmYDNdI106YpATLwgw==
X-Received: by 2002:a05:600c:198f:: with SMTP id
 t15mr16803679wmq.94.1638552700390; 
 Fri, 03 Dec 2021 09:31:40 -0800 (PST)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id o10sm4138410wri.15.2021.12.03.09.31.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 09:31:39 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id BAABF1FF96;
 Fri,  3 Dec 2021 17:31:38 +0000 (GMT)
References: <c76bde31-8f3b-2d03-b7c7-9e026d4b5873@huawei.com>
 <87bl1zxaeu.fsf@linaro.org> <7d137a2403be43b7a1c5857e96866403@huawei.com>
User-agent: mu4e 1.7.5; emacs 28.0.60
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Vasilev Oleg <vasilev.oleg@huawei.com>
Subject: Re: Suggestions for TCG performance improvements
Date: Fri, 03 Dec 2021 17:27:18 +0000
In-reply-to: <7d137a2403be43b7a1c5857e96866403@huawei.com>
Message-ID: <87v905wq6d.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 Konobeev Vladimir <konobeev.vladimir@huawei.com>,
 Plotnik Nikolay <plotnik.nikolay@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Andrey Shinkevich <andrey.shinkevich@huawei.com>,
 "Emilio G. Cota" <cota@braap.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "Chengen \(William, FixNet\)" <chengen@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Vasilev Oleg <vasilev.oleg@huawei.com> writes:

> On 12/2/2021 7:02 PM, Alex Benn=C3=A9e wrote:
>
>> Vasilev Oleg <vasilev.oleg@huawei.com> writes:
>>
>>> I've discovered some MMU-related suggestions in the 2018 letter[2], and
>>> those seem to be still not implemented (flush still uses memset[3]).
>>> Do you think we should go forward with implementing those?
>> I doubt you can do better than memset which should be the most optimised
>> memory clear for the platform. We could consider a separate thread to
>> proactively allocate and clear new TLBs so we don't have to do it at
>> flush time. However we wouldn't have complete information about what
>> size we want the new table to be.
>>
>> When a TLB flush is performed it could be that the majority of the old
>> table is still perfectly valid.=20
>
> In that case, do you think it would be possible instead of flushing
> TLBs, store it somewhere and bring it back when the address space
> changes back?

It would need a new interface into cputlb but I don't see why not.

>
>> However we would need a reliable mechanism to work out which entries in =
the table could be kept.=20
>
> We could invalidate entries in those stored TLBs the same way we
> invalidate the active TLB. If we are going to have new thread to
> manage TLB allocation, invalidation could also be offloaded to those.
>
>> I did ponder a debug mode which would keep the last N tables dropped by
>> tlb_mmu_resize_locked and then measure the differences in the entries
>> before submitting the free to an rcu tasks.
>>> The mentioned paper[4] also describes other possible improvements.
>>> Some of those are already implemented (such as victim TLB and dynamic
>>> size for TLB), but others are not (e.g. TLB lookup uninlining and
>>> set-associative TLB layer). Do you think those improvements
>>> worth trying?
>> Anything is worth trying but you would need hard numbers. Also its all
>> too easy to target micro benchmarks which might not show much difference
>> in real world use.=20
>
> The  mentioned paper presents some benchmarking, e. g. linux kernel
> compilation and some other stuff. Do you think those shouldn't be
> trusted?

No they are good. To be honest it's the context switches that get you.
Look at "info jit" between a normal distro and a initramfs shell. Places
where the kernel is switching between multiple maps means a churn of TLB
data.

See my other post with a match of "msr ttrb"

>
>> The best thing you can do at the moment is give the
>> guest plenty of RAM so page updates are limited because the guest OS
>> doesn't have to swap RAM around.
>>
>> Another optimisation would be looking at bigger page sizes. For example
>> the kernel (in a Linux setup) usually has a contiguous flat map for
>> kernel space. If we could represent that at a larger granularity then
>> not only could we make the page lookup tighter for kernel mode we could
>> also achieve things like cross-page TB chaining for kernel functions.
>
> Do I understand correctly that currently softmmu doesn't treat
> hugepages any special, and you are suggesting we add such support, so
> that a particular region of memory occupies less TLBentries? This
> probably means TLB lookup would become quite a bit more complex.
>
>>> Another idea for decreasing occurence of TLB refills is to make TBs key
>>> in htable independent of physical address. I assume it is only needed
>>> to distinguish different processes where VAs can be the same.
>>> Is that assumption correct?
>
> This one, what do you think? Can we replace physical address as part
> of a key in TB htable with some sort of address space identifier?

Hmm maybe - so a change in ASID wouldn't need a total flush?

>
>>> Do you have any other ideas which parts of TCG could require our
>>> attention w.r.t the flamegraph I attached?
>> It's been done before but not via upstream patches but improving code
>> generation for hot loops would be a potential performance win.=20
>
> I am not sure optimizing the code generation itself would help much,
> at least in our case. The flamegraph I attached to previous letter
> shows that only about 10% of time qemu spends in generated code. The
> rest is helpers, searching for next block, TLB-related stuff and so
> on.
>
>> That would require some changes to the translation model to allow for
>> multiple exit points and probably introducing a new code generator
>> (gccjit or llvm) to generate highly optimised code.
>
> This, however, could bring a lot of performance gain, translation blocks =
would become bigger, and we would spend less time searching for the next bl=
ock.
>
>>> I am also CCing my teammates. We are eager to improve the QEMU TCG
>>> performance for our needs and to contribute our patches to upstream.
>> Do you have any particular goal in mind or just "better"? The current
>> MTTCG scaling tends to drop off as we go above 10-12 vCPUs due to the
>> cost of synchronous flushing across all those vCPUs.
>
> We have some internal ways to measure performance, but we are looking
> for alternative metric, that we could share and you could reproduce.
> Sysbench in threads mode is the closed we have found so far by
> comparing flamegraphs, but we are testing more benchmarking software.

OK.

>
>>> [1]: https://github.com/akopytov/sysbench
>>> [2]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg562103.html
>>> [3]:=20
>>> https://github.com/qemu/qemu/blob/14d02cfbe4adaeebe7cb833a8cc71191352cf=
03b/accel/tcg/cputlb.c#L239
>>> [4]: https://dl.acm.org/doi/pdf/10.1145/2686034
>>>
>>> [2. flamegraph.svg --- image/svg+xml; flamegraph.svg]...
>>>
>>> [3. callgraph.svg --- image/svg+xml; callgraph.svg]...
>>>
> Thanks,
> Oleg


--=20
Alex Benn=C3=A9e

