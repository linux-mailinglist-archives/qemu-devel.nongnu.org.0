Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78B375F7446
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 08:40:44 +0200 (CEST)
Received: from localhost ([::1]:52346 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogh2J-0005zg-56
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 02:40:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <blue_3too@hotmail.com>)
 id 1oggwJ-0001tB-Nr
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 02:34:31 -0400
Received: from mail-bn8nam11olkn2010.outbound.protection.outlook.com
 ([40.92.20.10]:8385 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <blue_3too@hotmail.com>)
 id 1oggwH-0000zy-2N
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 02:34:31 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OIeU0aN5C03Fm5Ocpxb1P0TDiKr3uKdeP0EhRzZlExs66uKr1w/mzTFGxt5rbTK3/LUAvr7Hj/Bc3zhG7hIrK1wMDeosFKpK96J28dVimcW5Y3DbfCoZVASwLxamd17v/wooUr/2iSuZLda8estvtqz9y+8KfZ0TJE1XNgE5PRPU7cLq0y16f9i/Li6wDQZgFbOdGw2DVr3ZByUixhddF71mJbXqOUFyaiVCChAiepWzwUnBngn9a7ps4FUWFUzF37dKsYL32P3JcA9f3QlJtdXPytxT3e4giCslcUQmKBk6ojuXO6D0FkVPtzIK3N9aKa2+Wjj/6turLrc18jetVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OV/mXur7e7aaHmysfdh4t669Q8No6qtwInIi98rPX2c=;
 b=EAQ/Ik1tPdCIO0jBS1FwYpOUXE7aX0kqbJGEoxBMgOyddPD1CU5Wc16qUi592wdqxX6jZufbOolF1wkSLlXCcsI28g0SCHDpiK79owx8DbRlBRdGRQM2dGfdhvN75d5lKTzQsUTudfgJpt+nXEETgTaRbpcLlG5Hhiy5sMJH2nXKzDiYCK1F6uHqgqzn8MMKQEAv1zLIlIylcCWZvk8La8WNsmOVBmp/owIsyBEy5jcJx8yEWLzRjf9V7iKVhhkeQzlEl3KNtBSM73JlIaMJ9egh0NZsQe/dEMqLJCMNHm0ncpgZRrY31GlOHPnK3MOMa3LzxDHGwMrDkAcWsCqgRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OV/mXur7e7aaHmysfdh4t669Q8No6qtwInIi98rPX2c=;
 b=jwvMAZbQPMORhs8sVtWrV4B1KBiZTUzDzgPQJPxQ9ok+dYkxnzNByzqMF9jEBbDLmFOhK2ivJH5fySb2+A0wjYRUeZYxNt3ZgSXkL99uR+wkCwAGUhr+BOkJTpT+ZKZ8HDkInstIsPaTv3HkxBADiDx9cXw9Y7NP8YxDUBuJPhhVpPem7iHh8g/zKxdN70au7+mlKLBdUcxdzQw94Wpy15zxaqkyj+xsoAgLCd/VtZlP2y2Htk3JNDFNCKKD2cgcroqb1w3hhg0UdMsX2Mixb3nujY6M0ULXOSDarklA6svGZQEGmRppSLWWyELl/ftbJLmU6ZGnatjDP009G1xQ7Q==
