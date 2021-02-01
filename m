Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AC5A30A453
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 10:25:55 +0100 (CET)
Received: from localhost ([::1]:40172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6VT0-00010M-4h
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 04:25:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l6VRu-0000UG-10
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 04:24:46 -0500
Received: from 3.mo52.mail-out.ovh.net ([178.33.254.192]:59801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1l6VRr-0002iq-L3
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 04:24:45 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.146.51])
 by mo52.mail-out.ovh.net (Postfix) with ESMTPS id D1CC0238B42;
 Mon,  1 Feb 2021 10:24:31 +0100 (CET)
Received: from kaod.org (37.59.142.97) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2106.2; Mon, 1 Feb 2021
 10:24:28 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-97G002789abf96-a44b-4764-89ed-04ac3bc7d011,
 A925A526D972EDC30A5527F39256541BB2C63354) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 78.197.208.248
Date: Mon, 1 Feb 2021 10:24:26 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: 9pfs developers docs
Message-ID: <20210201102426.3a3623c7@bahia.lan>
In-Reply-To: <3475760.T70ipHyFzN@silver>
References: <3475760.T70ipHyFzN@silver>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.97]
X-ClientProxiedBy: DAG3EX1.mxp5.local (172.16.2.21) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 84fc91c6-0251-4f09-8026-9eb24089d54d
X-Ovh-Tracer-Id: 14469784128254613914
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduledrfeekgddtfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeehgeegvddvtefhtddtvdfhiedutedvgfejtddutefgveehieejieelveffgeekheenucffohhmrghinhepqhgvmhhurdhorhhgnecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrdeljeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepqhgvmhhuqdguvghvvghlsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=178.33.254.192; envelope-from=groug@kaod.org;
 helo=3.mo52.mail-out.ovh.net
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, RCVD_IN_SBL=0.141, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Sun, 31 Jan 2021 19:23:52 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> Hi,
> 

Hi Christian,

> I started setting up some developer documentation for 9pfs:
> 
> 	https://wiki.qemu.org/Documentation/9p
> 
> Still quite a bunch that should be added (e.g. there should be a section about 
> threads and coroutines), but at least it's a start ...
> 

I agree that a bunch of other things should be documented, but that's
definitely a great start. Thanks for doing this !

Just one remark on the topology diagram:

https://wiki.qemu.org/File:9pfs_topology.png

It gives the impression that the 9p transport and server can
handle multiple guests, which they certainly don't : each
9p server lives in exactly one device which is exposed to
exactly one guest.

Cheers,

--
Greg

> Best regards,
> Christian Schoenebeck
> 
> 
> 
> 


