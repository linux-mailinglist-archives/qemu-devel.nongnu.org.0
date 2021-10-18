Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFF06431371
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 11:26:22 +0200 (CEST)
Received: from localhost ([::1]:51830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcOuT-0001iF-U7
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 05:26:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46770)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcOsF-0000ME-AN
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:24:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mcOsD-00025H-M5
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:24:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634549040;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=ZXgLbEPAyCknNYdOeoBxYPe181WzNKWWUGAjKVI8hYQ=;
 b=MuwfTo/g3gandre9Y2N3meut3ger4mMDz6rAZ4KRfkS3nbP+2RSPBXzD87R+qFUC2Lnyud
 dXFlNEn4t1w3TdsgKP0vfVh+n8xwRC8Yi6wumAkw2DrO7r97mTS/mAhCM3CfuXvnJhx/jR
 EbM4NE82P56MDVT4JfAsNd4jyqWxq/o=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-175-rcv8wtbcPDaqZ6oS6YTEaQ-1; Mon, 18 Oct 2021 05:23:58 -0400
X-MC-Unique: rcv8wtbcPDaqZ6oS6YTEaQ-1
Received: by mail-wr1-f72.google.com with SMTP id
 s18-20020adfbc12000000b00160b2d4d5ebso8660604wrg.7
 for <qemu-devel@nongnu.org>; Mon, 18 Oct 2021 02:23:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=59GNaC9TGWbOSjjJFvuSc+QLQ3aUh9g6SagW2//H3fU=;
 b=YsUSLoEi8sIf/k9t9kXGv68zaAA89GFUOzFQnWj7dggHdpMbP5Fq+FKbgxaqrYM+hN
 no4b/sHrRy0diA+1v2I2kGmmKqm6YWrCRnoeGZetzy1r3vaaAKors/oM39a9X473sJpa
 vRrzeIbLt0ghzSjOK1zuFcO30sBGMHnx+9n1m966p9uYCG/ObJPnn9Sbd1s/Mxd/I9PN
 8/TdTQGr43y0b1G1r6r+BnwsQH0dLYO0G77lD3KTqdP29DFOaaZ1J3Qi6e3SZjCf9Jh0
 wuMmaVHdBRwvzFHpd3yUntbByn+vGeuN1rQYQT2WupsFqU43qnRQG4N0yYxQQUEnQMS3
 ATbQ==
X-Gm-Message-State: AOAM5321/uG346MwpFxMWnH+9XGIzPG8gMqKZah2kLPbFLUmHmUjjSXV
 kWOL6B2wtPYqzJ969zrNYQ2a/pP83eO0YFpQwngoE67zQS48W2ToXIKI4OcjTfKCdUIddn3mVbw
 5Izr5BhOgj4jQjriYKn7JX9c8Zwu4anUmGwb9derGH44lxj17HP1LgHxmU+wriSPe
X-Received: by 2002:adf:e382:: with SMTP id e2mr23996328wrm.90.1634549035874; 
 Mon, 18 Oct 2021 02:23:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKQPeiQh1hxT8fJTxy9vJU0dFZcLwX6BS5w2+v/pxWv9otpoKUIm9sEVy3mekRSRvO78SxAA==
X-Received: by 2002:adf:e382:: with SMTP id e2mr23996294wrm.90.1634549035583; 
 Mon, 18 Oct 2021 02:23:55 -0700 (PDT)
Received: from x1w.. (213.red-81-36-146.dynamicip.rima-tde.net.
 [81.36.146.213])
 by smtp.gmail.com with ESMTPSA id c132sm18150903wma.22.2021.10.18.02.23.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Oct 2021 02:23:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/2] roms/edk2: Avoid cloning unused cmocka submodule
Date: Mon, 18 Oct 2021 11:23:52 +0200
Message-Id: <20211018092354.2637731-1-philmd@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cmocka website SSL certificate expired, making CI pipelines=0D
fail [*]. However EDK2 images built to test QEMU don't need=0D
cmocka. Avoid cloning it.=0D
=0D
[*] https://gitlab.com/rth7680/qemu/-/jobs/1685387520=0D
fatal: unable to access 'https://git.cryptomilk.org/projects/cmocka.git/': =
server certificate verification failed. CAfile: /etc/ssl/certs/ca-certifica=
tes.crt CRLfile: none=0D
fatal: clone of 'https://git.cryptomilk.org/projects/cmocka.git' into submo=
dule path 'UnitTestFrameworkPkg/Library/CmockaLib/cmocka' failed=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  roms/edk2: Only init brotli submodule to build BaseTools=0D
  roms/edk2: Only initialize required submodules=0D
=0D
 .gitlab-ci.d/edk2.yml | 4 ++++=0D
 roms/Makefile         | 3 ++-=0D
 roms/Makefile.edk2    | 7 ++++++-=0D
 scripts/make-release  | 7 ++++++-=0D
 4 files changed, 18 insertions(+), 3 deletions(-)=0D
=0D
--=20=0D
2.31.1=0D
=0D


