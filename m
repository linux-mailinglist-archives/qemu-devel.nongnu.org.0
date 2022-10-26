Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5468A60E627
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Oct 2022 19:07:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onjmL-0004r0-LN; Wed, 26 Oct 2022 13:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1onjln-0004k6-Uq
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 13:00:48 -0400
Received: from sonic308-55.consmr.mail.gq1.yahoo.com ([98.137.68.31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <brchuckz@aim.com>) id 1onjlm-0004zO-5m
 for qemu-devel@nongnu.org; Wed, 26 Oct 2022 13:00:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aol.com; s=a2048;
 t=1666803642; bh=eU7PpBLLODdhmYNTWitUDr6syhPI4x30puQr0AkwZn0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=JNWP5RxiSEimCPsFJEl5ySrpR8ZaHnJfgcTFBWhbHjxa+DX+yv6qC507mCEFdXj4/5qw9+e+sJD3nJgbF3jvpqbggjXIU6S0u9IzPaTBCIaufbrPLAWwxF6E/MpNiwtbZDFJ9H/N4+hd+V3eRGrbKyLh45olIAZu0D1lFyhzP1zlMoAvrx4m0Wg/f4sXw0yShsnFHWki+lppr6yAe+6P2yqp+/SFiRihd9lYQubx6sEB3q5uJhSk1Vd6rLpHo35abuciG1TlYlhg1e25xb22wMH5HSa1VbUdd9dHc7rpNCLs0UZb4+70twf1G8C3ZPxmvXF5C+crj7/Qj1tnZ0pkQg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1666803642; bh=FXj5u+59eDkG4z/KjVnwtjqV21VAHHrc8/npF8OKk4t=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=HUpTDXsO1/GSukqr3jTqsIL846hT4f4YfXtyBNVwLcjf/31l7VEHy+PZv+ScLGacBqJi5sHrRBCxxR2tDLGVPg3YpTco5SrKJsi1Jww8A+H2nOR/nbF9VSC4hn9ai1yjDxwnAMrqzwUw6ldJAAyx27sfjo5b70LX5aYbkN0e6VcciaoSmwTBc4WVTN0jDRBjelR1++ytOnoOb4EXgTkKuIP/uM2fQ6jgsKl+LKoU7+GDbQf0AaTTKFvVPerg2+ji7bwNIidcXrxUuAZdKtjINqJSkg1XzQdP9KMNeLSvwdzJW3d3Da/HnY+Q8qEj+/KQsmeaDZwrBDyjiPIZ+d7NOQ==
X-YMail-OSG: bzItIX4VM1mi9pZWtTQTBkPiuqurRbhqdnekxPNUMqpuXt._1ZwXAh.j5pzGcHG
 tuG4gfVPZkxPTHgP3RoPQ56NHOFwnm0wZcEJEgRA.qwntNEjJHFacsUahBMO.mGHXWpgF.BBIr6D
 f1Hq5w0_c3JrwIyhbYqeIYxaTdWgjKkFRXG4pr8ySj1d8VFyVZ6ZwGx43bTPd_iWFvr6Ef73e2Nn
 S1pHC_wTyYwGCv3FtMRKsm_nIEG3BhWa541rC0ipTVanydFS2j0D7jzpEYQwTbOoosq1zuSMXCat
 IoUEc5LXejeEQyp5ETHbNina2ycd1OuOnwuK7fQI9JUiH4aYSMnwOdTkUO0P.vHAfZuuMmUAHRyZ
 XyDToY0TRNjaNWEz7QS_2qHQhwp8iNYsbp9AqX9qorX.hWtvnImJkKJ6gr7BTZYS4lAqO9TKb7VK
 rL59ezfk8OMxt3DMqKnXPOxmIJSg1EetWMAtsCf8Y3Wu0Zt_VG0SZ23BsHkddTd9jq1x8WItyvf9
 dm2.7QRoqYFx0XuubQ5QAzR6AGB4mJdr.vEyT3O3ZztkRjVUcwWdHF5SRfYAVGzyuhUI4QvjAWvS
 xcjeksl3OT9Ql.V41tax_qOWohQuNDUC1uWUUd.5gZJN3ybh5LW8Y6A9n7A.n86EYnwr8s7l9QL5
 BjUAKECJlRNcLfj0L8TuzPCDLfH_urW5Itkam2jkdSmmPzH7.fALmmQNcomTqOMkBQb_4B1bWzN3
 1qKPykeQqosAEgSq4y_cmq0_Jik0c3S.Mios_Quoa7zknicejDjNyLoYAn39hAlsQcVQrfedk1YT
 yi0_yBCiIwYEKSt_VvWSOndEi_rB0E.vu7231jUvpdYDUnPSJd5Gz.F8UfZjDhucGKa_uCao.kZ3
 x_8uNdvGF052axxVf8oIhpKrwjtyM38eToCsoDTWBtm15ptWb.KnZuP7aOobSw7ZMJREdI4FbHeT
 PXgAIyiw.RLmZRREF1CioTG5H.d_XRILScBzWf3VQW1OaYPtkiwZn7HVmbzKWrcKybhQJQK6xGA4
 twqWo_voi3Fq10vq2wpMEZMFcJ1iQPU5OlARuSMyWQIhcv4uz1F.mLSqwp7Up4HmQPeNCFJu3Qdo
 pDj9.Y4i3qEazsEp8pyEmPiMFzxELtH9xxZ6I7OBoOfE4CMY4q6leUsy3diQUu7IJDUhuJeXxdrw
 vFhe7m1v5LQMHwPiDeXup.MRTxKmw9I7iud7ID5k_gyNdnUUaDQds0V6W7auum_16N45B8VpaBvD
 f1HGpTFV.XMJecrVXmtK2y2reVe5ImeHcZPkKRIw8.iw46ks21jRrBHOGZATpOW6l6B0Mw_fcy5u
 MIJ.kOWzbONVc3FhvB6DiyKnv05.dcCCXt7lrFUL89EDsrRZ3xVTfzGMZVSGLXFTWKMdyLtt2DPk
 e1t5o7CVWMOxjrqHjfde0WnzAWAn2ecG0QaaN1CnMzxFJKGZNj6j_qAIaOA9O6E_FbiuuqlANMrv
 JUZP2DnB6t3V1yPOLU1vrNpw7RRLSYMVN3EMK.e_5Ndcq3DO2ZNSFphilpmCNRbgShaNdesw5rke
 hac9lp529iMSLPxFWZwIGPtmUMR9M3XDHrQg_NlGGKkvgHhQ7dNSea7CzlhUBXVeqbnzbZA6C20I
 zNVLwTObc8XneKPMn95fiCXIlIKouUE1oDSbP.n3Y47k3tzGGWMMbA1ziW26r8zH8Bn2M_gx0TMW
 WQgmcwmdiUY9HXjCsSsrCDCqNsQ5T4UtSzoyYAxOHMM3nfkh1I_PwLBCjKxTC4xUIOnNnXz_61Ow
 .8I1LcUL6SZDwWXXUa0UslXxoxqlLBL1BaEEaiqIKBvXpdVSFSjhMzT12.a_wiYU.ZQCiB4U9NV0
 63DAezE8sUVytZLw9FowqT.MEg.HNKEvDZfIDf30iJmzYMfutUxoUQZDSVGSet6OvwE5qsqIK7J4
 V4ttTU6aXBStkx7gX_PCMxjyuHPFrF2GFjyo7_EwJ2MNGmMhUp1jGhtNyQisZ_E8nemsXnqnKEEH
 sFiJ25iTG7jeGIUZ.2xOvIJX7t2AVq0VTVXutvW0F._OAmsN.05Qg.XXyEftdjP3fcPh5xzD8nO_
 Zjt_chzcAXyv8MnxCWfxu3edbGnD0..pgiTrpNMAxx2twdHsVqWq6aRa_ssw5ZIDfe5FC7yqs6M7
 nd1yToQ6Tef.1N1BKv4ZPuNKM1Q0WQDeLhRny.Az1xOJge5e0x2wRGilz75AruBcu6NduQsPJAtI
 3jKuupKt6
X-Sonic-MF: <brchuckz@aim.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.gq1.yahoo.com with HTTP; Wed, 26 Oct 2022 17:00:42 +0000
Received: by hermes--production-ne1-c47ffd5f5-8c2cz (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 93f63f5da119448f595de422776c389f; 
 Wed, 26 Oct 2022 17:00:38 +0000 (UTC)
From: Chuck Zmudzinski <brchuckz@aol.com>
To: qemu-devel@nongnu.org
Cc: Stefano Stabellini <sstabellini@kernel.org>,
 Anthony Perard <anthony.perard@citrix.com>, Paul Durrant <paul@xen.org>,
 xen-devel@lists.xenproject.org, Chuck Zmudzinski <brchuckz@netscape.net>
Subject: [PATCH v3 1/2] xen/pt: fix syntax error that causes FTBFS in some
 configurations
Date: Wed, 26 Oct 2022 13:00:26 -0400
Message-Id: <1b63dcf10b2e99c6dba5f0c9b16bac3ac58d3848.1666802059.git.brchuckz@netscape.net>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <cover.1666802059.git.brchuckz@netscape.net>
References: <cover.1666802059.git.brchuckz@netscape.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=98.137.68.31; envelope-from=brchuckz@aim.com;
 helo=sonic308-55.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.001,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

When Qemu is built with --enable-xen and --disable-xen-pci-passthrough
and the target os is linux, the build fails with:

meson.build:3477:2: ERROR: File xen_pt_stub.c does not exist.

Fixes: 582ea95f5f93 ("meson: convert hw/xen")

Signed-off-by: Chuck Zmudzinski <brchuckz@netscape.net>
---
v2: Remove From: <email address> tag at top of commit message

v3: No change to this patch since v2

 hw/xen/meson.build | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/xen/meson.build b/hw/xen/meson.build
index 08dc1f6857..ae0ace3046 100644
--- a/hw/xen/meson.build
+++ b/hw/xen/meson.build
@@ -18,7 +18,7 @@ if have_xen_pci_passthrough
     'xen_pt_msi.c',
   ))
 else
-  xen_specific_ss.add('xen_pt_stub.c')
+  xen_specific_ss.add(files('xen_pt_stub.c'))
 endif
 
 specific_ss.add_all(when: ['CONFIG_XEN', xen], if_true: xen_specific_ss)
-- 
2.37.2


