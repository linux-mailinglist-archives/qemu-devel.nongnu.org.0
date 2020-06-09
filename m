Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7B0F1F39C2
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Jun 2020 13:31:36 +0200 (CEST)
Received: from localhost ([::1]:55158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jicTf-00053A-CD
	for lists+qemu-devel@lfdr.de; Tue, 09 Jun 2020 07:31:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36156)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurens.nikolaisen@posteo.de>)
 id 1jicSb-0004Uw-F6
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 07:30:29 -0400
Received: from mout01.posteo.de ([185.67.36.65]:35750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurens.nikolaisen@posteo.de>)
 id 1jicSZ-0004mU-88
 for qemu-devel@nongnu.org; Tue, 09 Jun 2020 07:30:29 -0400
Received: from submission (posteo.de [89.146.220.130]) 
 by mout01.posteo.de (Postfix) with ESMTPS id B936C16005C
 for <qemu-devel@nongnu.org>; Tue,  9 Jun 2020 13:30:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.de; s=2017;
 t=1591702222; bh=/mZOvfDoG4XrkgJUoF3x3ob5rjPz4anPH+TcavfR/CQ=;
 h=Date:From:To:Subject:From;
 b=olX5LCQbfBNThjVrqMRsM1719IbI8Pku7W5OlamRl0e5WVWqDiSYWH1YAFMEm5bcu
 Ea+kp50YusmoO5kWyDfESboeGvzq4sRyJ2jYcn1CIGrsZ0GBb0KlDB+MVBexRy6OHe
 3IWq5Wu5DFY/RqI+rEslskaaOTiP1nvbkcyDlHArD9qeE4MWapet85hHxHhg/bjcEg
 ZBOiPK5Y8pXXvvWtO05beyXquacojTjqYW37Aj8dtUr0gwHKWatal1slraLD6XqYKT
 6rOq0vbWX6vgrEb98eLny5z3IJX/uWW2ILwqJFvqHtFvAx50qTgs0hH8yx8DC5+TgJ
 fPGAmzBh31o1g==
Received: from customer (localhost [127.0.0.1])
 by submission (posteo.de) with ESMTPSA id 49h7G62KY5z9rxQ
 for <qemu-devel@nongnu.org>; Tue,  9 Jun 2020 13:30:22 +0200 (CEST)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 09 Jun 2020 13:30:22 +0200
From: laurens.nikolaisen@posteo.de
To: qemu-devel@nongnu.org
Subject: Using QXL & Spice with Windows Host & QEMU
Message-ID: <ba26c2d65cda15b581c1a7cc7274d1b2@posteo.de>
X-Sender: laurens.nikolaisen@posteo.de
User-Agent: Posteo Webmail
Received-SPF: pass client-ip=185.67.36.65;
 envelope-from=laurens.nikolaisen@posteo.de; helo=mout01.posteo.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/09 07:30:23
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hello everyone,

when using Qemu 4.2.0 with a Windows host, qemu-system-x86_64 reports:
"QXL VGA not available"

I used the following Qemu args for testing:
qemu-system-x86-x64.exe -accel hax -machine q35 -m 4GB -cdrom
xubuntu-20.04-desktop-amd64.iso

Using either "-vga stdt" or "-vga vmware" works. The performance is just
not that good.

Do I have a chance to get spice & QXL up and running with a Windows 10 
host and
Qemu?

Thanks!
Laurens

