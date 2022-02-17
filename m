Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E164BA76C
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 18:48:37 +0100 (CET)
Received: from localhost ([::1]:46086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKktQ-0002PC-7e
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 12:48:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nKknk-0006GC-8r
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 12:42:44 -0500
Received: from 6.mo552.mail-out.ovh.net ([188.165.49.222]:39185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>) id 1nKknh-0006Sk-E2
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 12:42:43 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.246])
 by mo552.mail-out.ovh.net (Postfix) with ESMTPS id 5B379256EF;
 Thu, 17 Feb 2022 17:42:38 +0000 (UTC)
Received: from kaod.org (37.59.142.101) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Thu, 17 Feb
 2022 18:42:37 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G00413e2dbd0-6c26-4966-895f-44922152f48e,
 6074F5EAC11FD030A47E229993F36105E76D55A4) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <44f1d4ba-b7a7-1dad-0db4-aa5644b718ba@kaod.org>
Date: Thu, 17 Feb 2022 18:42:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] ppc/spapr: Advertise StoreEOI for POWER10 compat guests
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, <qemu-ppc@nongnu.org>,
 <qemu-devel@nongnu.org>
References: <20220214141157.3800212-1-clg@kaod.org>
 <d38d9e08-8988-6aa3-40f6-408b6eb823b0@gmail.com>
 <fb2e56cc-15d1-65ee-9d9c-64223483ed01@kaod.org>
 <0b285039-c797-3746-d4e8-1ae1a5ed731e@gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
In-Reply-To: <0b285039-c797-3746-d4e8-1ae1a5ed731e@gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.101]
X-ClientProxiedBy: DAG6EX1.mxp5.local (172.16.2.51) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: 2043342f-c985-42af-badd-957dcaf74391
X-Ovh-Tracer-Id: 9875831035813858211
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddrjeekgddutddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffvfhfhjggtgfhisehtjeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhephffhleegueektdetffdvffeuieeugfekkeelheelteeftdfgtefffeehueegleehnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepghhrohhugheskhgrohgurdhorhhg
Received-SPF: pass client-ip=188.165.49.222; envelope-from=clg@kaod.org;
 helo=6.mo552.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

>> Unfortunately, this patch breaks migration under TCG because the XIVE
>> source flag is not updated on the target side. KVM is not impacted
>> because the emulated sources are not used. This needs to be addressed
>> in a v2.
>>
>> That said, even without this patch, TCG migration is broken. some CPUs
>> on the receive side are stalled on CPU Hard LOCKUPs. QEMU 6.2 is impacted.
>> So it has been a while :/
> 
> Ouch. Guess we need to add TCG migration tests in the test workflow ...

Regarding the first issue with the new XIVE source flag, this routine
changes an object property after realize which is a no-no for migration :

     void spapr_xive_enable_store_eoi(SpaprXive *xive, bool enable)
     {
         if (enable) {
             xive->source.esb_flags |= XIVE_SRC_STORE_EOI;
         } else {
             xive->source.esb_flags &= ~XIVE_SRC_STORE_EOI;
         }
     }

I think we need a new SpaprXive state to represent the characteristic
of the source indirectly negotiated by CAS when the CPU is a POWER10.
we would use it to update xive->source.esb_flags at post_load time
after migration.

Or simply mimick CAS :

@@ -531,6 +531,14 @@ static int spapr_xive_post_load(SpaprInt
          return kvmppc_xive_post_load(xive, version_id);
      }
  
+    PowerPCCPU *first_ppc_cpu = POWERPC_CPU(first_cpu);
+    bool enable = ppc_check_compat(first_ppc_cpu, CPU_POWERPC_LOGICAL_3_10, 0,
+                                   first_ppc_cpu->compat_pvr);
+    spapr_xive_enable_store_eoi(xive, enable);
+
      return 0;
  }
  
which has the benefit of being stateless.

Ideas ?

Thanks,

C.


