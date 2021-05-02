Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CD8370D8D
	for <lists+qemu-devel@lfdr.de>; Sun,  2 May 2021 17:05:34 +0200 (CEST)
Received: from localhost ([::1]:37988 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldDf3-0004Bq-8m
	for lists+qemu-devel@lfdr.de; Sun, 02 May 2021 11:05:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51024)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKl-0001Uk-Hc
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:35 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436]:46773)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ldDKj-0005F3-Mj
 for qemu-devel@nongnu.org; Sun, 02 May 2021 10:44:35 -0400
Received: by mail-pf1-x436.google.com with SMTP id q2so2361986pfh.13
 for <qemu-devel@nongnu.org>; Sun, 02 May 2021 07:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YwG/b/Ju2JoZgacaVeefdHMOmTrNBfuVIrbtO2SSiSg=;
 b=tV4GoZLarXTsjqyFma1X33UwYu2yAJCPxpXp+E4aiz7GpZmnxBB1R1wYj/nCfyfvCe
 zZIx8Y/GI1QZJMyMaeCwD0LxfmesE1iTLsoxsQ/rsa819+EIEtqivjwTkfctJVAtbuUC
 Q45wzQIak7haZhMoLQCL/9E0NoZXXEnBmabJNoo+HfTpGRVjUjIRMWo+wjPgZvbMCsJF
 Lw5hTxAUT90yNoQbw1vYhTCuq9a1kzMt0U4TIqtloyYLJoZQ66BoP86u5B/mGvT5Pnx1
 n/O0ZVxERHvGb3fv6R2gv1TSUznV5aRNAn2BukF9JNyEQP8Ifr9fxQIVM2xvPdMI7k6p
 D80Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YwG/b/Ju2JoZgacaVeefdHMOmTrNBfuVIrbtO2SSiSg=;
 b=SuSQ0M7UMFkbudLVIxjFJWIsyvZ0G16oQNYso2/qdRZdETJiCpYIplI0+DK4CusIzV
 4qB+GHNnHw8v9iSvQ/RH9kFuKja19SGvTWOIFIYoSVD5kCu/1bSr6ePSwrfE7gZxkaJG
 sx5I+uviJxL9teOGays+qhJaHnSbMqGhjS5u1opjgDGdFvRzT38zMJGsOoudRkeYr2Ob
 iw1RiFmcORW1PgZ9QJMeUBhTG1r0bGFbFOe9o5nLSrpExEy12h6fxVJndNHwy2mR0XeD
 FOHJ2jRPVlX4suoVxuTJulHbZOYXJiE5/hwdGjXaui+3Mf6Q4izkyJDzNUCuwD+jeNFb
 AbUA==
X-Gm-Message-State: AOAM533qREPkZXV5lPxm1oMMKLwUp/CnTrgiQYWcIJBGjwtC5fPsFYaC
 /LDaTmgumJw42NBhHFJsjf8TrLvDssRkqw==
X-Google-Smtp-Source: ABdhPJw8Gm9VxOCnpYuOX8bfTi3HndP2hx1qTUdvwbGdZhs79ywIj49Qdf3Oxv4HARckwtQi4inZCQ==
X-Received: by 2002:a63:5c0e:: with SMTP id q14mr14411452pgb.441.1619966672404; 
 Sun, 02 May 2021 07:44:32 -0700 (PDT)
Received: from localhost.localdomain ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id w14sm6889110pff.94.2021.05.02.07.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 May 2021 07:44:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL v2 18/31] Hexagon (target/hexagon) cleanup ternary operators in
 semantics
Date: Sun,  2 May 2021 07:44:06 -0700
Message-Id: <20210502144419.1659844-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210502144419.1659844-1-richard.henderson@linaro.org>
References: <20210502144419.1659844-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x436.google.com
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


