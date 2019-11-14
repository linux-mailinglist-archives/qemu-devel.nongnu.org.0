Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 278C9FC79C
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Nov 2019 14:32:53 +0100 (CET)
Received: from localhost ([::1]:57560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iVFEx-0005nU-Ts
	for lists+qemu-devel@lfdr.de; Thu, 14 Nov 2019 08:32:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33335)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <samuel.thibault@gnu.org>) id 1iVFDm-0005F9-6T
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 08:31:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <samuel.thibault@gnu.org>) id 1iVFDl-0004Ay-77
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 08:31:38 -0500
Received: from mail2-relais-roc.national.inria.fr ([192.134.164.83]:60735)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <samuel.thibault@gnu.org>)
 id 1iVFDk-0003xM-U8
 for qemu-devel@nongnu.org; Thu, 14 Nov 2019 08:31:37 -0500
X-IronPort-AV: E=Sophos;i="5.68,304,1569276000"; d="scan'208";a="411797001"
Received: from unknown (HELO function) ([193.50.111.121])
 by mail2-relais-roc.national.inria.fr with ESMTP/TLS/AES256-GCM-SHA384;
 14 Nov 2019 14:31:25 +0100
Received: from samy by function with local (Exim 4.92.3)
 (envelope-from <samuel.thibault@gnu.org>)
 id 1iVFDZ-000Y2p-41; Thu, 14 Nov 2019 14:31:25 +0100
Date: Thu, 14 Nov 2019 14:31:25 +0100
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Teemu Kuusisto <teemu.kuusisto@gmail.com>
Subject: Re: Braille device (chardev/baum.c) is unable to detect the TTY
 correctly and does not act on graphic console connect/disconnect
Message-ID: <20191114133125.o7bc27kdvkduygrt@function>
References: <20191114120915.GA31365@valhalla>
 <20191114130841.kxgorkvtinyaahdm@function>
 <20191114132712.rpqzq7jvl32beduu@function>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191114132712.rpqzq7jvl32beduu@function>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 192.134.164.83
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

Samuel Thibault, le jeu. 14 nov. 2019 14:27:12 +0100, a ecrit:
> Samuel Thibault, le jeu. 14 nov. 2019 14:08:41 +0100, a ecrit:
> > The way to properly fix it is to add a brlapi channel to spice:
> 
> And that would be workable through a spice agent as well, so that
> braille management from orca

Or event NVDA or Narrator, actually.

> running inside the guest could talk
> directly through to brltty running on the host instead of having to go
> through the emulation layers.
> 
> Samuel

