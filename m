Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6235F00D
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Apr 2019 07:42:33 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39435 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hLLXF-0001nG-1C
	for lists+qemu-devel@lfdr.de; Tue, 30 Apr 2019 01:42:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40885)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1hLLWD-0001LF-P8
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 01:41:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <borntraeger@de.ibm.com>) id 1hLLWB-0006mt-TN
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 01:41:29 -0400
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:47436
	helo=mx0a-001b2d01.pphosted.com)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <borntraeger@de.ibm.com>)
	id 1hLLWB-0006li-Nw
	for qemu-devel@nongnu.org; Tue, 30 Apr 2019 01:41:27 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x3U5fNOe113513
	for <qemu-devel@nongnu.org>; Tue, 30 Apr 2019 01:41:24 -0400
Received: from e06smtp02.uk.ibm.com (e06smtp02.uk.ibm.com [195.75.94.98])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2s6fjw9q3e-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <qemu-devel@nongnu.org>; Tue, 30 Apr 2019 01:41:23 -0400
Received: from localhost
	by e06smtp02.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <qemu-devel@nongnu.org> from <borntraeger@de.ibm.com>;
	Tue, 30 Apr 2019 06:41:20 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
	by e06smtp02.uk.ibm.com (192.168.101.132) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Tue, 30 Apr 2019 06:41:18 +0100
Received: from d06av26.portsmouth.uk.ibm.com (d06av26.portsmouth.uk.ibm.com
	[9.149.105.62])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x3U5fGFB55771330
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Tue, 30 Apr 2019 05:41:16 GMT
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 56AB3AE055;
	Tue, 30 Apr 2019 05:41:16 +0000 (GMT)
Received: from d06av26.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D3FCEAE045;
	Tue, 30 Apr 2019 05:41:15 +0000 (GMT)
Received: from oc7455500831.ibm.com (unknown [9.145.174.165])
	by d06av26.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Tue, 30 Apr 2019 05:41:15 +0000 (GMT)
To: David Hildenbrand <david@redhat.com>, Cornelia Huck <cohuck@redhat.com>
References: <20190429090250.7648-1-borntraeger@de.ibm.com>
	<20190429090250.7648-5-borntraeger@de.ibm.com>
	<0ad32bcf-0132-3905-3220-0f50e26937c3@redhat.com>
From: Christian Borntraeger <borntraeger@de.ibm.com>
Openpgp: preference=signencrypt
Autocrypt: addr=borntraeger@de.ibm.com; prefer-encrypt=mutual; keydata=
	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
	syiRa+UVlsKmx1hsEg==
Date: Tue, 30 Apr 2019 07:41:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <0ad32bcf-0132-3905-3220-0f50e26937c3@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
x-cbid: 19043005-0008-0000-0000-000002E1B291
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19043005-0009-0000-0000-0000224E18C9
Message-Id: <b0b0ec8f-d5ee-c08f-11dd-894d9433159f@de.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-04-30_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1904300038
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 3.x [generic]
X-Received-From: 148.163.158.5
Subject: Re: [Qemu-devel] [PATCH v3 4/9] s390x/cpumodel: msa9 facility
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "Jason J . Herne" <jjherne@linux.ibm.com>,
	Collin Walling <walling@linux.ibm.com>, qemu-devel <qemu-devel@nongnu.org>,
	Halil Pasic <pasic@linux.ibm.com>, qemu-s390x <qemu-s390x@nongnu.org>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 29.04.19 21:24, David Hildenbrand wrote:
