Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 331433C3EA4
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 19:57:24 +0200 (CEST)
Received: from localhost ([::1]:50480 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2dhj-0000Ad-9a
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 13:57:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2dgJ-0007gb-B3
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 13:55:55 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:34465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m2dgH-0002ip-H5
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 13:55:55 -0400
Received: by mail-ej1-x632.google.com with SMTP id hr1so28957101ejc.1
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 10:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hABYkDWtk2F3+KuNHjUk14kDFOwa5l8X8WHMnAamNUQ=;
 b=lmhlyGpLDuB08e3p7of5/YJwiHb/B0rgQMFEWSdM5YqaML7271p7boU22g4UNFX7ov
 5NbiSp4HPQJ6gywbsqVGb7uaSkWe5YzfUqWv4YOQMlWHGxSf7HjbyPXheHzg5FMmcJ3P
 tyQqShutcsQ4wh3sEiYr9kr4SCuM8fl3Q48xUQGq4T2DZtCAmbNP4zQpAqKJ5w+mFNYp
 QdK9chmWZ0O5ssT1uMdTg8rdWqjDxpmCFVdBOylGhYxIl/zO85zmfp089sygoU+kT1yR
 IFElOp2oL+P3raA3MWaPJUYMJDispRzsD3SOPnwN3amejniMOy+X0lp7dAKjYFKVSPFO
 oSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hABYkDWtk2F3+KuNHjUk14kDFOwa5l8X8WHMnAamNUQ=;
 b=WPvxsxGt70LI3w8b53zfnpNUP3oOj2XO/QQJBdm5AUbCUum2C1e17sLb1y4AoHsFlS
 8whMA1776kUv4W96dKHVnKOCn5LDAaqYZJri8BvEkAoRpYaoS0gFSGlANAJOJc+HjZqJ
 AU43FLfqfhCPBRg4mENelqgdi1PzFz8vtqgLH0ck5MI7atgT/9e695LohIA/72nVggqe
 zpTW0XXIcHyUabY1ytcovFWaxY1LTc/0IwIdljevTAgf7nasFtXsZpnDpcpo82YhLdQ2
 h/LY1Z+fXboCy2kXOIXMcZMh/wz+lryb1NNAs4tFj8VPxsV4jEX/5+fSHAlu4yTgl0lN
 vyvg==
X-Gm-Message-State: AOAM531mNklLUfKS/H+vfuWqKTXs1pdS1iLqF9FpUB1ZdPdu3iBRbxMi
 Rwu4RdpgY0Dzs8d0X4pQUmJKU18J5DmeUehBtWYW4w==
X-Google-Smtp-Source: ABdhPJzbkFW0qtqamcFi2sDWjGxpFvbGttvrm0cnkJTc0I7SJ61H7uwZWhjPu4l9D+EU0tywFM9TlgGDsZh3BHzjon0=
X-Received: by 2002:a17:907:a05c:: with SMTP id
 gz28mr7816976ejc.56.1626026151959; 
 Sun, 11 Jul 2021 10:55:51 -0700 (PDT)
MIME-Version: 1.0
References: <20210708151909.907124-1-cohuck@redhat.com>
 <CAFEAcA96yLiVh-gSxZdW1kNvmJHarqNH_p3HXtpp41gQ6eDuZA@mail.gmail.com>
 <87k0lzecjs.fsf@redhat.com>
In-Reply-To: <87k0lzecjs.fsf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 11 Jul 2021 18:55:12 +0100
Message-ID: <CAFEAcA-LvjTqp2u6Lj31Dy1X_E5rN=giUfo7W3ghU+ayKMsLeQ@mail.gmail.com>
Subject: Re: [PULL 00/17] s390x update for softfreeze
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: qemu-s390x <qemu-s390x@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 9 Jul 2021 at 16:23, Cornelia Huck <cohuck@redhat.com> wrote:
>
> On Fri, Jul 09 2021, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > On Thu, 8 Jul 2021 at 16:19, Cornelia Huck <cohuck@redhat.com> wrote:
> >>
> >> The following changes since commit 9aef0954195cc592e86846dbbe7f3c2c5603690a:
> >>
> >>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-07-06 11:24:58 +0100)
> >>
> >> are available in the Git repository at:
> >>
> >>   https://gitlab.com/cohuck/qemu.git tags/s390x-20210708
> >>
> >> for you to fetch changes up to 7ab3eb42b0d795f7321c4fca0ea06cb76a005b04:
> >>
> >>   target/s390x: split sysemu part of cpu models (2021-07-07 14:01:59 +0200)
> >>
> >> ----------------------------------------------------------------
> >> s390x updates:
> >> - add gen16 cpumodels
> >> - refactor/cleanup some code
> >> - bugfixes
> >>
> >> ----------------------------------------------------------------
> >>
> >
> > Hi -- this doesn't seem to be signed with the GPG key I have
> > on record for you. If I need to do an update, could you let me
> > know which keyserver you've uploaded to, please?
>
> Whoops, forgot to upload. Sent out to keys.openpgp.org right now.

I still can't see it -- can you double-check, please?

thanks
-- PMM

