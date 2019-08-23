Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16B539B696
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Aug 2019 21:03:27 +0200 (CEST)
Received: from localhost ([::1]:32994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1EqL-0001pj-Ed
	for lists+qemu-devel@lfdr.de; Fri, 23 Aug 2019 15:03:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42081)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <wouter@grep.be>) id 1i1EcG-0005KW-Al
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 14:48:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <wouter@grep.be>) id 1i1EcF-0007jQ-5T
 for qemu-devel@nongnu.org; Fri, 23 Aug 2019 14:48:52 -0400
Received: from latin.grep.be ([2a01:4f8:140:52e5::2]:56902)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <wouter@grep.be>)
 id 1i1EcB-0007cf-PW; Fri, 23 Aug 2019 14:48:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=grep.be;
 s=2017.latin; h=Sender:In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e7wsTJl6QOI6Q9EVw8/xuD/OXkt0OO7+/npHSalZAOk=; b=eRyW0p+n3tRTBjYatAmew90oW5
 L96WaLsHDyHrYcsbyL/XiS42jANqpZ1YYrkqr+X1fdZ6lcqYLiLtp0O/QqBbZWp5FpsbfmRKa+Gsn
 q0ogvdpjphgUzx7yVcNuc2NOIoro/pnCvBSpgC8bBK9/OB3ZrZr6ulOd03OAQcTweSvsxvSPPUWGV
 320ptQcOFUmtlgoz+DsCFtULa7KU7aKXdDeMj32W44+LfVFIgesz6Waa/sqI7t1YwgEyLHG81Xq29
 ZvBEfBmgpu8e8cR6uzUSx26ynBKMeivpsFeurFarmRriyCaYCGktsA6NbfoepFW/JKq4sD7dGLPiT
 KjcJVkXw==;
Received: from wouter by latin.grep.be with local (Exim 4.89)
 (envelope-from <wouter@grep.be>)
 id 1i1Eby-0003hv-Q2; Fri, 23 Aug 2019 20:48:34 +0200
Date: Fri, 23 Aug 2019 20:48:34 +0200
From: Wouter Verhelst <w@uter.be>
To: Eric Blake <eblake@redhat.com>
Message-ID: <20190823184834.brhsfbc4sdq5xuij@grep.be>
References: <25ead363-4f37-5450-b985-1876374e314d@redhat.com>
 <20190823143426.26838-1-eblake@redhat.com>
 <20190823143426.26838-2-eblake@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190823143426.26838-2-eblake@redhat.com>
X-Speed: Gates' Law: Every 18 months, the speed of software halves.
User-Agent: NeoMutt/20170113 (1.7.2)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a01:4f8:140:52e5::2
Subject: Re: [Qemu-devel] [PATCH 1/1] protocol: Add NBD_CMD_FLAG_FAST_ZERO
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
Cc: libguestfs@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 nbd@other.debian.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 23, 2019 at 09:34:26AM -0500, Eric Blake wrote:
> +- bit 4, `NBD_CMD_FLAG_FAST_ZERO`; valid during
> +  `NBD_CMD_WRITE_ZEROES`. If set, but the server cannot perform the
> +  write zeroes any faster than it would for an equivalent
> +  `NBD_CMD_WRITE`,

One way of fulfilling the letter of this requirement but not its spirit
could be to have background writes; that is, the server makes a note
that the zeroed region should contain zeroes, makes an error-free reply
to the client, and then starts updating things in the background (with
proper layering so that an NBD_CMD_READ would see zeroes).

This could negatively impact performance after that command to the
effect that syncing the device would be slower rather than faster, if
not done right.

Do we want to keep that in consideration?

-- 
<Lo-lan-do> Home is where you have to wash the dishes.
  -- #debian-devel, Freenode, 2004-09-22

