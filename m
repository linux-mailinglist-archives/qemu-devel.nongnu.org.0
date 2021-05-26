Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EA0391D93
	for <lists+qemu-devel@lfdr.de>; Wed, 26 May 2021 19:09:16 +0200 (CEST)
Received: from localhost ([::1]:58630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llx1v-00013c-W4
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 13:09:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llwxf-0006Eh-Dq
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:04:51 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36891)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1llwxd-0003d2-HL
 for qemu-devel@nongnu.org; Wed, 26 May 2021 13:04:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622048688;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=M0glat/g/NyPt6LB9JIqMvaoPmqPSuwXBdXyiRqvEmg=;
 b=NtSDV5uXegRUVqcqGq4VqnkbwJejF9gATi02Sal04k8UdaOj59I8uVKKZV6sk4xyylaaBi
 EYyLmwMrJ65toCweplw2fyzmkrTt3FJCEtneNXsoY50/chrkkidXGd/OyJN13aAIllwhbf
 Dew05eyaX8+NXIWX+FNSiP3f8kpzO/4=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-595-t8FxwOj_NR2fD-Q4SzEJHA-1; Wed, 26 May 2021 13:04:46 -0400
X-MC-Unique: t8FxwOj_NR2fD-Q4SzEJHA-1
Received: by mail-wr1-f70.google.com with SMTP id
 7-20020adf95070000b02901104ad3ef04so598200wrs.16
 for <qemu-devel@nongnu.org>; Wed, 26 May 2021 10:04:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=M0glat/g/NyPt6LB9JIqMvaoPmqPSuwXBdXyiRqvEmg=;
 b=uZ2rjYnCcIAHR/lhKynVI+7Vl04fVNNxFmjzIkv90SO/XVTCYiE4Fo0orsYRkY4AZr
 EZ8uLcjNFBhs3C3UZeyKeZ5lWsf17iAFjMgJpAiJIiBBTsI+XsvaQpI8mor5/rlqlsw/
 Fe33ZE3USg25LjC+ESJjlI8eeJD67kbBjzYH9XTQwFsipBEn2rajsVE0UUCOfsW0z1Qq
 tU6jfX51zpNhmsoBw0l9ULpo954Q/Y5UmHFgfm9Mfq+gqX0xunQap6L/k73g1wtau1qZ
 UkSdWpex7AIOm/a+jg3QCnCxz9B2QL7E7oNPADenpF45qol3jY/uZj8d+pgu1yy4KTwO
 XO3A==
X-Gm-Message-State: AOAM530mV5cjRbCjyTbNMesKBMCenwj85H/JgyWOb5BOSyUcMFL5g6Mk
 o8I90tuJKdknPSMcaPNNhTzCjGQkK/ydHAF9BuQB3E8Mhhb/bMnvb9c4aSEP6abM5cXqchEqdXS
 vuRPUt0CpW0EPjOwfJOspjASjx64YZ3zHoIZmH9LK1pdkRmmzyv80aVMPiYl8w+P4
X-Received: by 2002:a05:6000:1848:: with SMTP id
 c8mr308102wri.310.1622048685210; 
 Wed, 26 May 2021 10:04:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxTSUVy6/DDc3Y5QjQ9qBUkrkNtSnS91/0hZnCZXqqVIiz0G0BtqgvMobeil/uZjOr3o4EukA==
X-Received: by 2002:a05:6000:1848:: with SMTP id
 c8mr308055wri.310.1622048684764; 
 Wed, 26 May 2021 10:04:44 -0700 (PDT)
Received: from localhost.localdomain (64.red-88-10-103.dynamicip.rima-tde.net.
 [88.10.103.64])
 by smtp.gmail.com with ESMTPSA id e8sm20901530wrt.30.2021.05.26.10.04.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 May 2021 10:04:44 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 00/12] qtests: Check accelerator available at runtime via
 QMP 'query-accels'
