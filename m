Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5FA42D59F
	for <lists+qemu-devel@lfdr.de>; Wed, 29 May 2019 08:43:02 +0200 (CEST)
Received: from localhost ([127.0.0.1]:48212 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hVsIf-0000yt-Jf
	for lists+qemu-devel@lfdr.de; Wed, 29 May 2019 02:43:01 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44885)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hVsGz-0000OU-RC
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:41:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hVsGy-0007qH-Vm
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:41:17 -0400
Received: from mx1.redhat.com ([209.132.183.28]:42634)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hVsGy-00050k-1n
	for qemu-devel@nongnu.org; Wed, 29 May 2019 02:41:16 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 513F185528
	for <qemu-devel@nongnu.org>; Wed, 29 May 2019 06:41:05 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-59.ams2.redhat.com
	[10.36.116.59])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 23304646CC;
	Wed, 29 May 2019 06:41:04 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 61E5111AAB; Wed, 29 May 2019 08:41:03 +0200 (CEST)
Date: Wed, 29 May 2019 08:41:03 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Max Reitz <mreitz@redhat.com>
Message-ID: <20190529064103.2con6v4kevqx2t76@sirius.home.kraxel.org>
References: <20190527142540.23255-1-mreitz@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190527142540.23255-1-mreitz@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.28]);
	Wed, 29 May 2019 06:41:05 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH] ui/curses: Fix build with -m32
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, May 27, 2019 at 04:25:40PM +0200, Max Reitz wrote:
> wchar_t may resolve to be an unsigned long on 32-bit architectures.
> Using the %x conversion specifier will then give a compiler warning:

Added to ui queue.

thanks,
  Gerd


