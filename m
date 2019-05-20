Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0659B22D72
	for <lists+qemu-devel@lfdr.de>; Mon, 20 May 2019 09:55:22 +0200 (CEST)
Received: from localhost ([127.0.0.1]:59668 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hSd8j-0002FL-7z
	for lists+qemu-devel@lfdr.de; Mon, 20 May 2019 03:55:21 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39878)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hSd7j-0001yR-G8
	for qemu-devel@nongnu.org; Mon, 20 May 2019 03:54:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hSd7i-0005VE-Jz
	for qemu-devel@nongnu.org; Mon, 20 May 2019 03:54:19 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42876)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hSd7i-0005Uq-F1
	for qemu-devel@nongnu.org; Mon, 20 May 2019 03:54:18 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8946830832E3;
	Mon, 20 May 2019 07:54:17 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-74.ams2.redhat.com
	[10.36.117.74])
	by smtp.corp.redhat.com (Postfix) with ESMTP id B175219C77;
	Mon, 20 May 2019 07:54:14 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id CB41116E0A; Mon, 20 May 2019 09:54:13 +0200 (CEST)
Date: Mon, 20 May 2019 09:54:13 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Jim Payne <brad@comstyle.com>
Message-ID: <20190520075413.ogu5nv3wkoqvpqse@sirius.home.kraxel.org>
References: <20190510104633.9428-1-kraxel@redhat.com>
	<33bef2cb-e556-a7e1-9b6f-a1d52a8569cc@redhat.com>
	<14d4fec2-e158-a96c-7bd9-2ca960f1656c@comstyle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14d4fec2-e158-a96c-7bd9-2ca960f1656c@comstyle.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Mon, 20 May 2019 07:54:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] QEMU on OpenBSD is broken?
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Ed Maste <emaste@freebsd.org>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org, Kamil Rytarowski <kamil@netbsd.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > qemu-system-arm: cannot set up guest memory 'ram': Cannot allocate memory
> > Broken pipe
> 
> How much memory is trying to be allocated here?
> 
> The default maximum data size is set to 768MB. If there is a requirement to
> go beyond
> that then the default has to be adjusted in /etc/login.conf.

Yes, adjusting the limits fixes that.

thanks,
  Gerd


