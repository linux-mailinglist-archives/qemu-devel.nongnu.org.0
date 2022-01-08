Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 617944881C8
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 07:10:06 +0100 (CET)
Received: from localhost ([::1]:44630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n64vV-0005r0-2e
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 01:10:05 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64eW-0000rT-Fs
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:52:33 -0500
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:26464)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=000118587=alistair.francis@opensource.wdc.com>)
 id 1n64eU-0006tA-AT
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 00:52:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1641621150; x=1673157150;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HZXHreYz/nKg8R6C1e2J1FIziXqEjB6GX/QfiNOv3xY=;
 b=o8B4rPEDV3st0TNKHYBxf1IaRguZhTdILCWP9CBOK0gR1Klqa5KkFNOM
 67/NfNjtP7ydf7zjS6tCSeCG63e03WxCUNWql17HT2usFY9UghcORunVV
 LmdHBb0I34E+zBKhg3dEMnIBKffd1d9vno4bqj4TNOjUkA81gFJFmefkD
 o9DhSK2O0qiCjkE8hMak43m52hTkeeAxotO9taxk6x9HS45bGsU6l4TcM
 Yc0vvEwOIJys10ms9NfWOfBOI1D7xZXURMWMaKIaOIu2WiHHulIx8e5Y/
 7wRc2feY9PUmrboCKVQ/gGWWXk/3QVotMgO8CvfFuRu1hSmLkmP7hpxdA A==;
X-IronPort-AV: E=Sophos;i="5.88,272,1635177600"; d="scan'208";a="294027379"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Jan 2022 13:52:29 +0800
IronPort-SDR: TedaZAUV8ve9agSLOfuXZNpkiQU0GhZeNcg2WsW9l9RQrnZ9M6MOplipY8K0NATr5/w1JyurnG
 phIej47+UTrKuj511jEKX8fohiYdhn05zIN+k3pPvrU80E6db1VqAb2LTdBM+SmDJYrbBpt91R
 aIfdq55kXhNJFhLLLeXjwy7YMMSt7Nl886NWWcE3BSM5aeDvK0yCIYelKd57hhQtLCIu7prFgf
 dkTsuqaMqdRoTHrD/SH/ZBNDjuACCSxw0kCXNeBBjJ98/k5yCtO/jiTNUI52jqLCN6r4oK87PU
 ml8wd+h1du/Xe+Kl9y8rjuUZ
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:24:56 -0800
IronPort-SDR: OerTNDHG1X58dwG3rXGLTQrdq7XneuWvWCrvLI/Qp/1RhdrNkePXihrmAMr4k7TQ4VK2Aa/FXX
 EYk5p1gBnKS2hwHNwc1MRL27DTDtn1+ApD2SnKJNgNAOQwfJgHJBA/n85F/d9wtdlXPHZbslJU
 rNaFofy1McG91G2xsJ1TBPFOaty1GwkeiFJ+5tHJJQBUkdTCzFFTu0Wqvr3FWToWHlcYYUAxjp
 O8TTY64j0nYGYIsOiwj4eE53u2p2RcWmfku7rd0DUBhEtGEyb0LstpYtJlzmQqmtuabGEuU0R5
 k0o=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jan 2022 21:52:30 -0800
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4JW8PT16gSz1VSkY
 for <qemu-devel@nongnu.org>; Fri,  7 Jan 2022 21:52:29 -0800 (PST)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :mime-version:references:in-reply-to:x-mailer:message-id:date
 :subject:to:from; s=dkim; t=1641621148; x=1644213149; bh=HZXHreY
 z/nKg8R6C1e2J1FIziXqEjB6GX/QfiNOv3xY=; b=R8P334/VX4+2wJFyGdyK6vp
 jKJK9yId6l+n6Ytw0JdgjmaIEIYwTzgE5OXyLJfY7V8VRtG2Wt6nhNdEIUKXVGZ7
 /WPiOh84+A+10OjJFSKnX5wK2dE+36kcT/fa+j+VgnCbRKI0lloKuVd51mazTF0Z
 hS2bZ2Lt+/IY3hujkSZFlms0UpZznmC79yGTfm5JbiCuToBN0FlBbdzQ/Wj/anOY
 ndz/P1B8A84ZExjECeZA2FJfrlJr+YFLyjlOzfrjZUMB/h5ONSwOtMSvfpH+JjAj
 NtjehfV1TCohAsGIku1vSXDtR2WTPL1MfXldn1XBuWiKurMZBUMezg82D/zMhig=
 =
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id NbB0V0jlqwER for <qemu-devel@nongnu.org>;
 Fri,  7 Jan 2022 21:52:28 -0800 (PST)
