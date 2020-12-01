Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD8092CA6C2
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Dec 2020 16:15:34 +0100 (CET)
Received: from localhost ([::1]:41736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kk7NN-00086c-Je
	for lists+qemu-devel@lfdr.de; Tue, 01 Dec 2020 10:15:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kk7LN-0006kX-Qx
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:13:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kk7LK-0001Iv-LZ
 for qemu-devel@nongnu.org; Tue, 01 Dec 2020 10:13:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606835605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=6RYRoiPS31Ur+5A71YsfDBKg765SemDEIGaXrQnOJJs=;
 b=MFDVAoemOZWBtJrDEM8AR0YX67xwB3ZCWAsYSdPn9gjS0yqByAWeN8Avx0GCwRz2WNBRm5
 oeh9la9YqfHsEtYbyfIqlvqHojLVz+0NZmhqrNZxVNepAKOt44yLN2nPy74hE/8mWOK+1l
 D99S0a8yQUeOkawfBMFlL3nC/10RLyw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-_7pYEgdcM9OvS4uza8V3Ng-1; Tue, 01 Dec 2020 10:13:24 -0500
X-MC-Unique: _7pYEgdcM9OvS4uza8V3Ng-1
Received: by mail-wm1-f70.google.com with SMTP id a130so918828wmf.0
 for <qemu-devel@nongnu.org>; Tue, 01 Dec 2020 07:13:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=h+AAiEVlP9EWmb+EowLjtJZq1yPjJuWn5GmpKHeOu08=;
 b=IFH8tYK2iTPc4Mj/gj5mPNhlcyO/jA/VNxdfbiK8E+RyKz55/BRZQyYAqO+1vNKCGT
 wZFrl5HFa6EbAchVwwcxqK7yZ62rozCGzRlJn1cG8wFrU3VjjeNGpLPH4gZ0whNEqYSA
 +3VpIQboqjY/EBmr3gKJNYXzuRNqGsVzD6023n6M4sTRKL4328A/WZKUXFN48QJN/OKi
 3GWBXxY9zOhzhapuB1D/fA3AHkcy8s8p+BFwwBLZNYKmf7Kfl4E3ATtf8j2ZbkjNizTQ
 z7o9uChfT6Kpvn0NxAYGcq2badJOsMfY1GL/NwqkiNq3cV2yePra/E3ocJB/muqbAQ1/
 osRg==
X-Gm-Message-State: AOAM530J5T5oInY0InhjATkN+asJg1IGXmP2XpDhGQVJwCgj1s31aRB6
 P6UazKh/hV8wc3pZMPUL+fqWIN1slyBzXDDKjaWP6zzCBDWdcDw0ht5DceEWulVPNZsUwlMDS9a
 ClCk0NxzdzBjIkBiMCz0wdd1S0uzSZjr8P5xP+VszPbAqdXFrQBND283E+S8tANXr
X-Received: by 2002:a5d:5643:: with SMTP id j3mr4308138wrw.43.1606835602642;
 Tue, 01 Dec 2020 07:13:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYiiIpc2Ee5GcQLp4YIbYiy03WUyAEPpkRb89coD/xOgvWRDRiKhYio58izN4sHoJQPxpgsw==
X-Received: by 2002:a5d:5643:: with SMTP id j3mr4308088wrw.43.1606835602293;
 Tue, 01 Dec 2020 07:13:22 -0800 (PST)
Received: from localhost.localdomain (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id c2sm4036004wrf.68.2020.12.01.07.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Dec 2020 07:13:21 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] hw/scsi/megasas: Avoid buffer overrun in
 megasas_handle_scsi()
Date: Tue,  1 Dec 2020 16:13:16 +0100
Message-Id: <20201201151319.2943325-1-philmd@redhat.com>
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
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.497,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Li Qiang <liq3ea@163.com>, Hannes Reinecke <hare@suse.com>,
 Alexander Bulekov <alxndr@bu.edu>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

FWIW megasas is not use by KVM.=0D
=0D
Not sure what is the proper fix, but at least we=0D
have a reproducer.=0D
=0D
We might improve "scsi/utils" by adding length argument to=0D
scsi_cdb_length() and check valid there, but this will take=0D
time (large refactor). Add assertions there is too violent.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (3):=0D
  tests/qtest/fuzz-test: Quit test_lp1878642 once done=0D
  hw/scsi/megasas: Assert cdb_len is valid in megasas_handle_scsi()=0D
  hw/scsi/megasas: Have incorrect cdb return MFI_STAT_ABORT_NOT_POSSIBLE=0D
=0D
 hw/scsi/megasas.c       |   6 ++=0D
 tests/qtest/fuzz-test.c | 197 ++++++++++++++++++++++++++++++++++++++++=0D
 2 files changed, 203 insertions(+)=0D
=0D
--=20=0D
2.26.2=0D
=0D


