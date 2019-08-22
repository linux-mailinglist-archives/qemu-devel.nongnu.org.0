Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AFE598E16
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Aug 2019 10:44:15 +0200 (CEST)
Received: from localhost ([::1]:39306 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i0iha-0004f7-5w
	for lists+qemu-devel@lfdr.de; Thu, 22 Aug 2019 04:44:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34960)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1i0igR-0003bn-4C
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 04:43:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1i0igP-0005of-Vg
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 04:43:02 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40452)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1i0igP-0005oM-PY
 for qemu-devel@nongnu.org; Thu, 22 Aug 2019 04:43:01 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D14687FDFA;
 Thu, 22 Aug 2019 08:43:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-60.ams2.redhat.com
 [10.36.116.60])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 887705D6A7;
 Thu, 22 Aug 2019 08:42:58 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BE94111AAF; Thu, 22 Aug 2019 10:42:57 +0200 (CEST)
Date: Thu, 22 Aug 2019 10:42:57 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Kevin O'Connor <kevin@koconnor.net>
Message-ID: <20190822084257.3e5zvacven6bgzo6@sirius.home.kraxel.org>
References: <fccac7fa-888e-6ac5-458d-688808f3b282@redhat.com>
 <699eee57-3009-4160-a9a2-1070f92b9c20@redhat.com>
 <cc0b5a77-8bc4-070b-31e4-f29d5a174eb8@redhat.com>
 <7f6e8a5c-8262-ae39-333a-e8f18b3174f0@redhat.com>
 <20190821064208.eckikvttpdc3zjmd@sirius.home.kraxel.org>
 <20190821133148.GA20226@morn.lan>
 <20190822083225.iy5o7l4du4hty67u@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190822083225.iy5o7l4du4hty67u@sirius.home.kraxel.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Thu, 22 Aug 2019 08:43:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [SeaBIOS] Re: Regression with floppy drive
 controller
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
Cc: Alex <coderain@sdf.org>, Paolo Bonzini <pbonzini@redhat.com>,
 seabios@seabios.org, John Snow <jsnow@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > Is the PIT not working for some reason in the original setup?  (Any
> > time I attempt to run with "-M isapc" I just get an "Unable to unlock
> > ram - bridge not found" error.)
> 
> Yep, that should be no problem, with isapc the ram is not locked in
> the first place.

Oh, and you need a config small enough to fit into 128k, 256k roms don't
work for isapc.  When you turn off all PCI drivers this should be easy ;)

cheers,
  Gerd


