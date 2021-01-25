Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 157A83029F8
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Jan 2021 19:21:15 +0100 (CET)
Received: from localhost ([::1]:44662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l46UD-00006y-Qb
	for lists+qemu-devel@lfdr.de; Mon, 25 Jan 2021 13:21:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l46Qz-0007FY-Vn
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:17:54 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:46898)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l46Qv-0000Xm-2s
 for qemu-devel@nongnu.org; Mon, 25 Jan 2021 13:17:53 -0500
Received: by mail-ed1-x532.google.com with SMTP id dj23so16601634edb.13
 for <qemu-devel@nongnu.org>; Mon, 25 Jan 2021 10:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=L63I9GB/SBi9dMjduAFTYS1M1zi9wLBxXjjz7RTaZqk=;
 b=GQvho3szEgN+0SeHiIYh/gVBl2EhGieojBCjF97YPtlVG2vAaME4yc/DRwnfnkg4o8
 +vQt9OMMbJm/yyW4zp9ojNIikKXXAlZL7UjpEooUd225AVuDwJoCt+Ogj/p9P8GYKBxt
 keEfXINEaGwa7lVKg7cVjEp4gTl831pUdE2SWJ/MCrWSWKF/fRpS5e5gRKcwKHUZBP11
 aos2AX8MOL1u82rnFwf87YVogkBMg3V29OixdVh6G1KkvRHw5py4Pku97kiupNBBOa2g
 GzKZf1GAzhDKFaZ0xea5k7QW9gASVlcYhZWIoIoSMREj6AV/dVVx4xTxGdiKMHlEKsOo
 1v1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L63I9GB/SBi9dMjduAFTYS1M1zi9wLBxXjjz7RTaZqk=;
 b=RSdz9N2m+pzhLdDKvYKQYBvr2blAZQ7pU3GrJ9GCnDLXapAHMVnuoXYsDpv/UrSJwu
 kz+1QVWsTOfKJBOxPj0k9rUrz1Wpk9uQxE1p8qOeOwo7+qFd3T+WTNoe+7bCjs+mu2f9
 GjE5qang/2NepOALqj+wY1/J6cG9QWo8dDURfKCKadY15fOE4lMYwcNJADwCf+TYu8Ii
 Vwv225Ld+0d//Mt02mEMDE0F5BnZ86tSAn768OdpP9Oprot+UEwiyK8Tblp7X9p36Uzw
 GWnXvsJgRc14g/rM7Vl/xNnbKXr+Kp+EkQyZNewWOwWeheBiJ2e1wjWRmD9Sik3dEtUk
 8SRw==
X-Gm-Message-State: AOAM532EuzDl3grQSikmHu+7NgiSYrGXVK2LTgDxpK5flZV2DwjLaT6G
 qfIMOT4dvlCrUgudsYbdQwVlmb1GmsIY867KOinNKA==
X-Google-Smtp-Source: ABdhPJxApEJSnTqJC4JjBysw63aPf+DDEeUoSX4KQ53gMDXPRAAcebqbWWBN3RezsiEVj3rTvMLf/Au4lISFCeBciSw=
X-Received: by 2002:a05:6402:1701:: with SMTP id
 y1mr1490380edu.251.1611598667510; 
 Mon, 25 Jan 2021 10:17:47 -0800 (PST)
MIME-Version: 1.0
References: <1611577387-4296-1-git-send-email-jasowang@redhat.com>
In-Reply-To: <1611577387-4296-1-git-send-email-jasowang@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 25 Jan 2021 18:17:36 +0000
Message-ID: <CAFEAcA85QHtmtq8AG_wEg44t7=unkp0LM=RLaD2KpUSJm5JPAA@mail.gmail.com>
Subject: Re: [RESEND PULL 0/4] Net patches
To: Jason Wang <jasowang@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
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

On Mon, 25 Jan 2021 at 12:23, Jason Wang <jasowang@redhat.com> wrote:
>
> The following changes since commit e81eb5e6d108008445821e4f891fb9563016c71b:
>
>   Merge remote-tracking branch 'remotes/bonzini-gitlab/tags/for-upstream' into staging (2021-01-23 22:34:21 +0000)
>
> are available in the git repository at:
>
>   https://github.com/jasowang/qemu.git tags/net-pull-request
>
> for you to fetch changes up to f574633529926697ced51b6865e5c50bbb78bf1b:
>
>   net: checksum: Introduce fine control over checksum type (2021-01-25 17:04:56 +0800)
>
> ----------------------------------------------------------------
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

