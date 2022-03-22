Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BDF634E37E5
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 05:21:40 +0100 (CET)
Received: from localhost ([::1]:54610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWW1b-0005w2-8x
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 00:21:39 -0400
Received: from eggs.gnu.org ([209.51.188.92]:33460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lw945lw945@yahoo.com>)
 id 1nWW0P-0004do-Fg
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 00:20:25 -0400
Received: from sonic313-21.consmr.mail.gq1.yahoo.com ([98.137.65.84]:38285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lw945lw945@yahoo.com>)
 id 1nWW0N-0002h0-EY
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 00:20:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1647922820; bh=l7m9a7rp5YMAFE3atRo0HTvgcYRjlau/pe+j1z+Kl3E=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=CdkMkAexUBSAP16Bpk6WHzUyHy2j930EGbAGwkNqPf72lk+ZJiXCZhEWftXhBrsdrxvIEi0xlolyNc2Io6lZkU74WVxJG71tAefiKP+Tg4EyME5Zu0VMWfUejZCApbebnGz8gOKDaXumboQlAU3XfYMitOZ5xxuBjaKtCjIVDjmjeiewkOrugGcnTy0AsizPAf73BfGGnWuqjD+88ZRz1ZHjF/99bV2Hoi1PIvWuZarnM0bQGwlOXKdDn93PM9LZVD/fh9YpLwWaRsnVTRe1twh7ocUm9gPZ//4bUfkFFeSkZaL/RFQ3XBMaKt4Kyn4luUgRHV5ZgGLqaYGqx4kFgg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1647922820; bh=2+TLKolWeQ9wrsRv8lrvWdV0y9FFYgYJFpK5eF2X+2W=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=aTxJfNjJn/Hoz3U0PIwmxHRMYsScLYqSv3spykgkY8jFSvmJMjvKWgBVJslnPnrVWNJaoykn53wFKYlAcP3ayDJuJUirpYkchqw7E9q9yT8FBtXFlhKGXXdFZNKjeRRzNK0cP8vxU+de66KJLkV4sAOv2lcNXDbY7PeFgCQ4AwuW16lIn7J+YDHetRXmNDeCWQUUIDl5epCQp86j1JuIMj59gSqS0uHX+8GY0UfKKA4Hg5JP8/OkQTPasacSKX527QLtmC71oTTsIxe2QJDSFCVFfIODfVWtur4fpZ3fJke9N19XHCKd9QsuhmyN0D6YbbTGWgXQMDjKtfQ12T40kg==
X-YMail-OSG: kza0wF8VM1ni2HLRzvnwIg0PpYRC7L9Uz0LtBUj35cuS4uqZ3cKjkJxvyRDgLPW
 qfveP.Z_LKi6fXJlHZQ.91cNtO5aZA4Wp_D.vpYfo.I9DFgRQow9eTOURSlZ6S3qF5o38GsfoiGW
 H_nGcH4Pcj61IRsWPn.kQyyOXBWblVvdcGcX4eQj7w9tVq.UvaKBIiq7Bw_7_XF2sMIhByR3UhPx
 M4FhzqHHPpdP.lrMKNGfEQ12Tf8aq13U4EiirtWQP1csSNtyD00yE6UP7ZfkUWwFLTJmLYAHLAMS
 y4eRPdN0OchOomqvjeHL9ACwdpBaqklYfuzuUu2imuOLoqzB98enj1QvIXpDyIDk8qQ2Sl3APOTF
 il2BhqIROFDYwPfPRQFAyVcy97ZPntMr8WMc7EfNc.O1yrGv6cqmjiXI6_NxZjw7qGGjOsu3nfKz
 tbM71z5DOhFY36.7atOvpRW2tl_bb5Fatv0sTSMtiC9SGuVjEJczMclXMGrFzrS63Lil.7XZTEJJ
 niQQyczZFbO38IfNaY8cWAiy8YDXaxsm2utOxjKpjOlHYfU6l7WUIceiAWmUVZ_BWuC3KwYnP5Si
 RpYkZvvo6kvwESGjdAKHqfnmOIclDrYYFhGBRYetyPZDD9.6KWiDbWuZeIX4Qy0dkF1OQN1Dmu2Q
 o7bx4gIVG8HWjYpSH9uYLQjdGTrfeUWVlTLUj8GdHT2bAsVhkQJG0dEfcUcNi._5aP0c.n6q05qs
 0rDQ26psxYySUSZa53kkkCfzx2KqCWMCGBW4zcc31RKhEYiSx_aNIp8jKTwtDLBJHSaW4ObE_3D9
 6MlabIlBF0EL1oblHaN_vl8O3_iL96ar_rfGET0AjiF9_kvs1HQdN7OAicjMN3QKbA4sv3.S1fVH
 wtNqbhiu2Ppb6Rf0W2cgyLYKiJ9AtxvJaE49jeGs1uJow5bJJw4w1c6.tPyyCreOO_Au6.tcoRn1
 PCyb7wMWoAC9GbrN1RgfncwEJ09qf835PcAOG5Jnim4rfng_idCZNBEWb6HVCPZoXrNa9TfINv2V
 DZAmEFr3KxIOwODR3fYZYDOzV93m6aPFDW3XXGaM_u3GjmqonkJMwKJyi9PqmBeoIWXjhp.l8qws
 _mVg0zMJPcLR6TISMe9l85X8jxPZWbxTysLbhOaxQDvhrtbgeZ4FWD99YwiFavLqFcoh5GLfEObQ
 ILI.478FeUPUaFOK23Rn0O.DEe8a1EBB.tgEkfXt6cIXa1PEH3XF0hC_GOmNX1VsWaywrB_EgFqB
 yJHcnRrpUDXsEPpeTZY6GEB007YKKvkk_dF4_hX657G4fQygKNL4N8z9QF7uWItYQlhTFp.3AQsy
 eKM0Tc7Q.PiDc3NpVEVqlB3iNskpsj2QIenVFqAt4.e.ph.H4FtyP0NyesbzOAj2OXkWttugJ6sQ
 s2G7qGrO1u98kZcKfh.IECJ3OEC8wFJvrow_CbB1N3AXVusx2VRqVI1YIb.KSkQ9BhGlOQS3YvLW
 4gFGfZi3D_5NypJ1eQuvPchLyMM10q4JK6VlBV4hUCXPeetB0DeoNfbQrr8GPmgyfAnlR__WvMxM
 d5arjqf8Zw6BJQrKxMs8PhfUGuSKzhK0QpEk8DDNY7cYcmmrtQlGZYqxcSTHG34msYv3O0md7Sh6
 HFeBgsPx7C5pNPZP_sk2aFFe1RIIi2Ob.YdNkriGPWiaLoDGLlFSvJXPXS7VlRQk7SQccisO.bOM
 lJCVB5Ee9wE6iGBlZMQV5hmwVT4Gq4NlWHZywFz_O1hZhQOf7vLsVCREmK8IrbzndqyeXkrKvB3f
 nT.fOGvd6kYabxm6u2gOESjK2Lj7UcqaFyznENTsldVw_o95B9qWXH1i.h6ZFNbwNK4xhLxs7vyS
 QUYk5i5FFo9mo4u6oQaoIzs8njUdxK65c2eK8TGdz3q_G38pOcpVbfu7tMudPv1ejqOyEgmbrDPb
 NqeOxoSzp9YnDXRBvczOY9yV1ur3G6ZTQjsK4oWCTRbBNAfIVL55xlIFfLQmgOqR4hqH1hNx_ix0
 06MOw6YSIXiTeB3eASOrAyTFnMDDxQcz9Q2sXTulEoDaLgtH2S528UEO0ZdfM_yA.nHetFfazJ8o
 5F_mtSpBrJAvyeBgtefSBq2hIKFswyjreXgvMlo2GARkd.nTr1QLqfD.58klT1OokTxqeWAwk.U2
 VLwsVAlq20hM2m3xsrOBvi.flxiGj5tZN7tlEmM5AuFM7xGzglGXVKCfFKnP.vYTSn8N.5Xg_bVJ
 TEZSROY457Nv_Kbra0n0eS7QOTe4QxAoF3q4pLKRYkTRSczXuTw4H76gwTIbFKnsCLPFtM44OKE2
 dFQwj6FXY_DjFkxjf1cIdT6xvlCbF3jVPt6b5Qloc5ijE74uh6BD2L22HSWk6f.XyJY..HWk-
X-Sonic-MF: <lw945lw945@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.gq1.yahoo.com with HTTP; Tue, 22 Mar 2022 04:20:20 +0000
Received: by kubenode532.mail-prod1.omega.gq1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID cd57a348f3b3e19681ab39e769f07847; 
 Tue, 22 Mar 2022 04:20:19 +0000 (UTC)
From: Wei Li <lw945lw945@yahoo.com>
To: pbonzini@redhat.com,
	richard.henderson@linaro.org,
	eduardo@habkost.net
Cc: qemu-devel@nongnu.org
Subject: [PATCH v2 0/1] cmpxchg and lock cmpxchg should not touch accumulator 
Date: Tue, 22 Mar 2022 12:20:07 +0800
Message-Id: <20220322042008.399857-1-lw945lw945@yahoo.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20220322042008.399857-1-lw945lw945.ref@yahoo.com>
Received-SPF: pass client-ip=98.137.65.84; envelope-from=lw945lw945@yahoo.com;
 helo=sonic313-21.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Bug: https://gitlab.com/qemu-project/qemu/-/issues/508

This series fix a bug reported on issues 508.
The problem is cmpxchg and lock cmpxchg would touch accumulator when
they should not do that.

Changes from v1
* cmpxchg uses the lock cmpxchg path whenever mod != 3 to reduce code
  duplication.
* lock cmpxchg uses movcond to replace branch.
* Combine the two patches into one patch because cmpxchg uses the lock
  cmpxchg path.

v1 link:
https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg05023.html

Wei Li (1):
  fix cmpxchg and lock cmpxchg instruction

 target/i386/tcg/translate.c | 44 +++++++++++++++++++------------------
 1 file changed, 23 insertions(+), 21 deletions(-)

-- 
2.30.2


