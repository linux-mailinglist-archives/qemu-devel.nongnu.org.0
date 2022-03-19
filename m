Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B784DE96F
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Mar 2022 17:56:42 +0100 (CET)
Received: from localhost ([::1]:45606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVcNd-0007Pq-Au
	for lists+qemu-devel@lfdr.de; Sat, 19 Mar 2022 12:56:41 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lw945lw945@yahoo.com>)
 id 1nVbcL-0001um-BA
 for qemu-devel@nongnu.org; Sat, 19 Mar 2022 12:07:49 -0400
Received: from sonic314-19.consmr.mail.gq1.yahoo.com ([98.137.69.82]:36212)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lw945lw945@yahoo.com>)
 id 1nVbcF-00070u-LS
 for qemu-devel@nongnu.org; Sat, 19 Mar 2022 12:07:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1647706062; bh=T5uVP7TLlzzvSRtv+kPrwiop5tZ/UMkAu36xhj7x8pw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=JjaNw0GKDy3i7URUeRT/YlO8BSaqbbNB6IoZ+nFx4URcsNGBycmFVK4xUouSlfm5ownqLRp473rwiwxB2hIAaRx6LlMqeF1/slzJiYthvezWQUBULlwSkWQE74vY1YbbsjOxfBgp6wcPaBiSzTNaMpMBXdDnpd5IvDSITVwM9uFxozIISXgFv8lfG4e6MMk/96/2dVHItKcaqWcRUtep6OWDNsMlFt9lmu0tRMz7Np69Fsb0WLgWogUel3MAKnxS89TywcIqg091E8kb8yhZQOeffPKXhU5W0FT121ydMpkluM7SZ2BUGWh6qJSKhZucYm+okgDYqNeUI289Np8reQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1647706062; bh=6q16FSUaj3Log3Rv6KXbzofc0YYsqEZCSfkQrwM41vi=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=P4XZ0ygw2LrW4b0fgcv89hixwTCcIOTaDNswVonWLx2xrKLqFfx1fEaCEIr2+iP5KG1fl1Sejew+ims/d3lQmyXEl0RaVWlJVcfl375pLLuph77iHo0GUykQQD2SSVJNHb613ARDHOTCNLuQwm5uy4SlM6I69yZtcmDcOoiNSoa+cIg6uHhzIpwCmCfPa9k4PgSNxNRXsLMFZ1iAatim/VJE+YBls/ET+be2yYrkEVsOZs59x8iQcIwMNoEIbgZWy3BeVvw0ID8UAII4PYomd8UBtIkdcS8w08shxH1Uix5PhL8T6l8VuiCWp48+uip9vMfV8mVgrbV1ed3dRE45xA==
