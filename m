Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 409854A491F
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 15:14:45 +0100 (CET)
Received: from localhost ([::1]:41648 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEXS8-0003RJ-BS
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 09:14:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nEWtf-00040y-7a
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 08:39:07 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:62758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1nEWtc-0003Yb-R9
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 08:39:06 -0500
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 20VDcJ5H002764; 
 Mon, 31 Jan 2022 13:38:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=o4DVdlXJ3qSTd43kMb8td+MmYJyhjfz6LTi5G0hYQMY=;
 b=VIKGiRk2MjpnnLm99tDiGWTjSYIWr4nvKTnS3g0N2g9pvKCwcXigys1CG/SjnDJjAEj+
 +gSNxrua1xXKjWMEbp4zurIFvahoEcPaxuMHakQ0xUIsLCWV75d++L/y7pkNNHFWG2vQ
 sSUtrwAnk6+5EFa0iboX+iHmwNA5jVojKCuFBmPHg6H0cUasFCvTqgaP5qVwyWvONiUe
 d+fesb6cqtKH7NxRWis0AAv3+6/+SXCc2kXU+OnnsAFEbduvqMzn9y0J2Xsjo3c3nXjt
 eizWPMRKPbTLtThPHHjKB2GChT/HQs/dWV7NQ2acsY7uqu8n0xB7PVKEnKuTQmUFUcHc sQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dx33wwcj4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 13:38:58 +0000
Received: from m0098409.ppops.net (m0098409.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 20VDcwMO004032;
 Mon, 31 Jan 2022 13:38:58 GMT
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com
 [169.62.189.10])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3dx33wwchx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 13:38:58 +0000
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
 by ppma02dal.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 20VDWNM5018799;
 Mon, 31 Jan 2022 13:38:57 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com
 [9.57.198.29]) by ppma02dal.us.ibm.com with ESMTP id 3dvw79t6nh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 31 Jan 2022 13:38:57 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 20VDcrNQ24641812
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 31 Jan 2022 13:38:53 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0733228066;
 Mon, 31 Jan 2022 13:38:53 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2603D28058;
 Mon, 31 Jan 2022 13:38:49 +0000 (GMT)
Received: from [9.65.240.79] (unknown [9.65.240.79])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Mon, 31 Jan 2022 13:38:48 +0000 (GMT)
Message-ID: <5f08d6d3-0279-50ed-5223-a9f3217e555d@linux.ibm.com>
Date: Mon, 31 Jan 2022 15:38:47 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH] qapi, i386/sev: Add debug-launch-digest to launch-measure
 response
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220131111539.3091765-1-dovmurik@linux.ibm.com>
 <YffLgx48+mM2SiIX@redhat.com>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <YffLgx48+mM2SiIX@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Tx9OS-qm0JkDZf9rQoyDyrzjjoGfuSkh
X-Proofpoint-ORIG-GUID: O2mK5giHfkPMjAU4HOrI_tRBEHGIMvZJ
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.816,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2022-01-31_05,2022-01-31_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0
 adultscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0 phishscore=0
 suspectscore=0 mlxscore=0 spamscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2201110000 definitions=main-2201310090
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 Markus Armbruster <armbru@redhat.com>, Dov Murik <dovmurik@linux.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 31/01/2022 13:44, Daniel P. Berrangé wrote:
> On Mon, Jan 31, 2022 at 11:15:39AM +0000, Dov Murik wrote:
>> Currently the responses of QMP commands query-sev-launch-measure and
>> query-sev-attestation-report return just the signed measurement. In
>> order to validate it, the Guest Owner must know the exact guest launch
>> digest, besides other host and guest properties which are included in
>> the measurement.
>>
>> The other host and guest details (SEV API major, SEV API minor, SEV
>> build, and guest policy) are all available via query-sev QMP command.
>> However, the launch digest is not available.  This makes checking the
>> measurement harder for the Guest Owner, as it has to iterate through all
>> allowed launch digests and compute the expected measurement.
> 
> So more specifically to validate the measurement, the guest owner is
> currently calculating:
> 
>    expected_measurement = HMAC(0x04 || API_MAJOR || API_MINOR || BUILD ||
>                                GCTX.POLICY || GCTX.LD || MNONCE; GCTX.TIK)
> 
> where GCTX.LD is
> 
>     SHA256(FIRMWARE-CODE || KERNEL-HASHES-TABLE || VMSA-FOREACH-VCPU)
> 
> and comparing expected_measurement to the actual measurement from
> query-sev-launch-measure.
> 
>> Add a new field debug-launch-digest to the response of
>> query-sev-launch-measure and query-sev-attestation-report which includes
>> the guest launch digest, which is the SHA256 of all initial memory added
>> to the guest via sev_launch_update_data().
> 
> So this new 'debug-launch-digest' field is returning GCTX.LD value
> above.
> 

