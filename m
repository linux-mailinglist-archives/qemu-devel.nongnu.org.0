Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 185C921096
	for <lists+qemu-devel@lfdr.de>; Fri, 17 May 2019 00:39:46 +0200 (CEST)
Received: from localhost ([127.0.0.1]:37763 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hRP2P-0008S3-9p
	for lists+qemu-devel@lfdr.de; Thu, 16 May 2019 18:39:45 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35287)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hROyS-0005s2-43
	for qemu-devel@nongnu.org; Thu, 16 May 2019 18:35:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <laurent@vivier.eu>) id 1hROyR-0002Bc-7p
	for qemu-devel@nongnu.org; Thu, 16 May 2019 18:35:40 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:54909)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <laurent@vivier.eu>) id 1hROyQ-00027w-US
	for qemu-devel@nongnu.org; Thu, 16 May 2019 18:35:39 -0400
Received: from localhost.localdomain ([78.238.229.36]) by
	mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA
	(Nemesis)
	id 1MWzXj-1hBeKU0HkH-00XOEE; Fri, 17 May 2019 00:35:35 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Date: Fri, 17 May 2019 00:35:18 +0200
Message-Id: <20190516223519.7520-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190516223519.7520-1-laurent@vivier.eu>
References: <20190516223519.7520-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:gR/JgwK8DkROvFpqpq9b1cwypRv/rE6Rsw7r4vy5rmkS/K6mcGk
	hUeUlPg/cWgFdvEOc0tyf+/o/SciTGwhhuc4hVCr8m/RI83rb4RpANoLHvfDxHf43enCcHw
	hYKRK3iPg9nAmbHGbO6OJXfrEE5rrSkEZxRHjsC9oOW5WAvwoKtWTVgWugI6Vu4z5HQX6qA
	kDB3VQwZtCoqjYfiuzKrg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:LgAaHdpbs9Q=:jpBfTp44gH67ZpY4vwBHg5
	t5HUGm7efN5dRsRYOwigxLHfu/CDG4z/1MXFWfi2j7G1tc2EP3SHdMb74CePBcWhrbZyLZ1sK
	c9x3F6b+u9XEb/W4Wm59b2zyv6nIfyBBlfTrFX673Q/CB1ky9Va7pAN7jY6eDgiCJZxV2OzJI
	tS9FvVM7rho9gc13rFEFGJgzA0MZO90rbx4ZBMfRCH0Dm1BTUqQIiCY1DpN+z5NFWknp4XSjV
	yyU1xWSDjUBXbzC4TT8sCbBIlYFVIRo5Pvedh9cWnxAwBdJUcBb+bF268JOPjMln9mD8I7Mu+
	w94HCMwm1T+yJA65+5coL3k7NqODkp8TsXsLfS5cjHymVSDYiWVrOw772HixqGBwUqLv7NE4y
	F4EETXQu2IGSn8DcNZZV7+hasvaDHxZF24ncC/YxnA1Wk8NVI8xOzBFeG613dzZmJYv4jWxA6
	7RcQv9KNc8xGTPvqazbqsjCX846mXUuPLuG2Vt3MW5yQX7aCupZY178Q1uQlNkRmYuJFLECbh
	8XT3KE5Jpjqo/ZUk4Pegj3LZJckLUDrD6znijoVO3NO8jLGDQOfNew6UCZ3RMeUQRS+iCxf3z
	iFA7XDgeFBTd6MtawVK1XDoKkq8F2/BNzUzncxSeoJVhsKlQSpPjKqhB+rnJRvu9WosXBW71F
	sxxZAbo1nkWJRnYBVQQ10MxKmJ3qNHl+XVHdCa8fitSEejGnkFJxB8HHoCya2W65HamChBstW
	s4SX6oMTgMLylf+0rZekhvs9r+nIXcLEwsqAqryYKiGu8x2dleFUwnGvScg=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 217.72.192.75
Subject: [Qemu-devel] [PULL 5/6] target/m68k: Fix a tcg_temp leak
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Thomas Huth <huth@tuxfamily.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Laurent Vivier <laurent@vivier.eu>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

The function gen_get_ccr() returns a tcg_temp created with
tcg_temp_new(). Free it with tcg_temp_free().

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20190310003428.11723-4-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/m68k/translate.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/target/m68k/translate.c b/target/m68k/translate.c
index 176c5d966c..bf700c01b1 100644
--- a/target/m68k/translate.c
+++ b/target/m68k/translate.c
@@ -2227,6 +2227,7 @@ static TCGv gen_get_sr(DisasContext *s)
     sr = tcg_temp_new();
     tcg_gen_andi_i32(sr, QREG_SR, 0xffe0);
     tcg_gen_or_i32(sr, sr, ccr);
+    tcg_temp_free(ccr);
     return sr;
 }
 
-- 
2.20.1


