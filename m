Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B69F03D1E1C
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 08:22:07 +0200 (CEST)
Received: from localhost ([::1]:33512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6S5u-0003Ok-J5
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 02:22:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stilor@att.net>) id 1m6O91-0005gi-6U
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 22:09:03 -0400
Received: from sonic309-25.consmr.mail.ne1.yahoo.com ([66.163.184.151]:33665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stilor@att.net>) id 1m6O8z-0003Ee-F6
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 22:09:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=att.net; s=s1024;
 t=1626919737; bh=AnHet4WoSYNjZzY/oySp9i2xnE+BZPEE7O8b0ovlB54=;
 h=From:To:Cc:Subject:Date:References:From:Subject:Reply-To;
 b=MCdFNwYO2j+XfIZOHLAyTrqTZaSiPV+S9tU+BOJXdWNGuqfmJDnHCSVw65oX9veQc4lTmLsJBVZHgARUvLYkd2mQHCiS6x5j9vElxDPhxejWitLpN/w7f551DGf8vAZlK8OpBiQuGVRiHAAgfSR0wDI9gla+Eqdj9IEZe0JgzaE=
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1626919737; bh=aLYn83+slDffL6I+wqTUVw+JkgCu4kPLb6gY2c7V4Gp=;
 h=X-Sonic-MF:From:To:Subject:Date:From:Subject;
 b=KG8afBCGU773Zv26iLgkuaROlMS6QUpSUX9TLGRvcw0CyKJT3sxIymQeTioz2idWPgwDN0xUsDdUn2UlWXpdeEbQetL46zAbvsuSka4wb+EdOT+rpFwMmjTbJ7Zal//m55xg7OxXWBsMt+TULqNHfVXqWjfr0+n9YONiqQK6PksVFn1KUYoPRwJmAWk5zaUxq+/xZpeHZk4oIxEvSOL7CY5PNhKZmB9C1yqiBqMGZZXlowDb4HXCE+cxvm4/CYXmsRxZy4IMMeIPrlEYTVd36MjavCmof1zmclIIsSwmDzHiT3fewlIyWfL8LJK9CXnZwYSBNGeXGtyXCLePatDLjQ==