> On 29.04.19 11:02, Christian Borntraeger wrote:
>> Provide the MSA9 facility (stfle.155).
>> This also contains pckmo functions for key wrapping. Keep them in a
>> separate group to disable those as a block if necessary.
>>
>> Signed-off-by: Christian Borntraeger <borntraeger@de.ibm.com>
>> ---
>>  target/s390x/cpu_features.c     | 32 +++++++++++++++++++++++++
>>  target/s390x/cpu_features.h     |  1 +
>>  target/s390x/cpu_features_def.h | 31 ++++++++++++++++++++++++
>>  target/s390x/cpu_models.c       |  2 ++
>>  target/s390x/gen-features.c     | 42 +++++++++++++++++++++++++++++++++
>>  target/s390x/kvm.c              |  6 +++++
>>  6 files changed, 114 insertions(+)
>>
>> diff --git a/target/s390x/cpu_features.c b/target/s390x/cpu_features.c
>> index bbd8902087..154e2bb354 100644
>> --- a/target/s390x/cpu_features.c
>> +++ b/target/s390x/cpu_features.c
>> @@ -108,6 +108,7 @@ static const S390FeatDef s390_features[] = {
>>      FEAT_INIT("irbm", S390_FEAT_TYPE_STFL, 145, "Insert-reference-bits-multiple facility"),
>>      FEAT_INIT("msa8-base", S390_FEAT_TYPE_STFL, 146, "Message-security-assist-extension-8 facility (excluding subfunctions)"),
>>      FEAT_INIT("cmmnt", S390_FEAT_TYPE_STFL, 147, "CMM: ESSA-enhancement (no translate) facility"),
>> +    FEAT_INIT("msa9-base", S390_FEAT_TYPE_STFL, 155, "Message-security-assist-extension-9 facility (excluding subfunctions)"),
>>      FEAT_INIT("etoken", S390_FEAT_TYPE_STFL, 156, "Etoken facility"),
>>  
>>      /* SCLP SCCB Byte 80 - 98  (bit numbers relative to byte-80) */
>> @@ -242,6 +243,11 @@ static const S390FeatDef s390_features[] = {
>>      FEAT_INIT("pckmo-aes-128", S390_FEAT_TYPE_PCKMO, 18, "PCKMO Encrypted-AES-128-Key"),
>>      FEAT_INIT("pckmo-aes-192", S390_FEAT_TYPE_PCKMO, 19, "PCKMO Encrypted-AES-192-Key"),
>>      FEAT_INIT("pckmo-aes-256", S390_FEAT_TYPE_PCKMO, 20, "PCKMO Encrypted-AES-256-Key"),
>> +    FEAT_INIT("pckmo-ecc-p256", S390_FEAT_TYPE_PCKMO, 32, "PCKMO Encrypt-ECC-P256-Key"),
>> +    FEAT_INIT("pckmo-ecc-p384", S390_FEAT_TYPE_PCKMO, 33, "PCKMO Encrypt-ECC-P384-Key"),
>> +    FEAT_INIT("pckmo-ecc-p521", S390_FEAT_TYPE_PCKMO, 34, "PCKMO Encrypt-ECC-P521-Key"),
>> +    FEAT_INIT("pckmo-ecc-ed25519", S390_FEAT_TYPE_PCKMO, 40 , "PCKMO Encrypt-ECC-Ed25519-Key"),
>> +    FEAT_INIT("pckmo-ecc-ed448", S390_FEAT_TYPE_PCKMO, 41 , "PCKMO Encrypt-ECC-Ed448-Key"),
>>  
>>      FEAT_INIT("kmctr-dea", S390_FEAT_TYPE_KMCTR, 1, "KMCTR DEA"),
>>      FEAT_INIT("kmctr-tdea-128", S390_FEAT_TYPE_KMCTR, 2, "KMCTR TDEA-128"),
>> @@ -298,6 +304,13 @@ static const S390FeatDef s390_features[] = {
>>      FEAT_INIT("pcc-xts-aes-256", S390_FEAT_TYPE_PCC, 52, "PCC Compute-XTS-Parameter-Using-AES-256"),
>>      FEAT_INIT("pcc-xts-eaes-128", S390_FEAT_TYPE_PCC, 58, "PCC Compute-XTS-Parameter-Using-Encrypted-AES-128"),
>>      FEAT_INIT("pcc-xts-eaes-256", S390_FEAT_TYPE_PCC, 60, "PCC Compute-XTS-Parameter-Using-Encrypted-AES-256"),
>> +    FEAT_INIT("pcc-scalar-mult-p256", S390_FEAT_TYPE_PCC, 64, "PCC Scalar-Multiply-P256"),
>> +    FEAT_INIT("pcc-scalar-mult-p384", S390_FEAT_TYPE_PCC, 65, "PCC Scalar-Multiply-P384"),
>> +    FEAT_INIT("pcc-scalar-mult-p521", S390_FEAT_TYPE_PCC, 66, "PCC Scalar-Multiply-P521"),
>> +    FEAT_INIT("pcc-scalar-mult-ed25519", S390_FEAT_TYPE_PCC, 72, "PCC Scalar-Multiply-Ed25519"),
>> +    FEAT_INIT("pcc-scalar-mult-ed448", S390_FEAT_TYPE_PCC, 73, "PCC Scalar-Multiply-Ed448"),
>> +    FEAT_INIT("pcc-scalar-mult-x25519", S390_FEAT_TYPE_PCC, 80, "PCC Scalar-Multiply-X25519"),
>> +    FEAT_INIT("pcc-scalar-mult-x448", S390_FEAT_TYPE_PCC, 81, "PCC Scalar-Multiply-X448"),
>>  
>>      FEAT_INIT("ppno-sha-512-drng", S390_FEAT_TYPE_PPNO, 3, "PPNO SHA-512-DRNG"),
>>      FEAT_INIT("prno-trng-qrtcr", S390_FEAT_TYPE_PPNO, 112, "PRNO TRNG-Query-Raw-to-Conditioned-Ratio"),
>> @@ -309,6 +322,22 @@ static const S390FeatDef s390_features[] = {
>>      FEAT_INIT("kma-gcm-eaes-128", S390_FEAT_TYPE_KMA, 26, "KMA GCM-Encrypted-AES-128"),
>>      FEAT_INIT("kma-gcm-eaes-192", S390_FEAT_TYPE_KMA, 27, "KMA GCM-Encrypted-AES-192"),
>>      FEAT_INIT("kma-gcm-eaes-256", S390_FEAT_TYPE_KMA, 28, "KMA GCM-Encrypted-AES-256"),
>> +
>> +    FEAT_INIT("kdsa-ecdsa-verify-p256", S390_FEAT_TYPE_KDSA, 1, "KDSA ECDSA-Verify-P256"),
>> +    FEAT_INIT("kdsa-ecdsa-verify-p384", S390_FEAT_TYPE_KDSA, 2, "KDSA ECDSA-Verify-P384"),
>> +    FEAT_INIT("kdsa-ecdsa-verify-p521", S390_FEAT_TYPE_KDSA, 3, "KDSA ECDSA-Verify-P521"),
>> +    FEAT_INIT("kdsa-ecdsa-sign-p256", S390_FEAT_TYPE_KDSA, 9, "KDSA ECDSA-Sign-P256"),
>> +    FEAT_INIT("kdsa-ecdsa-sign-p384", S390_FEAT_TYPE_KDSA, 10, "KDSA ECDSA-Sign-P384"),
>> +    FEAT_INIT("kdsa-ecdsa-sign-p521", S390_FEAT_TYPE_KDSA, 11, "KDSA ECDSA-Sign-P521"),
>> +    FEAT_INIT("kdsa-eecdsa-sign-p256", S390_FEAT_TYPE_KDSA, 17, "KDSA Encrypted-ECDSA-Sign-P256"),
>> +    FEAT_INIT("kdsa-eecdsa-sign-p384", S390_FEAT_TYPE_KDSA, 18, "KDSA Encrypted-ECDSA-Sign-P384"),
>> +    FEAT_INIT("kdsa-eecdsa-sign-p521", S390_FEAT_TYPE_KDSA, 19, "KDSA Encrypted-ECDSA-Sign-P521"),
>> +    FEAT_INIT("kdsa-eddsa-verify-ed25519", S390_FEAT_TYPE_KDSA, 32, "KDSA EdDSA-Verify-Ed25519"),
>> +    FEAT_INIT("kdsa-eddsa-verify-ed448", S390_FEAT_TYPE_KDSA, 36, "KDSA EdDSA-Verify-Ed448"),
>> +    FEAT_INIT("kdsa-eddsa-sign-ed25519", S390_FEAT_TYPE_KDSA, 40, "KDSA EdDSA-Sign-Ed25519"),
>> +    FEAT_INIT("kdsa-eddsa-sign-ed448", S390_FEAT_TYPE_KDSA, 44, "KDSA EdDSA-Sign-Ed448"),
>> +    FEAT_INIT("kdsa-eeddsa-sign-ed25519", S390_FEAT_TYPE_KDSA, 48, "KDSA Encrypted-EdDSA-Sign-Ed25519"),
>> +    FEAT_INIT("kdsa-eeddsa-sign-ed448", S390_FEAT_TYPE_KDSA, 52, "KDSA Encrypted-EdDSA-Sign-Ed448"),
>>  };
>>  
>>  const S390FeatDef *s390_feat_def(S390Feat feat)
>> @@ -371,6 +400,7 @@ void s390_fill_feat_block(const S390FeatBitmap features, S390FeatType type,
>>      case S390_FEAT_TYPE_PCC:
>>      case S390_FEAT_TYPE_PPNO:
>>      case S390_FEAT_TYPE_KMA:
>> +    case S390_FEAT_TYPE_KDSA:
>>          set_be_bit(0, data); /* query is always available */
>>          break;
>>      default:
>> @@ -466,6 +496,8 @@ static S390FeatGroupDef s390_feature_groups[] = {
>>      FEAT_GROUP_INIT("msa6", MSA_EXT_6, "Message-security-assist-extension 6 facility"),
>>      FEAT_GROUP_INIT("msa7", MSA_EXT_7, "Message-security-assist-extension 7 facility"),
>>      FEAT_GROUP_INIT("msa8", MSA_EXT_8, "Message-security-assist-extension 8 facility"),
>> +    FEAT_GROUP_INIT("msa9", MSA_EXT_9, "Message-security-assist-extension 9 facility"),
>> +    FEAT_GROUP_INIT("msa9_pckmo", MSA_EXT_9_PCKMO, "Message-security-assist-extension 9 PCKMO subfunctions"),
>>      FEAT_GROUP_INIT("mepochptff", MULTIPLE_EPOCH_PTFF, "PTFF enhancements introduced with Multiple-epoch facility"),
>>  };
>>  
>> diff --git a/target/s390x/cpu_features.h b/target/s390x/cpu_features.h
>> index effe790271..5ffd3db083 100644
>> --- a/target/s390x/cpu_features.h
>> +++ b/target/s390x/cpu_features.h
>> @@ -39,6 +39,7 @@ typedef enum {
>>      S390_FEAT_TYPE_PCC,
>>      S390_FEAT_TYPE_PPNO,
>>      S390_FEAT_TYPE_KMA,
>> +    S390_FEAT_TYPE_KDSA,
>>  } S390FeatType;
>>  
>>  /* Definition of a CPU feature */
>> diff --git a/target/s390x/cpu_features_def.h b/target/s390x/cpu_features_def.h
>> index 31dd678301..030784811b 100644
>> --- a/target/s390x/cpu_features_def.h
>> +++ b/target/s390x/cpu_features_def.h
>> @@ -96,6 +96,7 @@ typedef enum {
>>      S390_FEAT_INSERT_REFERENCE_BITS_MULT,
>>      S390_FEAT_MSA_EXT_8,
>>      S390_FEAT_CMM_NT,
>> +    S390_FEAT_MSA_EXT_9,
>>      S390_FEAT_ETOKEN,
>>  
>>      /* Sclp Conf Char */
>> @@ -240,6 +241,11 @@ typedef enum {
>>      S390_FEAT_PCKMO_AES_128,
>>      S390_FEAT_PCKMO_AES_192,
>>      S390_FEAT_PCKMO_AES_256,
>> +    S390_FEAT_PCKMO_ECC_P256,
>> +    S390_FEAT_PCKMO_ECC_P384,
>> +    S390_FEAT_PCKMO_ECC_P521,
>> +    S390_FEAT_PCKMO_ECC_ED25519,
>> +    S390_FEAT_PCKMO_ECC_ED448,
>>  
>>      /* KMCTR */
>>      S390_FEAT_KMCTR_DEA,
>> @@ -300,6 +306,13 @@ typedef enum {
>>      S390_FEAT_PCC_XTS_AES_256,
>>      S390_FEAT_PCC_XTS_EAES_128,
>>      S390_FEAT_PCC_XTS_EAES_256,
>> +    S390_FEAT_PCC_SCALAR_MULT_P256,
>> +    S390_FEAT_PCC_SCALAR_MULT_P384,
>> +    S390_FEAT_PCC_SCALAR_MULT_P512,
>> +    S390_FEAT_PCC_SCALAR_MULT_ED25519,
>> +    S390_FEAT_PCC_SCALAR_MULT_ED448,
>> +    S390_FEAT_PCC_SCALAR_MULT_X25519,
>> +    S390_FEAT_PCC_SCALAR_MULT_X448,
>>  
>>      /* PPNO/PRNO */
>>      S390_FEAT_PPNO_SHA_512_DRNG,
>> @@ -313,6 +326,24 @@ typedef enum {
>>      S390_FEAT_KMA_GCM_EAES_128,
>>      S390_FEAT_KMA_GCM_EAES_192,
>>      S390_FEAT_KMA_GCM_EAES_256,
>> +
>> +    /* KDSA */
>> +    S390_FEAT_ECDSA_VERIFY_P256,
>> +    S390_FEAT_ECDSA_VERIFY_P384,
>> +    S390_FEAT_ECDSA_VERIFY_P512,
>> +    S390_FEAT_ECDSA_SIGN_P256,
>> +    S390_FEAT_ECDSA_SIGN_P384,
>> +    S390_FEAT_ECDSA_SIGN_P512,
>> +    S390_FEAT_EECDSA_SIGN_P256,
>> +    S390_FEAT_EECDSA_SIGN_P384,
>> +    S390_FEAT_EECDSA_SIGN_P512,
>> +    S390_FEAT_EDDSA_VERIFY_ED25519,
>> +    S390_FEAT_EDDSA_VERIFY_ED448,
>> +    S390_FEAT_EDDSA_SIGN_ED25519,
>> +    S390_FEAT_EDDSA_SIGN_ED448,
>> +    S390_FEAT_EEDDSA_SIGN_ED25519,
>> +    S390_FEAT_EEDDSA_SIGN_ED448,
>> +
>>      S390_FEAT_MAX,
>>  } S390Feat;
>>  
>> diff --git a/target/s390x/cpu_models.c b/target/s390x/cpu_models.c
>> index b4bb5de635..d683635eb5 100644
>> --- a/target/s390x/cpu_models.c
>> +++ b/target/s390x/cpu_models.c
>> @@ -782,6 +782,8 @@ static void check_consistency(const S390CPUModel *model)
>>          { S390_FEAT_SIE_CMMA, S390_FEAT_SIE_GSLS },
>>          { S390_FEAT_SIE_PFMFI, S390_FEAT_EDAT },
>>          { S390_FEAT_MSA_EXT_8, S390_FEAT_MSA_EXT_3 },
>> +        { S390_FEAT_MSA_EXT_9, S390_FEAT_MSA_EXT_3 },
>> +        { S390_FEAT_MSA_EXT_9, S390_FEAT_MSA_EXT_4 },
>>          { S390_FEAT_MULTIPLE_EPOCH, S390_FEAT_TOD_CLOCK_STEERING },
>>          { S390_FEAT_VECTOR_PACKED_DECIMAL, S390_FEAT_VECTOR },
>>          { S390_FEAT_VECTOR_ENH, S390_FEAT_VECTOR },
>> diff --git a/target/s390x/gen-features.c b/target/s390x/gen-features.c
>> index e4739a6b9f..a2f9e2b43f 100644
>> --- a/target/s390x/gen-features.c
>> +++ b/target/s390x/gen-features.c
>> @@ -213,6 +213,38 @@
>>      S390_FEAT_KMA_GCM_EAES_192, \
>>      S390_FEAT_KMA_GCM_EAES_256
>>  
>> +#define S390_FEAT_GROUP_MSA_EXT_9 \
>> +    S390_FEAT_MSA_EXT_9, \
>> +    S390_FEAT_ECDSA_VERIFY_P256, \
>> +    S390_FEAT_ECDSA_VERIFY_P384, \
>> +    S390_FEAT_ECDSA_VERIFY_P512, \
>> +    S390_FEAT_ECDSA_SIGN_P256, \
>> +    S390_FEAT_ECDSA_SIGN_P384, \
>> +    S390_FEAT_ECDSA_SIGN_P512, \
>> +    S390_FEAT_EECDSA_SIGN_P256, \
>> +    S390_FEAT_EECDSA_SIGN_P384, \
>> +    S390_FEAT_EECDSA_SIGN_P512, \
>> +    S390_FEAT_EDDSA_VERIFY_ED25519, \
>> +    S390_FEAT_EDDSA_VERIFY_ED448, \
>> +    S390_FEAT_EDDSA_SIGN_ED25519, \
>> +    S390_FEAT_EDDSA_SIGN_ED448, \
>> +    S390_FEAT_EEDDSA_SIGN_ED25519, \
>> +    S390_FEAT_EEDDSA_SIGN_ED448, \
>> +    S390_FEAT_PCC_SCALAR_MULT_P256, \
>> +    S390_FEAT_PCC_SCALAR_MULT_P384, \
>> +    S390_FEAT_PCC_SCALAR_MULT_P512, \
>> +    S390_FEAT_PCC_SCALAR_MULT_ED25519, \
>> +    S390_FEAT_PCC_SCALAR_MULT_ED448, \
>> +    S390_FEAT_PCC_SCALAR_MULT_X25519, \
>> +    S390_FEAT_PCC_SCALAR_MULT_X448
>> +
>> +#define S390_FEAT_GROUP_MSA_EXT_9_PCKMO \
>> +    S390_FEAT_PCKMO_ECC_P256, \
>> +    S390_FEAT_PCKMO_ECC_P384, \
>> +    S390_FEAT_PCKMO_ECC_P521, \
>> +    S390_FEAT_PCKMO_ECC_ED25519, \
>> +    S390_FEAT_PCKMO_ECC_ED448
>> +
> 
> Just wondering, why keep the PCKMO ones separate, but not e.g. PCC ?

Because those can be disabled at the HMC. It is painful to disable 5 elements
for LPARs that are configured that way. So I created a group for those. That
will allow to disable the full group.
(we have the same issue with the  exisiting AES and DEA pckmo functions).
 
> Many subfunctions, luckily we have feature groups.
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>
> 


