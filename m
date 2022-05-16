Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8FBE52873E
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 16:39:21 +0200 (CEST)
Received: from localhost ([::1]:39390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqbsU-0000Qx-Sy
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 10:39:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46046)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nqbiu-0003AD-U4
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:29:24 -0400
Received: from mout.gmx.net ([212.227.17.21]:36523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nqbir-0004wV-Ln
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:29:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652711349;
 bh=DSuS3NZkso2k1kO/PGV+2j/7e1QVridaN1NaTFnUJyQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=ex47bRBlW7lt6MXTZ46wHkJT+sAjSh92AHOzZUuo4yt8bLXaiKmO+8HkRmxf6ujjd
 I5jYu6lPX0sZ+SOQVbHnHhxO4CaiBPkJvqq1PLqwr5/++YP08SOM1WZNKa2/aA3vQy
 uTHNsJzSQ0vngxhQL5c/iQFZvZgO/TRrUCuTW/iY=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.160.68]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N0G1n-1neHEA3Aut-00xIb9; Mon, 16
 May 2022 16:29:09 +0200
From: Helge Deller <deller@gmx.de>
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Sven Schnelle <svens@stackframe.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Cc: Helge Deller <deller@gmx.de>,
	Stefano Repici <rs.rdp@zoho.eu>
Subject: [PATCH v2 2/7] artist: Introduce constant for max cursor size
Date: Mon, 16 May 2022 16:29:02 +0200
Message-Id: <20220516142907.32827-3-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220516142907.32827-1-deller@gmx.de>
References: <20220516142907.32827-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:86WSLRtqnuGlKSfn0TZnBz83cCPmb3jTbw7g3Xe2mFe99MrnR6y
 CxYCEoCKqBa4VkuqvXzaOoBrqJroaoxMl9lot7opXFpknfAPJs39F3ZvDNJpy8Vfk/noBje
 DkrJM+Kv+hnTJXUXVmYBjxB6qSkKw8yOTjNBznWV8H7/K8mrhrdX3/scP0Js4KsM25Ak8LQ
 8E1HmgzYIaWEoJx/MZxGQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:7p2sxTPhILM=:t58to39MHSRnSqB9YcXD0I
 LLA+yjrfIT524WiawBfEYc8b8IPQ/CR4NrOlXYcq7gnb41eEna7IPykS/DxUhqrCYsFn3lVPM
 Db6T5gcuNW1Kn9Omi8/9L3XQFGrBsN9oZ/8KSxAIcJJGMDl3Ddm7jBCsXgEHCWytSTRsDjtFs
 Jwn/j+1JEe89Ym/sCM2XJv1nlU9fznlIeGKRoNiq9HPGDuRDwfxIuOyKtlUJXOonj5vKn6LRp
 49En0d6yXroWLl3t4cWkrPQ31ySVIjMWsVKvCnCgazGAPSvSTk0yhEsHMsoj1fWgnlyebqcib
 FDQXKr5FzdUq9MEqHGBVwKTsD4WqZHcW2I8JrQQrJRs+vJYokhzwsBlP0Uun+jtowGA1GHeIH
 AdIozqbsKmZTfnUgh59+FebEqaSnPhFh2/+OpU7XeYQIi/nNHlrF5DSFt5AEHqldn+0eF2sdQ
 ai7f1psyjidPDwgGMLCIcLgOyPlF861ww7XpXYCFEKkJrKOv8gk5pVjhgnupet0xQ5XW+NCsH
 uDaKukLzDWjjFaM86y0sdtvd7PE+bavphlfT27kjB1nRXASyYKEo97ojXTscDGvsjbgrlfBxS
 yaBGwK6S9TEaTpLrAmVa72Heg4ZW9Uu6g0I5iRe+WgZrrllrzarZGplF5OTMtxBoFU7hnqHxe
 TjJstMGplcn2rN/mPWaEjqMw7XL2OEk1QyYgx/IAj9LMj/4EvrrHzogSyhyNM0BgJeb8p7NGr
 lcZHBmtDfRwYEbSkZJzbYytpAVtN3akC4bj1j4TM+dEFg9s4T42DTKz3JsO4kUGBmnaroxSez
 NSuP/kCxd1L1bSx3zdbBnQovbB1AMm2hUF7DBx05QmTghDp2Ub9XnPUvQUNKPlT84gLwob/P1
 DSNuNyKOBXgLl5xMOnXZL8TAp63WNlHqCNR3lhA2x+L/cI4ZIfkXSwhnxasycg+hk3VWO+7mv
 jsdD4eOjzPuLW8p4KIxkRckxUnknN1M7SlXfNe6JRB8Bj3LGgvy6BWXec1XDG2AFD+0cZl9qN
 yB5egTkVvv8WiPSJhISTDlPQQ7DEKsEU8CjiP65gjDmsZ7UH4g5as6HMm2MJMQBumqXM0hQva
 brJ6taQlhJLzUb1sMrxAc5ZsRLZUotOGx3puas6ww51eIHYhsmtrMh69g==
Received-SPF: pass client-ip=212.227.17.21; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, FREEMAIL_FROM=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Add the constant NGLE_MAX_SPRITE_SIZE which defines the currently
maximum supported cursor size.

Signed-off-by: Helge Deller <deller@gmx.de>
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
=2D--
 hw/display/artist.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/hw/display/artist.c b/hw/display/artist.c
index 39fc0c4ca5..6333ee41db 100644
=2D-- a/hw/display/artist.c
+++ b/hw/display/artist.c
@@ -98,6 +98,9 @@ struct ARTISTState {
     int draw_line_pattern;
 };

+/* hardware allows up to 64x64, but we emulate 32x32 only. */
+#define NGLE_MAX_SPRITE_SIZE    32
+
 typedef enum {
     ARTIST_BUFFER_AP =3D 1,
     ARTIST_BUFFER_OVERLAY =3D 2,
@@ -1325,11 +1328,10 @@ static void artist_realizefn(DeviceState *dev, Err=
or **errp)
     framebuffer_update_memory_section(&s->fbsection, &buf->mr, 0,
                                       buf->width, buf->height);
     /*
-     * no idea whether the cursor is fixed size or not, so assume 32x32 w=
hich
-     * seems sufficient for HP-UX X11.
+     * Artist cursor max size
      */
-    s->cursor_height =3D 32;
-    s->cursor_width =3D 32;
+    s->cursor_height =3D NGLE_MAX_SPRITE_SIZE;
+    s->cursor_width =3D NGLE_MAX_SPRITE_SIZE;

     /*
      * These two registers are not initialized by seabios's STI implement=
ation.
=2D-
2.35.3


