Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDAD44E442D
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 17:25:44 +0100 (CET)
Received: from localhost ([::1]:32782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWhKJ-0005jn-Nb
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 12:25:43 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lw945lw945@yahoo.com>)
 id 1nWhIR-0003gJ-FQ
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:23:47 -0400
Received: from sonic310-21.consmr.mail.gq1.yahoo.com ([98.137.69.147]:40330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <lw945lw945@yahoo.com>)
 id 1nWhIP-0006Ip-Cq
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 12:23:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1647966222; bh=6TcMAhIBij7gZQVuFTLM7jVLORl/dzaM8OKNjkXMKEQ=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=asrLSJFSnb6Iorx8RYoFx6EoewzXD7qIuG6Lfhiu5f97U2IJHoyxoC4rKaIchzqk9ScvtWBOxq5SYSwnyun7+dWLQd6Irb27EdHZOB6ad8xoooB9u6/2tgxM0ewr4uo/H53FRNKlWYtUFf5CjnyhbL4XgwjkzjNl6Xwx1hp77ZH+6Q6ugzOPui9Lh++aKeh5JDdnPb4LhMz39FY6v66lpvixgjJ6tcqbyjIu85/f+fTNDMZg+J3pZezhAki36IqermvzSuLWQePnbFYEkEQPbgqZtIkD8GGfHLO2wVfOK76NHMplAXhIXAtZ5ZMWa9E8367xsBwRw50YEoXBKoElvw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1647966222; bh=AR2xv/qk68q0p3JrKAELWzUMBfYlXKJavVQ4ax/2ltJ=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=G25QJbcMvLj+uBiFcKLJ5WQuUUz60bxlzlk0AH6FS2c7kYOPJQie3/lX1CC2XymVfhDbmH5Gy/HRMK+nKh/HK+bdhSfRd2u6rEiNISu5z2+2ZzPutekcP4CoYOs1G/lJHtwLhluk4+NiWQsEnIxUKbuURcg/70qvY9VwMtEzFSnzcGWHw8e63TQnFx5yfEz+hUk8C08sMizXgw0wf3O5KVCtOXQ4Vy14XakD57nHTRMzqxTvChv/Fo4k3UOisZjk7tFs9NuUJ4jzZ3wJiGW/T5mSphgrdIUBHhbnqxLo5p6HhkGTx4gORGRBFHpzFW4UnL539lFi7gnDJSbwcWj/yQ==
X-YMail-OSG: H4fb5ccVM1m5.dANDvbh0sS1rbiQJwqeIvPq1BL5LpIpRnv47Plqo312VWHR2fU
 Nqip1sUwxa3uSIJ6P3rl1dOpShEjAQngGMzk2keHlSoy4bxct9IZM.WvRCkqCt4K.nTrV.G5Hmyz
 BJbpGt09ME_8sNoyezZqL18BpL9XOZkpVFmAsn7CB.LKVr9UilWuXnaxfZtb7W1uPwADjQiX.LCF
 _tmt.K3EwwvldCRs6OfwOpIP0b_HL8LP04h3gdseftwRXk2jKVwswTpHx5jAbgOj3Nw4kUK.Cko0
 w_od_agpK9yBcqEMYjQSMENx.XocwHDCzBJhcZLO4L643ulzjvskLNAOo3rsKCUbdFjMazWijdWH
 MCCWi.ovMeNm2OvQfnr8J09GdP_p0HQ0s_HxUR42PlIC.GdWSB_VhKfiiS9G6ojKGMJtUN_R0C3j
 bON_ICr7Bcj_BH6F8NyWTLyHJjAcRzVlR.ONncZ5iMJDjoNhn4R4ALr.J_It8zO6dLGOj97M9Clg
 zmEw4YBAzj4n54N_QY2R6nZ5kql68L52icSYbumsmWUZxCZSzXN1a.0Xk495ceAMZS4GbyX..oRS
 xxf.7Ilg_tsG1tO9mu7CjS7wUSp.C9LAmI8vJEuf4z02Y2ZcUeEjARYavv.TFOXRKQQZtJiKjfPH
 krxKtEVEegxCjsNy.zT2XXimmPw2M6NoOoZrWmpUaDTCyPzM6Rd0jhDVPM68QPIBJ5fd.DVpHz1n
 WSYO9uI3Hvi_pt33YuwI54cYR_hqhw.ALrRiL.WVy0CxtCxpYvgpY03ZlGPa.fTks.AaroFLFYAH
 hthb0b90mESEwv2avriDK7et6jpk142vpFYNij80bhkfGZYfWj8LT6cNWVwnaK4CNEKUWIyWb2gH
 VoktGldkpz84RWGOXZDMaK_0nDqTQhwL_QNxOxjXXRvOc.bY.w_57l8IeQSCCLN3D8ZwmSSmSyMD
 1Yk1LMgpfNADnaCwPMLOytPnz2ATO6Bm9IrGnt9w2NZ8lNcMLJ3t.sAegPFLqP5i61Xr9xPX4JX4
 TsqBjM_.SDyGxJ6yW6o2ryV9cPTrSdQzReLMRkP5p_3JcIRUqEc2ODifZXAQ404zLAER0O9HA_V9
 .epb2Ujsns3NFk5XAhaQvwzyIrh45QAz19IHi750gX_svfs_.XKG2gwVrQMg6xHbjOM61oGYFthg
 jesmw7KvdNXOEi7XKpL27QYMzH5oPHwBBqETMt5yGgdwnOEqvXYWGRZfOsZSoHToRdrlVqaHAWxS
 DP7n5k.4mwqaNuFZ6aHxRK6V17jpWGCuorJzcpXjZ6EHa26ePY3sq_fULsImRVvwL0bh1fvJesBr
 uGueC8HtGFmxpQVfK9me5x1ujLhQw80uGtW25OcdDoYh17I66WxE_tjrrZh2slgwUH4QLUcbeZlJ
 PhCpOppykn_HxyTUSAOpDLwn9A6MoIrZK7IJobnhMFjkuv0guT5a9KyzPtNERZnIcrTEU.fH.GWf
 GORawsFu.SDNpCCOYrlwXJUKJFVW6akpJYTVQCe3nwYlIQTNt4T9Za4DWA1bVjpE7OUlw4rw8bug
 oZNg8E6LAL78kcHGtBT88D1dF0CH.GrQLcliltmsM.V38lawnh3D.GPrL3suWAdsOSbvuqEqmRCB
 lSUbhroDapx1IZe0bN.ADvzRIJTiFqT4yB4QveQ2sbjgkIoCHDcz1QhCPM3dyMHEwfvITb_S8fUW
 FEXgBBXeR9yXLbjnYQloWQ.vEDH2neWYquCcMQLFJqSyxTUsPpH_yEGNulu5agc2pAAxNdkreL7M
 sC_5u1kcjxUpEKCOpSKKrAxyswLLese6i4nYDOwvZD3CcAs60mEbKgGGtq5bUSVBeiDdoxGWPMcm
 X5T3JDgmIbqckOzIAuA8J7glMpewY7FYQ0.9QJch_gZEg6YBwHXzFfYmLKP7g3UBBv3YxJ8V8kDc
 wKsT4cUo9vAKSqDQVUgBTcpTTIGchFw8ZKDIZZ72AuzJS.Tgz.73eUU2LDyWLkid1W.r_zVRVSF_
 fXx2DWByx7UhpjMrIWz7wZE1JOomfDm9waGCDx95x8jT3YvhqFxK0pjhQgAK1raRmm3xLnJKIQy4
 7kj.ZP4bv4ltiQzWRxEPEsqr5BKOULOEaMkuTi72iT8roRUpIw4_YoHfrvR6Xgsj71t7btgZACFv
 INHn33PJ7zgfL1onRABldFz7xPok3RZHO7ayGy8JPLogoMTv9SRYFYXquU.Kp5hFKSZdQvcUyLJr
 CnC0aEr5zdEAWnt6gB5_UwL7nUNUQ5GTAH.J7_miHF0lqZaZHOZL9sM8Igzh6PNWkjXmqNhXq9XL
 Q5iTSuUtcz29e4bELqLEdwLvpsbYsqakc4Fy74LPbFNdy.xE.BVasXRtPYqBYZM11Q8kC.d9OYMc
 8
