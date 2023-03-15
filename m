Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41DE16BB5F9
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Mar 2023 15:28:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pcS5X-0007V0-UW; Wed, 15 Mar 2023 10:26:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pcS5V-0007Tk-Ej
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 10:26:45 -0400
Received: from sonic314-19.consmr.mail.gq1.yahoo.com ([98.137.69.82])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1pcS5R-0005jO-RJ
 for qemu-devel@nongnu.org; Wed, 15 Mar 2023 10:26:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1678890399; bh=rfRiZAw2pRW0nOWkSbfSm2BhVaykTTOOFvFPq5zktwY=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=q71rQ/cXFgxo8RHPpZcjb1grtVZq/BOTDsh/mxtjlopZ6HV6M0HoKRVHq6Mydt+lPvBDcPDyLr7sffW/wwkX13EpyHHsLbmVV7j4u1+bD4qgnljxvDIQAyAdbBxg26M4S9xfU+qCyO1t2/IXlDGRB4yjdHVAes5+79Ct4GOgfoTqxoabaXD66WxVQp7sVm8cVp0Tf3y8vBAayZYELmqbWRR/3NDVltC82T8a72s7xioT9f9Xdg28kYJoG68Zuuq2jRYZNckjN7rhHmAoiL6JBnat9W1p3J9lfmLop9AU+rwqk39UKFOJ2XbU+pSna5WtjtSwmHnI0jAG/yE02iG8GQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1678890399; bh=vmQ63dyO6yV8ovfwCz9Hvkrh1YckA6rkFM3OUKx63tS=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=tLxyumA7OgEUF4nm6mvPIlyiOL9R9dtmZTUuHCxjX2QfqXgXdNavGYHuTb8+UccSYBS5uJBLRLgQooatmoMso7kM8D3NY8WBRSv/PkWn3dp3oOj8qxOkD73WIzzt5kzejqSIqOHd+Twp+yoOboiGgczf46XnliL5XrLmrb0oq8KflWBhOgMonnKzEy8npLvLxvgDHwWN3GnCQY4uBzibJBfhY1JZJ4awwhRtw96nukGcfP2jZNYPLaWkwO1wJvBaPF/BzCghRA55OMbBLhSBWaL1fh3H2IJaqWgoMyGMOaZ+NbVEgyDMjpPGxmjUc+NOXn8ec9FucaMP6qknXeu7gA==
X-YMail-OSG: H9HTV68VM1mWHDuOva5.E_PiS7OhkBk8HFQjAyt2FqF_JpGkKpKxgBHrK8wA3gE
 NDeLbpyEpHdesuIjcICv7yiaC0IXnfmm0K9Fa6J380VJyWW95OxgEXOqbp4rkcdl9eyxS5uc4IbI
 wN4qAnvAleAAQ4eU_TeFr_AtbOW2deHZcU62sostAm7ygLsi8USWeMnRcT8lehF.g.YWAHheNY60
 7fDCqV99v4BHhr0AoFH7Tab9swPj8qs4ApLkg07I4Mhvfkb1mLmsniMp6_apBk1SCALP.RCOytVC
 9sm_pj7B6z86nfFzdOsoEZX_5kdqo5c3cNtndSWZRtTA_.YXQH8LZ7Vs365zQTKZxZaElZN0XJOF
 bgnVlCY3tyahVrx5uWRkWZopkpWgZvJ6rC6HhJTtgc_G7RCj5GsKamXYis0GU824ll2DjJo8_Dip
 UJ9DjM739Jscu1sUJ4QjMYMiuWn4Ww7BLbIL_xwJL0vcxzPN8yVd6Y8Wn0lS6pg5EwAVCaUz4k6F
 2ve.0SUaOl_MxN4_dFeLI6sFBd3n5Bc8u015wpy0dXm8CcUQJSz_9tiWw73xiBUE6dNP91K.yZ2X
 OqPivY2XNhPP1ZWX5UgeeEHvz7AQOmeJ_7ay_LovtTKgMZwMv_kAnCNb.Su0_l0w6dPFIwVmDSgt
 yVbYdROTYOsQc._hrVkjkt8gAbD5rH.KXly5Tw1LTX8kXyXmxsVMBRSiftbJy1L6u1wjX._g1xlR
 WQUK7VkKSrqzo2NnbSZKlSBtQf_SibYHFUVh0g7djZngH3NEHIYi9XOdgSiD6OLircoScBR11VZh
 ywrSO1QddLgyYhhR1pugUquIOFyuMWhbMGBmdWmL47nuh.AbOYDgg1fNXSMP8.ugkiMP1RsOumv5
 kxKh277ME1ypp3.pFGLBfrK_RAU6bulOzq3B24zzeA5s_eRgkPICf49PiNOulrfk1QhjWjGPZlpY
 13cWsVeHXvAGhVzGgRMUHW3fwCOukU5t9W322QYc7I93UnXMoys0FS9_VhN2E2Vnv.sbHyOymZNW
 ulVGvXdmUFh50EKyjet3fL47l.99V3d3Qd3qKCUlHkCvDYfp5LQEzzN_nEAHgXJQR80eGPw1Wh_C
 JmOsJRwl42WdS22lx_b4nEOYzuTrqns6qSULa9GLPg1H8W8B9c67L8DAHZHY3mEAAnoo53AelkKy
 Mdocv5aHxjjFtpWw5.IKpKP5B0ZWZ.c_EPAdL9NzjlwsDghaU5blw6ES3tgyQzyMa5A4BJRw_6xv
 yB0YGl1ELtvttAFJXCAYTlAjrEncFc6MZj0JAlmvkLXwKInafgpSbJaqqzcCLZquwhFYDlAewuUc
 Sn5Pzjusoyy0YeXbCc3NhHZQCLQARy.k9B97XQ_O_jHMhog0z8IH8afNEIoxvjFchkgpm4jO_Tlt
 Iyg0njsHtoD08n.VRTg0LRNUtIqR54j21BvjbaA5aJARZoA.OyN08Yp4P5R_jC1yZdW7poPHx5By
 RV5eSI9yU.HionhV6cP6.3B2v0hE3uY2QlGM.wQb473BqeCLYQkXowotu6OLuNI.LEMy.WyKQwHp
 mrlyxzb44ma3sOtRQc7N3lzC9vAy.WqG.TSiB7a1mcWFnk5LLOIVyF6c1ZagZRWBMA0JPg5Ywm2u
 2RGuRTAZ3fd2NAQ_iqT1NnRza6yz51mKR1i1dJHOdhkwpshKnO2h52gNMmSAPjAt8ZbDqC_a9G7j
 HcZ0_4joEL5TbuYkKWONv5AfkubPlx0T2O_MsYBEMnKZ0d9lPwGiRx0Qi8NmL6117_2mUOUyT6pj
 kEdZE5keU0enrx00bxq3qF5AizXF6IH44_WpiC8anqCNEFILL9V19gUZ__jQ1WrLswAS_5e9AzvL
 wNZbxFZ89e8NvfSSfgwf8wvsWv.Q0fYvsOXo9Fd5t5Orl17nsBn0u3r3ED0ilsAtMp2WWZyv2Vv2
 a.0Vsphfg1A4WHfrfppE7qZU3xHjCiG4XwgAFCFRotkHZtcG4nnQ0LzVx1tXPJ5eO_XfkcqVfLaA
 MXE6.xH5NJ0uVSmG0mEjloRTLiLGIjIdBfncmqMm1BM45xVJ62BQyyO1oAXqF0XbVKXqOWTpdduN
 zYrOV3BQhJavSgtGaWnugoiABW9LwxyDr2e9UUq50XyspsEoxhrLF2B8Q.EbjRiK4LaiKfPBqyCp
 P8eyqKv1fh75.cwl7.UUwKcxveQoZZQDLQGbPlW8bsmdGXT3D0Qh4dH5F4QQGfPwvaXcllxFwETW
 ybXPG
