Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AD5A2C0DFE
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 15:44:09 +0100 (CET)
Received: from localhost ([::1]:56000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khD4a-0007Su-9i
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 09:44:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1khCpk-0006bN-VG
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:28:51 -0500
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:42769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1khCpb-0004LM-6l
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 09:28:45 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.210])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id 0B4D9749F8CF;
 Mon, 23 Nov 2020 15:28:34 +0100 (CET)
Received: from kaod.org (37.59.142.98) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 23 Nov
 2020 15:28:31 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-98R002519b7b54-00d3-447d-bc98-e375a696550b,
 7563B3C8582C4E5C569F12427BEE2CF3FAD9DE82) smtp.auth=groug@kaod.org
Date: Mon, 23 Nov 2020 15:28:27 +0100
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: virtio-9p-test.c:300:v9fs_req_recv: assertion failed (hdr.id ==
 id): (7 == 73)
Message-ID: <20201123152827.0590d6de@bahia.lan>
In-Reply-To: <7836238.thhSn8XZEd@silver>
References: <fad8a69d-9c21-ac25-028d-646a64ccecc5@redhat.com>
 <20201123141734.0c03f21a@bahia.lan> <7836238.thhSn8XZEd@silver>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.98]
X-ClientProxiedBy: DAG2EX2.mxp5.local (172.16.2.12) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: aedfa593-4b82-4d25-a490-47789e0d483e
X-Ovh-Tracer-Id: 14344527765333252573
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrudegiedgieejucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefuddtieejjeevheekieeltefgleetkeetheettdeifeffvefhffelffdtfeeljeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleeknecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopegtrhhosghinhhsohesrhgvughhrghtrdgtohhm
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
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
Cc: qemu-devel@nongnu.org, Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 23 Nov 2020 14:48:15 +0100
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Montag, 23. November 2020 14:17:34 CET Greg Kurz wrote:

[...]

> 
> Yeah, looks like the mkdir() call which is supposed to create the 9p test 
> directory, is failing there for some reason. The question is how to find that 
> out (effectively) without having access to an affected system.
> 

I'd say through a bug report that provide enough details on the
host system.

> It's now too late for 5.2, but I think for 6.0 it would make sense introducing 
> a dedicated 9p option loglevel=..., so we can tell people to enable this to 
> capture the precise source location where an error ocurred. That would mean 
> spreading a huge bunch of macros all over the 9p code base, but it would 
> definitely help a lot understanding the root cause of reported issues in an 
> efficient way.
> 

Maybe but in any case we still should fix this somehow for 5.2.
The "local" tests are certainly valuable but we can't let them
break automated CI or build systems.

Since this is basically triggered by a 'make check' we can
workaround the issue by marking the "local" tests as "slow".

I'll send a patch ASAP.

> Best regards,
> Christian Schoenebeck
> 
> 


