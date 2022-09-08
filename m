Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56A685B24CC
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Sep 2022 19:38:15 +0200 (CEST)
Received: from localhost ([::1]:58088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWLTi-0004gG-AV
	for lists+qemu-devel@lfdr.de; Thu, 08 Sep 2022 13:38:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oWLNc-0003y5-RE; Thu, 08 Sep 2022 13:31:57 -0400
Received: from mout.gmx.net ([212.227.15.15]:45137)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <arwed.meyer@gmx.de>)
 id 1oWLNI-0002Aw-AJ; Thu, 08 Sep 2022 13:31:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1662658294;
 bh=zA+aflh6/y9gOGcaWJke42RzFhVptMcJ/c8wTBDTjDU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=GE1PNCpXoDBA0B70CbcPHxUfiqFsi9kQwF6U2jyPmmyPXMF90qQ9MWDrsUx94zMZh
 +m/teMkysI7r/9X1uW5W9XowvS6D97wA7lrv/yBYg0xu1UnL91rJolvaiD9zC0S3bp
 iEiuYnd+4zZcJUyGtEUpWX4cG2YS7kMeYOUS6m6U=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from btm-mobil4.fritz.box ([178.8.103.19]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MlNpH-1pDcjo3O9t-00lp7N; Thu, 08
 Sep 2022 19:31:33 +0200
From: Arwed Meyer <arwed.meyer@gmx.de>
To: qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org,
	Arwed Meyer <arwed.meyer@gmx.de>
Subject: [PATCH v2 0/5] Make serial msmouse work
Date: Thu,  8 Sep 2022 19:31:15 +0200
Message-Id: <20220908173120.16779-1-arwed.meyer@gmx.de>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:aznf4PZp/3W1Bp7bqQTi6deX3SYkBSW7w1/KgBh7Az87tBNmQI6
 GOxke8PVro0LjlOW2ZaB1UPsHE49+YSHeOFVx7PQp94Q93mvkFyfLI+fXCD3ETIgZd/dvVj
 06sjlMtD1z0a9zHVu33xBvDN1UgyUfudfWXgi0IeKKaPiobZsKfAFKHekzg7RI5kAcJOVs7
 JdSJy4BXt4DsMc8Q9LeGg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:zgWsTD4jWsY=:7iWtX6uzDoCy3Iu20fuBRC
 JNE5tU1w+Hleqcm6bCO0S82fd7lgWtdLdSF3Pu+pbZiXW7MlhWg6TPoG6teWAx39n3HkN+mbS
 Wqn0x+E+9KVg9MDLqqQvPDf0mG6Y8Xx6h9MlqZCk8y+oleF9NbAf6OxHLsd7MYjZ4nQuLy6FZ
 YT7uoeDW0X4597E4bjlclSiFLe+9NWjhKD8W+dwKEJACin8nnE4gSYT6gzAo1f5FXYeh9LumK
 DTbAJk740D/s3FpQB2T8fl1WfAcBYCBwtB/EG2q0CFaTVFKvRkEbG3kRpN9IUMLayd9hwM64t
 7zuPJW0fmubZhMzp13+0I5YmEHPszuV+T2oPev6OpzgUGMwkDARzIFZC/d10x0g86IHy7+gGL
 VuvEubdYEE7iFTRVyI0KKkoIPLe3z+dlgRucIzQEPd0aUj5aPJTycr93LIcirteJzVRaXgIxu
 GZ2Jv3RIhEY4Frfsc3DUU0y1kXdoSiFcf/tI0gsqitGt8PVPbgWHoXL1f35lAd4tuSNv8cAlc
 gtVHVmlGROpozMCRKu+CRfpTOvXQMWjdrM4AKQ4783rmMG9eHdPX3xClFa/SGGIRo3r7zyzG0
 +h6A9mq7ZK7U5eRfkFSNBaoo7L5iN2wuZs+itbxVPzcLrGX7Owr3iNVLUuH+vtOVvO7rUyjqL
 ultxwVXJlG7FJypjosyyfh290IWFMKYnx2bkAanE/WK8VErT7fl2QL/rVJkQOXmYcVZ0pMTf+
 QbHnKXLyeEvw8GIVQFa8AMqwxwv4Nn3vbePoeKAD8+Io4ghlRXvNAsLDkc5fHzfTmX3Z3pwkQ
 RzVFLXN93DfGsY0ktQe9s05qDqHUhTbECxs2V541+x3Ux81gy7fAr/CrXDR1XPGtj+pjeTMeW
 7LrPRh6MG7nXtmRIrpCYpIRVZBakQ6G4XqgpQ9p1CKg3gizYcTovWQpAHYwKnY5ou+WMwTsXX
 jNF4uXEqrEFoMUxtI5NH7e2OFA+RA3gsekQMAcvUbY6Nz8nlv6ur6jnsEsS+YtASjHiLN4Dci
 QUoP+0On0KfOdMb4SPXr3EIPAhDYIs2t2ph7K96ctvYEQTkkvbM9Whcm5sxT4PTJFYm8ZDVw4
 NHBDILe32FNeSckZ+UeISa42dlAAAHwQSrWd7wtyJoN7TEHqFXoixaEOy0kNsAKXKMeIR9+yw
 oCAiqcvyXha9NmXtQg1IQWESyq
Received-SPF: pass client-ip=212.227.15.15; envelope-from=arwed.meyer@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

This series of patches makes `-serial msmouse` work in practice.

Tested with FreeDOS/CTMouse driver `ctmouse /V` which identifies a
Logitech compatible 3 button mouse.
It will probably run as well with any other compatible serial mouse
driver on Windows 9x etc.

Arwed Meyer (5):
  msmouse: Handle mouse reset
  chardev: src buffer const for write functions
  msmouse: Use fifo8 instead of array
  msmouse: Add pnp data
  serial: Allow unaligned i/o access

 chardev/char.c          |   4 +-
 chardev/msmouse.c       | 148 ++++++++++++++++++++++++++++++++--------
 hw/char/serial.c        |   3 +
 include/chardev/char.h  |   4 +-
 include/sysemu/replay.h |   2 +-
 replay/replay-char.c    |   2 +-
 stubs/replay-tools.c    |   2 +-
 7 files changed, 131 insertions(+), 34 deletions(-)

=2D-
2.34.1


