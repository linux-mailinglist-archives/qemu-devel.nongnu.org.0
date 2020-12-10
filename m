Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3232D5C51
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 14:51:36 +0100 (CET)
Received: from localhost ([::1]:39230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knMM1-0004SL-Ns
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 08:51:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43598)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavlica.nikola@gmail.com>)
 id 1knLpm-0006Lb-Nt
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 08:18:16 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:37053)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pavlica.nikola@gmail.com>)
 id 1knLpj-0000pD-2N
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 08:18:14 -0500
Received: by mail-wr1-x434.google.com with SMTP id i9so5451545wrc.4
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 05:18:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:subject:to:cc:message-id:references:mime-version;
 bh=xhdMX2MWUtFun6i/MxxY4YYad7yS5Go0dDaBEfn68FQ=;
 b=NW/SIrWmy6aCLlByaVll97q6gRHpIFSotfQX2lqbrEnFs619FsF2nn+az/DGJrW3sw
 ouJYzWzTDyxUsdqV90kklIf8L4cd2iwBu+6QYLqDBizgmlf+TaLtcztTcXtcXW8oD5Yc
 hDbAviuBb22Pd3lNYZftb4td4jcLOaZTnBLXBcCtIsgWPGjwIlJwGdQyL/O6wu2VSk+I
 s04NMDIOVr4B/KvQ13j68G0qVsXh4zoeJugPZ9f1pQCpWWnHzOTwEs47TWPTfvqBDTyZ
 Uau5CnzFXuqqisbZv7m+rL/jpMVvrejlLpjY+HY/+xlCF91T8rOrmpvI0OJK0oCh4Ez2
 zMrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:subject:to:cc:message-id:references
 :mime-version;
 bh=xhdMX2MWUtFun6i/MxxY4YYad7yS5Go0dDaBEfn68FQ=;
 b=sDikvon/ytm4UjFxBWbuhUQu3dyTMgFIbUtLUWlzDEIcVZOSeKjJOX0Ib+RfgIdq91
 aBi1uPcKK9N85OlIpEd2jWdzipusCuphDjM56te0fkEP/DwrRuHESNdVTlvMxkFr6UrW
 QpMppk+KTLnrMvUtKPXJnSEMot2L3A48zz9YAZNQ9JxnqtrqH5enBrhmoAAiQ5+yIUGu
 Y/7rMFbMZSCDqYGAdFSPYTy9u07nDs3rDQ39Lnbk5ZQ3v0KEMb5YZkS7FxugKG6Xj1Ni
 Yk2DzeAX9TQEoIBZsAWpT7XxMNBLaSfSL9qc/upIAiDBDDfMZxO2kAVfMDuQqV7GhATx
 H2lw==
X-Gm-Message-State: AOAM532hoeK1Aps15nEE4S7YaoBMOmF3Js2s96wyprev0aqTvDE7M7W2
 E6NKrvIwxtEJKnHGETsQyLdixGnOyP11AQ==
X-Google-Smtp-Source: ABdhPJxSmC46WXIYXCoDujs4CexBt6nNCTDVrWQrXGIw15VArZTgdBU1KPhwVy5rzjmC2nBuLxM1Bg==
X-Received: by 2002:a5d:4c4e:: with SMTP id n14mr8337905wrt.209.1607606287580; 
 Thu, 10 Dec 2020 05:18:07 -0800 (PST)
Received: from [192.168.100.143] ([213.91.86.150])
 by smtp.gmail.com with ESMTPSA id b7sm9936873wrv.47.2020.12.10.05.18.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Dec 2020 05:18:06 -0800 (PST)
Date: Thu, 10 Dec 2020 14:18:00 +0100
From: Nikola Pavlica <pavlica.nikola@gmail.com>
Subject: Fwd: [PATCH] ui/gtk: Update refresh rate for EGL as well
To: qemu-devel <qemu-devel@nongnu.org>
Message-Id: <0YK4LQ.TXOOMXIJ2UKZ1@gmail.com>
References: <20201210124005.96817-1-pavlica.nikola@gmail.com>
X-Mailer: geary/3.38.1
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-YibSEIvWxNlPT6A0hKJI"
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=pavlica.nikola@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--=-YibSEIvWxNlPT6A0hKJI
Content-Type: text/plain; charset=us-ascii; format=flowed

I guess "git send-email" didn't do much, so I'm just forwarding the 
email now.

---------- Forwarded message ----------
 From: Nikola Pavlica <pavlica.nikola@gmail.com>
Subject: [PATCH] ui/gtk: Update refresh rate for EGL as well
Date: 2020-12-10T13:40:06+0100
To: qemu-devel@nongnu.com
Cc: Nikola Pavlica <pavlica.nikola@gmail.com>