Received: from SJ1PR12MB6290.namprd12.prod.outlook.com (2603:10b6:a03:457::22)
 by DM6PR12MB4217.namprd12.prod.outlook.com (2603:10b6:5:219::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.23; Fri, 7 Oct
 2022 06:34:23 +0000
Received: from SJ1PR12MB6290.namprd12.prod.outlook.com
 ([fe80::e9ff:a76f:2f26:fa75]) by SJ1PR12MB6290.namprd12.prod.outlook.com
 ([fe80::e9ff:a76f:2f26:fa75%6]) with mapi id 15.20.5676.032; Fri, 7 Oct 2022
 06:34:23 +0000
From: a b <blue_3too@hotmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: A few QEMU questiosn
Thread-Topic: A few QEMU questiosn
Thread-Index: AQHY12p/vsJc5BbzP0O9/uPBNihaZq399loAgAKNKKqAALBsAIAAxnqk
Date: Fri, 7 Oct 2022 06:34:23 +0000
Message-ID: <SJ1PR12MB6290CAA8C67FDD7944A0F605C95C9@SJ1PR12MB6290.namprd12.prod.outlook.com>
References: <SJ1PR12MB6290BE35913F0FEACB426B4EC95B9@SJ1PR12MB6290.namprd12.prod.outlook.com>
 <CAFEAcA-6HprXJ9u3orCMyPtaVGgDAU6R_zZ4jQi_NG2NmyaYvA@mail.gmail.com>
 <SJ1PR12MB6290CCA4E526946666A4005FC95C9@SJ1PR12MB6290.namprd12.prod.outlook.com>
 <CAFEAcA_5ybKHMLMZccV1r3hT2g6yfmtRGK5g8at8e8jMRPvhuw@mail.gmail.com>
In-Reply-To: <CAFEAcA_5ybKHMLMZccV1r3hT2g6yfmtRGK5g8at8e8jMRPvhuw@mail.gmail.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [7Mfs6LJyJ5rpAQ7fVLHJKxgcK6jOxE/GHgwCdUKP2bsO/kRhoWfni4vIb1ihWbbU]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR12MB6290:EE_|DM6PR12MB4217:EE_
x-ms-office365-filtering-correlation-id: 77026dde-eff6-44a3-6fd7-08daa82df976
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 1W8U2Kk3WS4F8HWCqCRXSlbPw0z8ihpImXsvncHz7GRUCJGXzzzQ+MKIGmW3mOkN7k1AaD2fCwLxd7ns7HPx0j/MSnK4kIJdKF77+qACFZ9iIF3+umM0dQRaC2ovF76trZ0G12leZPB623XWI+k8z591JNlvhq1vn7ivXzHAlm5FjKa+LqJuWthRd34hEa3tjQ/vr1oAMj6Um0e1Ldu72JNYJBJ9cqCRsD80mUUDmQ4SQz0St/mE2XnfsvbMSZmTdkM+KIWxoxjP+Qb1vTpbpwozx4A4h4aSFaCpw5NPMo0BaGsoYE2+9VkSLraWvdlIGy6SpzpXwNKnD3UVsHtfGnjUfxNsOIA7ZVTljUIO3Ha1GUh2c/Cv/nOnIB2fLTigNmQjXi3k+O8r60icnYZH/MXOypB1qHb3mgdOn+zNe4j/ws05HQitPyjNTX47k4Z3gqx8FKbOfhAIxc5my1y5TpbevVE4vkrBMwviqnpuJONWBOvWCk+m+H/vQAGwqDJjfOALi2zqlUlWq6OVZXEP678gk5UN5wzKid1XEH5jLMtMmj6chh02/DieNXUpqoNrYlVltAB15MPFWn6eYhvCvJEhkKNanZ/BHUVRW3GCZvWpsaO1mKlhJHrBW6MQaVcvr6Klx5F9Fdy90WknHpA8CzFEPaozob0UMIYdCpVyTgnOD+PgRZQLipwN52lB6rsc
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?r3tUUv3sPec822P+dq0Q02Im2EOSLdAXsrmWreYC6BjEW7VHm6lq07u9bq+i?=
 =?us-ascii?Q?6cTZK4QkLN65GGQe72ABxCkVBPNoNIcp+pi558ga4I+VKrAVgpG/Fu3VLMIi?=
 =?us-ascii?Q?9pEJf6zew6S8mMDddmexHqASUfo1uVeJtg09EOW2V5TzFS1X9Qs4LKe9rKMp?=
 =?us-ascii?Q?+YaAEkyfUtKjcH5Zg6tgjEqpK1QFNauX+Kr/Gmrr8FbtajEoC1TeoEcD67Vi?=
 =?us-ascii?Q?OjjAXKVX26iT4zfGBwfqO32RAcdWDrznHXIfnEYgHnX6J1zlOVW1lQDJ+fHt?=
 =?us-ascii?Q?4zotadgubYCTGQriWWvXSmq/BtiWo+Wlayre7DvpgT6/8oqttnpmiJU5QIqx?=
 =?us-ascii?Q?n0Y6gQbN5q+pOPw7RHRy27dzLOWWXCREGhKSnTzveQbw4OZ8d767F7witO9W?=
 =?us-ascii?Q?YLkGmPxFd2XNvlwnKPNTHCqih1ZQBI96KnzGgzcLpQql6ixE9aaO/jXEAE5E?=
 =?us-ascii?Q?qhAymRXm60c1B82DBCNKl8WJmFPH58OBtLs8wardwjp8xMoLQMhNOhVTFyLS?=
 =?us-ascii?Q?9csdYLtNGRYBfg5fsM8B9wvNT+WNgQMdUesO/9D1huQgLNAs/o6tjESorWMz?=
 =?us-ascii?Q?zgovPxwpamqNl6JjXKbLWEDaHzMrpxQUZ35ZE/SQUgVGyeWoR+QN4n2clTpW?=
 =?us-ascii?Q?a5r9e/7j7sLv5cBvccVGRC01PYtl0A4KdXI5/3GpNvtZ0SJciUznTpsZWSN7?=
 =?us-ascii?Q?i/s/CBqqtDlEkaUci5+BPY0gTrdU6uSU1xE0wLvnm1IRpHL0RkOk87hZh4HC?=
 =?us-ascii?Q?X3n+uQt/yqT3xuF+W9Urdm8Ms/vBU1RyVtYfNb259oUTgQdutnMBf9ge775/?=
 =?us-ascii?Q?s4VoMtWNbl8ElAzd4ZYkgK8zBYH2m/rDcNM46FPDMAauteLxocp/9bbEs7Xf?=
 =?us-ascii?Q?b/byXD0D/zj//sOrAPRYwy8JpLa4NnRX0/W6nxoc8a+gZ4DJg5YAOIOgA1sl?=
 =?us-ascii?Q?V2MOcXoedklynBX5gsbyHq9EJtbYJILg2d27UX6DKJPRk44y1IaKCCQuoTQP?=
 =?us-ascii?Q?4IjEsBc+FQ77Tiff2nACpBp5EzjSBdPY4nlMQkemfkAUk2k04SxTFWLfrlUy?=
 =?us-ascii?Q?LwUMuPgaFbacocA4BDluXad2qEI/+GFd7fOv+Q6KTq8gyn+ga2/1VSLY8X9h?=
 =?us-ascii?Q?UnQiOLTrLcAu9jgBaHbyxg8KhBxKuHjmaP/dFcc4aIJAdpFOGn3PNWqkceM1?=
 =?us-ascii?Q?6cKxUCILlOYSnVq+RiELZ2wCvfjnUeOzFClsHg47cqbHzeFOSijz6JeEvVqu?=
 =?us-ascii?Q?bnvb75rlItLzPMPfKowZbo3S6r/suGJNzWuKogv6HovxNwnp6QNLXgVtJxEy?=
 =?us-ascii?Q?/C0spjM2NvBHf/yvNBkmaDjh?=
Content-Type: multipart/alternative;
 boundary="_000_SJ1PR12MB6290CAA8C67FDD7944A0F605C95C9SJ1PR12MB6290namp_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-71ea3.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6290.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 77026dde-eff6-44a3-6fd7-08daa82df976
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Oct 2022 06:34:23.8160 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4217
Received-SPF: pass client-ip=40.92.20.10; envelope-from=blue_3too@hotmail.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--_000_SJ1PR12MB6290CAA8C67FDD7944A0F605C95C9SJ1PR12MB6290namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks Peter.

How QEMU deals with different page size?   Does a 2GB hugepage has a single=
 corresponding TLB entry? Or it is partitioned to 512 4K pages and has 512 =
TLB entries?

does a CPUTLBDescFast always hold TLB entries for the same single process? =
Is it always flushed/restored on context switch?

Is MMU-IDX for different translation regimes or exception level?

How about ITLB? It looks that QEMU has a mixed TLB implementation since the=
 ELB entries have read/write/execute flags. Am I correct?


I am exploring to reconstruct a guest TLB (i.e. guest VA --> guest PA) for =
the running process (i.e. I can live with a TLB just for the running proces=
s). I found that exelog.c calls qemu_plugin_get_hwaddr to get  the guest PA=
. A quick eye-balling the function seems suggests it  populates data->v.ram=
.hostaddr with host VA (see line 1699 below). Am I correct?

What is the correct way to construct the guest TLB for the running process =
based on QEMU data structure at runtime?

1681 bool tlb_plugin_lookup(CPUState *cpu, target_ulong addr, int mmu_idx,
1682                        bool is_store, struct qemu_plugin_hwaddr *data)
1683 {
1684     CPUArchState *env =3D cpu->env_ptr;
1685     CPUTLBEntry *tlbe =3D tlb_entry(env, mmu_idx, addr);
1686     uintptr_t index =3D tlb_index(env, mmu_idx, addr);
1687     target_ulong tlb_addr =3D is_store ? tlb_addr_write(tlbe) : tlbe->=
addr_read;
1688
1689     if (likely(tlb_hit(tlb_addr, addr))) {
1690         /* We must have an iotlb entry for MMIO */
1691         if (tlb_addr & TLB_MMIO) {
1692             CPUIOTLBEntry *iotlbentry;
1693             iotlbentry =3D &env_tlb(env)->d[mmu_idx].iotlb[index];
1694             data->is_io =3D true;
1695             data->v.io.section =3D iotlb_to_section(cpu, iotlbentry->a=
ddr, iotlbentry->attrs);
1696             data->v.io.offset =3D (iotlbentry->addr & TARGET_PAGE_MASK=
) + addr;
1697         } else {
1698             data->is_io =3D false;
1699             data->v.ram.hostaddr =3D (void *)((uintptr_t)addr + tlbe->=
addend);
1700         }
1701         return true;
1702     } else {
1703         SavedIOTLB *saved =3D &cpu->saved_iotlb;
1704         data->is_io =3D true;
1705         data->v.io.section =3D saved->section;
1706         data->v.io.offset =3D saved->mr_offset;
1707         return true;
1708     }
1709 }

Thanks a bunch!

Regards
________________________________
From: Peter Maydell <peter.maydell@linaro.org>
Sent: October 6, 2022 10:50 AM
To: a b <blue_3too@hotmail.com>
Cc: qemu-devel@nongnu.org <qemu-devel@nongnu.org>
Subject: Re: A few QEMU questiosn

On Thu, 6 Oct 2022 at 08:34, a b <blue_3too@hotmail.com> wrote:
>
> Thanks a lot Peter for the clarification. It is very helpful.
>
> My naive understanding is that each MMU has only 1 TLB, why do we need an=
 array of CPUTLBDescFast structures? How are these different CPUTLBDescFast=
 data structures correlate with a hardware TLB?
>
> 220 typedef struct CPUTLB {
> 221     CPUTLBCommon c;
> 222     CPUTLBDesc d[NB_MMU_MODES];
> 223     CPUTLBDescFast f[NB_MMU_MODES];
> 224 } CPUTLB;

QEMU's "TLB" doesn't really correlate with a hardware TLB
except in that they're serving vaguely similar purposes.
A hardware TLB is a h/w structure which accelerates the lookup
  virtual-address =3D> (physical-address, permissions)
QEMU's TLB is a software data structure which accelerates
the lookup
  virtual-address =3D> (host virtual address or device MemoryRegion structu=
re)

It's not an emulation of the "real" CPU TLB. (Note that this
means that you can't use QEMU to look at performance behaviour
around whether guest code is hitting or missing in the TLB,
and that the size of QEMU's TLB is unrelated to the size of a
TLB on the real CPU.)

