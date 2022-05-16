Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06CE45288AA
	for <lists+qemu-devel@lfdr.de>; Mon, 16 May 2022 17:23:37 +0200 (CEST)
Received: from localhost ([::1]:46952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqcZL-0004EJ-Qj
	for lists+qemu-devel@lfdr.de; Mon, 16 May 2022 11:23:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nqc3p-0005uK-4n
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:51:02 -0400
Received: from mout.gmx.net ([212.227.17.22]:59359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <deller@gmx.de>) id 1nqc2o-0008DM-Ut
 for qemu-devel@nongnu.org; Mon, 16 May 2022 10:50:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1652712576;
 bh=DSuS3NZkso2k1kO/PGV+2j/7e1QVridaN1NaTFnUJyQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Cg4zOfAorOyFa0wOup/Qy2qvWynnKeQBgRxu3yKVrNVcVFU92KzJn3NyqsUHkmwtE
 u3ez+mZ5ya5w8oCvJlsPrTWdmb+c+libGQ5a8Tkh3U3zQ1RoV3rcoB4wTd6jywVUcL
 lyS/wlBQ7BW2+llYxuHxkLLaeCnZ3hlaJDpieb+c=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from p100.fritz.box ([92.116.160.68]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N4Qwg-1niOYw2axS-011OTc; Mon, 16
 May 2022 16:49:36 +0200
From: Helge Deller <deller@gmx.de>
To: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Sven Schnelle <svens@stackframe.org>, qemu-devel@nongnu.org
Cc: Stefano Repici <rs.rdp@zoho.eu>,
	Helge Deller <deller@gmx.de>
Subject: [PATCH v3 2/7] artist: Introduce constant for max cursor size
Date: Mon, 16 May 2022 16:49:29 +0200
Message-Id: <20220516144934.36273-3-deller@gmx.de>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20220516144934.36273-1-deller@gmx.de>
References: <20220516144934.36273-1-deller@gmx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:eBnni0Xs4tSWrc9fg5IfskQTOwAwgrJG1fRlO3VQ5EliXh0FuAc
 RC+RjsAp8AvgzWmKSivmEilXobt72UWSTn2C9pCUpkaq810/XbM721T2TupMrN5LW2HhfYy
 bHcJLIXr4DSFX94pQNuUJTQJ0crncGUckDrWaRiywXKYC/RoNxNpuY1LNdfNrofJkdMFzZa
 wAcZe9G/Y2bEB/uLw7MSw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:skOJ00Y+EyQ=:aXADi+LsEEcdZJP45N5VyC
 q8XcGqIVGQ80qaHeyXk7GFwMCe3yOmGPuK+62siqrn0fNwMjha1pWWZYYvfRiuD/jEyX3scmJ
 ks1zZRC2aQrRfF1MrTNbgju9cIUn2qlmkSD3YFFn+VvfAc2G1dWdL96dI/hsuZJ8bocWf/xy9
 n7MyX8dMEqBT3nuOPLSWHWd7xICdmQ3IOkMMp0eAhujUpfEQeIWHY9aXk9BbzG2/JVX7iRats
 aFKdAILRn8MGljPV/ZLpHAsXWgdnpRFmSQeHv6lkMtochPRv6TVLN031jQJCFpUtlC5/lh61b
 nCYJgGnaExiMmfLzJIDZjuHg7QC05o+uZQ3Wh1YhoZwFZJJneiRv5H4O2kkhqLAozXUXs9rZ9
 u/8QhTd78s5h8EdZE45ZVDjVuto7pKNIluc9LYltkoYRpsDdO7VNv4tt8UyQ+VVgOdckzoO6i
 a5jb3Sj/YqkYB+tEAmue0yrYrYDe98YOUKq1TmavkRM7aXuTF6RGZIQMrWQMN0u7g500V6AsW
 UXcjvk9tCFhm9r5nUqel623lKUBkiVgYwXp4IJNhHSpa9N5MDHkBzmm/+rNfZ1S+ae2flNeUw
 k9kX3kjz6XjdoBAOeaBvWh/HQxQxnbDAJ7t+VXq+lT0MbUuqIyp0qmIG9cwEMO7XkAVP+ywco
 w56JLN+3y0VHzAvYUgJ/GzphW8CwIek1CRrKLYVCToZeWu8JtllIsSKJK7c7ntl3Ke06EzlLm
 +cw27yx/gDbeO3nuDLV2T0YHjlBgvxnUaVy/ff+nLe886j/3A5BQm9ta0vX8Cim0wnHnZy/Jm
 NswnTOtjt7ustPbBBhzlfPv0g99G/IWlDdlZBt3XZte/A9Ap+JCUHhVHozgy2lJLILFwm0Pal
 oVbeuOqbnvmYE9OqDz/pcqUYGHnwsJCuPnXyMPrs+Z79OJL66U4C/CeDTN58/5gM1JfQXmZtn
 vjzON5381v5j6kZ96AXEQpqY0gRvFJVbKZ+d4QRnosx0/2Bb0HTd8c2RqQ51WweiSqCao+KGJ
 AwUK0zT3Er1X/QJYZvtNf0kOvRM2rxNInel0TORzAYdUrf/CfpakqLFtUOBKKYi7qWfo6u/3V
 DbvhgRrKmuGrac=
Received-SPF: pass client-ip=212.227.17.22; envelope-from=deller@gmx.de;
 helo=mout.gmx.net
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FROM=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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


