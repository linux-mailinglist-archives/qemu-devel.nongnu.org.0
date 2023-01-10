Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C828266452C
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 16:45:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFFD2-0005uz-Li; Tue, 10 Jan 2023 09:02:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFFCz-0005tv-E5
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 09:02:33 -0500
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pFFCx-0003jX-Mn
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 09:02:33 -0500
Received: by mail-pg1-x52f.google.com with SMTP id 141so8308848pgc.0
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 06:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9WC4K7zYh2oZ5YAoZKDUxrgzMbH3Ps3fi5GbO0fyXOo=;
 b=qASrqfIv0EG39YHjPe+uGZKQMDwOiJYERxXZmq8M1AHBcLGA9Z/fVF4/IB+iK99Keh
 uiHJoZ9GgaHxuEiMcpzsJaFT/m9Js8RNp6wIN7N8kLkrmFzMJWCJKna9g4Nz/vupLfj+
 ZmZ9rqks3YoNYozebD4SBOsYP5FyQCvivsEvoyv5jniw+EmVt86dLllEGtd3AhooD9wW
 IkFvPLh+4j0+pBOtJUjxp0X7/fkwwylyHXcuY7/dEhquTbKDOVm7ryh+H7Uug4HxBeBl
 JUJN0/YUd64nPffBiqT8x/d2tZqfoaOYmlvvNimiyE0YZhdotWCQpa+o1ysH7h1giMgR
 VBow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9WC4K7zYh2oZ5YAoZKDUxrgzMbH3Ps3fi5GbO0fyXOo=;
 b=fQMoA+7Ka+a0TSjaaO1vgcXQy4UaUWByo/BH9I1wZHAikOcj4DnyVn1bIpfmIUb5D6
 l9hivRn21xJyUIy6XozIp6FJqb1p1sqRVQ83vQKPGvUvrvpOyJJXLzhSvKWdPa0Soouz
 yW7bziw69RT7LmfhgH6OYMlgrAhoBl7rjVt7NXDnnRH6sdDT7tjlcgJGVGPKF9hGUVqB
 /Cuw3qDei98Ej9Q3ZePjLx17aCTjPyGy8qra87ywxwx+dznUKm4pO8cKV5Zb73FS+6c/
 5IxQSS/KfMvTBkWBducm1rNnHRp9JPQIANVz2xCFcvrK2ITa5Gdwm6KAjnyLuOn8yQZx
 j1bg==
X-Gm-Message-State: AFqh2koxlNJ+9x/F/hMxrIJy+sBPyGhrldOiK6mIeKN0AYPvkIubKiBr
 DIJUz2GXHzRfJaSWRqG9gozAAgwBkm19+5wSQOm9Yw==
X-Google-Smtp-Source: AMrXdXtACAqDWYIAdzi7r1gfQu5djwu2cTcgwIWqvPx62A1mz0GkKX32eR5D9EYs6UFpfDRxnj6HnWZq6ovjR5BVSrg=
X-Received: by 2002:aa7:9485:0:b0:582:bdaa:b575 with SMTP id
 z5-20020aa79485000000b00582bdaab575mr2289819pfk.51.1673359350041; Tue, 10 Jan
 2023 06:02:30 -0800 (PST)
MIME-Version: 1.0
References: <20230109224232.11661-1-farosas@suse.de>
 <20230109224232.11661-14-farosas@suse.de>
 <35870ab3-1da6-c222-b708-06ac71a5883c@redhat.com> <87zgaqa6jk.fsf@suse.de>
 <CAFEAcA_x_kTdNt8+5YAjo518Wj_Ej4jZ=0OrCQmutNOjJx=3Gw@mail.gmail.com>
 <87sfgia4uj.fsf@suse.de>
In-Reply-To: <87sfgia4uj.fsf@suse.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Jan 2023 14:02:18 +0000
Message-ID: <CAFEAcA_AaWfwAbCLOC3ELf3c20Cv5jQhWc71Py4ww4kLo2nYeg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 13/19] tests: do not run test-hmp on all machines
 for ARM KVM-only
To: Fabiano Rosas <farosas@suse.de>
Cc: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>, 
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>, 
 Laurent Vivier <lvivier@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52f.google.com
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

On Tue, 10 Jan 2023 at 13:36, Fabiano Rosas <farosas@suse.de> wrote:
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > On Tue, 10 Jan 2023 at 13:00, Fabiano Rosas <farosas@suse.de> wrote:
> >>
> >> Thomas Huth <thuth@redhat.com> writes:
> >>
> >> > On 09/01/2023 23.42, Fabiano Rosas wrote:
> >> >> From: Claudio Fontana <cfontana@suse.de>
> >> >>
> >> >> on ARM we currently list and build all machines, even when
> >> >> building KVM-only, without TCG.
> >> >>
> >> >> Until we fix this (and we only list and build machines that are
> >> >> compatible with KVM), only test specifically using the "virt"
> >> >> machine in this case.
> >> >
> >> > Why don't you fix it immediately? ...
> >>
> >> My idea was to have in this series the minimum to unbreak the
> >> --disable-tcg build and later bring the rest of the changes
> >> incrementally.
> >
> > This test is basically checking "all the machines should
> > work". That's an important invariant to maintain, so
> > I don't think we should just skip it for Arm targets.
>
> But what does "all machines" mean in a no-TCG build? The original intent
> of the patch was that only 'virt' should be present and therefore the
> only one tested.

It means "every machine the user can create". If the
machine can't run then either we shouldn't compile it
in, or else we should be compiling in enough extra stuff
to allow it to work.

-- PMM

