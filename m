Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EE832EBEB6
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 14:33:11 +0100 (CET)
Received: from localhost ([::1]:33330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kx8w2-0007Vz-EA
	for lists+qemu-devel@lfdr.de; Wed, 06 Jan 2021 08:33:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kx8u8-0006T2-Bt
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 08:31:12 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:34739)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kx8u1-0007Xx-By
 for qemu-devel@nongnu.org; Wed, 06 Jan 2021 08:31:12 -0500
Received: by mail-ej1-x62a.google.com with SMTP id g20so5109648ejb.1
 for <qemu-devel@nongnu.org>; Wed, 06 Jan 2021 05:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Z6qh6YybjT8BpUixL0cWt2B7fz7ouUoHnTEhkhMpORA=;
 b=s/av8/qoWNiZTIQY+XDDcCS9M7t/gHN0aT9mzPpjENTKJfBgXqMxn4Br6XjCObkc6n
 5mr3d7AUowPOb4rRC6b0xCtrwHI+23ZXy/wG/KzPwwyvjCjfNUU11kvczOo4RyZBPUXc
 zU1fGHM/+F/s11WtzCLDD8j9QnPvNARGgr+DVzLwBCWmn7uKZ0NjNOOwTxH3WvLm51c+
 6tf2/EpR4hqU51yUccT0B7B4VlDyDiPpACqPzkSudyrhEcMS/xL5UMNoueiiFyxlyy0I
 nyCO9cqu5JHYZMK94RBfg3d076ZZZtyKjG3pJBVXdax3cw10ORS2qRzhGcKUdFuhr2a+
 68kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Z6qh6YybjT8BpUixL0cWt2B7fz7ouUoHnTEhkhMpORA=;
 b=Fkxqr85WyHNvtn+o4SJQMovdqdakzVlm8HHrprXSXB+dPG7Ck/GEL0DOcS1SaFqTyn
 ASjRH9s7YDgYFZk35bEGm5OA9bhoGC+aVXnk9/D3VQRixurHBz91BBfBoDh68sChHdK5
 9kCzxwpyWR9vf0al09t8cZ5HJbYVzYebjgI/9YhG0lhfOAZePj0B/4MKnej4ySR8mnpc
 VtumID0glD+htXR5usqcysTcu0hKBfi6njSYqsYGdkYMyykmKPa3ZjPvAgPopc8Rv/Cz
 pXOP6kKDIm0TSzqCbh1YzFZQ758Ik3/9xnRe284slufUM5YkCNZcKOTdgJH6Ni2X2cay
 q3kg==
X-Gm-Message-State: AOAM532tZmxqUNlZru3aLl67GEiyc+EdzxbL9xg5zaT1TE4FiNmjeljB
 tgrYWdxXu38ZvrsTxEToyofQ+lrFWHTJZmJ+TwGIyA==
X-Google-Smtp-Source: ABdhPJxxOvwNdMXMxLTYNw4hPdghFo8/TkqMVajdREcVIaAjqsFNLfQlpBuXmnxp23OGH1XtKpCjCrOgALlG/bprV94=
X-Received: by 2002:a17:906:e250:: with SMTP id
 gq16mr2767125ejb.382.1609939863239; 
 Wed, 06 Jan 2021 05:31:03 -0800 (PST)
MIME-Version: 1.0
References: <20210106033816.232598-1-david@gibson.dropbear.id.au>
In-Reply-To: <20210106033816.232598-1-david@gibson.dropbear.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 6 Jan 2021 13:30:52 +0000
Message-ID: <CAFEAcA8CTq=ukdTxGsapQKv-vpGTK2vSuU-XTg3DXn+voPbe0g@mail.gmail.com>
Subject: Re: [PULL 00/22] ppc-for-6.0 queue 20210106
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, Greg Kurz <groug@kaod.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 6 Jan 2021 at 03:38, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> The following changes since commit 52d25464605dc20022ad94aa8bc8e8473e600833:
>
>   Merge remote-tracking branch 'remotes/rth-gitlab/tags/pull-tcg-20210104' into staging (2021-01-05 16:18:20 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.0-20210106
>
> for you to fetch changes up to 5cbd51a5a58098444ffa246ece2013849be04299:
>
>   ppc440_pcix: Fix up pci config access (2021-01-06 11:09:59 +1100)
>
> ----------------------------------------------------------------
> ppc patch queue 2021-01-06
>
> First pull request for 2021, which has a bunch of things accumulated
> over the holidays.  Includes:
>   * A number of cleanups to sam460ex and ppc440 code from BALATON Zoltan
>   * Several fixes for builds with --without-default-devices from Greg Kurz
>   * Fixes for some DRC reset problems from Greg Kurz
>   * QOM conversion of the PPC 4xx UIC devices from Peter Maydell
>   * Some other assorted fixes and cleanups
>
> ----------------------------------------------------------------
> BALATON Zoltan via (5):
>       ppc4xx: Move common dependency on serial to common option
>       sam460ex: Remove FDT_PPC dependency from KConfig
>       ppc440_pcix: Improve comment for IRQ mapping
>       ppc440_pcix: Fix register write trace event
>       ppc440_pcix: Fix up pci config access


Applied, thanks. I'm afraid I missed reading Balaton's email
before pushing this to master, so the whole set is in there;
sorry about that. Would you mind sending a patchset that
makes the necessary changes on top of master (reverts or fixes
as appropriate)?

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

