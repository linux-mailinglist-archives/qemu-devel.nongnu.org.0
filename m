Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19571131FD9
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 07:35:09 +0100 (CET)
Received: from localhost ([::1]:43028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ioiSH-0004AW-4Z
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 01:35:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37730)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <ganeshgr@linux.ibm.com>) id 1ioiLw-00055E-A4
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 01:28:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ganeshgr@linux.ibm.com>) id 1ioiLu-00057z-LO
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 01:28:32 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:15416
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ganeshgr@linux.ibm.com>)
 id 1ioiLu-0004Et-H8
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 01:28:30 -0500
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 0076RRfI119628
 for <qemu-devel@nongnu.org>; Tue, 7 Jan 2020 01:27:29 -0500
Received: from e06smtp04.uk.ibm.com (e06smtp04.uk.ibm.com [195.75.94.100])
 by mx0b-001b2d01.pphosted.com with ESMTP id 2xb8n1h5jm-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Tue, 07 Jan 2020 01:27:28 -0500
Received: from localhost
 by e06smtp04.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <ganeshgr@linux.ibm.com>;
 Tue, 7 Jan 2020 06:27:13 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp04.uk.ibm.com (192.168.101.134) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Tue, 7 Jan 2020 06:27:11 -0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 0076RALM60424370
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 7 Jan 2020 06:27:10 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 4DF4AA4051;
 Tue,  7 Jan 2020 06:27:10 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id EC9BFA4057;
 Tue,  7 Jan 2020 06:27:08 +0000 (GMT)
Received: from localhost.localdomain (unknown [9.124.35.97])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Tue,  7 Jan 2020 06:27:08 +0000 (GMT)
Subject: Re: [PATCH v18 5/7] ppc: spapr: Handle "ibm,nmi-register" and
 "ibm,nmi-interlock" RTAS calls
To: David Gibson <david@gibson.dropbear.id.au>
References: <20200102075111.25308-1-ganeshgr@linux.ibm.com>
 <20200102075111.25308-6-ganeshgr@linux.ibm.com> <20200103021959.GR2098@umbus>
From: Ganesh <ganeshgr@linux.ibm.com>
Date: Tue, 7 Jan 2020 11:57:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20200103021959.GR2098@umbus>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 20010706-0016-0000-0000-000002DB0E5C
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20010706-0017-0000-0000-0000333D83C1
Message-Id: <279e921a-7540-d543-ba16-7fca55aff056@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,18.0.572
 definitions=2020-01-07_01:2020-01-06,2020-01-07 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 bulkscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-1910280000 definitions=main-2001070050
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by
 mx0b-001b2d01.pphosted.com id 0076RRfI119628
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic] [fuzzy]
X-Received-From: 148.163.158.5
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
Cc: Aravinda Prasad <arawinda.p@gmail.com>, aik@ozlabs.ru,
 qemu-devel@nongnu.org, groug@kaod.org, paulus@ozlabs.org, qemu-ppc@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


