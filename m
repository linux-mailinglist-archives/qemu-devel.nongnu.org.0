Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A6F22FF314
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 19:26:02 +0100 (CET)
Received: from localhost ([::1]:60712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2eef-0001lw-8T
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 13:26:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2edJ-0001Hy-KF
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 13:24:37 -0500
Received: from mail-ot1-f47.google.com ([209.85.210.47]:32878)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2edG-00044W-Sf
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 13:24:37 -0500
Received: by mail-ot1-f47.google.com with SMTP id 63so2556233oty.0
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 10:24:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ahAWvVG6hh+iZCnaziUVgO/3CUCU4/X/5YLVnO6Z2Lo=;
 b=UTkL/7/ye9n94RbAhF+rHI3y0qj/4ICn5xjblnRrDOJjFbzTOu110EQHMWW4UZY3rT
 UsUboZ4AXC/IrpVMVPYRHK+Q0UnOASU+ecG1iLx3BcmSDo9IwZwM89hLHtVWzBSUFhth
 TRQC+Squdlz/yKCHnxogeAozqJFLpN6CueFgjggYGr1rtEC2bDycko7dS/IR7LOE06dU
 BdKxdPGbWu1mAqBfIoXgkrKOmk+IH130ohjE469QXsEhDGQsiwAEA49E30UcrtzuOe0a
 szoAd/zWeUpbSQ0WT9xsrRI+ShcZu3Mg86nwwBvCn4heQovlMuqgEZNwQTtGNYjfoCOh
 +E0A==
X-Gm-Message-State: AOAM532GePk8QIEIvmnP+S1SVpPKzsBLSxa8GVQWkDy1BdbCAS2KBzJN
 VXIhqOl3gM4wvfsyxs2KlHOVqTxnro6JIQGsUR8=
X-Google-Smtp-Source: ABdhPJwXVdnOs5gtc5dEBIIZdJX4XaSL4aJOJis24xXmrbdMfTjlF/RjPYm5jFjGjPQAn+uI3xl8q1WHyn6rYAsFF/E=
X-Received: by 2002:a9d:63cd:: with SMTP id e13mr316902otl.37.1611253473854;
 Thu, 21 Jan 2021 10:24:33 -0800 (PST)
MIME-Version: 1.0
References: <20210121121505.1523156-1-f4bug@amsat.org>
 <59ac8f67-4e8b-f308-1308-497df09a1363@amsat.org>
 <b1c5d4c4-b026-5218-e72f-a1050c10111b@redhat.com>
In-Reply-To: <b1c5d4c4-b026-5218-e72f-a1050c10111b@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Date: Thu, 21 Jan 2021 19:24:23 +0100
Message-ID: <CAAdtpL53irz9=XkMKtqZ7vHVL3Z-qaG70F3kGFLwSpoLj4MOSQ@mail.gmail.com>
Subject: Re: [PATCH] gitlab-ci: Test building linux-user targets on CentOS 7
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=209.85.210.47;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ot1-f47.google.com
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 21, 2021 at 3:01 PM Thomas Huth <thuth@redhat.com> wrote:
> On 21/01/2021 14.14, Philippe Mathieu-Daud=C3=A9 wrote:
> >> +build-user-centos7:
> >> +  <<: *native_build_job_definition
> >> +  variables:
> >> +    IMAGE: centos7
> >> +    CONFIGURE_ARGS: --disable-system --disable-tools --disable-docs
> >> +    MAKE_CHECK_ARGS: check-tcg
>
> Ok ... just be aware of the fact that we might remove it again in some fe=
w
> months, since we then won't support CentOS 7 anymore (RHEL8 has been
> released in May 2019 and according to our support policy we will drop
> support for the previous version two years later, i.e. in May 2021).

I'm not against it, as long as our CI catches the same errors found by
Peter testing
(I suppose Peter will stop testing on his particular machine by May 2021, e=
lse
there is another CI gap).

> > check-tcg calls build-tcg which fails:
> >
> >    BUILD   TCG tests for x86_64-softmmu
> >    BUILD   x86_64-softmmu guest-tests with cc
> > /usr/bin/ld: hello: warning: allocated section `.notes' not in segment
> > /usr/bin/ld: memory: warning: allocated section `.notes' not in segment
> >    BUILD   TCG tests for x86_64-linux-user
> >    BUILD   x86_64-linux-user guest-tests with cc
> > /usr/bin/ld: cannot find -lpthread
> > /usr/bin/ld: cannot find -lc
> > collect2: error: ld returned 1 exit status
> > make[2]: *** [threadcount] Error 1
> > make[1]: *** [cross-build-guest-tests] Error 2
> > make: *** [build-tcg-tests-x86_64-linux-user] Error 2
> >
> > Apparently this is due to the -static flag:
> >
> > $ gcc  -Wall -Werror -O0 -g -fno-strict-aliasing -m64
> > tests/tcg/multiarch/threadcount.c -o threadcount  -static -lpthread
> > /usr/bin/ld: cannot find -lpthread
> > /usr/bin/ld: cannot find -lc
> > collect2: error: ld returned 1 exit status
> >
> > Do we need to install these packages?
> >
> > glibc-static.i686 : C library static libraries for -static linking.
> > glibc-static.x86_64 : C library static libraries for -static linking.
> >
> > Or simply ignore testing?
>
> If testing then succeeds, I think I'd prefer to add the package to the
> docker file.

Yes, tests run fine. Sent a v2.

