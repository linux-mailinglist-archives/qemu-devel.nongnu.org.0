Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4028F17A4E0
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Mar 2020 13:05:59 +0100 (CET)
Received: from localhost ([::1]:47796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j9pGI-00020S-Bh
	for lists+qemu-devel@lfdr.de; Thu, 05 Mar 2020 07:05:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34252)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <frankja@linux.ibm.com>) id 1j9pFC-00014O-Mk
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 07:04:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <frankja@linux.ibm.com>) id 1j9pFA-0000w3-TX
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 07:04:50 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:47481
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <frankja@linux.ibm.com>)
 id 1j9pFA-0000vo-N3
 for qemu-devel@nongnu.org; Thu, 05 Mar 2020 07:04:48 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 025C0AdZ116962
 for <qemu-devel@nongnu.org>; Thu, 5 Mar 2020 07:04:48 -0500
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
 by mx0a-001b2d01.pphosted.com with ESMTP id 2yj6nkeb62-1
 (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 05 Mar 2020 07:04:46 -0500
Received: from localhost
 by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only!
 Violators will be prosecuted
 for <qemu-devel@nongnu.org> from <frankja@linux.ibm.com>;
 Thu, 5 Mar 2020 12:04:42 -0000
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
 by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted; 
 (version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
 Thu, 5 Mar 2020 12:04:39 -0000
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
 [9.149.105.58])
 by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 025C4clk15990836
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 5 Mar 2020 12:04:38 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B7CDF4C04E;
 Thu,  5 Mar 2020 12:04:38 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 76F664C052;
 Thu,  5 Mar 2020 12:04:38 +0000 (GMT)
Received: from dyn-9-152-224-184.boeblingen.de.ibm.com (unknown
 [9.152.224.184])
 by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
 Thu,  5 Mar 2020 12:04:38 +0000 (GMT)
Subject: Re: [PATCH v6 02/18] s390x: protvirt: Add diag308 subcodes 8 - 10
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20200304114231.23493-1-frankja@linux.ibm.com>
 <20200304114231.23493-3-frankja@linux.ibm.com>
 <45db12aa-eccf-5a57-fee3-c963b279937c@redhat.com>
From: Janosch Frank <frankja@linux.ibm.com>
Autocrypt: addr=frankja@linux.ibm.com; prefer-encrypt=mutual; keydata=
 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
Date: Thu, 5 Mar 2020 13:04:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <45db12aa-eccf-5a57-fee3-c963b279937c@redhat.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="8hoIlSafW7AhQweWAofnarfRhi1BLLDty"
X-TM-AS-GCONF: 00
x-cbid: 20030512-0008-0000-0000-000003599508
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 20030512-0009-0000-0000-00004A7ACC03
Message-Id: <740407ab-8ab4-4136-7ee5-42c52407f5b9@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138, 18.0.572
 definitions=2020-03-05_03:2020-03-05,
 2020-03-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 mlxlogscore=999 suspectscore=11
 impostorscore=0 priorityscore=1501 bulkscore=0 phishscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2001150001 definitions=main-2003050078
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
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
Cc: borntraeger@de.ibm.com, qemu-s390x@nongnu.org, cohuck@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--8hoIlSafW7AhQweWAofnarfRhi1BLLDty
Content-Type: multipart/mixed; boundary="xcna3SgeSvJyvrU4cnVkaI12Osp2yvSC5"

--xcna3SgeSvJyvrU4cnVkaI12Osp2yvSC5
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 3/4/20 6:04 PM, David Hildenbrand wrote:
> On 04.03.20 12:42, Janosch Frank wrote:
>> For diag308 subcodes 8 - 10 we have a new ipib of type 5. The ipib
>> holds the address and length of the secure execution header, as well
>> as a list of guest components.
>>
>> Each component is a block of memory, for example kernel or initrd,
>> which needs to be decrypted by the Ultravisor in order to run a
>> protected VM. The secure execution header instructs the Ultravisor on
>> how to handle the protected VM and its components.
>>
>> Subcodes 8 and 9 are similiar to 5 and 6 and subcode 10 will finally
>> start the protected guest.
>>
>> Subcodes 8-10 are not valid in protected mode, we have to do a subcode=

>> 3 and then the 8 and 10 combination for a protected reboot.
>>
>> Signed-off-by: Janosch Frank <frankja@linux.ibm.com>
>> ---
>>  hw/s390x/ipl.c      | 47 ++++++++++++++++++++++++++++++++++++++++++--=
-
>>  hw/s390x/ipl.h      | 32 ++++++++++++++++++++++++++++++
>>  target/s390x/diag.c | 26 ++++++++++++++++++++++---
>>  3 files changed, 99 insertions(+), 6 deletions(-)
>>
>> diff --git a/hw/s390x/ipl.c b/hw/s390x/ipl.c
>> index 9c1ecd423c..80c6ab233a 100644
>> --- a/hw/s390x/ipl.c
>> +++ b/hw/s390x/ipl.c
>> @@ -538,15 +538,55 @@ static bool is_virtio_scsi_device(IplParameterBl=
ock *iplb)
>>      return is_virtio_ccw_device_of_type(iplb, VIRTIO_ID_SCSI);
>>  }
>> =20
>> +int s390_ipl_pv_check_components(IplParameterBlock *iplb)
>=20
> What about making this
>=20
> bool s390_ipl_pv_valid(IplParameterBlock *iplb)
>=20
> and return true/false?

