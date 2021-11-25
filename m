Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 573AD45DA61
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 13:50:07 +0100 (CET)
Received: from localhost ([::1]:60084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mqECT-0001KQ-Ur
	for lists+qemu-devel@lfdr.de; Thu, 25 Nov 2021 07:50:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mqE7u-0005uG-G3
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 07:45:22 -0500
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:26918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dovmurik@linux.ibm.com>)
 id 1mqE7m-0003cZ-2c
 for qemu-devel@nongnu.org; Thu, 25 Nov 2021 07:45:22 -0500
Received: from pps.filterd (m0098393.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1APBHxqQ021701
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 12:45:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=eFiosOikSuQYlOFrM/HcRmPHGUBAilZRslUJWKUNO3c=;
 b=qKzSgC8Gkha8yQpLodap7LtJEOz1irNWqIS4VqxypSZGJnm8ByU6vm5c/qerQg63yCxc
 B8CPrjA6KDZy8guBVUni+iKkCt7KSZB4+c0CZ0fqf37lf70Khg0ISmp6cHSq31+OzfkW
 lC3sTONICY+x2t5Sdy41/4UNCqmiNnvf9oDYuydO8aems7FXsz1WGc0xMx3dgfQq8dDH
 DObhwLrIuCqcih4z4sGy2DOgkQeka1f5bbn5P4b6LwG4xYxbghGmWhTWZCoDuN4d8kyC
 96RqX7ZM+yOAi5sRqG4kTL3wAUDZpAlUQfYzNDYDF6KUNEtPxFNJrhBl0wVRPNWp0dYi HA== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cj9g01nb5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 12:45:03 +0000
Received: from m0098393.ppops.net (m0098393.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.43/8.16.0.43) with SMTP id 1APCUuXB024205
 for <qemu-devel@nongnu.org>; Thu, 25 Nov 2021 12:45:03 GMT
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com
 [169.63.121.186])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cj9g01nab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Nov 2021 12:45:02 +0000
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
 by ppma03wdc.us.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1APCbLID005360;
 Thu, 25 Nov 2021 12:45:01 GMT
Received: from b01cxnp22035.gho.pok.ibm.com (b01cxnp22035.gho.pok.ibm.com
 [9.57.198.25]) by ppma03wdc.us.ibm.com with ESMTP id 3cernbwhfn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 25 Nov 2021 12:45:01 +0000
Received: from b01ledav001.gho.pok.ibm.com (b01ledav001.gho.pok.ibm.com
 [9.57.199.106])
 by b01cxnp22035.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1APCiwjF54722870
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 25 Nov 2021 12:44:58 GMT
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id ACDC728066;
 Thu, 25 Nov 2021 12:44:58 +0000 (GMT)
Received: from b01ledav001.gho.pok.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CE7EF28058;
 Thu, 25 Nov 2021 12:44:53 +0000 (GMT)
Received: from [9.65.80.116] (unknown [9.65.80.116])
 by b01ledav001.gho.pok.ibm.com (Postfix) with ESMTP;
 Thu, 25 Nov 2021 12:44:53 +0000 (GMT)
Message-ID: <53dc2a76-a6bb-dc8d-1a47-faf7577e59e8@linux.ibm.com>
Date: Thu, 25 Nov 2021 14:44:51 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.2
Subject: Re: SEV guest attestation
Content-Language: en-US
To: Sergio Lopez <slp@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tyler Fanelli <tfanelli@redhat.com>
References: <YZ58+T04uVXaO2Ab@redhat.com> <YZ6Ec0yG82nhbN+B@work-vm>
 <20211125071428.dpnavgxd3w4bzktr@mhamilton>
From: Dov Murik <dovmurik@linux.ibm.com>
In-Reply-To: <20211125071428.dpnavgxd3w4bzktr@mhamilton>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 159v_gXeZTJrJNU2flHICdvY_kQLQ_gK
X-Proofpoint-ORIG-GUID: ICmEOmeDUTLzeYO0najfH5PPuxh9B4T3
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-25_05,2021-11-25_01,2020-04-07_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0
 mlxlogscore=999 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0
 adultscore=0 impostorscore=0 mlxscore=0 phishscore=0 priorityscore=1501
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2111250070
Received-SPF: pass client-ip=148.163.156.1;
 envelope-from=dovmurik@linux.ibm.com; helo=mx0a-001b2d01.pphosted.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-4.1,
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
Cc: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 afrosi@redhat.com, James Bottomley <jejb@linux.ibm.com>, qemu-devel@nongnu.org,
 Dov Murik <dovmurik@linux.ibm.com>, Hubertus Franke <frankeh@us.ibm.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>, Jim Cadden <jcadden@ibm.com>,
 dinechin@redhat.com, John Ferlan <jferlan@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[+cc jejb, tobin, jim, hubertus]


