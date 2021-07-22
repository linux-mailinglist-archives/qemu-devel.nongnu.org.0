Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C3AB3D1CD3
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 06:07:03 +0200 (CEST)
Received: from localhost ([::1]:54394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6PzB-0003qS-Ur
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 00:07:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55234)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stilor@att.net>) id 1m6Py0-000322-OR
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 00:05:48 -0400
Received: from sonic314-25.consmr.mail.ne1.yahoo.com ([66.163.189.151]:36929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stilor@att.net>) id 1m6Pxz-0003ha-1x
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 00:05:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=att.net; s=s1024;
 t=1626926744; bh=AnHet4WoSYNjZzY/oySp9i2xnE+BZPEE7O8b0ovlB54=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=CbfLfFF4dsGNkMMP/PtpjZALCcgydRYi6VDoD5oFhXsKaur6XdPcT3UwX/IgyZAOe9Ty1SpgeliRk+3zPKj/NJZp4yETuu3PYyr5FnLKDrXGUODG3R3/eTU/fNwB/FK93m2ABGyZWzBFhZ10RnjigcJIoW7IpE44uKB6duvK1zg=
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1626926744; bh=H7EUQQIVE2XPN4UT2XG63oVuTYgLzhGZcZbeCTHQqWD=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=oUnLUtYPq/m5pDzYkG6tCyLJvHorhA+hv2rowLbU924Z8qcTToy8IHOxSOOp499+SJUNHK4aDQorwlwSnXtijiROz7fnQV0+FL9yelLjLu9rnHdo3nJHHmxvFojV/oy+WJxus7kjj32g029KBlmOeYMq8KZHlZWwnotEFYQWeDeFmXbLutY9jertC6FyxPukLQTAee3jU9AfnQnS0Rmlz6DtiAI+vng4ArrQ/IiTfNSLPJ18tVqDv3m7CZEfD/e0GhsqH+88VQff1LbjY3Klx6WtR0vYyyyjUS3waVYEH8093gFkreI+qYJQiNokbURVKswXLL83qts+9j4s7NNqng==
X-YMail-OSG: dTgcjFkVM1lyoqNekpGzhg_4nr8AIzJJ9cxuvGPp5PLl9zYE53KtN6huVV9jMg_
 96ychexckHoy0LqVBJtu5bk8sGQiJfB9t0ERjjjme3TFfsk4pqRKatZNHa8aUvOtVjfI5rJDhSak
 oohSA2S2htwNOf0rTRdrL.eyMA_5a6Phgg5ODA3iAGVVrKcGmxoJV_0ixd6HGKSvNx8rebSyU8eg
 NzAviYoRlNje7jamPTnDjRUULMuEkV_Z_63kjnWyMsnhzDPY2pOCNFy2miFRdVYGlN_z6EPBrniw
 4IIQc7BO.uZIFn36OQaouuq8XTE_3OgY5gSgzFG88MFDXffJcXE9cZ1sewvQRPwk5rQmcEGDlO26
 ..95T9YpPQDnYy_AHe9qJcbHRrEqGeNLNXQzAVnIarT90GWfd_XlOxLc1U6R7LsulgM3ucBdd8VW
 .nEiquoITuzD1VZG5RSzWBT0IEGhNPfufaJBQHbYAJB57cvbs9RTc8DWWPckMT1.lL45kpVAWbqX
 yfueTV.SJ91KsW0z2d4ZRsTVCsP.wFSLHDteHYOsGepblKJvvMkNHLiAqQ1Qyzd9RttUjfDKT9EA
 NY5lOCv2OUwyhVuvX3EYvSNDMY1mvRX613Mm6iXjZiF6..WxvxgLV.Rw6sEG.WLki8Lw_K7nTqVm
 90OUDVWpSjFXpDl_XQ9Azsphmz4IYPE5Zdyi81B2G1xCnQwvjlMnpgynSPcHhwldWVkkwhW9ZCJc
 AA3DTDBerzXbnOdD32BC10YQeGO_K6xtp7TurgnI1d6n9YH4pYsglrDie3abybXM6xSm_TZlEn1s
 55wFGhf5HwJZ1AFZYoy.IYI6wWafGpLeFLHKMgw.3hw58gXAN.yw9ZYYmTHfiy9DPotywOg1syXK
 vAiMYUH9VB.CcDvmjv8H.Td._Dpaa_TM_DMd_BMiEv_HwD0jDHsIVa68qY1WebRnYC6LoJGVm_RD
 tkjkstVK6rKo9l8deU1z5q_nkjN.0V2kAERTFffjQUhe_hKKp9_wPt2qkrkRxGPmWRbDHswBJiqN
 5CcHL68TU9Od.4N02RBgdRB6yPe4G5PGy0Ki7nMkNBTD.FiV8xdTHkwN2QTatw_2X80r52GtaDet
 tVK8qv3YEnUX5NV4uCPoj9mOyJEjjJgftqlSS2rPVDRsE7KOupB1gpSRD4CmQO7G7DqJ2knT2adg
 mQqhwoTmU00mlUp.NPmbU3cyYfQs35u0QB5yVjMEDQ4hE3oN5kOUP..hdSD2Fz740na8QRYMxx4N
 _gF_j0Eh2BjakuRbB2F0qyh7B3LP1zVGEyTcgmBK40QLAlPO1sj9UjQtP4W61BCNaO.PsQ.YeYUG
 kl4G8Y13hSjzEmIRXYdWX0LqYBQ3U2Vhv1rvUr1BUT_F.gpKFRijba2P00OXN015L4VJn_UO9JoX
 w9biaa4A13EOHUFCpBqmZDeSTo7WCQ2BeOebbipdtCF636xnHcGTtMc8xBCIz9FtECMePSC._Qwp
 NwuGoUzaaBNZBhLTSpUzZSd2P_f3GzT83bNDl71Uz5ij3ivimPjczBiYB6v3vgIgKQpvXOzGBVbB
 cPT1MIHk7Nw6Q.SRnm_3HQlZMesm0w649YJUFHQNI8DVBju7mwR8Kc2LLDF_xTXcQBVMwn5PuO1I
 iWJ90JrOyr8_1ZR37G2iHO3Jj9ZQusUIb0BnbMYOeVOJF62Cta9Rd63mXC7S6NkBc0sKeuYyn8pi
 1D_7mYZYqbs_h_FGpZuYAaDmlMYtu1LZHsw8YGDjGKByWj93z3luaA8QydhYMe.z7Km4X18N3MaV
 w8p7gFHID7MHLzdcdhnIXmzqM_ENMDvQni13wctJw5khYwO.MSL5kgIT3LNrs35Arw11QRAzuUS4
 UwoQF4R1EHizAVArSUNraG92X0laTgPSlVXnIjrb.SzecZ.JX5uah307iOolExRbbjepO6eW_WTX
 BiXvINi7NV2hY6TZ2q76RQr5YBz5_OK43qCX3REyQ9.TZ9.Tk5UqJpd0Lzkp0oxjbF8GynNj4ykF
 jqYsPzZ9ZzU8CXyK.L4Kl86S4vetZnicEVVzPBnhV1OVWTGRFnFvYW54ftKjbvC1.uTTWe_zBuvK
 .5a2P6XSihu..lrFnx5HuVlO.FtWqb9vJFiRUW.N8rCA0NTTzD.HNhJAN_ZQ66At0EDKt9.m_FxH
 C1XR5SE5vBHd1qLoIb.QLd6OM2a8X.p9DFkiAhFmrQ2Fy122L_FtGLzFILlqibkN6dyzxD4_JRrc
 KJ5m1uqzlYrd9Tff6iRk4CDVtGIN8SwJPUltUIfsvVsjP9j3xzsDUSiJG6bUsjNFMJx4M226fmPO
 pA1vzBcavkzYfuSHGwvBQX439kSq0qe5Drp_om4fbAug3FOQTRXTP8QLzX8cku3nkPdWCUQd7O84
 E68VBjMkEuzQli2DmP8Dbi0av0iFBKypM_77Y9ZIcHWKS3MoFfF4hhvNBiYKNGtktZeycTrekofp
 h7Sr3K5SPWo_OhmRpW5EvhaBqlrPM_didsQ--