Date: Wed, 26 May 2021 19:04:20 +0200
Message-Id: <20210526170432.343588-1-philmd@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
This series aims at having accelerator-independent qtests=0D
by querying a QEMU instance at runtime to check the list=0D
of built-in accelerators.=0D
=0D
First we add the 'query-accels' QMP command,=0D
then we add the qtest_has_accel() method to libqtest,=0D
finally we use this new method to allow running=0D
bios-tables-test on KVM-only builds.=0D
=0D
This series is expected to be merged via the ARM tree.=0D
=0D
Since v7:=0D
- Include Markus code (see patch #2)=0D
=0D
Since v6:=0D
- Fixed a typo (Eric)=0D
- Added R-b tags=0D
=0D
Since v5:=0D
- Rename bios-tables tests (Igor)=0D
- Do not restrict bios-tables tests to TCG (Igor)=0D
- Reset bios-tables-test R-b tags=0D
=0D
Since v4:=0D
- Removed patch 10 (Markus, patch justification not clear)=0D
  'qtest/qmp-cmd-test: Make test build-independent from accelerator'=0D
- Removed patch 12 (Alex, icount / record/replay issue)=0D
  'tests/meson: Only build softfloat objects if TCG is selected (again)'=0D
- Sorted @Accelerator QAPI enum (Eric)=0D
- Added R-b/T-b=0D
=0D
Since v3:=0D
- Added Markus review comments=0D
- Added R-b/A-b tags=0D
=0D
Since v2:=0D
- Addressed Markus & Drew review comments=0D
- Added qtest/migration-test patch=0D
=0D
Since v1:=0D
- Addressed Eric & Paolo review comments=0D
=0D
Since v0:=0D
- kept over-engineered union (I don't how to do simple enum)=0D
- dropped arm-cpu-features patches for now=0D
- fixed typos (Eric)=0D
- rename qtest_has_accel (Thomas)=0D
- probe accel with machine none previous qtest (Paolo)=0D
- iterate over QAPI enum (Markus)=0D
=0D
Eric's suggestion of conditional QAPI didn't worked out,=0D
as accelerator definitions are poisoned.=0D
=0D
Phil.=0D
=0D
$ git backport-diff v6=0D
Key:=0D
[----] : patches are identical=0D
[####] : number of functional differences between upstream/downstream patch=
=0D
[down] : patch is downstream-only=0D
The flags [FC] indicate (F)unctional and (C)ontextual differences, respecti=
ve=3D=0D
ly=0D
=0D
001/12:[----] [--] 'MAINTAINERS: Add qtest/arm-cpu-features.c to ARM TCG CP=
Us=3D=0D
 section'=0D
002/12:[0048] [FC] 'accel: Introduce 'query-accels' QMP command'=0D
003/12:[----] [--] 'qtest: Add qtest_has_accel() method'=0D
004/12:[----] [--] 'qtest/arm-cpu-features: Use generic qtest_has_accel() t=
o =3D=0D
check for KVM'=0D
005/12:[----] [--] 'qtest/arm-cpu-features: Restrict sve_tests_sve_off_kvm =
te=3D=0D
st to KVM'=0D
006/12:[----] [--] 'qtest/arm-cpu-features: Remove TCG fallback to KVM spec=
if=3D=0D
ic tests'=0D
007/12:[----] [--] 'qtest/arm-cpu-features: Use generic qtest_has_accel() t=
o =3D=0D
check for TCG'=0D
008/12:[----] [--] 'qtest/migration-test: Skip tests if KVM not builtin on =
s3=3D=0D
90x/ppc64'=0D
009/12:[----] [--] 'qtest/bios-tables-test: Rename tests not TCG specific'=
=0D
010/12:[----] [--] 'qtest/bios-tables-test: Rename TCG specific tests'=0D
011/12:[----] [--] 'qtest/bios-tables-test: Make test build-independent fro=
m =3D=0D
accelerator'=0D
012/12:[----] [--] 'qtest: Do not restrict bios-tables-test to Aarch64 host=
s =3D=0D
anymore'=0D
=0D
Philippe Mathieu-Daud=3DC3=3DA9 (12):=0D
  MAINTAINERS: Add qtest/arm-cpu-features.c to ARM TCG CPUs section=0D
  accel: Introduce 'query-accels' QMP command=0D
  qtest: Add qtest_has_accel() method=0D
  qtest/arm-cpu-features: Use generic qtest_has_accel() to check for KVM=0D
  qtest/arm-cpu-features: Restrict sve_tests_sve_off_kvm test to KVM=0D
  qtest/arm-cpu-features: Remove TCG fallback to KVM specific tests=0D
  qtest/arm-cpu-features: Use generic qtest_has_accel() to check for TCG=0D
  qtest/migration-test: Skip tests if KVM not builtin on s390x/ppc64=0D
  qtest/bios-tables-test: Rename tests not TCG specific=0D
  qtest/bios-tables-test: Rename TCG specific tests=0D
  qtest/bios-tables-test: Make test build-independent from accelerator=0D
  qtest: Do not restrict bios-tables-test to Aarch64 hosts anymore=0D
=0D
 qapi/machine-target.json       |  54 ++++++++++++=0D
 tests/qtest/libqos/libqtest.h  |   8 ++=0D
 accel/accel-qmp.c              |  32 +++++++=0D
 tests/qtest/arm-cpu-features.c |  55 ++++--------=0D
 tests/qtest/bios-tables-test.c | 156 ++++++++++++++++-----------------=0D
 tests/qtest/libqtest.c         |  29 ++++++=0D
 tests/qtest/migration-test.c   |   4 +-=0D
 MAINTAINERS                    |   1 +=0D
 accel/meson.build              |   2 +-=0D
 tests/qtest/meson.build        |   3 +-=0D
 10 files changed, 222 insertions(+), 122 deletions(-)=0D
 create mode 100644 accel/accel-qmp.c=0D
=0D
--=3D20=0D
2.26.3=0D
=0D


