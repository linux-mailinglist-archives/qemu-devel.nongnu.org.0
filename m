Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E1703AD643
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 02:28:50 +0200 (CEST)
Received: from localhost ([::1]:60992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luOqv-0002zx-Ch
	for lists+qemu-devel@lfdr.de; Fri, 18 Jun 2021 20:28:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adam.s@Safe-mail.net>)
 id 1luNP4-0002Dz-Bk
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 18:55:58 -0400
Received: from mango.safe-mail.net ([212.29.227.83]:47306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <adam.s@Safe-mail.net>)
 id 1luNP2-0000Fi-Sb
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 18:55:58 -0400
Received: by mango.safe-mail.net with Safe-mail (Exim 4.84)
 (envelope-from <adam.s@Safe-mail.net>) id 1luNP0-0008Hk-4E
 for qemu-devel@nongnu.org; Fri, 18 Jun 2021 18:55:54 -0400
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=N1-0105; d=Safe-mail.net;
 b=E2zI5i7BehBPRIapH+DOXo/kCVTjEr7iNkzbtvSs76L02bAZo4/TiK5ytqNV4vxt
 HQnCYuPJKYBWRUl8wSm1KqzPDaKmRnesGmOFatRSqlGNk+J46GnPhItzC2w76MU4
 1gM/DIUDow7RxVs0GqQrcTDxcT1pEkdwWLc1M/zjESM=;
Received: from pc ([185.12.45.115]) by Safe-mail.net with https
Subject: Shortcoming (oversight) in Windows installer
Date: Fri, 18 Jun 2021 18:55:53 -0400
From: adam.s@Safe-mail.net
To: qemu-devel@nongnu.org
X-SMType: Regular
X-SMRef: N1M-_seQmbowoO
Message-Id: <N1M-_seQmbowoO@Safe-mail.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-SMSignature: PlwDyq1LgRNL6/5Y8eyvqwTOZ2tHe4A9SayUIGfNltuJo8rj/7bi6kjzgSOvjJ1j
 cWpcIwxX2I3PmpPwSFWfsVwfUachMsvSCdVy8x2AhKnT8AHbu4Pk/GAKrPjm3pAi
 Rd+OU5taAz5CNZ+D6bjjpgXH8AqYmglMEv+Oe+Z3M9g=
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

I'm new and can't use GitHub/GitLab, but I noticed this about the Windows installer:

Does not add (nor offer to add) "C:\Program Files\qemu" to path.

It should maybe be an optional choice in the installer.

Have a wonderful day!

