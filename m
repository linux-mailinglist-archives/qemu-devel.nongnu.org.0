Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D2AC9606398
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Oct 2022 16:53:40 +0200 (CEST)
Received: from localhost ([::1]:35064 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWvT-0005Vx-D0
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:53:39 -0400
Received: from [::1] (helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1olWjm-0004lG-KI
	for lists+qemu-devel@lfdr.de; Thu, 20 Oct 2022 10:41:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olVnD-00045e-2x
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 09:41:03 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:40823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1olVnA-0008Aq-TE
 for qemu-devel@nongnu.org; Thu, 20 Oct 2022 09:41:02 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 v130-20020a1cac88000000b003bcde03bd44so2352619wme.5
 for <qemu-devel@nongnu.org>; Thu, 20 Oct 2022 06:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z7KCvtv19kirWeZA/xvT5hmErPlIa+O7OEhUtObXacc=;
 b=spjsr+bylW1Wkz69XdSvVrvLSUrIrji9xIQucUYCLqsik0qBuHNw1ojRql6wzTNatx
 5Z6fqrBtX3dOhmONND8ztgxF7yJDmg2oHOKYVrDYt6iLAYPIy3991Px0Urp+fJ1Ijz5l
 f7rmHLlTBXC9cArMldUh0c0H9bHaFs3WJr4ou+jUM7bZs6TvA6DBZOXMiuspGzDq4DV+
 Qkkc9ycsroTRXXqYsfPTYJMIYHaTPlom+qaPJ0jvvqzZkYG10R2mgV8/8Il0uclv1VsI
 FGNAWVqJpv90iLkYG14ExT80yX1/JwCqk4TvgAmoW42H7qWxKzdu6u0ixgxdY2eH8bvX
 9SaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z7KCvtv19kirWeZA/xvT5hmErPlIa+O7OEhUtObXacc=;
 b=QIfoHPNxTrxB8IzFTgN8T/YxnXkYomGqoKZlz4EuVIkdcFxiXlzuTZUubGG/sw0F2C
 6UBAhUyoZMoDsdNZqPtlek+zOnQCq6YixNjij4fNDZj/22sW5+99w19PDXBbU4wz4KNt
 ikmFfnbJv8ZJw5uhT9EK7q1O/0FvACfWrIF+PGuRTpgCTPZvuCYhgcylh6uTtXa9+UQB
 7Yd2o7h6yKz9RzygAJxpJotWVTXHfFP8KQ7r0HjcLq29TBYGfJdlTIpUE+KW6YCkeKO6
 2NMtmC4jjzJn88q+W1PbyIjwiJaqQY4BQ1bHx0Cb0qtnKrOFmHEKcVtQqNF84GUCQzuA
 UySw==
X-Gm-Message-State: ACrzQf3m4bzgRpc+x2T+Pn25JfCXcd1LJyDlRAl1v3cfwwc42XD5k/TD
 /2fK2QFGADSrPka+dBeTMgE3M4jMVN1Ir4Vp/0A=
X-Google-Smtp-Source: AMsMyM7ZdRTDvg0KTej2JCoBod9AfQTwgYxxJgI4ywt1UAE3NOndz7ldGZJF+b2XxiwXHcpm8KCSGg==
X-Received: by 2002:a1c:f20e:0:b0:3c2:5062:4017 with SMTP id
 s14-20020a1cf20e000000b003c250624017mr29500438wmc.175.1666273257677; 
 Thu, 20 Oct 2022 06:40:57 -0700 (PDT)
Received: from localhost.localdomain
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 r9-20020a05600c458900b003b47b913901sm5685134wmo.1.2022.10.20.06.40.52
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 20 Oct 2022 06:40:53 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [RFC PATCH 18/17] util/qemu-sockets: Display IPv6 addresses within
 square brackets
Date: Thu, 20 Oct 2022 15:40:51 +0200
Message-Id: <20221020134051.88449-1-philmd@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221020091624.48368-1-lvivier@redhat.com>
References: <20221020091624.48368-1-lvivier@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

See RFC3986 "Uniform Resource Identifier (URI): Generic Syntax"
section 3.2.2. 'Host' [1]:

   A host identified by an Internet Protocol literal address, version
   6 [RFC3513] or later, is distinguished by enclosing the IP literal
   within square brackets ("[" and "]").  This is the only place where
   square bracket characters are allowed in the URI syntax.

and RFC5952 "A Recommendation for IPv6 Address Text Representation"
section 6. 'Notes on Combining IPv6 Addresses with Port Numbers' [2]:

   The [] style as expressed in [RFC3986] SHOULD be employed, and is
   the default unless otherwise specified. [...] For URIs containing
   IPv6 address literals, [RFC3986] MUST be followed [...].

[1] https://www.rfc-editor.org/rfc/rfc3986#section-3.2.2
[2] https://www.rfc-editor.org/rfc/rfc5952#section-6

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 tests/qtest/netdev-socket.c | 4 ++--
 util/qemu-sockets.c         | 4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)

diff --git a/tests/qtest/netdev-socket.c b/tests/qtest/netdev-socket.c
index 4ea66b4c69..65f0e01db1 100644
--- a/tests/qtest/netdev-socket.c
+++ b/tests/qtest/netdev-socket.c
@@ -134,13 +134,13 @@ static void test_stream_inet_ipv6(void)
                        "addr.ipv4=off,addr.ipv6=on,"
                        "addr.host=localhost,addr.port=%d", port);
 
-    expect = g_strdup_printf("st0: index=0,type=stream,tcp:::1:%d\r\n",
+    expect = g_strdup_printf("st0: index=0,type=stream,tcp:[::1]:%d\r\n",
                              port);
     EXPECT_STATE(qts1, expect, 0);
     g_free(expect);
 
     /* the port is unknown, check only the address */
-    EXPECT_STATE(qts0, "st0: index=0,type=stream,tcp:::1", ':');
+    EXPECT_STATE(qts0, "st0: index=0,type=stream,tcp:[::1]", ':');
 
     qtest_quit(qts1);
     qtest_quit(qts0);
diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index a9926af714..19af96fa2c 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -1081,8 +1081,10 @@ char *socket_uri(SocketAddress *addr)
 {
     switch (addr->type) {
     case SOCKET_ADDRESS_TYPE_INET:
-        return g_strdup_printf("tcp:%s:%s",
+        return g_strdup_printf("tcp:%s%s%s:%s",
+                               addr->u.inet.ipv6 ? "[" : "",
                                addr->u.inet.host,
+                               addr->u.inet.ipv6 ? "]" : "",
                                addr->u.inet.port);
     case SOCKET_ADDRESS_TYPE_UNIX:
         return g_strdup_printf("unix:%s",
-- 
2.37.3


