Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF6B4483EEA
	for <lists+qemu-devel@lfdr.de>; Tue,  4 Jan 2022 10:13:42 +0100 (CET)
Received: from localhost ([::1]:36596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n4fsy-00044m-PS
	for lists+qemu-devel@lfdr.de; Tue, 04 Jan 2022 04:13:41 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n4fr3-00021T-Ud; Tue, 04 Jan 2022 04:11:41 -0500
Received: from [2a00:1450:4864:20::435] (port=34697
 helo=mail-wr1-x435.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <carwynellis@gmail.com>)
 id 1n4fr2-0005oF-Fp; Tue, 04 Jan 2022 04:11:41 -0500
Received: by mail-wr1-x435.google.com with SMTP id s1so74880080wrg.1;
 Tue, 04 Jan 2022 01:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version:signed-off-by
 :content-transfer-encoding;
 bh=AlGmEmXK6aVR/ArAGpjkyUllywQuWQTDtESbSeG3LXQ=;
 b=DDCFYmbPvQoVolfcvcxx/QrBMyHtBjq5pcAxED5ldHP7Jyg7BKeoavHGpkBAMDduF2
 JH0dExDZorVB4HaArH4eYGyqt+aI1/e1W+vVQuMJGQg8hbgnpk3OcpqO1Fav7lyzwufW
 aeqNxph88r68SLtL8dUFmKOqcfA9yCaU4gk3yPlETQ4lUaEZHI1FoONFHO+BpJ//ifyV
 p84C6+alxPRl83ETjTXy5lEuERP8h+JVgJ5VLJ72N/dsumvK9Lmy6auw5bLpOVRBR97L
 L7UyyDNCCNZtArVNkjXPwKCzX6uqwU/sjs36PFYetdc/4S4ezwwUqTjBnEeZEJ4zLvPt
 NsEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :signed-off-by:content-transfer-encoding;
 bh=AlGmEmXK6aVR/ArAGpjkyUllywQuWQTDtESbSeG3LXQ=;
 b=uy5MrHyWd58zPs3GqqV0ejfoYCajJKN1SC5cGkS6QxrOsId/wqAnHBPYQm0xEE6ev6
 O9r+qI20px5/SQTvgGHomoH/UFWTh7/2tnzWPaRPadsyQtOrIjkLvT/kNLaFEq3r3kca
 HIY4EMiO3hDfgghW3JB9wMLwrN9fsWmv2SiUWNy+EA956VZvXWgNavhorfEYVXdu4+kn
 O6AhBZpHuUtcNJ6DdbEz1k1mSwnQI51tiEsTVgxCv69a/TYPt3MkKsuQ3BU2OiMukM3h
 q+c8crIj0sd/ctWxhCytvBV8KwJOus8XkUT3mexAQfnIbVmuGzz6AbyEEa6J4me6Mf+9
 TOvw==
X-Gm-Message-State: AOAM531b2gzhPFHvG18Y3eAghOvpmVEBK7APozLYwJo6SQkEd5+Qlfvj
 XaJOtu1+H2geU8RxQPG+pu1cGrj4TyM=
X-Google-Smtp-Source: ABdhPJynutccrizg0HV9u5k/pPlpg2ogWUS3YBIMktrMfSVx7AQfk5u23BMIJhvvComIAhTn8l+jPA==
X-Received: by 2002:a5d:488a:: with SMTP id g10mr28051554wrq.653.1641287498319; 
 Tue, 04 Jan 2022 01:11:38 -0800 (PST)
Received: from localhost.localdomain (201.11.75.194.dyn.plus.net.
 [194.75.11.201])
 by smtp.googlemail.com with ESMTPSA id c11sm43962844wmq.48.2022.01.04.01.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jan 2022 01:11:38 -0800 (PST)
From: Carwyn Ellis <carwynellis@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] hw/display/vmware_vga: supress debug output and fix
Date: Tue,  4 Jan 2022 09:11:33 +0000
Message-Id: <20220104091135.61226-1-carwynellis@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Signed-off-by: Carwyn Ellis <carwynellis@gmail.com>
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::435
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=carwynellis@gmail.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, Carwyn Ellis <carwynellis@gmail.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Two patches addressing the following in the vmware vga display code

  - only show debug output if DEBUG is explicitly enabled

  - do not discard display updates

    This prevents an issue that can cause garbled display output when
    a high number of screen updates are being requested.

    The FIFO queue size has been increased and all display update events
    are now processed ensuring correct display output even during
    periods of high activity.

Carwyn Ellis (2):
  hw/display/vmware_vga: only show debug output if DEBUG enabled
  hw/display/vmware_vga: do not discard screen updates

 hw/display/vmware_vga.c | 50 +++++++++++++++++++++++++++--------------
 1 file changed, 33 insertions(+), 17 deletions(-)

-- 
2.34.1


