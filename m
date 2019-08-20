Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D38C95AFE
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Aug 2019 11:29:29 +0200 (CEST)
Received: from localhost ([::1]:35330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i00SG-0007IX-Go
	for lists+qemu-devel@lfdr.de; Tue, 20 Aug 2019 05:29:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36433)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pahome.chen@mirlab.org>) id 1i00Qe-00060C-1d
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 05:27:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pahome.chen@mirlab.org>) id 1i00Qd-0005h9-3E
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 05:27:47 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:40037)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pahome.chen@mirlab.org>)
 id 1i00Qc-0005f5-Kb
 for qemu-devel@nongnu.org; Tue, 20 Aug 2019 05:27:47 -0400
Received: by mail-ed1-x534.google.com with SMTP id h8so5528352edv.7
 for <qemu-devel@nongnu.org>; Tue, 20 Aug 2019 02:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mirlab-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=ARd9oWPopZoEGUEHHdg1iGQ2jVmaHgB8cd8mIuyhZXA=;
 b=NBZKGrWnv2I8qt0dwz5CP80ak6cN2vRK5+T0zil9rkxDu22QeN/e/LScLG3j58Yvv+
 GWsvvAm5G4pBJqfKOLZoeK9QuZC+awuJQAPlA7lzlFCesJ5aGrdy5KJUx5jq737eziXq
 xR+rDW/gpR87i9lxjf7XiGh7aHcO9TP5mZzn8lWA4a8R15Y9HRPk7HS0ha15aRw2gyqk
 ALR2Uc0HC4Zfh4O51y5I4zSVr81HJbPNNNjBkhswcZVR4OhtyUfE+3CV0DTfRaNNQjik
 ECMY9p8qVCpV9RYbsR/ottwXom66Kqlmh3wAe/SGveOvRvDyAnQE98nXaXyGTzpKeLpb
 EP4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ARd9oWPopZoEGUEHHdg1iGQ2jVmaHgB8cd8mIuyhZXA=;
 b=ohJoV+U+dSEVIT025dpbGJocHKhgPszYLb84JEGP0QJ0w5imD1ty5ebwhaFuEHZ22/
 msJGBB1CMpkMApIvftG6J/gc0F/3viZama+GAA8FfrA6WzkAd82pZ0o8K6HCRLFLl7/J
 IXeSMg1uStmc9/1rwozuBOtYLan2mc4xSTSAVEkP75org5tcuUM+uagDgaOZJKeqdz2P
 wWr7lwAmugd4G6hgq/w5Oh1WhGWUcrYaxBqMTh4ToiB4ZVHB0OZa/Lye2Ynw50wHEZP6
 KPiS7AdE3+Ff7RwLnu2JT6C+trq3+268/+25ob5GxmNHeTtKjWjZqeRv4PZ8dIZUUZsp
 zyEw==
X-Gm-Message-State: APjAAAUVgjm3i6PkQm+W92bEMWcG4d+/Vd67B+d+mkT5RVTfFts0f/yP
 gBmO+gEnPTOJKyI3arg/imp+aMf/JgaLXAxpE7MKKQsz
X-Google-Smtp-Source: APXvYqzYFilz9rGOgzAbYJ+Gra04JK5Z9Kkm/l7stkl1PncjCIPbZghlzLZ2vKqXE13hY2SOfuKz0oAm8zCn2svA3y4=
X-Received: by 2002:a17:906:4b15:: with SMTP id
 y21mr25736033eju.57.1566293264147; 
 Tue, 20 Aug 2019 02:27:44 -0700 (PDT)
MIME-Version: 1.0
From: lampahome <pahome.chen@mirlab.org>
Date: Tue, 20 Aug 2019 17:27:32 +0800
Message-ID: <CAB3eZfvki=jgCGvu5vNErGtW2gEDW9CXRsMR0LgNJLnNCWb9Ww@mail.gmail.com>
To: QEMU Developers <qemu-devel@nongnu.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::534
Content-Type: text/plain; charset="UTF-8"
X-Content-Filtered-By: Mailman/MimeDel 2.1.23
Subject: [Qemu-devel] Difference between commit and rebase
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

I want to remove snapshots and I found two ways:
qemu-img commit
qemu-img rebase

I found they both can choose where to rebase(merge) the images.
commit can truncate or not on specific image.
rebase won't truncate rebased image.

I found they have something similarity and I don't know what situation is
suitable for commit or rebase?
