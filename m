Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D374292782
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 14:40:34 +0200 (CEST)
Received: from localhost ([::1]:48454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUUSn-0002FE-HM
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 08:40:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kUURB-0001iJ-SJ
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 08:38:53 -0400
Received: from smtpout1.mo804.mail-out.ovh.net ([79.137.123.220]:57725)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <groug@kaod.org>) id 1kUURA-0007Hr-0G
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 08:38:53 -0400
Received: from mxplan5.mail.ovh.net (unknown [10.108.16.141])
 by mo804.mail-out.ovh.net (Postfix) with ESMTPS id C351F6D89FA7;
 Mon, 19 Oct 2020 14:38:47 +0200 (CEST)
Received: from kaod.org (37.59.142.95) by DAG8EX1.mxp5.local (172.16.2.71)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2044.4; Mon, 19 Oct
 2020 14:38:47 +0200
Authentication-Results: garm.ovh; auth=pass
 (GARM-95G001d1572e81-3c20-43e4-9c13-6c5fd432c8e4,
 3DC39DA722A1628917AB265CB375B6C80BE9100C) smtp.auth=groug@kaod.org
Date: Mon, 19 Oct 2020 14:38:46 +0200
From: Greg Kurz <groug@kaod.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [PATCH 1/1] 9pfs: suppress performance warnings on qtest runs
Message-ID: <20201019143846.774a56af@bahia.lan>
In-Reply-To: <5026761.SNTRfCqACU@silver>
References: <a2d2ff2163f8853ea782a7a1d4e6f2afd7c29ffe.1603106145.git.qemu_oss@crudebyte.com>
 <20201019134822.047db0fc@bahia.lan> <5026761.SNTRfCqACU@silver>
X-Mailer: Claws Mail 3.17.6 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [37.59.142.95]
X-ClientProxiedBy: DAG8EX2.mxp5.local (172.16.2.72) To DAG8EX1.mxp5.local
 (172.16.2.71)
X-Ovh-Tracer-GUID: ec5d1258-bbbe-4b62-9f4f-58dfecc151e8
X-Ovh-Tracer-Id: 9860349909231245722
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: 0
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedujedrjedugdehhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecunecujfgurhepfffhvffukfgjfhfogggtgfhisehtjeertdertddvnecuhfhrohhmpefirhgvghcumfhurhiiuceoghhrohhugheskhgrohgurdhorhhgqeenucggtffrrghtthgvrhhnpeefuddtieejjeevheekieeltefgleetkeetheettdeifeffvefhffelffdtfeeljeenucfkpheptddrtddrtddrtddpfeejrdehledrudegvddrleehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepmhigphhlrghnhedrmhgrihhlrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehgrhhouhhgsehkrghougdrohhrghdprhgtphhtthhopehqvghmuhdquggvvhgvlhesnhhonhhgnhhurdhorhhg
Received-SPF: pass client-ip=79.137.123.220; envelope-from=groug@kaod.org;
 helo=smtpout1.mo804.mail-out.ovh.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 08:38:48
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
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

On Mon, 19 Oct 2020 14:12:46 +0200
Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:

> On Montag, 19. Oktober 2020 13:48:22 CEST Greg Kurz wrote:
> > On Mon, 19 Oct 2020 13:10:18 +0200
> > 
> > Christian Schoenebeck <qemu_oss@crudebyte.com> wrote:
> > > Don't trigger any performance warning if we're just running test cases,
> > > because tests intentionally run for edge cases.
> > > 
> > > So far performance warnings were suppressed for the 'synth' fs driver
> > > backend only. This patch suppresses them for all 9p fs driver backends.
> > > 
> > > Signed-off-by: Christian Schoenebeck <qemu_oss@crudebyte.com>
> > > ---
> > 
> > LGTM
> > 
> > Reviewed-by: Greg Kurz <groug@kaod.org>
> 
> Thanks Greg!
> 
> BTW, if you still have something to be merged, keep in mind freeze for 5.2 
> starts next monday.
> 

Nothing on my side. Thanks for the reminder anyway :)

Cheers,

--
Greg

> Best regards,
> Christian Schoenebeck
> 
> 


