Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 310B74595B7
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 20:43:43 +0100 (CET)
Received: from localhost ([::1]:50350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpFE5-0004AL-Rx
	for lists+qemu-devel@lfdr.de; Mon, 22 Nov 2021 14:43:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liewkj@yahoo.com>) id 1mpFCe-0003Kx-M3
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 14:42:13 -0500
Received: from sonic313-9.consmr.mail.ne1.yahoo.com ([66.163.185.32]:34000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liewkj@yahoo.com>) id 1mpFCb-00008o-TF
 for qemu-devel@nongnu.org; Mon, 22 Nov 2021 14:42:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1637610116; bh=2QYna45vvGFXs/9Z/hukklPTqxdKpnzu1hAWoxFGRlE=;
 h=Date:From:To:Subject:References:From:Subject:Reply-To;
 b=uImf8GUv6Azp+bbRec3yA2I5bjskK265W0cdwl56IgcQB/bEFnHH+WF50mS7/ODPahQThZwDyqN0cW76LhEqSabm7+955Z1NxLJvk9a8XcIabKWgvBLjGzMA8VENSG++f6Y6GMzr+WyRu+R5O07V7vdEN3I8hJAYjHOB+UMkkX33hVgQc86ofWVbVJ3gaitfILDv9C0YAN1j/5woQrdL3otQdBDs+6JFEIw7b1rWYrctwhvIz+BY/uz6uVXaP/QsD4NC90ysqGIYTga49cRrQMokVev/oH3tDxyFueY9dIGbycYWi2Ng3OxEkM5FoYQcEd9In962fewkE7F3xea+hw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1637610116; bh=c+KT16GftQcb5svDqQG/68FPS32UiktaobD7+PDCA5R=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=hZkE//SrR6PCrEpot8/kv8c6AP+Ez6SRrVM5n3dFUhs0ijrrPoFP4risA39kHPJ2sqlX7Y3u53Xo9DjRdJHBvp9AT5tNH+c7KL/BKw7dLHNvAhX8Dbq2r6/nYI/Z3YWo5vRQzRV6y2ZLOCraQM++XEYDOhI3cuAumUZfyA9SG48cbat7pajGEV/5rLqfRkl7m7ywlmpr2z4vD1TvNXXnGBPaTeb8KzHlNTqzr5r01euRSlyUYdR7Twl6dgc45RM48mB8jjbvweIgwF74RQfJ4EhdnA/wfNgzX38BFX3MiMUCBZssNBSof0HMIoVzJtzFK34nqgYwFhoNRhvxk9dDBQ==
