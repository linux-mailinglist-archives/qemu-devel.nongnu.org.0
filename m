Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD804CE554
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 15:44:39 +0100 (CET)
Received: from localhost ([::1]:59538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQVeA-0006zK-7h
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 09:44:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQVcp-0005b3-2P
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 09:43:15 -0500
Received: from [2607:f8b0:4864:20::1135] (port=43224
 helo=mail-yw1-x1135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQVcn-0007aS-9D
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 09:43:14 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-2d6d0cb5da4so120419267b3.10
 for <qemu-devel@nongnu.org>; Sat, 05 Mar 2022 06:43:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=n8XzTXt7grCvcNq7TdMYwMKaB9CcHM1UaiORvoGvKfY=;
 b=l/Tq9b7qzS0qtvG/lNSN6YZE8fy5q1Un/xvyL06HgllE17zGh7w/qiktEFV/FQbnjg
 XV411J1S95CXvG9V/BDFneKJu5Qb1h1tQlUxAe+nyyRbvE+dBkvDnMypKIFBcNBs2LKD
 F5I4NOWmRZANs0m4x4v58ewhC7IpqvSq1jFOnUtp/Yx0zXqjuT4djE//8AC46qGXaQ3d
 NjPuYDLhrXF0UWk8iLBdYm0gOw63N3oXVCF4AMAY0muyZ0Oeb8ONhrurkQuV1TXTmmYr
 aNOqDNF52TA5WKke8VmXvMxq/VyIsZL5qFIGx3P0pwCB7rW+GDL0/hIAPXrwt60U5/Mp
 ofBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=n8XzTXt7grCvcNq7TdMYwMKaB9CcHM1UaiORvoGvKfY=;
 b=c627SHVvUxKTE7nQvT4sUyEzhYHFiJKW3tR4VvRH3EipXLxTrL6XukPXWv2nOZYibb
 EjA8azifHNNrFKToSVks0vR8ekSALCGp8NoEORs9JxWDa/A5wYxstrXekyb6tEpIwGFD
 yYZU2dc0/dnWZ+b9jYkRKD7GLlsnePvpwmKVlqlxek4UHfefEFf+z5tRfkuGkiLHuS8h
 KXrwRoeQxK0t8lCVExfChE+GgeHx6hyrEZOtDrbjVr4Wyhk4Yfduk6uQka/SGsgmGme5
 JMENB07habFNx6qejC9R/1e+cf8dcExIxIYV0yb+4Sq2VNSLgLZRIa5hP/gLefS3T0Jo
 Zldg==
X-Gm-Message-State: AOAM532T4JGsa8ObNJOZqMZumMeIHLY8iseeLVnAaoua1G8a7sLIo4yn
 fva7qAAuBM3xY9L5fKlO7OaYf5rmkKC6CiIzpf3w1g==
X-Google-Smtp-Source: ABdhPJwI9J8OFdw1OOLYOtEtJqvnIs3OIhIpsrC8HfOlifzR2h3hqHY9/WDAGaOYgfrocsBFAEgVoSkWb+pO+IgyvT0=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr2571003ywh.329.1646491392211; Sat, 05
 Mar 2022 06:43:12 -0800 (PST)
MIME-Version: 1.0
References: <20220304164711.474713-1-kwolf@redhat.com>
In-Reply-To: <20220304164711.474713-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 5 Mar 2022 14:43:01 +0000
Message-ID: <CAFEAcA_=qMjabDrcGcL7o7MxbwhsLMM5QKhndcsn7YbXubN0QA@mail.gmail.com>
Subject: Re: [PULL 00/50] Block layer patches
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1135
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Mar 2022 at 16:47, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit 6629bf78aac7e53f83fd0bcbdbe322e2302dfd1f:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20220302' into staging (2022-03-03 14:46:48 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/kmwolf/qemu.git tags/for-upstream
>
> for you to fetch changes up to a5df6d1db7db37636c8624bf4a9df9da645853aa:
>
>   block/amend: Keep strong reference to BDS (2022-03-04 17:15:33 +0100)
>
> ----------------------------------------------------------------
> Block layer patches
>
> - qemu-storage-daemon: Add --daemonize
> - Fix x-blockdev-amend and block node activation code which incorrectly
>   executed code in the iothread that must run in the main thread.
> - Add macros for coroutine-safe TLS variables (required for correctness
>   with LTO)
> - Fix crashes with concurrent I/O and bdrv_refresh_limits()
> - Split block APIs in global state and I/O
> - iotests: Don't refuse to run at all without GNU sed, just skip tests
>   that need it



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