---
 include/ui/gtk.h | 1 +
 ui/gtk-egl.c     | 8 ++++++++
 ui/gtk.c         | 2 +-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index eaeb450f91..6025a4f030 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -88,6 +88,7 @@ extern bool gtk_use_gl_area;

 /* ui/gtk.c */
 void gd_update_windowsize(VirtualConsole *vc);
+int gd_refresh_rate_millihz(GtkWidget *window);

 /* ui/gtk-egl.c */
 void gd_egl_init(VirtualConsole *vc);
diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index 99231a3597..a9131783f0 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -112,6 +112,14 @@ void gd_egl_update(DisplayChangeListener *dcl,
 void gd_egl_refresh(DisplayChangeListener *dcl)
 {
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
+    int refresh_rate_millihz;
+
+    refresh_rate_millihz = gd_refresh_rate_millihz(vc->window ? 
vc->window :
+                                                   
vc->gfx.drawing_area);
+    if (refresh_rate_millihz) {
+        vc->gfx.dcl.update_interval = MILLISEC_PER_SEC / 
refresh_rate_millihz;
+    }
+

     if (!vc->gfx.esurface) {
         gd_egl_init(vc);
diff --git a/ui/gtk.c b/ui/gtk.c
index a752aa22be..3b8755b746 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -752,7 +752,7 @@ static void gd_resize_event(GtkGLArea *area,
  * If available, return the refresh rate of the display in milli-Hertz,
  * else return 0.
  */
-static int gd_refresh_rate_millihz(GtkWidget *window)
+int gd_refresh_rate_millihz(GtkWidget *window)
 {
 #ifdef GDK_VERSION_3_22
     GdkWindow *win = gtk_widget_get_window(window);
-- 
2.29.2



--=-YibSEIvWxNlPT6A0hKJI
Content-Type: text/html; charset=us-ascii

<div id="geary-body" dir="auto">I guess "git send-email" didn't do much, so I'm just forwarding the email now.</div><div id="geary-quote" dir="auto"><br>---------- Forwarded message ----------<br>From: Nikola Pavlica &lt;pavlica.nikola@gmail.com&gt;<br>Subject: [PATCH] ui/gtk: Update refresh rate for EGL as well<br>Date: 2020-12-10T13:40:06+0100<br>To: qemu-devel@nongnu.com<br>Cc: Nikola Pavlica &lt;pavlica.nikola@gmail.com&gt;<br><br><div class="plaintext" style="white-space: pre-wrap;">---
 include/ui/gtk.h | 1 +
 ui/gtk-egl.c     | 8 ++++++++
 ui/gtk.c         | 2 +-
 3 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index eaeb450f91..6025a4f030 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -88,6 +88,7 @@ extern bool gtk_use_gl_area;
 
 /* ui/gtk.c */
 void gd_update_windowsize(VirtualConsole *vc);
+int gd_refresh_rate_millihz(GtkWidget *window);
 
 /* ui/gtk-egl.c */
 void gd_egl_init(VirtualConsole *vc);
diff --git a/ui/gtk-egl.c b/ui/gtk-egl.c
index 99231a3597..a9131783f0 100644
--- a/ui/gtk-egl.c
+++ b/ui/gtk-egl.c
@@ -112,6 +112,14 @@ void gd_egl_update(DisplayChangeListener *dcl,
 void gd_egl_refresh(DisplayChangeListener *dcl)
 {
     VirtualConsole *vc = container_of(dcl, VirtualConsole, gfx.dcl);
+    int refresh_rate_millihz;
+
+    refresh_rate_millihz = gd_refresh_rate_millihz(vc-&gt;window ? vc-&gt;window :
+                                                   vc-&gt;gfx.drawing_area);
+    if (refresh_rate_millihz) {
+        vc-&gt;gfx.dcl.update_interval = MILLISEC_PER_SEC / refresh_rate_millihz;
+    }
+
 
     if (!vc-&gt;gfx.esurface) {
         gd_egl_init(vc);
diff --git a/ui/gtk.c b/ui/gtk.c
index a752aa22be..3b8755b746 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -752,7 +752,7 @@ static void gd_resize_event(GtkGLArea *area,
  * If available, return the refresh rate of the display in milli-Hertz,
  * else return 0.
  */
-static int gd_refresh_rate_millihz(GtkWidget *window)
+int gd_refresh_rate_millihz(GtkWidget *window)
 {
 #ifdef GDK_VERSION_3_22
     GdkWindow *win = gtk_widget_get_window(window);
<div>-- 
</div>2.29.2

</div></div>
--=-YibSEIvWxNlPT6A0hKJI--


