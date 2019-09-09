Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EA8DAD787
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Sep 2019 13:01:37 +0200 (CEST)
Received: from localhost ([::1]:55100 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i7HQO-00052Y-F6
	for lists+qemu-devel@lfdr.de; Mon, 09 Sep 2019 07:01:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33802)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <samuel.thibault@gnu.org>) id 1i7HOi-0004Re-W8
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 06:59:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <samuel.thibault@gnu.org>) id 1i7HOi-0005mw-4J
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 06:59:52 -0400
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:58715)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <samuel.thibault@gnu.org>)
 id 1i7HOh-0005mD-Sm
 for qemu-devel@nongnu.org; Mon, 09 Sep 2019 06:59:52 -0400
X-IronPort-AV: E=Sophos;i="5.64,484,1559512800"; d="scan'208";a="400860917"
Received: from nat-inria-bordeaux-52-gw-01-bso.bordeaux.inria.fr (HELO
 function) ([194.199.1.52])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/AES256-GCM-SHA384;
 09 Sep 2019 12:59:49 +0200
Received: from samy by function with local (Exim 4.92.1)
 (envelope-from <samuel.thibault@gnu.org>)
 id 1i7HOf-0005Bi-KK; Mon, 09 Sep 2019 12:59:49 +0200
Date: Mon, 9 Sep 2019 12:59:49 +0200
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Message-ID: <20190909105949.45jdxvzwusonn327@function>
References: <0115e29c-2254-09c3-13d5-6dfb5307d968@precibake.com>
 <20190907232924.a2maha6jyf7u6xbb@function>
 <47bad7a1-8fae-b464-7c74-b458d02a6174@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <47bad7a1-8fae-b464-7c74-b458d02a6174@redhat.com>
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
Cc: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Chris Heinze <c.heinze@precibake.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

Philippe Mathieu-Daudé, le lun. 09 sept. 2019 12:51:23 +0200, a ecrit:
> Anyhow, if you plan to properly (with your S-o-b) commit your patch to
> the libslirp repository,

Actually the libslirp repository already has something there. Since
IPv4/6 have a maximum of 64KB packets, it just allocates that size
on the stack, whîch is simpler in the end. Also it makes mru/mtu
configurable, we will be able to plug that into qemu once released.

Samuel

