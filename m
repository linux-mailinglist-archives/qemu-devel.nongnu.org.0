Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14ECC15EAF
	for <lists+qemu-devel@lfdr.de>; Tue,  7 May 2019 09:58:19 +0200 (CEST)
Received: from localhost ([127.0.0.1]:41748 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hNuzS-0000ct-A8
	for lists+qemu-devel@lfdr.de; Tue, 07 May 2019 03:58:18 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53217)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hNuxu-0008KB-BT
	for qemu-devel@nongnu.org; Tue, 07 May 2019 03:56:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hNuxt-0007j4-H8
	for qemu-devel@nongnu.org; Tue, 07 May 2019 03:56:42 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54356)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hNuxt-0007hv-Al
	for qemu-devel@nongnu.org; Tue, 07 May 2019 03:56:41 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A96EC30842B2;
	Tue,  7 May 2019 07:56:40 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
	[10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0D200171F1;
	Tue,  7 May 2019 07:56:36 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 479B711AA3; Tue,  7 May 2019 09:56:35 +0200 (CEST)
Date: Tue, 7 May 2019 09:56:35 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20190507075635.idnnfhmf6pdgc2no@sirius.home.kraxel.org>
References: <20190325155923.30987-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190325155923.30987-1-pbonzini@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.40]);
	Tue, 07 May 2019 07:56:40 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] i2c-ddc: move it to hw/display
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
Cc: peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Mar 25, 2019 at 04:59:23PM +0100, Paolo Bonzini wrote:
> Move it together with the other EDID code.  hw/i2c should only
> include the core and the adapters, not the slaves.

Added to vga queue.

thanks,
  Gerd


