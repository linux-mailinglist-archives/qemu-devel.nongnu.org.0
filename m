Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C062952F
	for <lists+qemu-devel@lfdr.de>; Fri, 24 May 2019 11:55:47 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51850 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hU6vS-0007T7-TI
	for lists+qemu-devel@lfdr.de; Fri, 24 May 2019 05:55:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53733)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <johannes@sipsolutions.net>) id 1hU6uT-00079x-I5
	for qemu-devel@nongnu.org; Fri, 24 May 2019 05:54:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <johannes@sipsolutions.net>) id 1hU6uR-0001Ov-F2
	for qemu-devel@nongnu.org; Fri, 24 May 2019 05:54:45 -0400
Received: from s3.sipsolutions.net ([2a01:4f8:191:4433::2]:54254
	helo=sipsolutions.net)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <johannes@sipsolutions.net>)
	id 1hU6uQ-0001Np-5W
	for qemu-devel@nongnu.org; Fri, 24 May 2019 05:54:43 -0400
Received: by sipsolutions.net with esmtpsa
	(TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
	(envelope-from <johannes@sipsolutions.net>)
	id 1hU6uB-0001Nq-RL; Fri, 24 May 2019 11:54:27 +0200
Message-ID: <aa9490ff07c587b3bca01ec5eb33d59ea440b645.camel@sipsolutions.net>
From: Johannes Berg <johannes@sipsolutions.net>
To: Stefan Hajnoczi <stefanha@gmail.com>
Date: Fri, 24 May 2019 11:54:26 +0200
In-Reply-To: <CAJSP0QWSZXT3OJAc=abagD40xZ7DWWrcP_+AwVBuqQyQNgaOEg@mail.gmail.com>
	(sfid-20190523_164131_760945_C45BA0A2)
References: <0952696452f5ff4e38d2417029243fc60efa33d6.camel@sipsolutions.net>
	<20190523115950.GH26632@stefanha-x1.localdomain>
	<41d64b8971a097d1568f947517b45d09c156ccc8.camel@sipsolutions.net>
	<CAJSP0QWSZXT3OJAc=abagD40xZ7DWWrcP_+AwVBuqQyQNgaOEg@mail.gmail.com>
	(sfid-20190523_164131_760945_C45BA0A2)
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-2.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a01:4f8:191:4433::2
Subject: Re: [Qemu-devel] custom virt-io support (in user-mode-linux)
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
Cc: ido@wizery.com, linux-um@lists.infradead.org,
	qemu-devel <qemu-devel@nongnu.org>,
	Linux Virtualization <virtualization@lists.linux-foundation.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 2019-05-23 at 15:41 +0100, Stefan Hajnoczi wrote:

> > Also, not sure I understand how the client is started?
> 
> The vhost-user device backend can be launched before QEMU.  QEMU is
> started with the UNIX domain socket path so it can connect.

Hmm. I guess I'm confusing the terminology then - I thought qemu was the
server and the backend was the client that connects to it. If it's the
other way around, yeah, that makes things easier and certainly makes
sense (you could have a daemon that implements something).

> QEMU itself doesn't fork+exec the vhost-user device backend.  It's
> expected that the user or the management stack has already launched
> the vhost-user device backend.

Right.

> > Do you know if there's a sample client/server somewhere?
> 
> See contrib/libvhost-user in the QEMU source tree as well as the
> vhost-user-blk and vhost-user-scsi examples in the contrib/ directory.

Awesome, thanks!

johannes


