Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F2837ABBE
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 18:20:45 +0200 (CEST)
Received: from localhost ([::1]:59948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgV7k-0003y7-6u
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 12:20:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgV2n-0004rI-Nj
 for qemu-devel@nongnu.org; Tue, 11 May 2021 12:15:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lgV2m-0002k0-7g
 for qemu-devel@nongnu.org; Tue, 11 May 2021 12:15:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620749735;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=3hcys1IdgjpHCZ86JomXIcny8CdJWkAW+7MTHwPPstA=;
 b=eQT7snsntg3c6vnbwMvAlHsYMTEBvpFsJjJB3CCTWVZYwrpg4/N66iIucZeH5UcMhMqNrW
 4iNbo7Ke/qWZqHyZ74sX+KixtGrF46TfEi7JMHNBofS9af5Z0gU9Cog8XCnD9d0oVI99Is
 x0vUwI9LPRqzdQxnGucK8DeDaRZvhGk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-563-EF-NT0-dO_KoTvUmLAEOmA-1; Tue, 11 May 2021 12:15:23 -0400
X-MC-Unique: EF-NT0-dO_KoTvUmLAEOmA-1
Received: by mail-wm1-f70.google.com with SMTP id
 b128-20020a1c1b860000b029015b52bdb65aso65486wmb.5
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 09:15:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Qcj1CC5JWaO2Z4YsdYDkjWm4HBh4cmgv6jL276eiDeU=;
 b=CLpdIT8qH2V6iJ+1q2byNJ8Y5KL8+ZhTQMrFS5O62weEBNtboVGzvTsq57Mxxdxf40
 NXS3TWPsMNMRjh/oS4tuxu+irGoLZM4oLZekLNRtwZBoBgyAsXejI9IccGmvFlpJJBZR
 GWTsziOvkuMDiGiajLI3AzCa/Kl0SfcrOFaYXOWZULkR10fQbk1FH/f2uzurfN7endJa
 nmAxhBXvMcjCVe9JeGA3iBhMs3Eg7SOFks8GfkjjWR2o85tSjoGZ78MLEJKgKW3yGqLe
 S73LSkUGacnLBA+X986i3HMqCy2IRUk64+fySe9vPyyjHohba5/46Iy7FT94kI+650s2
 1Mgg==
X-Gm-Message-State: AOAM533+MpwQtmAv0vBHfbybuP2g8NmHWSWPH8BW8xmZidKoBiVpdH4y
 72Vu1bhsZmsIl5EFMNBRKuVPQzg8cXoRTLTWIjqKUS/+BSAl2N561gpW+xQZvW525qOQRXPjMHg
 RyGWhX9jklqW99WiUHpc4zeWw+Tm9xz77gXrIOxX00OchnVlN3t4xLX9h6cS1uqFF
X-Received: by 2002:a5d:60cd:: with SMTP id x13mr37736870wrt.377.1620749721827; 
 Tue, 11 May 2021 09:15:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz5FFiRFSxbd9LLypY3HnXCPThUAQehwCyaGXz3770LcZ+t5HmE1d3gHv7tYnpLfpEf56dLsg==
X-Received: by 2002:a5d:60cd:: with SMTP id x13mr37736820wrt.377.1620749721489; 
 Tue, 11 May 2021 09:15:21 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id y14sm27644627wrs.64.2021.05.11.09.15.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 May 2021 09:15:21 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 0/2] pflash patches for 2021-05-11
Date: Tue, 11 May 2021 18:15:02 +0200
Message-Id: <20210511161504.3076204-1-philmd@redhat.com>
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following changes since commit f9a576a818044133f8564e0d243ebd97df0b3280=
:=0D
=0D
  Merge remote-tracking branch 'remotes/dgilbert-gitlab/tags/pull-virtiofs-=
20210506' into staging (2021-05-11 13:03:44 +0100)=0D
=0D
are available in the Git repository at:=0D
=0D
  https://github.com/philmd/qemu.git tags/pflash-20210511=0D
=0D
for you to fetch changes up to 27545c9df24f509c6d1c1f17478281a357125554:=0D
=0D
  hw/block/pflash_cfi02: Do not create aliases when not necessary (2021-05-=
11 18:11:02 +0200)=0D
=0D
----------------------------------------------------------------=0D
Parallel NOR Flash patches queue=0D
=0D
- Simplify memory layout when no pflash_cfi02 mapping requested=0D
----------------------------------------------------------------=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  hw/block/pflash_cfi02: Set romd mode in pflash_cfi02_realize()=0D
  hw/block/pflash_cfi02: Do not create aliases when not necessary=0D
=0D
 hw/block/pflash_cfi02.c | 10 +++++++---=0D
 1 file changed, 7 insertions(+), 3 deletions(-)=0D
=0D
--=20=0D
2.26.3=0D
=0D