On 25/11/2021 9:14, Sergio Lopez wrote:
> On Wed, Nov 24, 2021 at 06:29:07PM +0000, Dr. David Alan Gilbert wrote:
>> * Daniel P. Berrangé (berrange@redhat.com) wrote:
>>> On Wed, Nov 24, 2021 at 11:34:16AM -0500, Tyler Fanelli wrote:
>>>> Hi,
>>>>
>>>> We recently discussed a way for remote SEV guest attestation through QEMU.
>>>> My initial approach was to get data needed for attestation through different
>>>> QMP commands (all of which are already available, so no changes required
>>>> there), deriving hashes and certificate data; and collecting all of this
>>>> into a new QMP struct (SevLaunchStart, which would include the VM's policy,
>>>> secret, and GPA) which would need to be upstreamed into QEMU. Once this is
>>>> provided, QEMU would then need to have support for attestation before a VM
>>>> is started. Upon speaking to Dave about this proposal, he mentioned that
>>>> this may not be the best approach, as some situations would render the
>>>> attestation unavailable, such as the instance where a VM is running in a
>>>> cloud, and a guest owner would like to perform attestation via QMP (a likely
>>>> scenario), yet a cloud provider cannot simply let anyone pass arbitrary QMP
>>>> commands, as this could be an issue.
>>>
>>> As a general point, QMP is a low level QEMU implementation detail,
>>> which is generally expected to be consumed exclusively on the host
>>> by a privileged mgmt layer, which will in turn expose its own higher
>>> level APIs to users or other apps. I would not expect to see QMP
>>> exposed to anything outside of the privileged host layer.
>>>
>>> We also use the QAPI protocol for QEMU guest agent commmunication,
>>> however, that is a distinct service from QMP on the host. It shares
>>> most infra with QMP but has a completely diffent command set. On the
>>> host it is not consumed inside QEMU, but instead consumed by a
>>> mgmt app like libvirt. 
>>>
>>>> So I ask, does anyone involved in QEMU's SEV implementation have any input
>>>> on a quality way to perform guest attestation? If so, I'd be interested.
>>>
>>> I think what's missing is some clearer illustrations of how this
>>> feature is expected to be consumed in some real world application
>>> and the use cases we're trying to solve.
>>>
>>> I'd like to understand how it should fit in with common libvirt
>>> applications across the different virtualization management
>>> scenarios - eg virsh (command line),  virt-manger (local desktop
>>> GUI), cockpit (single host web mgmt), OpenStack (cloud mgmt), etc.
>>> And of course any non-traditional virt use cases that might be
>>> relevant such as Kata.
>>
>> That's still not that clear; I know Alice and Sergio have some ideas
>> (cc'd).
>> There's also some standardisation efforts (e.g. https://www.potaroo.net/ietf/html/ids-wg-rats.html 
>> and https://www.ietf.org/archive/id/draft-ietf-rats-architecture-00.html
>> ) - that I can't claim to fully understand.
>> However, there are some themes that are emerging:
>>
>>   a) One use is to only allow a VM to access some private data once we
>> prove it's the VM we expect running in a secure/confidential system
>>   b) (a) normally involves requesting some proof from the VM and then
>> providing it some confidential data/a key if it's OK
>>   c) RATs splits the problem up:
>>     https://www.ietf.org/archive/id/draft-ietf-rats-architecture-00.html#name-architectural-overview
>>     I don't fully understand the split yet, but in principal there are
>> at least a few different things:
>>
>>   d) The comms layer
>>   e) Something that validates the attestation message (i.e. the
>> signatures are valid, the hashes all add up etc)
>>   f) Something that knows what hashes to expect (i.e. oh that's a RHEL
>> 8.4 kernel, or that's a valid kernel command line)
>>   g) Something that holds some secrets that can be handed out if e & f
>> are happy.
>>
>>   There have also been proposals (e.g. Intel HTTPA) for an attestable
>> connection after a VM is running; that's probably quite different from
>> (g) but still involves (e) & (f).
>>
>> In the simpler setups d,e,f,g probably live in one place; but it's not
>> clear where they live - for example one scenario says that your cloud
>> management layer holds some of them, another says you don't trust your
>> cloud management layer and you keep them separate.
>>
>> So I think all we're actually interested in at the moment, is (d) and
>> (e) and the way for (g) to get the secret back to the guest.
>>
>> Unfortunately the comms and the contents of them varies heavily with
>> technology; in some you're talking to the qemu/hypervisor (SEV/SEV-ES)
>> while in some you're talking to the guest after boot (SEV-SNP/TDX maybe
>> SEV-ES in some cases).

