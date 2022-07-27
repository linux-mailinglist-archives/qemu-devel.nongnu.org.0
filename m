Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FF7582A29
	for <lists+qemu-devel@lfdr.de>; Wed, 27 Jul 2022 18:01:42 +0200 (CEST)
Received: from localhost ([::1]:59052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oGjTd-0007aw-Ip
	for lists+qemu-devel@lfdr.de; Wed, 27 Jul 2022 12:01:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGjP9-00020D-6k
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 11:56:59 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:41501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1oGjP7-0001rq-LK
 for qemu-devel@nongnu.org; Wed, 27 Jul 2022 11:56:58 -0400
Received: by mail-wr1-x42b.google.com with SMTP id q18so14643886wrx.8
 for <qemu-devel@nongnu.org>; Wed, 27 Jul 2022 08:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aPXdNhzlI3SJUbht3qTiy4gOGCn78/FVNoBho+NsY7A=;
 b=XlYKc/rnywQMC/2AiuPNwVwfVhGAU+Z1z0Kw+9f0IYPsIq45zCkd+qIbZZjrZliw6/
 YnRjPXpQwn4GAJ2vFXttzHsAYF/7pgxqRautBCo8e2Sh4p4Vk7ibxwHf6NC18PhbGGpI
 372iTkHv6KRHseUDWHx06hHsV0u8sdE9DuvJADiiiRnD9EhjrzfNB/lm5JzlHmCINCXE
 i4HtAx0rQIM0SXuyTbqECnM+TigKSTtHSnfrsQrk3dbO5vyPIO/WT3jvRBfqC2cvbz3A
 7HW+LPe+qoj7biAAsTxUsvkD0QLQWaCJp8ecGUC2F/ittBp+edjHH+POpaRr3m85ylWu
 p01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aPXdNhzlI3SJUbht3qTiy4gOGCn78/FVNoBho+NsY7A=;
 b=ogZWpTTjxEK+W5GTJMiuOeWZGlRm6C7pWa3yswWnqAW0FUgtTKdIpQrjijaq5OtlD+
 a0TR6POLAr4QDD4AeWI2V5tWjWZhoMW52SH5xuzClV+oUcDTrtwJ4jqJ1XDJ3HwprVcp
 2Haqt+47od9qBpCShVaK4LmgDG8go39f4XoyYwH5GpfZbe6MuQtF6RFGC/758VMscF4Y
 X4Wj9CQVe2eUP1B7xugt1bOEiYOChovdOfZwepJe6jzzkXszSzu8oUvKbzoVAQmd7cPs
 s9QbaduEHAs2QkPc2YEeKkQCnB8tY3HwzDxT02fVVbnhPmxIj65vs/rfMqjirvIB3Pye
 3VcQ==
X-Gm-Message-State: AJIora+XnRO8IrYc1RvA1j435IZGd422apSKI96PYu9pjVQ50v2HWvlS
 Wo6jT1pJBEuV4J3jy684OwIwvg==
X-Google-Smtp-Source: AGRyM1ucmn4c9RA3Nb+4tUgJVzv2yVXHff7r1nqnVVx2WFfs5s3FTi40G9SwP/0B74+GDDrPHuh+ww==
X-Received: by 2002:adf:fd42:0:b0:21e:4357:3f38 with SMTP id
 h2-20020adffd42000000b0021e43573f38mr14334487wrs.620.1658937414982; 
 Wed, 27 Jul 2022 08:56:54 -0700 (PDT)
Received: from zen.linaroharston ([185.81.254.11])
 by smtp.gmail.com with ESMTPSA id
 n16-20020a05600c4f9000b003a2f2bb72d5sm3167461wmq.45.2022.07.27.08.56.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Jul 2022 08:56:53 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 69C281FFB7;
 Wed, 27 Jul 2022 16:56:53 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH for 7.1 v1 0/5] virtio fixes (split from virtio-gpio series)
Date: Wed, 27 Jul 2022 16:56:48 +0100
Message-Id: <20220727155653.3974426-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Hi,

This is just a split out series based on:

   Subject: [PATCH v3 for 7.2 00/21] virtio-gpio and various virtio cleanups
   Date: Tue, 26 Jul 2022 20:21:29 +0100
   Message-Id: <20220726192150.2435175-1-alex.bennee@linaro.org>

with the patches identified by mst:

  Right. Still I think some are fixes we should merge now.
  I am thinking patches 5, 7,8,9 ? 6 if it makes backporting
  much easier. WDYT? If you agree pls separate bugfixes in
  series I can apply. Thanks!

So here they are ;-)

Alex Bennée (5):
  block/vhost-user-blk-server: don't expose
    VHOST_USER_F_PROTOCOL_FEATURES
  hw/virtio: incorporate backend features in features
  hw/virtio: gracefully handle unset vhost_dev vdev
  hw/virtio: handle un-configured shutdown in virtio-pci
  hw/virtio: fix vhost_user_read tracepoint

 block/export/vhost-user-blk-server.c |  3 +--
 hw/virtio/vhost-user.c               | 13 ++++++++++---
 hw/virtio/vhost.c                    | 10 +++++++---
 hw/virtio/virtio-pci.c               |  9 +++++++--
 4 files changed, 25 insertions(+), 10 deletions(-)

-- 
2.30.2


