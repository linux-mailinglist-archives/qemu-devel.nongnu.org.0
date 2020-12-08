Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3A82D3319
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 21:19:36 +0100 (CET)
Received: from localhost ([::1]:55372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmjSQ-00016z-Er
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 15:19:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kminG-0007QA-DA
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:37:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20277)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1kminB-0005mc-7v
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:37:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607456216;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Cmy8dzKxb5dkMOpVo6KH3hOeRH+OpUhJIkOvuYngI4A=;
 b=PegM5wh3nqf3oWmG3pB1wiZLOjarIMQG+q/QyXjb6xVfqiJhOzigwIUhopYS4WqBwhFydJ
 pEMN9xwpzWhZH4/0JlWP8+HFhsw15vCHpe5+QAbDudDVDLBdNB5nvisyZgJhwcqG7OABec
 9mGdtZtVCzWpe4hzqlKtbDwP2W00vtU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-58-1_0S7bQPNOGhrYLAMDOCOA-1; Tue, 08 Dec 2020 14:36:54 -0500
X-MC-Unique: 1_0S7bQPNOGhrYLAMDOCOA-1
Received: by mail-wr1-f72.google.com with SMTP id w8so3199416wrv.18
 for <qemu-devel@nongnu.org>; Tue, 08 Dec 2020 11:36:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Cmy8dzKxb5dkMOpVo6KH3hOeRH+OpUhJIkOvuYngI4A=;
 b=SGvJtjfU/XYI6sbUn3Oj+2WI3nKfwjFP1d1dioQjvaxPCq2cl/km7PuKIJqY3iis1O
 sidSJPKje6Mq19u3EDLeyHIaHnTHVRnzMTPx46QKgetfWOybL5yczHRiwURbE4ERSlbG
 uoE878xywNwpo7oHzDRGtkE76UHt9H4sdXfAV4kBx4iCRabUHv/pDBP4LsCam5erOs8K
 g1FDCkNtSu+zkooCLi9UncHGei481Whtwcmd4iUrQ7zydI/1a1xXKQMNJ4Yi948a2Q6X
 8KEbg4YeMzbBUcIEGwCLYIKhEnMElnUZc/EdLO6jP7ysdMvODZcSxnJ+jhZgRZ+a6US+
 v+Wg==
X-Gm-Message-State: AOAM5322mty126EFs9MEmKXLoGynFc9PRfu/81Qa5SMfWwSmmWOt+Qte
 s2Sj6ga1ell5CqpFSDH7HLybRxBUtkmtyhnZmJZYgTRuz4ccHBBx5EgckyhxzZ/A+X7MnMMnBhg
 bmNChxqiyr0UHnmjB0hxWTffEPL7QCoAtmN/mo0riJSXp/yB6j/EvFw33zU2z
X-Received: by 2002:a5d:4682:: with SMTP id u2mr23888382wrq.265.1607456213261; 
 Tue, 08 Dec 2020 11:36:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxhigiEXXGR438EtbFdiqP94sc/C96yswvvKn/+tbQUhJZJb94u17bREbNm3Z9qcKZd0fohA==
X-Received: by 2002:a5d:4682:: with SMTP id u2mr23888366wrq.265.1607456213099; 
 Tue, 08 Dec 2020 11:36:53 -0800 (PST)
Received: from redhat.com (bzq-79-176-44-197.red.bezeqint.net. [79.176.44.197])
 by smtp.gmail.com with ESMTPSA id v20sm5253740wml.34.2020.12.08.11.36.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 11:36:52 -0800 (PST)
Date: Tue, 8 Dec 2020 14:36:49 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 51/66] .gitlab-ci: add build-libvhost-user
Message-ID: <20201208193307.646726-52-mst@redhat.com>
References: <20201208193307.646726-1-mst@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201208193307.646726-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mst@redhat.com;
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-Id: <20201125100640.366523-9-marcandre.lureau@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 .gitlab-ci.yml | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index d0173e82b1..e517506c35 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -455,6 +455,17 @@ check-dco:
   variables:
     GIT_DEPTH: 1000
 
+build-libvhost-user:
+  stage: build
+  image: $CI_REGISTRY_IMAGE/qemu/fedora:latest
+  before_script:
+    - dnf install -y meson ninja-build
+  script:
+    - mkdir subprojects/libvhost-user/build
+    - cd subprojects/libvhost-user/build
+    - meson
+    - ninja
+
 pages:
   image: $CI_REGISTRY_IMAGE/qemu/ubuntu2004:latest
   stage: test
-- 
MST


