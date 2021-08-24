Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B006F3F6B53
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 23:48:06 +0200 (CEST)
Received: from localhost ([::1]:35088 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIeH7-0000M1-7P
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 17:48:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mIeFs-000877-Kg
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 17:46:48 -0400
Received: from mail-qv1-xf2b.google.com ([2607:f8b0:4864:20::f2b]:43899)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <programmingkidx@gmail.com>)
 id 1mIeFr-0005M0-9H
 for qemu-devel@nongnu.org; Tue, 24 Aug 2021 17:46:48 -0400
Received: by mail-qv1-xf2b.google.com with SMTP id z2so8021542qvl.10
 for <qemu-devel@nongnu.org>; Tue, 24 Aug 2021 14:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:content-transfer-encoding:mime-version:subject:message-id:date
 :to; bh=mWR5RtIzpd21jkGMl/p4xzmLGvpNv+APWzu/Em0Qp/0=;
 b=P8QR6TdAlbZV/x01YHW0mHaWe/beVyoIgRA336SwV2iueKomirbveI+xX4pSxgVg+l
 V69iDMCQPoEuCqdENRyzw7tRq1eUFV/LeQpYT+A9KzaG8+ThSv+O/HvC12HS7Szoi3P0
 lwat23miENV+qZo/vgqiZkc7cjhJAnFgkt47xKaPTk5gqOBJWia+YHsM9tEqm5kN7UVM
 Ni4ul//HLgsOKEXeKq41/WmXrT/U+hLZmMQQVz9jC4O62tmG+YzNKsTm73MNDo3OQDgR
 eg5lNoqcBlP9SAClP6j7bamkytnGm/PWHaBiewCVGQKjzr589Wyk71UB8yTsCS+O3o3G
 +T5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:content-transfer-encoding:mime-version
 :subject:message-id:date:to;
 bh=mWR5RtIzpd21jkGMl/p4xzmLGvpNv+APWzu/Em0Qp/0=;
 b=Lrcj3OlXMcOttAIdIUmB1cYss+IQxp/2Y8WvV6p2W0JifK/iJ2TMwnlxQQL7+O55jo
 kEoGTDRhLGTKlpsu0aPDYj/hGnLygJTjHg+iRGoycp44kDH8tFhIU7ts6yHP0NUk7kyd
 GHGiq9dXiehKiqPXh85e5rRn1cantyFjc7vv3EV8JWxo53S2bAmqdb7QzA+IssBY4F+n
 IhG6C6vh6yvWPpCaiY2hvML7jPYCaqPbtyw+p4GgTFPhSXg67Iw+VhkRFmixCqFyTgDq
 oGu7acdDJexU1i5VBpfBW277nJpSSDdqPj0YnCqnmFTH4hcMXVrPSeXmn3yOCkWi/tSQ
 pjEQ==
X-Gm-Message-State: AOAM533z5VMIDIGDs1vVMthOX6tfdtttR537VeCgVjbOKTZYbvMddb7n
 LPJVD0zQuM8HZBiCUoRGkHo=
X-Google-Smtp-Source: ABdhPJyl9j+D6dQmxgeJpVdq97xA8MpHQzj+QxXG2eazbiFf7CiO1/onHC9iTIfnQbHcTf7dB8CiTw==
X-Received: by 2002:ad4:4d90:: with SMTP id cv16mr13713512qvb.25.1629841605424; 
 Tue, 24 Aug 2021 14:46:45 -0700 (PDT)
Received: from [192.168.0.5] (d149-67-175-105.try.wideopenwest.com.
 [67.149.105.175])
 by smtp.gmail.com with ESMTPSA id c23sm11158896qkk.50.2021.08.24.14.46.44
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 24 Aug 2021 14:46:44 -0700 (PDT)
From: Programmingkid <programmingkidx@gmail.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: edid support for a Mac OS 10.8 guest  
Message-Id: <871C519B-A3B6-4DF2-840C-15FE09D69372@gmail.com>
Date: Tue, 24 Aug 2021 17:46:43 -0400
To: Gerd Hoffmann <kraxel@redhat.com>, QEMU devel list <qemu-devel@nongnu.org>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
Received-SPF: pass client-ip=2607:f8b0:4864:20::f2b;
 envelope-from=programmingkidx@gmail.com; helo=mail-qv1-xf2b.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi, I recently tried using the edid feature in QEMU for my Mac OS 10.8 =
guest like this: -device VGA,edid=3Don,xres=3D1280,yres=3D800. When the =
guest operating system loaded there were no additional options available =
in the Display settings. Would you know what is wrong?

Thank you.=

