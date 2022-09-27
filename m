Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 621E65EC741
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 17:09:56 +0200 (CEST)
Received: from localhost ([::1]:54016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odCDa-000705-Uq
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 11:09:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2628f7867=anthony.perard@citrix.com>)
 id 1odAl2-00080y-Ok
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:36:20 -0400
Received: from esa6.hc3370-68.iphmx.com ([216.71.155.175]:34866)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=2628f7867=anthony.perard@citrix.com>)
 id 1odAkz-0007zA-Dq
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 09:36:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1664285777;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=GQCsQKwGq9+mrx//ew2aGKeBHOhWrjYfa2pCNdMZ/MA=;
 b=SppGhZrUHIlI/duvEO1eU0VM8RRrIjwZkoqqJCWSg6e96siNvm1CqLTR
 DZ/FJ8bUiaap7WI43JJjgZtlbr3ngLmpIvE2z36IcvlLTsVoyBHFWkqeO
 S+hGMj/LYpcCULnLwHJyzLdT3bPhDFsTtZENsYGt2OghtHKXS6Q4w0zxN M=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
X-SBRS: 2.7
X-MesageID: 81094516
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.156.83
X-Policy: $RELAYED
IronPort-Data: A9a23:G0Myk6gzwpn/8qf3e54wQtFdX161PRAKZh0ujC45NGQN5FlHY01je
 htvWTyPafvYZTbyetFyYIvj90pS6J+Bx4JhTAQ6pXw9FSMb9cadCdqndUqhZCn6wu8v7q5Ex
 55HNoSfdpBcolv0/ErF3m3J9CEkvU2wbuOgTrSCYkidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UgHUMja4mtC5ARvP68T5jcyqlFOZH4hDfDpR5fHatE88t6SH
 47r0Ly/92XFyBYhYvvNfmHTKxBirhb6ZGBiu1IOM0SQqkEqSh8ai87XAME0e0ZP4whlqvgqo
 Dl7WT5cfi9yVkHEsLx1vxC1iEiSN4UekFPMCSDXXcB+UyQq2pYjqhljJBheAGEWxgp4KXsS2
 uQ2L3MNVzmkhvDsmrC9ZLUrwct2eaEHPKtH0p1h5TTQDPJgSpHfWaTao9Rf2V/chOgXQ6yYP
 ZBAL2MyMlKQOHWjOX9OYH46tO6umnn4dSwesF+PrLA7y2PS0BZwwP7mN9+9ltmiFZwNzxrF/
 zyuE2LRLBI8MOHY8T+52Sycn7PdsRPDZ9hMG+jtnhJtqALKnTFCYPEMbnOirPykz0KzRd9bA
 0oT/CUosO417kPDczXmd0Tm+jje5EdaAocOVb1hgO2Q9kbKyxzFKXAqSX1BUfUBtd1sHz4s+
 APO2Ny8UFSDr4apYX6a876Vqxa7Ni4UMXIOaEc4cOcV3zXwiNpt10ySF76PBIbw14SoQm+on
 1hmuQBk390uYdg3O7JXFLwtqxalvdD3QwE8/W07tUr1v1oiNOZJi2FFgGU3DMqszq7DFjFtX
 1BewaByCdzi6rnS/BFhuM1XQNmUCw+taVUwe2JHEZg77CiK8HW+Z41W6zwWDB43bJpeIGC0M
 R+C4VI5CHpv0JyCMsdKj3+ZUZx2ncAM6/y8PhwrUja+SscoL1LWlM2fTUWRw3rsgCARrE3LA
 r/CKJ7EMJrvIf44pNZAb7tCjORDK+FX7T+7eK0XODz3gePBPiLJEext3ZnnRrlR0Z5oaT79q
 753X/ZmAT0GOAEiSkE7KbIuEG0=
IronPort-HdrOrdr: A9a23:HnQW26vmiJuWydBFCuWnPLZj7skDfNV00zEX/kB9WHVpmszxra
 +TdZMgpHrJYVcqKRYdcL+7WZVoLUmwyXcX2/hyAV7BZmnbUQKTRekIh7cKqweQfxEWndQy6U
 4PScRD4aXLfDtHsfo=
X-IronPort-AV: E=Sophos;i="5.93,349,1654574400"; d="scan'208";a="81094516"
To: <qemu-devel@nongnu.org>
CC: Anthony PERARD <anthony.perard@citrix.com>
Subject: [PULL 0/1] xen queue 2022-09-27
Date: Tue, 27 Sep 2022 14:35:58 +0100
Message-ID: <20220927133559.30223-1-anthony.perard@citrix.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
Received-SPF: pass client-ip=216.71.155.175;
 envelope-from=prvs=2628f7867=anthony.perard@citrix.com;
 helo=esa6.hc3370-68.iphmx.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>

The following changes since commit 99d6b11b5b44d7dd64f4cb1973184e40a4a174f8:

  Merge tag 'pull-target-arm-20220922' of https://git.linaro.org/people/pmaydell/qemu-arm into staging (2022-09-26 13:38:26 -0400)

are available in the Git repository at:

  https://xenbits.xen.org/git-http/people/aperard/qemu-dm.git tags/pull-xen-20220927

for you to fetch changes up to fb36fb9344c284a58f3f3ec5be6408fc51eaf3f1:

  hw/xen: set pci Atomic Ops requests for passthrough device (2022-09-27 14:23:23 +0100)

----------------------------------------------------------------
Xen patch

- Xen PCI passthrough fix for Atomic Ops requests

----------------------------------------------------------------
Ruili Ji (1):
      hw/xen: set pci Atomic Ops requests for passthrough device

 hw/xen/xen_pt_config_init.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

