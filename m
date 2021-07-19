Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 187D03CEB33
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 20:58:12 +0200 (CEST)
Received: from localhost ([::1]:48176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5YSx-0002K6-4X
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 14:58:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5YRn-0001eI-GT
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 14:56:59 -0400
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e]:41503)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m5YRl-00058O-Oo
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 14:56:59 -0400
Received: by mail-ej1-x62e.google.com with SMTP id go30so30426675ejc.8
 for <qemu-devel@nongnu.org>; Mon, 19 Jul 2021 11:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9Kn1rqbNYIuqXI9T8tz4U5Lt0I5DpOP1ThmMukHwGYc=;
 b=xTep5LUpHMXYNJqPxeAbMgjiX9LBhpKzYk3fb5WO3fy7SF9dbVfQrc5Q8cv51bxIK8
 ivPdsTZ5qxmM9nAJ71f+WxebByLzS8c6VKN4g51Am1WY8QilWHt6B/EbMogxDFuXu/KG
 XNo3sBtQFsauOJNcOi0cDfr08968xhiB7sx7wrtMLWRO5cYaS4BGpcKjq1NS6hBkVsoI
 p5OAOYx9lyjIAcFX8RoJXJ4P8/1Zbv5QecxUYApGvzXyfjYH0CI7cwHBGF1irbH7rMg2
 /7csTZKrToYhRAQglr1fSx9gh730RqjuXyZMwiPDSDRXvq0zJqzVZbKOi0/ofzDEugit
 +QaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9Kn1rqbNYIuqXI9T8tz4U5Lt0I5DpOP1ThmMukHwGYc=;
 b=fA+ipvdsFG6h1di8GtLm/CtGNegCid9wYCQ4JxZJsCbjw7vzXkpJY+jnl8OShsJkdM
 eiO3OTHdOMaHXFp5bFzFegjbY0lVYG4w1+FnbqGZMotuA0DPHECX5BStB3WLZjOQ0BMW
 qF26LQSUWXENmgtGy9GFZFJIFOXEj+254Tp7uZdJ0fLlbh71JsdOsckr8RXNC7+GIPce
 DQ9MHFlPyPw78ZfpRE1usW/2bWZWHzHeGvl7ucQzsdMCObzv7RUYTMddHk9EuafYRqRI
 s4Bpuw99aNwxVohrPmCmMxlQ2PrqN+1ASbOeP6yGob03aBRwpNzsNTXhLzgjTHtYBlYr
 MpkA==
X-Gm-Message-State: AOAM532SC025wkLZD2ByYreH5Ou5vqbs18PEIAFRQdYQdcfQGOD7AbVH
 REF8WlFda568xyliGZz7Ee/usZlE4mOvhhTPxQ2cDUbzZRVLsw==
X-Google-Smtp-Source: ABdhPJyh39xQhKibdYc26JjuZfWPLZTmDYiHCBkuUjm5P0z/6zIDfB8+Lt0SiERZyRMxzmNjWappud5g6FqS0Agga5o=
X-Received: by 2002:a17:906:a2d7:: with SMTP id
 by23mr28176218ejb.382.1626721015991; 
 Mon, 19 Jul 2021 11:56:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA_byx5rCR7Y+yJrZ=K8oifdYEAza041W4yyA+wJkDpn6w@mail.gmail.com>
In-Reply-To: <CAFEAcA_byx5rCR7Y+yJrZ=K8oifdYEAza041W4yyA+wJkDpn6w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jul 2021 19:56:15 +0100
Message-ID: <CAFEAcA-VYiFo4aiuOSnenObaLt5Y87dUdO1=amUm+j=2-EnSag@mail.gmail.com>
Subject: Re: random crash in migration-test, i386 guest, x86-64 host:
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62e.google.com
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
Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 19 Jul 2021 at 13:43, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Random crash in migration-tests:
>
> MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
> QTEST_QEMU_IMG=./qemu-img G_TEST_DBUS_DAEMON=/mnt/nvmedisk/linaro/qem
> u-for-merges/tests/dbus-vmstate-daemon.sh
> QTEST_QEMU_BINARY=./qemu-system-i386
> QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qemu-
> storage-daemon tests/qtest/migration-test --tap -k
> PASS 1 qtest-i386/migration-test /i386/migration/bad_dest
> PASS 2 qtest-i386/migration-test /i386/migration/fd_proto
> PASS 3 qtest-i386/migration-test /i386/migration/validate_uuid
> PASS 4 qtest-i386/migration-test /i386/migration/validate_uuid_error
> PASS 5 qtest-i386/migration-test /i386/migration/validate_uuid_src_not_set
> PASS 6 qtest-i386/migration-test /i386/migration/validate_uuid_dst_not_set
> PASS 7 qtest-i386/migration-test /i386/migration/auto_converge
> PASS 8 qtest-i386/migration-test /i386/migration/postcopy/unix
> Broken pipe
> ../../tests/qtest/libqtest.c:166: kill_qemu() detected QEMU death from
> signal 6 (Aborted) (core dumped)
> ERROR qtest-i386/migration-test - too few tests run (expected 15, got 8)
> Makefile.mtest:280: recipe for target 'run-test-33' failed
> make: *** [run-test-33] Error 1

And again, different guest architecture, still x86-64 host:

MALLOC_PERTURB_=${MALLOC_PERTURB_:-$(( ${RANDOM:-0} % 255 + 1))}
QTEST_QEMU_IMG=./qemu-img G_TEST_DBUS_DAEMON=/mnt/nvmedisk/linaro/qem
u-for-merges/tests/dbus-vmstate-daemon.sh
QTEST_QEMU_BINARY=./qemu-system-aarch64
QTEST_QEMU_STORAGE_DAEMON_BINARY=./storage-daemon/qe
mu-storage-daemon tests/qtest/migration-test --tap -k
PASS 1 qtest-aarch64/migration-test /aarch64/migration/bad_dest
PASS 2 qtest-aarch64/migration-test /aarch64/migration/fd_proto
PASS 3 qtest-aarch64/migration-test /aarch64/migration/validate_uuid
PASS 4 qtest-aarch64/migration-test /aarch64/migration/validate_uuid_error
PASS 5 qtest-aarch64/migration-test /aarch64/migration/validate_uuid_src_not_set
PASS 6 qtest-aarch64/migration-test /aarch64/migration/validate_uuid_dst_not_set
PASS 7 qtest-aarch64/migration-test /aarch64/migration/auto_converge
PASS 8 qtest-aarch64/migration-test /aarch64/migration/postcopy/unix
Broken pipe
../../tests/qtest/libqtest.c:166: kill_qemu() detected QEMU death from
signal 6 (Aborted) (core dumped)
ERROR qtest-aarch64/migration-test - too few tests run (expected 15, got 8)
Makefile.mtest:264: recipe for target 'run-test-31' failed

-- PMM

