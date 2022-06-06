Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B3A353E51E
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Jun 2022 16:44:20 +0200 (CEST)
Received: from localhost ([::1]:33874 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyDxr-0000Z8-Mx
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 10:44:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDr6-0001xU-1k
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41618)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1nyDqn-0000Vp-Oo
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 10:37:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1654526214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XKQ001hoZI6qaGoS4FyZOiSsbAJWoJf8cHlWtj+qR84=;
 b=Iagw7XjWEFW1Uv76O7msfa8FyNv23Tux2mOe7utJY8GOUuHVBLoodDD5PANJeTEdf930pT
 kWiMa4CUhJaQm6dxpNoy3kD7eYEN3XfeTb6FNvTy66dCQ4VNJscf4UsZnTIZUQDElu1h0w
 s8K0G11gakKDKODUzUUEC7aJWVycQ9U=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-NyzZ9m_kPtG3wkbnoWM2UA-1; Mon, 06 Jun 2022 10:36:52 -0400
X-MC-Unique: NyzZ9m_kPtG3wkbnoWM2UA-1
Received: by mail-wr1-f69.google.com with SMTP id
 p10-20020adfaa0a000000b0020c4829af5fso2879546wrd.16
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 07:36:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XKQ001hoZI6qaGoS4FyZOiSsbAJWoJf8cHlWtj+qR84=;
 b=IkKzN7NmaxkQUqW8NrqKZlRATHR9cD9ykrC4G0HmzdGTn/rdWxOmYDXwL6ThjDVi9R
 T3kLvqqz6/r0UYOpN+wKuXvMhG+jt8heZcdWI9Bbney7wiKr34pRYJfeHxmtwRXa2O19
 RY3zQGjtDKXPbUQ/rnVOXXLDbBARsLCMDO0mez7jXaC9BpfN6FLI+C1eiDLcBmUOjc+t
 3HMpYLMBqzzw7EGvQVNFWXweeQSlkG2VdLMyqwqhYh2ZZK1NUt1aNY6hb97ZDx21rNaG
 h6FwBjbBsuu9L7Vg0NYtiCvl8s9TlafZtofkN/tKqN8Oyqo+zeqO8fPG7I7XZ7shiJ+J
 Y/aw==
X-Gm-Message-State: AOAM532vBmhFc9gd7x7Bp3Pek+s77p/BuhVQzocO7/mJ58nzSbDasf8s
 TSB7SE9WJgZIVnD7IpYgsjwDddSk4LkVRD4Wz68tPyOsHNGYVEJfcdXRjMaqpbnlBnSVTBqWD6C
 KPrwGkVqd9j6FfZ9dFbiko+aGjcPotoeLO+jQIDYka0WeZ4oITD6+ANdvEqf5zwY1sfQ=
X-Received: by 2002:a05:6000:1548:b0:217:6480:e65 with SMTP id
 8-20020a056000154800b0021764800e65mr8662297wry.381.1654526210714; 
 Mon, 06 Jun 2022 07:36:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwqR7XGZhUbw/QSrtqyV2bSZ0G1+I7DEJTgDg1/+Pw6E0uhM4q1mj+dPVPAuBr+B74a09DagA==
X-Received: by 2002:a05:6000:1548:b0:217:6480:e65 with SMTP id
 8-20020a056000154800b0021764800e65mr8662219wry.381.1654526209694; 
 Mon, 06 Jun 2022 07:36:49 -0700 (PDT)
Received: from goa-sendmail ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 bp11-20020a5d5a8b000000b0020c5253d926sm2055412wrb.114.2022.06.06.07.36.48
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 07:36:49 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 02/29] build: add a "make modules" target
Date: Mon,  6 Jun 2022 16:36:17 +0200
Message-Id: <20220606143644.1151112-3-pbonzini@redhat.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220606143644.1151112-1-pbonzini@redhat.com>
References: <20220606143644.1151112-1-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 meson.build | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meson.build b/meson.build
index bc6234c85e..9b3fd4e52b 100644
--- a/meson.build
+++ b/meson.build
@@ -3285,6 +3285,9 @@ foreach m : block_mods + softmmu_mods
                 install: true,
                 install_dir: qemu_moddir)
 endforeach
+if emulator_modules.length() > 0
+  alias_target('modules', emulator_modules)
+endif
 
 softmmu_ss.add(authz, blockdev, chardev, crypto, io, qmp)
 common_ss.add(qom, qemuutil)
-- 
2.36.1



