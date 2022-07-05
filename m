Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73B15566FC1
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 15:47:36 +0200 (CEST)
Received: from localhost ([::1]:52470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8itr-0008QV-5s
	for lists+qemu-devel@lfdr.de; Tue, 05 Jul 2022 09:47:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1787b3430=anthony.perard@citrix.com>)
 id 1o8isJ-00072X-5X
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 09:45:59 -0400
Received: from esa5.hc3370-68.iphmx.com ([216.71.155.168]:6591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1787b3430=anthony.perard@citrix.com>)
 id 1o8isG-0005vu-EB
 for qemu-devel@nongnu.org; Tue, 05 Jul 2022 09:45:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1657028756;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qcCujpW1laCRx6HG0EE++dHXD/PBYlYk85TV903qXCI=;
 b=bDvl6H7M3DSVKcGzv1T5HbsUFT5KF4FDfGK4czvKD4n/JEprxRp/0Opc
 Q66hg2Tn74cd7cB0UEZzlribxGM2u3T8jIm+wQNT3/XG8a0I7gxZHJdVV
 X5f0tvU2l9rzk2xMrVex60kXZXr9mq2HnF1ViNPGipHOq12VXuIs+ax2r I=;
Authentication-Results: esa5.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 74420397
X-Ironport-Server: esa5.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:ThNsCK6ZaNQMmrbS36pzAQxRtJDGchMFZxGqfqrLsTDasY5as4F+v
 mNKXGGOPPaJZGv1ctt3aIvio09SvZSHz99mG1c9/itmHi5G8cbLO4+Ufxz6V8+wwmwvb67FA
 +E2MISowBUcFyeEzvuVGuG96yE6j8lkf5KkYAL+EnkZqTRMFWFw03qPp8Zj2tQy2YfhXlvX0
 T/Pi5a31GGNimYc3l08s8pvmDs31BglkGpF1rCWTakjUG72zxH5PrpGTU2CByKQrr1vNvy7X
 47+IISRpQs1yfuP5uSNyd4XemVSKlLb0JPnZnB+A8BOiTAazsA+PzpS2FPxpi67hh3Q9+2dx
 umhurToazYwYaT2odgNUhNJLX5fGqMY9vz+dC3XXcy7lyUqclPpyvRqSko3IZcZ6qB8BmQmG
 f4wcW5XKErZ3qTvnez9GrIEascLdaEHOKsWvG1gyjfIS+4rW5nZT43B5MNC3Sd2jcdLdRrbT
 5VFNWA3N0WfC/FJEgwlEMMjpsCNvUTAUTQFlU6X4pUdx1GGmWSd15CyaYGIK7RmX/59h0udu
 yfK8nr0BjkcM9qQzyfD9Wij7tIjhguiBthUTufhsKc33hvDnQT/FSH6S3Pjg8ig1UeEYu5PK
 kYFxHUPiqZs+g+SG4yVswKDnJKUgvINc4MOTrNks1Dcm/O8DxWxXTZdEGMYADAynIpvHGFxi
 AfU9z/8LWY32IB5X05x4Vt9QdmaHSEOZVEPaiYfJefuy4my+dpj5v4jozsKLUJUsjEWMWupq
 9xyhHJi74j/dOZSv0lBwXjJgii3ur/CRRMv6wPcUwqNt10kOt/4NtzxuASDtJ6sybp1qXHY5
 RA5dzW2trhSXflhagTXKAnyIF1Zz6nca2CN6bKeN5Ig6y6s6xaeQGyk2xknfB0BGp9dIVfBO
 RaP0SsMtcQ7FCb7MsdKj3eZVp1CIV7IToy1CJg5r7NmP/BMSeNw1HgxOhHKhz6yyhhEfGNWE
 c7zTPtAxE0yUcxPpAdajc9HuVP37kjSHV/ueK0=
IronPort-HdrOrdr: A9a23:CJ0ly6y9A2kE6qh5WYu8KrPwIL1zdoMgy1knxilNoRw8SKKlfq
 eV7ZAmPH7P+VAssR4b+exoVJPtfZq+z+8R3WByB8bAYOCOggLBR+sO0WKL+UyGJ8SUzI9gPM
 lbHJSWcOeAb2RHsQ==
X-IronPort-AV: E=Sophos;i="5.92,247,1650945600"; d="scan'208";a="74420397"
To: <qemu-devel@nongnu.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PULL 0/2] xen queue
Date: Tue, 5 Jul 2022 14:45:34 +0100
Message-ID: <20220705134536.11109-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=216.71.155.168;
 envelope-from=prvs=1787b3430=anthony.perard@citrix.com;
 helo=esa5.hc3370-68.iphmx.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>

The following changes since commit 19361471b59441cd6f2aa22d4fbee7a6e9e76586:

  Merge tag 'pull-la-20220705' of https://gitlab.com/rth7680/qemu into staging (2022-07-05 16:30:52 +0530)

are available in the Git repository at:

  https://xenbits.xen.org/git-http/people/aperard/qemu-dm.git tags/pull-xen-20220705

for you to fetch changes up to c0e86b7624cb9d6db03e0d48cf82659e5b89a6a6:

  xen/pass-through: don't create needless register group (2022-07-05 14:19:48 +0100)

----------------------------------------------------------------
Xen patches

- Xen PCI passthrough fixes

----------------------------------------------------------------
Chuck Zmudzinski (2):
      xen/pass-through: merge emulated bits correctly
      xen/pass-through: don't create needless register group

 hw/xen/xen_pt_config_init.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

