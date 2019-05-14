Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C9181C341
	for <lists+qemu-devel@lfdr.de>; Tue, 14 May 2019 08:27:17 +0200 (CEST)
Received: from localhost ([127.0.0.1]:40232 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hQQuC-0004Ls-Hx
	for lists+qemu-devel@lfdr.de; Tue, 14 May 2019 02:27:16 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54300)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hQQmG-0006oO-EI
	for qemu-devel@nongnu.org; Tue, 14 May 2019 02:19:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <kraxel@redhat.com>) id 1hQQmF-0003h8-OB
	for qemu-devel@nongnu.org; Tue, 14 May 2019 02:19:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46868)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hQQmF-0003g5-If
	for qemu-devel@nongnu.org; Tue, 14 May 2019 02:19:03 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
	[10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id A0C753087945;
	Tue, 14 May 2019 06:19:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-74.ams2.redhat.com
	[10.36.117.74])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 62E4A5D71E;
	Tue, 14 May 2019 06:19:02 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
	id 6B90D1747D; Tue, 14 May 2019 08:19:01 +0200 (CEST)
Date: Tue, 14 May 2019 08:19:01 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Samuel Thibault <samuel.thibault@ens-lyon.org>
Message-ID: <20190514061901.5dunlp5r36gphf6i@sirius.home.kraxel.org>
References: <20190427183307.12796-1-samuel.thibault@ens-lyon.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190427183307.12796-1-samuel.thibault@ens-lyon.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Tue, 14 May 2019 06:19:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCHv4 0/2] ui/curses: BSD portability fixes
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
Cc: kamil@netbsd.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Apr 27, 2019 at 08:33:05PM +0200, Samuel Thibault wrote:
> BSD needs a few fixes for wide character manipulations.
> 
> Difference with v1:
> - Fix unitialized value in error message
> 
> Difference with v2:
> - Add cchar_t manipulation fix
> 
> Difference with v3:
> - use mbrtowc/wcrtomb instead of mbtowc/wctomb
> - use MB_LEN_MAX instead of MB_CUR_MAX to avoid using a VLA.

Added to ui queue.

thanks,
  Gerd


