Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ADB3C4A79B8
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 21:47:46 +0100 (CET)
Received: from localhost ([::1]:36582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFMXZ-0006vp-Qe
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 15:47:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nFLhq-00054e-SC
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 14:54:18 -0500
Received: from [2a00:1450:4864:20::431] (port=36618
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nFLhj-0002W0-W8
 for qemu-devel@nongnu.org; Wed, 02 Feb 2022 14:54:18 -0500
Received: by mail-wr1-x431.google.com with SMTP id u15so649952wrt.3
 for <qemu-devel@nongnu.org>; Wed, 02 Feb 2022 11:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G1uxiICHt2+SEQ6MWGpBhZlLPoBGfY0vUcRbOPcZNUs=;
 b=ndhyvsZWGPh0FW3lXglQ2dmzdYKhh6TP+0AZgPc3TMpG82i6yWG7I94rG+xVS8oD50
 g/I+s6uwUTV7aVQ9NAhqrQbCYwj/CoBp0xTtvDVt1o4AVDd/p/ZmU22N5GMy5UT+Xmt7
 2wcGNDTve5Kdtl4jNLS8txUXXbV3roftCs7Nacd04/eT1F0gVtAYdGjcgorP/oFAyAcM
 Gk2sYDh4xMadLAvBAlGuT2ckLIJ6oj6Lz5mL5vMtUdXD2MIGcEnjXee6SP/pKUelk/hh
 GJ2W2ZZRolBmA63njYx1/Fjt8DieW3ESfKzhRKU4HZRl1ej4p5VL9OlCpi/HNSE+GQq+
 Q8sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G1uxiICHt2+SEQ6MWGpBhZlLPoBGfY0vUcRbOPcZNUs=;
 b=DPs6KMzb3HHtfjRfomPtZ8Lx2m+vrn3C8m7XwZokYtMi7AFZ2y6IN5CVDx9ue6f6Ub
 MoC29LZfSc9UgzaKbCsJDdTqyFt/TodI3c8lf8QSE6NcFoIHLBl2gXnqXwzFGqNZttnH
 EjcASnu8pXr8BXewyX31oMrGm0b21A6oDlk2+em/nSycLbN62FnUXbAqAgj/IoWKtIDZ
 9JzMVYsSxZuk9n743nrhFfQA0TfcoptjOBzLmYkY2wZ7zpmQJHWAcrjI1mARiYyk1DQ8
 6QxD0wcd3DbsedAwORzk4QFyyznelttdIQNy5vgDMqqko14f7MM6XZuBkDNI0+zg779f
 dF0w==
X-Gm-Message-State: AOAM530VkCzN0ajXrvVZmktnqcPLUSiV/Uq9HB9n78/6cwdVSvu1ZGxN
 oNGH+POczdq1LenDiUBCfY6BSuBI/jeFS9HMoxSRjQ==
X-Google-Smtp-Source: ABdhPJwXb0UbW6Gld+Rn01KYe7Ar+sEhv2cdAPhaNFkZmZQQmy/A903gwdeJP9riMfUmWssSXtmKHNhhYs1Jkyn3csI=
X-Received: by 2002:a5d:448b:: with SMTP id j11mr5694213wrq.172.1643831645142; 
 Wed, 02 Feb 2022 11:54:05 -0800 (PST)
MIME-Version: 1.0
References: <20220201215857.61820-1-imp@bsdimp.com>
In-Reply-To: <20220201215857.61820-1-imp@bsdimp.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Feb 2022 19:53:54 +0000
Message-ID: <CAFEAcA-ASMW46DJfPLcCOfjXNJBNt+EKzpF1TBg4wQKbtvPdvg@mail.gmail.com>
Subject: Re: [PULL 0/1] Bsd user fix patches
To: Warner Losh <imp@bsdimp.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: richard.henderson@linaro.org, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 Kyle Evans <kevans@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Feb 2022 at 21:59, Warner Losh <imp@bsdimp.com> wrote:
>
> The following changes since commit 3bbe296c1c7a6ddce7a294e006b8c4a53b385292:
>
>   Merge remote-tracking branch 'remotes/hreitz-gitlab/tags/pull-block-2022-02-01' into staging (2022-02-01 16:32:54 +0000)
>
> are available in the Git repository at:
>
>   git@gitlab.com:bsdimp/qemu.git tags/bsd-user-fix-pull-request
>
> for you to fetch changes up to eb9d35f686ed1279d57463d9e6f289988f594c19:
>
>   bsd-user/signal.c: Only copy the _capsicum for FreeBSD_version > 1400026 (2022-02-01 14:43:20 -0700)
>
> ----------------------------------------------------------------
> Pull request
>
> Fix FreeBSD 12 and 13 builds.
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

