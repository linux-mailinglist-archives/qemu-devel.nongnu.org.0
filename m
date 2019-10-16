Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B12DD8E45
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Oct 2019 12:46:06 +0200 (CEST)
Received: from localhost ([::1]:40776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKgof-0007zS-Cr
	for lists+qemu-devel@lfdr.de; Wed, 16 Oct 2019 06:46:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37338)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1iKgmy-00079w-7f
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 06:44:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1iKgmv-00013y-RG
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 06:44:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59954)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1iKgmv-00013f-Lr
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 06:44:17 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 29A27801682;
 Wed, 16 Oct 2019 10:44:14 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-116-43.ams2.redhat.com
 [10.36.116.43])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E1A6D5D9E1;
 Wed, 16 Oct 2019 10:44:13 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EE3A417474; Wed, 16 Oct 2019 12:44:12 +0200 (CEST)
Date: Wed, 16 Oct 2019 12:44:12 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: seabios@seabios.org
Subject: 1.13 release?
Message-ID: <20191016104412.ut3jxjwjf64qsjbk@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.67]); Wed, 16 Oct 2019 10:44:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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

  Hi,

Almost a year since 1.12.0 was tagged (Nov 17th to be exact),
time to plan the 1.13 release I think ...

How about freeze in a week or two, release by mid-november?

Pending stuff I'm aware of is the disk geometry patch series.
The corresponding qemu series is still waiting to be merged.
There already was a pull request for it though, it only was
dropped due to a regression showing up, so I think there is
still a chance that it'll be merged shortly given that no
objections where raised during review.

Anything else which should be considered for 1.13?

cheers,
  Gerd


