Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8370ECAF5A
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Oct 2019 21:38:16 +0200 (CEST)
Received: from localhost ([::1]:39600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iG6vV-00073W-5B
	for lists+qemu-devel@lfdr.de; Thu, 03 Oct 2019 15:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51639)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <msuchanek@suse.de>) id 1iG6qT-00051z-8T
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 15:33:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <msuchanek@suse.de>) id 1iG6qS-0004dE-5E
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 15:33:00 -0400
Received: from mx2.suse.de ([195.135.220.15]:36128 helo=mx1.suse.de)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <msuchanek@suse.de>) id 1iG6qR-0004cP-VQ
 for qemu-devel@nongnu.org; Thu, 03 Oct 2019 15:33:00 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx1.suse.de (Postfix) with ESMTP id 8CEA8AF87;
 Thu,  3 Oct 2019 19:32:56 +0000 (UTC)
Date: Thu, 3 Oct 2019 21:32:55 +0200
From: Michal =?iso-8859-1?Q?Such=E1nek?= <msuchanek@suse.de>
To: Mauricio Galindo <up.mauricio.g@gmail.com>
Subject: Re: QEMU user mode execve
Message-ID: <20191003193255.GJ17916@kitsune.suse.cz>
References: <CAOx2=+fZ4O_=8jU+XfDvjKVt_=kNyyKEW0UL6jxZQ_qenF76FQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOx2=+fZ4O_=8jU+XfDvjKVt_=kNyyKEW0UL6jxZQ_qenF76FQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 195.135.220.15
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

On Thu, Oct 03, 2019 at 10:48:46AM -0700, Mauricio Galindo wrote:
> Hi,
> 
> I'm running QEMU in user mode and I'm running into issues when trying
> to exec binaries within the emulated process given that binaries are
> expected to run in the native architecture. Would it be useful to have
> an option to rewrite execve(/bin/some_binary, ...) to
> execve(qemu-$arch-static, [/bin/some_binary, ...], ...)?
> 

This is handled in kernel by binfmt-misc.

Debian has nice packaging for the required configuration. They use it to
create non-native installation images.

HTH

Michal

