Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5606DDA720
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Oct 2019 10:21:17 +0200 (CEST)
Received: from localhost ([::1]:39584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iL122-0007IE-9m
	for lists+qemu-devel@lfdr.de; Thu, 17 Oct 2019 04:21:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44316)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@gmail.com>) id 1iL118-0006mf-68
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 04:20:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@gmail.com>) id 1iL117-0006hO-3V
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 04:20:18 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:44690)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <stefanha@gmail.com>) id 1iL117-0006hJ-01
 for qemu-devel@nongnu.org; Thu, 17 Oct 2019 04:20:17 -0400
Received: by mail-qk1-x72d.google.com with SMTP id u22so1059788qkk.11
 for <qemu-devel@nongnu.org>; Thu, 17 Oct 2019 01:20:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=VLr6A+GuHyShcjJPiDYAx6zRrDRm2jat2pVrt52z7rw=;
 b=HEFM2JxRbwJBxT9d6kfBnsn22htAT0iRI+fDialpmw3GyCpgc0J7QU+xiqyzrK/Gaz
 YqarWOIUlzdqyDpa1qRGYW9tN0cewh9+ege9+HSY/1v/112lwVKsP4iRktO/wi9bzPoI
 yS44/kwKz9BKYPVdkMfjYu9YhaAICCABCkOaOo5BVVfCsSOBJeNaB1gY3bc7XymcG9V4
 lKwwl2WHJMsXlmq93F2RKQE5G2+szddMWgg2JHrI2JaC1056LQh0pAm93tQZh3f3rwnG
 Z0MEN2CPQp0gFR93N2kKrV+gsMK9ZZ+b90kmfrCp3PSPRpfFZbwFL8SSYCGHZbUJrugq
 QQyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=VLr6A+GuHyShcjJPiDYAx6zRrDRm2jat2pVrt52z7rw=;
 b=dl5vsNE2p45Jl81/uczdssocW8fsGjP+yq3YWhAVwbcH8EZoJ18Uv2NL9hBneiPTRU
 wkR8UKiNHBrJJdnZuH5CNZmFm7bCGke1pC8wO3s49nOdGj89ZfWL7i1M0xYVxD2M0kmY
 L+QvK5MGwlDlWiBja1Zi0laBXu856mlhqu7NTuAWkfk1EQoCvqIiINruw6tVdPHzvT72
 XP3IGczqBPwFHoXW6CqjjWYGjLFkQa+iYz5qZeJ4WetqPAjoitsKbM5kkO8h47L52XQo
 uwMpO3WGuadSZp9u9cKQbj/CLMR29gwPCQEFxF/SFHwLgq9WAUtI45QEcGBxZQPGslQw
 KHbA==
X-Gm-Message-State: APjAAAVoUKHAK8IDQZsWwojNXHM2pGEHHn+TL5Yc/Dgj1jXVZ0CDBHDg
 kXFb+fqNA7ns/wHC2Gp4ow/UaVR8MjWbY8ntZ4caoiTxwLE=
X-Google-Smtp-Source: APXvYqzptmso4QWc4fzonqbnWa+zMj2dQpARVfJyzKJuMaq0IjKCqIhX04Nmo8CYPUaahjL9WCyuFIlqBcQchSNfaJA=
X-Received: by 2002:a37:a345:: with SMTP id m66mr2066441qke.487.1571300416088; 
 Thu, 17 Oct 2019 01:20:16 -0700 (PDT)
MIME-Version: 1.0
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Thu, 17 Oct 2019 09:20:05 +0100
Message-ID: <CAJSP0QWchnsEqCFiPr9-axrAx3rF6HxDBQ0HUgSg3WriVqSusw@mail.gmail.com>
Subject: [Call for Presentations] FOSDEM 2020 Virtualization & IaaS Devroom
To: qemu-devel <qemu-devel@nongnu.org>, kvm <kvm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::72d
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

The FOSDEM open source developer conference is taking place in
Brussels, Belgium on February 1st & 2nd, 2020.  The call for
virtualization presentations has been posted:

https://lists.fosdem.org/pipermail/fosdem/2019q4/002889.html

I just wanted to forward this because the CfP only went to
qemu-discuss where developers may have missed it.  Hope to see you at
FOSDEM!

Stefan

