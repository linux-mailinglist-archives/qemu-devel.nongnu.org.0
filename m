Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F30DD1B8F55
	for <lists+qemu-devel@lfdr.de>; Sun, 26 Apr 2020 13:05:52 +0200 (CEST)
Received: from localhost ([::1]:56716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jSf6c-0008B5-KE
	for lists+qemu-devel@lfdr.de; Sun, 26 Apr 2020 07:05:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50308)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <deller@gmx.de>) id 1jSex4-00076Z-Ug
 for qemu-devel@nongnu.org; Sun, 26 Apr 2020 06:55:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <deller@gmx.de>) id 1jSewz-0004zA-OD
 for qemu-devel@nongnu.org; Sun, 26 Apr 2020 06:55:58 -0400
Received: from mout.gmx.net ([212.227.17.21]:44801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1jSewz-0004YD-0A
 for qemu-devel@nongnu.org; Sun, 26 Apr 2020 06:55:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1587898541;
 bh=S5NA4HtJylJtnPoQuPfL1iYWIJp6U8GWYtqLG6CbWK4=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject;
 b=ftoQLCsDO/mGaFG8yMLQlr8lZHN1fuRx0K/LD4n24pesNArBCEUT+zUfxJ5RcV0VC
 kj761tmZO6TGuGS1aEhwM3fSqzUe5SYzobpExALOMz5cdvoP7J4VHx046pfLxPwv1C
 pITjLyb+PGwK7jXXT9DPFQAh+UgiMA9CK1Ucz5y4=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from ls3530.fritz.box ([92.116.185.36]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M2f9b-1jU27e2Ydb-004AuT; Sun, 26
 Apr 2020 12:55:41 +0200
Date: Sun, 26 Apr 2020 12:55:39 +0200
From: Helge Deller <deller@gmx.de>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] Fix tulip breakage
Message-ID: <20200426105539.GA12684@ls3530.fritz.box>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Provags-ID: V03:K1:lKDYAPZoSf+KcDBQeGze5xRwE8V85VX23pq/Qv6cnf1pr1bgxNI
 EV+vlj4CE7hw46wRjAhwLhKsn8WckoyDzZ5VFtKvmmC5zRifURE6zHAdlnOvXauP6oVHEyY
 XqBP1zbIwr0xB+fkYlz44YbdynhO2yRKhU/edi40K2HWFHpfP9CzAWijP73YD9cwIsyI3Ib
 /dxG0zd2kI2fJ0NAq7LOg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:S5YhVc1x8Vo=:Prdp0VxssOgTWDx61Ka9Q6
 D5sNkYmhVby1Et1AGT7b4oajzAX9ThO0+ektiRalTRynrpr2TI457htR9xNAFSGua/Z/ZpmVc
 iFKdaHrEs+E3xlNeZEzWeJ3yAPY9oRIZ75sKk7X+uC5h2CD/cqZnviwwSqJSpsigvEktDUKcm
 Q+13PknfmlkxVFwTFuN1h7H0qFZSlflW7P3gg/TRfreee5mdxVHITdljwmdkKG6KVc0qlpHHF
 B3qDN/Xv1YaepHdwCXpnKHwCNgZTbe7QCUq6UW3nIKJ8JvI3u6QWfv+GD8zSVyanWHKcl4GYJ
 wE39OxJwyJf2B96y2vtWf2Pzgr87xJt2O0HpzqKEt3LKeP2DpdtTRv3aoV42D5+1eBUeK+Saw
 Qc92kKidvmwlHQBP5xce7bYGjUuPo01/YNNLpeUNayqOx227nyYkLSkTpjCIVmPzfS7JZ8Lgb
 k4LUQ5MSO/kloKcmBrZd/OtDc0vsxjm4olWMGxDJX/XBryaMQ1xhz+unxZ8m8eJ4mVgsUG6BE
 ylz+iMlq28fqKZhPBn0RXAHqTTixNVZqV7guj78lborfX/D68gN+cROmkPP4vR/z9LHqHngT8
 tWDPljPNMPDCfZWXe5dvSnskIvYqN/qez9W7hS4STcnLWsbb9oRMYlx6aqJXKD57YjOswKo20
 YLf72oYAb47PijpF2J4lie9qgscG00SAbzn4NKLiNgFK0bum969L8N4h4ctjlxAiXOn7DQ0jf
 4MpT1FlFIcOhWU3aE+tc9prt6hHutaMJc5/Y6kxSZjdyhe6sD/RZvE12TbcMKlNW/qF1VHPUW
 dHilXM/euFVcY2n5glHRCbzXiFc25jfu+ThV26tGVQIeiqdfpzFZva3mkS+gmtcJIAkBIzD2t
 U1X7fljZTZKoHvrqYXepEDdKvhBFZzpk4EGC0DwG3EEAxz1fbsxi1+QsGAqoHDv0+m1tWQMwl
 j37Bd7TmHgdsn4SPZ5khSZZZifuKYBwrafQgBMYOBzr4GwIsxBo4s40dLGbkqX4vJvG0L+WRe
 2hV1nGuCLtzNHCSf586MPuAcHQUrx9krCLNCBPH7P2VbQmTJc3v7GdhI3PoVe3A2946HSqDM5
 5u2NjW9/aZ0dc0DBC7AszLqbanlcz45UPtJMFcjXPNDUQmqvix2We1dhi3VUAW6i1/6PIO+5e
 V5tMRfpxgkjagZu4D6wue579Vgu5LqxwGhVvWUMZG77HyJrCPEx2atHleBBgOe82vLvvSPR6O
 jb5EWEG9R7WRHcakk
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/26 06:55:50
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic]
X-Received-From: 212.227.17.21
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
 Sven Schnelle <svens@stackframe.org>,
 Philippe =?iso-8859-15?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Prasad J Pandit <pjp@fedoraproject.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The tulip network driver in a qemu-system-hppa emulation is broken in