Further, the set of things that can be done fast in hardware
differs from the set of things that can be done fast in
software. In hardware, a TLB is a "content-addressable
memory" that essentially checks every entry in parallel to
find the match in fixed time. In this kind of hardware it's
easy to add checks like "and it should match the right ASID"
or "and it must be an entry for EL2" without it making the
lookup slower. In software, you can't do that kind of parallel
lookup, so we must use a different structure. Instead of
having one TLB that can store entries for multiple contexts
at once and where we check that the context is correct when
we look up the address, we have effectively a separate TLB
for each context, so we can look up the address in an O(1)
data structure that has exactly one entry for the address,
and know that if it is present it is the correct entry.

The aim of the QEMU TLB design is to make the "fast path"
lookup of guest virtual address to host virtual address for
RAM accesses as fast as possible (it is a handful of
instructions directly generated as part of the JIT output);
the slow path for faults, hardware accesses, etc, is handled
in C code and is less performance critical.

> Why do we want to store a shifted (n_entries-1) in mask?
> 184 typedef struct CPUTLBDescFast {
> 185     /* Contains (n_entries - 1) << CPU_TLB_ENTRY_BITS */
> 186     uintptr_t mask;
> 187     /* The array of tlb entries itself. */
> 188     CPUTLBEntry *table;
> 189 } CPUTLBDescFast QEMU_ALIGNED(2 * sizeof(void *));

