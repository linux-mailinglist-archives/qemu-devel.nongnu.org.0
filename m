Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA123D5C95
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 17:06:24 +0200 (CEST)
Received: from localhost ([::1]:41452 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m82BT-0002Qs-7u
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 11:06:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51564)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m829m-0000S2-R0
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:04:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1m829k-0003LF-Dp
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 11:04:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627311875;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=15MrE2C+xAapbPift0uulplgPyqP1fI7r+PHLoraHFc=;
 b=BoNqKBJUOioDJW15A4Oi2w3yZwGwMoKMufuZsGgPJz4ttx7711krZKz82cCy5MmcodtcfC
 94GamM3g3Ucwv5TpQcwjE2P+D0XYlBGDb/IoFnZMPSF3nfxlcIqInbM38R66Xjp88VExHK
 BP7Al8Sejby26/45IV1Amgn3A6Z79cU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-567-v6JmBde2MXSA5WT6GSBGbQ-1; Mon, 26 Jul 2021 11:04:32 -0400
X-MC-Unique: v6JmBde2MXSA5WT6GSBGbQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 l12-20020a5d6d8c0000b029011a3b249b10so4830733wrs.3
 for <qemu-devel@nongnu.org>; Mon, 26 Jul 2021 08:04:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wVEg+H/xu5IQNG5B1Ll83RFCLCwctiAemV5SkOJfvb0=;
 b=WtuDmXOgJuSyOjVVEAifpJcpSTZM/UTcNuEns56/aYzrhpj85LxHBNzgSq8vofgEWb
 0iRwdmJ/jrrCify9v+hqYfv2uwq9n/K7TRHR6JmtVQVxdyypaGf+7O7WYJUUb3Iu3gXB
 RBsABYicIGRrpdU2tg2+ufETjD5N8pkeesvDEm3tfx6VzsRQr1B93gnHaSsbtHrMQMEr
 bC5rmyd/FqQya6h6Bzh5bDhmyAr4aEGt+1bOnxtayEYtok97SAlxOgp21bllp7lUA1OJ
 4Grb264C5EOiWfe9EGygO9BEeTWu35NZwnoVlv2XXLaTJFiqH9MPbEJOjGK8d58UUVXe
 LpDg==
X-Gm-Message-State: AOAM533/hCGGOst2E0rE7fG0XMzOLObhM6WDsOEKJcm4OqfpqXzwz38g
 kLZXMoyeyVbF9SCQflEmQzgcXV7VJGzyJwTB2H81TyPpu9cjDRf46vGkTTIxUIk5hSonv2+2FYY
 qzGSbyK7kuWDFcBm6qL1XAq6+wqz0kHRCNGwv7D1G6RHLzUsOPJXv0NC+rlTrTJ0F
X-Received: by 2002:adf:a40f:: with SMTP id d15mr6472714wra.70.1627311871253; 
 Mon, 26 Jul 2021 08:04:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwcLjWzbDbDbeStYkvUnzEMPKiriJMYxawDHfmAedoukCBZzVK3e+DcEHi1PxWWjbrUV+cGQA==
X-Received: by 2002:adf:a40f:: with SMTP id d15mr6472680wra.70.1627311870962; 
 Mon, 26 Jul 2021 08:04:30 -0700 (PDT)
Received: from x1w.. (122.red-83-42-66.dynamicip.rima-tde.net. [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id
 m14sm52772wrs.56.2021.07.26.08.04.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 08:04:30 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.1 v4 0/4] gitlab-ci: Document custom CI/CD variables,
 fix 'when:' conditions
Date: Mon, 26 Jul 2021 17:04:25 +0200
Message-Id: <20210726150429.1216251-1-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Bin Meng <bmeng.cn@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Since v3:=0D
- Unfortunately patch 4 v2 got merged as 0a9487d80af so=0D
  rebase & reword.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  docs: Document GitLab custom CI/CD variables=0D
  gitlab-ci: Fix 'when:' condition in acceptance_test_job_template=0D
  gitlab-ci: Fix 'when:' condition in EDK2 jobs=0D
  gitlab-ci: Fix 'when:' condition in OpenSBI jobs=0D
=0D
 docs/devel/ci.rst                   | 40 +++++++++++++++++++++++++++++=0D
 .gitlab-ci.d/buildtest-template.yml |  4 +--=0D
 .gitlab-ci.d/edk2.yml               |  6 ++---=0D
 .gitlab-ci.d/opensbi.yml            |  8 +++---=0D
 .gitlab-ci.yml                      | 19 ++------------=0D
 5 files changed, 51 insertions(+), 26 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


