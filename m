Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B80E649E53F
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Jan 2022 15:54:42 +0100 (CET)
Received: from localhost ([::1]:44920 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nD6Ab-0003ob-SZ
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 09:54:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nD5xc-0006Q1-Gh; Thu, 27 Jan 2022 09:41:16 -0500
Received: from [2001:41c9:1:41f::167] (port=36048
 helo=mail.default.ilande.bv.iomart.io)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nD5xS-0006As-E1; Thu, 27 Jan 2022 09:41:16 -0500
Received: from [2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe]
 by mail.default.ilande.bv.iomart.io with esmtpsa
 (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.92)
 (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nD5ws-0008QL-Fg; Thu, 27 Jan 2022 14:40:34 +0000
Message-ID: <d592e76d-cb1f-7594-39ae-895fb4811242@ilande.co.uk>
Date: Thu, 27 Jan 2022 14:40:53 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Content-Language: en-US
To: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org
References: <20220126164200.1048677-1-farosas@linux.ibm.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220126164200.1048677-1-farosas@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba0:ca00:d4eb:dbd5:5a41:aefe
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH 0/8] target/ppc: powerpc_excp improvements [74xx] (5/n)
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.default.ilande.bv.iomart.io)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2001:41c9:1:41f::167
 (failed)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk;
 helo=mail.default.ilande.bv.iomart.io
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-ppc@nongnu.org, clg@kaod.org,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 26/01/2022 16:41, Fabiano Rosas wrote:

> This handles the exception code for the 74xx family, i.e. 7400, 7410,
> 7440, 7445, 7450, 7455, 7457.
> 
> This is another family that is quite well known, so it should be
> straight-forward as well.
> 
> Based on legoater/ppc-7.0
> 
> Fabiano Rosas (8):
>    target/ppc: Introduce powerpc_excp_74xx
>    target/ppc: Simplify powerpc_excp_74xx
>    target/ppc: 74xx: Machine Check exception cleanup
>    target/ppc: 74xx: External interrupt cleanup
>    target/ppc: 74xx: Program exception cleanup
>    target/ppc: 74xx: System Call exception cleanup
>    target/ppc: 74xx: System Reset interrupt cleanup
>    target/ppc: 74xx: Set SRRs directly in exception code
> 
>   target/ppc/excp_helper.c | 175 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 175 insertions(+)

I'm not overly familiar with PPC exception handling detail, so I can't offer much in 
the way of review I'm afraid. I could do a quick test and make sure nothing breaks 
with my MacOS images though?

Also any thoughts on Christophe's question re: e300 PVRs at 
https://lists.gnu.org/archive/html/qemu-ppc/2022-01/msg00592.html? I can handle 
merging the OpenBIOS changes if someone can come up with a suitable fix.


ATB,

Mark.

