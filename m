Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D25175F61D4
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Oct 2022 09:44:00 +0200 (CEST)
Received: from localhost ([::1]:52578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogLXz-0000qz-GX
	for lists+qemu-devel@lfdr.de; Thu, 06 Oct 2022 03:43:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <blue_3too@hotmail.com>)
 id 1ogLTk-0007O3-Tf
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 03:39:37 -0400
Received: from mail-dm6nam12olkn20823.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::823]:48938
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <blue_3too@hotmail.com>)
 id 1ogLTi-0006IO-4N
 for qemu-devel@nongnu.org; Thu, 06 Oct 2022 03:39:36 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hxVFq0CbjUPw6auDzso28bW/hNcZKaG9LFPXzCddJmoOJt94oAMEf30Dtw5OIRxRARgHTEuUpjTaxjhwsRseNq+zSdGQ8+MfxNkADSe3kDYPIVF0JTsZFVii/P90Azxr0L8OAf94IkJgEUbXv1jeYDBMzrPwFpzFKWKS11umNHyKmxaTNsPjyLlusMTXgizPN7Hr9T3ItYW9baXMtKuzK3f/eVpPkP3sDoP2o7kbGQK9tdNyaZ4if1lhKoJnHcrZIwNtZlsrlFamJy9Yi4//V93rh3Ho7tp6eXLaDsokKniOEYVOjZQGCGXRYAtHKJ5/sIY/68u7tXowPrJ5e4pc1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f7eO4rJ6+n1rDJ3Wz35eJRhOdZRVgp7JLEuBKPZKV7g=;
 b=Q7rR1jCg1Ml4A/p7mJWLxXvVyhbS/Lcyp8RefBxnd8vrZ/qqO1OAel81aXhit/4MWjvfaUUNkmUTcsVV6lx2Zwa4Df7mhqglfjZoYfQIo39TkIbSWCoOQHyxWYRpKJm7kEoUe4VKVSlpt9A2AkgSl/3TZ+qaEC2p5Lc7I4Rn2uZq24G5cfhnoCyMDcRFM8lOO18h2qy6ELE5rEyEKbIM8T1mpu615LsEMBRglSTQy4hZ3eby87mmO2zQ36HvUFMTb+MKaMkEjrSSBQCp0VufayYgoyLvccSv9Kpvffwt2sc5OscvnUXTE2I5Gy+VYQhzxTx+bUAuOTBFIrj1Qk4wbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7eO4rJ6+n1rDJ3Wz35eJRhOdZRVgp7JLEuBKPZKV7g=;
 b=aAT1FGA6/HPKyEtD1NnyY+yPFFIWDF6HeufN5bnT+gdt3VtSVs4DqhLE8kK1B0bN37a0I3h9kE/FXDi7pD3YfAUHF9matSC1aMhXr6lDcMl5q3yvg0lDYbkwBvM2mMiPLiJv+Y+XturyRtFlMzthptKmGD77z/2UUF/gd5Wo3RJ72kq8KgIRlp7v/lkkNEV2fobLeRksM4Mxnxuc9D1FHaRY0aHCurae3zw7VSf188vLQYFf8Yt8QkKRNARiXb6Kp1IALFq/aU4cjvS2lNgSNuhpSIJakKhqxPkr229kHhP7nZZaM39Vz5Hg0CVhFD+wZv1TFSaIaxQ+tuggnaGsLQ==
