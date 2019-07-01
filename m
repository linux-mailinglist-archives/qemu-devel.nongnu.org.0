Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC62329654
	for <lists+qemu-devel@lfdr.de>; Fri, 24 May 2019 12:51:06 +0200 (CEST)
Received: from localhost ([127.0.0.1]:52360 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hU7mz-0003hr-Om
	for lists+qemu-devel@lfdr.de; Fri, 24 May 2019 06:51:05 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60576)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hU7hE-0008B4-LF
	for qemu-devel@nongnu.org; Fri, 24 May 2019 06:45:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hU7SE-0000Um-P7
	for qemu-devel@nongnu.org; Fri, 24 May 2019 06:29:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:7300)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hU7SE-0000U1-Jz
	for qemu-devel@nongnu.org; Fri, 24 May 2019 06:29:38 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 64A743079B60
	for <qemu-devel@nongnu.org>; Fri, 24 May 2019 10:29:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-101.ams2.redhat.com
	[10.36.116.101])
	by smtp.corp.redhat.com (Postfix) with ESMTP id A2C1860C62;
	Fri, 24 May 2019 10:29:30 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id BBDAB11AB5; Fri, 24 May 2019 12:29:29 +0200 (CEST)
Date: Fri, 24 May 2019 12:29:29 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Message-ID: <20190524102929.4s45fvjt65ia6af2@sirius.home.kraxel.org>
References: <20190523132035.20559-1-marcandre.lureau@redhat.com>
	<20190523132035.20559-6-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190523132035.20559-6-marcandre.lureau@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.41]);
	Fri, 24 May 2019 10:29:37 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v8 5/8] contrib: add vhost-user-gpu
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 23, 2019 at 03:20:32PM +0200, Marc-Andr=E9 Lureau wrote:
> Add a vhost-user gpu backend, based on virtio-gpu/3d device. It is
> associated with a vhost-user-gpu device.
>=20
> Various TODO and nice to have items:
> - multi-head support
> - crash & resume handling
> - accelerated rendering/display that avoids the waiting round trips
> - edid support

Fails to build with "configure --disable-opengl".

cheers,
  Gerd


