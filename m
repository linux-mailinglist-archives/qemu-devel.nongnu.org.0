Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03BBC4EE3ED
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Apr 2022 00:20:55 +0200 (CEST)
Received: from localhost ([::1]:44326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1na39y-0007rO-39
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 18:20:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1na38D-0005Zj-B1; Thu, 31 Mar 2022 18:19:05 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:34227)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1na38A-00017V-4B; Thu, 31 Mar 2022 18:19:05 -0400
Received: from quad ([82.142.13.234]) by mrelayeu.kundenserver.de (mreue109
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MTznQ-1nQjir2wtu-00R3Wm; Fri, 01
 Apr 2022 00:18:59 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/4] Trivial branch for 7.0 patches
Date: Fri,  1 Apr 2022 00:18:53 +0200
Message-Id: <20220331221857.433867-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:jZxejDmUZ1tj6aIQv1KYlThc2DdWySPWZZFtioHIPCcZrW7/o9g
 IhvGk/7qPPwPC0r9ndTTNY9u1nZ1ADDtxCG7B0VBXK8TMBbvdHjREV8htFVF5a4yK9xzGpx
 LeUdjapidNIAJKMXDpTXZNKjE4IKJ2EHEbetdRaohIbrBOiYu5vo131DZfTI1pcctmI93fS
 +DBwmFwgGPWbmg9Ntq3fQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ngyDjLKwd1w=:h+NXcrQELdIt1vsV+kUuGR
 uD1FtjTZalynRJeymCXvIZJNGVE/vdKAx52oj0jhTn09lIgVuQ4vkOhC+AuI4gxM68LhOMmOU
 NP7+p4mNGE8xhYnQH1wkvWaSswJow28ilniuFD5TljcmmZPtBPKMq3hQ+Fd65UNNnFsTk8SP4
 1NinFyFxcY/+vX3LgEpuCUcnOm3c+9F4OQRFq6NIMLbhgNhk3beIMvyx1+SF4HQO3io2dfSZQ
 S0dZaeeTr/rphJ5ZMkZPigu2u4q3sHUd0Y7QPCPXT8+dPr9rHF5eR9ZGtpvw6jQGsFyyoUc60
 xmmQ7AdEIn69yv4oPokylkv1NgS9ejrRLGAoxhV55KAWvQE+c77Mn5fY012hwETyjyr3+CwCB
 /FoumXkiPFPVfDbJNEtM3xI3thqWh17p5uKmP2MMbOu2NYy8ra68TNei4ng6M6rvc+SVjN9zP
 lHN2KJptmvopmbBEp50cwAcUkrsVZuOcFz0ZaJK/cbv33f7MxFwzjMdw2668pk1LKilp8o0Iz
 5XAo/FjbG252Bv1cxX9fXIOqHVLr+eSENTKt/xHxfEL7Z/x1KGB9oUds4kBqgu0JD2fAq353Y
 WcQj6f3Vv4ZbB9zQGIbk5dnYQNUZDmKdjTAsJgTR551A+wXyaZ09cb0JNDV8KirCpI4Lx9P2C
 obDKTKowQtMpSL/70ZHVvO9zmxIqpYccnAKa2KKi0w6hSaocj7tLyjgZ/Jq5WzLviIDU=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit cace6c6f3aca7b88afc42995f90bbefb37a0ed57=
:=0D
=0D
  Merge tag 'pull-qapi-2022-03-31' of git://repo.or.cz/qemu/armbru into sta=
ging (2022-03-31 11:56:52 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/laurent_vivier/qemu.git tags/trivial-branch-for-7.0-pu=
ll-request=0D
=0D
for you to fetch changes up to 04cca669b237337cc8734788c3ad968aa8e0b57f:=0D
=0D
  tests/lcitool: Do not use a hard-coded /usr/bin/python3 as python interpr=
eter (2022-03-31 21:32:49 +0200)=0D
=0D
----------------------------------------------------------------=0D
Trivial branch pull request 20220401=0D
=0D
Fix sh4 linux-user build on Alpine=0D
and some trivial updates=0D
=0D
----------------------------------------------------------------=0D
=0D
Stefano Garzarella (1):=0D
  vhost-vdpa: fix typo in a comment=0D
=0D
Thomas Huth (3):=0D
  linux-user/sh4/termbits: Silence warning about TIOCSER_TEMT double=0D
    definition=0D
  target/sh4: Remove old README.sh4 file=0D
  tests/lcitool: Do not use a hard-coded /usr/bin/python3 as python=0D
    interpreter=0D
=0D
 hw/virtio/vhost-vdpa.c         |   2 +-=0D
 linux-user/sh4/termbits.h      |   2 +-=0D
 target/sh4/README.sh4          | 150 ---------------------------------=0D
 tests/lcitool/Makefile.include |   2 +-=0D
 tests/lcitool/refresh          |   2 +-=0D
 5 files changed, 4 insertions(+), 154 deletions(-)=0D
 delete mode 100644 target/sh4/README.sh4=0D
=0D
-- =0D
2.35.1=0D
=0D

