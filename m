Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44A3B3AD642
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 02:28:50 +0200 (CEST)
Received: from localhost ([::1]:32774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luOqu-00030N-Td
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 20:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33146)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adam.s@Safe-mail.net>)
 id 1luNNa-00023r-PD
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 18:54:26 -0400
Received: from mango.safe-mail.net ([212.29.227.83]:45928)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adam.s@Safe-mail.net>)
 id 1luNNW-0007XG-Ec
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 18:54:25 -0400
Received: by mango.safe-mail.net with Safe-mail (Exim 4.84)
 (envelope-from <adam.s@Safe-mail.net>) id 1luNNG-0008C8-Pv
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 18:54:06 -0400
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=N1-0105; d=Safe-mail.net;
 b=Wrey7MlZRpLXAafdcSj45LPly1X6XCQr1U3cfYdpBVENy5v2YSB8FEt9Pwd4ok/b
 3uGAOgQUphE9gBPxXi4LT8Tm1tigcAMjmrn7/GcZOjRxG3HGU0dst+vaPkkwPEBJ
 8hATbGbk4RUdWBkk9kAs5MkZxkGDdmu26do/KmXnTus=;
Received: from pc ([179.43.160.237]) by Safe-mail.net with https
Subject: [qemu-web PATCH] (typo)
Date: Fri, 18 Jun 2021 18:54:06 -0400
From: adam.s@Safe-mail.net
To: qemu-devel@nongnu.org
X-SMType: Regular
X-SMRef: N1M-F0ZZCF3yks
Message-Id: <N1M-F0ZZCF3yks@Safe-mail.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-SMSignature: jQttqX/8qmlsdiSPuHSSFr4Dz2R/YyAdJI5/ud2gAA7zPCiS1ibHZz0nsKniFN8t
 9XCjSPmiJy6RBzxfmdNqlBjfehCeDPFLBBzTv1tDCNg5x6jeTC9kpOd0ozDaLZuR
 +oUeWwUmKgUWEBkMgUb6e4uNAKoAkO+E8CRwy01DnAk=
Received-SPF: pass client-ip=212.29.227.83; envelope-from=adam.s@Safe-mail.net;
 helo=mango.safe-mail.net
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 18 Jun 2021 20:27:24 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello,

Sorry I cannot use github/gitlab.

I'm new to QEMU but I found this typo (mismatched braces) in the *installed* HTML manual:

In: "file:///C:/Program%20Files/qemu/share/doc/tools/qemu-img.html"
This should *not* have ending ']':

measure [--output=OFMT] [-O OUTPUT_FMT] [-o OPTIONS] [--size N | [--object OBJECTDEF] [--image-opts] [-f FMT] [-l SNAPSHOT_PARAM] FILENAME]

