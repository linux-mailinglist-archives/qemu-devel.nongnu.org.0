Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0465133DB6B
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Mar 2021 18:52:00 +0100 (CET)
Received: from localhost ([::1]:57028 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMDrK-0006Rg-Un
	for lists+qemu-devel@lfdr.de; Tue, 16 Mar 2021 13:51:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56562)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMDRC-000892-Hp
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:24:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:42294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lMDRB-0002pQ-07
 for qemu-devel@nongnu.org; Tue, 16 Mar 2021 13:24:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615915496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=Y4vN7oSQdHCfPupuCUAS0maVfo8Vbz/Nb2NfBAOhk6M=;
 b=GT5EfDqaACZnmyCeJBLkZQTzSgw2KwC4jKUvnP069WNlAN5VD1Vpu1tKA4L+/1iRFXoaNF
 n6JW1efAt+dGU7rOqRU9kDekZ4/ogNYtJeN80bhUc8TcyVQTgskGpej94uKQ4Vplo5uxpF
 q3n1uWeMExlyXtcPSppSJCkCJLeQVf0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-580-nEs5nSNANciqHn0bXoV4Sg-1; Tue, 16 Mar 2021 13:24:54 -0400
X-MC-Unique: nEs5nSNANciqHn0bXoV4Sg-1
Received: by mail-wr1-f70.google.com with SMTP id h30so17052005wrh.10
 for <qemu-devel@nongnu.org>; Tue, 16 Mar 2021 10:24:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=j97TlkCGqiQ929kzGXJPvPswPxIcxtzguKWQ6Gwz4cM=;
 b=nV3vGTk/XL01pf+u5I2yfsspcby3AY48AIsqnsHCqBrXtZeWXtBmjJuVvakkGs9lIm
 X+DU/eLLAtQJx1IpX40kFfQC/W8q6xlt1xKDNKdSYQ0jV1Pi6ze4WW2vfU7UZGoG6oyy
 i/e7T+NnJj7oqbXCVn9X2fYM70VL+JIFDXTohK5Pr+uHJosAFAVa5ALDW/LSvHZYsCJc
 yUCcQRzmRlzEQzpp41QvfPfSyl5ip+pDAp9KsZaldt1w7k9NRk6/t70zy1prngtBvwYn
 mjpC26bHJFCu0TZBuExmJtZJqzW6fL8108xl4ZDCEe/UBqyhSSleT91ftOLUOy/Jdq/I
 IYyg==
X-Gm-Message-State: AOAM530rxfeKQkL8nku+NeCYaA2TQ9e4Y15k4jOLrgzVTAiP9ZeWwVyb
 6mYJMRhF+8fQzNLgzZn+XwdvdW1eqdm3HaUnLPpBRPqcJN0OpuQkgbJkvQyQWKrEfaSnqPy9JJp
 zoHu2Ar3uh1ZQNOAhg3+EY5TrOKcGAk4zCjzTAMMlKQ8x7hcUh/+y4N6UaTIXW0xB
X-Received: by 2002:adf:fb8a:: with SMTP id a10mr42652wrr.365.1615915493184;
 Tue, 16 Mar 2021 10:24:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJymYuT1k03llnKr/WFv1Ybi7uY4xPkp8osk0ayJtQKJmcOb8Fitw9tcg9qg2pJoRmIIItlklg==
X-Received: by 2002:adf:fb8a:: with SMTP id a10mr42595wrr.365.1615915492788;
 Tue, 16 Mar 2021 10:24:52 -0700 (PDT)
Received: from localhost.localdomain (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id y18sm23072328wrw.39.2021.03.16.10.24.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Mar 2021 10:24:52 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/4] qtests: Check accelerator available at runtime via QMP
 'query-accels'
Date: Tue, 16 Mar 2021 18:24:45 +0100
Message-Id: <20210316172449.3148634-1-philmd@redhat.com>
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Andrew Jones <drjones@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
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
Philippe Mathieu-Daud=C3=A9 (4):=0D
  accel: Introduce 'query-accels' QMP command=0D
  tests/qtest: Add qtest_has_accel() method=0D
  qtest/bios-tables-test: Make test build-independent from accelerator=0D
  tests/qtest: Do not restrict bios-tables-test to Aarch64 hosts anymore=0D
=0D
 qapi/machine.json              | 55 +++++++++++++++++++=0D
 tests/qtest/libqos/libqtest.h  |  8 +++=0D
 accel/accel-qmp.c              | 49 +++++++++++++++++=0D
 tests/qtest/bios-tables-test.c | 99 ++++++++++++++++++----------------=0D
 tests/qtest/libqtest.c         | 29 ++++++++++=0D
 accel/meson.build              |  2 +-=0D
 tests/qtest/meson.build        |  3 +-=0D
 7 files changed, 195 insertions(+), 50 deletions(-)=0D
 create mode 100644 accel/accel-qmp.c=0D
=0D
--=20=0D
2.26.2=0D
=0D


