Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98CDB2B6873
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Nov 2020 16:18:28 +0100 (CET)
Received: from localhost ([::1]:55342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kf2kV-0002qt-MU
	for lists+qemu-devel@lfdr.de; Tue, 17 Nov 2020 10:18:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kf2j7-0001xw-4A
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 10:17:01 -0500
Received: from mout.kundenserver.de ([212.227.126.135]:41259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kf2j3-0007ZR-B7
 for qemu-devel@nongnu.org; Tue, 17 Nov 2020 10:17:00 -0500
Received: from localhost.localdomain ([82.252.130.226]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MP2zs-1kvUBW0gRg-00PQyH; Tue, 17 Nov 2020 16:16:54 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] Linux user for 5.2 patches
Date: Tue, 17 Nov 2020 16:16:48 +0100
Message-Id: <20201117151650.867836-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.28.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:k/FqnbMiSSKR3ZMQSQ2CfiOnqA57En4t6iHPA63H7Od5J08Dkq5
 KpvEBIugrQvJXIvsADKlNYobeFfbC86xiWlzItweOKUPA1IwJFl4Vki7M4fgvVaiSno/IW1
 wYPlzelL+v4PA7nR/VXRpMpO9EBpsATZOcS2NKIDEtlUSbotwSaGwsVDjEZQXQ34nMRBr5/
 okxUENNbc+ial76XOh5PA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:kyovd6HkpMc=:txoHCzzufDQdCJUnIkDt/e
 M4OhH0d/O/VOfOn4COTYh0FBywPHItkdhrPR3uS532yinPRzszscH2a4oc96BR0a2Cha9Ogog
 kHGZen0O9HWOihk81MmB26T3sEu+fJfyp3bd+YZ/15ZVlnWIamrO4L6c9r0TEDr1zf/8qm4hH
 rFVKEYzC3hGMworEAAQ60qrX/xRhpfsaBsRPlfgU6+aIJ2bFIxgDoT/aqYygJ+rOy+FQa+vUJ
 vLbUaQMKENVcj6YYMu23AKHTXkG4K5jLLDtzhCa1LrrWjmbcSciF7O0CKhBEixcHgcO2nXpWn
 ENkai0g9otbIOWpVUPtGq3qPBCESlP2R7c1PnE938R2TBNFQvZiuGpenCBCVpoayjhXEieg4k
 uoMOCXHOhwg3XeVMH/rN78O4jX9qPkqr1DM3HGnLm1bX40y2DOrzTLBxJajTn
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 10:16:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit cb5ed407a1ddadf788fd373fed41c87c9e81e5b0=
:=0D
=0D
  Merge remote-tracking branch 'remotes/huth-gitlab/tags/pull-request-2020-=
11=3D=0D
-15' into staging (2020-11-16 17:00:36 +0000)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/linux-user-for-5.2-pull-request=0D
=0D
for you to fetch changes up to 5351f4075dc17825df8e0628a93f9baa9b9bda4b:=0D
=0D
  linux-user,netlink: add IFLA_BRPORT_MRP_RING_OPEN, IFLA_BRPORT_MRP_IN_OPE=
N =3D=0D
(2020-11-17 15:22:52 +0100)=0D
=0D
----------------------------------------------------------------=0D
Fix netlink with latest iproute=0D
=0D
----------------------------------------------------------------=0D
=0D
Laurent Vivier (2):=0D
  linux-user,netlink: fix message translation with ip command=0D
  linux-user,netlink: add IFLA_BRPORT_MRP_RING_OPEN,=0D
    IFLA_BRPORT_MRP_IN_OPEN=0D
=0D
 linux-user/fd-trans.c | 18 ++++++++++++++----=0D
 1 file changed, 14 insertions(+), 4 deletions(-)=0D
=0D
--=3D20=0D
2.28.0=0D
=0D