SEV-ES has pre-launch measurement and secret injection, just like SEV
(except that the measurement includes the initial states of all vcpus,
that is, their VMSAs.  BTW that means that in order to calculate the
measurement the Attestation Server must know exactly how many vcpus are
in the VM).


>>
>> So my expectation at the moment is libvirt needs to provide a transport
>> layer for the comms, to enable an external validator to retrieve the
>> measurements from the guest/hypervisor and provide data back if
>> necessary.  Once this shakes out a bit, we might want libvirt to be
>> able to invoke the validator; however I expect (f) and (g) to be much
>> more complex things that don't feel like they belong in libvirt.
> 
> We experimented with the attestation flow quite a bit while working on
> SEV-ES support for libkrun-tee. One important aspect we noticed quite
> early, is that there's more data that's needed to be exchange of top
> of the attestation itself.
> 
> For instance, even before you start the VM, the management layer in
> charge of coordinating the confidential VM launch needs to obtain the
> Virtualization TEE capabilities of the Host (SEV-ES vs. SEV-SNP
> vs. TDX) and the platform version, to know which features are
> available and whether that host is a candidate for running the VM at
> all.
> 
> With that information, the mgmt layer can build a guest policy (this
> is SEV's terminology, but I guess we'll have something similar in
> TDX) and feed it to component launching the VMM (libvirt, in this
> case).
> 
> For SEV-SNP, this is pretty much the end of the story, because the
> attestation exchange is driven by an agent inside the guest. Well,
> there's also the need to have in the VM a well-known vNIC bridged to a
> network that's routed to the Attestation Server, that everyone seems
> to consider a given, but to me, from a CSP perspective, looks like
> quite a headache. In fact, I'd go as far as to suggest this
> communication should happen through an alternative channel, such as
> vsock, having a proxy on the Host, but I guess that depends on the CSP
> infrastructure.

If we have an alternative channel (vsock?) and a proxy on the host,
maybe we can share parts of the solution between SEV and SNP.


> 
> For SEV/SEV-ES, as the attestation happens at the VMM level, there's
> still the need to have some interactions with it. As Tyler pointed
> out, we basically need to retrieve the measurement and, if valid,
> inject the secret. If the measurement isn't valid, the VM must be shut
> down immediately.
> 
> In libkrun-tee, this operation is driven by the VMM in libkrun, which
> contacts the Attestation Server with the measurement and receives the
> secret in exchange. I guess for QEMU/libvirt we expect this to be
> driven by the upper management layer through a delegated component in
> the Host, such as NOVA. In this case, NOVA would need to:
> 
>  - Based on the upper management layer info and the Host properties,
>    generate a guest policy and use it while generating the compute
>    instance XML.
> 
>  - Ask libvirt to launch the VM.

Launch the VM with -S (suspended; so it doesn't actually begin running
guest instructions).


> 
>  - Wait for the VM to be in SEV_STATE_LAUNCH_SECRET state *.
> 
>  - Retrieve the measurement *.

Note that libvirt holds the QMP socket to QEMU.  So whoever fetches the
measurement needs either (a) to ask libvirt to it; or (b) to connect to
another QMP listening socket for getting the measurement and injecting
the secret.

In Kata, Jim Cadden (cc'd) worked on adding this second QMP socket (if
I'm not mistaken) to the kata-runtime (which is the process that starts
QEMU and later controls it with QMP).


> 
>  - Contact the Attestation Server and provide it with some kind of
>    information to uniquely identify the VM (needed to determine what's
>    the expected measurement) and the measurement itself.
> 
>    * If the measurement if valid, inject the secret *.
> 
>      + The secret is pre-encrypted with a key that only the PSP has,
>        so there's no need to do any special handling of it.
> 
>  - Ask libvirt to either destroy the VM (if the measurement wasn't
>    valid or there was some kind of communication error with the
>    Attestation Server) or continue the execution of the VM (this will
>    be the first time kvm_vcpu_run() is entered).
> 
> The operations marked with (*) are the ones that I'm not sure if
> NOVA should communicate with libvirt or talk directly to QEMU.
> 
> Sergio.
> 

On top of what's written above, note that with direct boot (with
-kernel/-initrd/-append) the hashes of these 3 elements may be inserted
into the guest measurement (with kernel-hashes=on option on object
sev-guest; upcoming in QEMU 6.2).  This means that the Attestation
Server must know the OVMF hash as well as the hashes of kernel, initrd,
and cmdline in order to construct the expected measurement.


-Dov

