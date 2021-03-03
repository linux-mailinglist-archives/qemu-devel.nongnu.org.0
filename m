Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE08F32B7EA
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 14:08:01 +0100 (CET)
Received: from localhost ([::1]:38616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHREO-0004ST-Gw
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 08:08:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHRDK-0003kF-Oj
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 08:06:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37858)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lHRDH-0004u6-VP
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 08:06:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614776811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=iB6wAF7ro8yDEg0bBfnswVSFq3oQor08TIq1ffEMKGk=;
 b=hn6zrhsyqWKZMUmWHsWuIogSRqZkx7hjd/IhpsOwyhIiqBMQ7SzbaMissSkmub8dUmr9St
 7oBneY0Nx9Ef9RDRClPK4nlrTwFovArIhUKJEd+6ic53FM2SxqtaGDkiCAr/e7IYdM9mfC
 /LbLSZmh/MPhk5ITDHne0Cp8oNRBwgg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-355-8nlT3ho2O7C4CpFPild2Jw-1; Wed, 03 Mar 2021 08:06:49 -0500
X-MC-Unique: 8nlT3ho2O7C4CpFPild2Jw-1
Received: by mail-wr1-f71.google.com with SMTP id z6so3943420wrh.11
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 05:06:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n3rcxXwJNSuNr4Blajtp7IbddC9DRxz8a45XKlM7vy0=;
 b=J5LD1Cj2FHOi5b9i7LquXpYBjpEjEV0yHU+6fQaITHYdT5E/aXQ4oLMmL/pygigZgM
 bBROXK5SL3j0Cqa/zK87uRtFOnb2oMMsP9sV0onPepG46AsDCLOGE3DkeHFTmUwldNS8
 L4KdLS6JoshVpy8o9OjrFu0lDAfJ87/HaA7lkiRh4KMJnA9H/UC3i/nQzCdXRBtqNRYc
 FMIb+IzCyKMQToHzjCx+Vr6L3XhxwKYWtAVmyALEj/Mad4LPFZI9hNwN/BHKgkvyB7iE
 Iudy+dZtwJnwRFT03g4OPqGtOMObkeid+BR5HK6dpm01iROBI+XReD61tkoIiLQAN4Dm
 69dQ==
X-Gm-Message-State: AOAM533qOiMSF3F8QxDfMtIbFyGcA4R6h1gE6dqZyd964hJvhU+nvsgK
 Sb6g14pJeeA9R0EHoxvkyTlAWnODgaClMvHHwHcopyF8oiNFLfrhGpMNzmEBjcbs2JbSA2WpsO+
 CzNadaz/4hTKCGcw=
X-Received: by 2002:adf:f78f:: with SMTP id q15mr26792030wrp.383.1614776808807; 
 Wed, 03 Mar 2021 05:06:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJykjDQ1yhLYjaQPXB8ZY7WKNlIUwpoOf4y94nRN+/pJ/hlUiOZCAKwN/8ixtMs9oZSIu84uyQ==
X-Received: by 2002:adf:f78f:: with SMTP id q15mr26792005wrp.383.1614776808644; 
 Wed, 03 Mar 2021 05:06:48 -0800 (PST)
Received: from x1w.redhat.com (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id o13sm36602779wro.15.2021.03.03.05.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:06:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: "Daniel P . Berrange" <berrange@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH 0/3] gitlab: Add missing job -> container dependencies
Date: Wed,  3 Mar 2021 14:06:43 +0100
Message-Id: <20210303130646.1494015-1-philmd@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 "Richard W . M . Jones" <rjones@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Bin Meng <bmeng.cn@gmail.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Following up Daniel's "fix build failures from incorrectly=0D
skipped container build jobs" effort (merged).=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  docker: Alpine build job depends on Alpine container=0D
  docker: EDK2 build job depends on EDK2 container=0D
  docker: OpenSBI build job depends on OpenSBI container=0D
=0D
 .gitlab-ci.d/edk2.yml    | 1 +=0D
 .gitlab-ci.d/opensbi.yml | 1 +=0D
 .gitlab-ci.yml           | 2 ++=0D
 3 files changed, 4 insertions(+)=0D
=0D
--=20=0D
2.26.2=0D
=0D


