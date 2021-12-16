Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A7B6476F01
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Dec 2021 11:40:35 +0100 (CET)
Received: from localhost ([::1]:35474 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxoBe-000174-Bv
	for lists+qemu-devel@lfdr.de; Thu, 16 Dec 2021 05:40:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mxo9z-0008Dr-3d
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 05:38:51 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:9416
 helo=mx0a-001b2d01.pphosted.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mxo9v-0007ER-UD
 for qemu-devel@nongnu.org; Thu, 16 Dec 2021 05:38:49 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BG7d9iI024481; 
 Thu, 16 Dec 2021 10:38:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=pp1;
 bh=VW3mZDRMSplyrOQ8gFfrWIP5iHCCxECy36xsmgA9p60=;
 b=CAEYQfdrpm5ig8YuLocXpIKtVJnnOEa3zOGIrexPECSqbIX5Nb8OzkkgwFUILwdod6Of
 hiiqXYUBgqBzbV1UPYiY342X80fptGRLklpDMqVMm/tRr74qXsdjgW7RPoT4+lPBm/z+
 YpQbs3Ak+ATxicQfuTcgiJTR9iQJ46n+5+jd0XafwxoJOUDY5JWTRCFLSkp2D+6DxuHr
 chlVwT/Tcgp9IuMf+skOHE8Fe4nJAoCBz6uBJ2Pe/Rlhw5NP1l13wPgBgPzfXJH87fVc
 EqZKdhi26R7feYwrY5mqCReWXMcqRBVzM4Bwxtts2QJB16af1M2WW0t25BBgiTTBVUQj gw== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cyfv4a6gg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 10:38:41 +0000
Received: from m0098416.ppops.net (m0098416.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1BG9RXpx010606;
 Thu, 16 Dec 2021 10:38:41 GMT
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com
 [169.55.91.170])
 by mx0b-001b2d01.pphosted.com with ESMTP id 3cyfv4a6g5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 10:38:41 +0000
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
 by ppma02wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BGAbehR023830;
 Thu, 16 Dec 2021 10:38:40 GMT
Received: from b03cxnp08025.gho.boulder.ibm.com
 (b03cxnp08025.gho.boulder.ibm.com [9.17.130.17])
 by ppma02wdc.us.ibm.com with ESMTP id 3cy77yfpvb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 16 Dec 2021 10:38:40 +0000
Received: from b03ledav006.gho.boulder.ibm.com
 (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
 by b03cxnp08025.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BGAcc6J23789860
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 10:38:38 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 37078C606C;
 Thu, 16 Dec 2021 10:38:38 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D6EDCC606D;
 Thu, 16 Dec 2021 10:38:35 +0000 (GMT)
Received: from [9.160.32.17] (unknown [9.160.32.17])
 by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
 Thu, 16 Dec 2021 10:38:35 +0000 (GMT)
Message-ID: <336cbad3-06da-f11c-8cd1-ca058dd9c6b0@linux.ibm.com>
Date: Thu, 16 Dec 2021 12:38:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] docs: Add measurement calculation details to
 amd-memory-encryption.txt
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20211214135910.2732101-1-dovmurik@linux.ibm.com>
 <Ybjk6XJUNIyC/LX5@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <Ybjk6XJUNIyC/LX5@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Vp4f9LgM-am2dajXQUm-i63Adsu4A4aD
X-Proofpoint-ORIG-GUID: meLE2OJl9-4UEXV-Kv4udQUEfM-9gB4y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-16_03,2021-12-16_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 suspectscore=0 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015
 priorityscore=1501 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112160059
Received-SPF: pass client-ip=148.163.158.5;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.034,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, James Bottomley <jejb@linux.ibm.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 14/12/2021 20:39, Daniel P. Berrangé wrote:
> On Tue, Dec 14, 2021 at 01:59:10PM +0000, Dov Murik wrote:
>> Add a section explaining how the Guest Owner should calculate the
>> expected guest launch measurement for SEV and SEV-ES.
>>
>> Also update the name and link to the SEV API Spec document.
>>
>> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
>> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
>> ---
>>  docs/amd-memory-encryption.txt | 50 +++++++++++++++++++++++++++++++---
>>  1 file changed, 46 insertions(+), 4 deletions(-)
>>
>> diff --git a/docs/amd-memory-encryption.txt b/docs/amd-memory-encryption.txt
>> index ffca382b5f..f97727482f 100644
>> --- a/docs/amd-memory-encryption.txt
>> +++ b/docs/amd-memory-encryption.txt
>> @@ -43,7 +43,7 @@ The guest policy is passed as plaintext. A hypervisor may choose to read it,
>>  but should not modify it (any modification of the policy bits will result
>>  in bad measurement). The guest policy is a 4-byte data structure containing
>>  several flags that restricts what can be done on a running SEV guest.
>> -See KM Spec section 3 and 6.2 for more details.
>> +See SEV API Spec [1] section 3 and 6.2 for more details.
>>  
>>  The guest policy can be provided via the 'policy' property (see below)
>>  
>> @@ -88,7 +88,7 @@ expects.
>>  LAUNCH_FINISH finalizes the guest launch and destroys the cryptographic
>>  context.
>>  
>> -See SEV KM API Spec [1] 'Launching a guest' usage flow (Appendix A) for the
>> +See SEV API Spec [1] 'Launching a guest' usage flow (Appendix A) for the
>>  complete flow chart.
>>  
>>  To launch a SEV guest
>> @@ -113,6 +113,45 @@ a SEV-ES guest:
>>   - Requires in-kernel irqchip - the burden is placed on the hypervisor to
>>     manage booting APs.
>>  
>> +Calculating expected guest launch measurement
>> +---------------------------------------------
>> +In order to verify the guest launch measurement, The Guest Owner must compute
>> +it in the exact same way as it is calculated by the AMD-SP.  SEV API Spec [1]
>> +section 6.5.1 describes the AMD-SP operations:
>> +
>> +    GCTX.LD is finalized, producing the hash digest of all plaintext data
>> +    imported into the guest.
>> +
>> +    The launch measurement is calculated as:
>> +
>> +    HMAC(0x04 || API_MAJOR || API_MINOR || BUILD || GCTX.POLICY || GCTX.LD || MNONCE; GCTX.TIK)
>> +
>> +    where "||" represents concatenation.
>> +
>> +The values of API_MAJOR, API_MINOR, BUILD, and GCTX.POLICY can be obtained
>> +from the 'query-sev' qmp command.
>> +
>> +The value of MNONCE is part of the response of 'query-sev-launch-measure': it
>> +is the last 16 bytes of the base64-decoded data field (see SEV API Spec [1]
>> +section 6.5.2 Table 52: LAUNCH_MEASURE Measurement Buffer).
>> +
>> +The value of GCTX.LD is SHA256(firmware_blob || kernel_hashes_blob || vmsas_blob),
>> +where:
>> +
>> +* firmware_blob is the content of the entire firmware flash file (for example,
>> +  OVMF.fd).
> 
> Lets add a caveat that the firmware flash should be built to be stateless
> ie that it is not secure to attempt to measure a guest where the firmware
> uses an NVRAM store.
> 

* firmware_blob is the content of the entire firmware flash file (for   
  example, OVMF.fd).  Note that you must build a stateless firmware file    
  which doesn't use an NVRAM store, because the NVRAM area is not
  measured, and therefore it is not secure to use a firmware which uses 
  state from an NVRAM store.



>> +* if kernel is used, and kernel-hashes=on, then kernel_hashes_blob is the
>> +  content of PaddedSevHashTable (including the zero padding), which itself
>> +  includes the hashes of kernel, initrd, and cmdline that are passed to the
>> +  guest.  The PaddedSevHashTable struct is defined in target/i386/sev.c .
>> +* if SEV-ES is enabled (policy & 0x4 != 0), vmsas_blob is the concatenation of
>> +  all VMSAs of the guest vcpus.  Each VMSA is 4096 bytes long; its content is
>> +  defined inside Linux kernel code as struct vmcb_save_area, or in AMD APM
>> +  Volume 2 [2] Table B-2: VMCB Layout, State Save Area.
> 
> Is there any practical guidance we can give apps on the way the VMSAs
> can be expected to be initialized ? eg can they assume essentially
> all fields in vmcb_save_area are 0 initialized except for certain
> ones ? Is initialization likely to vary at all across KVM or EDK2
> vesions or something ?

From my own experience, the VMSA of vcpu0 doesn't change; it is basically what QEMU
sets up in x86_cpu_reset() (which is mostly zeros but not all).  I don't know if it
may change in newer QEMU (machine types?) or kvm.  As for vcpu1+, in SEV-ES the
CS:EIP for the APs is taken from a GUIDed table at the end of the OVMF image, and has
actually changed a few months ago when the memory layout changed to support both TDX
and SEV.


Here are the VMSAs for my 2-vcpu SEV-ES VM:


$ hd vmsa/vmsa_cpu0.bin
00000000  00 00 93 00 ff ff 00 00  00 00 00 00 00 00 00 00  |................|
00000010  00 f0 9b 00 ff ff 00 00  00 00 ff ff 00 00 00 00  |................|
00000020  00 00 93 00 ff ff 00 00  00 00 00 00 00 00 00 00  |................|
*
00000060  00 00 00 00 ff ff 00 00  00 00 00 00 00 00 00 00  |................|
00000070  00 00 82 00 ff ff 00 00  00 00 00 00 00 00 00 00  |................|
00000080  00 00 00 00 ff ff 00 00  00 00 00 00 00 00 00 00  |................|
00000090  00 00 8b 00 ff ff 00 00  00 00 00 00 00 00 00 00  |................|
000000a0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
000000d0  00 10 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
000000e0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00000140  00 00 00 00 00 00 00 00  40 00 00 00 00 00 00 00  |........@.......|
00000150  00 00 00 00 00 00 00 00  10 00 00 00 00 00 00 00  |................|
00000160  00 04 00 00 00 00 00 00  f0 0f ff ff 00 00 00 00  |................|
00000170  02 00 00 00 00 00 00 00  f0 ff 00 00 00 00 00 00  |................|
00000180  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00000260  00 00 00 00 00 00 00 00  06 04 07 00 06 04 07 00  |................|
00000270  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00000310  10 0f 83 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
00000320  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
000003e0  00 00 00 00 00 00 00 00  01 00 00 00 00 00 00 00  |................|
000003f0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00001000



$ hd vmsa/vmsa_cpu1.bin
00000000  00 00 93 00 ff ff 00 00  00 00 00 00 00 00 00 00  |................|
00000010  00 f0 9b 00 ff ff 00 00  00 00 80 00 00 00 00 00  |................|
00000020  00 00 93 00 ff ff 00 00  00 00 00 00 00 00 00 00  |................|
*
00000060  00 00 00 00 ff ff 00 00  00 00 00 00 00 00 00 00  |................|
00000070  00 00 82 00 ff ff 00 00  00 00 00 00 00 00 00 00  |................|
00000080  00 00 00 00 ff ff 00 00  00 00 00 00 00 00 00 00  |................|
00000090  00 00 8b 00 ff ff 00 00  00 00 00 00 00 00 00 00  |................|
000000a0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
000000d0  00 10 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
000000e0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00000140  00 00 00 00 00 00 00 00  40 00 00 00 00 00 00 00  |........@.......|
00000150  00 00 00 00 00 00 00 00  10 00 00 00 00 00 00 00  |................|
00000160  00 04 00 00 00 00 00 00  f0 0f ff ff 00 00 00 00  |................|
00000170  02 00 00 00 00 00 00 00  00 b0 00 00 00 00 00 00  |................|
00000180  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00000260  00 00 00 00 00 00 00 00  06 04 07 00 06 04 07 00  |................|
00000270  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00000310  10 0f 83 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
00000320  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
000003e0  00 00 00 00 00 00 00 00  01 00 00 00 00 00 00 00  |................|
000003f0  00 00 00 00 00 00 00 00  00 00 00 00 00 00 00 00  |................|
*
00001000





-Dov

