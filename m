Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AD684BFE95
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 17:31:20 +0100 (CET)
Received: from localhost ([::1]:34434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMY4N-0002bX-KK
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 11:31:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nMXq6-0007tD-S5; Tue, 22 Feb 2022 11:16:34 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:59329)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1nMXq5-0005XO-6j; Tue, 22 Feb 2022 11:16:34 -0500
Received: from quad ([82.142.17.50]) by mrelayeu.kundenserver.de (mreue107
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MBV2f-1nWkBY42cJ-00CwJZ; Tue, 22
 Feb 2022 17:16:28 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 2/7] target/avr: Correct AVRCPUClass docstring
Date: Tue, 22 Feb 2022 17:16:19 +0100
Message-Id: <20220222161624.382218-3-laurent@vivier.eu>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220222161624.382218-1-laurent@vivier.eu>
References: <20220222161624.382218-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:zKvTuSac4jMVLlJ5S6oKT/YwhaVtsL3Wirc5MKLVFVHh+aUK9iE
 t94PZyIPnGwGOb0RSunqRuhPHcp5OJUAkl1OvYNuEqHA5FIg7y9cHP6emqE+pFI12EPmcxB
 iLAZcy5NTmy5hlZe/SXchHnAT0wGc5fK19L2e1LtAQJojr8LRqNt36KE7bWemYbWdXEO2R4
 noFeGmmG7MVD7eVqcrLpA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:v6mkg8znzLw=:vtUIVWMKT85hl8HYO7pF6X
 znRjX+FwDt6co2quGifjWLN6pGkpPqHmWMzMRT/tgR/dRjUdbAkhgtnFyNDFycJxc34dIgv4d
 Bz+D4v5/OlwmsjmV4m7IokIuYACPCbx2tmR6qV7FxwPxILCyyxPA/42T9UQ3tiqiUwDn7VZcj
 dG6LMAi5ZpG4FUQyluitEFU6ZN61GUVM1kH0lQbdXwARndo+YYfzrG2jdNXLyPt78VWNwNEDZ
 hQXDRLwyKnIn10VIF4bV+n6WplayRCxE4oucJwEL9MnDMoW/H6jCu8rnqPveCZ2qWYD40LDNW
 4exYqOj3yTGMXM1lkx9/GkVNaokYIHhtBWNjV0B4tBKNdag+6056mDKBsFAWWr6ES2ZkslTz7
 25JXAqJrwiuzlYEhlqw7srxkGlh73FnNEmN1Vl/XLZpMb2isk4nax0gV/AAbGUpeketKXdXMu
 RG5FiYNoA4SxzpzVauK7sL7uwdm8GRAjrSqnosj2VJ2UOO51H+HRL+WlmdxvD2ZwoeTGgj3Jh
 9WRxXpQfJ6x47h5UnLT9aWDPej6WKAAn/LBQVSh4pZ0R7yXQLdqq+v5dSCWGfZ5VNapUOOt0M
 YBq/sO/EemVIb6Tb5r/866AeEbput4LbbPcuUD8SZ8RdLkZpRuR70M3yopkqPDSdZwIfauymH
 PRc697yrZw7HqMF3Af/AmFY5ibIMNdv0gz1vAmqJPNYg7CShtX090BW39RCrMotMXP8s=
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Philippe Mathieu-Daudé <f4bug@amsat.org>

There is no 'vr' field in AVRCPUClass.

Likely a copy/paste typo from CRISCPUClass ;)

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220122001036.83267-1-f4bug@amsat.org>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 target/avr/cpu-qom.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/target/avr/cpu-qom.h b/target/avr/cpu-qom.h
index 9fa6989c1882..14e5b3ce72ff 100644
--- a/target/avr/cpu-qom.h
+++ b/target/avr/cpu-qom.h
@@ -33,7 +33,6 @@ OBJECT_DECLARE_TYPE(AVRCPU, AVRCPUClass,
  *  AVRCPUClass:
  *  @parent_realize: The parent class' realize handler.
  *  @parent_reset: The parent class' reset handler.
- *  @vr: Version Register value.
  *
  *  A AVR CPU model.
  */
-- 
2.35.1


