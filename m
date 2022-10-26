Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D18860DCCF
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 10:11:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onbRb-0002AQ-Fk; Wed, 26 Oct 2022 04:07:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1onbR6-0001fc-Mt
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 04:06:54 -0400
Received: from sonic316-8.consmr.mail.gq1.yahoo.com ([98.137.69.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1onbQx-0008KF-CP
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 04:06:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1666771598; bh=5xrh+eQj0TKCY48VtCs3LUP/5HjMlN7+sNXMihoT/w0=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=dD3jTe85+Gt8zE8J2Xk/kHaixt0a/QgA4WJsG9ecjZ53Vb/vSuOA3GN7Rwdlk6HnuEZ8ZKr5hy4Ng4mfSolih2Vcrm1qSTHZf2DULvmp+ix6VRgSF7ToAOUoswFPHqi2+lmFgkDjGNhPyqVdlYIP0+LkV0FOjnloaf9y670fkqI2ZrJ6T0jimsa9lghxEOsIkPhXy/4tgAsXSgYThSSNSFBR78m29ote5j4SL4J28SomeJ9gaMip14vtCj79MHtv36/w8bYzeIPB+W517ZRVlQLslq3M0QDzPh33Er/fWi55B0dkcF555jlA33GVZePcCWxMsta4KmyDicvHKruTOA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1666771598; bh=FaQauBinFig4hAkIRNDMa9WSUGN23QRygcriy/AUKko=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=fYzRwzq/C5a2R8A3Dfss4kOdXI3KiROrwgxv1fIXZC2/EDgfOzIvVcmsf4+bKcRtDRQYsaoq9TxK3YH3ocdhq16fTa2X04mLobM7KZ2I2rmpmlxP0FqhVVofIIL6YhKaRjq+LVjFN6cB0DnICxL2MEUSmUbixYSqQ8zOVwcXcXXPyWlBHrMDw8vHhd7TCiN+yzsAvJBLz/aIwnkOK5coYtqBdq2MlXaPQPQ5zmxlDTac2TqKC8MRVaGXlH6fXgdeSnnHJ+vVoRdEYjgwWMH9TalbpDoe6h0y6QCykWrc4r4U81/75EkOlNyjJvWx4IwXgwvfuhhap4LSzDI7BVR7cA==
X-YMail-OSG: e4cAigwVM1kM3mVmsNS0gTFsZkouFLMQzxq8n0Eko6doVBqcrB.VFSkEl6rRxwO
 OEhjl5emjL9g.6ktVvYlT2qv4byzkF9HML4xEjxUtz_t_ZHEtm1uVXY8GlSPqJJM8QMndklhYZSo
 _qMkQqUEAEtDoPs8S7KOZJLYdJyhAS4IbZpGmGY8UVopGYHRtyDgMO7wqB_Nskc6BCMNrg2ljIw7
 paG2ZbMG5vHeQ46_GwGMkzXQF6CIeeDgog4XCKxZgG6TgXxhG0YaFpC1HidS_VXZjSJjsZDOIoC0
 mPBdLA41pHKxNA9r.ugWFcQf1.63_q5Fb.G5r6zNVbuH1xgC0mPP3N7vRAciv7V2O63SZgd6H5X.
 7OWvxNG5_t.tLBbn29wuy8b0Ygfr5jtCbNE88nKI7kAxU61pK.LK539jLM1.DGD.wn7Mw5flOIKA
 UOSmdMjswCujluRZJHTd3DSUBA18k3O3dDanOEx68Y6_kQSkJS1Rw68LUJ0wS3GJTxk.Ys2lSzWs
 1kc8w0czHgpMSqSQkmhRSoGrUoG553yjmbND1uXbV.HHtxt2axqKk_iWnwEwxFezvU3PHt_Yc31A
 53LPRzZnk_gQqIC6nR.q2kj9tZqOb6y0wxz3JOIZ5grMp9sb8ZPmxbPufrRJw4DRQNRVYttFKXus
 chPhlLF1d7lmv133XD6IKmyBU5qUkjglqWv4AHLLM4aB_axScexsFcclbETTrHioXE8gTanyAaaa
 hk6PSHLxDy043fe5p_omrS9fsMfbUqt8vNj4o9N0VWMkgBmsBqfW8eZ6zRcJgJgfvpk89bUtr6Th
 jd9r9uPmhYDJUedFb.QyS39IlFy_NKe9KSKgXBkvjQmUWwR_UJPvXNIcdxBeHe308mT4PqEXwn7x
 pJqgftz8YEu25CiKnybbvbiGBhrZc.OV_oQJufg32YHlykxnGvh_N5r7aenyvvee0DhOe04a11DF
 Nk.EauYr2nO9HJEvPSpyxYh4drTKtjL76W9Hl7Y1.5Nmlpii24ya.rvEHgXWufzfGVZgJpYpJeSP
 fXsa1Tk.4yY4nhu3jNzdSCsrGim9Vfbzd57VTeuDDuZ.YX3rlbWr_VC8b_2I4rm2AGCyEB3VHgsJ
 ucd2UPIgDfhKvdNxt1CBzI4Zex5p1m.IuFUuJfayJj_KCI8Oa2kyLuRNGLxluASz9bQNgXb1E57_
 KZKoGkdFuXnkSxX7mNGr2ofdMWqlJlSQEKP92OKHP6ADz29vDOx45zKxtyluzNCl2jBGg9Sgi6SE
 f7dBHWWfNfThgt_xZneDsdVubpyinTu8YZnkNDDXL2_F1XyyhPMAZc.3pfZQcvMdxysZJFsThyiw
 s62yfKEZ6eKn35O.mBV89Dkxa6YrXTaq3rhqPXi4I4ID3t3F4NtOVpxn.BL7zsYcl94oV30Fb72J
 GeCatqsAWM.BP2fGqJpXaqjhG_YtQyAJ6EfQc3IjpMNqqhunak.5r5jdtMdfHYHWjWyw9HkmLxAf
 k4le7xeRj4KJQZof97ZrAZq5b.zeL8Hgtb84DyBX0ocH9gucniLT6ML2DursxthVUq6D9Voa27G7
 LM1gNJHBA7MYUQVnBRw4nYjbl.xSUs7rvuSyDC4o1eoF6Up.XfKNf5mJgjpGqvp0ibRcxz5Z3Tix
 G.rwuxzFsnpdUVKWE1Tf1fzvVmyCJaPPUhdvx0BXupUqxi1P_TVVVz_29UNanAlKyz8WJdLq6orq
 z1_ghhjMaHHmRnGupHmtWY89NLgXhlgaCQsydM4tg3u1Xgqr8g2ENV9eDXNz3ZN0QMyYiJFh9wEL
 eVcfcLMFZRwibOY5X9c5yOM0KvOJx2DLE4NQIlsq7DPlLdWmdDZBBgQk2UiwvFSOZ2ERHYyesfdU
 tRAbgqG14tcPUFaUbQfoP05nHYHDmC1uNuBmO9VyNqxkP.43c1jk8XrY8iHD0tclFpgi0B_nMf9g
 oB0wVIPK904CaScQpybjQR73LHFhLZH0tpxEjtpjB2EKzZSuO2DFsnEwp7kJkwcK1UexGzuDxYhR
 gkwn9wXyv5LqYhEAKMibxpCFLO9rc100iYKE8XaeLARdpLKVRtZx_SqguR4P5pAYs3Q86CM_Y2m8
 0hGfq6qqiwNczxuvdjfQtX7XDCj1Ho1XrpASS3IP1JAncJhJ3mjbhShzSHZHdMIEDv4GmgQmSvEI
 _AIldVjYjxrmYQegW1OsqPllM7bz9O5cLTwnjyqZCIyoK5VKDgfOCleCeRazS0nW7xeoFov_OhyO
 fhYY-
X-Sonic-MF: <brchuckz@aim.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic316.consmr.mail.gq1.yahoo.com with HTTP; Wed, 26 Oct 2022 08:06:38 +0000
Received: by hermes--production-ne1-c47ffd5f5-kmjmv (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 23da40615be2c6ee6a989747ca28211e; 
 Wed, 26 Oct 2022 08:06:34 +0000 (UTC)
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, xen-devel@lists.xenproject.org
Subject: [PATCH v2 0/2] xen/pt: fix FTBFS and reserve PCI slot 2 for the Intel
 IGD
Date: Wed, 26 Oct 2022 04:06:04 -0400
Message-Id: <cover.1666770887.git.brchuckz@aol.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <cover.1666770887.git.brchuckz.ref@aol.com>
Received-SPF: pass client-ip=98.137.69.32; envelope-from=brchuckz@aim.com;
 helo=sonic316-8.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_PASS=-0.001,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This is a series of two patches:

The first fixes FTBFS when --enable-xen and --disable-xen-pci-passthrough
configure options are set with when building for the linux target os.

The second fixes a regression that was introduced many years ago with the
upgrade from the Qemu traditional device model that is still available
from xenbits.xen.org and based on very old Qemu version 0.10.2.

The regression is that the Qemu traditional device model reserves slot 2
for the Intel IGD on the PCI bus when the Intel IGD is passed through
to a Xen HVM domain, but the current Qemu upsream device model does not
and in fact results in a different slot assigned to the Intel IGD.

This behavior does not conform to the requirement that the Intel IGD must
be assigned to slot 2, as noted in docs/igd-assign.txt in the Qemu source
code: "IGD must be given address 02.0 on the PCI root bus in the VM."

I have used the second patch of the series for the past two years with
no problems. Without the patch, the reliability of PCI passthrough of the
Intel IGD to a Xen HVM guest is very poor, and in some cases the guest
fails to start without the patch.

v2: Remove From: <email address> tag at top of message

Chuck Zmudzinski (2):
  xen/pt: fix syntax error that causes FTBFS in some configurations
  xen/pt: reserve PCI slot 2 for Intel igd-passthru

 hw/i386/pc_piix.c    |  3 +++
 hw/xen/meson.build   |  2 +-
 hw/xen/xen_pt.c      | 25 +++++++++++++++++++++++++
 hw/xen/xen_pt.h      | 16 ++++++++++++++++
 hw/xen/xen_pt_stub.c |  4 ++++
 5 files changed, 49 insertions(+), 1 deletion(-)

-- 
2.37.2


