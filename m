Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7A6443AC0
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 02:13:45 +0100 (CET)
Received: from localhost ([::1]:47436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi4qW-0002nP-Ii
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 21:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mi4pB-0001y1-WB; Tue, 02 Nov 2021 21:12:22 -0400
Received: from zero.eik.bme.hu ([2001:738:2001:2001::2001]:45918)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1mi4p8-0003vy-BG; Tue, 02 Nov 2021 21:12:21 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id B941F746353;
 Wed,  3 Nov 2021 02:12:11 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 904F7746333; Wed,  3 Nov 2021 02:12:11 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 8B8A87462D3;
 Wed,  3 Nov 2021 02:12:11 +0100 (CET)
Date: Wed, 3 Nov 2021 02:12:11 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Laurent Vivier <laurent@vivier.eu>
Subject: Re: [PULL 0/4] Trivial branch for 6.2 patches
In-Reply-To: <20211102232212.2911638-1-laurent@vivier.eu>
Message-ID: <1de94126-c15f-1040-a254-3c49b95189d@eik.bme.hu>
References: <20211102232212.2911638-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-602452773-1635901931=:80404"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=2001:738:2001:2001::2001;
 envelope-from=balaton@eik.bme.hu; helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-602452773-1635901931=:80404
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 3 Nov 2021, Laurent Vivier wrote:
> The following changes since commit af531756d25541a1b3b3d9a14e72e7fedd941a2e:
>
>  Merge remote-tracking branch 'remotes/philmd/tags/renesas-20211030' into staging (2021-10-30 11:31:41 -0700)
>
> are available in the Git repository at:
>
>  git://github.com/vivier/qemu.git tags/trivial-branch-for-6.2-pull-request
>
> for you to fetch changes up to 5d2bd73588d14b5868129ace9c7912a777f06753:
>
>  hw/input/lasips2: Fix typos in function names (2021-10-31 21:05:40 +0100)
>
> ----------------------------------------------------------------
> Trivial patches branch pull request 20211101 v2

Did you see this one?
https://patchew.org/QEMU/20211030095225.513D4748F48@zero.eik.bme.hu/

Could somebody take it please?

Regards,
BALATON Zoltan

> ----------------------------------------------------------------
>
> Markus Armbruster (1):
>  monitor: Trim some trailing space from human-readable output
>
> Philippe Mathieu-Daudé (2):
>  MAINTAINERS: Split HPPA TCG vs HPPA machines/hardware
>  hw/input/lasips2: Fix typos in function names
>
> Yanan Wang (1):
>  hw/core/machine: Add the missing delimiter in cpu_slot_to_string()
>
> MAINTAINERS                | 5 ++---
> hw/core/machine.c          | 3 +++
> hw/input/lasips2.c         | 8 ++++----
> monitor/hmp-cmds.c         | 2 +-
> target/i386/cpu-dump.c     | 4 ++--
> target/i386/cpu.c          | 2 +-
> target/ppc/cpu_init.c      | 2 +-
> target/s390x/cpu_models.c  | 4 ++--
> target/xtensa/mmu_helper.c | 2 +-
> 9 files changed, 17 insertions(+), 15 deletions(-)
>
> --
> 2.31.1
>
>
>
--3866299591-602452773-1635901931=:80404--

