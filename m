Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B9ED4CFD77
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Mar 2022 12:55:18 +0100 (CET)
Received: from localhost ([::1]:54022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nRBxN-0000f2-Jm
	for lists+qemu-devel@lfdr.de; Mon, 07 Mar 2022 06:55:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60336)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRBts-0006LB-BK
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:51:47 -0500
Received: from [2607:f8b0:4864:20::b33] (port=43703
 helo=mail-yb1-xb33.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nRBtn-0003Zz-6e
 for qemu-devel@nongnu.org; Mon, 07 Mar 2022 06:51:39 -0500
Received: by mail-yb1-xb33.google.com with SMTP id g26so30292844ybj.10
 for <qemu-devel@nongnu.org>; Mon, 07 Mar 2022 03:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=WRpBGxlKqz7wgf9vlrHm12BEWHv1c6+OKPvkEZ8OTXg=;
 b=yXbp01fjwK6axOYGgEfM1ultrVbUXYZ90QU75DXLS4HlTUL2gInc7IlMWpk9ZzjGwR
 syFcdh6IDOtTqgEMe8dyvHWYLShRUUAA+7KNKqbWq0+CsElJxwTZNvuhxobwcsmcbx4U
 HKkPB61H0nSIXriJsf+dJVzPxfKcTWGXS1dpx+KdAF1nj7v+mdde6a8mulK/ddV10jGv
 xEI8u27CHSu0ZffgPBl68Az4Wb5JZhoPc2tX/FQDGnTeC7fefAgv3HWCuJQlKTdqKeWX
 g2h7ra6YyhbWfzj54jX1uT5YdyXAB2Xj0N8cjM57yyxziakV1pgqyXtzcNBgTf/nWDL2
 tRVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WRpBGxlKqz7wgf9vlrHm12BEWHv1c6+OKPvkEZ8OTXg=;
 b=bHXu9xh/7XqkUoewg6MpuopKQKv1SrJT5wWqDMcQrvzumrdF3pM/XU0zOXWKbOljJr
 bfWrBOSEV8vDWFez68njnv2kWsj9VpHnmcs57he41R2yN0ZS2k5yG3ZKT+Z2kdcp12qy
 6Zpuxfi9RgWH9b/abX7htw4P5lbBJEqTI8OPi9+sr2mJFmj1uAhwvxpltMgtK6PtYM7I
 5acZ3mOOUHJ1J7yVHS8mg86SkIMzro3IxU7PFBhBgBfEqak89FQqpR4xUKKV0g9kdHom
 D9QyNEHOrVvhY4B2hoSo3YPNAxC/BFF7ETdwuKsTLGNRRdc5gVcgrhsVR/yCeCGyh6Tu
 JWDQ==
X-Gm-Message-State: AOAM533KzvwIWJCMH/v7npK1J4L+ix+VgYEPJxNb2V7A3Duqk1dn1HUg
 EaKhEpPeq9NeHkhZexgYmHK4UGG1u63d7RL+B/qSUQ==
X-Google-Smtp-Source: ABdhPJw4+ejNnPkz4MvxVil0BEG0jEm7aTZ+lTjJGi0b4KLKQWhVM+8Y6fIlNVI6TQo+J2BqcHINCAZ1Qs2llHj5PT4=
X-Received: by 2002:a5b:745:0:b0:622:1c46:3c19 with SMTP id
 s5-20020a5b0745000000b006221c463c19mr7624767ybq.479.1646653891151; Mon, 07
 Mar 2022 03:51:31 -0800 (PST)
MIME-Version: 1.0
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
 <CAFEAcA_Gedun4yL_DcfK9Pk7e5j5gYpHuue139gq3rYH3zbETQ@mail.gmail.com>
 <ad3118f9-0079-16cc-8a9d-51b8e32e7b2c@gmail.com>
 <CAFEAcA_rLaphLoyZNUGOPoj5n2z7X+RJNSpnJGqhu9ujAMduEQ@mail.gmail.com>
 <ec456ba2-71ed-7cbd-ae3a-595131962918@gmail.com>
In-Reply-To: <ec456ba2-71ed-7cbd-ae3a-595131962918@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Mar 2022 11:51:20 +0000
Message-ID: <CAFEAcA9tzq6atDCFDSmFZ2FhNgn7dXt21=GazcXZ9+3WYVtWuA@mail.gmail.com>
Subject: Re: [PULL 00/33] Abstract ArchCPU
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?=
 <philippe.mathieu.daude@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::b33
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::b33;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb33.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sun, 6 Mar 2022 at 21:13, Philippe Mathieu-Daud=C3=A9
<philippe.mathieu.daude@gmail.com> wrote:
>
> +Daniel/Alex
>
> On 6/3/22 20:56, Peter Maydell wrote:
> > On Sun, 6 Mar 2022 at 19:06, Philippe Mathieu-Daud=C3=A9
> > <philippe.mathieu.daude@gmail.com> wrote:
> >> I see. I only have access to aarch64 Darwin, not x86_64; I was relying
> >> on our CI for that (my GitLab CI is green). I'll work a fix, thanks.
> >
> > This was on my ad-hoc stuff -- I guess our gitlab CI for macos
> > doesn't build hvf ?
>
> No, it does:
>
> https://gitlab.com/philmd/qemu/-/jobs/2167582776#L6444
>
>    Targets and accelerators
>      KVM support                  : NO
>      HAX support                  : YES
>      HVF support                  : YES
>      WHPX support                 : NO
>      NVMM support                 : NO
>      Xen support                  : NO
>      TCG support                  : YES
>
> But the Cirrus job are allowed to fail:

Overall I am starting to feel that we should stop having
these CI jobs that are in the "allowed to fail" category.
All that happens is that they eat a lot of CPU on our CI
hosts, but they don't actually find bugs because everybody
(rightly) treats "allowed-to-fail-and-failed" as "ignore me".
I think our CI jobs should either be "must pass", or else
"run only manually", with that latter category being rarely
used and only where there's a good reason (eg somebody
specific has taken responsibility for debugging some
intermittent failure and having it still available in the
CI UI for them to trigger is helpful).

Plus we really need to get on top of all the intermittent
failures. The current state of the world is that we have
some intermittents, which makes it easy for new intermittents
to get into the tree, because everybody is in the habit of
"just hit retry"...

thanks
-- PMM