X-YMail-OSG: NsYZGWUVM1n6FKF1gOnkv.i61_QvBwkh97czF98PtzvjFKaFK065kFQ51QNv8C7
 a5JfpqywzJze2w7zd26ajgrPMb10iEh6rFAODkPUGz5B1JN35sN28huX5KQjKkcjxQ8sDdJPRQNo
 vbihvJNUac.Y1XzkjMrG38JCMtzI4Jj55h.dQhxEPY7S.qZqKGHlWVU7svxCs4b0DUO0KmZMqNdX
 eEoFX8QJ6gsShjfU4F5884NRROt5PYmOF17FQ_OKRPxdb_TFS1oOg0XuVFrrMQ9EcNxiUFLx3O3T
 rjnGXds_.so77Z4IkSoXvbwsLdXRkmx60O_YZJQlW9u1M0RAmtALAZZ0kQawiLEe1bKsXjXHflet
 988Zze7kGhxm0GdNowiGQU2RKQFd4hb_nbPfZYjiIhzcoHRX09SknbT6HwTlg6K89ZNU2.G2gs6f
 KIhSDOBudL1shvoGEO9kDPYbxjTcWq1UGWLFCBK.8Qn3f76Uf7Z1xiFoZSPrqIXl6epwERuUCmsP
 5CkEXEgQBoGllNxmqaIdrsQXK10IO5xWtxfPemRg5TV3hQFmI.PJxTh8pB77f2l5SoBhhj8twCHk
 lzvGPfPBytT3OOpsYjZsRTJplC1M54K2QnlnaX14HR064OsNpJUfvcg_HsS1v4DmaKdtrlS4SwrY
 iOOeQumWYQoXkacm18E5t3_7bdsPwnWAAd6zWL0FBIJQUfySBZc3j_LAcOeBjS_fumkmHfPJAffy
 iqsPtKBBgQhvdk13W0YE3NxN0QAZTqKFnPNGbsWZGJSAoWzK8IxDLrsYkYW0Nb5vqqtQGOWhDwzD
 ARDb7zyLp9H9oa5kffmXVDu5um72k4qpGNsmm4Bl4iN76XFs7GyS.BzJrVgg326lJPlSwmfOhnLr
 z7FViIA6fpqM.hIbWcIxCATOTogFwFR30vKgUM.ClCGjv3mKJMnNDD.0WLhyiCw9rKEtYDILQqzW
 E9syyIgqdKJPXUoKm9rr8RK3LUjPNH8BOQAzQvuEdELE0U6CCfcbEd9pv_uwdz8bJfpHa0qooep.
 xPLgOqQpDmJMMtel8LuhYEQEHl5dtEjQpC.HM6_nCXtd7org6vbJt4CmF3FrvaewJxi1lRWlzptX
 FlmMNRkxNdz8QjWLK4pkrO08h.WwDUzUPG5SnJ4h3wHrPkIPZzn.dUCpyt46_1ak1rzXNVRkESnf
 WW6MILdsZt57kOCMLI9RAYgiP3YRP4pfRmvwWT_1PUMzHO3HPSp_97SDuAzXsudrzJHgFIwGp.L.
 oK2MoQx105uMt4hIveLT4.fQNFFnitUGCNmbKTDM9AoOVP_JJxzLPTgXbtoYpr2IRa0fDlisjW37
 ddlR7tWPdCsxBUKH.LN0h2exTlJKk.0cYuC5Y9fUx.6lHRR3k8MelBqJlp2.TCzA6vf90E_1IRwl
 g.iqDgSVKUX1sZCGx2JGWJ5MIyd9lquXcr.YXoVn7Y5lc2hPuVQvuPhYStmis0ipYKhXCkF914In
 DYqxrNpsxm1fsPitpgV7qUS8ZSvAjGip_.pYkXdNJa168YFi9IRme__39siB42T4ul6itbae5s0k
 7_j0sA5qLWwg05CqUsdmxuzkOHgKrEJLnyieSLUyymGIQuSvOofs0anpwdE.N5BD8MR9wjY.D7_F
 miTOjEk9gw_Ba64lzGId9ZGzcx3_GAlReWQSdTTHjR.J6PeQvWHZ4T1hcDVN60r5PYUvKGDp8XLj
 Lh.GHSJhPE9OVENcjCYUvk4QgCEwHcABZHWRPxoQbtjOekiXmzSgIPq7PnfmBJdP7ok6cSAMM6Sm
 NCIykLPePYOagCgAxY8Y3thU99SWj0bVq_iyzWhfkKWPVFNIl.2cy2Ui1mMas0KZAl5e.dKmskA1
 oA9SprM6wpOWDmu0ODG6COHMY12n2gT.2IbG1MvDD7xpEV1w5.gkSC6Sn7unegrXpmGXkPK9yvf7
 OKqTp20mtSlGO.oUkNssAbUOuNgx7PbfbagR0Vlu3OR3MFz3tm2sJCyIZ1uFIH_h_ANZH73aECuu
 6dfqLfUI8KcbHaSN3o3fghL0w6lILqYttBMiMyWUgqfKJaPORHRpwRNA4N19qNno.TUf6geBAlvb
 LkZ0urdg64ZmG1nyFmJi3w12F.RwbWpqlAXmiIvAOaUoqOEA5DZn53BllhL_N1CgZChMj4Z0qtio
 _m67rBAnu6xcy466QJ00L36cT93ByITHOvTkdXr_gFBumUnr2LqfGg6VdpQ_cGM2_OHiqJEBImTJ
 e6AnExLHrR6Ei.wpI.9p2oLsQH1FudQ5nLr9wwryyYzxHiYRykZe4ZmljumqoelWTxDsZd0FhUDZ
 7_APF1ZS.4H0AcAc5Ga5tYMzqb7hwQTLVyElTMFVnCeEVE.HNc72eMXEqhprTsLoJo0mbxRElDI7
 .aWczDc7fhHR1KqFwfmwn4KcWfPXXThfSG67io0HR.jcXseZ3i67f4J8JabcrneOJe5Yq_3ypLux
 .VYa92OXoGh8MingQrZw-
X-Sonic-MF: <stilor@att.net>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.ne1.yahoo.com with HTTP; Thu, 22 Jul 2021 02:08:57 +0000
Received: by kubenode507.mail-prod1.omega.gq1.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID fece5ee206ffbeb5deed9a92e6dcfd02; 
 Thu, 22 Jul 2021 02:08:53 +0000 (UTC)
From: Alexey Neyman <stilor@att.net>
To: qemu-devel@nongnu.org
Subject: [PATCH] Makefile: ignore long options
Date: Wed, 21 Jul 2021 19:08:46 -0700
Message-Id: <20210722020846.3678817-1-stilor@att.net>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
References: <20210722020846.3678817-1-stilor.ref@att.net>
Received-SPF: none client-ip=66.163.184.151; envelope-from=stilor@att.net;
 helo=sonic309-25.consmr.mail.ne1.yahoo.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 22 Jul 2021 02:20:59 -0400
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


