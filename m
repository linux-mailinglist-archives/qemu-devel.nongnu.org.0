Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2107D3C6281
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Jul 2021 20:17:33 +0200 (CEST)
Received: from localhost ([::1]:59054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m30Um-0001s1-7D
	for lists+qemu-devel@lfdr.de; Mon, 12 Jul 2021 14:17:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m30T3-0000Wa-5R
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 14:15:45 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f]:34640)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m30T1-0006Vr-Ds
 for qemu-devel@nongnu.org; Mon, 12 Jul 2021 14:15:44 -0400
Received: by mail-ed1-x52f.google.com with SMTP id ec55so4506018edb.1
 for <qemu-devel@nongnu.org>; Mon, 12 Jul 2021 11:15:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KPwnKziYaJi7gT9Dj+MDs3xnWNzYveTHX+aLg0cmpm4=;
 b=MMjdxALQ9EVXqK9uFnUG7UTwlwQ5Z9PHqtNlUSJ6duwLZhpo6qpNAZnstQvFO5AOIP
 oqZYHROlW16dbvsI8H7lgD94aiiw2gzeXUcfs9EtVes80Fw7Ky76EKBtEcKsjpg0fHX2
 Ak+StFa19njqEx9HIh5afDTlWWa3f4THxs8kuI6Jpl42RpfmUH9BOKtv/iUm0J9+8QWs
 fJ5LTa5XVN3swKz1eOvSnFwl3vx+ZrY+DDhBc2sUDPn5Q594DbUOv6/Vh19JBUATxP8B
 C6zst5L7tn60pIzQh5TFVBl+7EqmoaQFSfgcz74afQuNMMyI+jxx1wOR7gzrznVqR4vU
 pbzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KPwnKziYaJi7gT9Dj+MDs3xnWNzYveTHX+aLg0cmpm4=;
 b=izvjdK937LL6amPBzG8JDQaaSfhozzTXb0FF1EjU38LSM/ujjShCdf75di5n4LvSP2
 CXysfOxV9j9kE7hbd2w65eqcbsr9X5mY95/NUzADSL404JxiKwbPd8qRaxpInF/ytYcl
 8HmCpfSLhezlOchAwolVeg9rKsTDLZRTzwE2coid9glEP9NylMkbgV1xowL24+zsv/VB
 ka7KCvHC13LY5od6SNsxlUw/ghPD6jVtOrwORFi47FpOozYk9K92h1HY5S3BW1pbUbhJ
 Rsc9fSCqvKTj+6XJrzuV4EJvGOQSP6sxooFDilJ5bJHbJD49A53u6BxQfPME+9AbB7pW
 HuKw==
X-Gm-Message-State: AOAM533A24hmA09HeOr0vwDOGlplWVM9+ouwp7cAVQsIit0uJdV9MGAs
 lbCsfwDB18RIS4MszCeF28DnR0xW0k+A2KHIEKuHnQ==
X-Google-Smtp-Source: ABdhPJyQHcPvVd5e0M0hYT2Hh85xw42/5YRoKCWJ4KOcS6O9YHxQ+M7QEbj/0Ky8qZgrL+6zr1hweMHjnzFJ+GvXDdI=
X-Received: by 2002:aa7:c6d4:: with SMTP id b20mr128774eds.204.1626113741667; 
 Mon, 12 Jul 2021 11:15:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210708151909.907124-1-cohuck@redhat.com>
 <CAFEAcA96yLiVh-gSxZdW1kNvmJHarqNH_p3HXtpp41gQ6eDuZA@mail.gmail.com>
 <87k0lzecjs.fsf@redhat.com>
 <CAFEAcA-LvjTqp2u6Lj31Dy1X_E5rN=giUfo7W3ghU+ayKMsLeQ@mail.gmail.com>
 <87h7h0doc5.fsf@redhat.com>
In-Reply-To: <87h7h0doc5.fsf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 12 Jul 2021 19:15:02 +0100
Message-ID: <CAFEAcA8Pwz7=H6yZ2tDJAAYvYyLKOy-Az-Zq9N8F3kS8Tqz=XA@mail.gmail.com>
Subject: Re: [PULL 00/17] s390x update for softfreeze
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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

On Mon, 12 Jul 2021 at 07:43, Cornelia Huck <cohuck@redhat.com> wrote:
>
> On Sun, Jul 11 2021, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> > On Fri, 9 Jul 2021 at 16:23, Cornelia Huck <cohuck@redhat.com> wrote:
> >>
> >> On Fri, Jul 09 2021, Peter Maydell <peter.maydell@linaro.org> wrote:
> >>
> >> > On Thu, 8 Jul 2021 at 16:19, Cornelia Huck <cohuck@redhat.com> wrote:
> >> >>
> >> >> The following changes since commit 9aef0954195cc592e86846dbbe7f3c2c5603690a:
> >> >>
> >> >>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-07-06 11:24:58 +0100)
> >> >>
> >> >> are available in the Git repository at:
> >> >>
> >> >>   https://gitlab.com/cohuck/qemu.git tags/s390x-20210708
> >> >>
> >> >> for you to fetch changes up to 7ab3eb42b0d795f7321c4fca0ea06cb76a005b04:
> >> >>
> >> >>   target/s390x: split sysemu part of cpu models (2021-07-07 14:01:59 +0200)
> >> >>
> >> >> ----------------------------------------------------------------
> >> >> s390x updates:
> >> >> - add gen16 cpumodels
> >> >> - refactor/cleanup some code
> >> >> - bugfixes
> >> >>
> >> >> ----------------------------------------------------------------
> >> >>
> >> >
> >> > Hi -- this doesn't seem to be signed with the GPG key I have
> >> > on record for you. If I need to do an update, could you let me
> >> > know which keyserver you've uploaded to, please?
> >>
> >> Whoops, forgot to upload. Sent out to keys.openpgp.org right now.
> >
> > I still can't see it -- can you double-check, please?
>
> Hum. Now sent out to pgp.mit.edu and keyserver.ubuntu.com as well, in
> case something went wrong.

Thanks; was able to get it from keyserver.ubuntu.com; now
processing the pullreq.

-- PMM

