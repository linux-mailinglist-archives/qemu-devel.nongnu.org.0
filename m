Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 396BF39209E
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 21:11:08 +0200 (CEST)
Received: from localhost ([::1]:59482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llyvr-00077b-Ak
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 15:11:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <morrell@alumni.ucsd.edu>)
 id 1llyo4-0005IM-Fb
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:03:04 -0400
Received: from sonic317-20.consmr.mail.gq1.yahoo.com ([98.137.66.146]:32821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <morrell@alumni.ucsd.edu>)
 id 1llyo2-0000bk-48
 for qemu-devel@nongnu.org; Wed, 26 May 2021 15:03:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1622055777; bh=ojIgJbrBLAfs7aHGBfcV7GsBEHa2m38Kg+6VKZPj3Dc=;
 h=Date:From:Reply-To:To:Subject:References:From:Subject:Reply-To;
 b=P45zx760Ailf7IzhBc4Mt44NBAFTNQ37WNAy5FZmzTUM7uULghP9i+OoRoInCcwh5eEprp3Vwk+c3BehYFbWhtF7eQhsReFoOjtwEE41I6kFdNwRi8yfjl2znvEB4jWgkPw4oD64KMoSldPNfs0wJbpqP6mOEw4ZwLn71vTgRkeqdCbyfwSz1I+kaasoGwEIssy41Y4WN1htLqBZkg5eRY0I7OdasCBwwkdGTUkDKfxl0QbR+tyKP6WrniwGQreL7NlTUYgcTy10rdPHp0h13QDJrwbMOL3mt4tG9kPE6a2rRd7a8Is0aqsCl023290yaG+LvFmxCrmVZyCPEQnbNg==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1622055777; bh=VsM2DZNrqExOqE9TzE74Xbky3xVcWEAiPhkQmKW482f=;
 h=X-Sonic-MF:Date:From:To:Subject:From:Subject;
 b=bV+FwHrcKx+WbghVwPYgCWV8aOo6Q6V6PF0qJHbeYeve+vMx8PQTV629RtBxohrGUXyR12GO9LUYHejZDgMetGtjmjuLPFJ2vjEDxsbvO0K36uRMDuop31YXZCLJ0/yUadYCHnblDu9nL294TlTPjkN+nKv2liym29wa23prihQ9GC9H3NSHqALUwlrGP3+zMIJtm/k6B8nlrYhFzPz3RtfWIohqZy6ARf2uiFZF8i7j4Mn07fhIW4yNAtd+onnq8hCMD+jfjHXP8/NY4rONIPLduJP5ZoifInCn0ArvxhC9GU88kDC4zzOV2Qv6zsYLG6jP+ce7kWWW7dvrcSqPMg==
