Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83B8541FAD7
	for <lists+qemu-devel@lfdr.de>; Sat,  2 Oct 2021 12:12:24 +0200 (CEST)
Received: from localhost ([::1]:43376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWc0F-00048y-8e
	for lists+qemu-devel@lfdr.de; Sat, 02 Oct 2021 06:12:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35818)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mWbxp-000209-Lx
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 06:09:55 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:40644)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mWbxn-0002g4-Ux
 for qemu-devel@nongnu.org; Sat, 02 Oct 2021 06:09:53 -0400
Received: by mail-wr1-x436.google.com with SMTP id s21so19464211wra.7
 for <qemu-devel@nongnu.org>; Sat, 02 Oct 2021 03:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wiXxzVgA47evwYnq/Poh8j21xWNIdYK8xGPtm8ZNWJo=;
 b=fY5j36TkNz4LRb73P8YWfm0F4kcAJy9bjyymj/0xMcgW2q7uIHSirduqRykMW2tTz8
 40T6SAMzrvco4nABPaTlJg3PzaOX7hj5Cf9l0xAtvVEcewl3Edzy+/WeQsAytMwKW0BX
 zKknRa0KqTIagdHwA5idhOry10pwrrG5sWO1yCRooyZdOmfYRA6YiFGHsyVIRKXvBHcI
 qF72RMcAq0J4AaEvLf02LQqe3cTOgclqGbIkIo89uviZSUxG5nhISM892HpqxEFeq6FW
 sw28p0WU0H+MeEZSJZaJlJ4TAHBLY/labzNI4+Rs/5k7nudfqZQ48Z3ipOA/EgnTdD1u
 JgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wiXxzVgA47evwYnq/Poh8j21xWNIdYK8xGPtm8ZNWJo=;
 b=7wIO3pTYj7zlom/vm0V7aqSysxmd9ChfRnhfGPe5ypD5ozB2pr+yrD3j8wp646szjp
 EYvqVhZ7JBCKNJJIu2Pr1hmdcthwmkO0N/1Dl67NWAieqqdctP27irE3Ja9+NeOvX5xG
 9tFEXh1SjRneYJKhCZpt/HtAlBG48LDaRKsr1ugOfUO/HFcZh31ai3DBv9oOtVqvH3wr
 AEJqJpvDxry6ckGlXOYfmhN/h5Uv+3DZUQQdYQ3aFDlSJx1flBWmCll00wjBUE+OxDOA
 TIdX4cAPKbrr81GDuUu7awq1RjwGnT+LUznvIGaOrihjlv0zNZTDc3XwKsF7G+CtXsQ1
 avgA==
X-Gm-Message-State: AOAM533qKmG3Grim0r4xEHWQJciJbxxW5aCA2V27fQCWnNt4lumJcDuI
 H5wTqKPGfBzWbnN0I/7FBTtJ1XJC8pofIgWFHqjoBQ==
X-Google-Smtp-Source: ABdhPJy8xB4L3qOP961T4/8I9Fc2gn5LcvOaEcDB0NZM1JoNVNtWnQ6M8n+2Oi58je1uu6O+T2K/3WN3yqid1ZuAzV8=
X-Received: by 2002:a5d:6b07:: with SMTP id v7mr2614175wrw.376.1633169389404; 
 Sat, 02 Oct 2021 03:09:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210930145722.184577-1-pbonzini@redhat.com>
 <f10773b7-6c69-413b-2865-da802d9c0953@linaro.org>
In-Reply-To: <f10773b7-6c69-413b-2865-da802d9c0953@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 2 Oct 2021 11:09:37 +0100
Message-ID: <CAFEAcA-eYB31+Xf7ZRQMkwz3kTOoWgSzr2vdceoR5WQWpgoEdA@mail.gmail.com>
Subject: Re: [PULL v2 00/33] x86 and misc changes for 2021-09-28
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 2 Oct 2021 at 01:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 9/30/21 10:57 AM, Paolo Bonzini wrote:
> > The following changes since commit ba0fa56bc06e563de68d2a2bf3ddb0cfea1be4f9:
> >
> >    Merge remote-tracking branch 'remotes/vivier/tags/q800-for-6.2-pull-request' into staging (2021-09-29 21:20:49 +0100)
> >
> > are available in the Git repository at:
> >
> >    https://gitlab.com/bonzini/qemu.git  tags/for-upstream
> >
> > for you to fetch changes up to c1de5858bd39b299d3d8baec38b0376bed7f19e8:
> >
> >    meson_options.txt: Switch the default value for the vnc option to 'auto' (2021-09-30 15:30:25 +0200)
>
> Applied, thanks

Uh, I'd already done this one :-)

-- PMM

