Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F532C28CE
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Nov 2020 14:56:37 +0100 (CET)
Received: from localhost ([::1]:42388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khYo8-0003qk-AX
	for lists+qemu-devel@lfdr.de; Tue, 24 Nov 2020 08:56:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1khYmW-0002tI-E2; Tue, 24 Nov 2020 08:54:59 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:46507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1khYmS-0001xC-Jk; Tue, 24 Nov 2020 08:54:56 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.89])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 7D9DF6E8AA74;
 Tue, 24 Nov 2020 14:54:40 +0100 (CET)
Received: from kaod.org (37.59.142.103) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Tue, 24 Nov
 2020 14:54:39 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-103G005205818b3-78b4-4fad-bc43-1160c2f4b812,
 970ACD818314199E15927CBC8014A4D4C9EA8B7B) smtp.auth=clg@kaod.org
Subject: Re: [PATCH for-6.0 2/8] spapr/xive: Introduce spapr_xive_nr_ends()
To: Greg Kurz <groug@kaod.org>
References: <20201120174646.619395-1-groug@kaod.org>
 <20201120174646.619395-3-groug@kaod.org>
 <9da660d2-1969-a548-5092-7f645a610e6d@kaod.org>
 <20201123121635.65506f0c@bahia.lan>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <e7a4b597-300a-6f9b-337e-507703dc4d35@kaod.org>
Date: Tue, 24 Nov 2020 14:54:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201123121635.65506f0c@bahia.lan>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.103]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 88dfc50a-93b1-45b2-95e8-afe205d2adf5
X-Ovh-Tracer-Id: 1197676029480635360
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudegkedgheekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepuffvfhfhkffffgggjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepjeehtdeviefhgfeugfevjeeiveefvedtvdehhfejleduveejieefhfeffeetfeeunecuffhomhgrihhnpehoiihlrggsshdrohhrghenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddtfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/23/20 12:16 PM, Greg Kurz wrote:
> On Mon, 23 Nov 2020 10:46:38 +0100
> Cédric Le Goater <clg@kaod.org> wrote:
> 
>> On 11/20/20 6:46 PM, Greg Kurz wrote:
>>> We're going to kill the "nr_ends" field in a subsequent patch.
>>
>> why ? it is one of the tables of the controller and its part of 
>> the main XIVE concepts. Conceptually, we could let the machine 
>> dimension it with an arbitrary value as OPAL does. The controller
>> would fail when the table is fully used. 
>>
> 
> The idea is that the sPAPR machine only true need is to create a
> controller that can accommodate up to a certain number of vCPU ids.
> It doesn't really to know about the END itself IMHO.> 
> This being said, if we decide to pass both spapr_max_server_number()
> and smp.max_cpus down to the backends as function arguments, we won't
> have to change "nr_ends" at all.

I would prefer that but I am still not sure what they represent. 

Looking at the sPAPR XIVE code, we deal with numbers/ranges in the 
following places today.

 * spapr_xive_dt() 

   It defines a range of interrupt numbers to be used by the guest 
   for the threads/vCPUs IPIs. It's a subset of interrupt numbers 
   in :

		[ SPAPR_IRQ_IPI - SPAPR_IRQ_EPOW [

   These are not vCPU ids.

   Since these interrupt numbers will be considered as free to use
   by the OS, it makes sense to pre-claim them. But claiming an 
   interrupt number in the guest can potentially set up, through 
   the KVM device, a mapping on the host and in HW. See below why
   this can be a problem.

 * kvmppc_xive_cpu_connect()   

   This sizes the NVT tables in OPAL for the guest. This is the  
   max number of vCPUs of the guest (not vCPU ids)

 * spapr_irq_init()

   This is where the IPI interrupt numbers are claimed today. 
   Directly in QEMU and KVM, if the machine is running XIVE only, 
   indirectly if it's dual, first in QEMU and then in KVM when 
   the machine switches of interrupt mode in CAS. 

   The problem is that the underlying XIVE resources in HW are 
   allocated where the QEMU process is running. Which is not the
   best option when the vCPUs are pinned on different chips.

   My patchset was trying to improve that by claiming the IPI on 
   demand when the vCPU is connected to the KVM device. But it 
   was using the vCPU id as the IPI interrupt number which is 
   utterly wrong, the guest OS could use any number in the range 
   exposed in the DT.
   
   The last patch you sent was going in the right direction I think.
   That is to claim the IPI when the guest OS is requesting for it. 

   http://patchwork.ozlabs.org/project/qemu-devel/patch/160528045027.804522.6161091782230763832.stgit@bahia.lan/
   
   But I don't understand why it was so complex. It should be like
   the MSIs claimed by PCI devices.


All this to say, that we need to size better the range in the 
"ibm,xive-lisn-ranges" property if that's broken for vSMT. 

Then, I think the IPIs can be treated just like the PCI MSIs
but they need to be claimed first. That's the ugly part. 

Should we add a special check in h_int_set_source_config to
deal with unclaimed IPIs that are being configured ?


C.

