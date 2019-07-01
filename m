Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A0D85A5D0
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jun 2019 22:21:37 +0200 (CEST)
Received: from localhost ([::1]:36160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hgxNI-0000yP-Fv
	for lists+qemu-devel@lfdr.de; Fri, 28 Jun 2019 16:21:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42923)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hgxKk-0000Jt-HM
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 16:19:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hgxKh-0004TF-Fd
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 16:18:58 -0400
Received: from mx1.redhat.com ([209.132.183.28]:43708)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hgxKh-0004R7-0S
 for qemu-devel@nongnu.org; Fri, 28 Jun 2019 16:18:55 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E6852308792B
 for <qemu-devel@nongnu.org>; Fri, 28 Jun 2019 20:18:52 +0000 (UTC)
Received: from localhost (ovpn-116-7.gru2.redhat.com [10.97.116.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 51D626012D;
 Fri, 28 Jun 2019 20:18:47 +0000 (UTC)
Date: Fri, 28 Jun 2019 17:18:46 -0300
From: Eduardo Habkost <ehabkost@redhat.com>
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Message-ID: <20190628201846.GK1862@habkost.net>
References: <20190628150217.32659-1-wainersm@redhat.com>
 <20190628150217.32659-4-wainersm@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190628150217.32659-4-wainersm@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Fri, 28 Jun 2019 20:18:52 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH 3/3] tests/acceptance: Add boot linux with
 kvm test
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
Cc: philmd@redhat.com, jsnow@redhat.com, qemu-devel@nongnu.org,
 crosa@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jun 28, 2019 at 11:02:17AM -0400, Wainer dos Santos Moschetta wrote:
> Until now the suite of acceptance tests doesn't exercise
> QEMU with kvm enabled. So this introduces a simple test
> that boots the Linux kernel and checks it boots on the
> accelerator correctly.
> 
> Signed-off-by: Wainer dos Santos Moschetta <wainersm@redhat.com>

Why not just change the existing test_x86_64_pc() test case to
use KVM by default?  We can use "accel=kvm:tcg" to allow it to
fall back to TCG if KVM is not available.

-- 
Eduardo