We already have iplb_valid_pv() and ipl->iplb_valid_pv.
Do you have any other more expressive name we could use?

>=20
>> +{
>> +    int i;
>> +    IPLBlockPV *ipib_pv =3D &iplb->pv;
>=20
> nit: place "int i;" down here

Ack

>=20
>> +
>> +    if (ipib_pv->num_comp =3D=3D 0) {
>> +        return -EINVAL;
>> +    }
>> +
>> +    for (i =3D 0; i < ipib_pv->num_comp; i++) {
>> +        /* Addr must be 4k aligned */
>> +        if (ipib_pv->components[i].addr & ~TARGET_PAGE_MASK) {
>> +            return -EINVAL;
>> +        }
>> +
>> +        /* Tweak prefix is monotonously increasing with each componen=
t */
>=20
> should that be "monotonically increasing" ?

Ooooooh, yeah...

>=20
>> +        if (i < ipib_pv->num_comp - 1 &&
>> +            ipib_pv->components[i].tweak_pref >
>> +            ipib_pv->components[i + 1].tweak_pref) {
>=20
> and I assume "=3D=3D" is valid then.

Nope, it should be >=3D in this check

>=20
>> +            return -EINVAL;
>> +        }
>> +    }
>> +    return 0;
>> +}
>> +
>>  void s390_ipl_update_diag308(IplParameterBlock *iplb)
>>  {
>>      S390IPLState *ipl =3D get_ipl_device();
>> =20
>> -    ipl->iplb =3D *iplb;
>> -    ipl->iplb_valid =3D true;
>> +    if (iplb->pbt =3D=3D S390_IPL_TYPE_PV) {
>> +        ipl->iplb_pv =3D *iplb;
>> +        ipl->iplb_valid_pv =3D true;
>> +    } else {
>> +        ipl->iplb =3D *iplb;
>> +        ipl->iplb_valid =3D true;
>> +    }
>>      ipl->netboot =3D is_virtio_net_device(iplb);
>>  }
>> =20
>> +IplParameterBlock *s390_ipl_get_iplb_secure(void)
>=20
> Why suddenly the "secure" ? s390_ipl_get_iplb_pv?

Remnants of former times

