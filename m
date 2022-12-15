Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B8464DC51
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Dec 2022 14:33:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p5o0S-00064x-NO; Thu, 15 Dec 2022 08:10:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5o0F-0005xA-DM
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 08:10:30 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p5o0D-0003Vh-G8
 for qemu-devel@nongnu.org; Thu, 15 Dec 2022 08:10:23 -0500
Received: by mail-pj1-x1031.google.com with SMTP id u5so10395605pjy.5
 for <qemu-devel@nongnu.org>; Thu, 15 Dec 2022 05:10:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=AVtcB4sFLxlrzV8pkeSzQfcD2StwnBg655pSesir5sk=;
 b=aKIaA9hCquskqVyPaI+Mdd6rxwa7KZhx6ejBzXApHH8gMPjDLMuxJkNtTv64IYWaGB
 /qkLEA3eguZVbCOTyb5E0CH7fY7xhp5ifn6chOrXqgEb4kqc2g3kYXSJB0M3yt+nnEI3
 2z9ATiKcJubmVuSN9HV4ffW5nmEzwNYXF+cFW8BjPIVuLH1KMZcGR3VQzbgpgppOZjjG
 aFY8c6psj1Jo4+9lc7yvtXzl8cWJ3Anzf2vq9AbvGD/bTC15K5gh3nq+7wgUCARv1Umt
 0ggBy8A+pb1OVeYqc8IvxO3caEWehTjR/9zSyGn7YioN48OIF5HAm6xssr2hMu2C1kTM
 T3qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AVtcB4sFLxlrzV8pkeSzQfcD2StwnBg655pSesir5sk=;
 b=pxAOMmsVRJ5wphd8BV0L2u9E9BKuJu3vzbvrFjMNuV2HrjMnH5M5lfeXCjPq+es48g
 3v624JYOTa+ZECMK0boFFGzbOtkc62yKB0DMWQWIR/6w4d1z0Crv8Iw/hsJO3WiEbws4
 ef3hkd3O7mFcrPA/27V580O0zt5HHjhDvZh3seURzwA+kk7H/NqF28TQupoxuJnEOxXW
 zVyRzUAh+8vgqq/KFAJh5N3+53C07t7eZGjz4blRmUAFJqxKpTLZfGu0Oolq5QUEcP8m
 zng2JuARdfxb8ow6WdEFlku3m+6JRK1U46LoQVZ6KVMU609mfcB81a9zAVIe67bDXINh
 nSLw==
X-Gm-Message-State: AFqh2kqLJ7Ig3QyvdD6X92HaD4A/zX0kMG684zaou7NOP3nnnmtF96JQ
 XjPV92yYmIsXtEqM2m0dQOcZdxcT6uLJ3astUDD5Nw==
X-Google-Smtp-Source: AMrXdXvugcPv2dLznLVv7sdJC2GH/BoKEdonxGD1xkKOgAyZypMWjdiPuedHCfJsQFzChr1QgAyJLiOhQ3TQ4QfL0tg=
X-Received: by 2002:a17:90b:354c:b0:219:e2f1:81ad with SMTP id
 lt12-20020a17090b354c00b00219e2f181admr701090pjb.19.1671109819889; Thu, 15
 Dec 2022 05:10:19 -0800 (PST)
MIME-Version: 1.0
References: <20221214164629.919880-1-armbru@redhat.com>
 <CAFEAcA8AsDK=y6Wy07PNabojrFr_xQRutSQhe3xnD2sOJjaRQA@mail.gmail.com>
In-Reply-To: <CAFEAcA8AsDK=y6Wy07PNabojrFr_xQRutSQhe3xnD2sOJjaRQA@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Dec 2022 13:10:08 +0000
Message-ID: <CAFEAcA-Y4ETMgMxiKgLcOKuJjxY7P8xdW8Oe7NuxSF975zW6yg@mail.gmail.com>
Subject: Re: [PULL 00/14] Miscellaneous patches for 2022-12-14
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
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

On Thu, 15 Dec 2022 at 13:06, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 14 Dec 2022 at 16:46, Markus Armbruster <armbru@redhat.com> wrote:
> >
> > The following changes since commit ea3a008d2d9ced9c4f93871c823baee237047f93:
> >
> >   Update VERSION for v7.2.0-rc4 (2022-12-06 19:53:34 -0500)
> >
> > are available in the Git repository at:
> >
> >   https://repo.or.cz/qemu/armbru.git tags/pull-misc-2022-12-14
> >
> > for you to fetch changes up to 6c5aaee4b61eb8bf60c7c30365432710b4346421:
> >
> >   ppc4xx_sdram: Simplify sdram_ddr_size() to return (2022-12-14 16:19:35 +0100)
> >
> > ----------------------------------------------------------------
> > Miscellaneous patches for 2022-12-14
> >
> > ----------------------------------------------------------------
>
>
> Applied, thanks.
>
> Please update the changelog at https://wiki.qemu.org/ChangeLog/7.1
> for any user-visible changes.

Should be https://wiki.qemu.org/ChangeLog/8.0 of course -- I forgot
I hadn't updated my canned email text...

-- PMM

