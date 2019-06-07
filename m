Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F71939403
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 20:10:39 +0200 (CEST)
Received: from localhost ([::1]:50010 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZJK1-0002Xk-OT
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 14:10:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53530)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <crosa@redhat.com>) id 1hZH0Q-0003br-KU
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 11:42:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <crosa@redhat.com>) id 1hZGlr-0000VC-9v
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 11:27:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:12442)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <crosa@redhat.com>) id 1hZGlq-0007Yj-8L
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 11:27:11 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id D9F966E769;
 Fri,  7 Jun 2019 15:26:32 +0000 (UTC)
Received: from localhost.localdomain (ovpn-122-62.rdu2.redhat.com
 [10.10.122.62])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 00EB610D8236;
 Fri,  7 Jun 2019 15:26:22 +0000 (UTC)
Date: Fri, 7 Jun 2019 11:26:20 -0400
From: Cleber Rosa <crosa@redhat.com>
To: qemu-devel@nongnu.org
Message-ID: <20190607152620.GA9665@localhost.localdomain>
References: <20190607152223.9467-1-crosa@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190607152223.9467-1-crosa@redhat.com>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.25]); Fri, 07 Jun 2019 15:26:32 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 0/8] Miscellaneous acceptance test and
 Travis CI improvements
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
Cc: Fam Zheng <fam@euphon.net>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 07, 2019 at 11:22:15AM -0400, Cleber Rosa wrote:
> This is a collection of small improvements to some of the acceptance
> tests, and the Travis CI experience.
> 
> The main goal was to make tests a bit more robust when run in parallel
> (an Avocado feature pending review), and Travis CI diagnostics better
> by printing out the full Avocado job log when any error or test
> failure occurs.

Forgot to add these hopefully useful pointers:

Git Info:
  - URI: https://github.com/clebergnu/qemu/tree/misc_tests_improvements
  - Remote: https://github.com/clebergnu/qemu
  - Branch: misc_tests_improvements

Travis CI Info:
  - Build: https://travis-ci.org/clebergnu/qemu/builds/542815049
  - Job: https://travis-ci.org/clebergnu/qemu/jobs/542815074

Regards,
- Cleber.

> 
> Cleber Rosa (8):
>   Travis: print acceptance tests logs in case of job failure
>   tests/requirements.txt: pin paramiko version requirement
>   Acceptance tests: drop left over usage of ":avocado: enable"
>   Boot Linux Console Test: add a test for ppc64 + pseries
>   VNC Acceptance test: use UNIX domain sockets to avoid port collisions
>   VNC Acceptance test: simplify test names
>   VNC Acceptance test: check protocol version
>   Migration acceptance test: reduce the possibility of port collisions
> 
>  .travis.yml                            |  4 ++-
>  tests/acceptance/boot_linux_console.py | 19 ++++++++++++++
>  tests/acceptance/migration.py          |  5 +---
>  tests/acceptance/vnc.py                | 36 +++++++++++++++++++++++---
>  tests/requirements.txt                 |  2 +-
>  5 files changed, 56 insertions(+), 10 deletions(-)
> 
> -- 
> 2.21.0
> 