Received: from SJ1PR12MB6290.namprd12.prod.outlook.com (2603:10b6:a03:457::22)
 by IA1PR12MB6140.namprd12.prod.outlook.com (2603:10b6:208:3e8::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5676.32; Thu, 6 Oct
 2022 07:34:29 +0000
Received: from SJ1PR12MB6290.namprd12.prod.outlook.com
 ([fe80::e9ff:a76f:2f26:fa75]) by SJ1PR12MB6290.namprd12.prod.outlook.com
 ([fe80::e9ff:a76f:2f26:fa75%6]) with mapi id 15.20.5676.032; Thu, 6 Oct 2022
 07:34:29 +0000
From: a b <blue_3too@hotmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
CC: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Subject: Re: A few QEMU questiosn
Thread-Topic: A few QEMU questiosn
Thread-Index: AQHY12p/vsJc5BbzP0O9/uPBNihaZq399loAgAKNKKo=
Date: Thu, 6 Oct 2022 07:34:28 +0000
Message-ID: <SJ1PR12MB6290CCA4E526946666A4005FC95C9@SJ1PR12MB6290.namprd12.prod.outlook.com>
References: <SJ1PR12MB6290BE35913F0FEACB426B4EC95B9@SJ1PR12MB6290.namprd12.prod.outlook.com>
 <CAFEAcA-6HprXJ9u3orCMyPtaVGgDAU6R_zZ4jQi_NG2NmyaYvA@mail.gmail.com>
In-Reply-To: <CAFEAcA-6HprXJ9u3orCMyPtaVGgDAU6R_zZ4jQi_NG2NmyaYvA@mail.gmail.com>
Accept-Language: en-CA, en-US
Content-Language: en-CA
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [WeN1+Jc3OLGAi56fTARNrFkkNTZzaq1odEGk7v/NzuKdM6n8NLK+c/ifKN5kUjX9]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ1PR12MB6290:EE_|IA1PR12MB6140:EE_
x-ms-office365-filtering-correlation-id: 8e4d46bf-9b26-4270-ccdb-08daa76d33e2
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: q6fo/AiD5IP2XAJghHnwOQ1N7SzYP1N5G3lamZokgctVmHNfxCu5ViFgDCArz2qsw9wzTh4NwoN9EeY84M7mo9JCv2KF2k35/gMGT7QT5X4MmsbUfAyYTXQ12Hk9UuBbxfssmX28E6hXpgTY3Sv9Da3ZvrhWkDvZWKa+KyR7yAv/ddGWa0wIgPljEpkGjMYS3+YgKYFn+vbmmII72XmKTTwNQ+DbgjodUcVL7W+qVSWxlkgyAuJ7glFFdEzGRiGkphpo8p9xJ7qFK62OYDMhQ4/VF8V02NG93c64BuabcpLc3wfkxDHA5vDUxgdeFTVmkUb/LRr7wOpX4CX0pNp46z2H2QtVdIKMiJJGCWRSGLLGpsp+oolpfyefLMiMtDKkAxikJiO4GtxwCcaOn5hINGHHcSyWYGNkwVr1GHePdGQapMeCL1Oxd1KNB4MzRX3scpGRYpFFgIZXio8z8RCDsSg9bh43snZ++4q3+OcelKvxZKTI7V3mCS6oJ7cIYAPGDLKp2KvfR5zt+BlKnAoIT0M9Z/2aryI+LCr6Qme+rMRoIUiGsxu9/sBe6qlYwchoiC1GEfBLScRmVypPgs7ZK7cGe2FiOqSYHaeoQNQudw0nMKbAroCNpgBMWKHy1Gjg8V2B4Gf3xZgqR1H++EnBt7yvOFfLb0Ve0KBeHi0i42acQgQZJdxHe8RN5/sXJllr
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?4OSRCvVDY3g7EmniQdov9UMSoWk9BfHPVRKoU3eZ7WRDUJubNcamFIC5zzq4?=
 =?us-ascii?Q?XpQH25O/hfyIwjZuFoh6T/ezUDGcdC308WEm8Q8QzkmOBROgg78hW23ADo/E?=
 =?us-ascii?Q?JKtMzLjzPRzo5VVu3VFRpL3JDaZTzFbZb7z5u+/slftl3dTGZrGe4XdmDu57?=
 =?us-ascii?Q?5RypqvU2IwxNi71KrjKeQjQla5eUVTSmQD1CTFAif9ZTLzYxX13Y0G1KoSkm?=
 =?us-ascii?Q?fe6+hnBRnWHKUCYVlijz65FxfnfWYokPB4xnzyk1Gvjhn2kVAOjfDdJfU7rn?=
 =?us-ascii?Q?vioXPNyxH8fbRQagE5ltU+pBXo2qKOHMoqgu8IS462uOg9ycDYHiEi4TjHHQ?=
 =?us-ascii?Q?nJ6r/TANQVqQcX0g/spS4SkAL6bUQA0KXKwzr3qxS7JpO6y7ko3xhgzn1frU?=
 =?us-ascii?Q?5UPuAyuycAYJDOKO/o1N+/q3iyxr/eFnskHlZFj+3ULvBH3rVuICeSpwG4q0?=
 =?us-ascii?Q?twBEt+4qrxl7hBDlC7o1KQUHrgE+E9Jo4YqoRktaYzz1ajcwDcBl0kL/uPTj?=
 =?us-ascii?Q?Szlyu6F11kmSgIZlkPWYLsHePoXrMqo/bNFKBGcXa5UVCcAzGlo8K9ADjdId?=
 =?us-ascii?Q?HZK3muibm2R2r+zQFYHp2E2PbRB+uJN8Adj++XI7qawIpAp1iuminK1Tp63A?=
 =?us-ascii?Q?weDoiPN++mahVQMhASV//2GwO7Mt15nlOdhN8ve/URIgFEU3CUZhYVavr4CW?=
 =?us-ascii?Q?3Zza4fe9FQ2LGt5YcbJYSp7g6hEUgfyrhTHrkx1sQOnsbEyyYZTLZsDXnohI?=
 =?us-ascii?Q?Xvv6x60GrSJcAgJDW5qsQ1btqkdEkSWiD9/FvKHPwe0UOoFPipZbhi2xh99D?=
 =?us-ascii?Q?0Pr8ydKOiPyGR+GIDcwH+K4rLq7DN6IetTZFaOoXW/7Hfpk+y0OdlTx0S3UY?=
 =?us-ascii?Q?P1Rxbcsh/JfotBlxhutslGCoEdOJFfQQE2YuA1KMY4KFtMdRxd11uc0ccKNm?=
 =?us-ascii?Q?E6Pu8+pHgyuIfFI/xO4oFG7paxiuKMn0JK1A2nTw76cCwVkdkV6YiX6jecz3?=
 =?us-ascii?Q?BBwf2bSQYTpiTBBe00A//EzBXfqQFlj4i2dGauKUtxaUYu/c3sXp105clVbK?=
 =?us-ascii?Q?Sgu38IccXLWi5Ym6CMJPHJNJ6TQNvyxv/sBeyxPfKOOXTyFKxkhOn0pz05d3?=
 =?us-ascii?Q?0xeIVkhPkxrPxXaH4E1WitNERUqKvonPuZNQMjbrRq5spiGUk67v9atc5OgU?=
 =?us-ascii?Q?O+X6EkkfJf2BeR3RkIcctksIISpdvJxWkejZoleTfcGI3DlhEl8KUzRyZ1iN?=
 =?us-ascii?Q?vntpbtRTkv83EENEQe4FO3nJI4DJ83BpHXhwowS73QaxsUSzsJuUrbLCgJNt?=
 =?us-ascii?Q?6LZi3cb9pu+LE9v00z7nK7pQ?=
Content-Type: multipart/alternative;
 boundary="_000_SJ1PR12MB6290CCA4E526946666A4005FC95C9SJ1PR12MB6290namp_"
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-4755-11-msonline-outlook-71ea3.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR12MB6290.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e4d46bf-9b26-4270-ccdb-08daa76d33e2
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Oct 2022 07:34:28.9497 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6140
Received-SPF: pass client-ip=2a01:111:f400:fe59::823;
 envelope-from=blue_3too@hotmail.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, SPF_HELO_PASS=-0.001,
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

--_000_SJ1PR12MB6290CCA4E526946666A4005FC95C9SJ1PR12MB6290namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Thanks a lot Peter for the clarification. It is very helpful.

My naive understanding is that each MMU has only 1 TLB, why do we need an a=
rray of CPUTLBDescFast structures? How are these different CPUTLBDescFast d=
ata structures correlate with a hardware TLB?

220 typedef struct CPUTLB {
221     CPUTLBCommon c;
222     CPUTLBDesc d[NB_MMU_MODES];
223     CPUTLBDescFast f[NB_MMU_MODES];
224 } CPUTLB;


Why do we want to store a shifted (n_entries-1) in mask?
184 typedef struct CPUTLBDescFast {
185     /* Contains (n_entries - 1) << CPU_TLB_ENTRY_BITS */
186     uintptr_t mask;
187     /* The array of tlb entries itself. */
188     CPUTLBEntry *table;
189 } CPUTLBDescFast QEMU_ALIGNED(2 * sizeof(void *));


Why doesn't CPUTLBEntry have information like ASID, shared (or global) bits=
?  How do we know if the TLB entry is a match for a particular process?

In include/exec/cpu-defs.h:
111 typedef struct CPUTLBEntry {
112     /* bit TARGET_LONG_BITS to TARGET_PAGE_BITS : virtual address
113        bit TARGET_PAGE_BITS-1..4  : Nonzero for accesses that should no=
t
114                                     go directly to ram.
115        bit 3                      : indicates that the entry is invalid
116        bit 2..0                   : zero
117     */
118     union {
119         struct {
120             target_ulong addr_read;
121             target_ulong addr_write;
122             target_ulong addr_code;
123             /* Addend to virtual address to get host address.  IO acces=
ses
124                use the corresponding iotlb value.  */
125             uintptr_t addend;
126         };
127         /* padding to get a power of two size */
128         uint8_t dummy[1 << CPU_TLB_ENTRY_BITS];
129     };
130 } CPUTLBEntry;


Thanks!
________________________________
From: Peter Maydell <peter.maydell@linaro.org>
Sent: October 4, 2022 9:20 AM
To: a b <blue_3too@hotmail.com>
Cc: qemu-devel@nongnu.org <qemu-devel@nongnu.org>
Subject: Re: A few QEMU questiosn

On Tue, 4 Oct 2022 at 02:10, a b <blue_3too@hotmail.com> wrote:
> I have a few newbie QEMU questions.  I found that mmu_idx in aarch64-soft=
mmu  falls in 8, 10 and 12.
>
> I need some help to understand what they are for.
>
> I cannot find which macros are for mmu-idx 8, 10 and 12 at target/arm/cpu=
.h. It looks like all the values from ARMMMUIdx are greater than 0x10 (ARM_=
MMU_IDX_A). Am I looking at the wrong place or missing something for the di=
fferent MMU modes in aarch64?

The comment in target/arm/cpu.h and the various enum definitions
should be what you need. Note in particular the part that says
"The ARMMMUIdx and the mmu index value used by the core QEMU
 TLB code are not quite the same" and also the functions in
internals.h arm_to_core_mmu_idx() and core_to_arm_mmu_idx()
which convert between these two representations.

PS: there is a refactoring patch set currently in review which
changes the MMU index allocation (essentially it collapses
the separate Secure and NonSecure MMUIdx values together),
so the specific details will likely change at some point this
release cycle.

thanks
-- PMM

--_000_SJ1PR12MB6290CCA4E526946666A4005FC95C9SJ1PR12MB6290namp_
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
Thanks a lot Peter for the clarification. It is very helpful.</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<b>My naive understanding is that each MMU has only 1 TLB, why do we need a=
n array of&nbsp;<span style=3D"background-color:rgb(255, 255, 255);display:=
inline !important" class=3D"ContentPasted2">CPUTLBDescFast structures? How =
are these different&nbsp;<span style=3D"background-color:rgb(255, 255, 255)=
;display:inline !important" class=3D"ContentPasted3">CPUTLBDescFast
 data structures correlate with a hardware TLB?&nbsp;&nbsp;</span></span></=
b></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted1">
220 typedef struct CPUTLB {
<div class=3D"ContentPasted1">221 &nbsp; &nbsp; CPUTLBCommon c;</div>
<div class=3D"ContentPasted1">222 &nbsp; &nbsp; CPUTLBDesc d[NB_MMU_MODES];=
</div>
<div class=3D"ContentPasted1">223 &nbsp; &nbsp; CPUTLBDescFast f[NB_MMU_MOD=
ES];</div>
<div class=3D"ContentPasted1">224 } CPUTLB;</div>
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted1">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted1">
<b>Why do we want to store a shifted (n_entries-1) in mask?</b></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted1 ContentPasted=
4">
184 typedef struct CPUTLBDescFast {
<div class=3D"ContentPasted4">185 &nbsp; &nbsp; /* Contains (n_entries - 1)=
 &lt;&lt; CPU_TLB_ENTRY_BITS */</div>
<div class=3D"ContentPasted4">186 &nbsp; &nbsp; uintptr_t mask;</div>
<div class=3D"ContentPasted4">187 &nbsp; &nbsp; /* The array of tlb entries=
 itself. */</div>
<div class=3D"ContentPasted4">188 &nbsp; &nbsp; CPUTLBEntry *table;</div>
<div class=3D"ContentPasted4">189 } CPUTLBDescFast QEMU_ALIGNED(2 * sizeof(=
void *));</div>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted1">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<b>Why doesn't CPUTLBEntry have information like ASID, shared (or global) b=
its?&nbsp; How do we know if the TLB entry is a match for a particular proc=
ess?</b></div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
In include/exec/cpu-defs.h:
<div class=3D"ContentPasted0">111 typedef struct CPUTLBEntry {</div>
<div class=3D"ContentPasted0">112 &nbsp; &nbsp; /* bit TARGET_LONG_BITS to =
TARGET_PAGE_BITS : virtual address</div>
<div class=3D"ContentPasted0">113 &nbsp; &nbsp; &nbsp; &nbsp;bit TARGET_PAG=
E_BITS-1..4 &nbsp;: Nonzero for accesses that should not</div>
<div class=3D"ContentPasted0">114 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; &nbsp; go directly to ram.
</div>
<div class=3D"ContentPasted0">115 &nbsp; &nbsp; &nbsp; &nbsp;bit 3 &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;: indic=
ates that the entry is invalid</div>
<div class=3D"ContentPasted0">116 &nbsp; &nbsp; &nbsp; &nbsp;bit 2..0 &nbsp=
; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; : zero</div>
<div class=3D"ContentPasted0">117 &nbsp; &nbsp; */</div>
<div class=3D"ContentPasted0">118 &nbsp; &nbsp; union {</div>
<div class=3D"ContentPasted0">119 &nbsp; &nbsp; &nbsp; &nbsp; struct {</div=
>
<div class=3D"ContentPasted0">120 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 target_ulong addr_read;</div>
<div class=3D"ContentPasted0">121 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 target_ulong addr_write;</div>
<div class=3D"ContentPasted0">122 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 target_ulong addr_code;</div>
<div class=3D"ContentPasted0">123 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 /* Addend to virtual address to get host address. &nbsp;IO accesses</div>
<div class=3D"ContentPasted0">124 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 &nbsp; &nbsp;use the corresponding iotlb value. &nbsp;*/</div>
<div class=3D"ContentPasted0">125 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;=
 uintptr_t addend;</div>
<div class=3D"ContentPasted0">126 &nbsp; &nbsp; &nbsp; &nbsp; };</div>
<div class=3D"ContentPasted0">127 &nbsp; &nbsp; &nbsp; &nbsp; /* padding to=
 get a power of two size */</div>
<div class=3D"ContentPasted0">128 &nbsp; &nbsp; &nbsp; &nbsp; uint8_t dummy=
[1 &lt;&lt; CPU_TLB_ENTRY_BITS];</div>
<div class=3D"ContentPasted0">129 &nbsp; &nbsp; };</div>
<div class=3D"ContentPasted0">130 } CPUTLBEntry;</div>
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
<br>
</div>
<div style=3D"font-family: Calibri, Helvetica, sans-serif; font-size: 12pt;=
 color: rgb(0, 0, 0);" class=3D"elementToProof ContentPasted0">
Thanks!</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> Peter Maydell &lt;pet=
er.maydell@linaro.org&gt;<br>
<b>Sent:</b> October 4, 2022 9:20 AM<br>
<b>To:</b> a b &lt;blue_3too@hotmail.com&gt;<br>
<b>Cc:</b> qemu-devel@nongnu.org &lt;qemu-devel@nongnu.org&gt;<br>
<b>Subject:</b> Re: A few QEMU questiosn</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">On Tue, 4 Oct 2022 at 02:10, a b &lt;blue_3too@hot=
mail.com&gt; wrote:<br>
&gt; I have a few newbie QEMU questions.&nbsp; I found that mmu_idx in aarc=
h64-softmmu&nbsp; falls in 8, 10 and 12.<br>
&gt;<br>
&gt; I need some help to understand what they are for.<br>
&gt;<br>
&gt; I cannot find which macros are for mmu-idx 8, 10 and 12 at target/arm/=
cpu.h. It looks like all the values from ARMMMUIdx are greater than 0x10 (A=
RM_MMU_IDX_A). Am I looking at the wrong place or missing something for the=
 different MMU modes in aarch64?<br>
<br>
The comment in target/arm/cpu.h and the various enum definitions<br>
should be what you need. Note in particular the part that says<br>
&quot;The ARMMMUIdx and the mmu index value used by the core QEMU<br>
&nbsp;TLB code are not quite the same&quot; and also the functions in<br>
internals.h arm_to_core_mmu_idx() and core_to_arm_mmu_idx()<br>
which convert between these two representations.<br>
<br>
PS: there is a refactoring patch set currently in review which<br>
changes the MMU index allocation (essentially it collapses<br>
the separate Secure and NonSecure MMUIdx values together),<br>
so the specific details will likely change at some point this<br>
release cycle.<br>
<br>
thanks<br>
-- PMM<br>
</div>
</span></font></div>
</body>
</html>

--_000_SJ1PR12MB6290CCA4E526946666A4005FC95C9SJ1PR12MB6290namp_--

