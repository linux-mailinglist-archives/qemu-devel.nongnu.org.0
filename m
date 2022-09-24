Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB5F5E8BF5
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Sep 2022 13:55:48 +0200 (CEST)
Received: from localhost ([::1]:33744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oc3l5-0004Qd-QK
	for lists+qemu-devel@lfdr.de; Sat, 24 Sep 2022 07:55:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oc3as-0004Kk-D9
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 07:45:14 -0400
Received: from mout.gmx.net ([212.227.15.19]:46535)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1oc3an-0003R0-2O
 for qemu-devel@nongnu.org; Sat, 24 Sep 2022 07:45:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1664019904;
 bh=Jn37Ns805be5TNP0dnWflE8APtxrU6ZlAd65bpZKf/Y=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=N2XJYBxH4O87zk0X6RfNGxxMUK9sw9K1/nZtdLIGATi3jah0bt5PwiJlGQlVzDoGi
 pK/Tk5SBfocbIdVYtwSMdjRnRY7YYmSmV2AF633NmfDhTRyLp780gwDz9xPfsIIyt+
 AhlpJfvTT7UYJMrzHr0DYhotkbLE1tXYcCmXCaBk=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.155.187]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MqJm5-1p6QTb2IAF-00nNEj; Sat, 24
 Sep 2022 13:45:04 +0200
From: Helge Deller <deller@gmx.de>
To: Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
Cc: Helge Deller <deller@gmx.de>
Subject: [PATCH 2/7] linux-user: Add proper strace format strings for
 getdents()/getdents64()
Date: Sat, 24 Sep 2022 13:44:56 +0200
Message-Id: <20220924114501.21767-3-deller@gmx.de>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220924114501.21767-1-deller@gmx.de>
References: <20220924114501.21767-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:LO34WL182r4WzLKWNWvbZjjWJaDNX9JI1fspoWZJvKs4+I7xBbK
 V8J75YJCHilG2JblLbsTiqiLus3ng8kjehVfT0LoV3lvNse8XiaFEbrS+3VjZSAdYcpiD9f
 m3UcEshGg8ZurGv6icq/iNpPV+1m3zo76SyCcQ/gh72EiEWNsfT7TxRJNDecWIyJQsE7zNO
 7RvqjUfNqX81MrQ4njwjw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:tMFuy9ueoKk=:4t4tAo8mJ8I5UP3fenWEbs
 M3lCuNntCqD2s1LH5ENDe7SjGusjzXKP18brFLpC+l/27mhK/iZiOwQjxghxXtP/aUqi43luk
 accbN13C4bPaVVfhI3EbP9eSFplM+0/R+AMdhu5PzPs1/aBBGsj6fpCrOwYnTbnOlxD1BHZcZ
 RF5BwLrPwD7MBV6XoxJoA5/4i6ID4rv7YXjkMOK7dckmcvkoWs/5LFhIWgbh+e6FbEG87ky1R
 Senh7bUmOLNp6kvUA3THmHpjnipKg9gWuvxhtbf85HukhqutkfEaEDRER5dPhHtUjC9CEH+6y
 OPEPHvyIr9BEs5+B/HsQooYQ/oOg5Zg71oLhKd5G4A/5/hnTMLpzt+Q0eLrRDtrRfdUSZMXD9
 /1eO2Uw/JMByKyBkqIKDvJYh5bda9tskt8lARPdsxz6p5m3oFZ8RGY1vrg1vnmrS5My2jFaCF
 qns5xG8wmCf2uq1x1FIst2c/DdC3nnWL7LNdiJryON8Ur7YYzX+prwyfdyFllX99fiGw/wyCs
 xpPWAftBiM3Grw9W9f//Bu/ce2ri0c3isZPsbV/Rho/x5ki5xhbugtyiBS/Q18E+aL2Jk8PBg
 GN3zYgb0wZLhQ7Oj2607VrSMHsW4G0rYfyZmhIm4GOZsUpcwhrHwkI2cCFZhgIBOqSPbelGP+
 rdilRWIMRfPiazPmh8lUPKoU83fn0SYzOWSuYqjikS/EbgCh+wk7WAuKMafTQ9Zo5kjjIK0ju
 3UR1AKJUZwKfYVkcncO3jW0A+RT8x9hV76d9uWzk9541mCBI9ANkAsmGJ9NLHZJImBLHApMTi
 4mnisugPV1Kn5/KQnKbcIpHw8hIinP9jMarXGk4GzLPEj4LaPYRsN4dr8yR6qC9L9UUlGxHzj
 FFSh2p+UwGp61a3v6HoJZFJ17oIZigGFFg8dA6TovD7WVXRcPhaueWvxms5YFPrhSlZmp7WSj
 4GLR1Ul/fHWVDXXqzP7jlqVqqRMZs0GKAKc+qMLl3o0420XMgiyhLFrh0jPjt7AuP3qgBmyGo
 fxCbndYnWaSHqv9v0jJ23RoKeWR8l2yNAX31OUO94Lm37NP9S71WSY9nBIhWSyJG/guwTPNWi
 EI0XlY+M6bZQq3NEPaFJ+wS8DmjCoOMyOzRBuUsJ+XColROmyjDshfxtW9bRuoIW6N91Kqyrk
 aLjGx0SNbVmB0zx5mW0bFmwMlO
Received-SPF: pass client-ip=212.227.15.19; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Signed-off-by: Helge Deller <deller@gmx.de>
=2D--
 linux-user/strace.list | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/linux-user/strace.list b/linux-user/strace.list
index da8c1bf34e..bfef568d18 100644
=2D-- a/linux-user/strace.list
+++ b/linux-user/strace.list
@@ -285,10 +285,10 @@
 { TARGET_NR_getcwd, "getcwd" , "%s(%p,%d)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getdents
-{ TARGET_NR_getdents, "getdents" , NULL, NULL, NULL },
+{ TARGET_NR_getdents, "getdents" , "%s(%d,%p,%u)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getdents64
-{ TARGET_NR_getdents64, "getdents64" , NULL, NULL, NULL },
+{ TARGET_NR_getdents64, "getdents64" , "%s(%d,%p,%u)", NULL, NULL },
 #endif
 #ifdef TARGET_NR_getdomainname
 { TARGET_NR_getdomainname, "getdomainname" , NULL, NULL, NULL },
=2D-
2.37.3


