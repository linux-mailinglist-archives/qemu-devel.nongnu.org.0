Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46EAC6AC33D
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 15:30:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZBqS-0001XA-N9; Mon, 06 Mar 2023 09:29:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chenbaozi@phytium.com.cn>)
 id 1pZBqP-0001Wc-PY; Mon, 06 Mar 2023 09:29:41 -0500
Received: from azure-sdnproxy.icoremail.net ([20.231.56.155])
 by eggs.gnu.org with smtp (Exim 4.90_1)
 (envelope-from <chenbaozi@phytium.com.cn>)
 id 1pZBqM-0004I6-HO; Mon, 06 Mar 2023 09:29:41 -0500
Received: from prodtpl.icoremail.net (unknown [10.12.1.20])
 by hzbj-icmmx-6 (Coremail) with SMTP id AQAAfwD3apxD+QVkavEyAQ--.8916S2;
 Mon, 06 Mar 2023 22:31:31 +0800 (CST)
Received: from smtpclient.apple (unknown [113.246.80.233])
 by mail (Coremail) with SMTP id AQAAfwDHFL6_+AVkdowAAA--.543S3;
 Mon, 06 Mar 2023 22:29:20 +0800 (CST)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH 1/2] target/arm: Add Neoverse-N1 registers
From: Chen Baozi <chenbaozi@phytium.com.cn>
In-Reply-To: <CAFEAcA-Ce4qpLjCmzVjuKmLM-RnNfW4rAtD_xMJPjM8U309S6Q@mail.gmail.com>
Date: Mon, 6 Mar 2023 22:29:09 +0800
Cc: qemu-devel@nongnu.org,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <253B993A-2ECE-42A3-83B0-908831D49D91@phytium.com.cn>
References: <20230303161518.3411149-1-chenbaozi@phytium.com.cn>
 <20230303161518.3411149-2-chenbaozi@phytium.com.cn>
 <CAFEAcA-Ce4qpLjCmzVjuKmLM-RnNfW4rAtD_xMJPjM8U309S6Q@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
X-Mailer: Apple Mail (2.3731.400.51.1.1)
X-CM-TRANSID: AQAAfwDHFL6_+AVkdowAAA--.543S3
X-CM-SenderInfo: hfkh0updr2xqxsk13x1xpou0fpof0/1tbiAQAKEWQE4IkIqgAAsx
Authentication-Results: hzbj-icmmx-6; spf=neutral smtp.mail=chenbaozi@
 phytium.com.cn;
X-Coremail-Antispam: 1Uk129KBjvJXoW3ArW5Ww4DXr1DuF4kAw1UWrg_yoW7Wr15pF
 nrGFn8WFyjqrsxJa1kAw1UCan5Aa1Fkr1jkrZFgr9a9Fn3J398Kr1qg345KF98G3W8J34F
 9a1jqrW29343ZrDanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 DUYxn0WfASr-VFAU7a7-sFnT9fnUUIcSsGvfJ3UbIYCTnIWIevJa73UjIFyTuYvj4RJUUU
 UUUUU
Received-SPF: pass client-ip=20.231.56.155;
 envelope-from=chenbaozi@phytium.com.cn; helo=azure-sdnproxy.icoremail.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Peter,

