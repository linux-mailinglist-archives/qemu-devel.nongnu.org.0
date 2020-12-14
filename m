Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5082D9FB4
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 19:57:44 +0100 (CET)
Received: from localhost ([::1]:57754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kot2V-0000ZD-0F
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 13:57:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kosyM-0005RU-36
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:53:26 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:35704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kosyK-0001W3-1Z
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 13:53:25 -0500
Received: by mail-ed1-x531.google.com with SMTP id u19so18317188edx.2
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 10:53:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=WSHZhdhPnJWElFObvhmM3f65AtzcJMTkrPIzmsIUlPw=;
 b=D0Ntp82teYwFCLzGwqXlP+P937OOsCX367lwoqnWuJ5JLntdA9vtYoF2iOYnQLiqc1
 7mEARUKg4yAsV0Hpar//m8ZHUQaV+EXT8HUhp/wFG1898Chrh/9OoEEALr5TY+IQjXMG
 w2WyHovIzknhwPfUjrCRpjsyaPkTe+WGKqPk7bYLPFtH7eHQu0L/qj9NbN/ct8Ifbsk8
 nHssx8fecqJ0VogC+ZieQWsUhCVHpdQLhw0Bcal0NAzzhfTCGPKv9umPOHvyRvR7T8tc
 547cNjexqPfM0IhpE/BiB23XhDeKEx6KAMvtxHVllV2kqjwrcgaU5nZEWSer8+02L1KH
 fvkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WSHZhdhPnJWElFObvhmM3f65AtzcJMTkrPIzmsIUlPw=;
 b=hENnWG63dMgYo9izV7Hs8xEA6gP3vFHwqcvBzzMD5wyAg4uYI1tIOv+0zFY3Zb1A55
 zoGJvhDYppE7bcjQCSf1kM2Cek0McB9RzuMz1sjiMTmxtAop9gEmOvXayUNRwc5IPdHN
 THedWOnLXoocLM9xezCoHHar/JW7NGG3Au+JPyy0ocUp/0z2fqXZzBVTo3C/FwxqqGQy
 cU4H2eF7VTzGIO1Pnqdcv6PSXLlDutcHWxcrEqFNeGD+BqLuA0AxPS3d1v/anHLr53eZ
 mGGjDkN2yzjjKZPWRu998paMsIGIXl6kNTqej9wYJ4bY5ZWLdPopsIndGLJ4lLqnIH2Q
 DHnQ==
X-Gm-Message-State: AOAM533SOGrY7lUGJXIqVae8qU//O4bap4k3J7gXcZbJCiheNc66dvxZ
 vteHBLeqFbT+9b8qP6PbJWIxZVyUgVAtUwq2wqQayA==
X-Google-Smtp-Source: ABdhPJwcBaJDQYb4jTac30nThdbaP3qvcQPR1HBly4772nIpfxulwJPxcjuT+TtZrr7j8+juC+9CTgoAJ0pQ49EnkRM=
X-Received: by 2002:aa7:c353:: with SMTP id j19mr26095213edr.204.1607972002722; 
 Mon, 14 Dec 2020 10:53:22 -0800 (PST)
MIME-Version: 1.0
References: <20201214045807.41003-1-david@gibson.dropbear.id.au>
In-Reply-To: <20201214045807.41003-1-david@gibson.dropbear.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Dec 2020 18:53:11 +0000
Message-ID: <CAFEAcA83aYPn8cUa8kLNnTdKoXyYeMxKh7KK3PjZ9NAMhewqdw@mail.gmail.com>
Subject: Re: [PULL 00/30] ppc-for-6.0 queue 20201214
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
Cc: qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 14 Dec 2020 at 04:58, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> The following changes since commit 17584289af1aaa72c932e7e47c25d583b329dc45:
>
>   Merge remote-tracking branch 'remotes/vivier/tags/m68k-for-6.0-pull-request' into staging (2020-12-12 18:33:46 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/dgibson/qemu.git tags/ppc-for-6.0-20201214
>
> for you to fetch changes up to 07b10bc42cc83a49acaa783383a69fb59d7ff71a:
>
>   spapr.c: set a 'kvm-type' default value instead of relying on NULL (2020-12-14 15:54:12 +1100)
>
> ----------------------------------------------------------------
> ppc patch queue 2020-12-14
>
> Here's my first pull request for qemu-6.0, with a bunch of things
> queued over the freeze.  Highlights are:
>  * A bunch of cleanups to hotplug error paths from Greg Kurz
>  * A number of TCG fixes from new contributor Giuseppe Musacchio
>  * Added Greg Kurz as co-maintainer
>  * Assorted other bugfixes and cleanups
>
> This supersedes ppc-for-6.0-20201211, the only change are some patch
> authors to better match qemu conventions.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

