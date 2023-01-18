Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C6567158F
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Jan 2023 08:55:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pI3Fd-0001wx-FW; Wed, 18 Jan 2023 02:52:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pI3FY-0001tc-I3; Wed, 18 Jan 2023 02:52:48 -0500
Received: from mout.kundenserver.de ([217.72.192.74])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1pI3FW-00023S-R9; Wed, 18 Jan 2023 02:52:48 -0500
Received: from quad ([82.142.8.70]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1N8GEY-1oeMuI0HNQ-014FbD; Wed, 18
 Jan 2023 08:52:42 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>
Subject: [PULL 09/15] tests/qtest/test-hmp: Improve the check for verbose mode
Date: Wed, 18 Jan 2023 08:52:28 +0100
Message-Id: <20230118075234.2322131-10-laurent@vivier.eu>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230118075234.2322131-1-laurent@vivier.eu>
References: <20230118075234.2322131-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Dx61oh7UgoUb6ccRlsFjo+8qD+sQBRWEano7rEUjZ0hzarsoSyY
 r4lr/osnrA57TnLqfCrSQJTgZqp2+TAzTLcyO4b2zHrjMSaEuUDTPXG2fjAnOVrKUfOSA90
 vPg/1FMsWxihwY7u21DwM/iYSKBSaG2Jk/5LbHHlfzZRirgDOWYuS8HPe7o5gETlcD4TDxH
 HVK11ET4i4xp7NTqa0zjw==
UI-OutboundReport: notjunk:1;M01:P0:yYHCjb62Gfk=;Dcg3ZD8YJjugpy5HPkiFbpeDGk9
 5lxPns9v/Eg6y19at1XCxJkn57uK85Q/2HQOPymHEBX3h1rSUwyAZN/pd6CwZMhpiHQB1yjl3
 1HjUC7qKtDCnlWaFaTb/S20snuVnd1OcVp8p9TwPsa6nvB574cRl32CTzZEPiYxRyP7oav9dW
 ScT9Hl7DK1/jilQw+3KAn8DauBuHAItBlRkcd/efA4Oi3RKzHk0qsR15tWEGu8QRsALN6tnEN
 uv8xmk9Bw+B+J320SgQ/AuR03+3OEDDv42xU08TWV2OtOP3dQ+WLeR+FZvztYm3cla/9gCZwa
 GvIbW31O/ksUmcuFGHInwvzLQvZCU68FynJliWtF6J5tGGzTpJMMs+hDQsKCH0hQHVu7TqT+f
 Sqa2D0qb/zM7ANc2UsY2cFuYgKniBv+1n/D0vOFknrEnJm70rNc8WY0EVPhzlrS73CbQwKZtF
 Hp22KkgLJpCp/Wu85nhaUbT4865v8vlRegkMfNCgDCXHoLr0cKu7OpPGYuNE4oWzuQtnlhSuZ
 NzI/9jzPHQ/e+yYVXtbQtdBe48WaG2LQPDCUPFgzZ47Ksaj5RZlQHMKh9m9P1lJcR7ykaP6wM
 F6Hvv7ClUmDyKixn3uyBHN0j/7/erJ6Wbci4wTAqIpXLEBxyZPuHFFsceFfrqeH6/tF+kuhtG
 UUEdy5xFUSL1YLRugropEEi149KvKSdHRFNe1GOb2A==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Thomas Huth <thuth@redhat.com>

Running the test-hmp with V=2 up to V=9 runs the test in verbose mode,
but running for example with V=10 falls back to non-verbose mode ...
Improve this oddity by properly treating the argument as a number.

Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Message-Id: <20230109101306.271444-1-thuth@redhat.com>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 tests/qtest/test-hmp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/qtest/test-hmp.c b/tests/qtest/test-hmp.c
index f8b22abe4cac..b4a920df8983 100644
--- a/tests/qtest/test-hmp.c
+++ b/tests/qtest/test-hmp.c
@@ -151,7 +151,7 @@ int main(int argc, char **argv)
 {
     char *v_env = getenv("V");
 
-    if (v_env && *v_env >= '2') {
+    if (v_env && atoi(v_env) >= 2) {
         verbose = true;
     }
 
-- 
2.38.1


