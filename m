Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7917D341E9B
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 14:43:38 +0100 (CET)
Received: from localhost ([::1]:50084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNFPd-0004tw-G7
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 09:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lNFHX-0004Hy-Hn
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:35:15 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:33466)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lNFHU-0000FU-Df
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 09:35:15 -0400
Received: by mail-ed1-x52e.google.com with SMTP id w18so10837215edc.0
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 06:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2OdF7njrpyglK5q/reqAJ40mkWKzphHfkzhmfA0kLiU=;
 b=DhYcBfF23niJL7DwNkLMYhop4rUutDvGxMuQcKa24kcSwYeaGFHfr8rwPemf2bfHac
 iW+NwiWAdZaIKvWkkNEV2Cg4UfGmI7k4tN0REnCD44hvEwSwv+M2jCoZhI1Sj/BhwcAU
 1WqdJy2CN1asfk7EaT4cbTF5vUhIJbQf4yn3Y6/Al+a7H+u8wDnUrHC5WqgR3Rq98pm4
 hg7ZvlGcPvqAhtV1GGxhb0XqHizfutfCmruJiEryPitW6ARi42f2t+az60GF/Et6jsjr
 ClDqoJJLq31493NqMREDK9Qv7aFy2hNUn0di35Db68P+eVmGrTLFgMIMB3AdzyXsayqq
 1XZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2OdF7njrpyglK5q/reqAJ40mkWKzphHfkzhmfA0kLiU=;
 b=lucP/ZRsX0RDAUxY+cgO8TJMgDp3Gu0yifIi/cQ12bR9b3wfEpFEPqwJXoTsKCH+zn
 Zmt70CDzfUWbs3x5GPOktmTVYq4eBnB+Hjbj086bpYhpxmqt+3g0yrdC541gIVMs9fUM
 s+pSKBPD7HKj4hZN+b8PhJ745YUu5DYBch1gGSdbvKf+MYxl2nULnzaUkjl+CyWVsH8x
 1aN1p2oKY92lxaN400hn24Y+PISSaaaMfD76wkrxLwbnzIMQtGgEetQ2YPiMM5ytwLmx
 3W0lQota6P8vwIro6QwO0BD0r2jEKMWpp9/PNQKjhdp4h52WwH74JQUoxnxXr4hmFZaB
 EZCw==
X-Gm-Message-State: AOAM5338eK28eKdlMO/GqSE1Gren8tCDASc6AvHnMjp8MNo60WF1pjvl
 e1OQC5IpO1P0vql9/x0rKfoeL+pJl5uvwxGSHR6bzg==
X-Google-Smtp-Source: ABdhPJxgZP0jDFk+DJeOqJgT1lquPvnl/tpkdaURyTBWN/nQNkLvux705FGNtaGU84KzJv1TY6D0IbzKQHpLFaTdvlU=
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr9421654edv.44.1616160910668; 
 Fri, 19 Mar 2021 06:35:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210319092036.9744-1-kwolf@redhat.com>
In-Reply-To: <20210319092036.9744-1-kwolf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Mar 2021 13:34:45 +0000
Message-ID: <CAFEAcA-R2MuuaVhwyWxAhMyWNG5jPZTwqs6bKe97O+5Ertr2cg@mail.gmail.com>
Subject: Re: [PULL v5 00/42] Block layer patches and object-add QAPIfication
To: Kevin Wolf <kwolf@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Mar 2021 at 09:20, Kevin Wolf <kwolf@redhat.com> wrote:
>
> The following changes since commit 8a40754bca14df63c6d2ffe473b68a270dc50679:
>
>   Merge remote-tracking branch 'remotes/nvme/tags/nvme-next-pull-request' into staging (2021-03-18 19:55:37 +0000)
>
> are available in the Git repository at:
>
>   git://repo.or.cz/qemu/kevin.git tags/for-upstream
>
> for you to fetch changes up to 009ff89328b1da3ea8ba316bf2be2125bc9937c5:
>
>   vl: allow passing JSON to -object (2021-03-19 10:18:17 +0100)
>
> ----------------------------------------------------------------
> Block layer patches and object-add QAPIfication
>
> - QAPIfy object-add and --object
> - stream: Fail gracefully if permission is denied
> - storage-daemon: Fix crash on quit when job is still running
> - curl: Fix use after free
> - char: Deprecate backend aliases, fix QMP query-chardev-backends
> - Fix image creation option defaults that exist in both the format and
>   the protocol layer (e.g. 'cluster_size' in qcow2 and rbd; the qcow2
>   default was incorrectly applied to the rbd layer)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

