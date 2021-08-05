Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B053E1CE1
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 21:39:18 +0200 (CEST)
Received: from localhost ([::1]:35972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBjD3-0001fY-A6
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 15:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mBj9L-0004H1-3Y
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 15:35:27 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:45610)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mBj9J-0002M7-EH
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 15:35:26 -0400
Received: by mail-ej1-x62b.google.com with SMTP id qk33so11343959ejc.12
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 12:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/Gq9irw0ev5A9d/DiITizY3ASDZa8EROSiPbOdcU8BU=;
 b=tRF+TKqRPEMNLDLtKv1Ju11GFTTjkIM7GzXKqIf3j0vxAjAWY6bPs95zAY8moNWRpp
 ITYJNOs7r/p8DgTv5swBwBmbnbhbLbPoxuHNJpuF4KeaQy3gagNiQYqX5xux1dmvvCO4
 MDlAHaP3W3dP7itPEdrU5b9hAjF8Sn5ia4nsWT2dQ/LUhkb0LVZbASfdMMUZ9BrVOrwt
 AmyfeViJ7wuX3eL+N8Em6NNAtAqbLgulcuCpW5C/KnDqDInNCWZqEv5Dt4V2MIKdze3b
 12vPHSGbQohM3FW8hV6319UW2PEYsCIMlPiDk5mEaT3jw/ymG5SjGciIWIVwAkp0D4Ia
 L7qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Gq9irw0ev5A9d/DiITizY3ASDZa8EROSiPbOdcU8BU=;
 b=kCEDkkgG4mpqEhNyptXUWArtFS9detn/O2If/NWv1O5cpjP/+9Bz0Fm6kSDV2KZVKB
 lbzafOLIcQUWzuJaP+17A5AGYUj+CzpLJ443H4NOAs9WgmOAOHdOFlGee+qpPjR7CK4V
 8TbAiIUc0bVU2MzQqfNvZCbABcfdEKl4NoUYeYIbOFcPYP18x7FYZbyzuAaH3wqxEiQW
 ObVav5PMQqefWwu6JgYfuGxmXA1hBVxEE6Z+Zh38tph9rCXshuBJw5ZCoK1ciz+qHiFx
 aGLkPBg/bC7BaFBdyoLqOfcc/c0Sjhpjm2b9O0GlUvOb05MF+smea+p/q7knktX9VlVv
 TPeQ==
X-Gm-Message-State: AOAM5326Bq0A/ST9y4LVVpaEH6mPoQYPWRXEyLOkTeZ8Ps9jbjJ1U19R
 WfHupT3Zd4I4g6coA65o/lU1IbWyU3k3K/a3rRjrMg==
X-Google-Smtp-Source: ABdhPJwlY/VInAQcxBp/TmyzP+LZW618fnZ11bJ1BjXcBTNAFHCr2CqL2ZgfKZbhLJAZCxp5pAUdD8hfge2nf2tZc4w=
X-Received: by 2002:a17:906:d93a:: with SMTP id
 rn26mr6340384ejb.382.1628192123562; 
 Thu, 05 Aug 2021 12:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210805140902.2110546-1-armbru@redhat.com>
In-Reply-To: <20210805140902.2110546-1-armbru@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Aug 2021 20:34:39 +0100
Message-ID: <CAFEAcA_FYdZYEu-pjU3NDTqtMJNo4Wv+610v3nX8=b6tFvG=Vg@mail.gmail.com>
Subject: Re: [PULL 0/5] QAPI patches patches for 2021-08-05
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 5 Aug 2021 at 15:09, Markus Armbruster <armbru@redhat.com> wrote:
>
> The following changes since commit cb2f4b8750b7e1c954570d19b104d4fdbeb8739a:
>
>   Merge remote-tracking branch 'remotes/thuth-gitlab/tags/pull-request-2021-08-03' into staging (2021-08-03 19:50:43 +0100)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/armbru.git tags/pull-qapi-2021-08-05
>
> for you to fetch changes up to 68e6dc594a44a7077657f2ea878806e38dfa50cf:
>
>   docs: convert writing-qmp-commands.txt to writing-qmp-commands.rst (2021-08-04 11:18:05 +0200)
>
> ----------------------------------------------------------------
> QAPI patches patches for 2021-08-05
>

Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