The mask field is a pre-calculated value that is going to
be used as part of the "given a virtual address, find the
table entry" lookup. Because the number of entries in the table
varies, the part of the address we need to use as the index
also varies. We pre-calculate the mask in a convenient format
for the generated JIT code because if we stored just n_entries
here it would cost us an extra instruction or two in the fast path.
(To understand these data structures you probably want to also
be looking at the code that generates the lookup code, which
you can find under tcg/, usually in a function named
tcg_out_tlb_load or tcg_out_tlb_read or similar.)

> Why doesn't CPUTLBEntry have information like ASID, shared
> (or global) bits?  How do we know if the TLB entry is a match
> for a particular process?

We don't store the ASID because it would be slow to do a check
on it when we got a TLB hit, and it would be too expensive to
have an entire separate TLB per-ASID. Instead we simply flush
the appropriate TLB when the ASID is changed. That means that
we can rely on a TLB hit being for the current context/process.

-- PMM

--_000_SJ1PR12MB6290CAA8C67FDD7944A0F605C95C9SJ1PR12MB6290namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
Thanks&nbsp;Peter.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
How QEMU deals with different page size?&nbsp; &nbsp;Does a 2GB hugepage ha=
s a single corresponding TLB entry? Or it is partitioned to 512 4K pages an=
d has 512 TLB entries?</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
does a <span style=3D"font-family:&quot;Segoe UI&quot;, &quot;Segoe UI Web =
(West European)&quot;, &quot;Segoe UI&quot;, -apple-system, BlinkMacSystemF=
ont, Roboto, &quot;Helvetica Neue&quot;, sans-serif;font-size:14.6667px;bac=
kground-color:rgb(255, 255, 255);display:inline !important">
CPUTLBDescFast always</span>&nbsp;hold TLB entries for the same single proc=
ess? Is it always flushed/restored on context switch?&nbsp;</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
Is MMU-IDX for different translation regimes or exception level?</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
How about ITLB? It looks that QEMU has a mixed TLB implementation since the=
 ELB entries have read/write/execute flags. Am I correct?</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
