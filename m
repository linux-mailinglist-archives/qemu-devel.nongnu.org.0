Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F1AA2FD41D
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jan 2021 16:37:52 +0100 (CET)
Received: from localhost ([::1]:36960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2FYN-0006C2-Iw
	for lists+qemu-devel@lfdr.de; Wed, 20 Jan 2021 10:37:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2FGW-0001an-Nn
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:19:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l2FGV-00082B-4X
 for qemu-devel@nongnu.org; Wed, 20 Jan 2021 10:19:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611155962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=qqPV3ttzb1mcHWSVUjAt2mKQ1r/w4aNFOwcOSl/rPic=;
 b=VQIRzQjq/OhY7dF4QTzb4iZI8h6Pf3rrIiRXy5yDktIJXBj7DSY+PeCDfkPhi9AB2y01q0
 yyqUCSipd/oT5kDbrsIBbCmDnNu2iDbCtis3zYjLlgIbJ7UWIVwQRSJYaK3+msCTrMF2L9
 P4QzSsXAWXxft+RyqhexJKzo4dd2vC4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-558-9IGhUVJLN2mwOWSYBnO8YQ-1; Wed, 20 Jan 2021 10:19:20 -0500
X-MC-Unique: 9IGhUVJLN2mwOWSYBnO8YQ-1
Received: by mail-ej1-f70.google.com with SMTP id d15so3324343ejc.21
 for <qemu-devel@nongnu.org>; Wed, 20 Jan 2021 07:19:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tn/d6csfhHAwDaPSONCHwcR5VkEVpkyR5C9poyc657E=;
 b=Dut4TiFGcYgtD1sIuJEQPFHoBMWDvi8W6ngmGcv4sjHoxnESVbmHlQB89ck9qDvPfm
 ui9mZN5AKsLfiUHD3IPWjCcKQou/rU8xMHXkcpkK+xPLztvrq+5t7XH37CQgOgrsF7cJ
 5p4f0mhf3CFLh7xW+RcnGSAeZk8QTe0kmgT60MmHTNKcjpUrWdXpeh+m9CIaLlmdUTf4
 0LtMG0n4xA5LgayWekSQ3CYEIurB8DEXE1sjcAN2WezURVyk84mHLgpQWwlR1GEQOA5q
 wJVVvQGdKGJegRuh8nEmPFxUCAs66GGfy/zUKqCrlLmAniM9EAbJ5xdB1DjFieA2vd8U
 a6jA==
X-Gm-Message-State: AOAM531Jg8tw6aT/VQYjSQUZCvd6L42ZJfKP4M4goyePjYcMZ9fllqcJ
 XGL3fOaOLNlXJRBE0yiTeOhjqZJq+JMLZAgEeQg5/LQSayW8wTpxe0dE/Rnwad0r2FTVnMesFMl
 4kz9GH9g47VYs0t7OrdDM++AbNSkI6tgDGy/bpXIoEmcf1B1YAfp5AtZ9kCC2lOaZ
X-Received: by 2002:a05:6402:4c1:: with SMTP id
 n1mr7713629edw.66.1611155958951; 
 Wed, 20 Jan 2021 07:19:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwtI/84VCCN7heBdoJ0cQnP+DsakEGY5tIeIXUusy0X/3Zf431ZFkc47QJxlaPC9LaeW8oehQ==
X-Received: by 2002:a05:6402:4c1:: with SMTP id
 n1mr7713614edw.66.1611155958780; 
 Wed, 20 Jan 2021 07:19:18 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id o13sm1288909edt.64.2021.01.20.07.19.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Jan 2021 07:19:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] configure: Do not build TCG or link with capstone if not
 necessary
Date: Wed, 20 Jan 2021 16:19:13 +0100
Message-Id: <20210120151916.1167448-1-philmd@redhat.com>
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
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.167,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We do not need TCG and capstone all the times. In some=0D
configuration we can leave them out.=0D
=0D
Last patch emit a warning when a user explicitly select an=0D
accelerator that the build with not use.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  configure: Do not build TCG if not necessary=0D
  configure: Do not build/check for capstone when emulation is disabled=0D
  configure: Emit warning when accelerator requested but not needed=0D
=0D
 configure | 37 ++++++++++++++++++++++++++++++++++++-=0D
 1 file changed, 36 insertions(+), 1 deletion(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