> On Mar 6, 2023, at 19:33, Peter Maydell <peter.maydell@linaro.org> =
wrote:
>=20
> On Fri, 3 Mar 2023 at 16:15, Chen Baozi <chenbaozi@phytium.com.cn> =
wrote:
>>=20
>> Add implementation defined registers for neoverse-n1 which
>> would be accessed by TF-A.
>>=20
>> Signed-off-by: Chen Baozi <chenbaozi@phytium.com.cn>
>> ---
>> target/arm/cpu64.c     |  2 ++
>> target/arm/cpu_tcg.c   | 62 =
++++++++++++++++++++++++++++++++++++++++++
>> target/arm/internals.h |  2 ++
>> 3 files changed, 66 insertions(+)
>>=20
>> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
>> index 4066950da1..a6ae7cafac 100644
>> --- a/target/arm/cpu64.c
>> +++ b/target/arm/cpu64.c
>> @@ -1094,6 +1094,8 @@ static void aarch64_neoverse_n1_initfn(Object =
*obj)
>>=20
>>     /* =46rom D5.1 AArch64 PMU register summary */
>>     cpu->isar.reset_pmcr_el0 =3D 0x410c3000;
>> +
>> +    define_neoverse_n1_cp_reginfo(cpu);
>> }
>>=20
>> static void aarch64_host_initfn(Object *obj)
>> diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
>> index df0c45e523..6a1bb56b25 100644
>> --- a/target/arm/cpu_tcg.c
>> +++ b/target/arm/cpu_tcg.c
>> @@ -150,6 +150,68 @@ void define_cortex_a72_a57_a53_cp_reginfo(ARMCPU =
*cpu)
>> {
>>     define_arm_cp_regs(cpu, cortex_a72_a57_a53_cp_reginfo);
>> }
>> +
>> +static const ARMCPRegInfo neoverse_n1_cp_reginfo[] =3D {
>> +    { .name =3D "ATCR_EL1", .state =3D ARM_CP_STATE_AA64,
>> +      .opc0 =3D 3, .opc1 =3D 0, .crn =3D 15, .crm =3D 7, .opc2 =3D =
0,
>> +      .access =3D PL1_RW, .type =3D ARM_CP_CONST, .resetvalue =3D 0 =
},
>> +    { .name =3D "ATCR_EL2", .state =3D ARM_CP_STATE_AA64,
>> +      .opc0 =3D 3, .opc1 =3D 4, .crn =3D 15, .crm =3D 7, .opc2 =3D =
0,
>> +      .access =3D PL2_RW, .type =3D ARM_CP_CONST, .resetvalue =3D 0 =
},
>> +    { .name =3D "ATCR_EL3", .state =3D ARM_CP_STATE_AA64,
>> +      .opc0 =3D 3, .opc1 =3D 6, .crn =3D 15, .crm =3D 7, .opc2 =3D =
0,
>> +      .access =3D PL3_RW, .type =3D ARM_CP_CONST, .resetvalue =3D 0 =
},
>> +    { .name =3D "ATCR_EL12", .state =3D ARM_CP_STATE_AA64,
>> +      .opc0 =3D 3, .opc1 =3D 5, .crn =3D 15, .crm =3D 7, .opc2 =3D =
0,
>> +      .access =3D PL2_RW, .type =3D ARM_CP_CONST, .resetvalue =3D 0 =
},
>> +    { .name =3D "AVTCR_EL2", .state =3D ARM_CP_STATE_AA64,
>> +      .opc0 =3D 3, .opc1 =3D 4, .crn =3D 15, .crm =3D 7, .opc2 =3D =
1,
>> +      .access =3D PL2_RW, .type =3D ARM_CP_CONST, .resetvalue =3D 0 =
},
>> +    { .name =3D "CPUACTLR_EL1", .state =3D ARM_CP_STATE_AA64,
>> +      .opc0 =3D 3, .opc1 =3D 0, .crn =3D 15, .crm =3D 1, .opc2 =3D =
0,
>> +      .access =3D PL1_RW, .type =3D ARM_CP_CONST, .resetvalue =3D 0 =
},
>> +    { .name =3D "CPUACTLR2_EL1", .state =3D ARM_CP_STATE_AA64,
>> +      .opc0 =3D 3, .opc1 =3D 0, .crn =3D 15, .crm =3D 1, .opc2 =3D =
1,
>> +      .access =3D PL1_RW, .type =3D ARM_CP_CONST, .resetvalue =3D 0 =
},
>> +    { .name =3D "CPUACTLR3_EL1", .state =3D ARM_CP_STATE_AA64,
>> +      .opc0 =3D 3, .opc1 =3D 0, .crn =3D 15, .crm =3D 1, .opc2 =3D =
2,
>> +      .access =3D PL1_RW, .type =3D ARM_CP_CONST, .resetvalue =3D 0 =
},
>> +    { .name =3D "CPUCFR_EL1", .state =3D ARM_CP_STATE_AA64,
>> +      .opc0 =3D 3, .opc1 =3D 0, .crn =3D 15, .crm =3D 0, .opc2 =3D =
0,
>> +      .access =3D PL1_RW, .type =3D ARM_CP_CONST, .resetvalue =3D 0 =
},
>=20
> .PL1_R -- this register is read-only.
>=20
> If we report bit 2 as 1 ("the DSU SCU is not present"), does
> TF-A pay attention to that and not try to access the DSU
> related registers you define in patch 2 ? If so, it would
> probably be nicer to say "no DSU" and not have to define
> dummy registers for it...

Aha! Yes, TF-A does have a function =E2=80=9Cis_scu_present_in_dsu" to =
check this bit.

I=E2=80=99ll work another version to fix them all (as well as the =
following issues).

Thanks.

Baozi.

>=20
>> +    { .name =3D "CPUECTLR_EL1", .state =3D ARM_CP_STATE_AA64,
>> +      .opc0 =3D 3, .opc1 =3D 0, .crn =3D 15, .crm =3D 1, .opc2 =3D =
4,
>> +      .access =3D PL1_RW, .type =3D ARM_CP_CONST, .resetvalue =3D =
0x961563010 },
>> +    { .name =3D "CPUPCR_EL3", .state =3D ARM_CP_STATE_AA64,
>> +      .opc0 =3D 3, .opc1 =3D 6, .crn =3D 15, .crm =3D 8, .opc2 =3D =
1,
>> +      .access =3D PL3_RW, .type =3D ARM_CP_CONST, .resetvalue =3D 0 =
},
>> +    { .name =3D "CPUPMR_EL3", .state =3D ARM_CP_STATE_AA64,
>> +      .opc0 =3D 3, .opc1 =3D 6, .crn =3D 15, .crm =3D 8, .opc2 =3D =
3,
>> +      .access =3D PL3_RW, .type =3D ARM_CP_CONST, .resetvalue =3D 0 =
},
>> +    { .name =3D "CPUPOR_EL3", .state =3D ARM_CP_STATE_AA64,
>> +      .opc0 =3D 3, .opc1 =3D 6, .crn =3D 15, .crm =3D 8, .opc2 =3D =
2,
>> +      .access =3D PL3_RW, .type =3D ARM_CP_CONST, .resetvalue =3D 0 =
},
>> +    { .name =3D "CPUPSELR_EL3", .state =3D ARM_CP_STATE_AA64,
>> +      .opc0 =3D 3, .opc1 =3D 6, .crn =3D 15, .crm =3D 8, .opc2 =3D =
0,
>> +      .access =3D PL3_RW, .type =3D ARM_CP_CONST, .resetvalue =3D 0 =
},
>> +    { .name =3D "CPUPWRCTLR_EL1", .state =3D ARM_CP_STATE_AA64,
>> +      .opc0 =3D 3, .opc1 =3D 0, .crn =3D 15, .crm =3D 2, .opc2 =3D =
7,
>> +      .access =3D PL1_RW, .type =3D ARM_CP_CONST, .resetvalue =3D 0 =
},
>> +    { .name =3D "ERXPFGCDN_EL1", .state =3D ARM_CP_STATE_AA64,
>> +      .opc0 =3D 3, .opc1 =3D 0, .crn =3D 15, .crm =3D 2, .opc2 =3D =
2,
>> +      .access =3D PL3_RW, .type =3D ARM_CP_CONST, .resetvalue =3D 0 =
},
>=20
> Shouldn't this be PL1_RW ?
>=20
>> +    { .name =3D "ERXPFGCTL_EL1", .state =3D ARM_CP_STATE_AA64,
>> +      .opc0 =3D 3, .opc1 =3D 0, .crn =3D 15, .crm =3D 2, .opc2 =3D =
1,
>> +      .access =3D PL3_RW, .type =3D ARM_CP_CONST, .resetvalue =3D 0 =
},
>=20
> Also PL1_RW.
>=20
>> +    { .name =3D "ERXPFGF_EL1", .state =3D ARM_CP_STATE_AA64,
>> +      .opc0 =3D 3, .opc1 =3D 0, .crn =3D 15, .crm =3D 2, .opc2 =3D =
0,
>> +      .access =3D PL1_RW, .type =3D ARM_CP_CONST, .resetvalue =3D 0 =
},
>> +};
>> +
>> +void define_neoverse_n1_cp_reginfo(ARMCPU *cpu)
>> +{
>> +    define_arm_cp_regs(cpu, neoverse_n1_cp_reginfo);
>> +}
>> #endif /* !CONFIG_USER_ONLY */
>=20
> thanks
> -- PMM



