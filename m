Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4664136319
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Jun 2019 20:07:39 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48029 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hYaK2-0006Vz-4h
	for lists+qemu-devel@lfdr.de; Wed, 05 Jun 2019 14:07:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39393)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hYaIt-0006Cv-N3
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 14:06:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ehabkost@redhat.com>) id 1hYaIo-0004ZU-Lw
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 14:06:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55406)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hYaIo-0004Rn-FS
	for qemu-devel@nongnu.org; Wed, 05 Jun 2019 14:06:22 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 219E67EBDC
	for <qemu-devel@nongnu.org>; Wed,  5 Jun 2019 18:06:14 +0000 (UTC)
Received: from localhost (ovpn-116-9.gru2.redhat.com [10.97.116.9])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3BFD9101E698;
	Wed,  5 Jun 2019 18:06:10 +0000 (UTC)
Date: Wed, 5 Jun 2019 15:06:08 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Message-ID: <20190605180608.GW22416@habkost.net>
References: <1559205199-233510-1-git-send-email-imammedo@redhat.com>
	<20190605173311.GA13261@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190605173311.GA13261@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.27]);
	Wed, 05 Jun 2019 18:06:14 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v4 0/3] numa: deprecate '-numa node,
 mem' and default memory distribution
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
Cc: libvir-list@redhat.com, Igor Mammedov <imammedo@redhat.com>,
	qemu-devel@nongnu.org, armbru@redhat.com, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jun 05, 2019 at 06:33:11PM +0100, Daniel P. Berrang=E9 wrote:
[...]
> I wonder if there's a way to close the testing gap somehow ? Random ide=
a
> would be a non-versioned "pc-no-deprecated" machine type, which blocks
> all use of deprecated features and does not promise any migration compa=
t.
> Essentially it would exist just for testing purposem as a way todo
> functional tests for libvirt & mgmt apps to prove they don't use any
> deprecated features (any deprecated features, not merely this  NUMA one=
).

This isn't the first time I wish we had a machine type with
experimental features enabled.  What about calling it "pc-next"?

--=20
Eduardo

