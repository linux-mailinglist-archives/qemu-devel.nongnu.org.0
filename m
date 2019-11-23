Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 866CC107EB8
	for <lists+qemu-devel@lfdr.de>; Sat, 23 Nov 2019 15:06:39 +0100 (CET)
Received: from localhost ([::1]:59106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iYW3Z-0007qF-Gs
	for lists+qemu-devel@lfdr.de; Sat, 23 Nov 2019 09:06:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44204)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <svens@stackframe.org>) id 1iYVwo-00050v-MA
 for qemu-devel@nongnu.org; Sat, 23 Nov 2019 08:59:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <svens@stackframe.org>) id 1iYVwm-0001hg-SX
 for qemu-devel@nongnu.org; Sat, 23 Nov 2019 08:59:38 -0500
Received: from shroom.duncanthrax.net ([2a01:4f8:121:41fa::169]:43081
 helo=smtp.duncanthrax.net)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <svens@stackframe.org>)
 id 1iYVwl-0001gb-K1
 for qemu-devel@nongnu.org; Sat, 23 Nov 2019 08:59:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GeGql1TcokcqhB1PpkqZCLPBf7uHcbNpD3+tgDi/4/s=; b=dZVOC+h/lHAhE9EI6bjrP0iFng
 xOwzKKXvHygkTiUcvm1zikt9DzaGT20iURpsLmcXXCwNHeIGbiFSjREXAiO8Ts+HyocEUuA1nfXpv
 bDMGlxGJoRjAxHb2/Kz52xRHYrkyyuVzHdq4pgvmtecnzaHGvFgDYcWut0nhn+pcF+Gw=;
Received: from [2a01:4f8:121:41fa::170] (helo=stackframe.org)
 by smtp.duncanthrax.net with esmtpa (Exim 4.90_1)
 (envelope-from <svens@stackframe.org>)
 id 1iYVwf-0008Un-AZ; Sat, 23 Nov 2019 14:59:29 +0100
Date: Sat, 23 Nov 2019 14:59:29 +0100
From: Sven Schnelle <svens@stackframe.org>
To: Richard Henderson <rth@twiddle.net>
Subject: Re: [PATCH v4 0/6] HPPA: i82596, PS/2 and graphics emulation
Message-ID: <20191123135928.GA5553@stackframe.org>
References: <20191103205607.6590-1-svens@stackframe.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191103205607.6590-1-svens@stackframe.org>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a01:4f8:121:41fa::169
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
Cc: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, Nov 03, 2019 at 09:56:01PM +0100, Sven Schnelle wrote:
> Hi,
> 
> these series adds quite a lot to the HPPA emulation in QEMU:
> i82596 emulation from Helge, PS/2 and Artist graphics emulation.
> [..]

Ping? :-)

Regards
Sven

