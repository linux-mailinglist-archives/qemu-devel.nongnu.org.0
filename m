Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A99C19A28
	for <lists+qemu-devel@lfdr.de>; Fri, 10 May 2019 11:00:54 +0200 (CEST)
Received: from localhost ([127.0.0.1]:39281 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hP1Of-0004iB-8N
	for lists+qemu-devel@lfdr.de; Fri, 10 May 2019 05:00:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35539)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hP1Ne-0004Pz-Hd
	for qemu-devel@nongnu.org; Fri, 10 May 2019 04:59:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hP1Nd-0004IL-P4
	for qemu-devel@nongnu.org; Fri, 10 May 2019 04:59:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:45236)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hP1Nd-0004Hq-Jg
	for qemu-devel@nongnu.org; Fri, 10 May 2019 04:59:49 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8353D3084295;
	Fri, 10 May 2019 08:59:48 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-74.ams2.redhat.com
	[10.36.117.74])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 42BEF379C;
	Fri, 10 May 2019 08:59:48 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 79B10A1E1; Fri, 10 May 2019 10:59:47 +0200 (CEST)
Date: Fri, 10 May 2019 10:59:47 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Message-ID: <20190510085947.y62lttdtrg5cxx6b@sirius.home.kraxel.org>
References: <CABSdmrnNW6f=P64PviPP8CTJ5SVfYS8_6kmAtpw9yPObTEkpxg@mail.gmail.com>
	<CABSdmrnocrqLKWncgy_Lak33__GRPYfs-RzSA14e=vh4cRn2ag@mail.gmail.com>
	<20190509064848.wjhchsfov7q6komj@sirius.home.kraxel.org>
	<CABSdmrmm+wJ=+Ccav=X5Gw_oueQvPRejCWVG2SQeCw=K4BM9EA@mail.gmail.com>
	<CABSdmrndpONH_fVHbktHbBXvXPKESeRfis06TjrNRRfBpJzXLA@mail.gmail.com>
	<b6064b77-5ca4-03e1-80ef-027313096cb2@gmail.com>
	<CABSdmrkW6G23ZGDA7iLucM45vL0HHGsr2F76H0Mf8S0xkhPnsQ@mail.gmail.com>
	<3e619b5c-8fb3-2655-2d92-37598db098d8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e619b5c-8fb3-2655-2d92-37598db098d8@gmail.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Fri, 10 May 2019 08:59:48 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 3/3] ramfb enhancement
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
Cc: Hou Qiming <hqm03ster@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> Got it, thanks. Is a pity ramfb is not a PCI device :), it was worth the
> question anyway.

If you look for a simple pci display device check out bochs-display.
It's simliar to stdvga (so ovmf and bochs-drm.ko can drive it just
fine), but without legacy vga emulation, only a linear framebuffer is
supported.  And code size is a fraction of stdvga ...

cheers,
  Gerd


