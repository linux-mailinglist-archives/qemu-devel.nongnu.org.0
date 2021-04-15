Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D51D6360969
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 14:29:47 +0200 (CEST)
Received: from localhost ([::1]:59994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX17y-0004he-Jc
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 08:29:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45974)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX157-0002v8-7O
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 08:26:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:54405)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lX151-0005wk-A1
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 08:26:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618489601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=pXtf60TYT+/z0KTRgVxh+oiyMooqorWxspUIGNgWdZk=;
 b=Mj71kJ8v5nomXmMhDvH+lsKB+6N9BCEYV29ez3TE1BypW3l7bOZu+a2HamrgBHI5kSA8YN
 IOfpgNOAlS1iB3O7xTWPQB6J3K43P6BxzgUnQ6TBFMCqkO4CjQZayOT668hee+ze4zflLI
 KhjVHKl+RjY9EI9+D5oc86a34XNygBk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-357-g1OBUFb9NVGbFrCMn5Vgbg-1; Thu, 15 Apr 2021 08:26:37 -0400
X-MC-Unique: g1OBUFb9NVGbFrCMn5Vgbg-1
Received: by mail-wm1-f69.google.com with SMTP id
 p11-20020a05600c358bb029011630279b61so4119731wmq.7
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 05:26:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PX6iu3F1pA0ehnZXuMxawI4QCD3hd697/6OmNN8gdWI=;
 b=UZm8LdP90bRVm+7tioYk8KrU/FAb7PumN54onMey7oPDgjbnG5g/QwhnMumsJQqpaE
 zG8cBkCWRrb4X0gW7Pebhq1Ag8quAjKnO8zzTRwsDQ90klnbbv6nreDQeviiwPvTFsDK
 7V8GMUXd9EEAdVHmazWAvC+i65OhQbfXH55qwqz7FPIbqd8RhctIYE5cpZpmY2kwfGlb
 EC2O5GGGt3eWK/vK8UVTkdv38z2pBygr8sMyG/oOCzNZXUJRSP9cdCk77W8gyRQY022L
 TpxYsCeVZXwNm9fIE9M193a3M+lC42Cl/zxwZEmUxAsnYWSX7TjokvthEw12SuFqYwE8
 LQiQ==
X-Gm-Message-State: AOAM53309Uc84t/y7J0YN37oAFNXcpDIsgvYD2c2VlqQQZMgYBix+RYK
 OlNyUtNIHx0B8Phla4Nz5/xTjqWRfaw4QU8Ru899HenjojVl09zKP3M29mY0InRfckiX4n0qvwh
 oVb/LgY02wIPoftO8vsK853dn73TtYc8gzKboSZhgP+zK24e51171Z65iMH0zS8YL
X-Received: by 2002:a7b:c7d2:: with SMTP id z18mr2910931wmk.104.1618489596376; 
 Thu, 15 Apr 2021 05:26:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxJ+rV0jl98XBFuMbm0kaf8U/gMAFNIfhIbetCZ45SbBe5DwlDosW3lpnEnWCAX2o9LsP4EFQ==
X-Received: by 2002:a7b:c7d2:: with SMTP id z18mr2910878wmk.104.1618489595928; 
 Thu, 15 Apr 2021 05:26:35 -0700 (PDT)
Received: from localhost.localdomain (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id h17sm2960469wru.67.2021.04.15.05.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 05:26:35 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/6] qtests: Check accelerator available at runtime via QMP
 'query-accels'
Date: Thu, 15 Apr 2021 14:26:27 +0200
Message-Id: <20210415122633.4054644-1-philmd@redhat.com>
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Andrew Jones <drjones@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 qemu-arm@nongnu.org, Claudio Fontana <cfontana@suse.de>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
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
As a bonus we remove CONFIG_TCG in config_host, to avoid=0D
building unnecessary objects depending on TCG.=0D
=0D
Missing review:=0D
- #4 qtest/qmp-cmd-test: Make test build-independent from accelerator=0D
- #6 tests/meson: Only build softfloat objects if TCG is selected=0D
=0D
Since v2:=0D
- Addressed Eric & Paolo review comments=0D
=0D
Since v1:=0D
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
Please review,=0D
=0D
Phil.=0D
=0D
Philippe Mathieu-Daud=C3=A9 (6):=0D
  accel: Introduce 'query-accels' QMP command=0D
  tests/qtest: Add qtest_has_accel() method=0D
  qtest/bios-tables-test: Make test build-independent from accelerator=0D
  qtest/qmp-cmd-test: Make test build-independent from accelerator=0D
  tests/qtest: Do not restrict bios-tables-test to Aarch64 hosts anymore=0D
  tests/meson: Only build softfloat objects if TCG is selected=0D
=0D
 meson.build                    |  1 -=0D
 qapi/machine.json              | 49 +++++++++++++++++=0D
 tests/qtest/libqos/libqtest.h  |  8 +++=0D
 accel/accel-qmp.c              | 49 +++++++++++++++++=0D
 tests/qtest/bios-tables-test.c | 99 ++++++++++++++++++----------------=0D
 tests/qtest/libqtest.c         | 29 ++++++++++=0D
 tests/qtest/qmp-cmd-test.c     | 18 +++++--=0D
 accel/meson.build              |  2 +-=0D
 tests/qtest/meson.build        |  3 +-=0D
 9 files changed, 203 insertions(+), 55 deletions(-)=0D
 create mode 100644 accel/accel-qmp.c=0D
=0D
--=20=0D
2.26.3=0D
=0D


