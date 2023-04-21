Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD38E6EA610
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 10:42:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppmKN-000315-35; Fri, 21 Apr 2023 04:41:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppmKL-00030x-H0
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 04:41:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ppmKK-0001sD-52
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 04:41:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682066466;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=YF32A6DyW2RGZUQizrMCWb85KOUmg8bRyLjV3FaQe30=;
 b=Y6OhpiVz93ZzMN9YBaJih3SQZyVK7M87lUw36wbibHMZ3Zdm7Si4lChUPTnipI8eoAjffI
 Hcm1Uo99KUDsAQIEIZFmbCKsGJGFgIuEJvH7H3xeFPnhygHiWBHKmYLKYWO7H44kk6Ev9K
 aaSjr4/fiqpoHGd6vNEG+Gtnj8DLaQI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-587-zscHjRqjNtmX2U1NwoCdPQ-1; Fri, 21 Apr 2023 04:41:03 -0400
X-MC-Unique: zscHjRqjNtmX2U1NwoCdPQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-94a348facbbso151538666b.1
 for <qemu-devel@nongnu.org>; Fri, 21 Apr 2023 01:41:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682066461; x=1684658461;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YF32A6DyW2RGZUQizrMCWb85KOUmg8bRyLjV3FaQe30=;
 b=NKJ/CTVeUrN0MT6nbDU4I8qEkN6XA8+GS2FAoHs6Hbnfc/2Sxz0wXNvtyYf1mjotG+
 KzCqWcA0M/8T26TtTewLdxn7flX4yo+c5/iOz1MzGP8LSR3yfIHq36LTDNy1WF1nnaOz
 yE/IhtUon7aD7GtEpKZECkzNQwHwm+SCBIo2dhDFTN5lhZ8dIwfokqjf+00yM5AmDxa9
 xLaSxnOee54spb2b09eqzwfogDOsCDEpMGQrg1PDOkKxox1N2SegZqNLkCi0hnvraY2i
 Jng0mJyLiNLhrH9lGkJ9Ro9vYWx9QcGcLffj/hsZKd9nd3m7l7laceeW3+6pyhzuAIc1
 m/Kg==
X-Gm-Message-State: AAQBX9clTvfGSjVie5tVb6FAww8vDQOnVFp5yaQUUF4459tJoFe9DK17
 fw2k5fVAOig0A5/uwaEIUTN6W5T5LDj9qX6H7X7sV6NDVjzAVtEh3XIUg/yUqcZUfykRX2aJNv9
 9PEjHJvPU58JShsF6wmoUCBEWKKfBMDTpRB/6RYeihHyPHqgdSJqg6b32GswjB8YywoLPUSXIsF
 7v0g==
X-Received: by 2002:a17:907:d310:b0:94f:c71:dd48 with SMTP id
 vg16-20020a170907d31000b0094f0c71dd48mr1316699ejc.63.1682066461505; 
 Fri, 21 Apr 2023 01:41:01 -0700 (PDT)
X-Google-Smtp-Source: AKy350YSEYRgB4izID+ZFQLuKGGXhLBT5FLhFMX0lneaMOoVjimj0+nAuMONHWr+1H4tAmYSUf0H9A==
X-Received: by 2002:a17:907:d310:b0:94f:c71:dd48 with SMTP id
 vg16-20020a170907d31000b0094f0c71dd48mr1316684ejc.63.1682066461107; 
 Fri, 21 Apr 2023 01:41:01 -0700 (PDT)
Received: from [192.168.10.118] ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 g11-20020a170906394b00b0094f4f2db7e0sm1809665eje.143.2023.04.21.01.41.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Apr 2023 01:41:00 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: pkrempa@redhat.com,
	berrange@redhat.com
Subject: [PATCH v3 0/2] tests: lcitool: Switch to OpenSUSE Leap 15.4
Date: Fri, 21 Apr 2023 10:40:57 +0200
Message-Id: <20230421084059.9142-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
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

v3 of Peter's series, which uses a newer libvirt-ci commit.  With this
version, future updates of the libvirt-ci submodule will pick new
Leap 15 releases without the need for changes to tests/lcitool/mappings.yml
or tests/lcitool/targets.

Paolo

Supersedes: <cover.1681735482.git.pkrempa@redhat.com>

Peter Krempa (2):
  tests: libvirt-ci: Update to commit '2fa24dce8bc'
  tests: lcitool: Switch to OpenSUSE Leap 15.4

 tests/docker/dockerfiles/centos8.docker       |  1 -
 .../dockerfiles/debian-amd64-cross.docker     |  4 +--
 .../dockerfiles/debian-arm64-cross.docker     |  4 +--
 .../dockerfiles/debian-armel-cross.docker     |  4 +--
 .../dockerfiles/debian-armhf-cross.docker     |  4 +--
 .../dockerfiles/debian-mips64el-cross.docker  |  4 +--
 .../dockerfiles/debian-mipsel-cross.docker    |  4 +--
 .../dockerfiles/debian-ppc64el-cross.docker   |  4 +--
 .../dockerfiles/debian-s390x-cross.docker     |  4 +--
 .../dockerfiles/fedora-win32-cross.docker     |  5 ++-
 .../dockerfiles/fedora-win64-cross.docker     |  5 ++-
 tests/docker/dockerfiles/fedora.docker        |  5 ++-
 tests/docker/dockerfiles/opensuse-leap.docker |  5 ++-
 tests/lcitool/libvirt-ci                      |  2 +-
 tests/lcitool/mappings.yml                    | 36 +++++++++----------
 tests/lcitool/refresh                         |  2 +-
 ...suse-leap-153.yml => opensuse-leap-15.yml} |  0
 17 files changed, 44 insertions(+), 49 deletions(-)
 rename tests/lcitool/targets/{opensuse-leap-153.yml => opensuse-leap-15.yml} (100%)

-- 
2.40.0


