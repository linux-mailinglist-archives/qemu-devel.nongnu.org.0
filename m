Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD3E6664E8A
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 23:12:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFMpr-0006G5-FE; Tue, 10 Jan 2023 17:11:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFMpk-0006Ei-UL
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 17:11:04 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFMpj-0006Gw-Du
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 17:11:04 -0500
Received: by mail-pj1-x1031.google.com with SMTP id
 o7-20020a17090a0a0700b00226c9b82c3aso15054896pjo.3
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 14:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6lj0Vel8aEPc8opR519t09LYxxVN6CUFEjFMuM/h/mM=;
 b=dJqtB3gCVQ0o+myqQuOKxG/eMCFopUVjGramrYdytB2cIPGswxh7cMLQttWRzLu4UL
 VOIEneGpdObG0GJq09/Dg2h1eiqzO3BqrT4TM0+dRxkPRsKDf4B79ahtEQjhVjMNwYxc
 V8LDzMgCAPnuQVFXzZSwEsmilnIwVYAbzl1Gogr04KoIYyckoj2KIv9qatmg/eJ8hjoU
 WF9C53pzqEpyq4eNdUapzsO4xVNvsv309QxQnizAuc3sZj3qoOqQugR9US+CMKBjCKHQ
 3bJ3slXE8pt8OQAvxEbJxlb27Y3l8K9InupFNZ1hKk7cA/e7YtjcAdQayzfS+XIP+L9s
 q5sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6lj0Vel8aEPc8opR519t09LYxxVN6CUFEjFMuM/h/mM=;
 b=rV2O3s73f3cY/6dVg/dxsYRIjr1GvxMpew2dESFkU+BXgkVIp7gR2wV4O35MTqQAJH
 8j3JhXIyYvZoIDwNhTefUCB1ZRsc+MQNz097VB4Yfr9z/wwVLvW/gJOx5XfkQvqsI3QM
 aVMNoelpEvg5X/GKjDQIQtnB3ca0jmVNTVi1ZDVHXqDx/ImvHm2/1v6NkY8W3mxbh+d7
 FfDxd99S9YdBD89dIX9YFZKiJ7s7TfGcPeGX+3n7F459OLTs9uh6OKz182zYrA9/R4U+
 bOCTt1/otmM+ASpo33O/c6Lks4a7ZAujUvIHILV+ZzxC/Q8sOMcaeyuv1ksS5dOwohRx
 Gl7g==
X-Gm-Message-State: AFqh2kqdhzUqmnu4UoFMLcnl/Dd8nfHelj67si0CKpGPMXn9utfLI+4T
 z1npExUAdkoCKptx0iar5bY+dUpJMwOnwdk1sYp+eA==
X-Google-Smtp-Source: AMrXdXuTics/aqk0Rg87u4viOJxOrPEKr5tDrwQeTXJbV/5nCYYcuyWXTx2EJxquGJlXnePuqxqEwqT54nkDgkh6s60=
X-Received: by 2002:a17:90b:30ce:b0:228:dac2:3704 with SMTP id
 hi14-20020a17090b30ce00b00228dac23704mr229934pjb.221.1673388662005; Tue, 10
 Jan 2023 14:11:02 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA-f39VfWEwb-zRabjVoO-XQ-0V=iCFu1PVjg7eYChszbA@mail.gmail.com>
 <32c53c77-5827-7839-94a1-73003bc3f8af@linux.ibm.com>
 <CAFEAcA8Er1f=KzsOhBeMgt2+8-sTua6mQU_708fjRSSrzNu+CA@mail.gmail.com>
 <Y727pJsNNajB77A7@redhat.com>
In-Reply-To: <Y727pJsNNajB77A7@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Jan 2023 22:10:50 +0000
Message-ID: <CAFEAcA9Q1GTq+zJXEn2w7u-d28L1G0J-HomHakmwfbERrwpcrg@mail.gmail.com>
Subject: Re: intermittent hang, s390x host, bios-tables-test test, TPM
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Stefan Berger <stefanb@linux.ibm.com>,
 QEMU Developers <qemu-devel@nongnu.org>, 
 Eric Auger <eric.auger@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x1031.google.com
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

On Tue, 10 Jan 2023 at 19:25, Daniel P. Berrang=C3=A9 <berrange@redhat.com>=
 wrote:
>
> On Fri, Jan 06, 2023 at 03:39:31PM +0000, Peter Maydell wrote:
> > Yeah. It would be good if we didn't deadlock without printing
> > the assertion, though...
> >
> > I guess we could improve qtest_kill_qemu() so it doesn't wait
> > indefinitely for QEMU to exit but instead sends a SIGKILL 20
> > seconds after the SIGTERM. (Annoyingly, there is no convenient
> > "waitpid but with a timeout" function...)
>
> We don't need to touch that. Instead the tpm-emu.c file needs to
> call  qtest_add_abrt_handler() passing a callback that will invoke
> qio_channel_close on its end of the socket. This will cause the
> QEMU process to get EOF on the other end of the socket. It then
> won't be stuck holding the iothread lock, and will be able to
> respond to SIGTERM.

That sounds straightforward and will fix this specific case
of "the QEMU process didn't exit on SIGTERM", but it would
be nice more generally if the test harness did not sit there
forever without printing the assertion in this situation.
"QEMU got permanently stuck" is something that can happen
in more than on way, after all...

thanks
-- PMM

