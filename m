Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD3474A6804
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Feb 2022 23:31:53 +0100 (CET)
Received: from localhost ([::1]:38478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF1gm-0008F0-Qw
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 17:31:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEz8B-0002T0-K7
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:47:59 -0500
Received: from [2a00:1450:4864:20::42d] (port=38724
 helo=mail-wr1-x42d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nEz89-0004mP-Ux
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 14:47:59 -0500
Received: by mail-wr1-x42d.google.com with SMTP id h7so2312782wrc.5
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 11:47:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8XlCW5N15ZXZcTi0zrKe8rpUZAW+XG9vHS+BSyg/PQE=;
 b=yld3Al6zVz3PFEvAN0U6cSIqYpxttRFMLr+zwyVwrAmk5yp8t/+FW810HoqURwmWpy
 QhOC8LS1Ob75AsX5t2x18rhD2/eqRgpV5s8NquODv8UJSOr+S6d6yIZ4NRZ++B1fIM/J
 0B9TtzzKI/y7RaYDOGwvRl+c0ki65Lt+Cqr5ASilc92ajXDvk8IPzI0bebbajAglBm9f
 9C3lcXwyjekvEUXEy5fXTd3TMRzLz6j11EOyJnSWivis6qU129oLKrYN9jDFfLyGdnWP
 pM8SzxQKBKIY/11IhHHRxU2RPAgx/PxKuTkN/i3eX23IljzZmqxKLciIrbf2pD6GAh+h
 H3rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8XlCW5N15ZXZcTi0zrKe8rpUZAW+XG9vHS+BSyg/PQE=;
 b=0ec1+DiOiAWsNYpDsudMsu0mDXOZUlhf9PK6pJNWH3pg+Z2/0Q4dPEVvmuxig3L37v
 QzuYE6sieWAS/nzDJZRC/49fSJ5lCMliK71IfWlrfpwLrgFJkpW0Ymuu9Eo+RCkTdInP
 kGLb802bLsnDuVQyAW4YP4LrZF2iLB/EwEX95QQDd/rijdtvWEl2WWsWZu9zW6hYwb8q
 LyLOKxweXoty+zlxkW94tLnDBgqvwoJjVFN6x2R1qW55dXeE3KDuD48ubjnLYYZl/Igv
 VL7iizrbFMChcrZ7+3Oe4bCtC9/Vr9tnXpDKeNiz3rxE5g3MgW2zpOYauazoXZZHzDl1
 VYmA==
X-Gm-Message-State: AOAM530nQIV2kwAZQKIcJQUSrmumktlI75W3nca7Tw5wSN4PpT79uQ2L
 zfapC7yoijkURRnaWrjU90gLthDeRoiharBx4k3ONA==
X-Google-Smtp-Source: ABdhPJzt1Ae9Qd55GCBjfcjgQB0jivpaIZ57Y3itk2zVTq2Uc/pU+9wgyRsObHtnNR4mM8NSJH6TuEVE/fNJUBWkPZM=
X-Received: by 2002:a5d:448b:: with SMTP id j11mr1791445wrq.172.1643744876572; 
 Tue, 01 Feb 2022 11:47:56 -0800 (PST)
MIME-Version: 1.0
References: <20220201144233.617021-1-hreitz@redhat.com>
In-Reply-To: <20220201144233.617021-1-hreitz@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Feb 2022 19:47:45 +0000
Message-ID: <CAFEAcA8dTzJ87w9qNNRVaMe-w5Xi0WnvQAbtaMAzN0TxLBQtfA@mail.gmail.com>
Subject: Re: [PULL 00/24] Block patches
To: Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 1 Feb 2022 at 14:42, Hanna Reitz <hreitz@redhat.com> wrote:
>
> The following changes since commit 804b30d25f8d70dc2dea951883ea92235274a50c:
>
>   Merge remote-tracking branch 'remotes/legoater/tags/pull-ppc-20220130' into staging (2022-01-31 11:10:08 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/hreitz/qemu.git tags/pull-block-2022-02-01
>
> for you to fetch changes up to 751486c18555169ca4baf59440275d5831140822:
>
>   block.h: remove outdated comment (2022-02-01 13:28:53 +0100)
>
> ----------------------------------------------------------------
> Block patches:
> - Add support to the iotests to test qcow2's zstd compression mode
> - Fix post-migration block node permissions
> - iotests fixes (051 and mirror-ready-cancel-error)
> - Remove an outdated comment
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

