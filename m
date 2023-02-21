Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B937F69E3ED
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 16:49:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUUsK-0006yG-Cv; Tue, 21 Feb 2023 10:48:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUUrb-0006p6-Mh
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 10:47:33 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pUUrY-0003iK-Q9
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 10:47:31 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 b14-20020a17090a8c8e00b002349579949aso5093467pjo.5
 for <qemu-devel@nongnu.org>; Tue, 21 Feb 2023 07:47:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JV2y5+mqnSKIIdu+tPv9MovCuyubuG41QSrmwA0ko6Q=;
 b=G8sUWfXtsPzblUzAs7epuwDMqXxn7ysPUtjMVc79qehzGjDdvt74rdNmXV8rADnVWm
 dWJz5CCZttKdDH9tARydSUuFaNae3cOr80YR2JoiAXrq0kqQ35bYNiY+VrDVSVhElc39
 YgJ7aywyvlo7l2MmabT28R5I0U++ZP1P8B5UsDclEduo33pgRy8KvTMiv9GfndWAboS5
 wpOaxryK2EyflbLUiv3U8EiLZsovo0e7SJHEqUM1c/QS30k0zFM4oe/TcphThi3qd9Ct
 DhHGeEn63uO15rllNPlX7y4qaoMWsWyYsjjnKJJO+Z90sP2ECzHLPmReihH0tbhpxX83
 Xjzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JV2y5+mqnSKIIdu+tPv9MovCuyubuG41QSrmwA0ko6Q=;
 b=GmSWONC6JjmMZl94d1yMO06sOdKs7/+NJrF2Gq5qb15vE3wdmPg9CiZ+wNSOAceXPI
 zUIChHNyc7l30i3Q2lAfIxfqqpNngg8X9xtiQCXMXRQ5/vbyLhKeACSSUwKPyM7a1Uwm
 GaR/9dBL6G3/YJlHeUy+4D0MFtLi5hG3PbFWBlQTjFblkYLYtV9aiXCZ3QI3HbKUGFMS
 4008vVCdoBucqwiFpm/znCMTqSrRhp3xk2XiGnLax3j4xFw1Z8Av+FiKUzzyw6hS30LR
 +BeRj0nLkrlZCofqr3Ka1PxjFsUJBeHOJZftCmjX9PUpCdS8I8OVZBb76PlTTsUMbIBV
 qvAA==
X-Gm-Message-State: AO0yUKXUdLcBUVR7p1w0Dyzuu8p57mxNn3RHojFxAjub7o1mrjpMhkEO
 VUpJjeMcTaXHr7qZky2+tFlAr8fzGtHXbkQVq0GPtQ==
X-Google-Smtp-Source: AK7set+5DxCGBNpu981tXwxnrC3fWwmcWLH0HePftbPNOX5on2MVNmHnh99UjKB6dk8R1Kx6Gs2KsZI9QVqatm+/Wpk=
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr1846453pjb.92.1676994442890; Tue, 21
 Feb 2023 07:47:22 -0800 (PST)
MIME-Version: 1.0
References: <20230221132726.2892383-1-peter.maydell@linaro.org>
 <Y/Thas4efx14JsBi@work-vm>
 <CAFEAcA9=p0XYti45m0sW+iO9qgF9iXpeOPvHd7Xpy32yCUL3sw@mail.gmail.com>
 <Y/TlB36EjrWwr2ne@work-vm>
In-Reply-To: <Y/TlB36EjrWwr2ne@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Feb 2023 15:47:11 +0000
Message-ID: <CAFEAcA-U5vFN2zaHbXto7xDO76=vwynquXyFdbBpDWps0ziu_A@mail.gmail.com>
Subject: Re: [PATCH] tests: Disable migration-test
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Juan Quintela <quintela@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Tue, 21 Feb 2023 at 15:36, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Peter Maydell (peter.maydell@linaro.org) wrote:
> > On Tue, 21 Feb 2023 at 15:21, Dr. David Alan Gilbert
> > <dgilbert@redhat.com> wrote:
> > > Damn this is really going to impact the stability of migration if we
> > > don't regularly test.
> > > But fundamentally, I've never been able to debug much of the reports
> > > that come from flakyness in gitlab ci; we're not getting the most basic
> > > information like which subtest or where we're upto in the test which
> > > makes it very very hard to debug.
> >
> > Right, but if you want more information you need to change the
> > tests and/or test harness to provide it.
>
> I don't think the migration test is doing anything odd in that respect;
> We've just got a bunch of qtest tests; having a test framework which
> doesn't tell you which test failed is very difficult.

In the specific case here of the FreeBSD job it does, though
you have to search backwards for 'migration' to find it:
https://gitlab.com/qemu-project/qemu/-/jobs/3806090216

It prints
ok 23 /aarch64/migration/multifd/tcp/plain/none
# starting QEMU: exec ./qemu-system-aarch64 -qtest
unix:/tmp/qtest-32469.sock -qtest-log /dev/null -chardev
socket,path=/tmp/qtest-32469.qmp,id=char0 -mon
chardev=char0,mode=control -display none -accel kvm -accel tcg
-machine virt,gic-version=max -name source,debug-threads=on -m 150M
-serial file:/tmp/migration-test-2A1201/src_serial -cpu max -kernel
/tmp/migration-test-2A1201/bootsect 2>/dev/null -accel qtest
# starting QEMU: exec ./qemu-system-aarch64 -qtest
unix:/tmp/qtest-32469.sock -qtest-log /dev/null -chardev
socket,path=/tmp/qtest-32469.qmp,id=char0 -mon
chardev=char0,mode=control -display none -accel kvm -accel tcg
-machine virt,gic-version=max -name target,debug-threads=on -m 150M
-serial file:/tmp/migration-test-2A1201/dest_serial -incoming defer
-cpu max -kernel /tmp/migration-test-2A1201/bootsect 2>/dev/null
-accel qtest
# starting QEMU: exec ./qemu-system-aarch64 -qtest
unix:/tmp/qtest-32469.sock -qtest-log /dev/null -chardev
socket,path=/tmp/qtest-32469.qmp,id=char0 -mon
chardev=char0,mode=control -display none -accel kvm -accel tcg
-machine virt,gic-version=max -name target,debug-threads=on -m 150M
-serial file:/tmp/migration-test-2A1201/dest_serial -incoming defer
-cpu max -kernel /tmp/migration-test-2A1201/bootsect -accel qtest
Bail out! ERROR:../tests/qtest/migration-helpers.c:205:wait_for_migration_status:
assertion failed: (g_test_timer_elapsed() <
MIGRATION_STATUS_WAIT_TIMEOUT)

so it has successfully run tests up to 23, and then
crashed on test 24 (which will be
migration/multifd/tcp/plain/cancel).

The test framework also collects and logs any information
the test case wants to print to stderr -- the reason
there is no information there other than the assertion
message is because that's the only thing the test emits.

The local macos test log I have here also shows it failing
on test 24.

The macos tests are easy to provoke failures here during
'make check', it happens at least 1 time in 2. So if you
want to write a patch to print out more information to
the test log I'm happy to run it and collect the output.

thanks
-- PMM

