Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 758BE3253F5
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 17:49:57 +0100 (CET)
Received: from localhost ([::1]:42912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFJps-0005yi-Fe
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 11:49:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lFJnK-0004hs-N9
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 11:47:19 -0500
Received: from 1.mo52.mail-out.ovh.net ([178.32.96.117]:53572)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1lFJnH-0000x2-FR
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 11:47:18 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.163])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id 70C2F24526A;
 Thu, 25 Feb 2021 17:47:03 +0100 (CET)
Received: from kaod.org (37.59.142.99) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Thu, 25 Feb
 2021 17:47:02 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-99G003258f0f3b-ba78-4ec3-8f0c-6959de09b248,
 626514EADA2E0701D0BACADA871C63A3A4664F47) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Thu, 25 Feb 2021 17:47:01 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: 9pfs developers docs
Message-ID: <20210225174701.193cf694@bahia.lan>
In-Reply-To: <1713522.Q2EPVctnWf@silver>
References: <3475760.T70ipHyFzN@silver> <20210201132649.6db25cec@bahia.lan>
 <18968671.BsRifgzQ0d@silver> <1713522.Q2EPVctnWf@silver>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.99]
X-ClientProxiedBy: DAG8EX1.mxp5.local (172.16.2.71) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: c559f106-bff6-451b-a59a-bb09d3c35eae
X-Ovh-Tracer-Id: 15314209059561576858
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrkeelgdelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehgeegvddvtefhtddtvdfhiedutedvgfejtddutefgveehieejieelveffgeekheenucffohhmrghinhepqhgvmhhurdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdelleenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=178.32.96.117; envelope-from=groug@kaod.org;
 helo=1.mo52.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 25 Feb 2021 17:31:22 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Montag, 1. Februar 2021 14:37:02 CET qemu_oss--- via wrote:
> > On Montag, 1. Februar 2021 13:26:49 CET Greg Kurz wrote:
> > > > > I agree that a bunch of other things should be documented, but that's
> > > > > definitely a great start. Thanks for doing this !
> > > > > 
> > > > > Just one remark on the topology diagram:
> > > > > 
> > > > > https://wiki.qemu.org/File:9pfs_topology.png
> > > > > 
> > > > > It gives the impression that the 9p transport and server can
> > > > > handle multiple guests, which they certainly don't : each
> > > > > 9p server lives in exactly one device which is exposed to
> > > > > exactly one guest.
> > > > 
> > > > Right, I haven't considered that the diagram might be interpreted that
> > > > way. My primary intention was to show the 3 main components of 9pfs from
> > > > design perspective and secondary showing that multiple guests can share
> > > > storage.
> > > > 
> > > > So what would be better: a) duplicating the server side in the diagram
> > > > (then the image might become a bit large in height), b) dropping the
> > > > multiple guests, c) making the issue with server instances clear in the
> > > > text?
> > > 
> > > I'd rather go for b)
> > 
> > Updated the diagram on the wiki page.
> > 
> > To keep noise low, I won't send emails on further changes to that wiki page.
> > If you want to be auto notified then just add yourself to the watch list
> > there.
> 
> Ok, I think I'm done with this page:
> https://wiki.qemu.org/Documentation/9p
> 
> At least I think I've described everything I wanted to from my side regarding 
> current 9p status.
> 

Great thanks for doing this ! I'll have a look ASAP.

Cheers,

--
Greg


> Best regards,
> Christian Schoenebeck
> 
> 


