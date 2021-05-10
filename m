Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F408B379820
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 22:09:04 +0200 (CEST)
Received: from localhost ([::1]:50336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgCDA-0002Nf-3H
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 16:09:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgCCG-00012t-NQ
 for qemu-devel@nongnu.org; Mon, 10 May 2021 16:08:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgCCE-00060K-7l
 for qemu-devel@nongnu.org; Mon, 10 May 2021 16:08:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620677284;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WPB8O0AGwVFsco1VHBpjwbNUXRBhhSil1k+Q8Nm/o2U=;
 b=TEUjO+d+EmZQpM7i+C4kpIW7RCBdkbEyZ2XoKXLacwEhluDpt21mYg6mWSuCv3e1FK9BE3
 +ByQe2xXS2v0AmJqhj/WbgR0Oqf6jnT9D1gIjNjmOUP7UcC9kK6BB1prxp/PfpLaDLcxg8
 8ctzztb5en0Rf2tSNgEcH92tO6fob+o=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-GzKCI8GLNAqlBBhn8F3PZA-1; Mon, 10 May 2021 16:08:02 -0400
X-MC-Unique: GzKCI8GLNAqlBBhn8F3PZA-1
Received: by mail-ed1-f69.google.com with SMTP id
 z12-20020aa7d40c0000b0290388179cc8bfso9592325edq.21
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 13:08:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=47EqsuOBfHDcA/37gKpWU22c19DuvodmXPC5UxKB3NU=;
 b=FCSw/mteJlYX9P5hx25WDL7kooe1HEaLrj1zE3cvKviH7ulHn1P/93bFqaSID6sUvP
 pDWy8PIWXKoeTBh15sxxu0Ej/CqXkjlgZAZSPaGT7IRJayYTlP/p/MNNmNLWK4Gn2JI7
 UBP4suuw+gLvxcsX1W//Synl5Kk/jaxDFZrtGaPPnhxcCuMERezjUzSEXvDV4SWZAxWW
 ae74LNJrRGlqmKAtCoAelNCnPKlj5HEPEPsHejMsxzpZBFvSUf4RIPee/33PRH5rNItV
 Ir8nWi0iWH0fPZXseihwd3CTi0RoAcNilUIP4hQGxrz6p4DFiMzfZ18E8mw53tWsOBpy
 ncmw==
X-Gm-Message-State: AOAM5327FTXPWUHmmDe4FNZMZ+luTlGEWsKK/Ik8W0DsToMkVlbUxm4n
 HvPSy1rWXQa2rco9Asl8bQcKzUVEitbmvEX+HOpayaPqOrX6Z8nkz0nreaG++bMav6ljU6df5aC
 xnRTpdN/2QN88/ofm+JBqg26HhFzFPVt5OweeDViMXiS0lV7nLmJyfzUBx8/mYElF
X-Received: by 2002:a17:906:3e89:: with SMTP id
 a9mr26873247ejj.405.1620677280517; 
 Mon, 10 May 2021 13:08:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxu0A5QtShcdk2hDbqiDp7j1vK8Xj1pRqdu5FTaLduaJNCnD0X+7O/j/5DUfF3ZJV5twj53xA==
X-Received: by 2002:a17:906:3e89:: with SMTP id
 a9mr26873214ejj.405.1620677280210; 
 Mon, 10 May 2021 13:08:00 -0700 (PDT)
Received: from x1w.redhat.com (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id zh16sm9964249ejb.10.2021.05.10.13.07.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 May 2021 13:07:59 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/2] virtio-blk: Convert QEMUBH callback to "bitops.h" API
Date: Mon, 10 May 2021 22:07:56 +0200
Message-Id: <20210510200758.2623154-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Max Reitz <mreitz@redhat.com>, Chai Wen <chaiwen@baidu.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series follow a suggestion from Stefan to use the bitops=0D
API in virtio-blk:=0D
https://www.mail-archive.com/qemu-devel@nongnu.org/msg805139.html=0D
=0D
Since v2:=0D
- clear bitmap to avoid spurious interrupts! (Stefan)=0D
- use 'further' in find_next docstring (Eric)=0D
- added Richard R-b tag=0D
=0D
Since v1:=0D
- improved "bitops.h" docstring=0D
- addressed Richard's review comments=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  bitops.h: Improve find_xxx_bit() documentation=0D
  virtio-blk: Convert QEMUBH callback to "bitops.h" API=0D
=0D
 include/qemu/bitops.h           | 15 ++++++++++++---=0D
 hw/block/dataplane/virtio-blk.c | 20 +++++---------------=0D
 2 files changed, 17 insertions(+), 18 deletions(-)=0D
=0D
--=20=0D
2.26.3=0D
=0D


