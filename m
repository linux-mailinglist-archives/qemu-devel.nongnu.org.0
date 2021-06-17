Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 325ED3AB31A
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 13:57:47 +0200 (CEST)
Received: from localhost ([::1]:43440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltqeY-0005jP-7r
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 07:57:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltqas-0006ZR-B4
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:53:58 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:42598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ltqaq-0005Gq-QG
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 07:53:58 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 l7-20020a05600c1d07b02901b0e2ebd6deso3525690wms.1
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 04:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0yFcNPzCMbJU7ln7mvR4pO20Y4U4Q8SH66r8xtnNF00=;
 b=OTbM4gF9kYBNFJEShrnJTZDm64kaTsMoodOYgY4nwWVH7YgfDSELHcCWWOjh51oO9j
 cTcpKAP46KqxI0/P2OgDHCb4ibi2VBCXAOiIP63ZVgnJENdTSL1k/DVFDTCKOWdHHgYh
 O2UUbiNz4teaqjhEZLqqMbWVTnlKNm8iNDo9g7MpAxL6SgfHCSqW/8KFQ4p0UNzVoem6
 0/MgU0gICpGLWK/SR4OJh4Ahn5s14xPinjyFv/SCsCx7u/D7JPg+CVAIXR2EZ6UnYZGU
 LWV7jjhEGAFCfGv46DP8MfFCSmpsVMu/zCmRNTGx2coG4UHtNsLC/SBCK8TvlpfxnWfq
 54Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=0yFcNPzCMbJU7ln7mvR4pO20Y4U4Q8SH66r8xtnNF00=;
 b=IWVA5IZdXBnwVwNHPDAu/Wf46xyepAP0O4EIohO7ZvpiBPyzoLY6Me8GmsNwxH94As
 cWNfMRUT/hxe15ozFcUXoF8E1Z7tjJTu4gYnprd1mPwG71xAlQ9nl5WNSsvogqiI/3/q
 lrjWhpElK07fEBSpYCFTzZVNC6AH+47Mf/Pu5Of26Y2MvjEmpKdxJ5H5qDPqFjDcatKE
 OyeHyCDGpNf5s5Fd0bC3dDoC0XOoBSjHi7AQ8O1KLNStt1atM7gIWk419qgizGcD70Vc
 JdbGtFuMt2NoBhIWzseGyQrqMxRrQdLnTNyrTAg0RLVFHqtFyx7n3EhuvZyW9ycL8XRq
 rkRA==
X-Gm-Message-State: AOAM532eDLu9KGx4O3Ii/XlapAHOthrqaVk1pfGamcFVLe+Qbh+69/DX
 qB69Qrlw/XfGWuwcLScYJbYD4lei4XbqtQ==
X-Google-Smtp-Source: ABdhPJxPGzt/pgjWg+3ZlKo53AlbVd3EhL/8zVBjFE4oKFRHCNk2Y0iUj5YSeuDCefgGNJUmki0U5g==
X-Received: by 2002:a1c:4954:: with SMTP id w81mr4636156wma.182.1623930835312; 
 Thu, 17 Jun 2021 04:53:55 -0700 (PDT)
Received: from x1w.. (93.red-83-35-24.dynamicip.rima-tde.net. [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id t9sm4646788wmq.14.2021.06.17.04.53.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 04:53:54 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 04/15] hw/display/sm501: Replace i2c_send_recv() by
 i2c_recv() & i2c_send()
Date: Thu, 17 Jun 2021 13:53:23 +0200
Message-Id: <20210617115334.2761573-5-f4bug@amsat.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210617115334.2761573-1-f4bug@amsat.org>
References: <20210617115334.2761573-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Corey Minyard <cminyard@mvista.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Instead of using the confuse i2c_send_recv(), rewrite to directly
call i2c_recv() & i2c_send(), resulting in code easier to review.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Acked-by: Corey Minyard <cminyard@mvista.com>
Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/display/sm501.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index f276276f7f1..569661a0746 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -1033,17 +1033,18 @@ static void sm501_i2c_write(void *opaque, hwaddr addr, uint64_t value,
     case SM501_I2C_CONTROL:
         if (value & SM501_I2C_CONTROL_ENABLE) {
             if (value & SM501_I2C_CONTROL_START) {
+                bool is_recv = s->i2c_addr & 1;
                 int res = i2c_start_transfer(s->i2c_bus,
                                              s->i2c_addr >> 1,
-                                             s->i2c_addr & 1);
+                                             is_recv);
                 if (res) {
                     s->i2c_status |= SM501_I2C_STATUS_ERROR;
                 } else {
                     int i;
                     for (i = 0; i <= s->i2c_byte_count; i++) {
-                        res = i2c_send_recv(s->i2c_bus, &s->i2c_data[i],
-                                            !(s->i2c_addr & 1));
-                        if (res) {
+                        if (is_recv) {
+                            s->i2c_data[i] = i2c_recv(s->i2c_bus);
+                        } else if (i2c_send(s->i2c_bus, s->i2c_data[i]) < 0) {
                             s->i2c_status |= SM501_I2C_STATUS_ERROR;
                             return;
                         }
-- 
2.31.1


