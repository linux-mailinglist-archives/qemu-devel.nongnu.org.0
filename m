Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 586172F6283
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jan 2021 14:56:47 +0100 (CET)
Received: from localhost ([::1]:57884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l037G-00072m-ES
	for lists+qemu-devel@lfdr.de; Thu, 14 Jan 2021 08:56:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pavlica.nikola@gmail.com>)
 id 1l02zx-0007QZ-2X
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:49:15 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332]:52849)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pavlica.nikola@gmail.com>)
 id 1l02zt-0002A8-CP
 for qemu-devel@nongnu.org; Thu, 14 Jan 2021 08:49:11 -0500
Received: by mail-wm1-x332.google.com with SMTP id a6so4599661wmc.2
 for <qemu-devel@nongnu.org>; Thu, 14 Jan 2021 05:49:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y2QUAQNgkudgSVhZMWfWaudJrZtLu0BAFGZus22Gg28=;
 b=AGA5U5hwGOeUMuLIBwD+v2TtuaD/pQuVkOuJo1k89xUDQiqPl/mEayBRQVJpOiEp2g
 JiSvD8Kqfw1pKZRbKGKxBAHTCvBSM8HaTs/HtJWQ4W1Oa1idbZRVWV//j3uBtWVLYMdC
 ipWr8sfJuO22bWCofvw871x93wALm4Og61MtFPBmrpYMtxg39i/DvA1hkwmrBYXv6/zm
 UeZgTRVEplcquVHzK637CW6djMD1iWkdjZ/dsieR8/28ZxcmPiOPass6orfk9VVCNb2b
 S2D7wInm8uWDHZUnsLut/fYfqDe7cBo9BGOMUx7Pb3CpK1JkMEChoim0Au38c5K5xCnB
 QyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=y2QUAQNgkudgSVhZMWfWaudJrZtLu0BAFGZus22Gg28=;
 b=hhJDrYKSa3AQIA4erM7MINZCWcL4x1X3x5vicWbv4brZckniyp+MAxBP8net9tO0Re
 M16RogidsfhBClSpX6piH3lj5OCJl9eXiZ5xBbTKlouzgMGUm9hZ55W1D3g8z9FRyLKL
 R2Ln0G/2V03FZBSM6UQoLotad812A16fdD0B3vb/Ue8e8HdZrFjbzLXQlINrBzGJG/qb
 Am6FuAYuUOWw1RvQcIs3J7/dlUlUOVD7uk65nzzftNkmw/s3eWzP+fPmt08P23Ee+QYb
 I5fugt0unTJsS3U4AB+zgFYTOJfSTAZ0D5lRJfsTwms2LOkirOUviMfHUk5fDbOi6F7L
 ICDA==
X-Gm-Message-State: AOAM53192c7hrY+INYFJi2qo0pV/z/BtdyOvCWXvT5RJNfo+Hx6scY1b
 2oJr/v+woFfQ0ntOZGf+JpGIYmTPkE9uu7/s
X-Google-Smtp-Source: ABdhPJxQPYCAxljZp+RC8u/Di/VKZdfFugpw6TjoDjECdc2VbKLj0SdtkJmtHk7ZfVtY8aZtI4zvDw==
X-Received: by 2002:a1c:b608:: with SMTP id g8mr4102404wmf.110.1610632147131; 
 Thu, 14 Jan 2021 05:49:07 -0800 (PST)
Received: from localhost.localdomain ([213.91.86.150])
 by smtp.googlemail.com with ESMTPSA id q7sm3611465wmq.0.2021.01.14.05.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Jan 2021 05:49:06 -0800 (PST)
From: Nikola Pavlica <pavlica.nikola@gmail.com>
To: qemu-devel@nongnu.org,
	qemu-devel@nongnu.com
Subject: [PATCH 0/2] ui/gtk: run gd_monitor_update_interval on EGL as well
Date: Thu, 14 Jan 2021 14:48:49 +0100
Message-Id: <20210114134851.292767-1-pavlica.nikola@gmail.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=pavlica.nikola@gmail.com; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: r_qemu@t-online.de, philmd@redhat.com, kraxel@redhat.com,
 Nikola Pavlica <pavlica.nikola@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These patches regard the use-case of GPU-passthrough on QEMU for
 accelerated graphics.

Usually when people use GPU-passthrough on QEMU, they opt to have a
 physical seperate graphics card that gets passed through to QEMU
 using something called "PCIe passthrough". Since the display output
 is invisible to QEMU, the people who run these kinds of setups tend
 to view the display outputs by physically connecting a monitor to
 the "PCIe passthrough-ed" GPU in question.

However, on the Intel side of GPUs, there exists a technology that
 allows a user to pass through a "virtual GPU" using something called
 GVT-g.

Since virtual GPUs have no outputs, they rely soely on software trickery
 to get the image displayed on the host machine. In case of GVT-g it is
 done by DMA-ing the framebuffer to the GTK UIs display.

However, when using GTK outputs, there was a problem which caused the
 image to be updated at only 33Hz (or FPS). These issues were first
 discussed back in December 2019:
 https://lists.nongnu.org/archive/html/qemu-devel/2019-12/msg05514.html

There were a few other issues along the way, but those were fixed as well.

The focus of these patches is that when using GVT-g on QEMU, it must
 launch the GTK UI in OpenGL/EGL mode. This causes the code responsible
 for updating the refresh rate to never get executed. Which is why I added
 it to gtk-egl.c, to make sure updating the refresh rate works on EGL GTK
 UIs as well.

These patches were made in response to Volkers patches which dealt with
 cleaning up my previous code:
 https://www.mail-archive.com/qemu-devel@nongnu.org/msg766686.html
 and thus are meant to be merged after Volker's patches.

Hopefully, this commit message isn't too daunting ;)