X-YMail-OSG: 6rh9WNsVM1movNvn81CW9qls_WRVRcYg3cE3cPvoFVjQ.zeImetFeFaEkwWjhWQ
 rc5CdnkvFdkn9j.fxCD5ppliIAtg1FKbDVXwDlwDsqAw.XUqoLKaqT06cA1qyHTqGPNhbrqVG5dy
 rVyri4ky8Nz0WT7uaB9nInLya5bxu4NzidI4MOAWB5XYlowsBVWiA5owmotGREEhcDP9b6xRwLkM
 kW7Nn8ZJ1oTsqYuBglJfdzsYRKbSCmFdVRfHr24jBpYN142RNTn1DrwfayCmtwPtznfzqT_W82Hw
 LaPVN5UUvKyxBuCvV3Xg6VQSaaD6Arw_GKBATnzhGv14Z41GGbbAlkTEH54UbEyDK9x2nEMAIB_o
 rRR99uvpST6rqPg44uxo_ErrtKcVDIJmDR5owrF2KNierY_Bmwu.AHFQe_MBhvFNbXP1VtGkSH_V
 uM3FxN0_Y5Y50M5TWBzi30qKMFId2wbKEbmQu1T3qWSOnXuudeUxQGfLq6PLRKArTHfWsJCevehF
 9xlaks6UFuWXs0Lbn8a8uw_uDOKi_Rg_t9XjGqt07F0kNF06Q1OPyZ88yt06dZN0soNr0m5f5Kpa
 Or.qeKl9dMMdag4NL9Dbw_ji9PoYxHAsYZEJrZ9uM8voi8YNdiolgu5m3iyOvosq3Ay681bCsQ0b
 ijKkSykQpyEZiw6IRXLNfGEQc2klP2WT1Hnd.AO9Gle9h6B.qrZQM0ZXEdXWoOHmTZ0BEI48gLkt
 2BPkQrHlg4KGGv59P3sY7ARaZckcqZMU6Unsv_4BhVt1pQnRDvYBRuRzWYiaZn22hXcPTITr1BhV
 bbiXGqD_5rM1T1ufYekPvMywu6WhvU4XL_mJKz5V4kf.aYQS.hMVBybIg1ZH3EVQTWU.diaSdZGS
 RpdOAS3gJ1UuOgf6Gm8HuxIMRs0maJenhAOUUgySqwZBSqJNRuyzunZVeRPM3FyZvjUOW9CbVUIw
 fNDMDM3llrS1vmBnK6023Cqmw8CeVtSJaGEVOuJlA3qKoxsImWJ_i5ICfcxwkYqzeubYrwUsFqh3
 Owt_ldNPZx31rfiIUHtGfNny7YBlBMaf_KttEu0NoY7HbjIMidCNQ7u2fdWGZEPB6e0tb3zaphSY
 AEaaSr3o1maLictLRZcz2fe9aO4NaLCDTJ_ga1o5WOGuYKzIOEhkUn34BG7us6mPk9g5ojM2QsHA
 PXbtTWTPICn.2cow0bdi5uFG70xW0duXSJp8C7kWzo4FYKwlAZ28jniB3xViNiVAcmMorUj5tHj7
 XE9QqZvP3c0qwbX6vdgsdfhJA0q1nk6ZSLeagQEvZxGGS1R0psBZVEvhFYPZeGfqXDU6oRNCu0gR
 Qa4AJ0wVdJB0pJ_CYukpSX2.dZ4OP9nvtMnWGH8ig5Wn0FhAk54V7nMH_rGzkRMoN4oHykoxLW2P
 H8YTMpc29QYzuAyyNj_MaBX0lT_n1Slek6H9B3R3lSC2A07S946NW9duCkBHCYZw5m63Wjfq6xdO
 NaGzXRvbBaOO9u_t1X4WeYNR2YB1YOWKv6fEUaCMWeMNlVs8iVITHloGclfeQKl6V0lDFJIc8l0w
 .vE0ORdOYMpwn76sEgbYVMasuoGctX3N.M4jYMFAG2t1AYth0OZcWppA_OzYPZnl7OT2sPQ42x8W
 gSmzwUj0ywvuzqux11khXn7_KQC942gQEZAZdDeWK5T2eVLJkeHRygKIQStJnm2br4uOx3Gd5T0q
 4n_Dqk2.U8tfuWaYfOVtA3sFj04faCmZKK9IvoN6xuXfyZwqHYcbqxwzExR.N8WR1cUAsQxGNCXC
 3Y9d..PcxT8A3SEigiWUfxquXdYXA3etb3znY1K26MkzYdeYZhkmnqKWeGulParTPQnmxix82k8U
 RoZznhULabpM_YAEvyohochplOyOEu4GoLGVdaCOawGQ.KHCnrefw2RnSRsVlppqVnulBKfwW0Z.
 MSzL1HOmrExjLYjGzvtvXk..f6hPiLk5REccl7BCCz3ubKS.2SCIa36i1J201uTGHWgCzQPBgF6z
 osIqpTD5Q5qCEuXsQKBFB8jcDyD4zeWihnlkyq35OLdAd0tmR833itr4dk2IPXT9kOYBkLgQPsgy
 bd2NEs0dchf5fxOa8xyuT2NRbWrvBqRYNHPKiUnQ9THGylj.QQTFWh6LS481ofSbpZKoOafL4kTn
 D3cHNIahQni_UAL.7ia.UflHqTZQHtZ_71BeF2gURicpZqFpzNcWcQmWQcnoLp57Jd6qfuScpxE4
 FVEHlzmvrR4dyzgcwEzC.XVcHNVl62ik8jpgTTTouzXEwMYloLQ5GXc4LaY2r032UAQ59T3tE6u6
 oIufvm227RL4eWDTP.564H3sN5NJzPMyi42_t3T.jw1ZUBkctWtqFneyJzKTz_95ZJcTOzW2CzDx
 Hnly.jM8VWB55XDKBVGb__lCXcBzKjRpObNKn4LdSwIH8ItDynLloDZF3Q9eYr.s5pfJhbRsqbJV
 00tWRX20-
X-Sonic-MF: <morrell@alumni.ucsd.edu>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic317.consmr.mail.gq1.yahoo.com with HTTP; Wed, 26 May 2021 19:02:57 +0000
Date: Wed, 26 May 2021 19:02:55 +0000 (UTC)
To: qemu-devel@nongnu.org, qemu-devel@nongnu.org
Message-ID: <746277332.296230.1622055775751@mail.yahoo.com>
Subject: Denormal input handling
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
References: <746277332.296230.1622055775751.ref@mail.yahoo.com>
X-Mailer: WebService/1.1.18368 YMailNodin
Received-SPF: none client-ip=98.137.66.146;
 envelope-from=morrell@alumni.ucsd.edu;
 helo=sonic317-20.consmr.mail.gq1.yahoo.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  morrell@alumni.ucsd.edu
X-ACL-Warn: ,  Michael Morrell <morrell@alumni.ucsd.edu>
From:  Michael Morrell via <qemu-devel@nongnu.org>

I see support in QEMU for architectures which have a denormal input flag bit and those that have a "flush inputs to zero" control bit, but the implementation is not specializable and seems wrong for x86 at least.

For example, in sf_canonicalize, if the input is denormal and "flush_inputs_to_zero" is true, the "input denormal" flag is set and then the value is set to a zero value, and if the input is denormal and "flush_inputs_to_zero" is false, then the input is simply normalized.

I think the behavior should be for denormal inputs that if "flush_inputs_to_zero" is true, then set the value to zero (without setting the "input denormal" flag); and if "flush_inputs_to_zero" is false, set the "input denormal" flag and normalize the input.

This matches what x86 does (I'm not sure about other architectures).

Am I missing something?  If not, I can work on a patch (there are several places which check "flush_inputs_to_zero" which will need to be changed).

  Michael

