Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A71D1300DCC
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 21:34:40 +0100 (CET)
Received: from localhost ([::1]:34026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l338h-0000ZJ-NM
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 15:34:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54752)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l337J-00080v-EF
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:33:13 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:40731)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l337G-0005cM-BZ
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 15:33:13 -0500
Received: by mail-ed1-x52a.google.com with SMTP id h16so8017390edt.7
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 12:33:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=rngSlj4+5NWs6BY75FxxOiHl/c/GsKFbB0AyyMrRSRE=;
 b=yjIjbn+LsQiHbapDNnUUd/0SZPek9duTgUzMJM8Oik1YzEy85jOK2q1oXM4coOCV8W
 ENd4lwNkMsDG6n2mk7kWJ/cfnu3LIZV2zdS6V3ymvcVfIT3r46roceoC86OrmS13xAAC
 QPX/nd56ZEzdFuxjRbSibLGPLJiH4aeLvZobNOHUFG/kQ9dRMmtDtKp4/pFBadb8UlP7
 CJK59TPY+v9566TIzKmvMYs0+vUrjvnuiVTzV2E8b6O1N+G8Qp/E15qI71pPUXGZg7er
 Wo1vGfTP/Mi7RC/iwkzNlhcMZMVEnmYp8va6VX6f8Vg7RKb6Cjufnko5BPb3n94Z/dfo
 LKnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=rngSlj4+5NWs6BY75FxxOiHl/c/GsKFbB0AyyMrRSRE=;
 b=jffhHaUj7LkguTu2W0Dn9X15peK7CBuVZ+YMU04PIcTPDdEcnouRY7NK4n2Vxbfwty
 sLMhG460Rn/LB+TwUij+q89hGKLKVemtwYew7ZgJZgJWCCULJWE/hJqMdUoadVlY6+oo
 GlZ7DykIFUYsPZwtvR/a7mvfT5hqgvU3GiA5nDy+IcsXIi1WAiDp6a64+trg6YsoPT6l
 ZFKnBJivCLB6T0c6ynvIvHVfW6NlwhGX/RAhXquam4feIbdEWMZrONWRP8NrkyZD4Fed
 IMZT2EMFGzAA1vwbk1pJaUZZ8tBv9gejfagYLslvGye1zDCPz/cn4QbW+Y3XkGTYojo1
 FyKw==
X-Gm-Message-State: AOAM532ACoqsaekxOPpAWbJupuwCGL6kN5aNo8hwM2VzJ9jYcsvYE9hJ
 fmc3IflOSE4hJvku1JGZZ/U9IcOE/hALcetYSf4/CW421e/vIg==
X-Google-Smtp-Source: ABdhPJyNqouNcSqjWu8fbZX/3cSmfOoMw5BHCrgCByPvUISr1OgMwiBALX9in4phE7l+9y1BpEw3ocIscRx/Q6qb4p0=
X-Received: by 2002:a05:6402:5107:: with SMTP id
 m7mr808174edd.52.1611347588357; 
 Fri, 22 Jan 2021 12:33:08 -0800 (PST)
MIME-Version: 1.0
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 22 Jan 2021 20:32:57 +0000
Message-ID: <CAFEAcA8=vG-2Vzrdark8VC5NANe5Fb3qGTpSFk8X94KvXszTbA@mail.gmail.com>
Subject: getting the console output for s390 cdrom-test?
To: QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eric Farman <farman@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi; I've been looking at why the s390 cdrom test has an intermittent
failure on my aarch64 box. Looking at some TCG debug log output
I think what is happening is that sometimes execution diverges from
a successful run inside virtio_scsi_setup() and we end up failing
a vs_assert(), which triggers a "Guest crashed on cpu 0: disabled-wait"
which then makes the qtest hang until its timeout.

I think that vs_assert() ought to be printing some information
to the console about which assert fails when it happens, but
how do I need to tweak the qtest to get it to capture this
console log somewhere?

Specifically, the test in question is this one:
QTEST_QEMU_BINARY=qemu-system-s390x
./build/s390/tests/qtest/cdrom-test -p
/s390x/cdrom/boot/without-bootindex

PS: it would be nice if "guest BIOS asserts and puts the
system into a detected-guest-crash state" resulted in the
test failing rather than hanging :-)

(Annoyingly, most of my attempts to get more information about
where things go wrong seem to cause the bug to stop manifesting
itself: eg building the s390-ccw.img without -O2; enabling
TCG 'exec' logging; enabling 'trace:virtio*' tracepoints.
The failure itself started with commit 7a3d37a3f233 updating
the s390 bios blobs, but the changes that went into the new
blobs don't really look like they would be responsible.
I am starting to have gloomy thoughts about potential missing
memory barrier insns between the CPU thread and the iothread
doing the virtio device end of things...)

thanks
-- PMM

