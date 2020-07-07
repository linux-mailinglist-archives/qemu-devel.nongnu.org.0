Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 221F5216E6F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jul 2020 16:13:00 +0200 (CEST)
Received: from localhost ([::1]:58420 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jsoLC-0006BG-R5
	for lists+qemu-devel@lfdr.de; Tue, 07 Jul 2020 10:12:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1jsoKQ-0005eI-1z
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 10:12:10 -0400
Received: from 2.mo69.mail-out.ovh.net ([178.33.251.80]:58043)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1jsoKO-0001SJ-5W
 for qemu-devel@nongnu.org; Tue, 07 Jul 2020 10:12:09 -0400
Received: from player158.ha.ovh.net (unknown [10.108.57.150])
 by mo69.mail-out.ovh.net (Postfix) with ESMTP id 383E597788
 for <qemu-devel@nongnu.org>; Tue,  7 Jul 2020 16:12:05 +0200 (CEST)
Received: from kaod.org (lns-bzn-46-82-253-208-248.adsl.proxad.net
 [82.253.208.248]) (Authenticated sender: groug@kaod.org)
 by player158.ha.ovh.net (Postfix) with ESMTPSA id 27E4B141C815C;
 Tue,  7 Jul 2020 14:11:56 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass
 (GARM-101G0044176ef94-cf42-4391-bc74-b0248db10dca,E152094F47616500A3A802F2EB970733BF761B34)
 smtp.auth=groug@kaod.org
Date: Tue, 7 Jul 2020 16:11:55 +0200
From: Greg Kurz <groug@kaod.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: hw/intc/xics.c:605: ics_realize: Assertion `ics->xics' failed
Message-ID: <20200707161155.16dff2ea@bahia.lan>
In-Reply-To: <104a1848-4686-0b6f-fb0c-e09e2ffbd031@redhat.com>
References: <104a1848-4686-0b6f-fb0c-e09e2ffbd031@redhat.com>
X-Mailer: Claws Mail 3.17.5 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 9418152721371863346
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduiedrudehgdeikecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgsehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehkefhtdehgeehheejledufeekhfdvleefvdeihefhkefhudffhfeuuedvffdthfenucfkpheptddrtddrtddrtddpkedvrddvheefrddvtdekrddvgeeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrudehkedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=178.33.251.80; envelope-from=groug@kaod.org;
 helo=2.mo69.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/07 10:12:05
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: David Gibson <david@gibson.dropbear.id.au>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?B?Q8OpZHJpYw==?= Le Goater <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 7 Jul 2020 13:01:54 +0200
Thomas Huth <thuth@redhat.com> wrote:

> 
>  Hi Greg,
> 
> I just ran  scripts/device-crash-test and it triggered the assert that
> you've added in commit b015a9809427c8 ("xics: Link ICS_PROP_XICS
> property to ICSState::xics pointer"):
> 
> $ qemu-system-ppc64 -S -M powernv9,accel=tcg -device pnv-psi-POWER8
> qemu-system-ppc64: hw/intc/xics.c:605: ics_realize: Assertion
> `ics->xics' failed.
> Aborted (core dumped)
> 
> That's ugly. Could you please have a look how this could be done in a
> nicer way? (Maybe set errp and return in that case?)
> 
>  Thanks,
>   Thomas
> 

Hi Thomas,

I'll look at that right away. Thanks for the report.

Cheers,

--
Greg

