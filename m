Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83EB64A4F61
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 20:23:53 +0100 (CET)
Received: from localhost ([::1]:58456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEcHI-0007f2-66
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 14:23:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47900)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEbsN-0006yE-Oh
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 13:58:12 -0500
Received: from [2a00:1450:4864:20::432] (port=38509
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEbsL-0008He-Pi
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 13:58:07 -0500
Received: by mail-wr1-x432.google.com with SMTP id c23so27302279wrb.5
 for <qemu-devel@nongnu.org>; Mon, 31 Jan 2022 10:58:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2ifj0fk40toP7vFK5g+Ky7aGWut2bDJJunVGHHeyihk=;
 b=jlccph7gtvb1MBFxH/Bn8IEg+4Mb3cT6YL6Am1THtdrlLbE6a1adnnXBVaRF3jqLFh
 gNde03JuIKGkcYl30NbeOydFT6yuT2OjBjSaNQNaqV+FlAXfvpzAMU56wqjTngonfGuH
 JrsFH2+61boTRBelTvwyZgV+Jg4G76iNsUvqExxwTeKNYEJPQRwH1MargDWIuuxx12VV
 MUjlMYtBZUaKX5rJUItKVWXhWq731iHTo+m3sO1zNdYHWcBQiLfdSp4GwZfu+alLUSh5
 mPR8QTzPAOUUp/x54HJ+cDDKah8iXchiENqS8/hmiO1LyYmUDbfT6vR9sTh3Kq891vib
 +VHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2ifj0fk40toP7vFK5g+Ky7aGWut2bDJJunVGHHeyihk=;
 b=UQoUyuq1EJd+qo9Hub0xfnMztKGhz0GXKbm1RiYqs2vkFMNyoM3gTA82brydK4VEzg
 Ef9/fVXhuAkoVcT5EfocZXqakX9OdDCoYsdJhc83ysi7f00aUJ0Lmslo+dNOl5mykHAU
 rzFk7QePLviTyrJ/lPrEuRhYgGi2L1sPW1mkWEIbQHYDJv9hGlab3X5xdKfgHsb+feM1
 f1yaOdFo0MXmCZXMLrUsHhYxy/0XD4Tmn6bcFKe5kVSx/x1brvTKZfbs89KJzRNiQquQ
 gRNip2cL9MIcNIuZ8LPlHcY/7bIcEUpRC2zL2ts6yw7oNZooaOjZxgZIQPZI3Uw9kxh+
 UJfg==
X-Gm-Message-State: AOAM532Q7KOUGTeeUVRcDHNbpKBIoZTwHv+LkB6DTbcUutODDZAPZ7h7
 CMv0nNjQiZOt+n1SLtLa1xdeUJYkaLHiP43dh8M58A==
X-Google-Smtp-Source: ABdhPJyuWd+j6KFm8+jmZekMor/EW8JA1zocXT/FH0a/ryVK9v/eEHAZHE2NBLRfp2SblV2JoZ0jAw8CoLoqEei2NsE=
X-Received: by 2002:a05:6000:15c7:: with SMTP id
 y7mr10555795wry.319.1643655484399; 
 Mon, 31 Jan 2022 10:58:04 -0800 (PST)
MIME-Version: 1.0
References: <20220131170411.125198-1-kwolf@redhat.com>
 <20220131170411.125198-3-kwolf@redhat.com>
In-Reply-To: <20220131170411.125198-3-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 31 Jan 2022 18:57:53 +0000
Message-ID: <CAFEAcA-HS3VA4o-ZOAz1bMAymC39ntfba0HouOXH31FVZy230w@mail.gmail.com>
Subject: Re: [PATCH 2/5] docs: Only mention iscsi in the man page when
 available
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: pbonzini@redhat.com, qemu-devel@nongnu.org, qemu-block@nongnu.org,
 timao@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 31 Jan 2022 at 17:33, Kevin Wolf <kwolf@redhat.com> wrote:
>
> If libiscsi is disabled in the build, the man page shouldn't contain
> information on how to construct iscsi URLs etc.
>
> This patch is best viewed with whitespace changes ignored.
>
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---

> -``iSCSI``
> -   iSCSI support allows QEMU to access iSCSI resources directly and use
> -   as images for the guest storage. Both disk and cdrom images are
> -   supported.
> +.. only:: not DISABLE_LIBISCSI

Unfortunately the Sphinx "only::" tag is unusably broken by design.
It doesn't work the way you might expect (similar to ifdef, making
the docs be built as if the markup disabled by only:: was not
present in the source rst files). Instead it filters out generated
doctree nodes very late. The effect is that documentation that you
try to suppress with an 'only' directive will still show up in
the table of contents, index and search.

Upstream bug, closed 'wontfix':
https://github.com/sphinx-doc/sphinx/issues/1420

I ran into this when I was looking at whether there were nicer ways
to structure how we generate some of our manpages etc. Unfortunately
my conclusion was that the only safe approach was to avoid use
of the 'only::' directive entirely :-(

thanks
-- PMM

