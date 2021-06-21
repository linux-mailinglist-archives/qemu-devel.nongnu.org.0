Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F703AF65E
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 21:44:47 +0200 (CEST)
Received: from localhost ([::1]:40186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvPqg-0005B0-FW
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 15:44:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvPpB-000307-OU
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 15:43:13 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:34757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvPpA-00039X-11
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 15:43:13 -0400
Received: by mail-ej1-x62c.google.com with SMTP id hz1so8144183ejc.1
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 12:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wH28q24Fds4Pl20vBt9x9P/Dm5Aaz2HNEB4tTVqw5qY=;
 b=pLvY6xehHIp/n/6ql2F+h+FiMstgfxd/+kqMUr7/1Fc/OQtesLfuPmrku98pmOgPbl
 YKQhHfCyWrF6Pg1uvwtKMhCQVm1P/cgVYTwfFfcA8fRd8WAKbwS5oHDXEybmq2D3WiJ9
 Gqft9bqkgMKs/4URi2adFc3FxNXuHIzhYmQheKpQlTD+WPeKW4hTpcgp+HTS6HeILnpm
 7GJamAz5hf0TE/M4n8I6OXtUxV7Ui28V5wxVguunhQ+AcGSMLHjT3IqZpnjOcfdkIRkT
 sEyMSuZus7D2rS0nZrdzuojp0Tmj22YuMgqWE+8FYIjwCU6qbRo7BKslQf4vdiAABMjW
 ZSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wH28q24Fds4Pl20vBt9x9P/Dm5Aaz2HNEB4tTVqw5qY=;
 b=gluE1N+y8ON/seocACyBTmjMErDiKC2FU0Dgra3WOaUI3T2enW0a4Kqp4eHsxi7zKc
 N6YxIOZ0ObgdWCT2b18NO4mVppVFfM1lS4kyypZRuuK/K7Wnaq0H7KLoShVwpeFhyN6x
 MSWpynMosX0CVNcTcfPyfTsqPG1tf8zrdCuspnMsIwj8zH62NF8RrTfCE5TM7RA37cMv
 0b6ej+F2W+Tg77h1RV2yRPLJ32L2UjIxZaWumeq926RE8KoxOM+HGRTjK4hwedjSIWun
 BI2z7r3GZU/GuIDydu0qwUtvPIbGLI0zBEm7982C9XoQgZoLhFhMFN4lYIrNVWhdeI0z
 KqzA==
X-Gm-Message-State: AOAM5308J+4IgPzOBzXGwBu0BEG7sQ9Q2EzR7VNLoUC5HyLItrUyE4tc
 vpu1HbnyOlbiLsf/odUC6XTZHftmNjM10QwF6J9Byw==
X-Google-Smtp-Source: ABdhPJwXQFahepAfxCjImf27KEeK8aQbz5pM2klBTvEsHLriSXl9LEsrELehzifcuZA4eI0rIHvV+/Vxkch86WHVYcc=
X-Received: by 2002:a17:907:98eb:: with SMTP id
 ke11mr25014487ejc.85.1624304590365; 
 Mon, 21 Jun 2021 12:43:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210618230455.2891199-1-jsnow@redhat.com>
In-Reply-To: <20210618230455.2891199-1-jsnow@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jun 2021 20:42:34 +0100
Message-ID: <CAFEAcA93aBaLhPLh3+5zKygSPY9XnuXMR3rJUVUJW-+W6VjrGQ@mail.gmail.com>
Subject: Re: [PULL 00/72] Python patches
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: Markus Armbruster <armbru@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 19 Jun 2021 at 00:05, John Snow <jsnow@redhat.com> wrote:
>
> The following changes since commit 3ccf6cd0e3e1dfd663814640b3b18b55715d7a75:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/audio-20210617-pull-request' into staging (2021-06-18 09:54:42 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/jsnow/qemu.git tags/python-pull-request
>
> for you to fetch changes up to d08caefe6648fc0713af5361e2b88bee53b67ebb:
>
>   scripts/qmp-shell: add redirection shim (2021-06-18 16:10:07 -0400)
>
> ----------------------------------------------------------------
> Python Pull request
>
> Moves QMP-related tools not used for build or automatic testing from
> scripts/ to python/qemu/qmp/ where they will be protected from bitrot by
> the check-python-* CI jobs.
>
> stub forwarders are left in the old locations for now.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