X-Sonic-MF: <stilor@att.net>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic314.consmr.mail.ne1.yahoo.com with HTTP; Thu, 22 Jul 2021 04:05:44 +0000
Received: by kubenode521.mail-prod1.omega.gq1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID e8a49a99b3a59f2d9d43c0736d1ff1e0; 
 Thu, 22 Jul 2021 04:05:39 +0000 (UTC)
From: Alexey Neyman <stilor@att.net>
To: qemu-devel@nongnu.org
Subject: [PATCH] Makefile: ignore long options
Date: Wed, 21 Jul 2021 21:05:35 -0700
Message-Id: <20210722040535.3683543-1-stilor@att.net>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20210722040535.3683543-1-stilor.ref@att.net>
Received-SPF: none client-ip=66.163.189.151; envelope-from=stilor@att.net;
 helo=sonic314-25.consmr.mail.ne1.yahoo.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Alexey Neyman <stilor@att.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When searching for options like -n in MAKEFLAGS, current code may result
in a false positive match when make is invoked with long options like
--no-print-directory. This has been observed with certain versions of
host make (e.g. 3.82) while building the Qemu package in buildroot.

Filter out such long options before searching for one-character options.

Signed-off-by: Alexey Neyman <stilor@att.net>
---
 Makefile | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 6c36330eef..401c623a65 100644
--- a/Makefile
+++ b/Makefile
@@ -129,9 +129,11 @@ endif
 # 4. Rules to bridge to other makefiles
 
 ifneq ($(NINJA),)
-MAKE.n = $(findstring n,$(firstword $(MAKEFLAGS)))
-MAKE.k = $(findstring k,$(firstword $(MAKEFLAGS)))
-MAKE.q = $(findstring q,$(firstword $(MAKEFLAGS)))
+# Filter out long options to avoid flags like --no-print-directory which
+# may result in false positive match for MAKE.n
+MAKE.n = $(findstring n,$(firstword $(filter-out --%,$(MAKEFLAGS))))
+MAKE.k = $(findstring k,$(firstword $(filter-out --%,$(MAKEFLAGS))))
+MAKE.q = $(findstring q,$(firstword $(filter-out --%,$(MAKEFLAGS))))
 MAKE.nq = $(if $(word 2, $(MAKE.n) $(MAKE.q)),nq)
 NINJAFLAGS = $(if $V,-v) $(if $(MAKE.n), -n) $(if $(MAKE.k), -k0) \
         $(filter-out -j, $(lastword -j1 $(filter -l% -j%, $(MAKEFLAGS)))) \
-- 
2.27.0


