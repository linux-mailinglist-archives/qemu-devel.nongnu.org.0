Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C16B307A47
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 17:06:29 +0100 (CET)
Received: from localhost ([::1]:42414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l59oS-00016m-BF
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 11:06:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52248)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l59lj-0007yL-60
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:03:39 -0500
Received: from 1.mo52.mail-out.ovh.net ([178.32.96.117]:42443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l59lg-0004aH-ML
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 11:03:38 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.236])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 99503239FBA;
 Thu, 28 Jan 2021 17:03:25 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 28 Jan
 2021 17:03:22 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002b2017eba-8a35-4857-84cd-99a48c1a3912,
 12ABEFCAB104A9A3990DEAE01579FEA45C2F0BE3) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 28 Jan 2021 17:03:18 +0100
From: Greg Kurz <groug@kaod.org>
To: Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: Re: [PATCH 0/3] spapr, spapr_numa: fix max-associativity-domains
Message-ID: <20210128170318.1e164823@bahia.lan>
In-Reply-To: <20210128151731.1333664-1-danielhb413@gmail.com>
References: <20210128151731.1333664-1-danielhb413@gmail.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: ec97004b-eabe-4ced-a1b9-49b881273fcc
X-Ovh-Tracer-Id: 16162574641943910819
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfedtgdekudcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgfgihesthejredtredtvdenucfhrhhomhepifhrvghgucfmuhhriicuoehgrhhouhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepfedutdeijeejveehkeeileetgfelteekteehtedtieefffevhffflefftdefleejnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtoheptghlgheskhgrohgurdhorhhg
Received-SPF: pass client-ip=178.32.96.117; envelope-from=groug@kaod.org;
 helo=1.mo52.mail-out.ovh.net
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, RCVD_IN_SBL=0.141,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: clg@kaod.org, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 28 Jan 2021 12:17:28 -0300
Daniel Henrique Barboza <danielhb413@gmail.com> wrote:

> Hi,
> 
> Patches 02 and 03 contain fixes for a problem Cedric found out when
> booting TCG guests with multiple NUMA nodes. See patch 03 commit
> message for more info.
> 

This paragraph mentions "TCG guests", but I see nothing that is
specific to TCG in these patches... so I expect the problem to
also exists with KVM, right ?

> First patch is an unrelated cleanup I did while investigating.
> 
> Daniel Henrique Barboza (3):
>   spapr: move spapr_machine_using_legacy_numa() to spapr_numa.c
>   spapr_numa.c: create spapr_numa_initial_nvgpu_NUMA_id() helper
>   spapr_numa.c: fix ibm,max-associativity-domains calculation
> 
>  hw/ppc/spapr.c              | 21 ++------------------
>  hw/ppc/spapr_numa.c         | 39 ++++++++++++++++++++++++++++++++++++-
>  include/hw/ppc/spapr.h      |  1 -
>  include/hw/ppc/spapr_numa.h |  1 +
>  4 files changed, 41 insertions(+), 21 deletions(-)
> 