Received: from toolbox.alistair23.me (unknown [10.225.165.74])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4JW8PP06j1z1VSkV;
 Fri,  7 Jan 2022 21:52:24 -0800 (PST)
From: Alistair Francis <alistair.francis@opensource.wdc.com>
To: qemu-devel@nongnu.org
Cc: alistair23@gmail.com, =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20P=C3=A9trot?=
 <frederic.petrot@univ-grenoble-alpes.fr>, 
 Fabien Portas <fabien.portas@grenoble-inp.org>,
 Alistair Francis <alistair.francis@wdc.com>
Subject: [PULL 19/37] qemu/int128: addition of div/rem 128-bit operations
Date: Sat,  8 Jan 2022 15:50:30 +1000
Message-Id: <20220108055048.3512645-20-alistair.francis@opensource.wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
References: <20220108055048.3512645-1-alistair.francis@opensource.wdc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=000118587=alistair.francis@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001,
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

From: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-grenoble-alpes=
.fr>

Addition of div and rem on 128-bit integers, using the 128/64->128 divu a=
nd
64x64->128 mulu in host-utils.
These operations will be used within div/rem helpers in the 128-bit riscv
target.

Signed-off-by: Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@univ-greno=
ble-alpes.fr>
Co-authored-by: Fabien Portas <fabien.portas@grenoble-inp.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20220106210108.138226-4-frederic.petrot@univ-grenoble-alpes.f=
r
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 include/qemu/int128.h |  27 ++++++++
 util/int128.c         | 147 ++++++++++++++++++++++++++++++++++++++++++
 util/meson.build      |   1 +
 3 files changed, 175 insertions(+)
 create mode 100644 util/int128.c

diff --git a/include/qemu/int128.h b/include/qemu/int128.h
index b6d517aea4..2c4064256c 100644
--- a/include/qemu/int128.h
+++ b/include/qemu/int128.h
@@ -172,6 +172,26 @@ static inline Int128 bswap128(Int128 a)
 #endif
 }
=20
+static inline Int128 int128_divu(Int128 a, Int128 b)
+{
+    return (__uint128_t)a / (__uint128_t)b;
+}
+
+static inline Int128 int128_remu(Int128 a, Int128 b)
+{
+    return (__uint128_t)a % (__uint128_t)b;
+}
+
+static inline Int128 int128_divs(Int128 a, Int128 b)
+{
+    return a / b;
+}
+
+static inline Int128 int128_rems(Int128 a, Int128 b)
+{
+    return a % b;
+}
+
 #else /* !CONFIG_INT128 */
=20
 typedef struct Int128 Int128;
@@ -379,6 +399,11 @@ static inline Int128 bswap128(Int128 a)
     return int128_make128(bswap64(a.hi), bswap64(a.lo));
 }
=20
+Int128 int128_divu(Int128, Int128);
+Int128 int128_remu(Int128, Int128);
+Int128 int128_divs(Int128, Int128);
+Int128 int128_rems(Int128, Int128);
+
 #endif /* CONFIG_INT128 */
=20
 static inline void bswap128s(Int128 *s)
@@ -386,4 +411,6 @@ static inline void bswap128s(Int128 *s)
     *s =3D bswap128(*s);
 }
=20
+#define UINT128_MAX int128_make128(~0LL, ~0LL)
+
 #endif /* INT128_H */
