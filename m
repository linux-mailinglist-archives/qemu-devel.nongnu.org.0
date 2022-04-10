Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 127CD4FAFC9
	for <lists+qemu-devel@lfdr.de>; Sun, 10 Apr 2022 21:35:54 +0200 (CEST)
Received: from localhost ([::1]:51918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nddLl-00075U-6z
	for lists+qemu-devel@lfdr.de; Sun, 10 Apr 2022 15:35:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1nddIZ-0004ya-Fu; Sun, 10 Apr 2022 15:32:35 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1nddIY-00030R-17; Sun, 10 Apr 2022 15:32:35 -0400
Received: by mail-wr1-x435.google.com with SMTP id c7so20247035wrd.0;
 Sun, 10 Apr 2022 12:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version:signed-off-by
 :content-transfer-encoding;
 bh=Lo7RoFpUbsV5m9Nog7tGy2Wb8iQ+/dQYwOvm/2B6FcE=;
 b=S557dbyW4lHAUowWh+wZRWe3cDnFMChx2JH4W69K3S6oDFEDXnOLt+faROOvY2ivuu
 raM9GHuXsK4HyQIECWX0PEDBKKkyU2rcp2wugMpani3VmT7tg86edPShCRxLUta4qMxd
 X2MwzjHtp8yIK7fIp4UkO54jyx1XHl9123knmzXnYMDdNxDIiBfXU0jse7BpPmyzSyD7
 h6kOgexHRp5QYKDcplwrGG7XDgYdKPf4uTG2QMkNpK5eNbxeD6VaCjiraCroovlihYyH
 TPnz1ZIOPgI7aJt+RO/zv6yiv09NxYgq5M8WxMTxrNjkNkpm2XR6TR2/bqqeNkhyx/ej
 VvvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :signed-off-by:content-transfer-encoding;
 bh=Lo7RoFpUbsV5m9Nog7tGy2Wb8iQ+/dQYwOvm/2B6FcE=;
 b=XNFYCBxhYXNvJMxu0hP5g6lceq/irjhygF5RN1VpmKQdLCfZeAh0CL+C/Q68ieyZNc
 8AUBGxdw2jJaXJ/2KTQoPNrSIu5PTxM4oEq6593dDzFDCzGiA7YJanH4KSxQzdVLPDpz
 Cc2F6TP40XFY6kFA9Ox8PPM3LQ4n7idmk08+j8I1q3ChqXo2ge0x5mg5SSbKy1s3yvES
 gbCa9GWR+KY1Iimb6IXWUZ/MGjjUlNJI7rm5idTDqxMJ8O4EGSGdC4NB/o8rA7by1kWZ
 KAxQDloZ1rX/KsAQzHc1YDDeXJwwE1lh6ngBnT6TZkzpUepXVqMlITgP80lZoiXZh/5f
 Rh2w==
X-Gm-Message-State: AOAM530xz1EXPiv46wEz06LpWmiCwZFoHWX8JDs6ZEyzYPuWqyk7qhhU
 kMjUkGO9Ls29sDd+O8s7zF3L6NF+aXs=
X-Google-Smtp-Source: ABdhPJwn6SbJheyrIhaEzs+bfSOE7S9MDY3bJuAiSM4xRg84EJIAUF4A/T7JlEVPCyqhAsALl6LdXg==
X-Received: by 2002:a05:6000:168e:b0:204:f92:53e9 with SMTP id
 y14-20020a056000168e00b002040f9253e9mr22941984wrd.349.1649619151846; 
 Sun, 10 Apr 2022 12:32:31 -0700 (PDT)
Received: from localhost.localdomain (201.11.75.194.dyn.plus.net.
 [194.75.11.201]) by smtp.googlemail.com with ESMTPSA id
 t15-20020adfeb8f000000b002060d26c211sm19179596wrn.114.2022.04.10.12.32.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Apr 2022 12:32:31 -0700 (PDT)
From: Carwyn Ellis <carwynellis@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/1] ui/cocoa: show/hide menu in fullscreen on mouse
Date: Sun, 10 Apr 2022 20:32:19 +0100
Message-Id: <20220410193220.99168-1-carwynellis@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=carwynellis@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: qemu-trivial@nongnu.org, peter.maydell@linaro.org,
 Carwyn Ellis <carwynellis@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Minor change to make fullscreen mode in the Cocoa UI a little more
convenient.

The menu bar is now made visible when the mouse is released (ungrabbed)
making it accessible without having to leave fullscreen mode. Grabbing
the mouse hides the menu.

Incorporates changes in response to feedback from Akihiko Odaki.

Carwyn Ellis (1):
  ui/cocoa: show/hide menu in fullscreen on mouse ungrab/grab

 ui/cocoa.m | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

-- 
2.35.1


