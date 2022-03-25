Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA004E7573
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Mar 2022 15:53:14 +0100 (CET)
Received: from localhost ([::1]:34908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nXlJQ-0007M3-UG
	for lists+qemu-devel@lfdr.de; Fri, 25 Mar 2022 10:53:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lw945lw945@yahoo.com>)
 id 1nXlGp-0005qo-8k
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 10:50:32 -0400
Received: from sonic304-24.consmr.mail.gq1.yahoo.com ([98.137.68.205]:34881)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lw945lw945@yahoo.com>)
 id 1nXlGm-0003Gx-FX
 for qemu-devel@nongnu.org; Fri, 25 Mar 2022 10:50:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1648219823; bh=f9ggRuwkHzUb+Qux8UDA3BgyZdP4SEcyeFAcOqRmhzI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From:Subject:Reply-To;
 b=Gam5OuwP4wmvYsU5umEheyxx6icCg6LZtt5fFJHGJTkcCI6OS0WUERC4tIJlIakdReCLyNM6K14diUUuhMuooshZn2GwdklzfTB21R4DKbsGK9T0nSOHyFcLBpce9oF29fOYXBIGFkKvuGUT/Y/PC3efpOmyCphIeYArCUqs24fKSsVbHegQ3od2Bz/u7GRMgHvWXoakz2Br+49lPh/wCY85iLavEQEK88FET7dEarKSFVHNHvYn8uU3/AF0602bxT67Zl0PSXaX94bFXnhZcCnr+Dr9jZIWhJB5MTOScINaD2B5zpNvyDqqNhwG4ZrUJfVs0EfaaagGkUQWwwcMcw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1648219823; bh=OHlP3OS5ZSaK163VHbbVigHXFV7UvjqtY84kQZEVvxq=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=LVnGfi1PiiahOv67ck4qnu+ilvVJsm9yfgc5U9ZVw6JNJIQzkmjvEr0pVkczxi8KfIXVPK5TEBN9zx23vE9YjRhifoQqRTi3QwYHoPTP3rjwUbyEs9KqifDqm1lqJv1a3ikHOjgaz8GnEhj4KaN60edkVSgr6j60Kl2hRw3GLwKY12OBmxY74mf0X0g1O63neeS7hQ0+ipvi5iASw2jfdnvCok8TO39umTqqxiMfcWB2yLKmh1zvvAuUlfq4yyRM65qHWcdjaskNIQopoQhuVSTf7OGGETVAQjrEc/oLupsGAngh/c1l3zDjI1OJsoAgHfFIV+yh5/8eBNQEXoL6tg==
X-YMail-OSG: MSVT6dUVM1mEBDIMEs6d1XjiaVdLpTNgZv9j5FapF_qfdTOQBlRzhO3xFZ2qSq2
 VmWx4aAAkUsLesq_Tu5pURzrOHFYOPPwCJA0RKh5.r9FI7EXaNcqNiMgh9AjfG1crO4uJBHt1LWy
 OFUImPbrD_KFN3hRuAjq9Bv13v0aRjVZDM8wHvenRk8wIDJICNw17p7rTWtLZOfIh8FXK2rXeF5e
 2L2oACAGwDhURt221KACm0GwHJz6R45TDjGhgJTwxUzzGUyvuhl6FdgFbSewQR.d8Ec2KNjI7VUH
 yPLyYuiuizyySAcM9HvdC3.Ux4x6lEzr1kfSuAb1XH8hb8F.S02Gi_fCN2LmLanlxmeOBv41fXBO
 EUgcrwRn3FHHuC.aUX7zbBtXpGszBgB0QSsJ4j8hic6_3lMTNo8x_9OjcQfNVX8LvD6erhQf4R8N
 sr0RaAlJCtbXmPLAr2Z4mtr9wtQc0b3jZsvsleo2B0PlPJF4Pw9StN5eIH2m0pW21rYQ9uqcUhfu
 K.zXpUmVO0HjW5OP.OSb95qg8Bdz2497VdpJh21RX3oLYBue_sLuE4UwKxF.M_UxthYfpUbs_fDC
 PClCrA4wibmmZyoC4Gea2JqTqoYgCPi3NcSgdnaf93.5isKlq2ze2A5MmCi6kVSusw.3d15ig7S9
 nM3ssfNqGWe4YlU5LnFR6YMTtddPhTeoDB5udJuJsiEyzS_uvZLApWbytGa7Cmxb2l1I5YXMMSWv
 k38EDbAqcUapkVSff2FdOi9N1bgivzp4Kfi2tw8NKizU68C7030DMOBNS7FkEOJe5Im917FZ8gOT
 wlckqN9__NgRuTVeojxzOWYf46gSU9BHzJAhYYfHpcZ1kvAeSSN.t116evQuE5G4HLgUmideiuSW
 u_VTa6PdLULWQJge5CWpqGbWBde3vf4QHHdrNa7KZyvY12ImHSpQO9YBH4CvQk5LvRgZJHmPJe2Q
 7Pa07IZqf.W9OgC1ZxlC8v0z9EAUzriIUj7myhQdQk7OfIc6oePSgfJpD9TpqDnDLH3spQKjzpiA
 KI.KGSk2F58O1LYABL8d9WU7_JhLGIgs6Ny16rU6P5vCzspKxgSswdkNwuHDoYqQbTd_8CIUZvuW
 92m0REGXd2.FNy9vs9iNJ77.G4rEVW61PWmJI1og600YS1hhxKlU9JBxeggqZRAQJe3XU3jrbaDo
 MeP5St13MlitVikETIXi2tXTjAkU6hljjsm1Uj9rF9R.WvNWbOZJwW3Yo2UXz6MPjjY9BHqAtfTP
 Z1EWFR3gHogHjR43EMkqQKPAPXDWAjBTOxXWlJBtu7eLaS7_DrRCfQNAt__0tsf.X809xGiq1._O
 MH4GzWeyXryvH3W308dy9o0IjaJqHvR9smcNf40._CW75hHYjZwM.xYTaoS_mfRonriQELcdGTza
 MFyI5OxJ1Vn5I55EAZWVDHiqIaqbwr04ecgi1z76Peh6kQIU.KQPHzmvGojEkyJZDWmiqmG3cEcI
 KdTId96zWWWkhVkKeMNMjyvMpKGdnIGROYjGwjf2ha5ttkhCWlWL5yIKMaCDa0yc3n6ZrjWH6mp8
 CBoABv.aRr836jsqpGPkzWgpPfPX1fDz2j6K1l0xDAcZqFgnaS_siWRLRbZnQWGi3UbTv3X1OSCc
 kIewyTgM3sv9aHlk6PXJyuaf5pgT7MvKlpSVt48Pnk5kHIO1Qo8ITbq.cRmDxAbffPE7OmKnLdEC
 8zfgVizr0cCtI2NSNCC.468no8U2FpGrzdDFIfPbWOuHO1QtISKdqoVCSqyqDMUjHFFW08N_rT00
 FZW2fmuwyOAeWLO8zx5PidFUXw4rEnda9dBQMU.AgbDMX8VapCUwZo3AFFuYc.pv9Q6AbWQ20BBz
 zcjDHY.rwNWEcpMDIRyClnwbI7wKLfkYB7PUV.pDrtbQ4xBfP46m2MfqORixl1DdyHnfMuX.I5FH
 oVXQd5awmewKl5KRuNoUhdYGp9K11U64SxzPxs1BneXHVB_bP1d2rveS9W0CSvOc34BuC9o9BZSV
 wojP55LzOL5hBEi3PnBlYDspk10n5b_9yGE4.rqzhOtwUuP8SBAiX2dckS8g37LAPWDc61X9bC1o
 IXSn6H2lp_8wPBL9kT1E9yUHOxGiXy4xsmaaMNkK7otOF0PfADD1qecjfk1wcwkF3tnmNHgmS2oW
 eIPnKh8GA9D8wzkLHfXzYQg4SU0ttuXiO6qWp3CVs9raDuDq8xkX97QOvQJ58_Mb5fKUiQcxO96c
 6Gxcq57P3AYSF3IAVjwEZ34k4b1w6agUcvCRKcVe4nv.g9RrkrKrVaDaleEG5b1uyLhWPLFDG3YO
 aD3BPj2aBJzA-
