Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9878651590
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Dec 2022 23:31:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7Odj-00089e-2y; Mon, 19 Dec 2022 17:29:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p7Odh-00088v-2n
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 17:29:41 -0500
Received: from mout.gmx.net ([212.227.17.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1p7Ode-0007E1-IX
 for qemu-devel@nongnu.org; Mon, 19 Dec 2022 17:29:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
 t=1671488976; bh=vL8yzsxg74Wea1up3Rv2r48u7PLhIzsQUOJZSdkyQac=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=mDSw3KttGA/IY4jXwrYrWZbRZgyOPKF+XT6q8fJIZ2HAM7TPmf+oXIIJDyysnJp80
 13aqmQ9ezzoveA+Wzl8Hne2HQ6OdXWLefnvKz+SQVqLZot7kwe7zBvOKdvS6qCOxD4
 S6qQsDYjsFiqDabsLFiNQtJuqO6ge9FRbdVLvMbS7tsFu/NjesGQTqSvnW/cbzfSY6
 Pc8wYQRNoV6wQCzXu7SFUiKE2bwzERYTafCncBcokGk/IXOhwpZReapFB0upDDiYlO
 Lxy8PWNPp+LS0I+fvRLL58KtZ0LoAGrP1PZCB8ltW+i0bN9Sdzkpcmp1nN0LFB+6tA
 6SdFolG1DJnbQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from p100.fritz.box ([92.116.151.196]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MrhUK-1oUjuG07VM-00niD6; Mon, 19
 Dec 2022 23:29:36 +0100
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org,
	peter.maydell@linaro.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Helge Deller <deller@gmx.de>
Subject: [PULL 0/2] Hppa fixes patches
Date: Mon, 19 Dec 2022 23:29:33 +0100
Message-Id: <20221219222935.284704-1-deller@gmx.de>
X-Mailer: git-send-email 2.38.1
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:j5Q30LiEg7LNtAuUKGZnJgB1Jzel9k24zSvLSZMAQsApCU0FKdp
 hocfqhKeh2xXjC1/qCt2lD0POgjOs12hz0+VsITazDsPnwdrIVngfRa7ovyaYzqctYUdCh+
 bylxN52URxkOBwE1gCkCpe0Q1KyiuKduwAc/r1KYos1P2vf2ho8NmFBUUadUhPuRj8SGxyL
 y2myY6t2EIWexpdH0usTQ==
UI-OutboundReport: notjunk:1;M01:P0:LECBOTMt4BQ=;p8Ytdbkpa6rd6k1O5WHaA00q885
 imKAemQ4/aGWU63BOoLN1NYp+l+lp4uQrTtko/wXYGDpwmTWXvroMylytLKLGBhV3j9FFXj8J
 PcQTCdxMphQkvy8RIIKAIW3RGZ5utBWOX7+PNUdwZ/VmlVodt6Kg9CGNhwUuE7psxDx0zRsvp
 /jL1KvdKerZn3ycWrJBrVfjvvsgdG6uXZZfNr0mRA5XL2TRs3njjvTvxcQPqrAXri3ibuxfIQ
 35yg59VOCwDC9Qvu7R1rqzpxoWuh30ORjyQvAkhOKracNOCDkFaDtRpPkXt+cTHoIJJnF8Vfk
 nSUpJgt2JZ1n980DilqfSZlR4IH2wa0aQtSb9ebtvqJiIvGPs08pvldpVi3RYn2K4DXXkuMkh
 mj3YCXIq7QkjwQtxNzp5m+xLxJLr+A/9+aezdgXrQ0/6Q73Z4uzApvh+bGA9OW09GoR0x5NMk
 nC7Uv85hA30Kh1jQYAf2leQxizkS0OGhsikcjnxUdQ8TmWOtLAEmemO2s0x1+97Ivy7QNnqYn
 w3WmH/Q2gJR0qmJxL/HCC1Y+ZJtZGknr8xCWczi5s7bFuqM0m18hydJDe96Fx/sUGrV+nz97+
 1dorrqmwsblIb0TbmL91F8hFzrX2Gqm1OnnUEKgeWpia7I043akm1QqS/+tVV7AOS/t7PRDPX
 fRvBzx/rlxcz3MBAvZG2IRgmznp8RK/t0OODNyuBWTY2REdAKsQFm4pgaA8IQdDbh1GREmugE
 DVaAgF6rzmetDo+fOmS5QGk1pFEGJhBfsLdVXtjJJgOJD4YS8e9/No3Y9HWxIqIVfrx7RhZOe
 l0oO0nHO2M7GdQSRp4vO2Jc7b3+8rui+VNh4q1TRqYLA9AFxlu4UlCxDMkNMfhYCaUMF1A+3r
 B+IFuHdYNMeN/mbPBTjVe8sf8MLPpWzBcwM8Q80MKjBSUxVAqER/DysTFCshxw9DPMajSiVfD
 hdobZVY5iu/6Ey2qDcMwDoKlSD8=
Received-SPF: pass client-ip=212.227.17.20; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following changes since commit c15dc499cc22f4a71639e42e36051e118761c25=
f:

  Merge tag 'pull-misc-20221218' of https://gitlab.com/rth7680/qemu into s=
taging (2022-12-19 10:28:57 +0000)

are available in the Git repository at:

  https://github.com/hdeller/qemu-hppa.git tags/hppa-fixes-pull-request

for you to fetch changes up to 59f8c04b222ff4b9f3799fe92a7e5d427ae48197:

  target/hppa: Fix fid instruction emulation (2022-12-19 23:14:06 +0100)

=2D---------------------------------------------------------------
target/hppa patches

=2D---------------------------------------------------------------

Helge Deller (2):
  target/hppa: Generate illegal instruction exception for 64-bit
    instructions
  target/hppa: Fix fid instruction emulation

 target/hppa/insns.decode |  5 +----
 target/hppa/translate.c  | 23 +++++++++++++++++++++--
 2 files changed, 22 insertions(+), 6 deletions(-)

=2D-
2.38.1