X-Sonic-MF: <lw945lw945@yahoo.com>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic310.consmr.mail.gq1.yahoo.com with HTTP; Tue, 22 Mar 2022 16:23:42 +0000
Received: by kubenode527.mail-prod1.omega.gq1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 808f424003ffb5335f380da6f5d24d72; 
 Tue, 22 Mar 2022 16:23:36 +0000 (UTC)
From: Wei Li <lw945lw945@yahoo.com>
To: pbonzini@redhat.com,
	richard.henderson@linaro.org,
	eduardo@habkost.net
Cc: qemu-devel@nongnu.org
Subject: [PATCH v3 0/1] cmpxchg and lock cmpxchg should not touch accumulator 
Date: Wed, 23 Mar 2022 00:23:13 +0800
Message-Id: <20220322162314.408170-1-lw945lw945@yahoo.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20220322162314.408170-1-lw945lw945.ref@yahoo.com>
Received-SPF: pass client-ip=98.137.69.147; envelope-from=lw945lw945@yahoo.com;
 helo=sonic310-21.consmr.mail.gq1.yahoo.com
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

This series fix a bug reported on issues 508.
The problem is cmpxchg and lock cmpxchg would touch accumulator when
they should not do that.

Changes from v2
* Give a better code struture to reduce more code duplication.

v2 link:
https://lists.gnu.org/archive/html/qemu-devel/2022-03/msg05410.html

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

 target/i386/tcg/translate.c | 41 +++++++++++++++++--------------------
 1 file changed, 19 insertions(+), 22 deletions(-)

-- 
2.30.2


