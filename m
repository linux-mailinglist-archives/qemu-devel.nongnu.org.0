Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C3DA6128D3D
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Dec 2019 09:43:57 +0100 (CET)
Received: from localhost ([::1]:45436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iiwqC-0000db-56
	for lists+qemu-devel@lfdr.de; Sun, 22 Dec 2019 03:43:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34693)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <svens@stackframe.org>) id 1iiwlv-0008Om-5q
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 03:39:32 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <svens@stackframe.org>) id 1iiwlu-0008W8-1E
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 03:39:30 -0500
Received: from shroom.duncanthrax.net ([2a01:4f8:121:41fa::169]:42135
 helo=smtp.duncanthrax.net)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <svens@stackframe.org>)
 id 1iiwls-0008HH-5v
 for qemu-devel@nongnu.org; Sun, 22 Dec 2019 03:39:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=duncanthrax.net; s=dkim; h=In-Reply-To:Content-Type:MIME-Version:References
 :Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
 :Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9p2jd+eT34CoUFI2kd/O5V5VLxm3cOPnfILKZtS70SU=; b=EcT8d/wTRZyJPIBNp3k7ftGRzm
 XlKLPmBMH1zKpHf2r4gnSgbaf9qPEPT/St5STjPtpHb5ywfTukgCp10JQMoH1luQtMb/kb3MRy5AQ
 E6rQr79rZOWQ/aZI2GZMt4aJvcDJmxPeZJuVZLuZTSBFafl6EMgJuOgbSoz4e4C+nTHo=;
Received: from hsi-kbw-046-005-233-221.hsi8.kabel-badenwuerttemberg.de
 ([46.5.233.221] helo=t470p.stackframe.org)
 by smtp.duncanthrax.net with esmtpa (Exim 4.90_1)
 (envelope-from <svens@stackframe.org>)
 id 1iiwlk-0002ZM-Ad; Sun, 22 Dec 2019 09:39:20 +0100
Date: Sun, 22 Dec 2019 09:39:20 +0100
From: Sven Schnelle <svens@stackframe.org>
To: Helge Deller <deller@gmx.de>
Subject: Re: [PATCH 1/2] hppa: Do not enable artist graphics with -nographic
 option
Message-ID: <20191222083920.GA11405@t470p.stackframe.org>
References: <20191220211512.3289-1-svens@stackframe.org>
 <20191221222205.GA27749@ls3530.fritz.box>
 <20191221222402.GA27803@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191221222402.GA27803@ls3530.fritz.box>
User-Agent: Mutt/1.12.2 (2019-09-21)
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
Cc: qemu-devel@nongnu.org, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Helge,

On Sat, Dec 21, 2019 at 11:24:02PM +0100, Helge Deller wrote:
> When qemu was started with the -nographic option, do not enable the
> artist graphic card emulation.

Hmm, isn't '-nographic -vnc' a valid option that wouldn't work anymore in that
case? I used '-nographic -vga none' to disable Artist.

Regards
Sven