diff --git a/util/int128.c b/util/int128.c
new file mode 100644
index 0000000000..ed8f25fef1
--- /dev/null
+++ b/util/int128.c
@@ -0,0 +1,147 @@
+/*
+ * 128-bit division and remainder for compilers not supporting __int128
+ *
+ * Copyright (c) 2021 Fr=C3=A9d=C3=A9ric P=C3=A9trot <frederic.petrot@un=
iv-grenoble-alpes.fr>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
+ * of this software and associated documentation files (the "Software"),=
 to deal
+ * in the Software without restriction, including without limitation the=
 rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or =
sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be includ=
ed in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/host-utils.h"
+#include "qemu/int128.h"
+
+#ifndef CONFIG_INT128
+
+/*
+ * Division and remainder algorithms for 128-bit due to Stefan Kanthak,
+ * https://skanthak.homepage.t-online.de/integer.html#udivmodti4
+ * Preconditions:
+ *     - function should never be called with v equals to 0, it has to
+ *       be dealt with beforehand
+ *     - quotien pointer must be valid
+ */
+static Int128 divrem128(Int128 u, Int128 v, Int128 *q)
+{
+    Int128 qq;
+    uint64_t hi, lo, tmp;
+    int s =3D clz64(v.hi);
+
+    if (s =3D=3D 64) {
+        /* we have uu=C3=B70v =3D> let's use divu128 */
+        hi =3D u.hi;
+        lo =3D u.lo;
+        tmp =3D divu128(&lo, &hi, v.lo);
+        *q =3D int128_make128(lo, hi);
+        return int128_make128(tmp, 0);
+    } else {
+        hi =3D int128_gethi(int128_lshift(v, s));
+
+        if (hi > u.hi) {
+            lo =3D u.lo;
+            tmp =3D u.hi;
+            divu128(&lo, &tmp, hi);
+            lo =3D int128_gethi(int128_lshift(int128_make128(lo, 0), s))=
;
+        } else { /* prevent overflow */
+            lo =3D u.lo;
+            tmp =3D u.hi - hi;
+            divu128(&lo, &tmp, hi);
+            lo =3D int128_gethi(int128_lshift(int128_make128(lo, 1), s))=
;
+        }
+
+        qq =3D int128_make64(lo);
+
+        tmp =3D lo * v.hi;
+        mulu64(&lo, &hi, lo, v.lo);
+        hi +=3D tmp;
+
+        if (hi < tmp     /* quotient * divisor >=3D 2**128 > dividend */
+            || hi > u.hi /* quotient * divisor > dividend */
+            || (hi =3D=3D u.hi && lo > u.lo)) {
+            qq.lo -=3D 1;
+            mulu64(&lo, &hi, qq.lo, v.lo);
+            hi +=3D qq.lo * v.hi;
+        }
+
+        *q =3D qq;
+        u.hi -=3D hi + (u.lo < lo);
+        u.lo -=3D lo;
+        return u;
+    }
+}
+
+Int128 int128_divu(Int128 a, Int128 b)
+{
+    Int128 q;
+    divrem128(a, b, &q);
+    return q;
+}
+
+Int128 int128_remu(Int128 a, Int128 b)
+{
+    Int128 q;
+    return divrem128(a, b, &q);
+}
+
+Int128 int128_divs(Int128 a, Int128 b)
+{
+    Int128 q;
+    bool sgna =3D !int128_nonneg(a);
+    bool sgnb =3D !int128_nonneg(b);
+
+    if (sgna) {
+        a =3D int128_neg(a);
+    }
+
+    if (sgnb) {
+        b =3D int128_neg(b);
+    }
+
+    divrem128(a, b, &q);
+
+    if (sgna !=3D sgnb) {
+        q =3D int128_neg(q);
+    }
+
+    return q;
+}
+
+Int128 int128_rems(Int128 a, Int128 b)
+{
+    Int128 q, r;
+    bool sgna =3D !int128_nonneg(a);
+    bool sgnb =3D !int128_nonneg(b);
+
+    if (sgna) {
+        a =3D int128_neg(a);
+    }
+
+    if (sgnb) {
+        b =3D int128_neg(b);
+    }
+
+    r =3D divrem128(a, b, &q);
+
+    if (sgna) {
+        r =3D int128_neg(r);
+    }
+
+    return r;
+}
+
+#endif
diff --git a/util/meson.build b/util/meson.build
index 05b593055a..e676b2f6c6 100644
--- a/util/meson.build
+++ b/util/meson.build
@@ -48,6 +48,7 @@ util_ss.add(files('transactions.c'))
 util_ss.add(when: 'CONFIG_POSIX', if_true: files('drm.c'))
 util_ss.add(files('guest-random.c'))
 util_ss.add(files('yank.c'))
+util_ss.add(files('int128.c'))
=20
 if have_user
   util_ss.add(files('selfmap.c'))
--=20
2.31.1