X-Sonic-MF: <lw945lw945@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.gq1.yahoo.com with HTTP; Fri, 25 Mar 2022 14:50:23 +0000
Received: by kubenode516.mail-prod1.omega.sg3.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID ee9c67d9044eb9cc3a7d6349bbd1d60e; 
 Fri, 25 Mar 2022 14:50:17 +0000 (UTC)
From: Wei Li <lw945lw945@yahoo.com>
To: pbonzini@redhat.com,
	richard.henderson@linaro.org,
	eduardo@habkost.net
Cc: qemu-devel@nongnu.org
Subject: [PATCH 2/2] Some mmx/sse instructions in 'gen_sse' don't require
 CRO.TS=0
Date: Fri, 25 Mar 2022 22:50:07 +0800
Message-Id: <20220325145007.448948-3-lw945lw945@yahoo.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220325145007.448948-1-lw945lw945@yahoo.com>
References: <20220325145007.448948-1-lw945lw945@yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=98.137.68.205; envelope-from=lw945lw945@yahoo.com;
 helo=sonic304-24.consmr.mail.gq1.yahoo.com
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

Some instructions in 'gen_sse' don't require CRO.TS=0 and the opcode of them are
0F38F[0-F], 0F3AF[0-F].

Signed-off-by: Wei Li <lw945lw945@yahoo.com>
---
 target/i386/tcg/translate.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/target/i386/tcg/translate.c b/target/i386/tcg/translate.c
index fe9fcdae96..14cf11771c 100644
--- a/target/i386/tcg/translate.c
+++ b/target/i386/tcg/translate.c
@@ -3139,8 +3139,16 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
             is_xmm = 1;
         }
     }
+
+    modrm = x86_ldub_code(env, s);
+    reg = ((modrm >> 3) & 7);
+    if (is_xmm) {
+        reg |= REX_R(s);
+    }
+    mod = (modrm >> 6) & 3;
     /* simple MMX/SSE operation */
-    if (s->flags & HF_TS_MASK) {
+    if ((s->flags & HF_TS_MASK)
+        && (!(modrm & 0xF0))) {
         gen_exception(s, EXCP07_PREX, pc_start - s->cs_base);
         return;
     }
@@ -3159,13 +3167,6 @@ static void gen_sse(CPUX86State *env, DisasContext *s, int b,
     if (!is_xmm) {
         gen_helper_enter_mmx(cpu_env);
     }
-
-    modrm = x86_ldub_code(env, s);
-    reg = ((modrm >> 3) & 7);
-    if (is_xmm) {
-        reg |= REX_R(s);
-    }
-    mod = (modrm >> 6) & 3;
     if (sse_fn_epp == SSE_SPECIAL) {
         b |= (b1 << 8);
         switch(b) {
-- 
2.30.2


