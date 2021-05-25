Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3062638FF85
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 12:49:52 +0200 (CEST)
Received: from localhost ([::1]:36384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llUdD-00024C-78
	for lists+qemu-devel@lfdr.de; Tue, 25 May 2021 06:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llUac-0008UN-Cg
 for qemu-devel@nongnu.org; Tue, 25 May 2021 06:47:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43059)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llUaX-00056M-Rb
 for qemu-devel@nongnu.org; Tue, 25 May 2021 06:47:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621939620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=mMo7mrr/SVdiWhOjdyz2ZnKUzl/Y9nrhI6+P8HXEHVA=;
 b=OrZ0smGX76DQJHkocRnSbajWkcJ7HrAUF9O0863sicSKGF75JCZIib8hg+JzV5Agm9u9BN
 vFmJXEDldjuV4jzms+YZk19Qc4vobj1vjrnRurx57aXRhPDkDwq2XL0r4d9iLylZUccZMa
 nCBYGpyxclWTli6ukaMAm1vCIrhVBeA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-536-1Ov8zNgJOw6043A5SeZ_Ow-1; Tue, 25 May 2021 06:46:57 -0400
X-MC-Unique: 1Ov8zNgJOw6043A5SeZ_Ow-1
Received: by mail-wr1-f72.google.com with SMTP id
 j33-20020adf91240000b029010e4009d2ffso14413206wrj.0
 for <qemu-devel@nongnu.org>; Tue, 25 May 2021 03:46:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aTmmMT/It3egObdsFk0Lmt02XtMHOWKQLW3d5ca8+70=;
 b=lQzsN28ZuJPT1cr7/ZE7M3Xi2CT+vIcU6UwgXkI0j8Bf+sMBp4RODnzuI5URyD1JDA
 tuY4Rg6nxyk7tXTd1tvE3FsDfJkTRVlwmuAYH/Ulhf6xTa301DGc2Bl3u4ivv0H+5AZP
 SvuZCWTDlMfKogEO/QxH2yD3WThTNJgA++kHuopoX3R4T7ApOiPVHRmvNSKmfMG+5nyu
 YZ2g5UNPJp8HhjA8GRVVfNL8w3vgdQ42IS+5ZnzUcfQd0tQL+N9w5ZOUumaD9iDii9Sq
 IcgpxLWFcr0sqsERJy81RWP1/bKAlOubDSyjE/YTwU971cCLCAL/6IELT8q39xoavlDd
 IiFA==
X-Gm-Message-State: AOAM532kOsgZ69woYIPpmLrLorN5SRayV0NCW1K0S3p+cbdKqphuTYNP
 9wpvN/5kZro5k8n+uzXAOXACQ31rrFh649/N7S2/7Ts9giCNHBT8hiDoPzGGLaLp40G9cuDmO8W
 BDPvwYhlu2L/H7JNBfdwHdwKkjilHBJIR4/wJg3My9xDfuhxfmJZJ9NuBEn2sggOR
X-Received: by 2002:a5d:4b04:: with SMTP id v4mr26936368wrq.92.1621939615820; 
 Tue, 25 May 2021 03:46:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzk+4RwGGjp5g5ms038ZrN1ByNCJAq0imaevUQ/VRHFqCzyaH2CDUzJpICPa+7lwEXr5inS5A==
X-Received: by 2002:a5d:4b04:: with SMTP id v4mr26936350wrq.92.1621939615532; 
 Tue, 25 May 2021 03:46:55 -0700 (PDT)
Received: from localhost.localdomain (31.red-83-51-215.dynamicip.rima-tde.net.
 [83.51.215.31])
 by smtp.gmail.com with ESMTPSA id j10sm15583793wrt.32.2021.05.25.03.46.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 03:46:55 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] meson: Minor improvements
Date: Tue, 25 May 2021 12:46:45 +0200
Message-Id: <20210525104648.4060904-1-philmd@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Trivial meson improvements, mostly no logical changes,=0D
improving summary display.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  meson: Only build virtfs-proxy-helper if all requisites are found=0D
  meson: List if X11 dependency is detected=0D
  meson: List modules built in summary=0D
=0D
 meson.build | 16 ++++++++++++++--=0D
 1 file changed, 14 insertions(+), 2 deletions(-)=0D
=0D
--=20=0D
2.26.3=0D
=0D


