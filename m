Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C89F46D7DA0
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Apr 2023 15:22:42 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pk34u-0007Al-Mb; Wed, 05 Apr 2023 09:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3r3AtZAUKCm4PUSUfSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--digit.bounces.google.com>)
 id 1pk2jd-0000nR-L0
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 08:59:33 -0400
Received: from mail-ej1-x64a.google.com ([2a00:1450:4864:20::64a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3r3AtZAUKCm4PUSUfSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--digit.bounces.google.com>)
 id 1pk2ja-0003aA-Co
 for qemu-devel@nongnu.org; Wed, 05 Apr 2023 08:59:33 -0400
Received: by mail-ej1-x64a.google.com with SMTP id
 a640c23a62f3a-93071c20d6bso32955866b.2
 for <qemu-devel@nongnu.org>; Wed, 05 Apr 2023 05:59:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1680699567;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=koAQPE9F3CPzP0Azi/DuIEpOs0IIxdSTScvuPiygnT4=;
 b=lHpzMQeL2nid23yeYtNaldssYtOlLn+JV6uxUYkB7tmzXkQFV9kKJzhNLcpOMGT3Oe
 tYS22bJVR+EQh8H2PawUKfVOGmM7YKZ++CvdPyU78ACwxZLVLSoBhdJxyu8fgno+m4ZA
 2XA/uR01ZQBRL2LXbjwBjrhyaUbo9dSPB0NkBKtu7xsTAykdKhXajzLaKDwGbarLs6eT
 g2MlFk+5TWQ3VGx9BkhJcYKYUTd6AKdtTQs1c+bVUnSAJrR8hu8ZuGOdZXenpU5beQV2
 vPIldxc4DB4ycXaxvwEcY0S88ICYikBFSPVur0lpH0VTjXEyRAHmkecUVbP3Ad8fTsSJ
 T+QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680699567;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=koAQPE9F3CPzP0Azi/DuIEpOs0IIxdSTScvuPiygnT4=;
 b=3OWObAjYc0ZIlifRORFpnkjximL+HIH5mjqVR2TPnaEWsF9VSvT/+Sk2xE3jQ5OwyD
 bNss+G5gVG2uLKowRWmvoeI5wGezguLqe/9QHti5kGX/sYit0bZC4s3vg7WubD+B7DUU
 pGIu1x4ZQ50f0KrEO58iA7pVdhLc4kqUFFh9M9UKhWeESkvYCKeJQCPp6dyShG3BgaXR
 SajzfeOCq8oIkvwrTYl6+iIrRGL+kGa3v1ENRcGGg98VP+GCGlKlJvM5XUX+CfWS8yZs
 F3kT0uIWAjT3hZW5nqhPEEiZqewpzIyof8i2CRcaPA0Jknl68r8nLjpvr5lfEGQw5eql
 mt5w==
X-Gm-Message-State: AAQBX9fiemFAp8bKOfeO/Ji4DYpJdX0vev1iituzgc0E0Yw6MUsanwlE
 xU8Cuy3flrS0qdVPjY1/WTU76ntemRD7H582rCsRxDF/no04BuAONqoyI/o/HY1/oTqpSDirANO
 1dmwyXGBSgAnovHYZTdENFL5VRRgas5IgKcGFS8oewcAvleP4mUiCc1IAZg==
X-Google-Smtp-Source: AKy350aw7zYe+CN3+TJdEDcjvQGVYYFY72BR4YrLde2cl+tuYOeIK1VMQzQZhKWNQYIkfjvprG0Ue3VhdA==
X-Received: from digit-linux-eng.par.corp.google.com
 ([2a00:79e0:a0:1:d1d4:d452:da86:5ee0])
 (user=digit job=sendgmr) by 2002:a50:ce47:0:b0:502:4a93:9c51 with SMTP id
 k7-20020a50ce47000000b005024a939c51mr1093318edj.5.1680699567435; Wed, 05 Apr
 2023 05:59:27 -0700 (PDT)
Date: Wed,  5 Apr 2023 14:59:18 +0200
Mime-Version: 1.0
X-Mailer: git-send-email 2.40.0.348.gf938b09366-goog
Message-ID: <20230405125920.2951721-1-digit@google.com>
Subject: [PATCH 0/2] Fix QEMU compilation on Debian 10
From: "David 'Digit' Turner" <digit@google.com>
To: qemu-devel@nongnu.org
Cc: "David 'Digit' Turner" <digit@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::64a;
 envelope-from=3r3AtZAUKCm4PUSUfSaaSXQ.OaYcQYg-PQhQXZaZSZg.adS@flex--digit.bounces.google.com;
 helo=mail-ej1-x64a.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Wed, 05 Apr 2023 09:21:30 -0400
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

QEMU does not compile on an old Debian 10 system for the
following reasons:

- Several sources include recent kernel headers that are
  not provided by this system, and not listed in
  linux-headers/

- The libvhost-user.c source file ends up including a
  system kernel header, instead of the up-to-date
  standard-headers/ version that contains the right
  macro definition.

David 'Digit' Turner (2):
  Fix libvhost-user.c compilation.
  Add missing Linux kernel headers.

 linux-headers/linux/const.h               |  36 +++++++
 linux-headers/linux/memfd.h               |  35 +++++++
 linux-headers/linux/nvme_ioctl.h          | 114 ++++++++++++++++++++++
 linux-headers/linux/vfio.h                |  15 +--
 scripts/update-linux-headers.sh           |   4 +-
 subprojects/libvhost-user/libvhost-user.c |   6 ++
 6 files changed, 202 insertions(+), 8 deletions(-)
 create mode 100644 linux-headers/linux/const.h
 create mode 100644 linux-headers/linux/memfd.h
 create mode 100644 linux-headers/linux/nvme_ioctl.h

-- 
2.40.0.348.gf938b09366-goog


