Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CE5C5EC952
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 18:22:35 +0200 (CEST)
Received: from localhost ([::1]:51218 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odDLu-0006Aa-AY
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 12:22:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1odBqf-0001V9-3K
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:46:13 -0400
Received: from mail-qk1-x72f.google.com ([2607:f8b0:4864:20::72f]:39504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1odBjM-0001ZW-QS
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 10:38:42 -0400
Received: by mail-qk1-x72f.google.com with SMTP id x18so6131924qkn.6
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 07:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date;
 bh=491pAsyjKKkfSAm8Vy1d1JF5ozmU0Ydi/yxKnx1tRn4=;
 b=H4EeVucMqu83ksvXrVa31vxhEInwVV16uxTPWZBb+yQdwtQKJaNxikIlCvfJP/jXwC
 NOV7HSAmEiFML1QQCHuoYphnnUW3/AHJIx4aX6oVCo7b/rQMtXhug0KJ3mDYXeKKZ5Ek
 bLDmoeAJtQNWHYptglWX4YoZZNk3ENBRBRrjvBrxpSe82iRP0CyUJnUG4ORTe6rdzkgC
 uwQ1nVlV0F2QsgIfLGxXv5aae4zIqykrk0fqJ3XfSJZJ1k0rqQ/N6pGDW1R3EEFZRpGd
 OitOwkUZWEho6dhEDC9BtVjkx8NkHC9imQ3SAUKObICsN8sJIB7xE4AqmYCxPiXBKQ0v
 97dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date;
 bh=491pAsyjKKkfSAm8Vy1d1JF5ozmU0Ydi/yxKnx1tRn4=;
 b=EtvmRrRkoxZ08wzmnNVpDQSXIhnIxOEP2lYoXPlY/TftlnF/ef8nuHfcsVH0AbW6xV
 jjsRPLrGdMdFi+KoJJ5APbzH5md1ucsjqK0aaPIbjWsuBf55rAH/8K/L3bd3Q5/7K/I2
 zuFn7n7A5YhcN2r1BuXV1aLjWBy2ucJKq9mYRTeYqblrdmHwgajxXRl+J+ggDxR/6Xxy
 NfK3wL1HZA4U5r2gm8mOkjSSM8SKDD73MyhsxkCeiIqV73LVu0Y2vdmwwcawYr1UoEdw
 vL3xxxkHs3/JPfL1+98R3DYMBjpbk2lXEJ4QAJXlZyjC++FxrHfvbJa31tIXMZDYqDz2
 nvDw==
X-Gm-Message-State: ACrzQf3hwR6Ckxe7N5N51WxryJ6j1bc/m64rrWGyAM3iZzn5X7buUjZf
 qyd6I3dOSTxd0q/XdVbnGKkACDQ51uMNWCkVPGQ=
X-Google-Smtp-Source: AMsMyM4cs5kicScIa7aLN0sUNtktPdS/4ImoTk3yuEzXsj2J/nQkkRSFlmkYllFS7D3L4WNGACaEMzdVn9rvzazxKQ4=
X-Received: by 2002:a05:620a:19a5:b0:6cf:4a24:cccb with SMTP id
 bm37-20020a05620a19a500b006cf4a24cccbmr18059184qkb.376.1664289516012; Tue, 27
 Sep 2022 07:38:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220927110632.1973965-1-bmeng.cn@gmail.com>
 <20220927110632.1973965-51-bmeng.cn@gmail.com>
 <CAMxuvazWXg+qpNvhR6bDcS5XwrDN_2zd-6KDmQvGS7TPa+hTNA@mail.gmail.com>
In-Reply-To: <CAMxuvazWXg+qpNvhR6bDcS5XwrDN_2zd-6KDmQvGS7TPa+hTNA@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 27 Sep 2022 22:38:24 +0800
Message-ID: <CAEUhbmUjgt7WnYFmxiN2JmitOxa9fCYs7A8dPWou81dANJRMAw@mail.gmail.com>
Subject: Re: [PATCH v4 50/54] tests/qtest: migration-test: Skip running some
 TLS cases for win32
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Cc: "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Thomas Huth <thuth@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, 
 Juan Quintela <quintela@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::72f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Sep 27, 2022 at 10:33 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> On Tue, Sep 27, 2022 at 3:09 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > Some migration test cases use TLS to communicate, but they fail on
> > Windows with the following error messages:
> >
> >   qemu-system-x86_64: TLS handshake failed: Insufficient credentials fo=
r that request.
> >   qemu-system-x86_64: TLS handshake failed: Error in the pull function.
> >   query-migrate shows failed migration: TLS handshake failed: Error in =
the pull function.
> >
> > Disable them temporarily.
> >
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> > I am not familar with the gnutls and simply enabling the gnutls debug
> > output does not give me an immedidate hint on why it's failing on
> > Windows. Disable these cases for now until someone or maintainers
> > who may want to test this on Windows.
> >
> > (no changes since v1)
>
> Please use g_test_skip() instead of #if blocks.
>

Is there a QEMU API to detect OS?

Regards,
Bin

