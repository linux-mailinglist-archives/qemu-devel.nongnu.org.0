Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7504BD2B3E
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 15:26:00 +0200 (CEST)
Received: from localhost ([::1]:39476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIYS7-0002vx-40
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 09:25:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40640)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <groug@kaod.org>) id 1iIYJV-0001BM-4a
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 09:17:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <groug@kaod.org>) id 1iIYJT-0002Nk-Mw
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 09:17:04 -0400
Received: from 6.mo6.mail-out.ovh.net ([87.98.177.69]:47666)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <groug@kaod.org>) id 1iIYJT-0002Mz-Fv
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 09:17:03 -0400
Received: from player772.ha.ovh.net (unknown [10.109.159.140])
 by mo6.mail-out.ovh.net (Postfix) with ESMTP id 09A5E1E50AE
 for <qemu-devel@nongnu.org>; Thu, 10 Oct 2019 15:17:00 +0200 (CEST)
Received: from kaod.org (deibp9eh1--blueice1n4.emea.ibm.com [195.212.29.166])
 (Authenticated sender: groug@kaod.org)
 by player772.ha.ovh.net (Postfix) with ESMTPSA id 5DBF9ACB3692;
 Thu, 10 Oct 2019 13:16:59 +0000 (UTC)
Date: Thu, 10 Oct 2019 15:16:56 +0200
From: Greg Kurz <groug@kaod.org>
To: qemu-devel@nongnu.org
Subject: Re: [PULL 0/4] 9p patches 2019-10-08
Message-ID: <20191010151656.5aec944b@bahia.lan>
In-Reply-To: <20191008151925.1021706-1-groug@kaod.org>
References: <20191008151925.1021706-1-groug@kaod.org>
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Ovh-Tracer-Id: 3408099020807444800
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedufedrieefgdeihecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 87.98.177.69
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Peter,

As said on IRC, please ignore this PR, I'm about to post a v2.
Sorry for the noise.

Cheers,

--
Greg

On Tue,  8 Oct 2019 17:19:21 +0200
Greg Kurz <groug@kaod.org> wrote:

> The following changes since commit 0f0b43868a566068fc137632fd51bd3cbb23f350:
> 
>   Merge remote-tracking branch 'remotes/dgibson/tags/ppc-for-4.2-20191004' into staging (2019-10-07 13:49:02 +0100)
> 
> are available in the Git repository at:
> 
>   https://github.com/gkurz/qemu.git tags/9p-next-2019-10-08
> 
> for you to fetch changes up to bc6c3cbf43dcc55e34e05bfcbd302bf1a4b92af7:
> 
>   9p: Treat multiple devices on one export as an error (2019-10-08 11:50:11 +0200)
> 
> ----------------------------------------------------------------
> The most notable change is to detect cross-device setups and warn the
> user that this may result in inode number collisions and chaos in the
> guest. The rest is cosmetic cleanup.
> 
> ----------------------------------------------------------------
> Antonios Motakis (2):
>       9p: unsigned type for type, version, path
>       9p: Treat multiple devices on one export as an error
> 
> Greg Kurz (2):
>       9p: Simplify error path of v9fs_device_realize_common()
>       fsdev: Add return value to fsdev_throttle_parse_opts()
> 
>  fsdev/9p-marshal.h          |  6 +--
>  fsdev/qemu-fsdev-throttle.c |  4 +-
>  fsdev/qemu-fsdev-throttle.h |  2 +-
>  hw/9pfs/9p-local.c          |  7 +++-
>  hw/9pfs/9p-proxy.c          |  4 ++
>  hw/9pfs/9p.c                | 92 ++++++++++++++++++++++++++++++++-------------
>  hw/9pfs/9p.h                |  1 +
>  hw/9pfs/trace-events        | 14 +++----
>  8 files changed, 88 insertions(+), 42 deletions(-)


