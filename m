Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09F9211379
	for <lists+qemu-devel@lfdr.de>; Thu,  2 May 2019 08:43:56 +0200 (CEST)
Received: from localhost ([127.0.0.1]:46071 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hM5Rj-00087L-9L
	for lists+qemu-devel@lfdr.de; Thu, 02 May 2019 02:43:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49665)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hM5Qm-0007fx-DQ
	for qemu-devel@nongnu.org; Thu, 02 May 2019 02:42:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hM5Qf-0003zG-PT
	for qemu-devel@nongnu.org; Thu, 02 May 2019 02:42:52 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43068)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hM5Qc-0003mu-K1
	for qemu-devel@nongnu.org; Thu, 02 May 2019 02:42:48 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 8C1018553D
	for <qemu-devel@nongnu.org>; Thu,  2 May 2019 06:42:41 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-45.ams2.redhat.com
	[10.36.116.45])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 24D6A80F7;
	Thu,  2 May 2019 06:42:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 538EF11AAF; Thu,  2 May 2019 08:42:38 +0200 (CEST)
Date: Thu, 2 May 2019 08:42:38 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Message-ID: <20190502064238.42mqoy2bv53yrirl@sirius.home.kraxel.org>
References: <20190419075625.24251-1-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190419075625.24251-1-thuth@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Thu, 02 May 2019 06:42:41 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 for-4.1 0/2] Fix ohci_die() and move PCI
 code to separate file
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Apr 19, 2019 at 09:56:23AM +0200, Thomas Huth wrote:
> First patch fixes a problem with ohci_die(), second patch moves PCI code into
> a separate file, so that the sysbus OHCI device can also be used without
> the dependency on the PCI code.
> 
> v2: Split the patch into two patches, one for the ohci_die() fix and one
>     for the PCI code movement.
> 
> Thomas Huth (2):
>   hw/usb/hcd-ohci: Do not use PCI functions with sysbus devices in
>     ohci_die()
>   hw/usb/hcd-ohci: Move PCI-related code into a separate file

Added to usb queue.

thanks,
  Gerd


