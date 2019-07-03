Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 63F385CAA3
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Jul 2019 10:06:16 +0200 (CEST)
Received: from localhost ([::1]:50442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hiDnr-00012n-KY
	for lists+qemu-devel@lfdr.de; Tue, 02 Jul 2019 04:06:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49670)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hiDkT-0008GV-Ls
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 04:02:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hiDkS-0007aJ-43
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 04:02:45 -0400
Received: from mx1.redhat.com ([209.132.183.28]:46606)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hiDkM-0007Pf-Mv
 for qemu-devel@nongnu.org; Tue, 02 Jul 2019 04:02:40 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 25C44A3B68;
 Tue,  2 Jul 2019 08:02:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-96.ams2.redhat.com
 [10.36.116.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EFDFE1B44D;
 Tue,  2 Jul 2019 08:02:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EA18011AB5; Tue,  2 Jul 2019 10:02:00 +0200 (CEST)
Date: Tue, 2 Jul 2019 10:02:00 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Message-ID: <20190702080200.2fzalvwmtcqgtpoq@sirius.home.kraxel.org>
References: <20190701144705.102615-1-slp@redhat.com>
 <20190701144705.102615-3-slp@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190701144705.102615-3-slp@redhat.com>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Tue, 02 Jul 2019 08:02:17 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v2 2/4] hw/i386: Add an Intel MPTable
 generator
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
Cc: ehabkost@redhat.com, maran.wilson@oracle.com, mst@redhat.com,
 qemu-devel@nongnu.org, pbonzini@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jul 01, 2019 at 04:47:03PM +0200, Sergio Lopez wrote:
> Add a helper function (mptable_generate) for generating an Intel
> MPTable according to version 1.4 of the specification.
> 
> This is needed for the microvm machine type implementation.

Firmware should do this IMHO (qboot or seabios).

cheers,
  Gerd