X-YMail-OSG: jfPbAWgVM1l9YLNwtN.t7eIqDRKN40X.6d2Ij1dfLqRViV9BlIOzYFpUIJhgEye
 61lTvFYtD138m3bWxHvOlNrZedhLxMbelKlf6UXf._FjhtfGrDQOj4qtdutfiE7XAINEC1AARvqY
 we3I9rkvR15MAmWqUltp_51NcKkk9xltDuiOP88CxuulgP1eodFQqbw6PjL1nRxC9ycdEBij6dfZ
 8D9cz2rQNtfiykrXkgsgULwgo0rOwLoEbdqK1vpZIaDSpMi9KCWSW6Tm91Um9tG4t813uFk71g6z
 Job0GBB5TIF3FoKKmY62UNeFMOMqAh2xcd642ExM5wGZE4NFYoNBJ1dgFX6vuzP1.RgkJc08EowL
 75xvQH7XLLTfvRdwE3xE8Qb1aE7Wvnn9E7u4MPSdlzCqQIOPQPGTQidxCwCjwzCFR9.2Me5aLRbq
 _I6FGaupHcA4tcgP5u_gQkY79Yurn_bZE.zx5x6Gt7I4XMmOnumokEs.MWJCDIewcdJqY3r1wFG9
 fVPL32rc_Z4kEUeESZkS3d5le7Gq20qoMqVC2g.EBwYMBMSZuizDN1JZD6HkpBmQwof7XOj.CouB
 MBKLZhwnl35C_gWvnQ326wU85kLJZhyItsEEuQQBkMbLff4Fc9phE_Cop2xSbkrNAwB5VBW3Lxa5
 Oev6pBq_lTNLk39SCJl6Ms5RjJCw9FSaPjidL4rgV41JkOuCp3jl1dhJU2T5ix6POzgGhotKfkiI
 BmT4GZQSKDHUyH0UVVzcqddl3DpYUugG.HAclJ2WF4wzgdGf.ep69BWOfUPIl3NfKlXGNs1xEVY6
 xwQHVYpjp3ax1rQyQtvW2JKViXVKyUVvEL6GZzGQaWv3BPYe2AwAjCJPufSrtKrNhJROIQcgnMPr
 W5kZscf1MuwNvdYEZqXVDqHLdRrY3HTz14MW.bNwRrgS3G8curb_n1jGPYSdw9yKkpvBanjwRBKg
 paaHXHXPTa67d5HaESv6jfanqaDNb_2rNrM0oTeUeeXkO4BKL_G6ggqGbrmWUhoZgiYVrOcKFQ92
 8u33jSAQ.GNTi5L90VMoFjSEk65pZGJY5h9K0NT846FGf4X.yOYdcPvIs3ZmRWKoK50dyt2BCHv.
 I8f53eO0TVv34PMHoLaPequCmT_1TN7p8uvbJv1kNM3LzPokhoxWdWP_mVo7QZ6S9CxABBGePfbL
 PQVrTJcAyGjQ_hR98lod16fFnrh9Qmw7tvSjivkp0NS9umumuJ0kiH_n5syU9NH5IXJHE1x3Ky8f
 mSXyznL_z6E.JscqSr4t6YGJtMsPdYNZuqWWLo6wgKQ4.i8Lq56MQ2LSisudOjB1.Is.dFCASxK2
 wRV3VINEbrueSM8kZBt2UVbcG1S4Qz47XjBNq7grNYkRgJjDtEcJnMsIuV6Cjo2XEuluVc1AMfZB
 2JU84NpZG6fOUjRP7PzIXywCTQZ8.WCLv8m.VGm3nrPKxUDTqhMougq_9avFRKzc61yg.VbOEBio
 FZvGW6DxPTpFpaw.jybJe.3RwKTa9mXipMc7l0KWr9uNSBd7wVCTrHUwr_jbKBvUsId_6OMDac6f
 uFQr2buYGksM5sJdHWfncBygTU4w.AGwX5MecoNK5X2uA_t.XAhlBNgBdzWN7jeT0_59U8dLKF3O
 jK2O9L5Z7Z7bEl6Rf4BM56OSIKn33VGU6RbnSZefF6k5ri3wYJniXs6HIMnGMJRCITK5W9LW2uuF
 qYp849DcfPXNOnBhMmEuwLNGg.a3KsGXNkUkoV4v3bOKMgWgPoSP9Akt8CxQyn7kRnVk_VuD9VU4
 GLH_T4wkrVbpu3o_sAc9TOD2u.bAXDTxDRm7vF6hBRAaXt9H9Ts8uwJIgEEvP3qbw0cfQyorHKot
 NNrDu1OiLL9VAy1jqE0VCChw0BBWZbnL_scG1BwZ0dv9s06PZDPlkGDjOnTwSrso0mF1Oq8n5aIw
 fXgqHLD7qnhN7lC79AOnGjxx1WpNbdcsbmSXqwcTJXe9s1l36An0TR3LvkQefE1O4PtP3.7IHXj2
 JkzKOq_qC3QIjTfgsYJEe3scHjWUWRh317iYIi28OZUZKJZmmR1KlriQ5C.l1IjS7lKhzNUPQR3Y
 PO4FEY5Pg_n2.APG8aMxhL1jI74kPQVXFhh40Lo5.Ajr_LNcd_yEhIQBLrmIkZdBsn5JHGJ_Z175
 NPIz3gWfCMhdra1kcEwJb6tWAkXJgVLE9ExZK5_iK.bF_Z3kIhWShOttFxJnJgr.Dwu97OefaKU7
 5asR745g_g1nTHSvLdA8W5j8xd9Ck75cFx2ekALWA2imI8AvbzsVJFKILUxfQkA--
X-Sonic-MF: <liewkj@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic313.consmr.mail.ne1.yahoo.com with HTTP; Mon, 22 Nov 2021 19:41:56 +0000
Received: by kubenode545.mail-prod1.omega.gq1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID fb493d225d36894543b80f8a96b25a26; 
 Mon, 22 Nov 2021 19:41:53 +0000 (UTC)
Date: Mon, 22 Nov 2021 11:41:51 -0800
From: KJ Liew <liewkj@yahoo.com>
To: qemu-devel@nongnu.org, virglrenderer-devel@lists.freedesktop.org
Subject: Virgil 3D with SDL2 on Windows 10 and macOS
Message-ID: <YZvyf4h+8e1Kzwp0@KPLWX0-LT>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
References: <YZvyf4h+8e1Kzwp0.ref@KPLWX0-LT>
X-Mailer: WebService/1.1.19306
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
Received-SPF: pass client-ip=66.163.185.32; envelope-from=liewkj@yahoo.com;
 helo=sonic313-9.consmr.mail.ne1.yahoo.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Hello,

At long last, Virgil 3D can be realized on Windows 10 Host for Linux VM
with host OpenGL acceleration. This is based on initial work by akihikodaki
"Virgil 3D renderer on macOS" at
https://mail.gnu.org/archive/html/qemu-devel/2021-02/msg04235.html with
improvements.

- Remove ANGLE EGL dependency and reuse existing OpenGL Core support
  from SDL2 used by Linux.
- Fix known issues with OpenGL Core and provide MINGW-packages for virglrenderer
- 2 simple, non-invasive QEMU patches, supporting both Windows 10 and
  macOS.
- Performance comparable to ANGLE OpenGL ES backend.

Addtional SDL2 fix required to workaround Apple OpenGL FBO quirk.
https://github.com/libsdl-org/SDL/issues/4986

Video captured for Windows 10 and macOS are available on YouTube:
https://youtu.be/n7cmYMJd-lA (Windows 10 21H1 Ryzen 2500U)
https://youtu.be/FVv8UjGhYPU (macOS Monterey MacBookAir M1)

All materials were published at
https://github.com/kjliew/qemu-3dfx/tree/master/virgil3d

Regards,
KJ Liew


