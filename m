Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E285AF79F
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Sep 2022 00:05:17 +0200 (CEST)
Received: from localhost ([::1]:39132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVgh2-0003Nh-M9
	for lists+qemu-devel@lfdr.de; Tue, 06 Sep 2022 18:05:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oVeYW-0004Xg-Tn; Tue, 06 Sep 2022 15:48:21 -0400
Received: from mout.gmx.net ([212.227.17.20]:41419)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oVeYU-00084M-Uv; Tue, 06 Sep 2022 15:48:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1662493695;
 bh=7Cd/PNyzpLWUKpQvLASHF4YEGI736axEtwnpziBrps0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=SoB5Jbs52/ome3AaKQ129Fwkt/XgMheIFQ0d8Tm2zq7ULg0NU+rLLIqVbcWb1CsXb
 EL2T3I8vz8mUKcN1NuF3sXjCvuHI/l7B3sWfN5tmmfPsQqKqWe25MitOx2LcfJOSmf
 ZbJ4PBct5+niNqgw6N8qokxrak4ibqPDFjpIN7+E=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from btm-mobil4.fritz.box ([88.72.97.126]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MysW2-1pHRgC3pju-00vy6t; Tue, 06
 Sep 2022 21:48:15 +0200
From: Arwed Meyer <arwed.meyer@gmx.de>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	Arwed Meyer <arwed.meyer@gmx.de>
Subject: [PATCH 0/4] Make serial msmouse work
Date: Tue,  6 Sep 2022 21:47:51 +0200
Message-Id: <20220906194755.98090-1-arwed.meyer@gmx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+HU81zR2cvGgMcmbYqy6NGWBOLUZGbdrj7+p/pkb/1m4zipjzzB
 H5IUaiJ0ECPrAHX+lt/D2M3RQBBSm3RkRBnqJaSmUygKoLqur7Ix1furHGuCuxRHS2LtHyN
 hStINx3D10C83kJyCYzvyJh0UD7cc/7K1fF+KiO1uOQIGfEmanoGAVBWcZ2sJWwy4MKu3ae
 NKe7qG0k5fXr5FKmt4YZg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:D4A4UXfW5TQ=:SbxAbN8ipevYrnNtL0r6Nk
 WExSERSiTIR1COE5VVxqlkOUNRELSQ0WRCn4NS3cg2ONGjeHwqrDIxiB1cwemGh4nhARE//Gv
 Vn3CsfaJHBMJi6/9QxVxzgNOz4c/Z6ZZm4v43e5a9Ni6Y5pOOuseu1hXYZPkZAotBxUaxK35a
 2B2m+iGNPmsq6l+WNzBPOsfouuJXB2UWD9fF+bPw/GuyqGgpuNbAawV4X5Io7x2W2NACu5NJq
 TojEEQnDRWXnK1N0S6+AzBgDFckt+/F1s1TEkqGxZ1qafDNJnAKCj2q51esD738v9LYArxUZ6
 TgEtN3NSH1oUuqzMSp7/Phhv6aRgfUCmCotr3FljgijGsAyYjV1qEguvwIFfb2ldaxUqwWo7Y
 n45njqNLuETnO3mnJt2RziDPuYMb6fkm+LGVEhkFVmPC3xexulYenJwq1fZ9Kywg8dWOoEnAX
 dQs5rHY+AMa7NHZ29N40tKW4/XTqbB+irwad4E9mF2GjgJIYhahGZ9xqjMicH09DNiHf65tsk
 O4UxnVKaoqVSccWyGnlHrWU0dojT0kEHWphtwui578kwVYjv0kX2b1E4JPf7qBpkb3d4RJCUQ
 si4QNgtQOIiBaYjNTFUwRSkm+zJwDsljdAMQ57xSJsG8gGHeK4iURswt74QSrkmh6zxU9Ft8P
 FxZzy0c8j3k8rdiw2qLY4A62F3JSQMxwOfHg1GY7VB6PuZFHGI0HFYhuhl/tPaKw+XB+SV0jb
 q8XYcuqSnQME0VNNtVsS5pZjuQl+tgY2khnlxErS2al+8MU0lPX6kiLzf9T2SRhuFjrJ78tFw
 mmahkm6Mw/LQBTbwYPRa6s91VcxBS6sg4f8QkmCDVu3Ow7D7LNl5jwgyfxRqUtSz2dy4CWIPZ
 OvPeVL++xvtOjaBQMsM07h56fVw/to6b8v7RdZUp0XH4wa8wnZanYaWFFivBa9z9uW0TdyjxC
 wnjaSAKH7G42tRFxFftl3egBCGK5SqqrL66V4l9l1UTWOqHa/JE1Plg5ojMl6QUM98pfE//G6
 kFItzkrBDzjaJ/KlSdqMYA2KwwM/hIEiba1I93GSlLh1mJJeowrvPGvOGq5rwQjlSnupWYe2d
 IlgVlUY92ATB0stPDppmP1Bj1fB2Vg7VqZj4TB5GRJUZKqtfv98r5YacC4Osw03qJWiACbZDD
 Hq6/8i/bQfo2xC1gJDNANkjIv2
Received-SPF: pass client-ip=212.227.17.20; envelope-from=arwed.meyer@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 06 Sep 2022 18:00:41 -0400
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

This series of patches makes `-serial msmouse` work in practice.

I tested with FreeDOS/CTMouse driver `ctmouse /V` which identifies a
Logitech compatible 3 button mouse.
It will probably run as well with any other compatible serial mouse
driver on Windows 9x etc.

Arwed Meyer (4):
  msmouse: Handle mouse reset
  chardev: src buffer const for write functions
  msmouse: Add pnp data
  serial: Allow unaligned i/o access

 chardev/char.c          |   4 +-
 chardev/msmouse.c       | 150 ++++++++++++++++++++++++++++++++--------
 hw/char/serial.c        |   3 +
 include/chardev/char.h  |   4 +-
 include/sysemu/replay.h |   2 +-
 replay/replay-char.c    |   2 +-
 stubs/replay-tools.c    |   2 +-
 7 files changed, 133 insertions(+), 34 deletions(-)

=2D-
2.34.1


