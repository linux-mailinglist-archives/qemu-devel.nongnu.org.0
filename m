Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C06622013A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 May 2019 10:26:26 +0200 (CEST)
Received: from localhost ([127.0.0.1]:50557 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRBib-0002ju-Iu
	for lists+qemu-devel@lfdr.de; Thu, 16 May 2019 04:26:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59734)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hRBhI-0002G1-4K
	for qemu-devel@nongnu.org; Thu, 16 May 2019 04:25:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1hRBeu-0008Uc-9G
	for qemu-devel@nongnu.org; Thu, 16 May 2019 04:22:37 -0400
Received: from 7.mo179.mail-out.ovh.net ([46.105.61.94]:38812)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1hRBeu-0008TS-1q
	for qemu-devel@nongnu.org; Thu, 16 May 2019 04:22:36 -0400
Received: from player688.ha.ovh.net (unknown [10.109.143.223])
	by mo179.mail-out.ovh.net (Postfix) with ESMTP id C20E512925D
	for <qemu-devel@nongnu.org>; Thu, 16 May 2019 10:22:32 +0200 (CEST)
Received: from kaod.org (lfbn-1-10649-41.w90-89.abo.wanadoo.fr [90.89.235.41])
	(Authenticated sender: clg@kaod.org)
	by player688.ha.ovh.net (Postfix) with ESMTPSA id 164545BB8434;
	Thu, 16 May 2019 08:22:26 +0000 (UTC)
To: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>,
	Greg Kurz <groug@kaod.org>
References: <155799221739.527449.14907564571096243745.stgit@bahia.lan>
	<20190516074551.GB25414@sathnaga86>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <3d7a99b9-5f31-e18d-5cd8-a20c4361efc2@kaod.org>
Date: Thu, 16 May 2019 10:22:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190516074551.GB25414@sathnaga86>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 2145965224295369555
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduuddruddttddgtddvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddm
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 46.105.61.94
Subject: Re: [Qemu-devel] [PATCH] spapr: Print out extra hints when CAS
 negotiation of interrupt mode fails
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/16/19 9:45 AM, Satheesh Rajendran wrote:
> On Thu, May 16, 2019 at 09:36:57AM +0200, Greg Kurz wrote:
>> Let's suggest to the user how the machine should be configured to allow
>> the guest to boot successfully.
>>
>> Suggested-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>
>> Signed-off-by: Greg Kurz <groug@kaod.org>
>> ---
>>  hw/ppc/spapr_hcall.c |    4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> Reviewed-and-Tested-by: Satheesh Rajendran <sathnaga@linux.vnet.ibm.com>

you should use two different tags. I don't think patchwork understand
compounds.

C. 

> 2019-05-16T07:42:43.018771Z qemu-system-ppc64: Guest requested unavailable interrupt mode (XICS), either don't set the ic-mode machine property or try ic-mode=xics or ic-mode=dual
> 2019-05-16 07:42:43.394+0000: shutting down, reason=crashed
> 
>>
>> diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
>> index 63a55614b83d..aae9fd2b3e6d 100644
>> --- a/hw/ppc/spapr_hcall.c
>> +++ b/hw/ppc/spapr_hcall.c
>> @@ -1646,12 +1646,12 @@ static target_ulong h_client_architecture_support(PowerPCCPU *cpu,
>>       */
>>      if (guest_xive) {
>>          if (spapr->irq->ov5 == SPAPR_OV5_XIVE_LEGACY) {
>> -            error_report("Guest requested unavailable interrupt mode (XIVE)");
>> +            error_report("Guest requested unavailable interrupt mode (XIVE), try the ic-mode=xive or ic-mode=dual machine property");
>>              exit(EXIT_FAILURE);
>>          }
>>      } else {
>>          if (spapr->irq->ov5 == SPAPR_OV5_XIVE_EXPLOIT) {
>> -            error_report("Guest requested unavailable interrupt mode (XICS)");
>> +            error_report("Guest requested unavailable interrupt mode (XICS), either don't set the ic-mode machine property or try ic-mode=xics or ic-mode=dual");
>>              exit(EXIT_FAILURE);
>>          }
>>      }
>>
> 


