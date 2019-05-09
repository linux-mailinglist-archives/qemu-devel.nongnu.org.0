Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CAA618AFC
	for <lists+qemu-devel@lfdr.de>; Thu,  9 May 2019 15:51:48 +0200 (CEST)
Received: from localhost ([127.0.0.1]:54891 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOjSd-0000uQ-OM
	for lists+qemu-devel@lfdr.de; Thu, 09 May 2019 09:51:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53515)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hOjRM-0008QE-Mv
	for qemu-devel@nongnu.org; Thu, 09 May 2019 09:50:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hOjRL-0003ME-UI
	for qemu-devel@nongnu.org; Thu, 09 May 2019 09:50:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47618)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hOjRL-0003Lz-PO
	for qemu-devel@nongnu.org; Thu, 09 May 2019 09:50:27 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id E94F43087BD2;
	Thu,  9 May 2019 13:50:26 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-74.ams2.redhat.com
	[10.36.117.74])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 4D19E60BF3;
	Thu,  9 May 2019 13:50:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 82A2C11AA3; Thu,  9 May 2019 15:50:22 +0200 (CEST)
Date: Thu, 9 May 2019 15:50:22 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20190509135022.z5yjsrghixfrv2ta@sirius.home.kraxel.org>
References: <20190508085645.11595-1-kraxel@redhat.com>
	<38ea2334-b819-a439-7a43-92b52263b402@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <38ea2334-b819-a439-7a43-92b52263b402@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Thu, 09 May 2019 13:50:27 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 00/13] tests/vm: serial console autoinstall,
 misc fixes.
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
Cc: Fam Zheng <fam@euphon.net>, Ed Maste <emaste@freebsd.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org, Kamil Rytarowski <kamil@netbsd.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Li-Wen Hsu <lwhsu@freebsd.org>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > Do we have accelerator support for the BSDs?  A "make check" for a full
> > build takes ages, and I suspect tcg being used is part of the problem.
> > I did my tests using "TARGET_LIST=x86_64-softmmu" because of that.
> 
> I think they should be running with "--enable-kvm".

The images themself yes, but the tests running *inside* (on make check) don't.

cheers,
  Gerd


