Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06AD76C645F
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Mar 2023 11:03:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pfHmD-0004e0-Le; Thu, 23 Mar 2023 06:02:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=439de8c1e=anthony.perard@citrix.com>)
 id 1pfHmA-0004cf-Ql
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 06:02:30 -0400
Received: from esa4.hc3370-68.iphmx.com ([216.71.155.144])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=439de8c1e=anthony.perard@citrix.com>)
 id 1pfHm7-00083y-1h
 for qemu-devel@nongnu.org; Thu, 23 Mar 2023 06:02:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1679565746;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iGrXxC+V3adti4yi+k6bHddtJ5QbLeBZnOJCdQiqiPc=;
 b=NKpUQbqujdu4T8z6ewfhbcrgiG4hUrMjT7eypqqEz52w3b0CVzkgZec2
 eFQ8FoSNcFN0Pxx3oV+AjuGK6ga1zo1Dt+c4zMgr3lrOLWnhi8yvEDNYA
 mLuAFX/YIKfU2TltJbB/djnCXSd7HuhynRUrkFf432vRS3LI1hjB7tTC8 E=;
Authentication-Results: esa4.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 5.1
X-MesageID: 104410744
X-Ironport-Server: esa4.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.123
X-Policy: $RELAYED
IronPort-Data: A9a23:/Ag3hKOSuLv91iLvrR32l8FynXyQoLVcMsEvi/4bfWQNrUor1mYFn
 GQYWWDTbv7bNmL8ft11O4m+/UIEv5HWnIRjGQto+SlhQUwRpJueD7x1DKtS0wC6dZSfER09v
 63yTvGacajYm1eF/k/F3oDJ9CU6jufQAOKnUoYoAwgpLSd8UiAtlBl/rOAwh49skLCRDhiE/
 Nj/uKUzAnf8s9JPGj9SuvLrRC9H5qyo42tD5AdmPJingXeF/5UrJMNHTU2OByOQrrl8RoaSW
 +vFxbelyWLVlz9F5gSNy+uTnuUiG9Y+DCDW4pZkc/HKbitq/0Te5p0TJvsEAXq7vh3S9zxHJ
 HehgrTrIeshFvWkdO3wyHC0GQkmVUFN0OevzXRSLaV/ZqAJGpfh66wGMa04AWEX0vxwW0BR1
 OIoEzFTYjCcn9m77+y0S9A506zPLOGzVG8eknRpzDWfBvc6W5HTBa7N4Le03h9p2JoIR6yHI
 ZNEN3w2Nk+ojx5nYz/7DLo3mvuogX/uNSVVsluPqYI84nTJzRw327/oWDbQUoXSGZkMxhnE+
 goq+UzICwM1C/KC1wa61Vj0v+vGsGTdY7k7QejQGvlC3wTImz175ActfUK2pOT8hkOgVtZ3L
 UsS9Swz668o+ySWosLVBkPi5iTe51hFBoQWSrdhgO2Q9kbKyxyeXEkbbyBxU914uO8pXQcn+
 QGGnuq8UFSDr4appWKhGqa89G3taHNLcD9bPkfoXiNevYC9/dhbYgbnC486TfXr1oCd9STYm
 WjikcQou1kEYSfnPY2f9EuPvT+jr4OhouUdtlSOBTLNAu+UieeYi22UBbvzt6wowH6xFAXpg
 ZT9s5H2ABoyJZ+MjjeRZ+4GAauk4f2IWBWF3wE+QsB5rm73qyH4FWy13N2ZDBkBDyr5UWWxP
 B+7Vf15vfe/w0dGnYcoOtnsWqzGPIDrFMj/V+C8U+eilqNZLVfdlAk3PBb49zm0wCARfVQXZ
 M7znTCEVi1BV8yKDVOeGo8g7FPc7ntjmD6DFMCglEvPPHj3TCf9dIrp+WCmNogRhJ5oai2Om
 zqDH6NmEylibdA=
IronPort-HdrOrdr: A9a23:ttA+Qq/RyfkHsynISLluk+D6I+orL9Y04lQ7vn2ZKCYlF/Bw8v
 rF8cjzuiWZtN98Yh4dcKm7Sc69qBDnhPxICOsqXYtKNTOO0FdASrsN0WKI+UyCJ8SRzI9gPJ
 BbAsxD4Y3LZmSSVfyKmjVQyexQuOVvLZrY49s2E00dNj2CtZsQkjuQZW6gYzRLeDU=
X-IronPort-AV: E=Sophos;i="5.98,283,1673931600"; d="scan'208";a="104410744"
To: <qemu-devel@nongnu.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PULL 0/1] xen queue
Date: Thu, 23 Mar 2023 10:01:59 +0000
Message-ID: <20230323100200.12986-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=216.71.155.144;
 envelope-from=prvs=439de8c1e=anthony.perard@citrix.com;
 helo=esa4.hc3370-68.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit 60ca584b8af0de525656f959991a440f8c191f12:

  Merge tag 'pull-for-8.0-220323-1' of https://gitlab.com/stsquad/qemu into staging (2023-03-22 17:58:12 +0000)

are available in the Git repository at:

  https://xenbits.xen.org/git-http/people/aperard/qemu-dm.git tags/pull-xen-20230323

for you to fetch changes up to f75e4f2234e7339c16c1dba048bf131a2a948f84:

  accel/xen: Fix DM state change notification in dm_restrict mode (2023-03-23 09:56:54 +0000)

----------------------------------------------------------------
Xen queue

- fix guest creation when -xen-domid-restrict is used

----------------------------------------------------------------
David Woodhouse (1):
      accel/xen: Fix DM state change notification in dm_restrict mode

 accel/xen/xen-all.c | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

