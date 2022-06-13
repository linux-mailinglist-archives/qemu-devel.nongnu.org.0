Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EB9154999C
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Jun 2022 19:16:15 +0200 (CEST)
Received: from localhost ([::1]:41790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o0nfi-0003K5-EE
	for lists+qemu-devel@lfdr.de; Mon, 13 Jun 2022 13:16:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o0ncg-0001GZ-RO
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 13:13:06 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:40532)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1o0ncf-0006wJ-BA
 for qemu-devel@nongnu.org; Mon, 13 Jun 2022 13:13:06 -0400
Received: by mail-ed1-x532.google.com with SMTP id w27so8075942edl.7
 for <qemu-devel@nongnu.org>; Mon, 13 Jun 2022 10:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=80K926TpxE+KjPsE/3z8D6ONrprwwDg20c0CZGfkzrE=;
 b=rpdgYhl5B85WtV+TJwsDOCsnv4wm7grnbVkyvjXXrM+KrAXd50/l6VF3DzxB5/9AGt
 KGvnradQnRagWClYVoAKC4Sagxt7T6yivNnpJdtZ4dbNlKtnGcRJhtdEn9Q61ju7TYIF
 f+vLQCUuXEWmoLzLldy7cIV3d53tOSxVSWuEDd5ZdmV0wHuNlD2vTPMgUjci8OFplqeY
 E888vH3CXxbs0BS/ei3fpD86DDFS3sFFRJYBipkwjQCOqXYAIV1lWjIltfOfiSD9oOQu
 LNYcFC8n/TZIpvzRagdn6U64aQyFeAqnWW1Mo91zDscOI8DoUOSNJDuK3WT7IZRBKVdO
 QewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=80K926TpxE+KjPsE/3z8D6ONrprwwDg20c0CZGfkzrE=;
 b=nvtzOgykbQmqFrgKAMmvR7f+TllxvHXdiO/98gxA0pRcdFZzatM9DwQP5win5To7yI
 kynJH/HZhwpzyOCIFJinYpbkUjmsNF49WkwSXnaktyHaD0yuxUS1Nt5E7kPNz/Fofpd3
 QDQ1E6XbfJ0l5xLNFqQnRRUCfeJSEccNJjBvk3IVVqrEuIpgYW7oWLtYZLhDqXbravth
 QS1PuYOTbfNzDWeO3psGxKQNXVWaS/ijoo1ZqBbZTN/1mOoX3DmQmBe3T+KRG0J0J8dl
 qUcyMsSR1LeZ6wO6wpo+gDNlj4wtFjYHDM7SYUy42cWdTIK/9vLNq9vkIsM2UE/4PX6A
 GEaA==
X-Gm-Message-State: AOAM5322WN+a3p77nwkDRE3USodsyl92agucK2I1LfIrFHxuomdqNukh
 tqDE+6fkngNvYm1C/vvwybj34A==
X-Google-Smtp-Source: ABdhPJwjV8pEOxbYkvbQJH6JNn0kIUlD8MdaAIzBMlUonaz2395FNsLwPB1mnXzkCUqWnqw7ed4NkQ==
X-Received: by 2002:a05:6402:2753:b0:431:9c8b:5635 with SMTP id
 z19-20020a056402275300b004319c8b5635mr870220edd.152.1655140384109; 
 Mon, 13 Jun 2022 10:13:04 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id
 22-20020a170906301600b006f52dbc192bsm4063042ejz.37.2022.06.13.10.12.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jun 2022 10:12:59 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 05E301FFB7;
 Mon, 13 Jun 2022 18:12:59 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: fam@euphon.net, berrange@redhat.com, f4bug@amsat.org, aurelien@aurel32.net,
 pbonzini@redhat.com, stefanha@redhat.com, crosa@redhat.com,
 richard.henderson@linaro.org,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH  v1 0/7] testing/next pre-PR (docker, gitlab, tcg)
Date: Mon, 13 Jun 2022 18:12:51 +0100
Message-Id: <20220613171258.1905715-1-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=alex.bennee@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,

Another day, another testing/next series. Mostly this contains a few
hot fixes for docker breakages and other stuff that I picked off the
list. There is a late breaking patch to try and make the aarch64 CI is
little less twitchy. We are still seeing hanging tests on the s390x
box but so far have been unable to track down why it's hanging and
more importantly why we are not seeing the runner kill errant tasks.

As there are hot fixes I'd like to turn around a PR from this soon so
any review of the following is welcome:

 - .gitlab: use less aggressive nproc on our aarch64/32 runners
 - tests/docker: fix the IMAGE for build invocation

Alex Bennée (2):
  tests/docker: fix the IMAGE for build invocation
  .gitlab: use less aggressive nproc on our aarch64/32 runners

Daniel P. Berrangé (1):
  gitlab: compare CIRRUS_nn vars against 'null' not ""

Paolo Bonzini (1):
  tests/tcg: disable xtensa-linux-user again

Richard Henderson (2):
  test/tcg/arm: Use -mfloat-abi=soft for test-armv6m-undef
  tests/tcg/i386: Use explicit suffix on fist insns

Thomas Huth (1):
  gitlab-ci: Fix the build-cfi-aarch64 and build-cfi-ppc64-s390x jobs

 configure                                     |  5 +++-
 tests/tcg/i386/test-i386-fp-exceptions.c      | 24 +++++++++----------
 tests/tcg/i386/test-i386.c                    |  2 +-
 .gitlab-ci.d/base.yml                         |  2 +-
 .gitlab-ci.d/buildtest.yml                    | 22 ++++++++---------
 .../custom-runners/ubuntu-20.04-aarch32.yml   |  4 ++--
 .../custom-runners/ubuntu-20.04-aarch64.yml   | 24 +++++++++----------
 tests/docker/Makefile.include                 |  2 +-
 tests/tcg/arm/Makefile.softmmu-target         |  2 +-
 9 files changed, 44 insertions(+), 43 deletions(-)

-- 
2.30.2