I am exploring to reconstruct a guest TLB (i.e. guest VA --&gt; guest PA) f=
or the running process (i.e. I can live with a TLB just for the running pro=
cess).&nbsp;<span class=3D"ContentPasted0 ContentPasted2" style=3D"font-siz=
e:12pt;margin:0px">I found that exelog.c calls&nbsp;<b style=3D"color:rgb(1=
2, 100, 192);background-color:rgb(255, 255, 255)" class=3D"ContentPasted2">=
qemu_plugin_get_hwaddr</b><span class=3D"ContentPasted2">&nbsp;</span>to
 get&nbsp; the guest PA. A quick eye-balling the function seems suggests it=
&nbsp; populates
<b style=3D"color:rgb(12, 100, 192);background-color:rgb(255, 255, 255)" cl=
ass=3D"ContentPasted4">
data-&gt;v.ram.hostaddr&nbsp;</b>with host VA (see line <b style=3D"color:r=
gb(12, 100, 192);background-color:rgb(255, 255, 255)" class=3D"ContentPaste=
d5">
1699&nbsp;</b>below). Am I correct?&nbsp;</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<span class=3D"ContentPasted0 ContentPasted2" style=3D"font-size:12pt;margi=
n:0px"><br>
</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<span class=3D"ContentPasted0 ContentPasted2" style=3D"font-size:12pt;margi=
n:0px">What is the correct way to construct the guest TLB for the running p=
rocess based on QEMU data structure at runtime?</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<span class=3D"ContentPasted0 ContentPasted2" style=3D"font-size:12pt;margi=
n:0px"><br>
</span></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted1 ContentPasted=
3">
1681 bool tlb_plugin_lookup(CPUState *cpu, target_ulong addr, int mmu_idx,
<div class=3D"ContentPasted3">1682 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;bool is_store, struct qemu_plugi=
n_hwaddr *data)</div>
<div class=3D"ContentPasted3">1683 { &nbsp;</div>
<div class=3D"ContentPasted3">1684 &nbsp; &nbsp; CPUArchState *env =3D cpu-=
&gt;env_ptr;</div>
<div class=3D"ContentPasted3">1685 &nbsp; &nbsp; CPUTLBEntry *tlbe =3D tlb_=
entry(env, mmu_idx, addr);</div>
<div class=3D"ContentPasted3">1686 &nbsp; &nbsp; uintptr_t index =3D tlb_in=
dex(env, mmu_idx, addr);</div>
<div class=3D"ContentPasted3">1687 &nbsp; &nbsp; target_ulong tlb_addr =3D =
is_store ? tlb_addr_write(tlbe) : tlbe-&gt;addr_read;</div>
<div class=3D"ContentPasted3">1688 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; </div>
<div class=3D"ContentPasted3">1689 &nbsp; &nbsp; if (likely(tlb_hit(tlb_add=
r, addr))) {</div>
<div class=3D"ContentPasted3">1690 &nbsp; &nbsp; &nbsp; &nbsp; /* We must h=
ave an iotlb entry for MMIO */</div>
<div class=3D"ContentPasted3">1691 &nbsp; &nbsp; &nbsp; &nbsp; if (tlb_addr=
 &amp; TLB_MMIO) {</div>
<div class=3D"ContentPasted3">1692 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; CPUIOTLBEntry *iotlbentry;</div>
<div class=3D"ContentPasted3">1693 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; iotlbentry =3D &amp;env_tlb(env)-&gt;d[mmu_idx].iotlb[index];</div>
<div class=3D"ContentPasted3">1694 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; data-&gt;is_io =3D true;</div>
<div class=3D"ContentPasted3">1695 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; data-&gt;v.io.section =3D iotlb_to_section(cpu, iotlbentry-&gt;addr, iotl=
bentry-&gt;attrs);</div>
<div class=3D"ContentPasted3">1696 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; data-&gt;v.io.offset =3D (iotlbentry-&gt;addr &amp; TARGET_PAGE_MASK) + a=
ddr;</div>
<div class=3D"ContentPasted3">1697 &nbsp; &nbsp; &nbsp; &nbsp; } else {</di=
v>
<div class=3D"ContentPasted3">1698 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; data-&gt;is_io =3D false;</div>
<div class=3D"ContentPasted3"><span style=3D"color: rgb(12, 100, 192);"><b>=
1699 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; data-&gt;v.ram.hostaddr =3D =
(void *)((uintptr_t)addr + tlbe-&gt;addend);</b></span></div>
<div class=3D"ContentPasted3">1700 &nbsp; &nbsp; &nbsp; &nbsp; }</div>
<div class=3D"ContentPasted3">1701 &nbsp; &nbsp; &nbsp; &nbsp; return true;=
</div>
<div class=3D"ContentPasted3">1702 &nbsp; &nbsp; } else {</div>
<div class=3D"ContentPasted3">1703 &nbsp; &nbsp; &nbsp; &nbsp; SavedIOTLB *=
saved =3D &amp;cpu-&gt;saved_iotlb;</div>
<div class=3D"ContentPasted3">1704 &nbsp; &nbsp; &nbsp; &nbsp; data-&gt;is_=
io =3D true;</div>
<div class=3D"ContentPasted3">1705 &nbsp; &nbsp; &nbsp; &nbsp; data-&gt;v.i=
o.section =3D saved-&gt;section;</div>
<div class=3D"ContentPasted3">1706 &nbsp; &nbsp; &nbsp; &nbsp; data-&gt;v.i=
o.offset =3D saved-&gt;mr_offset;</div>
<div class=3D"ContentPasted3">1707 &nbsp; &nbsp; &nbsp; &nbsp; return true;=
</div>
<div class=3D"ContentPasted3">1708 &nbsp; &nbsp; }</div>
<div class=3D"ContentPasted3">1709 } &nbsp;</div>
<div class=3D"ContentPasted1"></div>
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
Thanks&nbsp;a bunch!</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
Regards</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Peter Maydell &lt;pet=
er.maydell@linaro.org&gt;<br>
<b>Sent:</b> October 6, 2022 10:50 AM<br>
<b>To:</b> a b &lt;blue_3too@hotmail.com&gt;<br>
<b>Cc:</b> qemu-devel@nongnu.org &lt;qemu-devel@nongnu.org&gt;<br>
<b>Subject:</b> Re: A few QEMU questiosn</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Thu, 6 Oct 2022 at 08:34, a b &lt;blue_3too@hot=
mail.com&gt; wrote:<br>
&gt;<br>
&gt; Thanks a lot Peter for the clarification. It is very helpful.<br>
&gt;<br>
&gt; My naive understanding is that each MMU has only 1 TLB, why do we need=
 an array of CPUTLBDescFast structures? How are these different CPUTLBDescF=
