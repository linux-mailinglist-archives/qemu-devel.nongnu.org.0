Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2563534805F
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 19:22:59 +0100 (CET)
Received: from localhost ([::1]:34754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP89h-0000v5-Pb
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 14:22:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lP7tB-0002Vm-8K
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:05:54 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:43981)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lP7t3-0005QZ-1N
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:05:52 -0400
Received: by mail-ej1-x631.google.com with SMTP id l4so34391410ejc.10
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 11:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Fihq8X7fJCeaNCkxSDgAf3PKHl9J1g+Hg1DHJzmwBcc=;
 b=LB9iol1ooYjUpdvIgJH/QSzwIo3PKFeyuR+WnlI+Is0MHGGBH0ESJWwusPcJRsZAH3
 CD2XRk8lYxtlBxdFya86+8XxY5A6QDcgftqd2/FhRhT0CqRhHFBhxmRf/q3WpiFr8+wC
 4UPhWGfKZygvjPt7C1W4wq40oA3qcv+ABbqdgOffgO9U7tLYYqepPZZSZiTLj296E8yd
 Nwgu0d+MMmcX0RHiQRixls08iogEZ2pOpqYaLDDkQkuEx6xrawYuKpEfXBvVns7zCO1I
 D037msr+jbfQBljOfkqWXKn1DN+r1srn4ZgINl6Q8bKzoBG0GqtGF0/bZ9CVIGQu7OwV
 KlbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Fihq8X7fJCeaNCkxSDgAf3PKHl9J1g+Hg1DHJzmwBcc=;
 b=n40bNmWw51hhuiyd1XpE1+riYkixZMw8OsOtY1qt7GbDWtHs0mtykVcCFDx05ujhRQ
 Z0zdsP94eUVypSLNQDS/vM2fWtxQzInR9hIiD7JMTo+lhaoQmwV45TNUBe0PIVvJJpUy
 KHiq1G2q447hilWNHsfpCFqgqFvhN4N1eu6It+yElvKsDDIwliD0QinGlsZSlS9AKCVH
 k2t7EfPu0bOWFhHGVRG2be6yMLHfQChTGQ2/k9BgY3eL9tvkKqZDvveonNMGGAeGN6a5
 DL5gPuRQoVMzs3rvSrxrulIahekvoOdlALhEICNIjZUR/Muw/1LW05nhq/1LT9uFJELV
 LotA==
X-Gm-Message-State: AOAM533WJzeLEi1REuk/faT6zQ4ACdZ0S5G5nmL6s6U6sLr+lvnXzF1u
 xzIR4kvMFxrd/Fh99hXtI9EwWpKp9mUf5q25f+2AUIKwmDnym518
X-Google-Smtp-Source: ABdhPJwF9Xl64s83p2QirAOu3hfAYO8agwBjq5A6b5Myf/aT5gfjgf2Wehu4IkepP1N5XLcp8zDPjbm0HqvE/Ri/1LM=
X-Received: by 2002:a17:906:1dd3:: with SMTP id
 v19mr5078186ejh.4.1616609142602; 
 Wed, 24 Mar 2021 11:05:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210324145202.430759-1-stefanha@redhat.com>
In-Reply-To: <20210324145202.430759-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 24 Mar 2021 18:05:12 +0000
Message-ID: <CAFEAcA_NeCGj0oaQ8GZhxJFLzqDoL+xi1vzL8rGKata8QbNv=Q@mail.gmail.com>
Subject: Re: [PULL 0/2] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, John Snow <jsnow@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 24 Mar 2021 at 14:52, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit 67c1115edd98f388ca89dd38322ea3fadf034523:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/ui-20210323-pull-request' into staging (2021-03-23 23:47:30 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
>
> for you to fetch changes up to 3460fd7f3959d1fa7bcc255796844aa261c805a4:
>
>   migrate-bitmaps-postcopy-test: check that we can't remove in-flight bitmaps (2021-03-24 13:41:19 +0000)
>
> ----------------------------------------------------------------
> Pull request
>
> This dirty bitmap fix solves a crash that can be triggered in the destination
> QEMU process during live migration.
>
> ----------------------------------------------------------------
>
> Vladimir Sementsov-Ogievskiy (2):
>   migration/block-dirty-bitmap: make incoming disabled bitmaps busy
>   migrate-bitmaps-postcopy-test: check that we can't remove in-flight
>     bitmaps

This failed the 'qsd-jobs' iotest on s390x:


  TEST   iotest-qcow2: 309
  TEST   iotest-qcow2: 313
  TEST   iotest-qcow2: qsd-jobs [fail]
QEMU          --
"/home/ubuntu/qemu/build/all/tests/qemu-iotests/../../qemu-system-s390x"
-nodefaults -display none -accel qtest
QEMU_IMG      -- "/home/ubuntu/qemu/build/all/tests/qemu-iotests/../../qemu-img"
QEMU_IO       --
"/home/ubuntu/qemu/build/all/tests/qemu-iotests/../../qemu-io" --cache
writeback --aio threads -f qcow2
QEMU_NBD      -- "/home/ubuntu/qemu/build/all/tests/qemu-iotests/../../qemu-nbd"
IMGFMT        -- qcow2
IMGPROTO      -- file
PLATFORM      -- Linux/s390x qemu01 4.15.0-132-generic
TEST_DIR      -- /home/ubuntu/qemu/build/all/tests/qemu-iotests/scratch
SOCK_DIR      -- /tmp/tmp807j_qyh
SOCKET_SCM_HELPER --
/home/ubuntu/qemu/build/all/tests/qemu-iotests/socket_scm_helper
--- /home/ubuntu/qemu/tests/qemu-iotests/tests/qsd-jobs.out
+++ qsd-jobs.out.bad
@@ -9,11 +9,11 @@
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
"event": "JOB_STATUS_CHANGE", "data": {"status": "created", "id":
"job0"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
"event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id":
"job0"}}
 {"return": {}}
+{"return": {}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
"event": "JOB_STATUS_CHANGE", "data": {"status": "paused", "id":
"job0"}}
+{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
"event": "JOB_STATUS_CHANGE", "data": {"status": "running", "id":
"job0"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
"event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id":
"job0"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
"event": "BLOCK_JOB_READY", "data": {"device": "job0", "len": 0,
"offset": 0, "speed": 0, "type": "commit"}}
-{"return": {}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
"event": "JOB_STATUS_CHANGE", "data": {"status": "standby", "id":
"job0"}}
-{"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
"event": "JOB_STATUS_CHANGE", "data": {"status": "ready", "id":
"job0"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
"event": "JOB_STATUS_CHANGE", "data": {"status": "waiting", "id":
"job0"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
"event": "JOB_STATUS_CHANGE", "data": {"status": "pending", "id":
"job0"}}
 {"timestamp": {"seconds":  TIMESTAMP, "microseconds":  TIMESTAMP},
"event": "BLOCK_JOB_COMPLETED", "data": {"device": "job0", "len": 0,
"offset": 0, "speed": 0, "type": "commit"}}
Not run: 172 186 192 220 287
Failures: qsd-jobs
Failed 1 of 118 iotests

thanks
-- PMM

