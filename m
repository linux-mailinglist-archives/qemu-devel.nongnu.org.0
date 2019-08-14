Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF138D2C3
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Aug 2019 14:13:07 +0200 (CEST)
Received: from localhost ([::1]:59954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hxs9K-0006k9-Hd
	for lists+qemu-devel@lfdr.de; Wed, 14 Aug 2019 08:13:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42133)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1hxs8K-0006JX-Ay
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 08:12:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hxs8J-0000Q4-EE
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 08:12:04 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58422)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hxs8J-0000Pd-83
 for qemu-devel@nongnu.org; Wed, 14 Aug 2019 08:12:03 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4D178309BF16;
 Wed, 14 Aug 2019 12:12:02 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-144.ams2.redhat.com
 [10.36.116.144])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DE17060852;
 Wed, 14 Aug 2019 12:12:01 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id F09D017444; Wed, 14 Aug 2019 14:12:00 +0200 (CEST)
Date: Wed, 14 Aug 2019 14:12:00 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: Martin Cerveny <M.Cerveny@computer.org>
Message-ID: <20190814121200.grfu423vzlq2e63q@sirius.home.kraxel.org>
References: <20190724125859.14624-1-M.Cerveny@computer.org>
 <20190724125859.14624-2-M.Cerveny@computer.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190724125859.14624-2-M.Cerveny@computer.org>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Wed, 14 Aug 2019 12:12:02 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 1/1] usb-redir: merge interrupt packets
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Jul 24, 2019 at 02:58:59PM +0200, Martin Cerveny wrote:
> Interrupt packets (limited by wMaxPacketSize) should be buffered and merged
> by algorithm described in USB spec.
> (see usb_20.pdf/5.7.3 Interrupt Transfer Packet Size Constraints).

Added to usb patch queue.

thanks,
  Gerd


