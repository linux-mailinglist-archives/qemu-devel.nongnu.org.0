Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A51A947F84A
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Dec 2021 17:50:01 +0100 (CET)
Received: from localhost ([::1]:42870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n1Wie-0005PJ-4h
	for lists+qemu-devel@lfdr.de; Sun, 26 Dec 2021 11:50:00 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n1Wh6-0004hq-0S
 for qemu-devel@nongnu.org; Sun, 26 Dec 2021 11:48:24 -0500
Received: from smtpout1.mo529.mail-out.ovh.net ([178.32.125.2]:32815)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1n1Wh4-0000dv-2O
 for qemu-devel@nongnu.org; Sun, 26 Dec 2021 11:48:23 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.4.25])
 by mo529.mail-out.ovh.net (Postfix) with ESMTPS id 6AE13D41420F;
 Sun, 26 Dec 2021 17:48:08 +0100 (CET)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.17; Sun, 26 Dec
 2021 17:48:07 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G004a75f4cfc-06e2-4cdc-a7d3-e501b1b2d587,
 AE5CAB6D971D10CFB765AF31D09B51945E61BB24) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.66.77.115
Message-ID: <1ae8b8d3-6987-9f8d-baca-fc38ea492bad@kaod.org>
Date: Sun, 26 Dec 2021 17:48:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [RFC v2 00/12] target/ppc: powerpc_excp improvements
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, <qemu-devel@nongnu.org>
References: <20211220181903.3456898-1-farosas@linux.ibm.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <20211220181903.3456898-1-farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG3EX2.mxp5.local (172.16.2.22) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e09b9f67-1ceb-4923-9375-9d770bcf91ac
X-Ovh-Tracer-Id: 11297279669126400931
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvuddruddugedgheelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhrtghpthhtohepuggrnhhivghlhhgsgedufeesghhmrghilhdrtghomh
Received-SPF: pass client-ip=178.32.125.2; envelope-from=clg@kaod.org;
 helo=smtpout1.mo529.mail-out.ovh.net
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.063,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello Fabiano,

On 12/20/21 19:18, Fabiano Rosas wrote:
> This changed a lot since v1, basically what remains is the idea that
> we want to have some sort of array of interrupts and some sort of
> separation between processors.
> 
> At the end of this series we'll have:
> 
> - One file with all interrupt implementations (interrupts.c);
> 
> - Separate files for each major group of CPUs (book3s, booke,
>    32bits). Only interrupt code for now, but we could bring pieces of
>    cpu_init into them;
> 
> - Four separate interrupt arrays, one for each of the above groups
>    plus KVM.
> 
> - powerpc_excp calls into the individual files and from there we
>    dispatch according to what is available in the interrupts array.


This is going in the good direction. I think we need more steps for
the reviewers, for tests and bisectability. First 4 patches are OK
and I hope to merge them ASAP.

The powerpc_excp() routine has grown nearly out of control these last
years and it is becoming difficult to maintain. The goal is to clarify
what it is going on for each CPU or each CPU family. The first step
consists basically in duplicating the code and moving the exceptions
handlers in specific routines.

1. cleanups should come first as usual.

2. isolate large chunks, like Nick did with ppc_excp_apply_ail().
    We could do easily the same for :

    2.1 ILE
    2.2 unimplemeted ones doing a cpu abort:
     
          cpu_abort(cs, ".... "  "is not implemented yet !\n");
    2.3 6x TLBS

    This should reduce considerably powerpc_excp() without changing too
    much the execution path.

3. Cleanup the use of excp_model, like in dcbz_common() and kvm.
    This is not critical but some are shortcuts.

4. Introduce a new powerpc_excp() handler :

    static void powerpc_excp(PowerPCCPU *cpu, int excp)
    {
        switch(env->excp_model) {
        case POWERPC_EXCP_FOO1:
        case POWERPC_EXCP_FOO2:
            powerpc_excp_foo(cpu, excp);
	   break;
        case POWERPC_EXCP_BAR:
            powerpc_excp_legacy(cpu, excp);
	   break;
        default:
            g_assert_not_reached();
        }
    }

    and start duplicating code cpu per cpu in specific excp handlers, avoiding
    as much as possible the use of excp_model in the powerpc_excp_*() routines.
    That's for the theory.

    I suppose these can be grouped in the following way :

    * 405 CPU
         POWERPC_EXCP_40x,

    * 6xx CPUs
         POWERPC_EXCP_601,
         POWERPC_EXCP_602,
         POWERPC_EXCP_603,
         POWERPC_EXCP_G2,
         POWERPC_EXCP_604,
	
    * 7xx CPUs
         POWERPC_EXCP_7x0,
         POWERPC_EXCP_7x5,
         POWERPC_EXCP_74xx,
	
    * BOOKE CPUs
         POWERPC_EXCP_BOOKE,

    * BOOKS CPUs
         POWERPC_EXCP_970,            /* could be special */
         POWERPC_EXCP_POWER7,
         POWERPC_EXCP_POWER8,
         POWERPC_EXCP_POWER9,
         POWERPC_EXCP_POWER10,
     
    If not possible, then, we will duplicate more and that's not a problem.

    I would keep the routines in the same excp_helper.c file for now; we
    can move the code in different files but I would do it later and with
    other components in mind and not just the exception models. book3s,
    booke, 7xx, 6xx, 405 are the different groups. It fits what you did.
    
5. Once done, get rid of powerpc_excp_legacy()

6. Start looking at refactoring again.

    There might be a common prologue and epilogue. As a consequence we could
    change the args passed to powerpc_excp_*().

    There could be common handlers and that's why an array of exception
    handlers looks good. this is what you are trying to address after patch 5
    but I would prefer to do the above steps before.

Thanks,

C.

