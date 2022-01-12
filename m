Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D08B848C0F6
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 10:24:37 +0100 (CET)
Received: from localhost ([::1]:42618 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Zrw-0000H3-VD
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 04:24:36 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7Zof-0005G0-BT
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 04:21:13 -0500
Received: from [2a00:1450:4864:20::430] (port=42853
 helo=mail-wr1-x430.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7ZoV-0001fp-Px
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 04:21:12 -0500
Received: by mail-wr1-x430.google.com with SMTP id k30so2957985wrd.9
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 01:21:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TS0LW56mJ8jVMAMniDbrWdpFxpB8iTZYKTX6y0t4edk=;
 b=JkARxrNBUXC2jVSwQDJfhwF1SKwYEoIh6QGbXqZWnp/7dRaSdhoSDFfe1U2GxXZ0+b
 NF8idHQCiWgoar+05sFS5swtAIcMYxVK1WTCR9GOIcyhMoRoX5oHwPgpSmdlThvDVjG8
 3YHHAYzrO1T8pkKF867IlA6xmY32y+oc2O/NYb6uKZ3Oe4icTEBkhUbXkMlhb6dkHApO
 ERKCdnu34cRP4FgDdC4KyRTQOy8PFqG0/MwnQLpPyJ8NqR1Jcd1XJkIeh8BT5Bry7EIN
 OfvEHd/22fovI3hXpoyz690UYByOovdfjMqrE3U0cic5yT0ndo5wh0eC7/6ZOnoWKXi3
 b61A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TS0LW56mJ8jVMAMniDbrWdpFxpB8iTZYKTX6y0t4edk=;
 b=S12nyHBoRRIHy+Nv0Ay6rhYfvPVKy+ZWtQ3dveLvuG1sskUHuPj0ra2LZ6uIsqx1ew
 a3Y+7vMCVnvg41UwFD1oXpb1wc7Gc4BrOb9Bd1bxUGMYNkgozmfT9hIj3v6J6zbd4ia7
 10GvnTMbZMIIeeu14S55izZec0ZKaczkE3NysAFb9vutx81H5JZVcNqJK9q8fCU9isB5
 FDXQkGiPJbYU5XKpL57WUxDY5biUslEcnzPhXA8ZtyA8WNWFYSnkpKYEC9pt3DULGxWB
 /QaBNbg1IIos4yRmeBbQjhrxiM2SLptlMsPFnYH7IU80vWzydE3fwiMy0TajfZfdjwIY
 krxw==
X-Gm-Message-State: AOAM533dAfMj5nS8vcoYKWSnBnH8WRqKIJRj3NzLjas5wiePyH3QhIqO
 JSwgmxp/NPAk6BlSPq47c4q5DqvG7UImF7w09Ev5hQ==
X-Google-Smtp-Source: ABdhPJzXW7/ycsFj4Ut7hUoFGohewq3ejYdKF1tlRkYBJhSnCT30ixPxoZOFAcV+/vdhMs8mJpi3aAN8FZ1OIOBfWSo=
X-Received: by 2002:adf:ee0e:: with SMTP id y14mr2528618wrn.172.1641979259758; 
 Wed, 12 Jan 2022 01:20:59 -0800 (PST)
MIME-Version: 1.0
References: <20220110232521.1922962-1-jsnow@redhat.com>
In-Reply-To: <20220110232521.1922962-1-jsnow@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Jan 2022 09:20:48 +0000
Message-ID: <CAFEAcA_nc1ZE+AqFWiYgOEna1JybKznip0EH-NUeRV5+2tFtXA@mail.gmail.com>
Subject: Re: [PULL 0/4] Python patches
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::430
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-devel@nongnu.org,
 Willian Rampazzo <willianr@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, 10 Jan 2022 at 23:25, John Snow <jsnow@redhat.com> wrote:
>
> The following changes since commit de3f5223fa4cf8bfc5e3fe1fd495ddf468edcdf7:
>
>   Merge remote-tracking branch 'remotes/vivier/tags/m68k-for-7.0-pull-request' into staging (2022-01-10 14:43:03 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/jsnow/qemu.git tags/python-pull-request
>
> for you to fetch changes up to 9ebfc5a583d8aa94bf1bc37c1f71559187fd809c:
>
>   simplebench: Fix Python syntax error (reported by LGTM) (2022-01-10 18:23:10 -0500)
>
> ----------------------------------------------------------------
> Python pull request
>
> Fixes for the tests that broke during vacation, plus a simple syntax fix
> for a python script.


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

