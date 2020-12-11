Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC002D7DD3
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 19:15:15 +0100 (CET)
Received: from localhost ([::1]:37134 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knmwk-0007CL-O7
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 13:15:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knm2c-0003vp-TJ
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:17:14 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:26724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1knm2a-0005N2-3R
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 12:17:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607707030;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=39qrz9Ir7/gHK1tpJKZVEclisJ/5yGBIw4QuQeZ6MLE=;
 b=FqNZWgRXiZiPxekTfKeDPbBitDgKhQrxx+XbQIzmFJino3qGDvSzRQhp9xN5qcWBNiBklZ
 aJR1IiX6dO7sH6218Ol5/Bl1OBU5ZYoQxd3daszoCxJLw8wq+NdGoi4g7tqDMKLBRytEYh
 DOruyLnWKkHj94Mxk2LnA5jnk5D3FUE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-GwXod_HPNJa5gs75Ewmy5Q-1; Fri, 11 Dec 2020 12:17:07 -0500
X-MC-Unique: GwXod_HPNJa5gs75Ewmy5Q-1
Received: by mail-ej1-f71.google.com with SMTP id y14so3015811ejf.11
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 09:17:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LPDQ0lWwvrl1dm9mnJP21PF/nMSInp17jc9rmOqHqnA=;
 b=ichlz4wk9LTDlF9Fcm6A24qK2J+RetLs8GgRLq6nKFAkZH1fk0l8RDVKv/ZPa6XGvv
 V7JiutQMT75L7tInj7ikiX3U6irUhYTkJFjwkK0UVsjUbUarOs/KjJuX9wMR8/noVe1f
 EZmBVQYZAcDmhmuOSA3DWbKmYzUbBgYPhE4qmlH86jf8TTpSCMQ3wvZiDysTLkEBrOK5
 CwCZ6HTsXurDm713udBDWkNegXa0q8Ob/acJD8VcX2CaVVGGDFvT/OU/foVBNZjPwWOn
 bSpa9K+2DdNED2nyAZf/wFWs7wkYHINMqAjkTIII2J8T7AeSPPSKjhvl7vE907KOFi4b
 7PvQ==
X-Gm-Message-State: AOAM5316X+2DJWw+gWqdSosGmFxKdTSHahaf/gASdBVzFegZYECyGnCo
 WYNMgZ+/SgeITe4JbEDezMFKez4a4J7DJmD0whzE85T/dVPQ2CDBPuU7cQWNNkr7jkUpQeTLc0p
 FE11/RHhKWcB3dCffT4bsamqVkxeWdrDCyqppVegukRkfs8SMwERcrZWt8FpxvEel
X-Received: by 2002:a05:6402:c1c:: with SMTP id
 co28mr12889183edb.287.1607707025838; 
 Fri, 11 Dec 2020 09:17:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwK246IGI5l6DebEBxzdzy/5JRtHdvCvLzjHJNLWvsEoCteahajaNvyPpP6KVpiOJG56qjGeQ==
X-Received: by 2002:a05:6402:c1c:: with SMTP id
 co28mr12889153edb.287.1607707025636; 
 Fri, 11 Dec 2020 09:17:05 -0800 (PST)
Received: from x1w.redhat.com (101.red-88-21-206.staticip.rima-tde.net.
 [88.21.206.101])
 by smtp.gmail.com with ESMTPSA id a12sm8065278edu.89.2020.12.11.09.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Dec 2020 09:17:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org, Cleber Rosa <crosa@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>
Subject: [RFC PATCH 0/2] gitlab-ci: Maintain a public runner,
 allow manual pipeline
Date: Fri, 11 Dec 2020 18:17:01 +0100
Message-Id: <20201211171703.537546-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 virt-ci-maint-team@redhat.com,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Yet another attempt to make GitLab-CI inclusive to the=0D
all users from the QEMU community.=0D
=0D
We allow manual pipeline for some users, letting default=0D
to all jobs started.=0D
=0D
Also I step in to maintain in my work time the public=0D
runner based on Fedora that we use for the X86 32-bit=0D
builds, because I don't want it to bitrot, as it is=0D
important for my daily work.=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  gitlab-ci: Step in to maintain the fedora-i386-cross runner=0D
  gitlab-ci: Introduce allow_skipping_job_template=0D
=0D
 .gitlab-ci.d/crossbuilds.yml | 19 +++++++++++++++++++=0D
 .gitlab-ci.yml               | 18 ++++++++++++++++++=0D
 2 files changed, 37 insertions(+)=0D
=0D
--=20=0D
2.26.2=0D
=0D


