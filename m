Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EF39467B47
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Dec 2021 17:23:25 +0100 (CET)
Received: from localhost ([::1]:37578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mtBLH-0008RX-Ql
	for lists+qemu-devel@lfdr.de; Fri, 03 Dec 2021 11:23:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54086)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vasilev.oleg@huawei.com>)
 id 1mtBJP-0007U5-14; Fri, 03 Dec 2021 11:21:27 -0500
Received: from szxga01-in.huawei.com ([45.249.212.187]:2959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vasilev.oleg@huawei.com>)
 id 1mtBJL-00038E-2z; Fri, 03 Dec 2021 11:21:26 -0500
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4J5J3J4JbGzcbbv;
 Sat,  4 Dec 2021 00:21:00 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sat, 4 Dec 2021 00:21:09 +0800
Received: from dggpeml500023.china.huawei.com (7.185.36.114) by
 dggpemm500007.china.huawei.com (7.185.36.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Sat, 4 Dec 2021 00:21:09 +0800
Received: from dggpeml500023.china.huawei.com ([7.185.36.114]) by
 dggpeml500023.china.huawei.com ([7.185.36.114]) with mapi id 15.01.2308.020;
 Sat, 4 Dec 2021 00:21:09 +0800
To: =?iso-8859-1?Q?Alex_Benn=E9e?= <alex.bennee@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Richard Henderson
 <richard.henderson@linaro.org>, Paolo Bonzini <pbonzini@redhat.com>, "Emilio
 G. Cota" <cota@braap.org>, "peter.maydell@linaro.org"
 <peter.maydell@linaro.org>, "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Plotnik Nikolay <plotnik.nikolay@huawei.com>, Andrey Shinkevich
 <andrey.shinkevich@huawei.com>, Konobeev Vladimir
 <konobeev.vladimir@huawei.com>, "Chengen (William, FixNet)"
 <chengen@huawei.com>
Subject: Re: Suggestions for TCG performance improvements
Thread-Topic: Suggestions for TCG performance improvements
Thread-Index: AQHX52GV5RpBCy0TxkCBqrK5dfMw1Q==
Date: Fri, 3 Dec 2021 16:21:08 +0000
Message-ID: <7d137a2403be43b7a1c5857e96866403@huawei.com>
References: <c76bde31-8f3b-2d03-b7c7-9e026d4b5873@huawei.com>
 <87bl1zxaeu.fsf@linaro.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.47.173.106]
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=vasilev.oleg@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Vasilev Oleg <vasilev.oleg@huawei.com>
From:  Vasilev Oleg via <qemu-devel@nongnu.org>

On 12/2/2021 7:02 PM, Alex Benn=E9e wrote:=0A=
=0A=
> Vasilev Oleg <vasilev.oleg@huawei.com> writes:=0A=
>=0A=
>> I've discovered some MMU-related suggestions in the 2018 letter[2], and=
=0A=
>> those seem to be still not implemented (flush still uses memset[3]).=0A=
>> Do you think we should go forward with implementing those?=0A=
> I doubt you can do better than memset which should be the most optimised=
=0A=
> memory clear for the platform. We could consider a separate thread to=0A=
> proactively allocate and clear new TLBs so we don't have to do it at=0A=
> flush time. However we wouldn't have complete information about what=0A=
> size we want the new table to be.=0A=
>=0A=
> When a TLB flush is performed it could be that the majority of the old=0A=
> table is still perfectly valid. =0A=
=0A=
In that case, do you think it would be possible instead of flushing TLBs, s=
tore it somewhere and bring it back when the address space changes back? =
=0A=
=0A=
> However we would need a reliable mechanism to work out which entries in t=
he table could be kept. =0A=
=0A=
We could invalidate entries in those stored TLBs the same way we invalidate=
 the active TLB. If we are going to have new thread to manage TLB allocatio=
