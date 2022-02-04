Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EE9624A9D9F
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Feb 2022 18:28:51 +0100 (CET)
Received: from localhost ([::1]:44390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nG2OA-0006If-JE
	for lists+qemu-devel@lfdr.de; Fri, 04 Feb 2022 12:28:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG1zw-0002HG-0y
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 12:03:48 -0500
Received: from [2a00:1450:4864:20::434] (port=44771
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nG1zt-0004R0-M1
 for qemu-devel@nongnu.org; Fri, 04 Feb 2022 12:03:47 -0500
Received: by mail-wr1-x434.google.com with SMTP id k18so12494892wrg.11
 for <qemu-devel@nongnu.org>; Fri, 04 Feb 2022 09:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O2jqYOKNWblVtkH7FfNX9Bd8GniuLgA5X55w+Ur6EmE=;
 b=lNzGSPaLIdK+/Y54XfYSKjmx0moZrp0/mzXNsAX5GqZ2NLGUXAPbMX+Si1gBsKbXJH
 Sy9smvQcYMKq21M0rAY9kqeTSlxqBpNWGeJVFdrw4RHCFCVcrsLr+7cJVp0zKcVAVBQr
 NR1l/kuLeVHaFJ5V4j/xySP5zlDa866vzZRqDEZ3l1kNTnnDp/emgSzQVcMMvyZJcKZ/
 5iwVTw5IQ5Rphdkd4GkR3dejHsY0KCAemQF/jhQHTIWAOltJqhZs0L+Dj5SiIefrdt3X
 3cEUQJ+n9B7uTUIHl7yL50dPWlu+p046Z8iO5+JPO9Rwu3ngX1u/teq6NZr8CcN2wtLJ
 L2dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O2jqYOKNWblVtkH7FfNX9Bd8GniuLgA5X55w+Ur6EmE=;
 b=WZRs859bgPTG4TCnmhP1QYWBkFSgyKy7dSRxa7cnFfAlsytBc8oiAcSG7swdw22VVM
 tkNpEwBA21EuDUGlA9pC2UMyC2M/EmOyyqeFPlTlTwIekoSL8/TiS70iOUtTpBbLWucN
 9fAjj1WOs/++iMlqA/SsZQEWRGWvy3SBLjJwIjsSleshDCCIGKQ4+TpD4UEzwOwpAHC9
 /+e7I/blfZSaHPiFXT+cSyObw1+AISl6UfpPNH4u8y27peRAvzdGMaNB27uUwCvicCYE
 RLWGmBP9zOuxgJcT+sxUJkeeKXa0eUyiglSz/Dj/cfJYmqqLWI8TnMZOBO/+OwyBfOL2
 YFHA==
X-Gm-Message-State: AOAM530gCZ6I5Yw0ZQy7In5e804DI6BrdQ3/0ZepqbTcJ7lRjElw30vl
 vRAnJ+fMbsSC7qD6NyMakp8zTlj/C6q5235VtxZe+A==
X-Google-Smtp-Source: ABdhPJxLEkXGASZw1OZP14CZR2C+0KToML9mttBOUtBd5kFkn39n2kyTn+FFBseNESOH2V0yWc4GUmJt0HvM6/nhdyU=
X-Received: by 2002:a5d:438a:: with SMTP id i10mr3145840wrq.295.1643994224307; 
 Fri, 04 Feb 2022 09:03:44 -0800 (PST)
MIME-Version: 1.0
References: <20220203015946.1330386-1-jsnow@redhat.com>
In-Reply-To: <20220203015946.1330386-1-jsnow@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 4 Feb 2022 17:03:33 +0000
Message-ID: <CAFEAcA9kueCpDM9MHNDHasAP=mjKNbNuZ-4_aX_8pdrjXPbACg@mail.gmail.com>
Subject: Re: [PULL 0/4] Python patches
To: John Snow <jsnow@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 3 Feb 2022 at 01:59, John Snow <jsnow@redhat.com> wrote:
>
> The following changes since commit 47cc1a3655135b89fa75c2824fbddd29df874612:
>
>   Merge remote-tracking branch 'remotes/kwolf-gitlab/tags/for-upstream' into staging (2022-02-01 19:48:15 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/jsnow/qemu.git tags/python-pull-request
>
> for you to fetch changes up to b0b662bb2b340d63529672b5bdae596a6243c4d0:
>
>   python/aqmp: add socket bind step to legacy.py (2022-02-02 14:12:22 -0500)
>
> ----------------------------------------------------------------
> Python patches
>
> Peter: I expect this to address the iotest 040,041 failures you observed
> on NetBSD. If it doesn't, let me know.
>
> ----------------------------------------------------------------



Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