X-YMail-OSG: e5OxzjUVM1khfl.O8S6qhJ1HlHeX6KenZw7VupBUPE7QMnUkNmlR2mVGF6TjtQO
 Jx6NYDSCXATcL7C1JFAC2KISAb8v97qQSgKhzyHkCbfWOdtHKuF8HGrj9THffTjveZwxQF3kaYde
 0K9V0r.IWuY.9TBurel2yi_.xPhylgPfqyicZsiFCo03aP09qV_Od96TiC7k3W15U8s8ntLQKe8d
 BFdzAaiqZok1WIscUkMqNZwpS_9kXyRNL_Zamp73dn.8qVIf9dntZwy7Hp5dsSgFPT6dMQpfv9DH
 gOZElx9CIlBcM7hJUmA5mI0ts1hEU.pT.mDIswBad03jchyYEsgzSCLcLHT4r3uQ3Q66eMECGt04
 DO2LX6w4x4qfV4OxF2KJAdQZfl.K4c_ccxtOLDW59XDwIdJyfh0dKVcFyG_halIwe4QlXyuWfMA4
 LosVQmct5lKDi2BX8u.PEdWXa3V.XiducZX58UUu58nrUDXHqCpBnwgufk1v8d3LA4.Vv6HlljGz
 Wurx5UIGF1LmVZhzcYhrnb1J8HoniX1u88ImPBOiU9h9dN5tbo9_G..nmFVoMQjoF.xSDGGTHSmn
 K_uLhnPKGUSh2BkD2rVD9Cs0n4eoSoznGY7Blu.Gnz2rZFe29Jhh9n2ox6w.NxWoxSDiEZrkvWWi
 3hisbMN_HADm4RfJsGPJo_vU1SDXe5PmTB.lx1WNydcqWbpBFJsfaznjkxQ7QWsWaXs7neFf3hhu
 .dp2aEvn1JaG_D0GSzNSuMrDi1iBBEDqch0RiLjlZ4VbHZlMv5GO_iZgVeQRGPYZOiU4NToEp_ju
 g7FPe2OsBl8kjSEFOARtK7BD45pjQivLIjeelUFVdyyMztM_qeK1eJOOL9w9Ll.wZzGsOLHTPHUY
 hvdNW_DK7Un5__9MBJ4HIRTQa0jqimfbBC4y2VIoBgzs_LXFm3k8azHc3GBaI8bP4BZaG0e6lEiJ
 nZuD4IqphHIH3iy9q2V1F6gItMKJh894.u_FOkrlOqNj7.y3Pps.16AOAGAZgQK5Zw6NP8qjy6ob
 bbAEjfAtlzwhMLijHUn7myor_s8JfrMaMQYuFDkzZYAa5at_u4J9C38iChdzafZHbsUHuivD7K8Q
 ku_TrnWY3eY8TGaxoWHDcxzuzFMyq4jdpFySOOXesd31fzVdV_uQhmO4gG6EpXYSPUK_ej4N_4H8
 N.sdF2a15ze3RnqtdEmEjlWt3hT_e7HkgvKZIRjBP53PZ_JAFNwj6s.sY70h07lqDPxqeQhyVB8W
 0me6x2PaDCEdKveMtml8etJ0tx32gd1XxTzVgaAwVFOLOVKHyZE.6v3kBfG7hgqdanOfLBmQc7aY
 T5Pchi72aYrhz6Ntyc_omw2OmKk9n00.w2ROyzTVDPfhWr1z5HUPkuH6S2N8QR3i5azpqsek2jCU
 cJltbIZag06R60FFdnib_u2ttIDcUDvPQpeqyB5mUrd5pxdOl3RHkGkDkBpGVb6fxVAQ9.zoYTAy
 6U5wHXMaVclH0rfyhz58gs5spkXVHtfKmp14zxUMokY4GJaKDXYy24Dh04YCwok0nle6kQgZrvpX
 eWeb2ipTORDJE2v_3fJhS65BAmqCbefsV8ixdE06YDND8vQenbn1746x.9MPSqLQ0I0S13sgrrYt
 Yt9cmrduo7w0IzrE27T2NyJtJwOKrSNuStae0JW8iFJQncaKM0BJ8EtSHhkv9aQXAN6d8jtiX7AI
 fH51Dx9CcL0WUE4r9VokugFwcmMATF9H0wXx9ChjJexDgQshaesbIOq8sDwQjrNMMN2Yv8UOmJJX
 kCWYqVeQXWJhqAsl4jHDdYFvHzdtbzsBO67eHUugE49pFi0x0E2AsLm5bqOVDjdc2yfbf.8Wjn_6
 Yy1JPifixczU2CjRfqdYd8XPDTIKbhD4ApADjdCfXViQtc8J9RM3ocDa1liI2SPiuoLd2YMYsZic
 gWkS1Q5xl0ARJJuBnSrrs386SgHOT_TtOd6uv6jeM5mJFvX9Yf58EgePTVhjjIzAtaT2ZARRtvAl
 hbcbYLF3DtMNRBySyvA1gwG51N9CQmGHj0c6Qj5IvJtzpQETGbU34lbJX72m4ZCuuwfVCZAsL6Pz
 E0hrF57rtV.xWiJK8ueKqSLmeZlPBB3td2cmT4r5rOmY.iFrEY2gyxIT_BDMj5wv3X6yaw9F8NE5
 nHTRHdCQZ.7GySsk5jjVpFszcR_60SFn9VadJJ_ua.iMWWaSwkkBT_RlGlXq9xMSawKIc9oMB5G2
 9sqpz8ONtnO3fXHI.MsRhqyHmAr9AoJDge4BCHnkXZCngZbUDTiYXbxYraXNSjY0q8rHKhdQ5
X-Sonic-MF: <lw945lw945@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.gq1.yahoo.com with HTTP; Sat, 19 Mar 2022 16:07:42 +0000
Received: by hermes--canary-production-bf1-665cdb9985-zm65g (VZM Hermes SMTP
 Server) with ESMTPA ID bd8d586da7e6832dcd6ba8030d16f89c; 
 Sat, 19 Mar 2022 16:07:39 +0000 (UTC)
From: Wei Li <lw945lw945@yahoo.com>
To: pbonzini@redhat.com,
	richard.henderson@linaro.org,
	eduardo@habkost.net
Cc: qemu-devel@nongnu.org,
	Wei Li <lw945lw945@yahoo.com>
Subject: [PATCH 2/2] fix lock cmpxchg instruction
Date: Sun, 20 Mar 2022 00:06:58 +0800
Message-Id: <20220319160658.336882-3-lw945lw945@yahoo.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220319160658.336882-1-lw945lw945@yahoo.com>
References: <20220319160658.336882-1-lw945lw945@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=98.137.69.82; envelope-from=lw945lw945@yahoo.com;
 helo=sonic314-19.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Sat, 19 Mar 2022 12:53:45 -0400
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

For lock cmpxchg, the situation is more complex. After the instruction
is completed by tcg_gen_atomic_cmpxchg_tl, it needs a branch to judge
if oldv == cmpv or not. The instruction only touches accumulator when
oldv != cmpv.

Signed-off-by: Wei Li <lw945lw945@yahoo.com>
---
 target/i386/tcg/translate.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index 05be8d08e6..4fd9c03cb7 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -5360,7 +5360,12 @@ static target_ulong disas_insn(DisasContext *s, CPUState *cpu)
                 gen_lea_modrm(env, s, modrm);
                 tcg_gen_atomic_cmpxchg_tl(oldv, s->A0, cmpv, newv,
                                           s->mem_index, ot | MO_LE);
+                label1 = gen_new_label();
+                gen_extu(ot, oldv);
+                gen_extu(ot, cmpv);
+                tcg_gen_brcond_tl(TCG_COND_EQ, oldv, cmpv, label1);
                 gen_op_mov_reg_v(s, ot, R_EAX, oldv);
+                gen_set_label(label1);
             } else {
                 if (mod == 3) {
                     rm = (modrm & 7) | REX_B(s);
-- 
2.30.2