On 1/3/20 7:49 AM, David Gibson wrote:
> On Thu, Jan 02, 2020 at 01:21:09PM +0530, Ganesh Goudar wrote:
>> From: Aravinda Prasad <arawinda.p@gmail.com>
>>
>> This patch adds support in QEMU to handle "ibm,nmi-register"
>> and "ibm,nmi-interlock" RTAS calls.
>>
>> The machine check notification address is saved when the
>> OS issues "ibm,nmi-register" RTAS call.
>>
>> This patch also handles the case when multiple processors
>> experience machine check at or about the same time by
>> handling "ibm,nmi-interlock" call. In such cases, as per
>> PAPR, subsequent processors serialize waiting for the first
>> processor to issue the "ibm,nmi-interlock" call. The second
>> processor that also received a machine check error waits
>> till the first processor is done reading the error log.
>> The first processor issues "ibm,nmi-interlock" call
>> when the error log is consumed.
>>
>> [Move fwnmi registration to .apply hook]
>> Signed-off-by: Ganesh Goudar <ganeshgr@linux.ibm.com>
>> Signed-off-by: Aravinda Prasad <arawinda.p@gmail.com>
>> ---
>>   hw/ppc/spapr_caps.c    |  6 +++++
>>   hw/ppc/spapr_rtas.c    | 58 ++++++++++++++++++++++++++++++++++++++++=
++
>>   include/hw/ppc/spapr.h |  7 ++++-
>>   3 files changed, 70 insertions(+), 1 deletion(-)
>>
>> diff --git a/hw/ppc/spapr_caps.c b/hw/ppc/spapr_caps.c
>> index 3001098601..e922419cfb 100644
>> --- a/hw/ppc/spapr_caps.c
>> +++ b/hw/ppc/spapr_caps.c
>> @@ -502,6 +502,12 @@ static void cap_fwnmi_mce_apply(SpaprMachineState=
 *spapr, uint8_t val,
>>       if (!val) {
>>           return; /* Disabled by default */
>>       }
>> +
>> +    if (!spapr->fwnmi_calls_registered && !kvmppc_set_fwnmi()) {
> So, we definitely need the kvmppc_set_fwnmi() call here.  But in the
> case where we *do* have KVM, but the call fails, we should fail the
> .apply hook, rather than ignoring it silently.
>
> As we've discussed although TCG behaviour with fwnmi isn't 100%
> correct, it's close enough to pass for most purposes - so it's
> reasonable to continue if the cap is selected.  But if the cap is
> selected and we're running with KVM we *must* enable the capability in
> KVM or we're not providing the environment the user requested.
>
>> +        /* Register ibm,nmi-register and ibm,nmi-interlock RTAS calls=
 */
>> +        spapr_fwnmi_register();
> We discussed registering the hypercalls here, but I thought after that
> I suggested just always registering them, and having them bail out
> when called if the cap is not set.  I see that you've implemented that
> bailout for register, though not for interlock.  I think that's
> simpler than registering them here.

something like this?, with bailout in interlock as well.

{
 =A0=A0=A0 if (!val) {
 =A0=A0=A0=A0=A0=A0=A0 return; /* Disabled by default */
 =A0=A0=A0 }

 =A0=A0=A0 if (kvm_enabled()) {
 =A0=A0=A0=A0=A0=A0=A0 if (kvmppc_set_fwnmi() < 0) {
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 error_report("Could not enable fwnmi c=
apability");
 =A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0 exit(1)
 =A0=A0=A0 }

 =A0=A0=A0 if (!spapr->fwnmi_calls_registered) {
 =A0=A0=A0=A0=A0=A0=A0 /* Register ibm,nmi-register and ibm,nmi-interlock=
 RTAS calls */
 =A0=A0=A0=A0=A0=A0=A0 spapr_fwnmi_register();
 =A0=A0=A0=A0=A0=A0=A0 spapr->fwnmi_calls_registered =3D true;
 =A0=A0=A0 }
}

>
>> +        spapr->fwnmi_calls_registered =3D true;
>> +    }
>>   }
>>  =20
>>   SpaprCapabilityInfo capability_table[SPAPR_CAP_NUM] =3D {
>> diff --git a/hw/ppc/spapr_rtas.c b/hw/ppc/spapr_rtas.c
>> index 2c066a372d..54b142f35b 100644
>> --- a/hw/ppc/spapr_rtas.c
>> +++ b/hw/ppc/spapr_rtas.c
>> @@ -400,6 +400,56 @@ static void rtas_get_power_level(PowerPCCPU *cpu,=
 SpaprMachineState *spapr,
>>       rtas_st(rets, 1, 100);
>>   }
>>  =20
>> +static void rtas_ibm_nmi_register(PowerPCCPU *cpu,
>> +                                  SpaprMachineState *spapr,
>> +                                  uint32_t token, uint32_t nargs,
>> +                                  target_ulong args,
>> +                                  uint32_t nret, target_ulong rets)
>> +{
>> +    hwaddr rtas_addr;
>> +
>> +    if (spapr_get_cap(spapr, SPAPR_CAP_FWNMI_MCE) =3D=3D SPAPR_CAP_OF=
F) {
>> +        rtas_st(rets, 0, RTAS_OUT_NOT_SUPPORTED);
>> +        return;
>> +    }
>> +
>> +    rtas_addr =3D spapr_get_rtas_addr();
>> +    if (!rtas_addr) {
>> +        rtas_st(rets, 0, RTAS_OUT_NOT_SUPPORTED);
>> +        return;
>> +    }
>> +
>> +    spapr->guest_machine_check_addr =3D rtas_ld(args, 1);
>> +    rtas_st(rets, 0, RTAS_OUT_SUCCESS);
>> +}
>> +
>> +static void rtas_ibm_nmi_interlock(PowerPCCPU *cpu,
>> +                                   SpaprMachineState *spapr,
>> +                                   uint32_t token, uint32_t nargs,
>> +                                   target_ulong args,
>> +                                   uint32_t nret, target_ulong rets)
>> +{
>> +    if (spapr->guest_machine_check_addr =3D=3D -1) {
>> +        /* NMI register not called */
>> +        rtas_st(rets, 0, RTAS_OUT_PARAM_ERROR);
>> +        return;
>> +    }
>> +
>> +    if (spapr->mc_status !=3D cpu->vcpu_id) {
>> +        /* The vCPU that hit the NMI should invoke "ibm,nmi-interlock=
" */
>> +        rtas_st(rets, 0, RTAS_OUT_PARAM_ERROR);
>> +        return;
>> +    }
>> +
>> +    /*
>> +     * vCPU issuing "ibm,nmi-interlock" is done with NMI handling,
>> +     * hence unset mc_status.
>> +     */
>> +    spapr->mc_status =3D -1;
>> +    qemu_cond_signal(&spapr->mc_delivery_cond);
>> +    rtas_st(rets, 0, RTAS_OUT_SUCCESS);
>> +}
>> +
>>   static struct rtas_call {
>>       const char *name;
>>       spapr_rtas_fn fn;
>> @@ -503,6 +553,14 @@ hwaddr spapr_get_rtas_addr(void)
>>       return (hwaddr)fdt32_to_cpu(*rtas_data);
>>   }
>>  =20
>> +void spapr_fwnmi_register(void)
>> +{
>> +    spapr_rtas_register(RTAS_IBM_NMI_REGISTER, "ibm,nmi-register",
>> +                        rtas_ibm_nmi_register);
>> +    spapr_rtas_register(RTAS_IBM_NMI_INTERLOCK, "ibm,nmi-interlock",
>> +                        rtas_ibm_nmi_interlock);
>> +}
>> +
>>   static void core_rtas_register_types(void)
>>   {
>>       spapr_rtas_register(RTAS_DISPLAY_CHARACTER, "display-character",
>> diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
>> index 652a5514e8..a90e677cc3 100644
>> --- a/include/hw/ppc/spapr.h
>> +++ b/include/hw/ppc/spapr.h
>> @@ -218,6 +218,8 @@ struct SpaprMachineState {
>>  =20
>>       unsigned gpu_numa_id;
>>       SpaprTpmProxy *tpm_proxy;
>> +
>> +    bool fwnmi_calls_registered;
>>   };
>>  =20
>>   #define H_SUCCESS         0
>> @@ -656,8 +658,10 @@ target_ulong spapr_hypercall(PowerPCCPU *cpu, tar=
get_ulong opcode,
>>   #define RTAS_IBM_REMOVE_PE_DMA_WINDOW           (RTAS_TOKEN_BASE + 0=
x28)
>>   #define RTAS_IBM_RESET_PE_DMA_WINDOW            (RTAS_TOKEN_BASE + 0=
x29)
>>   #define RTAS_IBM_SUSPEND_ME                     (RTAS_TOKEN_BASE + 0=
x2A)
>> +#define RTAS_IBM_NMI_REGISTER                   (RTAS_TOKEN_BASE + 0x=
2B)
>> +#define RTAS_IBM_NMI_INTERLOCK                  (RTAS_TOKEN_BASE + 0x=
2C)
>>  =20
>> -#define RTAS_TOKEN_MAX                          (RTAS_TOKEN_BASE + 0x=
2B)
>> +#define RTAS_TOKEN_MAX                          (RTAS_TOKEN_BASE + 0x=
2D)
>>  =20
>>   /* RTAS ibm,get-system-parameter token values */
>>   #define RTAS_SYSPARM_SPLPAR_CHARACTERISTICS      20
>> @@ -908,4 +912,5 @@ void spapr_check_pagesize(SpaprMachineState *spapr=
, hwaddr pagesize,
>>  =20
>>   void spapr_set_all_lpcrs(target_ulong value, target_ulong mask);
>>   hwaddr spapr_get_rtas_addr(void);
>> +void spapr_fwnmi_register(void);
>>   #endif /* HW_SPAPR_H */


