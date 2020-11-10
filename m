Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CDA2ADB34
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Nov 2020 17:04:36 +0100 (CET)
Received: from localhost ([::1]:47944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kcW8J-0000KY-BH
	for lists+qemu-devel@lfdr.de; Tue, 10 Nov 2020 11:04:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcW5f-000777-AO
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:01:52 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1kcW5c-0003Pi-GL
 for qemu-devel@nongnu.org; Tue, 10 Nov 2020 11:01:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605024107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LEge6Ii3qDvzURhLP07GF6KRgMpusUfDj0HU1bAWybM=;
 b=AePWtRVmKIr3EwS3vK5RTTgmMYrqxUQ2/1+ktwblRU/d6MdQEZjZE+BMUh1qT4luWC0Co8
 gkUcf5Q9mI61OMErcpqj7Vqh9t//zAZGvzDmP1lldQYVvLAZdOj0Thwa6kxmQTY0m6RSPd
 hDhTAhQIHXnfDZIRJs8IoFG64Hb6ktE=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-axkIjgxuNY-i3YLNrcvGvQ-1; Tue, 10 Nov 2020 11:01:45 -0500
X-MC-Unique: axkIjgxuNY-i3YLNrcvGvQ-1
Received: by mail-wr1-f70.google.com with SMTP id l5so1341257wrn.18
 for <qemu-devel@nongnu.org>; Tue, 10 Nov 2020 08:01:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Mfu9lhSbRiKFVfUe/Ju/Rz8PVdA1RjSZeLVIXSA3rHI=;
 b=Ob/6KIBL10r0bvd/XGZ0/Rz1Bu2ivDdBURmE5wmhRobxKx7Eka32LsC4vye624rZkp
 h9b6KmnwWbqtmaOfR/KaktHZLV22FKpV7Q7BKgn9etsQO73Z/6KLbTsxlgmZj1ZWUm+h
 ObctIV7odSXq+ecvjLB78ESZrDEBB3NVqy49Y9YFqbQ5W3di0CMAjgcMw7oe2DRizRho
 m5VccXMZ6/srAWq/TKeR2K3LFxDhqearAChDxUhKP7VeHbktZeuc6TW+YaVtubWkofqN
 wDuDBPnAZn+MT4N2c7Ol9QUZCjP9GF/STcHBy2UmRRYTdgsH5GtefyYiZVX+Cm4a2vvx
 XfXQ==
X-Gm-Message-State: AOAM530D4rTs1Fx/nCgF814ADTygTdR7a+ktIG9+a8JDDE9YXIWq4nlL
 elKf1+xn8fzX0htDGFbc2RDC/0XGbc4qUzSDZg5/mkoEZ+hEg1RXWGMJLoqO7J6SfCi72TrVS9A
 3q+Qt5d/ffjePwUfL3ldwC3H+rkaVF2b2ou2/v0YP7c7irPFI1mChGSVDfb/an5nS
X-Received: by 2002:adf:eb47:: with SMTP id u7mr24391990wrn.163.1605024103236; 
 Tue, 10 Nov 2020 08:01:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxVwf809/mKFIZGwm2UFJVdAC2bMiiexi7+wSVjzQVhSP3zQI7OT3SW53V26cLijxGKpm9TeA==
X-Received: by 2002:adf:eb47:: with SMTP id u7mr24391940wrn.163.1605024102890; 
 Tue, 10 Nov 2020 08:01:42 -0800 (PST)
Received: from x1w.redhat.com (234.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.234])
 by smtp.gmail.com with ESMTPSA id k16sm11262366wrl.65.2020.11.10.08.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Nov 2020 08:01:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH 00/16] gitlab-ci: Introduce "CI job maintainer" concept,
 mark jobs maintained
Date: Tue, 10 Nov 2020 17:01:24 +0100
Message-Id: <20201110160140.2859904-1-philmd@redhat.com>
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
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/10 02:00:53
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Bin Meng <bin.meng@windriver.com>, Michael Tokarev <mjt@tls.msk.ru>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 virt-ci-maint-team@redhat.com, Bin Meng <bmeng.cn@gmail.com>,
 Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,=0D
=0D
TL;DR: Start reviewing from patch 10.=0D
=0D
To release the burden on the project and subsystem maintainers=0D
we want to rely more on GitLab continuous integration jobs.=0D
=0D
We'd like the subsystem maintainers to use GitLab more, but=0D
we need to provide contact in case something gets wrong (a job=0D
failed: is it a bug in the code? is the test buggy? is GitLab=0D
working? ...).=0D
=0D
To avoid project/subsystem maintainers to worry about that, we=0D
introduce the concept of "CI job maintainer". If a job fails,=0D
there is someone responsible for it, able to help to figure out=0D
what went wrong, until having the CI job passing again.=0D
=0D
CI "job maintainers" are listed along the YAML job, having their=0D
name and email in environment variable. Eventually script will=0D
consume this variables to notify the maintainer.=0D
=0D
I don't plan this to get merged, I just shoot a RFC to see what=0D
the community thinks about this problem.=0D
=0D
Patches 1-9 are preparatory cleanup. The proof of concept is=0D
introduced (patch 10). Jobs without maintainer listed aren't=0D
run. Then we gradually add maintainers, jobs get run again,=0D
until restoring the current mainstream state (same jobs ran).=0D
=0D
The final patch disable Avocado tests, as they are flaky, and=0D
we want maintainers become confident GitLab CI is helpful for=0D
them, so we don't want flaky tests for now. We might restore=0D
these later.=0D
=0D
Regards,=0D
=0D
Phil.=0D
=0D
Based-on: <20201110121606.2792442-1-philmd@redhat.com>=0D
=0D
Philippe Mathieu-Daud=C3=A9 (16):=0D
  gitlab-ci: Replace YAML anchors by extends (cross_system_build_job)=0D
  gitlab-ci: Replace YAML anchors by extends (native_build_job)=0D
  gitlab-ci: Replace YAML anchors by extends (native_test_job)=0D
  gitlab-ci: Replace YAML anchors by extends (acceptance_test_job)=0D
  gitlab-ci: Replace YAML anchors by extends (container_job)=0D
  gitlab-ci: Rename acceptance_test_job -> integration_test_job=0D
  gitlab-ci: Extract common job definition as 'cross_common_job'=0D
  gitlab-ci: Extract common job definition as 'native_common_job'=0D
  gitlab-ci: Set default workflow rule=0D
  gitlab-ci: Introduce the CI "job maintainer" concept=0D
  gitlab-ci: Mark some jobs maintained by Red Hat Virt CI team=0D
  gitlab-ci: Mark Bin Meng maintainer of the OpenSBI job=0D
  gitlab-ci: Mark Alex Benn=C3=A9e maintainer of Debian / Ubuntu jobs=0D
  gitlab-ci: Mark Stefan Weil maintainer of the TCI job=0D
  gitlab-ci: Volunteer to maintain Debian based and hobbyist jobs=0D
  gitlab-ci: Do not automatically run integration tests for push events=0D
=0D
 .gitlab-ci.d/containers.yml  | 138 +++++++++++++++++++++++---------=0D
 .gitlab-ci.d/crossbuilds.yml |  77 ++++++++++++------=0D
 .gitlab-ci.d/edk2.yml        |   4 +=0D
 .gitlab-ci.d/opensbi.yml     |   4 +=0D
 .gitlab-ci.yml               | 150 +++++++++++++++++++++++++----------=0D
 5 files changed, 274 insertions(+), 99 deletions(-)=0D
=0D
--=20=0D
2.26.2=0D
=0D


