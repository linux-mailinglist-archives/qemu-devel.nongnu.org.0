Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9382DE418
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Dec 2020 15:34:55 +0100 (CET)
Received: from localhost ([::1]:39118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqGqM-0002Gn-BO
	for lists+qemu-devel@lfdr.de; Fri, 18 Dec 2020 09:34:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1kqGoP-00015g-Os; Fri, 18 Dec 2020 09:32:54 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:56798
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1kqGoN-0007Og-9J; Fri, 18 Dec 2020 09:32:53 -0500
Received: from basile.remlab.net (dzyqn8ypzhx7l91mxjsvy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:a01a:be01:9434:f69e:d553:3be2])
 (Authenticated sender: remi)
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id BC81C5FC85;
 Fri, 18 Dec 2020 15:32:47 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi.denis.courmont@huawei.com>
To: qemu-arm@nongnu.org
Subject: [RFC][PATCH 0/3] ARMv8.4-TTST extension
Date: Fri, 18 Dec 2020 16:32:45 +0200
Message-ID: <7884934.NyiUUSuA9g@basile.remlab.net>
Organization: Huawei Technologies, Finland
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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

	Hello,

The following changes since commit 6d3fd902ab9c4d6762532d4b5cce2275e458aa32:

  target/arm: refactor vae1_tlbmask() (2020-12-18 12:27:56 +0200)

follow. They add support for small translation tables, allowing for=20
translation regimes as small as 16-bits. This extension is nominally a=20
required dependency of Secure EL2.

=2D---------------------------------------------------------------
R=C3=A9mi Denis-Courmont (3):
      target/arm: keep translation start level unsigned
      target/arm: ARMv8.4-TTST extension
      target/arm: enable Small Translation tables in max CPU

 target/arm/cpu.h    |  5 +++++
 target/arm/cpu64.c  |  1 +
 target/arm/helper.c | 25 +++++++++++++++----------
 3 files changed, 21 insertions(+), 10 deletions(-)

=2D-=20
R=C3=A9mi Denis-Courmont



