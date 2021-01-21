Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 245212FF309
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 19:22:14 +0100 (CET)
Received: from localhost ([::1]:56192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2eay-00088r-LF
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 13:22:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2eZu-0007cu-Ka
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 13:21:06 -0500
Received: from mail-oo1-f43.google.com ([209.85.161.43]:34533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2eZt-0002Co-3t
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 13:21:06 -0500
Received: by mail-oo1-f43.google.com with SMTP id x23so746574oop.1
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 10:21:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=KP1WYXWlmSGuy4dqVpRqjvGld4o3Qzo/HQ5aVihvHmY=;
 b=S5wl0HIgRCb1URuJJqQCzEQQpP9M5BAYwZLfvESTEjS5Zw94LvtTxmq08qEIoPJzN5
 qDNRt9Po9xEig+IBk5IvRM5mtYb2SV+ETYQBk1aHOC89eN75uuM9oskV2YOVf78rfLbB
 G6IEhK9at98AT+11lG8t9UqFKegWqoDxjMdVg77F3F7PscvY8lpHK6UAg7WJeUyVWAet
 vPPFQVsEC+SOcaDHzrQD1mwJ2WdIf5aBANKLm1RgNm56vIPiXxOw+WlzKajWb65txpCG
 R1Cpo/bUvmRrUAiXcy/8vg9FYCgDhUjbnKRsyzlH2A8MwV53JVAdRFmBhjadlU6vUpnu
 iviA==
X-Gm-Message-State: AOAM533wbiGgc5ZyFknRkP+NZv604bKfdaelZW2ffSRilwG3QLkVmrQq
 PkmCfvG2DE0/buiuSp115hSxPazySD84o0LP/Lo=
X-Google-Smtp-Source: ABdhPJw4Bw9UEY5vEOcP9mpZyIOzhki2tGHw1mnmn34F/I1OXVAJR/nnX3M8jfog9AOHlvfaRnCCg3niU6azNKuYKpw=
X-Received: by 2002:a4a:c692:: with SMTP id m18mr682792ooq.59.1611253263924;
 Thu, 21 Jan 2021 10:21:03 -0800 (PST)
MIME-Version: 1.0
References: <20210121172829.1643620-1-f4bug@amsat.org>
 <20210121172829.1643620-3-f4bug@amsat.org>
 <88c1ddbd-d93d-01e4-abfa-78b395ac4d36@redhat.com>
In-Reply-To: <88c1ddbd-d93d-01e4-abfa-78b395ac4d36@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Thu, 21 Jan 2021 19:20:52 +0100
Message-ID: <CAAdtpL66OP4WdKT--wzvWswPeeDmJVESU4qxjWrMUpbQWjbeCQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] gitlab-ci: Test building linux-user targets on
 CentOS 7
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.161.43;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-oo1-f43.google.com
X-Spam_score_int: -13
X-Spam_score: -1.4
X-Spam_bar: -
X-Spam_report: (-1.4 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 21, 2021 at 6:45 PM Wainer dos Santos Moschetta
<wainersm@redhat.com> wrote:
> On 1/21/21 2:28 PM, Philippe Mathieu-Daud=C3=A9 wrote:
> > Add a configuration tested by Peter Maydell (see [1] and [2])
> > but not covered in our CI [3]:
> >
> >    [705/2910] Compiling C object libqemu-arm-linux-user.fa.p/linux-user=
_strace.c.o
> >    FAILED: libqemu-arm-linux-user.fa.p/linux-user_strace.c.o
> >    ../linux-user/strace.c: In function 'do_print_sockopt':
> >    ../linux-user/strace.c:2831:14: error: 'IPV6_ADDR_PREFERENCES' undec=
lared (first use in this function)
> >             case IPV6_ADDR_PREFERENCES:
>
> Why the following builder did not catch that issue?
>
> build-user:
>    <<: *native_build_job_definition
>    variables:
>      IMAGE: debian-all-test-cross
>      CONFIGURE_ARGS: --disable-tools --disable-system
>      MAKE_CHECK_ARGS: check-tcg

It uses a different base image, debian-all-test-cross, which is based
on Debian 10.

Packages are more recent than CentOS 7.
QEMU aims to support the 2 latest releases from major distribs.
CentOS 7 is likely the oldest.