n, invalidation could also be offloaded to those.=0A=
=0A=
> I did ponder a debug mode which would keep the last N tables dropped by=
=0A=
> tlb_mmu_resize_locked and then measure the differences in the entries=0A=
> before submitting the free to an rcu tasks.=0A=
>> The mentioned paper[4] also describes other possible improvements.=0A=
>> Some of those are already implemented (such as victim TLB and dynamic=0A=
>> size for TLB), but others are not (e.g. TLB lookup uninlining and=0A=
>> set-associative TLB layer). Do you think those improvements=0A=
>> worth trying?=0A=
> Anything is worth trying but you would need hard numbers. Also its all=0A=
> too easy to target micro benchmarks which might not show much difference=
=0A=
> in real world use. =0A=
=0A=
The  mentioned paper presents some benchmarking, e. g. linux kernel compila=
tion and some other stuff. Do you think those shouldn't be trusted?=0A=
=0A=
> The best thing you can do at the moment is give the=0A=
> guest plenty of RAM so page updates are limited because the guest OS=0A=
> doesn't have to swap RAM around.=0A=
>=0A=
> Another optimisation would be looking at bigger page sizes. For example=
=0A=
> the kernel (in a Linux setup) usually has a contiguous flat map for=0A=
> kernel space. If we could represent that at a larger granularity then=0A=
> not only could we make the page lookup tighter for kernel mode we could=
=0A=
> also achieve things like cross-page TB chaining for kernel functions.=0A=
=0A=
Do I understand correctly that currently softmmu doesn't treat hugepages an=
y special, and you are suggesting we add such support, so that a particular=
 region of memory occupies less TLBentries? This probably means TLB lookup =
would become quite a bit more complex.=0A=
=0A=
>> Another idea for decreasing occurence of TLB refills is to make TBs key=
=0A=
>> in htable independent of physical address. I assume it is only needed=0A=
>> to distinguish different processes where VAs can be the same.=0A=
>> Is that assumption correct?=0A=
=0A=
This one, what do you think? Can we replace physical address as part of a k=
ey in TB htable with some sort of address space identifier?=0A=
=0A=
>> Do you have any other ideas which parts of TCG could require our=0A=
>> attention w.r.t the flamegraph I attached?=0A=
> It's been done before but not via upstream patches but improving code=0A=
> generation for hot loops would be a potential performance win. =0A=
=0A=
I am not sure optimizing the code generation itself would help much, at lea=
st in our case. The flamegraph I attached to previous letter shows that onl=
y about 10% of time qemu spends in generated code. The rest is helpers, sea=
rching for next block, TLB-related stuff and so on.=0A=
=0A=
> That would require some changes to the translation model to allow for=0A=
> multiple exit points and probably introducing a new code generator=0A=
> (gccjit or llvm) to generate highly optimised code.=0A=
=0A=
This, however, could bring a lot of performance gain, translation blocks wo=
uld become bigger, and we would spend less time searching for the next bloc=
k.=0A=
=0A=
>> I am also CCing my teammates. We are eager to improve the QEMU TCG=0A=
>> performance for our needs and to contribute our patches to upstream.=0A=
> Do you have any particular goal in mind or just "better"? The current=0A=
> MTTCG scaling tends to drop off as we go above 10-12 vCPUs due to the=0A=
> cost of synchronous flushing across all those vCPUs.=0A=
=0A=
We have some internal ways to measure performance, but we are looking for a=
lternative metric, that we could share and you could reproduce. Sysbench in=
 threads mode is the closed we have found so far by comparing flamegraphs, =
but we are testing more benchmarking software.=0A=
=0A=
>> [1]: https://github.com/akopytov/sysbench=0A=
>> [2]: https://www.mail-archive.com/qemu-devel@nongnu.org/msg562103.html=
=0A=
>> [3]: =0A=
>> https://github.com/qemu/qemu/blob/14d02cfbe4adaeebe7cb833a8cc71191352cf0=
3b/accel/tcg/cputlb.c#L239=0A=
>> [4]: https://dl.acm.org/doi/pdf/10.1145/2686034=0A=
>>=0A=
>> [2. flamegraph.svg --- image/svg+xml; flamegraph.svg]...=0A=
>>=0A=
>> [3. callgraph.svg --- image/svg+xml; callgraph.svg]...=0A=
>>=0A=
Thanks,=0A=
Oleg=0A=
=0A=

