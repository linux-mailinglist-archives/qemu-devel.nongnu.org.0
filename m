Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FD34B2C6
	for <lists+qemu-devel@lfdr.de>; Sat, 27 Apr 2019 06:25:53 +0200 (CEST)
Received: from localhost ([127.0.0.1]:55433 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hKEuO-0005Yo-2Z
	for lists+qemu-devel@lfdr.de; Sat, 27 Apr 2019 00:25:52 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40052)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hKEtM-0004qY-N8
	for qemu-devel@nongnu.org; Sat, 27 Apr 2019 00:24:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pbonzini@redhat.com>) id 1hKEtL-0005wM-Na
	for qemu-devel@nongnu.org; Sat, 27 Apr 2019 00:24:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43704)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hKEtL-0005uz-Hc
	for qemu-devel@nongnu.org; Sat, 27 Apr 2019 00:24:47 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id EB00530B27BE;
	Sat, 27 Apr 2019 04:24:45 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
	(colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id DCBE427BA2;
	Sat, 27 Apr 2019 04:24:45 +0000 (UTC)
Received: from zmail18.collab.prod.int.phx2.redhat.com
	(zmail18.collab.prod.int.phx2.redhat.com [10.5.83.21])
	by colo-mx.corp.redhat.com (Postfix) with ESMTP id B04843FB10;
	Sat, 27 Apr 2019 04:24:45 +0000 (UTC)
Date: Sat, 27 Apr 2019 00:24:45 -0400 (EDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: Wei Li <wei.d.li@oracle.com>
Message-ID: <825292440.15675844.1556339085478.JavaMail.zimbra@redhat.com>
In-Reply-To: <7044D39A-8D7B-41F7-B8C3-DC2214E6826A@oracle.com>
References: <5FF901C1-0AA5-4308-A65C-C448D0A2BA63@oracle.com>
	<898ef1d4-bfa2-9952-8ceb-f1282b85e29c@oracle.com>
	<20190416092042.GB32709@stefanha-x1.localdomain>
	<8E5AF770-69ED-4D44-8A25-B51344996D9E@oracle.com>
	<3F7E854A-3C1D-4204-8C35-893FC0614796@oracle.com>
	<20190423120453.GF32465@stefanha-x1.localdomain>
	<44520476-d6a8-2e3f-1602-388e2e1e874e@redhat.com>
	<7044D39A-8D7B-41F7-B8C3-DC2214E6826A@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [93.56.166.5, 10.4.196.15, 10.5.101.130, 10.4.195.24]
Thread-Topic: [Qemu-devel] Following up questions related to QEMU and I/O
	Thread
Thread-Index: nrya/PIFCrUmu8omI+ihQgdYpvhqFg==
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.48]);
	Sat, 27 Apr 2019 04:24:46 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] Following up questions related to QEMU and I/O
 Thread
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
Cc: Stefan Hajnoczi <stefanha@gmail.com>, qemu-devel@nongnu.org,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Dongli Zhang <dongli.zhang@oracle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> Thanks Stefan and Paolo for your response and advice!
> 
> Hi Paolo,
> 
> As to the virtio-scsi batch I/O submission feature in QEMU which you
> mentioned, is this feature turned on by default in QEMU 2.9 or there is a
> tunable parameters to turn on/off the feature?

Yes, it is available by default since 2.2.0.  It cannot be turned off, however
it is only possible to batch I/O with aio=native (and, since 2.12.0, with the NVMe
backend).

Paolo