the sense that bigger network packages aren't received any longer and
thus even running e.g. "apt update" inside the VM fails.

The breakage was introduced by commit 8ffb7265af ("check frame size and
r/w data length") which added checks to prevent accesses outside of the
rx/tx buffers.

But the new checks were implemented wrong. The variable rx_frame_len
counts backwards, from rx_frame_size down to zero, and the variable len
is never bigger than rx_frame_len, so accesses just can't happen and the
checks are unnecessary.
On the contrary the checks now prevented bigger packages to be moved
into the rx buffers.

This patch reverts the wrong checks and were sucessfully tested with a
qemu-system-hppa emulation.

Fixes: 8ffb7265af ("check frame size and r/w data length")
Buglink: https://bugs.launchpad.net/bugs/1874539
Signed-off-by: Helge Deller <deller@gmx.de>

=2D--
changes v2 to v1:
    - renamed patch title
    - rephrased commit message
    - no changes to patch itself

diff --git a/hw/net/tulip.c b/hw/net/tulip.c
index 1295f51d07..59d21defcc 100644
=2D-- a/hw/net/tulip.c
+++ b/hw/net/tulip.c
@@ -171,9 +171,6 @@ static void tulip_copy_rx_bytes(TULIPState *s, struct =
tulip_descriptor *desc)
             len =3D s->rx_frame_len;
         }

-        if (s->rx_frame_len + len > sizeof(s->rx_frame)) {
-            return;
-        }
         pci_dma_write(&s->dev, desc->buf_addr1, s->rx_frame +
             (s->rx_frame_size - s->rx_frame_len), len);
         s->rx_frame_len -=3D len;
@@ -186,9 +183,6 @@ static void tulip_copy_rx_bytes(TULIPState *s, struct =
tulip_descriptor *desc)
             len =3D s->rx_frame_len;
         }

-        if (s->rx_frame_len + len > sizeof(s->rx_frame)) {
-            return;
-        }
         pci_dma_write(&s->dev, desc->buf_addr2, s->rx_frame +
             (s->rx_frame_size - s->rx_frame_len), len);
         s->rx_frame_len -=3D len;