>=20
>> +{
>> +    S390IPLState *ipl =3D get_ipl_device();
>> +
>> +    if (!ipl->iplb_valid_pv) {
>> +        return NULL;
>> +    }
>> +    return &ipl->iplb_pv;
>> +}
>> +
>>  IplParameterBlock *s390_ipl_get_iplb(void)
>>  {
>>      S390IPLState *ipl =3D get_ipl_device();
>> @@ -561,7 +601,8 @@ void s390_ipl_reset_request(CPUState *cs, enum s39=
0_reset reset_type)
>>  {
>>      S390IPLState *ipl =3D get_ipl_device();
>> =20
>> -    if (reset_type =3D=3D S390_RESET_EXTERNAL || reset_type =3D=3D S3=
90_RESET_REIPL) {
>> +    if (reset_type =3D=3D S390_RESET_EXTERNAL || reset_type =3D=3D S3=
90_RESET_REIPL ||
>> +        reset_type =3D=3D S390_RESET_PV) {
>=20
> What about a switch-case now instead?
>=20
>>          /* use CPU 0 for full resets */
>>          ipl->reset_cpu_index =3D 0;
>>      } else {
>> diff --git a/hw/s390x/ipl.h b/hw/s390x/ipl.h
>> index d4813105db..04be63cee1 100644
>> --- a/hw/s390x/ipl.h
>> +++ b/hw/s390x/ipl.h
>> @@ -15,6 +15,24 @@
>>  #include "cpu.h"
>>  #include "hw/qdev-core.h"
>> =20
>> +struct IPLBlockPVComp {
>> +    uint64_t tweak_pref;
>> +    uint64_t addr;
>> +    uint64_t size;
>> +} QEMU_PACKED;
>=20
> Do we need the packed here? All members are naturally aligned.

No, I'll remove them

>=20
>> +typedef struct IPLBlockPVComp IPLBlockPVComp;
>> +
>> +struct IPLBlockPV {
>> +    uint8_t  reserved[87];
>> +    uint8_t  version;
>> +    uint32_t reserved70;
>> +    uint32_t num_comp;
>> +    uint64_t pv_header_addr;
>> +    uint64_t pv_header_len;
>> +    struct IPLBlockPVComp components[];
>> +} QEMU_PACKED;
>=20
> Dito.
>=20
> [...]
>=20
>>      uint64_t compat_bios_start_addr;
>>      bool enforce_bios;
>>      bool iplb_valid;
>> +    bool iplb_valid_pv;
>=20
> I'd name this "iplb_pv_valid" to match "iplb_pv".

I like matching prefixes :)

>=20
>>      bool netboot;
>>      /* reset related properties don't have to be migrated or reset */=

>>      enum s390_reset reset_type;
>> @@ -161,9 +185,11 @@ QEMU_BUILD_BUG_MSG(offsetof(S390IPLState, iplb) &=
 3, "alignment of iplb wrong");
>> =20
>>  #define S390_IPL_TYPE_FCP 0x00
>>  #define S390_IPL_TYPE_CCW 0x02
>> +#define S390_IPL_TYPE_PV 0x05
>>  #define S390_IPL_TYPE_QEMU_SCSI 0xff
>> =20
>>  #define S390_IPLB_HEADER_LEN 8
>> +#define S390_IPLB_MIN_PV_LEN 148
>>  #define S390_IPLB_MIN_CCW_LEN 200
>>  #define S390_IPLB_MIN_FCP_LEN 384
>>  #define S390_IPLB_MIN_QEMU_SCSI_LEN 200
>> @@ -185,4 +211,10 @@ static inline bool iplb_valid_fcp(IplParameterBlo=
ck *iplb)
>>             iplb->pbt =3D=3D S390_IPL_TYPE_FCP;
>>  }
>> =20
>> +static inline bool iplb_valid_pv(IplParameterBlock *iplb)
>> +{
>> +    return be32_to_cpu(iplb->len) >=3D S390_IPLB_MIN_PV_LEN &&
>> +           iplb->pbt =3D=3D S390_IPL_TYPE_PV;
>> +}
>> +
>>  #endif
>> diff --git a/target/s390x/diag.c b/target/s390x/diag.c
>> index b5aec06d6b..945b263f0a 100644
>> --- a/target/s390x/diag.c
>> +++ b/target/s390x/diag.c
>> @@ -52,6 +52,7 @@ int handle_diag_288(CPUS390XState *env, uint64_t r1,=
 uint64_t r3)
>>  #define DIAG_308_RC_OK              0x0001
>>  #define DIAG_308_RC_NO_CONF         0x0102
>>  #define DIAG_308_RC_INVALID         0x0402
>> +#define DIAG_308_RC_NO_PV_CONF      0x0902
>> =20
>>  #define DIAG308_RESET_MOD_CLR       0
>>  #define DIAG308_RESET_LOAD_NORM     1
>> @@ -59,6 +60,9 @@ int handle_diag_288(CPUS390XState *env, uint64_t r1,=
 uint64_t r3)
>>  #define DIAG308_LOAD_NORMAL_DUMP    4
>>  #define DIAG308_SET                 5
>>  #define DIAG308_STORE               6
>> +#define DIAG308_PV_SET              8
>> +#define DIAG308_PV_STORE            9
>> +#define DIAG308_PV_START            10
>> =20
>>  static int diag308_parm_check(CPUS390XState *env, uint64_t r1, uint64=
_t addr,
>>                                uintptr_t ra, bool write)
>> @@ -105,6 +109,7 @@ void handle_diag_308(CPUS390XState *env, uint64_t =
r1, uint64_t r3, uintptr_t ra)
>>          s390_ipl_reset_request(cs, S390_RESET_REIPL);
>>          break;
>>      case DIAG308_SET:
>> +    case DIAG308_PV_SET:
>>          if (diag308_parm_check(env, r1, addr, ra, false)) {
>>              return;
>>          }
>> @@ -117,7 +122,8 @@ void handle_diag_308(CPUS390XState *env, uint64_t =
r1, uint64_t r3, uintptr_t ra)
>> =20
>>          cpu_physical_memory_read(addr, iplb, be32_to_cpu(iplb->len));=

>> =20
>> -        if (!iplb_valid_ccw(iplb) && !iplb_valid_fcp(iplb)) {
>> +        if (!iplb_valid_ccw(iplb) && !iplb_valid_fcp(iplb) &&
>> +            !(iplb_valid_pv(iplb) && !s390_ipl_pv_check_components(ip=
lb))) {
>=20
> I really think we should make this s390_ipl_pv_valid(), we're mixing
> functions that return true on success with functions that return 0 on
> success. Also, can't we simply move that check into iplb_valid_pv(iplb)=

> to make this here easier to read?

Yes, let me figure something out

>=20
>>              env->regs[r1 + 1] =3D DIAG_308_RC_INVALID;
>>              goto out;
>>          }
>> @@ -128,17 +134,31 @@ out:
>>          g_free(iplb);
>>          return;
>>      case DIAG308_STORE:
>> +    case DIAG308_PV_STORE:
>>          if (diag308_parm_check(env, r1, addr, ra, true)) {
>>              return;
>>          }
>> -        iplb =3D s390_ipl_get_iplb();
>> +        if (subcode =3D=3D DIAG308_PV_STORE) {
>> +            iplb =3D s390_ipl_get_iplb_secure();
>> +        } else {
>> +            iplb =3D s390_ipl_get_iplb();
>> +        }
>>          if (iplb) {
>>              cpu_physical_memory_write(addr, iplb, be32_to_cpu(iplb->l=
en));
>>              env->regs[r1 + 1] =3D DIAG_308_RC_OK;
>>          } else {
>>              env->regs[r1 + 1] =3D DIAG_308_RC_NO_CONF;
>>          }
>> -        return;
>> +        break;
>> +    case DIAG308_PV_START:
>> +        iplb =3D s390_ipl_get_iplb_secure();
>> +        if (!iplb || !iplb_valid_pv(iplb)) {
>=20
> Why do we need another iplb_valid_pv() check? I thought we would verify=

> this when setting and marking valid.

Good question, I'll look into it and give this patch a dust off

>=20
>> +            env->regs[r1 + 1] =3D DIAG_308_RC_NO_PV_CONF;
>> +            return;
>> +        }
>> +
>=20
>=20



--xcna3SgeSvJyvrU4cnVkaI12Osp2yvSC5--

--8hoIlSafW7AhQweWAofnarfRhi1BLLDty
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEwGNS88vfc9+v45Yq41TmuOI4ufgFAl5g6tYACgkQ41TmuOI4
ufg1OhAAyVgOAEYUCUzvckDubcC3GpSSaw9Gef+TFsYYRVTUvA4m68Z6h5f65DF7
GkZyOAWMKl76tD7Hy9/VLsaJqVLmyvLRR7f6qiwieLeGyLmv9EGpdXchZxPOIiSD
3go0s9sb6bb6zlxSconYfQHY7T3z6Qniwbecdb7tH+uyHCaf6M68S4q7liwBJPbx
j9SLWqQbjWyiFNNvpyxDm9P/w38BJO6UfXsOPWnXp6sCF81SdbuyQp3UKCwrDQsE
Mt2wEoOuhKECrKt5Xg9W+nm6+VJW+kxAQq2JDlNb8aPF0/c0HwcbcXPQY29fRuho
sqB4VIZrwOr4CEOHzbVw8+vMoQGmuBdAdPuAm2hPH8uhxZmsojImRtyfdayqrN8/
nW68XdDmtOsyqzlVKAt0AW+u+dqnmeRgKZE0DY/orTAXsg1QdyzjFeBMbmcWb9RG
sJGSCpL89LrL4N9XNtm8EPxdtzemhAWj1sb+Jmn8MYV5XTX/eshWiSR7OgxqsbAf
CmHpiIcTUd6R5zK0cUkPbVm104+51LR2dtxmtvwdg/9xYVAD6fzd5NzHGeyt3uLf
kF1XefgjWGj3dKdUDVx3e8W1CkS7fScgJDNtusKm7g27XVLPowSLC2q6EhuT4cs6
/94g3IlwsOmEnmuqSqEr2re1w460LXY9cp1Y8VnbmZNwVvCdh7U=
=n3u+
-----END PGP SIGNATURE-----

--8hoIlSafW7AhQweWAofnarfRhi1BLLDty--