ast data structures correlate with a hardware TLB?<br>
&gt;<br>
&gt; 220 typedef struct CPUTLB {<br>
&gt; 221&nbsp;&nbsp;&nbsp;&nbsp; CPUTLBCommon c;<br>
&gt; 222&nbsp;&nbsp;&nbsp;&nbsp; CPUTLBDesc d[NB_MMU_MODES];<br>
&gt; 223&nbsp;&nbsp;&nbsp;&nbsp; CPUTLBDescFast f[NB_MMU_MODES];<br>
&gt; 224 } CPUTLB;<br>
<br>
QEMU's &quot;TLB&quot; doesn't really correlate with a hardware TLB<br>
except in that they're serving vaguely similar purposes.<br>
A hardware TLB is a h/w structure which accelerates the lookup<br>
&nbsp; virtual-address =3D&gt; (physical-address, permissions)<br>
QEMU's TLB is a software data structure which accelerates<br>
the lookup<br>
&nbsp; virtual-address =3D&gt; (host virtual address or device MemoryRegion=
 structure)<br>
<br>
It's not an emulation of the &quot;real&quot; CPU TLB. (Note that this<br>
means that you can't use QEMU to look at performance behaviour<br>
around whether guest code is hitting or missing in the TLB,<br>
and that the size of QEMU's TLB is unrelated to the size of a<br>
TLB on the real CPU.)<br>
<br>
Further, the set of things that can be done fast in hardware<br>
differs from the set of things that can be done fast in<br>
software. In hardware, a TLB is a &quot;content-addressable<br>
memory&quot; that essentially checks every entry in parallel to<br>
find the match in fixed time. In this kind of hardware it's<br>
easy to add checks like &quot;and it should match the right ASID&quot;<br>
or &quot;and it must be an entry for EL2&quot; without it making the<br>
lookup slower. In software, you can't do that kind of parallel<br>
lookup, so we must use a different structure. Instead of<br>
having one TLB that can store entries for multiple contexts<br>
at once and where we check that the context is correct when<br>
we look up the address, we have effectively a separate TLB<br>
for each context, so we can look up the address in an O(1)<br>
data structure that has exactly one entry for the address,<br>
and know that if it is present it is the correct entry.<br>
<br>
The aim of the QEMU TLB design is to make the &quot;fast path&quot;<br>
lookup of guest virtual address to host virtual address for<br>
RAM accesses as fast as possible (it is a handful of<br>
instructions directly generated as part of the JIT output);<br>
the slow path for faults, hardware accesses, etc, is handled<br>
in C code and is less performance critical.<br>
<br>
&gt; Why do we want to store a shifted (n_entries-1) in mask?<br>
&gt; 184 typedef struct CPUTLBDescFast {<br>
&gt; 185&nbsp;&nbsp;&nbsp;&nbsp; /* Contains (n_entries - 1) &lt;&lt; CPU_T=
LB_ENTRY_BITS */<br>
&gt; 186&nbsp;&nbsp;&nbsp;&nbsp; uintptr_t mask;<br>
&gt; 187&nbsp;&nbsp;&nbsp;&nbsp; /* The array of tlb entries itself. */<br>
&gt; 188&nbsp;&nbsp;&nbsp;&nbsp; CPUTLBEntry *table;<br>
&gt; 189 } CPUTLBDescFast QEMU_ALIGNED(2 * sizeof(void *));<br>
<br>
The mask field is a pre-calculated value that is going to<br>
be used as part of the &quot;given a virtual address, find the<br>
table entry&quot; lookup. Because the number of entries in the table<br>
varies, the part of the address we need to use as the index<br>
also varies. We pre-calculate the mask in a convenient format<br>
for the generated JIT code because if we stored just n_entries<br>
here it would cost us an extra instruction or two in the fast path.<br>
(To understand these data structures you probably want to also<br>
be looking at the code that generates the lookup code, which<br>
you can find under tcg/, usually in a function named<br>
tcg_out_tlb_load or tcg_out_tlb_read or similar.)<br>
<br>
&gt; Why doesn't CPUTLBEntry have information like ASID, shared<br>
&gt; (or global) bits?&nbsp; How do we know if the TLB entry is a match<br>
&gt; for a particular process?<br>
<br>
We don't store the ASID because it would be slow to do a check<br>
on it when we got a TLB hit, and it would be too expensive to<br>
have an entire separate TLB per-ASID. Instead we simply flush<br>
the appropriate TLB when the ASID is changed. That means that<br>
we can rely on a TLB hit being for the current context/process.<br>
<br>
-- PMM<br>
</div>
</span></font></div>
</body>
</html>

--_000_SJ1PR12MB6290CAA8C67FDD7944A0F605C95C9SJ1PR12MB6290namp_--

