Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0986B69F6C5
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 15:39:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUqG0-0004Hl-Kq; Wed, 22 Feb 2023 09:38:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUqFv-0004Gz-Ik
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:38:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1pUqFt-0001EK-HA
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 09:38:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677076680;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version: content-type:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=BHCKlf3PV6CtjKHsCjL2OqPS7yzNndmmsttjN19Xrmo=;
 b=SXxbkKwGQlPgi7POPM2IR8k7BIUYETcA0kRRxIiZGRtt1vu2weZFefpoBue4oIfMcRcrij
 5NfdjZD0qY7oaJ/WsKbsQo+IUFQYgAEvioD7xgeJeBeR8ktgC2FfQ8+YMi4cPhmu1StY6V
 pGpzIZo8DWIGHXcLsVkhfYJTezkL+X0=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-194-1BtluMgcPAaYMJYMQ6OccA-1; Wed, 22 Feb 2023 09:37:59 -0500
X-MC-Unique: 1BtluMgcPAaYMJYMQ6OccA-1
Received: by mail-ed1-f71.google.com with SMTP id
 r6-20020aa7c146000000b004acd97105ffso11264962edp.19
 for <qemu-devel@nongnu.org>; Wed, 22 Feb 2023 06:37:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BHCKlf3PV6CtjKHsCjL2OqPS7yzNndmmsttjN19Xrmo=;
 b=JSmI/+WDWrJV7rPm6w1jQ/ONnwp2krFqYZziK+Tg2hs9MalJOGDL7oFbwUpkTjNPyn
 McrKJaYrxzHf0Quml/rjS82hEtqRbF2SXyNHv8+dgJtG0eClASQt923rmBwBA9sdZf8s
 bIlFgtuCrTl21gtLHXeQwoYPHotjY8x/dc1LJo/7XhgZgJppbYl9rMJEItd/abRj3Hu/
 M47eSHZwYp0e74rFP2AbOVMnYa0RdR55EvkQfA1O8hHWSOvtsI6LEpIXWgjXRmzWzm77
 Vsxf/54MoRxXet0FVlslk2KFZv1OxCZxYIKNa409hWj80ezuIl+4YC82YYhwnjN/BvFO
 t4Kg==
X-Gm-Message-State: AO0yUKX1w/Ptv6BJHOCUWcBLK1xde8AJskU8F0b+HhQaz/1Gwp2dDckw
 mNjDaFkU4lMrZ3zPJqgOfbNX0/s0nrpi5VCnaGnkGfnpQAcqDBefwo7EUQmlocDmetYYarsZMD9
 4Q0ykUbfHnygL00eXBCs5vrgwtT56l5MUpJF7Q+bwkiuGoGw7XxfYZsWEma9mvPoZDqPaIZQI
X-Received: by 2002:a17:906:3c6:b0:878:78bc:975c with SMTP id
 c6-20020a17090603c600b0087878bc975cmr16881219eja.36.1677076676245; 
 Wed, 22 Feb 2023 06:37:56 -0800 (PST)
X-Google-Smtp-Source: AK7set/1089D37SEH0tYz+gh+4bNSuhv1970Dquqma8XD6thrySudhsxYNcoa/v6HS2wvU9SdJ+zAA==
X-Received: by 2002:a17:906:3c6:b0:878:78bc:975c with SMTP id
 c6-20020a17090603c600b0087878bc975cmr16881194eja.36.1677076675883; 
 Wed, 22 Feb 2023 06:37:55 -0800 (PST)
Received: from avogadro.local ([2001:b07:6468:f312:9af8:e5f5:7516:fa89])
 by smtp.gmail.com with ESMTPSA id
 m12-20020a1709062b8c00b008eabe71429bsm162617ejg.63.2023.02.22.06.37.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Feb 2023 06:37:55 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Cc: jsnow@redhat.com, peter.maydell@linaro.org, thuth@redhat.com,
 alex.bennee@linaro.org, armbru@redhat.com, berrange@redhat.com
Subject: [PATCH v4 0/9] improvement to Python detection,
 preparation for dropping 3.6
Date: Wed, 22 Feb 2023 15:37:42 +0100
Message-Id: <20230222143752.466090-1-pbonzini@redhat.com>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

This is my take on John's patches to improve Python detection and to
prepare for dropping Python 3.6 support.

The main change with respect to John's work is that lcitool is updated
and the container images for CI can install Sphinx via pip; this
way documentation is still built on the CentOS 8 jobs.

A smaller change is that patch "configure: Look for auxiliary Python
installations" will only look at the $PYTHON variable if it is set,
without falling back to a PATH search.

This series includes the final patch to drop support for Python 3.6,
but it makes sense even without it.

Paolo

Supersedes: <20230221012456.2607692-1-jsnow@redhat.com>

John Snow (5):
  python: support pylint 2.16
  python: drop pipenv
  meson: prefer 'sphinx-build' to 'sphinx-build-3'
  configure: Look for auxiliary Python installations
  configure: Add courtesy hint to Python version failure message

Paolo Bonzini (5):
  configure: protect against escaping venv when running Meson
  lcitool: update submodule
  docs/devel: update and clarify lcitool instructions
  ci, docker: update CentOS and OpenSUSE Python to non-EOL versions
  Python: Drop support for Python 3.6

 .gitlab-ci.d/static_checks.yml                |   4 +-
 configure                                     |  82 ++++-
 docs/devel/testing.rst                        |  78 ++--
 docs/meson.build                              |   2 +-
 python/.gitignore                             |   4 +-
 python/Makefile                               |  57 ++-
 python/Pipfile                                |  13 -
 python/Pipfile.lock                           | 347 ------------------
 python/README.rst                             |   3 -
 python/qemu/qmp/protocol.py                   |   2 +-
 python/qemu/qmp/qmp_client.py                 |   2 +-
 python/qemu/utils/qemu_ga_client.py           |   6 +-
 python/setup.cfg                              |  11 +-
 python/tests/minreqs.txt                      |  45 +++
 scripts/qapi/mypy.ini                         |   2 +-
 tests/docker/dockerfiles/alpine.docker        |   2 +-
 tests/docker/dockerfiles/centos8.docker       |  22 +-
 .../dockerfiles/fedora-win32-cross.docker     |   1 +
 .../dockerfiles/fedora-win64-cross.docker     |   1 +
 tests/docker/dockerfiles/opensuse-leap.docker |  22 +-
 tests/docker/dockerfiles/python.docker        |   1 -
 tests/docker/dockerfiles/ubuntu2004.docker    |   2 +-
 tests/lcitool/libvirt-ci                      |   2 +-
 tests/lcitool/mappings.yml                    |  77 ++++
 tests/lcitool/targets/centos-stream-8.yml     |   3 +
 tests/lcitool/targets/opensuse-leap-153.yml   |   3 +
 tests/qemu-iotests/iotests.py                 |   4 +-
 .../tests/migrate-bitmaps-postcopy-test       |   2 +-
 28 files changed, 321 insertions(+), 479 deletions(-)
 delete mode 100644 python/Pipfile
 delete mode 100644 python/Pipfile.lock
 create mode 100644 python/tests/minreqs.txt
 create mode 100644 tests/lcitool/mappings.yml
 create mode 100644 tests/lcitool/targets/centos-stream-8.yml
 create mode 100644 tests/lcitool/targets/opensuse-leap-153.yml

-- 
2.39.1


