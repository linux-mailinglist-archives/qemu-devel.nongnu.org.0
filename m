Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EFE33708AA
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 21:06:11 +0200 (CEST)
Received: from localhost ([::1]:47744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcuwM-0002uv-1g
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 15:06:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuam-0008LI-So
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:43:52 -0400
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c]:52113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lcuaY-00008w-Cp
 for qemu-devel@nongnu.org; Sat, 01 May 2021 14:43:52 -0400
Received: by mail-pj1-x102c.google.com with SMTP id lp8so794014pjb.1
 for <qemu-devel@nongnu.org>; Sat, 01 May 2021 11:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YwG/b/Ju2JoZgacaVeefdHMOmTrNBfuVIrbtO2SSiSg=;
 b=uhQtyhUGQxGPBWwtTanI+Wk38nhNVwF8oSCmYxTICh52zY45Kxflt1DC8/9hY5l7Us
 HXIUcpsEZdMU+O5aOqJlVF4Klie3Mrflzw+THyHfDLwY2++osNEy4OrlNlHfL7KsErZY
 s1ztLTaMM/pl2m7jqyUyWCAr/ISCOI6s7wRnJhJ9a43pcQIPyIFSmeCc8A/YL6Z432u6
 JJGiyvxDwW3EPAMxfZxQYTgJurY9CH628ALIWGWJ9ivLHilOpBt2JYbuIy14QBD0Pkoc
 v1OQV+l0mZH0VhWEfEan7XXZ22U6DrGTRuKILt4sQvMtGn0OE5AERpXjED2Os9EGaFmY
 t+vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YwG/b/Ju2JoZgacaVeefdHMOmTrNBfuVIrbtO2SSiSg=;
 b=dlt07+MDyWC9PuVzyjPLh/erdNaI+GxxG628hQeB3TCqEwpncPs41QTUtr9NwpcfK/
 AY99wawPbawWi5oxvRqvadmAeMSrtN8SpEa5lqIrZEIzbIXLkLZwaTdzw9/n/wXRX1JT
 6hRkutdzMAOtpJ+/gxdHGY1vSRatsLZMOPZLrfADJimhiWhVWhd57xemByuQoV7FK7xh
 X0iOapisxbf9wm+jnwmXfHSzMyqHusF25WGRqOrR9aYQuFI6i6oNkNIYvrpWiUY8YIeA
 XisdgKsVarQ+DZgCSsLtAZTgqFYT/gZ+YhJAi3GeRMyMMYVLOkQOej40tBNJArNip8Bb
 uUhQ==
X-Gm-Message-State: AOAM530iwVE/PEW8wMCdYpxpCnYoRVUaPKGZbXE8RvP3vnN3Pc2MG1mr
 c/vHzOJCyimPWL5uekvScTQjyGmJGCPyhw==
X-Google-Smtp-Source: ABdhPJx0R5FmOYS3s5w9tygqZ5yC44H1Dj2G7L4/NI+53zUAomSV5RrxQzoqb38/ceR9FFS23CqMkQ==
X-Received: by 2002:a17:90a:414a:: with SMTP id
 m10mr20893214pjg.63.1619894616936; 
 Sat, 01 May 2021 11:43:36 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id i11sm5309088pfa.108.2021.05.01.11.43.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 11:43:36 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 18/31] Hexagon (target/hexagon) cleanup ternary operators in
 semantics
Date: Sat,  1 May 2021 11:43:11 -0700
Message-Id: <20210501184324.1338186-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210501184324.1338186-1-richard.henderson@linaro.org>
References: <20210501184324.1338186-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, Taylor Simpson <tsimpson@quicinc.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Taylor Simpson <tsimpson@quicinc.com>

Change  (cond ? (res = x) : (res = y)) to res = (cond ? x : y)

This makes the semnatics easier to for idef-parser to deal with

The following instructions are impacted
    C2_any8
    C2_all8
    C2_mux
    C2_muxii
    C2_muxir
    C2_muxri

Signed-off-by: Taylor Simpson <tsimpson@quicinc.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <1617930474-31979-14-git-send-email-tsimpson@quicinc.com>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/hexagon/imported/compare.idef | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/target/hexagon/imported/compare.idef b/target/hexagon/imported/compare.idef
index 3551467854..abd016ffb5 100644
--- a/target/hexagon/imported/compare.idef
+++ b/target/hexagon/imported/compare.idef
@@ -198,11 +198,11 @@ Q6INSN(C4_or_orn,"Pd4=or(Ps4,or(Pt4,!Pu4))",ATTRIBS(A_CRSLOT23),
 
 Q6INSN(C2_any8,"Pd4=any8(Ps4)",ATTRIBS(A_CRSLOT23),
 "Logical ANY of low 8 predicate bits",
-{ PsV ? (PdV=0xff) : (PdV=0x00); })
+{ PdV = (PsV ? 0xff : 0x00); })
 
 Q6INSN(C2_all8,"Pd4=all8(Ps4)",ATTRIBS(A_CRSLOT23),
 "Logical ALL of low 8 predicate bits",
-{ (PsV==0xff) ? (PdV=0xff) : (PdV=0x00); })
+{ PdV = (PsV == 0xff ? 0xff : 0x00); })
 
 Q6INSN(C2_vitpack,"Rd32=vitpack(Ps4,Pt4)",ATTRIBS(),
 "Pack the odd and even bits of two predicate registers",
@@ -212,7 +212,7 @@ Q6INSN(C2_vitpack,"Rd32=vitpack(Ps4,Pt4)",ATTRIBS(),
 
 Q6INSN(C2_mux,"Rd32=mux(Pu4,Rs32,Rt32)",ATTRIBS(),
 "Scalar MUX",
-{ (fLSBOLD(PuV)) ? (RdV=RsV):(RdV=RtV); })
+{ RdV = (fLSBOLD(PuV) ? RsV : RtV); })
 
 
 Q6INSN(C2_cmovenewit,"if (Pu4.new) Rd32=#s12",ATTRIBS(A_ARCHV2),
@@ -269,18 +269,18 @@ Q6INSN(C2_ccombinewf,"if (!Pu4) Rdd32=combine(Rs32,Rt32)",ATTRIBS(A_ARCHV2),
 
 Q6INSN(C2_muxii,"Rd32=mux(Pu4,#s8,#S8)",ATTRIBS(A_ARCHV2),
 "Scalar MUX immediates",
-{ fIMMEXT(siV); (fLSBOLD(PuV)) ? (RdV=siV):(RdV=SiV); })
+{ fIMMEXT(siV); RdV = (fLSBOLD(PuV) ? siV : SiV); })
 
 
 
 Q6INSN(C2_muxir,"Rd32=mux(Pu4,Rs32,#s8)",ATTRIBS(A_ARCHV2),
 "Scalar MUX register immediate",
-{ fIMMEXT(siV); (fLSBOLD(PuV)) ? (RdV=RsV):(RdV=siV); })
+{ fIMMEXT(siV); RdV = (fLSBOLD(PuV) ? RsV : siV); })
 
 
 Q6INSN(C2_muxri,"Rd32=mux(Pu4,#s8,Rs32)",ATTRIBS(A_ARCHV2),
 "Scalar MUX register immediate",
-{ fIMMEXT(siV); (fLSBOLD(PuV)) ? (RdV=siV):(RdV=RsV); })
+{ fIMMEXT(siV); RdV = (fLSBOLD(PuV) ? siV : RsV); })
 
 
 
-- 
2.25.1


