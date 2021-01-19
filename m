Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5689D2FC016
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jan 2021 20:36:05 +0100 (CET)
Received: from localhost ([::1]:38056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l1wnM-0001MG-9i
	for lists+qemu-devel@lfdr.de; Tue, 19 Jan 2021 14:36:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1w52-0003HS-9k
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:50:16 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:41226)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l1w4z-0003QE-Ho
 for qemu-devel@nongnu.org; Tue, 19 Jan 2021 13:50:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611082212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=jj6BvVykKCuRRl2P86+MINAP0nZy3ZPw2SUezVDLmlo=;
 b=HAmN8vfH6aOEYsVZMfPw5Z5gHzBNRzosZRWL8SH3UQGqdVS3hSuLJw4LajJNF6bowQUGU2
 eGWTjeyKyzJuX1Gh8YoSAjWsXLUYbmaxKckiCj6ZFQbG2s5LdvjqCBB3DERoYrK5COHS2j
 zUbppzYhbr1tWzo9HdKMFY69+ijkVjY=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-220-b1GgTgGwOrqtaRE6DcCylg-1; Tue, 19 Jan 2021 13:50:10 -0500
X-MC-Unique: b1GgTgGwOrqtaRE6DcCylg-1
Received: by mail-ed1-f69.google.com with SMTP id dg17so9612314edb.11
 for <qemu-devel@nongnu.org>; Tue, 19 Jan 2021 10:50:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hw6iBcufrKWidGAWBKYpvtXGq4w3+zKQvX84+gWeij4=;
 b=jnL7p3QoPTBeAv8+UCQOwBgZKjAB/Dj5vye8Kz/OrzwKK5+fL0VjtjXqVlfu3+FQq0
 3jKZM9Td88MpXnaxgjakaiDFOuEqIe4iltLfp6nY/3Dfl1vK4fYhyrXKz8vKN9keZinY
 Ca9jy7tzujy3BKlfxNC0Bhi8VM4m/+LwgSh44Q4YTuAL1PLXm+0QICuqkoJ7lkJjT8Rt
 ppLIFEN53w0jGnHeR8Sq3+db7ed+VG1bFTV/5Iie+t19tY9ijvIIUMoVoadp02Ydwz55
 a2RGQQclWVdGSNng6VXuicHD8qjs8ngGKqdT+zyFF5G5F4QzSV022JZ7G+raxizzVaRH
 Qipg==
X-Gm-Message-State: AOAM533nN4UDfAU6K5nGrqGSNQfP2UT96hhQp6ap269JX6qMxFNag1wC
 8h0XFGdU3WCBRUqvUk1Hz5mj/YFTLw3ion7xQSqraCTkYszoM6AQZpi8jRtSZhD/MhZqtuS3PSL
 BmZLHd2kJD1zTIRNs/HMZ+a1LDX/qfiHUwTZ8oQ1oPLBF+txAQBUxo9GvU0uYepLH
X-Received: by 2002:a17:907:c2a:: with SMTP id
 ga42mr3722575ejc.511.1611082208052; 
 Tue, 19 Jan 2021 10:50:08 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxwil6xpu/lc/Yy4fsPG1EB7GeAk7SM6FxoRKjfDvpA42EejadrmcUnrnj1o2Rnbb4ACjcKpw==
X-Received: by 2002:a17:907:c2a:: with SMTP id
 ga42mr3722560ejc.511.1611082207801; 
 Tue, 19 Jan 2021 10:50:07 -0800 (PST)
Received: from x1w.redhat.com (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id k22sm13445498edv.33.2021.01.19.10.50.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Jan 2021 10:50:07 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/9] meson: Clarify summary
Date: Tue, 19 Jan 2021 19:49:56 +0100
Message-Id: <20210119185005.880322-1-philmd@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.195,
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reorder stuffs in summary to quicker understand bug reports.=0D
=0D
Remove information from deselected features when not necessary.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (9):=0D
  meson: Summarize generic information first=0D
  meson: Summarize compilation information altogether=0D
  meson: Summarize host binaries altogether=0D
  meson: Summarize accelerators altogether=0D
  meson: Display if system emulation is selected in summary=0D
  meson: Restrict system-mode specific accelerators=0D
  meson: Do not configure audio if system-mode is not selected=0D
  meson: Display if user-mode emulation is selected in summary=0D
  meson: Summarize block layer information altogether=0D
=0D
 configure   |   6 +++=0D
 meson.build | 132 +++++++++++++++++++++++++++++-----------------------=0D
 2 files changed, 81 insertions(+), 57 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


