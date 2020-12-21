Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 993B82DFBD6
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Dec 2020 13:29:13 +0100 (CET)
Received: from localhost ([::1]:35604 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krKJM-0006zU-CM
	for lists+qemu-devel@lfdr.de; Mon, 21 Dec 2020 07:29:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41304)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1krKHv-00060H-Gy
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 07:27:43 -0500
Received: from 9.mo51.mail-out.ovh.net ([46.105.48.137]:54591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1krKHr-0001BH-Da
 for qemu-devel@nongnu.org; Mon, 21 Dec 2020 07:27:43 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.143.128])
 by mo51.mail-out.ovh.net (Postfix) with ESMTPS id 13C4C246905;
 Mon, 21 Dec 2020 13:27:35 +0100 (CET)
Received: from kaod.org (37.59.142.100) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 21 Dec
 2020 13:27:35 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-100R003d622ae1a-13f8-4068-bf50-cc4b02c6614b,
 0B619508FA83EFFE02DCDB9DB2C04BF8DACB1B13) smtp.auth=groug@kaod.org
X-OVh-ClientIp: 82.253.208.248
Date: Mon, 21 Dec 2020 13:27:34 +0100
From: Greg Kurz <groug@kaod.org>
To: Alexey Kardashevskiy <aik@ozlabs.ru>
Subject: Re: [PATCH qemu v12] spapr: Implement Open Firmware client interface
Message-ID: <20201221132734.084df0e8@bahia.lan>
In-Reply-To: <f6d39e3e-e4e8-4397-b83a-9e51fd54c0d4@ozlabs.ru>
References: <20201218025040.98132-1-aik@ozlabs.ru>
 <20201218150413.44da862d@bahia.lan>
 <f6d39e3e-e4e8-4397-b83a-9e51fd54c0d4@ozlabs.ru>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.100]
X-ClientProxiedBy: DAG1EX2.mxp5.local (172.16.2.2) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: 71ce656d-cf78-4d50-9ba4-831153b6dc73
X-Ovh-Tracer-Id: 10716033838928468448
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrvddtvddggeefucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefuddtieejjeevheekieeltefgleetkeetheettdeifeffvefhffelffdtfeeljeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddruddttdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepghhrohhugheskhgrohgurdhorhhgpdhrtghpthhtohepsggrlhgrthhonhesvghikhdrsghmvgdrhhhu
Received-SPF: pass client-ip=46.105.48.137; envelope-from=groug@kaod.org;
 helo=9.mo51.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 21 Dec 2020 23:06:40 +1100
Alexey Kardashevskiy <aik@ozlabs.ru> wrote:

[...]

> > Thanks for the split. The VOF paths are now clearly identified in
> > the sPAPR code, and well guarded by a check on x-vof. Rest of the
> > patch looks good to me. I gave it a try with a stock fedora 33
> > kernel and initramfs and it booted really fast !
>  >
> > With the checkpatch complaints addressed,
> 
> 
> They all are about the firmware, not QEMU ifself, do we enforce it for 
> such things as firmwares too?
> 

Well, apparently checkpatch does :) 

More seriously, this code is being added to the QEMU source tree, not
like it is some foreign code imported as a git submodule, so I don't see
why regular QEMU coding style guidelines wouldn't apply ?

> 
> > 
> > Acked-by: Greg Kurz <groug@kaod.org>
> > 
> > and
> > 
> > Tested-by: Greg Kurz <groug@kaod.org>
> 
> 
> Thanks! Now I am thinking whether someone may want to use it for 
> something else, like... dunno... ARM? :)
> 
> 

Well, Zoltan seemed to have some interest in using VOF for
presumably other PowerPC based boards IIUC.

Another future work could be to add enough support to be able
to start grub and boot from a virtio device. :)

Cheers,

--
Greg

