Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F252D4DDB27
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 15:02:45 +0100 (CET)
Received: from localhost ([::1]:33438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVDBl-0005tK-3D
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 10:02:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nVCtL-00081P-6j; Fri, 18 Mar 2022 09:43:43 -0400
Received: from mout.kundenserver.de ([212.227.17.10]:37655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nVCtG-0005IB-F1; Fri, 18 Mar 2022 09:43:42 -0400
Received: from quad ([82.142.28.230]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1Mbj7g-1o5uDh3zZu-00dC4Q; Fri, 18
 Mar 2022 14:43:36 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] Trivial branch for 7.0 patches
Date: Fri, 18 Mar 2022 14:43:31 +0100
Message-Id: <20220318134333.2901052-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:IqDVCDHkqqshDpeXyc5rG0RlXIqZIw8S1cwCC/d38iOYhL4mRkU
 YbVdYSWtC2CfZA+n6DUXLpifXDZnYd+gn9ASr2W33I3uJLYxJo4itz4XcPYvitnqVLzLPkL
 RQfXkTZ3EJf2wHdAmS+me2fPQ+gUeBvlAm2PapIB7h+sKmn0U1GyNNYSj/ejXiwFM0306Ng
 OcdkDxmECyizwp2ZDbVJQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IIB2XhBwmUM=:IEbgvJmYyW6tgmnw2HSYrH
 Kg2fkpGnOUmNuDt3qkx0I6QTnv1vQeY1WkOfj3Q75yKxe+v+IVcjtedrBN+KgHESw7tEmE3Gc
 GHWVCukBteK/E6u/haBCiekg/ccJdDgSfhgnOY9MWq2qjgKZ9EAMFHkGSLuXQuFGZFhC76Hwx
 BJ5I+hmuXa89a/JChAYYPT0XGaSxeCTEVOnNkqjQUOX8D/VaKYLKQASnBNnN0HsFbr3hA145C
 Db+f7dIuRoxMBXDkIvtSsBvqQRlNMAyuMl9IJ3n2Y1vpIVNw4OIhhNVs4zm6Vp/Nufun9uwoE
 nXSf1Uqal6OTTP/3dEYCbYkVLr2k+fPFhMsjoVx0FVfEsnQ4ZxeJWFb43nMSSIGmJD2pECBjN
 TTRA0jowutaCMVdrdHV7vvBCZCwBx64Lwga9RNvM94C0alVotpZHlYSWyn7f6BjldDWgt0eBi
 /1GK/BEh45B0nwBq3wyvR9DCuv5JChtA76ET2FqPyPLGdIVugS3mwIWuRsHuATroE3bNMTlWy
 kh/8Rpbe7eh4pteEgksyAUCw6fkV9InrcW5HH0OFvZUiBGcnO4kiNT70ai45JsjKeKtLBKXHf
 t61nVPmb46g4SiKxWKKclaWLoUzZ3fC2QehaCiwqCV5ji1ogta9/VZ6VOgbnT9DyEmIjG01De
 spuSZ8ukovglfUdRdRZfTJpNB2PYM1tDmimOMr97gzdOHkRJ0e3bbseJ6+lFgRrIUtgU=
Received-SPF: none client-ip=212.227.17.10; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 1d60bb4b14601e38ed17384277aa4c30c57925d3=
:=0D
=0D
  Merge tag 'pull-request-2022-03-15v2' of https://gitlab.com/thuth/qemu in=
to staging (2022-03-16 10:43:58 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://gitlab.com/laurent_vivier/qemu.git tags/trivial-branch-for-7.0-pu=
ll-request=0D
=0D
for you to fetch changes up to a2d860bb546aa766f6c28a47fabedafbfa191cc2:=0D
=0D
  virtio/virtio-balloon: Prefer Object* over void* parameter (2022-03-18 13=
:57:50 +0100)=0D
=0D
----------------------------------------------------------------=0D
Trivial branch pull request 20220318=0D
=0D
----------------------------------------------------------------=0D
=0D
Bernhard Beschow (1):=0D
  virtio/virtio-balloon: Prefer Object* over void* parameter=0D
=0D
Rebecca Cran (1):=0D
  hw/pci/pci.c: Fix typos of "Firewire", and of "controller" on same=0D
    line=0D
=0D
 hw/pci/pci.c               |  2 +-=0D
 hw/virtio/virtio-balloon.c | 10 +++++-----=0D
 2 files changed, 6 insertions(+), 6 deletions(-)=0D
=0D
-- =0D
2.35.1=0D
=0D

