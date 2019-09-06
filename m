Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E96AAAB52F
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Sep 2019 12:00:12 +0200 (CEST)
Received: from localhost ([::1]:53972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i6B2J-0002jL-Pp
	for lists+qemu-devel@lfdr.de; Fri, 06 Sep 2019 06:00:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42113)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <samuel.thibault@gnu.org>) id 1i6B1I-0002Kn-RB
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 05:59:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <samuel.thibault@gnu.org>) id 1i6B1H-000758-Tf
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 05:59:08 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:7057)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <samuel.thibault@gnu.org>)
 id 1i6B1H-00074w-KT
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 05:59:07 -0400
X-IronPort-AV: E=Sophos;i="5.64,472,1559512800"; d="scan'208";a="400560481"
Received: from unknown (HELO function) ([193.50.111.121])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2019 11:59:05 +0200
Received: from samy by function with local (Exim 4.92.1)
 (envelope-from <samuel.thibault@gnu.org>)
 id 1i6B1F-0006IV-PL; Fri, 06 Sep 2019 11:59:05 +0200
Date: Fri, 6 Sep 2019 11:59:05 +0200
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Chris Heinze <c.heinze@precibake.com>
Message-ID: <20190906095905.44hrurx3vlbqidkq@function>
References: <0115e29c-2254-09c3-13d5-6dfb5307d968@precibake.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0115e29c-2254-09c3-13d5-6dfb5307d968@precibake.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.134.164.83
Subject: Re: [Qemu-devel] slirp, incoming packets get truncated
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

Hello,

Chris Heinze, le mar. 03 sept. 2019 17:02:15 +0200, a ecrit:
> on the guest:
> root@guest:~# tcpdump -ni eth0 port 19003
> tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
> listening on eth0, link-type EN10MB (Ethernet), capture size 262144 bytes
> 16:49:39.430959 IP 10.0.2.2.33294 > 10.0.2.15.19003: UDP, bad length 9000 > 1472

Just to be sure: did you configure your guest mru to 9000 ? Does the
emulated network hardware card support jumbo frames?

Samuel

