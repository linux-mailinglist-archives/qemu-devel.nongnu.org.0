Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71CF84207F2
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 11:11:56 +0200 (CEST)
Received: from localhost ([::1]:51024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXK0p-0005VO-GJ
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 05:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mXJNK-0000gh-HQ; Mon, 04 Oct 2021 04:31:06 -0400
Received: from mout.kundenserver.de ([212.227.126.135]:49593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mXJNF-0003L4-Uj; Mon, 04 Oct 2021 04:31:06 -0400
Received: from quad ([82.142.3.114]) by mrelayeu.kundenserver.de (mreue012
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1M9ZRc-1mTzzZ19CG-005ZsV; Mon, 04
 Oct 2021 10:30:57 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 0/5] Trivial branch for 6.2 patches
Date: Mon,  4 Oct 2021 10:30:50 +0200
Message-Id: <20211004083055.3288583-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:BeVORiIhymKoqdIdkp+PCT3HJZGHEheWyE/4nL9XQQ2sDU+O5RL
 SzMHrWxxn2kGkJikiKtoJToD9COXKoRwN9udNnmdSZetjery9miAWIC1wVGcr986Y/Aqw1/
 GNLxba1KqJFFiSTOfh6mrm42MFksqqX4WUMqbBlXJrp8jW7M/VCplmU0evf9NIpQpxa+25i
 vMTNCQLeukVSVGjo6j+4w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:F8xLk/Ws/eI=:OOYBkRDr0WMqtl9V/6woT2
 CSzeo+HLmbFdNfS9U4QB3E8AKQXWflOBAHBvp9Ee1/kSsACGPYs/CWA42LmwsMAqommuuw1hl
 A/OOu2XpCydEOgfHrsnOfmdA8WfNf8SrKptzrjk2P+tlgu3tCA8/JP65ldbmOhlGyEZy9SeM9
 n7Vty6EbRjdc9ldGDJI4Y6V3hRzJYhlJcWYTAXOOjG2fWvjQB2yx3Ijd8DgR00gouQF/+X/C8
 Q8cBD9hCN1LwNiE72X7X11AcXXJtKxtVdqHdYeyIm12J96q1zNqlMkVcm6/E7YG45FfRF2tOI
 2IfAH7wLe8Im2Cu/zKsdjwEFxaZqnz1iPxW55tbnbaw0fFzZxguzmqjX5eava1tzKhjoSmIby
 wu3A/AfarNH6fY4ZMscsxyPnPSTCgbdbbxIBxURpOVDDCJrrNaHb2rAdekg9y4zomxARnK4oJ
 9D+VWlk9XbyTGbzQ9imeoJZGR5Wv6/zjjp3hp1iow0IMCKKnI0ylyrM43A05xuKBBUNJGUr95
 O88iQ0lb6lse+e2th/OByNc41gy7gIsMmCgZ40npzUGsCz4ngR93MTu3Ww2DqHusSBbYy3GcB
 0d5yfWJ9y5KSHckqzb/U238x6z8XcRuvZUex6Lotq/FaLPqhUIldzazsOt3SFucEfjifXlqdv
 3amhRyQczj0qzFiWAqP8M9qyNre5wwQN/dQ5NzwlAESAjfRVwzPnYoaLYr5yWwGzwWywZUtd5
 uQq1oOX4p86zWv1BI11HNK4qbvJyGWyvV0/baQ==
Received-SPF: none client-ip=212.227.126.135; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: qemu-trivial@nongnu.org, Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit 30bd1db58b09c12b68c35f041f919014b885482d=
:=0D
=0D
  Merge remote-tracking branch 'remotes/bonzini/tags/for-upstream' into sta=
ging (2021-10-03 08:45:19 -0400)=0D
=0D
are available in the Git repository at:=0D
=0D
  git://github.com/vivier/qemu.git tags/trivial-branch-for-6.2-pull-request=
=0D
=0D
for you to fetch changes up to daf0db06308b55c518312abc39a4bf74413ac007:=0D
=0D
  hw/remote/proxy: Categorize Wireless devices as 'Network' ones (2021-10-0=
4 09:47:26 +0200)=0D
=0D
----------------------------------------------------------------=0D
Pull request trivial-patches 2021104=0D
=0D
----------------------------------------------------------------=0D
=0D
Markus Armbruster (1):=0D
  qemu-options: -chardev reconnect=3Dseconds duplicated in help, tidy up=0D
=0D
Philippe Mathieu-Daud=C3=A9 (1):=0D
  hw/remote/proxy: Categorize Wireless devices as 'Network' ones=0D
=0D
Richard Henderson (1):=0D
  target/sh4: Use lookup_symbol in sh4_tr_disas_log=0D
=0D
Yanan Wang (2):=0D
  qemu-options: Tweak [, maxcpus=3Dcpus] to [, maxcpus=3Dmaxcpus]=0D
  qemu-options: Add missing "sockets=3D2, maxcpus=3D2" to CLI "-smp 2"=0D
=0D
 hw/remote/proxy.c      | 1 +=0D
 qemu-options.hx        | 6 +++---=0D
 target/sh4/translate.c | 2 +-=0D
 3 files changed, 5 insertions(+), 4 deletions(-)=0D
=0D
-- =0D
2.31.1=0D
=0D

