Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E318768DF2C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Feb 2023 18:42:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPRyd-0007f5-Hl; Tue, 07 Feb 2023 12:41:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPRyb-0007eL-MC
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 12:41:53 -0500
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pPRyZ-0005IO-SO
 for qemu-devel@nongnu.org; Tue, 07 Feb 2023 12:41:53 -0500
Received: by mail-pg1-x52d.google.com with SMTP id x31so1985371pgl.6
 for <qemu-devel@nongnu.org>; Tue, 07 Feb 2023 09:41:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9w8/wIWRY0FavrEtWVwv9H9oWWWD8s5ZbnFz4DIma9g=;
 b=C9Vt5ZQxMhukT5yCfurV1KJpn7JkSey/jsV6Air2ODGzUmrwFVBQGWzT4/ZE3xcuXj
 UmAdvdufd+XMwmY+r/ikpx0EEVdSdV9SaMLG+HWLdGynRzGIItNIYUgh1hSS5j5h0J/J
 xHpjm60slJ8AVMxQ/l7juXNLvCGgUVinu9bRcnNOL8IWlSYrXME32xU8q0kenTBZ0oez
 fzpLz8LzdVPc0wjW7fOrnEobkLQERJWgIsxunYznv/nBa1IfLNJhNfABnq3sd6qPALiG
 X2IsSsTn0FNW9yDOm62+ZCfEZai06P9cnQ9AYD7llTv6aOBttwbTDKDlvdExKk4l09jI
 KuIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9w8/wIWRY0FavrEtWVwv9H9oWWWD8s5ZbnFz4DIma9g=;
 b=wM+TP1CJRZPQnwkIMBDv1OXqsFuT8jYqGPIWc8zhUvI3GsC7ZzQbj+z2Y/JgFICHqy
 BmbixxlBaBaOutXaZkiWJ/ZCvDX+GDpJ83Iy5NZ1wxOOYueoc509di5vcOYXfD3EAUG8
 s9i6XUEL/QCnqyClS8CEnpfh6itOCxidZnAWByQpms7a7rnh48qtmyMC22Kk0u8Jukxz
 9isV2T+qeLMsdqikRwEGVCStNVib1sP4jl+P+gq1JhAHbcP5rXaM0LsMPzENR6tHT/G6
 n+k7WBJhR3FW/8jG2xBh3NoD75IbL2Q2WrbmHLhnDFYRtkax5zHdVijYmVJFEOn7qSqf
 telg==
X-Gm-Message-State: AO0yUKU3chIyTcp/ugMRrqD+yQ8VcMC6rVHfZnbrepH0BsDsWw91XJ1r
 fmHqZkBAppCXCXI6epnNkRCG8AiBe2Be2jhD2i5X5A==
X-Google-Smtp-Source: AK7set/ayXfxDf/QBPXpzHEJl7ujP22EIWRpAmNMF9FnruHuUzZene1ODi+UussTl0GYMMkvBM1fCDFNRx7fhmp2Fvo=
X-Received: by 2002:a63:b944:0:b0:4da:e1c7:99be with SMTP id
 v4-20020a63b944000000b004dae1c799bemr761878pgo.37.1675791710387; Tue, 07 Feb
 2023 09:41:50 -0800 (PST)
MIME-Version: 1.0
References: <cover.1675193329.git.balaton@eik.bme.hu>
 <42bcdf2e60211557ec44f11a45d6b465654693b4.1675193329.git.balaton@eik.bme.hu>
 <CAFEAcA8k_pVA_81Xr0cFqT6cTYqL2x3K3+WDKNMk02DtQ0XDMw@mail.gmail.com>
 <39de90bd-a3ab-dda6-3767-43378389ef06@eik.bme.hu>
In-Reply-To: <39de90bd-a3ab-dda6-3767-43378389ef06@eik.bme.hu>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Feb 2023 17:41:39 +0000
Message-ID: <CAFEAcA9b_0sS7+s5ZbOueeOhc9jQ1ONbkG9pT2at55j-f4-Yuw@mail.gmail.com>
Subject: Re: [PATCH 2/6] usb/ohci: Code style fix white space errors
To: BALATON Zoltan <balaton@eik.bme.hu>
Cc: qemu-devel@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>, 
 Howard Spoelstra <hsp.cat7@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52d.google.com
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

On Tue, 7 Feb 2023 at 17:36, BALATON Zoltan <balaton@eik.bme.hu> wrote:
>
> On Tue, 7 Feb 2023, Peter Maydell wrote:
> > On Tue, 31 Jan 2023 at 19:39, BALATON Zoltan <balaton@eik.bme.hu> wrote:
> >>
> >> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> >> ---
> >>  hw/usb/hcd-ohci.c | 162 +++++++++++++++++++++++-----------------------
> >>  1 file changed, 80 insertions(+), 82 deletions(-)
> >>
> >> -    .subsections = (const VMStateDescription*[]) {
> >> +    .subsections = (const VMStateDescription * []) {
> >
> > You might as well leave this one alone. (checkpatch does
> > not analyse this syntax correctly and mistakenly thinks
> > it needs spaces because it's a multiplication...)
>
> I'd add a space before * at least but if this makes checkpatch happy I
> wenr for the second space just to avoid sputious warnings. Should this be
> changed back?

If you use
  git grep -h '\.subsections'|sort |less
you'll see that most preferred is "no spaces", next after
that is "space each side" (probably checkpatch-influenced)
and "space only before" has just one use.

I usually go for "no spaces".

thanks
-- PMM