X-Sonic-MF: <brchuckz@aim.com>
X-Sonic-ID: 2f7900fe-8c1b-4398-9021-e97f795513b0
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.gq1.yahoo.com with HTTP; Wed, 15 Mar 2023 14:26:39 +0000
Received: by hermes--production-bf1-777648578f-gg2qh (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 60044a03c62ff9d9db8c181d26f4f55f; 
 Wed, 15 Mar 2023 14:26:36 +0000 (UTC)
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org
Subject: [PATCH v4 0/2] pci: slot_reserved_mask improvements
Date: Wed, 15 Mar 2023 10:26:18 -0400
Message-Id: <cover.1678888385.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <cover.1678888385.git.brchuckz.ref@aol.com>
Received-SPF: pass client-ip=98.137.69.82; envelope-from=brchuckz@aim.com;
 helo=sonic314-19.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

This patch series consists of two patches. The first provides accessor
functions in pci.h to avoid direct access of slot_reserved_mask
according to the comment at the top of include/hw/pci/pci_bus.h. No
functional change is intended with this patch.

The second patch replaces slot_reserved_mask with two new masks,
slot_reserved_auto_mask and slot_reserved_manual_mask so the current
behavior of reserving slot 2 for the Intel IGD for the xenfv machine
will be ignored if an administrator manually configures a device to use
the reserved slot.

The current behavior of always reserving slots in the sun4u machine is
preserved by this patch series; the patch series only changes how
slot_reserved_mask works in the xenfv machine. Although the patch
series can affect xenfv machines configured for igd-passthru if an
administrator assigns some of the pci slot addresses manually, it
does not affect the libxl default configuration for igd-passthru because
libxl uses automatic slot assignment by default.

Testing:
   - Tested xenfv/igd with both manual and auto slot allocation - behaves as expected
   - Verified that qemu-system-sparc64 still compiles with the patches to sun4u.c
   - xen4u machine not tested -- Mark, can you do this?

Link: https://lore.kernel.org/qemu-devel/20230106064838-mutt-send-email-mst@kernel.org/

Chuck Zmudzinski (2):
  pci: avoid accessing slot_reserved_mask directly outside of pci.c
  pci: introduce slot_reserved_auto_mask and slot_reserved_manual_mask

Changelog

v4: I forgot to check the patches in v3 for style corrections (sorry about
    that), and the second patch had three lines that were too long. Other
    than correcting the style problems, no changes since v3.

v3: Re-work second patch in response to comments/discussion of v2

v2: Add first patch and cover letter to make this a 2-patch series
    Make changes to the second patch (see second patch for changelog)

 hw/pci/pci.c             | 33 ++++++++++++++++++++++++++++-----
 hw/sparc64/sun4u.c       |  7 +++----
 hw/xen/xen_pt.c          |  8 ++++----
 include/hw/pci/pci.h     |  3 +++
 include/hw/pci/pci_bus.h |  3 ++-
 5 files changed, 40 insertions(+), 14 deletions(-)

-- 
2.39.2


