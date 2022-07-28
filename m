Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDF6358406D
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 15:55:33 +0200 (CEST)
Received: from localhost ([::1]:52466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH3zB-0003dx-0h
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 09:55:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34684)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oH3fg-0002Ia-1r
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:35:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:21750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1oH3fe-0003ih-GN
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 09:35:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659015321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=DGCKPNxNg0OPjPtuGQEly4G54Fi+4ZFlzz8b1lXBj9s=;
 b=YHaPR6V4J7/Xl3ZnjFWlxLcUQXd09VMKhVj23B7T687vpF+jP5Agz7YJBtwmgnCeht05Z1
 hJha7Ac1KM7+2XEbSaYXvPGwFcFDNRKZhrrA49ZpprViBC2Uq719MTE5fZ6YZzQdhn5eIq
 +/OZJBJ1+N6xB8dkb4IRpWGuRWdGL4g=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-203-5UgT_m9XP8y38EXrrDqGZA-1; Thu, 28 Jul 2022 09:35:19 -0400
X-MC-Unique: 5UgT_m9XP8y38EXrrDqGZA-1
Received: by mail-qt1-f200.google.com with SMTP id
 a18-20020a05622a02d200b0031ed7ae9abeso1017806qtx.8
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 06:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DGCKPNxNg0OPjPtuGQEly4G54Fi+4ZFlzz8b1lXBj9s=;
 b=MwJgD3Vw/xaBL14ia5Quq38eXYtVUOY0c5V7puKO4jNFFEtKbYpZNWgHJUXWn+Ep12
 UNsmQFFfWnsUDViRVsOkuUHNCwgXsdEIPgzFFpnpMY1GO/WUJ6kIaerWmCc3o5iwjXp6
 lkQPdvTXAtJ/EVNlQyNHhuMeKnF0h0KDTQC8ehXCFbzte/KM8UnX6lKtrzYkrRoRwTki
 pOGyM1zPH6B+9ZzSqEn3r+hWfw9Ujh5zFpBz7iDQ6BdaeRF8g289PJZPdRIvvyFt23vL
 1Xp57gFM3CLjK2hYaKObSphXoo7dFMIPX8E0BXHk8AwDIc0YGVW+RHGg3Awe4aDzPw91
 bpDA==
X-Gm-Message-State: AJIora8B8ZYHyitNx6O/pQPvqP8NvqnOmXlNgdOrjds8szaJbZxMXibv
 8seg7ltaBMy4ynrxIB0AuHSdhCqeZ4Uu+7Z1oKBhV8mTbCYA2SCn1CGVROUC6YxdLyyNGpRZdX7
 bh0TQQBedPPWk+kDOHI5Yb8jwHa/e7aMl0uYkDMuFWQ4wGWqZ6nYg0cRohLqLsp2l
X-Received: by 2002:a37:bec4:0:b0:6b5:ee15:3d13 with SMTP id
 o187-20020a37bec4000000b006b5ee153d13mr19777560qkf.53.1659015319036; 
 Thu, 28 Jul 2022 06:35:19 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sSHN0rjNe/btzF87Ftm2Av64M+s1+v6yJDTTtjhJ4AjO9pSqpxykXOivD8u7nxZYXcOyIrcQ==
X-Received: by 2002:a37:bec4:0:b0:6b5:ee15:3d13 with SMTP id
 o187-20020a37bec4000000b006b5ee153d13mr19777537qkf.53.1659015318770; 
 Thu, 28 Jul 2022 06:35:18 -0700 (PDT)
Received: from localhost.localdomain
 (bras-base-aurron9127w-grc-35-70-27-3-10.dsl.bell.ca. [70.27.3.10])
 by smtp.gmail.com with ESMTPSA id
 x10-20020a05620a448a00b006b618e006ffsm553876qkp.2.2022.07.28.06.35.17
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 28 Jul 2022 06:35:18 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>, peterx@redhat.com,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>
Subject: [PATCH v3 0/2] migration-test: Allow test to run without uffd
Date: Thu, 28 Jul 2022 09:35:14 -0400
Message-Id: <20220728133516.92061-1-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

v2:
- Fix warning in patch 1 [Thomas]
- Collected R-b for Daniel

Compare to v1, this added a new patch as reported by Thomas to (hopefully)
allow auto-converge test to pass on some MacOS testbeds.

Please review, thanks.

Peter Xu (2):
  migration-test: Use migrate_ensure_converge() for auto-converge
  migration-test: Allow test to run without uffd

 tests/qtest/migration-test.c | 67 +++++++++++++++---------------------
 1 file changed, 27 insertions(+), 40 deletions(-)

-- 
2.32.0


