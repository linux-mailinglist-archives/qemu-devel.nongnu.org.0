Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AFC42A9A61
	for <lists+qemu-devel@lfdr.de>; Fri,  6 Nov 2020 18:06:32 +0100 (CET)
Received: from localhost ([::1]:53932 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kb5C3-0004Ma-2A
	for lists+qemu-devel@lfdr.de; Fri, 06 Nov 2020 12:06:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kb59u-00031V-Bz
 for qemu-devel@nongnu.org; Fri, 06 Nov 2020 12:04:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:46932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kb59s-0001zH-O7
 for qemu-devel@nongnu.org; Fri, 06 Nov 2020 12:04:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1604682256;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=7AwrTJUuq41/XCYK+7UGABhog2BUpWFpH3S0s5kN6W4=;
 b=XZUZGATLmRUoarq+R4o/vPpQWbF2pJOYMOtx+JFDUMlwgua76rSujRT3MG++8wm1CcfzQ8
 ih3qM8CkuycD77p8bUTlaqaD4U4w1xkL4geG5TW24SamddMChWKb5wXSYN5jqBoGp9mgKd
 X6wpws9sKam26v3RRWnfenN4h+hv8xw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-280-hotfSxX0PIKOllj05ubaUQ-1; Fri, 06 Nov 2020 12:04:13 -0500
X-MC-Unique: hotfSxX0PIKOllj05ubaUQ-1
Received: by mail-wm1-f69.google.com with SMTP id 3so674631wms.9
 for <qemu-devel@nongnu.org>; Fri, 06 Nov 2020 09:04:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EbJkJ95FxPswVXG1ztV9sKjvQN1FMmoVTHeFp9snjqk=;
 b=ohKRR1+Aj35douPADgg4JfIFKOLYhvMq0ik/B8nysWvO0wo5ObqqnkuU/2giTCZpWM
 eHhOfCCW6jkDLYaQeVXTreZwLx6HvwrtjXhGciXTW9QULFbfkPdahVcCEWXzkwISWw5a
 WVgVkXV//4coD9jBur7Xk1TGhSUfxitq0dI3RkZkcBqg8TTvfQ5/XGHBiJ9R/zpbiTNm
 prRzSzxRu9cOO5P+4hFjLEKkF1YhsyMo0RQpqq9jBZ63rmjq3VXz7HInESFKCVbCUxBx
 FjnngZXrMsEsq+ZgXnHTVgMbXSIfQ41Zu3Yx8KiPhmOu5EobX0V8ehUJwM57TaFUN0o3
 ci2Q==
X-Gm-Message-State: AOAM5301pZsZkpLLYmYXTd4r9JkjqiDTzyXyZEuWV0jFCMhoSpgWnoe6
 YiG5b6mOfaiSCkioh4pen6o+ImgaGBtBoatuNEe1WcriE/+N0fpmNRvxXmz58X23P/641E3Q9oD
 38wJZFAuEQKNnn7I=
X-Received: by 2002:adf:9e4c:: with SMTP id v12mr3601448wre.22.1604682251861; 
 Fri, 06 Nov 2020 09:04:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxin7zoiwQLwLc3jCv5l0D02DkvnSTIhhmFvlfsktMjWYTB3ZNEmt6ZOI0/EiwBz+uwgafbFA==
X-Received: by 2002:adf:9e4c:: with SMTP id v12mr3601421wre.22.1604682251640; 
 Fri, 06 Nov 2020 09:04:11 -0800 (PST)
Received: from localhost.localdomain (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id t15sm3099502wmn.19.2020.11.06.09.04.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2020 09:04:10 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH-for-6.0 0/2] hw/scsi/scsi-disk: QOM style change
Date: Fri,  6 Nov 2020 18:04:02 +0100
Message-Id: <20201106170404.4130486-1-philmd@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/06 06:30:30
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-trivial@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some QOM style changes in TYPE_SCSI_DISK to follow=0D
the rest of the codebase style. No logical change.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (2):=0D
  hw/scsi/scsi-disk: Rename type as TYPE_SCSI_DISK=0D
  hw/scsi/scsi-disk: Use SCSI_DISK_GET_CLASS() macro=0D
=0D
 hw/scsi/scsi-disk.c | 26 +++++++++++++-------------=0D
 1 file changed, 13 insertions(+), 13 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


