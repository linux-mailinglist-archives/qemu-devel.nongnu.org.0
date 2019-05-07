Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56EFA15DF6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 May 2019 09:14:44 +0200 (CEST)
Received: from localhost ([127.0.0.1]:41285 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNuJH-00064u-Ha
	for lists+qemu-devel@lfdr.de; Tue, 07 May 2019 03:14:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46133)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hNuIG-0005iq-Ay
	for qemu-devel@nongnu.org; Tue, 07 May 2019 03:13:41 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hNuIF-0001tB-Ik
	for qemu-devel@nongnu.org; Tue, 07 May 2019 03:13:40 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43254)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>)
	id 1hNuIF-0001sh-Dc; Tue, 07 May 2019 03:13:39 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BAE5130842A0;
	Tue,  7 May 2019 07:13:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
	[10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 537C7377F;
	Tue,  7 May 2019 07:13:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 8A72A11AA3; Tue,  7 May 2019 09:13:35 +0200 (CEST)
Date: Tue, 7 May 2019 09:13:35 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Message-ID: <20190507071335.tossootl4tb7s75n@sirius.home.kraxel.org>
References: <20190505225640.4592-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <20190505225640.4592-1-philmd@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Tue, 07 May 2019 07:13:38 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] hw/display/cirrus_vga: Remove unused
 include
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
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 06, 2019 at 12:56:40AM +0200, Philippe Mathieu-Daud=E9 wrote:
> Commit ce3cf70edaaf split the ISA device out of the PCI one,
> but forgot to remove the "hw/loader.h" header inclusion (the ISA
> device calls rom_add_vga()).  Remove the now unused include.

Added to vga queue.

thanks,
  Gerd


