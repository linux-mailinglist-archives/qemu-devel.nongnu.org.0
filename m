Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0780AB6F9
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Sep 2019 13:16:16 +0200 (CEST)
Received: from localhost ([::1]:54728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i6CDv-0003iV-W4
	for lists+qemu-devel@lfdr.de; Fri, 06 Sep 2019 07:16:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32849)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <samuel.thibault@gnu.org>) id 1i6CCX-0002n9-QJ
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 07:14:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <samuel.thibault@gnu.org>) id 1i6CCW-0007wv-W3
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 07:14:49 -0400
Received: from mail3-relais-sop.national.inria.fr ([192.134.164.104]:9930)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <samuel.thibault@gnu.org>)
 id 1i6CCW-0007tx-NE
 for qemu-devel@nongnu.org; Fri, 06 Sep 2019 07:14:48 -0400
X-IronPort-AV: E=Sophos;i="5.64,472,1559512800"; d="scan'208";a="318515797"
Received: from unknown (HELO function) ([193.50.111.121])
 by mail3-relais-sop.national.inria.fr with ESMTP/TLS/AES256-GCM-SHA384;
 06 Sep 2019 13:14:25 +0200
Received: from samy by function with local (Exim 4.92.1)
 (envelope-from <samuel.thibault@gnu.org>)
 id 1i6CC8-00081e-Sl; Fri, 06 Sep 2019 13:14:24 +0200
Date: Fri, 6 Sep 2019 13:14:24 +0200
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Chris Heinze <c.heinze@precibake.com>
Message-ID: <20190906111424.jufsgie3fi66bk5d@function>
References: <0115e29c-2254-09c3-13d5-6dfb5307d968@precibake.com>
 <20190906095905.44hrurx3vlbqidkq@function>
 <68838709-01f9-3bf6-ac5d-461e76a1585e@precibake.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68838709-01f9-3bf6-ac5d-461e76a1585e@precibake.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.134.164.104
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

Chris Heinze, le ven. 06 sept. 2019 12:54:24 +0200, a ecrit:
> i'm not aware of any (canonical) parameters to set a max size for received packets

Ah, right.

> i found no way to configure slirp (in qemu) itself except for the DEFINEs in the if.h.

Yes, that's where it is to be configured atm. IF_MRU is however only
used for setting the TCP mss, there is no code that is supposed to
truncate packets etc., that's why I'm really surprised that there is
such truncation happening.

Samuel

