Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B582F7F20
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Jan 2021 16:12:45 +0100 (CET)
Received: from localhost ([::1]:37998 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l0QmK-0005T8-9S
	for lists+qemu-devel@lfdr.de; Fri, 15 Jan 2021 10:12:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0QjT-0003k2-B5
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:09:47 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l0QjP-0008Cq-GX
 for qemu-devel@nongnu.org; Fri, 15 Jan 2021 10:09:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610723382;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=AukCphfCHQghafPifZ/CNyVibf0mT1Yzki9beeMZcpo=;
 b=BWvCaHTD1AkJTV4LbWI5YADcoaCxsLUxll3DoQohDmzEhhWA1lNpoj9w4RAVM6eO3RETWw
 zzG5KeQ7AlH2NP/rn4If1ZNcUkRdkuZLOYQ1y6pQgDz/anh3qKfDePzffFGg0fMAv7PQt6
 da+Ti2DG8vgcTJ1I4r3nBOSQoI2LyDc=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-141-N5feEJj_O8-UjdC-xXeFug-1; Fri, 15 Jan 2021 10:09:40 -0500
X-MC-Unique: N5feEJj_O8-UjdC-xXeFug-1
Received: by mail-ej1-f69.google.com with SMTP id h18so336307ejx.17
 for <qemu-devel@nongnu.org>; Fri, 15 Jan 2021 07:09:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UbHqhdtsLRyRbZd6NlfVywWdiZBl2F/B7ipdivNiUq8=;
 b=jhenl0PcYxcKQpmpaDYh7Vxa6fiyBpucGx6GMqpe5SuYZm2EZwCt8u56rUlwlwLrjM
 J5Y4lf0Bw4Hk5QvLvrrQTEplN9tkRGBsVdy1lzLSaEDvySo+AnXJmtaMDVT1Cp4S2sq8
 9EjJUl6vHwQW915owfmcbvrwN8esNDNijbgptVwf1mw56NMGuwBY0HTAUNx153InsjR6
 sJ1lu8mourkraGH98EX0/sS+P3VA4R1HJlITW4C27nKRl1HHXFoQUVDZYOK38+hvILmn
 kH4vVXn1RXcnNerobx6xuuxxJGQdznef9xBEJkaRWmEneY73iu04Lc5PYplqbLmLbVGN
 citA==
X-Gm-Message-State: AOAM5323/rs404vo+fBiNbZvOqlxFqQ5MAVRQjPIupE/SWNbiZbzdOk0
 E5qBh1UBrngi5huYuA9+oUvFkjy5jWxSAHB6mPqBcYVKUU7Lu3m8i+pSJ08pbfbSSrzMfHgeMWx
 OTDkDRmIc5BVs7QfE/3TxkqIxMEWkC8ouS5SyAHmgmfpRI9GN8L/NLCYG/sBj75ga
X-Received: by 2002:a17:906:934c:: with SMTP id
 p12mr9418432ejw.361.1610723379049; 
 Fri, 15 Jan 2021 07:09:39 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGPaUZbPYmiJhpTOaJKc+rBuhmluIBvCnwtpf8M4lSscR70xHkdkS5nzn50P7pKp46e1f77Q==
X-Received: by 2002:a17:906:934c:: with SMTP id
 p12mr9418401ejw.361.1610723378793; 
 Fri, 15 Jan 2021 07:09:38 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id w11sm2136221edj.8.2021.01.15.07.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Jan 2021 07:09:38 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/4] tests/qtest: Fixes fuzz-tests
Date: Fri, 15 Jan 2021 16:09:32 +0100
Message-Id: <20210115150936.3333282-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@gmail.com>, Hannes Reinecke <hare@suse.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

tests/qtest/fuzz-test seems to have bitrotten.=0D
Fix it to make it useful.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (4):=0D
  tests/qtest: Remove TPM tests=0D
  tests/qtest: Make fuzz-test generic to all targets=0D
  tests/qtest: Only run fuzz-megasas-test if megasas device is available=0D
  tests/qtest: Only run fuzz-virtio-scsi when virtio-scsi is available=0D
=0D
 tests/qtest/fuzz-megasas-test.c     | 49 +++++++++++++++++++=0D
 tests/qtest/fuzz-test.c             | 76 -----------------------------=0D
 tests/qtest/fuzz-virtio-scsi-test.c | 75 ++++++++++++++++++++++++++++=0D
 MAINTAINERS                         |  2 +=0D
 tests/qtest/meson.build             | 12 ++---=0D
 5 files changed, 132 insertions(+), 82 deletions(-)=0D
 create mode 100644 tests/qtest/fuzz-megasas-test.c=0D
 create mode 100644 tests/qtest/fuzz-virtio-scsi-test.c=0D
=0D
--=20=0D
2.26.2=0D
=0D


