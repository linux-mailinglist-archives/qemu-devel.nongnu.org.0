Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8712294106
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Oct 2020 19:03:10 +0200 (CEST)
Received: from localhost ([::1]:43296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUv2U-0000Ny-0G
	for lists+qemu-devel@lfdr.de; Tue, 20 Oct 2020 13:03:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56382)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ameynarkhede03@gmail.com>)
 id 1kUv0V-0007mc-7V
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 13:01:08 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:34510)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ameynarkhede03@gmail.com>)
 id 1kUv0T-0004rH-FA
 for qemu-devel@nongnu.org; Tue, 20 Oct 2020 13:01:06 -0400
Received: by mail-pl1-x631.google.com with SMTP id t18so1347160plo.1
 for <qemu-devel@nongnu.org>; Tue, 20 Oct 2020 10:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SLjiq3pW5LVJISD8gSWpF8UZ/0csQIwTmjFHfpB8KGQ=;
 b=dDcwSXCOzydk78Lztu+93aKWlVV++2x4fn6ADurjE0nmYUMY3OTsi8b/HGLbIvHHmR
 wGE+3kYadp+qsRdmbCX2qV8gLCpVlHGHoXbOrt9JzPOXo/rqoTZbwIjlKsgNASxlBTHb
 tl/YfgqmLAVupq0bf6Vk4CNoyFAsaDl5e57P6gB5WdTagLSb1RT6rbsMhXQcz0jWjtLZ
 jQn94KeXoj+UuTv2hgguVyoARgOULZ2pvnzwuYNBLdlqxRCJxv9uPShEUKKbFVtaW+zw
 4S4g87U3K8T0Ps3LLJrhtIf84mk5BLXDsbNwEbcGs/RDJqyFGrEdi366TLCyxptCVrat
 ab8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SLjiq3pW5LVJISD8gSWpF8UZ/0csQIwTmjFHfpB8KGQ=;
 b=jtLcpwsVdigawjNw7ACLjsdEQm6O70JwFCiVDiIlEMLtPYk8s2F+tQlpiyrdUX4VBK
 UDFgzh+weDSAluP+vYtku6/djC2Em2ziI6N3mxycoWHz8syIbyOt/xye6l57VGtO7ygr
 RESyT3/eW83mp7RQ3nz0nBWnYdHTeS5Kb5FiUvrXuzYUH6pZ48tIVxLMI5vNQpCDcNNi
 t5vjfOv/NBBj2DRMvx03wLBFqYBc9S67dg8JxL8sQdi1ifKElCjkiFTZkuEulxcUVf2J
 3IUcdJl6VlGHOuk+q9EKpVa+Fp9Njyds7V8YK7CAhFhCe6OxdIoHiB/l0TYLryC0uRRD
 P55g==
X-Gm-Message-State: AOAM53097cdy0pYvHtlYY/Vw3BxAbWPPMLVFZI1AJz9JQAFMt1wwjdGc
 6cMci7XzdyDrSHzy2/Ih2FPbRJ8rXbw=
X-Google-Smtp-Source: ABdhPJzXgH2W//CCXKxe46Ozb57JxmILIjseYynzoQ2X2SC2duR/Vzet5uVuIs+T4bHdhfZIYOLR9Q==
X-Received: by 2002:a17:90a:f0d7:: with SMTP id
 fa23mr3634676pjb.108.1603213263248; 
 Tue, 20 Oct 2020 10:01:03 -0700 (PDT)
Received: from localhost.localdomain ([103.248.31.132])
 by smtp.googlemail.com with ESMTPSA id x29sm2766161pfp.152.2020.10.20.10.01.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Oct 2020 10:01:02 -0700 (PDT)
From: Amey Narkhede <ameynarkhede03@gmail.com>
To: qemu-devel@nongnu.org,
	ameynarkhede03@gmail.com
Subject: [PATCH 0/2] KVM: Introduce ioeventfd read support
Date: Tue, 20 Oct 2020 22:30:54 +0530
Message-Id: <20201020170056.433528-1-ameynarkhede03@gmail.com>
X-Mailer: git-send-email 2.28.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=ameynarkhede03@gmail.com; helo=mail-pl1-x631.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -2
X-Spam_score: -0.3
X-Spam_bar: /
X-Spam_report: (-0.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The first patch updates linux headers to=0D
add ioeventfd read support while the=0D
second patch can be used to test the=0D
ioeventfd read feature with kvm-unit-test=0D
which reads from specified guest addres.=0D
Make sure the address provided in=0D
kvm_set_ioeventfd_read matches with address=0D
in x86/ioeventfd_read test in kvm-unit-tests.=0D
=0D
Amey Narkhede (2):=0D
  linux-headers: Add support for reads in ioeventfd=0D
  kvm: Add ioeventfd read test code=0D
=0D
 accel/kvm/kvm-all.c       | 55 +++++++++++++++++++++++++++++++++++++++=0D
 linux-headers/linux/kvm.h |  5 +++-=0D
 2 files changed, 59 insertions(+), 1 deletion(-)=0D
=0D
-- =0D
2.28.0=0D
=0D

