Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAC83AE787
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 12:47:37 +0200 (CEST)
Received: from localhost ([::1]:50484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvHSq-0005k5-HA
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 06:47:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvH7b-0004AO-Dc
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 06:25:42 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d]:46070)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lvH7V-0005hj-NA
 for qemu-devel@nongnu.org; Mon, 21 Jun 2021 06:25:38 -0400
Received: by mail-ed1-x52d.google.com with SMTP id r7so18143950edv.12
 for <qemu-devel@nongnu.org>; Mon, 21 Jun 2021 03:25:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=8mAsWxzn17mn1SsbEYLlrm05rIirHOJ+0SjUUjzZLHk=;
 b=pKrj5bKn87kgQdg2LYWTcKHFiVo52fcgNAumwB9VjSq+NatNfsmrOajNoRNmCsDvbA
 jk+mlLPDI8h9qxWWm82UTHEbonGVnek0rhvp1iHpc9FM9QvS6c/JTSY8+PHxTf6jQAYm
 hjPt8dmr/coBu3y/t30GFChsMzARfU2cbc2zhbzX5lUEwx/xWNh87Kf7NmeUtanWPkMV
 V9NdUELqG+pxm800joOdOe+irG1mBz502uuiCxGbDFij0hqUztn7xgYrzcifGb5DYMeM
 Y1dmInRqFg82Fx1CNAPvSK8vbR2nyVS85JqttMlw0o+Zqtm7fmqDkyF3ipaTVHnXABWo
 l1iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=8mAsWxzn17mn1SsbEYLlrm05rIirHOJ+0SjUUjzZLHk=;
 b=a36pW7ySjyllR1GfU/eg0wyGK5h8sHLGu+J1iA8dd6rTilFNdpKpfzOIMpH6nwsf3h
 NMOA6K9WzFcuV2bfyX2dQqFfoE/as2FPRKUfL5cGFmXuzbWtRjNP2g5ExOcyssfaBWBp
 7VZIOqiaAa40ziOegfPgL7rfKpo9ffc0s+vxWG6EA9naHoj2BzRC1VQz97wlCeQMMIiR
 ROgyCwxtq0YcWxxadb54GthZy/43P4Mu8MBEVsqccmrWxSFOVmbspojFeO5qGP/RxuyT
 k2VIIps6t4DdIYvZJ8blazqMetgig1DddL7sOAEXOGBDD1FMtr2zGGbATRGgB83+vXj0
 egqg==
X-Gm-Message-State: AOAM532P5hegpSHIi5+wKNJkYV3VYaj+0aRkOE18Xa5br/F3A768gLJv
 9Fxyqi2kN3F/jLguCvhpix3vkYSeq0Y6g0HQeaO6conUA+7UMQ==
X-Google-Smtp-Source: ABdhPJyOaY71GVnNsdPIoyvHJaOc3JGsLjqUIteIReourc5U61AxMDMxIVs04JBep/iVrf/svPSD6XyjEPZByhAnPHg=
X-Received: by 2002:aa7:da14:: with SMTP id r20mr19251252eds.36.1624271130039; 
 Mon, 21 Jun 2021 03:25:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210618173200.596368-1-eblake@redhat.com>
In-Reply-To: <20210618173200.596368-1-eblake@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 21 Jun 2021 11:24:54 +0100
Message-ID: <CAFEAcA_YykkVaPeeRo-=3yzCUUqtR7OtwNJZBkQ7JfZjbCsEOg@mail.gmail.com>
Subject: Re: [PULL v2 00/34] NBD patches through 2021-06-15
To: Eric Blake <eblake@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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

On Fri, 18 Jun 2021 at 18:34, Eric Blake <eblake@redhat.com> wrote:
>
> The following changes since commit 3ccf6cd0e3e1dfd663814640b3b18b55715d7a75:
>
>   Merge remote-tracking branch 'remotes/kraxel/tags/audio-20210617-pull-request' into staging (2021-06-18 09:54:42 +0100)
>
> are available in the Git repository at:
>
>   https://repo.or.cz/qemu/ericb.git tags/pull-nbd-2021-06-15-v2
>
> for you to fetch changes up to bbfb7c2f350262f893642433dea66352fc168295:
>
>   block/nbd: safer transition to receiving request (2021-06-18 12:21:22 -0500)
>
> v2: silence uninit variable warning [clang, Vladimir]
> only re-sending the affected patch
>
> ----------------------------------------------------------------
> nbd patches for 2021-06-15
>
> - bug fixes in coroutine aio context handling
> - rework NBD client connection logic to perform more work in coroutine
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.1
for any user-visible changes.

-- PMM

