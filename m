Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B74E6583B89
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jul 2022 11:52:19 +0200 (CEST)
Received: from localhost ([::1]:33630 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oH0Bm-0004NY-Rf
	for lists+qemu-devel@lfdr.de; Thu, 28 Jul 2022 05:52:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oH06y-0008PG-6a
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 05:47:20 -0400
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35]:33285)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oH06u-0002Rx-DG
 for qemu-devel@nongnu.org; Thu, 28 Jul 2022 05:47:19 -0400
Received: by mail-yb1-xb35.google.com with SMTP id 7so2506799ybw.0
 for <qemu-devel@nongnu.org>; Thu, 28 Jul 2022 02:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nZUtWiHteDQc99UgeUBDQLgttaGYWcOD38rdMc/Kejo=;
 b=vJ+Ojt5BOpK5mibB+P1vvGbk2Vu4cw3B1wfJbqnodGcA9PgyH7rxbZLkIOB91ML5Pj
 CCf4gmeYlphlvaeM9jaCEGkM2/vC4QI5I35Uwivk+og0yY4x0+dGHPqjsAxT1U9R1wpJ
 7lSwqj+YJQXztIv3Zq9L1X/dUl+9kyL19oeIE+e2o357p8dAtmZ5rej6lB3Zt26KU8Jx
 lK17hsOlNqR0wGUkplMz+ije/eA3qmhHur/EaabVv/oqExLI0dteQ+J2UCJXh9CsqGc2
 RSeiPUu8YjQ28X3Dcg1JPdlQcz55HhcnqiXb4T3T2UTWrkQsj2y6Wg/1IPwKL6SqUthr
 Lyrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nZUtWiHteDQc99UgeUBDQLgttaGYWcOD38rdMc/Kejo=;
 b=oBh0NETtJXmVajUcAla6zHzo2ZULAo0MyDI9KuMIMlvSMq89EgqYq1DG/+vKzMhfGH
 Dg9+l88P7cVsvPG5Ei/ClZc9jH9MVCFIKP1sxVvU9yOaeV8/R5rdQE2y8mo+LTZPbme1
 qL6rTS9CmPm1pZdc9pjCaH77QE6UB7gXFDIRGSnynkkX+ZSKPjq8X7Ga39BVXDt+pBn2
 WExgCVmFruDKXrgcy17iGzhVPUVtGHqfnuCMo0scn1aCOI20pDiiL0TNQtXohLMqzyRH
 yDUzRkSRWvA2C1BLk0m1TNla1YrbmwHSXDQgIuJ8RP27oaeheg3Eq9PY4GicyRC4FYTL
 dV6w==
X-Gm-Message-State: AJIora81BIVbMbwa+8sS+GPounBO5WaxzAmkVLRy5zgubcYTKDLDbODo
 Hhhv9am1k2L++9S1xlv3kO4/RdVgy1RTZ0ZcMVwI4w==
X-Google-Smtp-Source: AGRyM1vBSvA6kvW9lf63liIJaJRV8kTJOiUEOQtIu22FO2pMJPJ/WNvnN5OuByYZqhpvXn6cQOzAAn+IOyOCfHLdzbY=
X-Received: by 2002:a25:9a06:0:b0:676:4585:3df7 with SMTP id
 x6-20020a259a06000000b0067645853df7mr766905ybn.193.1659001635306; Thu, 28 Jul
 2022 02:47:15 -0700 (PDT)
MIME-Version: 1.0
References: <20220714182836.89602-1-wuhaotsh@google.com>
 <20220714182836.89602-6-wuhaotsh@google.com>
 <87ilnuda33.fsf@pond.sub.org> <YuGMFRDj3tLOIJK7@redhat.com>
In-Reply-To: <YuGMFRDj3tLOIJK7@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Jul 2022 10:46:35 +0100
Message-ID: <CAFEAcA-_TkDW4tPxvmwEt-Rr6VAr_7aWNX2++CE+1G5cBPtiBg@mail.gmail.com>
Subject: Re: [PATCH v5 5/8] blockdev: Add a new IF type IF_OTHER
To: Kevin Wolf <kwolf@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, Hao Wu <wuhaotsh@google.com>,
 richard.henderson@linaro.org, 
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, venture@google.com, 
 Avi.Fishman@nuvoton.com, kfting@nuvoton.com, hskinnemoen@google.com, 
 f4bug@amsat.org, bin.meng@windriver.com, qemu-block@nongnu.org, 
 thuth@redhat.com, Hanna Reitz <hreitz@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b35;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 27 Jul 2022 at 20:03, Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 18.07.2022 um 11:49 hat Markus Armbruster geschrieben:
> > An OTP device isn't really a parallel flash, and neither are eFuses.
> > More fast-and-lose use of IF_PFLASH may exist in the tree, and maybe of
> > other interface types, too.
> >
> > This patch introduces IF_OTHER.  The patch after next uses it for an
> > EEPROM device.
> >
> > Do we want IF_OTHER?
>
> What would the semantics even be? Any block device that doesn't pick up
> a different category may pick up IF_OTHER backends?
>
> It certainly feels like a strange interface to ask for "other" disk and
> then getting as surprise what this other thing might be. It's
> essentially the same as having an explicit '-device other', and I
> suppose most people would find that strange.
>
> > If no, I guess we get to abuse IF_PFLASH some more.
> >
> > If yes, I guess we should use IF_PFLASH only for actual parallel flash
> > memory going forward.  Cleaning up existing abuse of IF_PFLASH may not
> > be worth the trouble, though.
> >
> > Thoughts?
>
> If the existing types aren't good enough (I don't have an opinion on
> whether IF_PFLASH is a good match), let's add a new one. But a specific
> new one, not just "other".

I think the common thread is "this isn't what anybody actually thinks
of as being a 'disk', but we would like to back it with a block device
anyway". That can cover a fair range of possibilities...

thanks
-- PMM