Yes. Maybe rename it to gctx-ld ?

hmmm, except at the moment it doesn't include the VMSAs, because I don't
know an easy way to do it within QEMU :-( .  So the content of
debug-launch-digest is currently incorrect for SEV-ES guests.



>> Note that the value of debug-launch-digest should not be used for
>> verifying the measurement, because it is not signed.  Hence the choice
>> of the 'debug-' prefix for the field's name.
> 
> The earlier paragraph talks about making it easier for the guest
> owner to verify the measurement, but here is saying this new field
> should not be used to verify the measurement.
> 
> So I'm confused as to what is the benefit of returning this info ?
> 
> Due to the lack of guarantees about this data, it can't be used
> for a real production use case. AFAIK it can only be useful if
> debugging your code logic used for validating measurwements.
> Am I missing something about the motivation here ?
> 
> 
> If the guest owner is comparing expected and actual measurements
> and they get a mis-match, all they'll see is two big hex strings
> representing the HMAC value, and they'll have to work backwards
> to figure out whether one of their expected inputs had a mistake,
> or their algorithm was buggy.
> 
> If the guest owner is comparing the expectd and actual launch
> digest and they get a mis-match, again they'll just huave two
> big hex strings representing the SHA256 value, and they'll have
> to work backwards to figure out whether one of their expected
> inputs had a mistake, or their algorithm was buggy.
> 
> By having this 'debug-launch-digest' field, you can slightly
> more quickly determine whether your mistake lies in your impl
> of the HMAC alg, or API_MAJOR || API_MINOR || BUILD || GCTX.POLICY
> values, vs a mistake in your calc of the debug-launch-digest
> field. Basically it gives you one step in bisecting the mistake
> location.
> 

The scenario we are encountering is that there's not one allowed
assignment to the parameters, but rather a more relaxed policy along the
lines of:

API_MAJOR.API_MINOR should be >= 12.34
BUILD should be >= 66
GCTX.POLICY should be 0x0 or 0x2
GCTX.LD can be one of these allowed OVMFs: {hash-a, hash-b, hash-c}


Having the values of API*, BUILD, POLICY from query-sev is very
comfortable for verifying they are in the allowed ranges.  But since the
Guest Owner doesn't have GCTX.LD, they have to compute the measurement
for each of the allowed OVMF images.  Once the values are known and
"allowed", then the HMAC must be computed to see that the signed
measurement does indeed match.

Note: I guess that adding the hashes of kernel/initrd/cmdline here might
help too (for direct boot with kernel-hashes=on), and maybe the hash of
OVMF itself (on its own).

More generally: within space/network constraints, give the Guest Owner
all the information it needs to compute the launch measurement.  There's
a problem with OVMF there (we don't want to send the whole 4 MB over the
QMP response, but given its hash we can't "extend" it to include the
kernel-hashes struct).



> Is that really compelling enough to justify adding this extra
> info to the QAPI commands ? IME of writing code to verify the SEV
> measurement, there were many little ways I screwed up at first
> and having this field would not have made a significant difference
> to my debugging efforts.

I think that adding the extra field is not that bad, even if it's useful
just for some cases.

I'll be glad to get rid of the launch_memory buffer in my implementation
and replace it with a SHA256-context variable (but found none in QEMU).
 Other than that I don't think the suggested addition is too bad (in
fact, I would add some more info like kernel hashes.).


> 
> What was/would have been useful was having a known good reference
> implementation of the algorithm which dumped out all the key
> values for the different steps of process. I used James Bottomley's
> python script as my reference and hacked it to dump out key values
> so I could see what step I went wrong in. I was still working blind
> for doing the SEV-ES VMSA and kernel hashes table work.

Another point of reference is the session::verify() function in the sev
crate [1], but it doesn't deal with VMSAs and kernel-hashes either.

[1] https://github.com/enarx/sev/blob/main/src/session/mod.rs#L122


-Dov

