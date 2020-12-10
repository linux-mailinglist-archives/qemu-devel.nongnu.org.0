Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C9182D6220
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Dec 2020 17:39:55 +0100 (CET)
Received: from localhost ([::1]:45006 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knOyw-0004qW-Eu
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 11:39:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knOmP-0004bQ-GG
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:26:57 -0500
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:34845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knOmJ-0002fD-SJ
 for qemu-devel@nongnu.org; Thu, 10 Dec 2020 11:26:57 -0500
Received: by mail-ej1-x62a.google.com with SMTP id f23so8173546ejk.2
 for <qemu-devel@nongnu.org>; Thu, 10 Dec 2020 08:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=iPZSdN6BTy+2c7o6oD+l6LkXLCC+kKNKffrZHy9E/LQ=;
 b=esJmRb47epD7TyXSHcvRIHxJFOt6IkGbdwNJZkYuh97Jh0a9P0MmqyIOJYUv548kPd
 qP5wGi/rXZxq3YxDqecv1TEom7XJlbweSO9lEaCs2aPPM1S1GvC6X9RGZjxa9a+BwqCP
 uaNfOSZDI6I58Y3mjIAiCqvIRyyllJ8/lpUde6v0XNN1vS7crf5mogBehMLwKCY8r4Y/
 T2/lRZXsoE1IgsANJ2PRbwduwmbGKc07y8JvjC7SGFoZSON8YnV8MfOHi2hrknJ8im7X
 Jfm1REMho9Fak+8Oc7ts/T2DpOddeqc5BzFHZ63ILMTNShyGIzu2awk4E6qpXEVtbiwV
 Oxcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=iPZSdN6BTy+2c7o6oD+l6LkXLCC+kKNKffrZHy9E/LQ=;
 b=U4akhqLhmpPdbqxW1U/xHxXwvp4LhTPJm4Qbz6zAbOnPvIJwBA7S5eoqudtLv00U1u
 DNfl1rZP8wPh5iq74bfmPRUuwqyniUhGSYhEHoNlldWafkr6kn8v1yc9e7f/0qslgVow
 9tPuJCsTCHaVNurittn291+zBP9WCG/rU5FcKYmJJjSa3POln6xliPqDoWh3bEn1RdMp
 wq7EzWggFHbVH10u/pIs1hblI0vuZDjEYmZjrOveAagFmAxZUjxZl6IPt/9pjDUT2kB8
 uOaES3g/LsKgpTloLK9HI04mGFnTciVKGqI97bJCr1jojOjmHaCagL05AwOe4to1kREZ
 ZqYA==
X-Gm-Message-State: AOAM532jIdbpVCr2kIQmJRa9YCEbwl8MmibgUeTMnu7W4O57fC/eEzLw
 r8IPo+bu1szGydWP/7EYTOLNtLmhUpH6v/oEbtZmdg==
X-Google-Smtp-Source: ABdhPJx59sawjS/8skBJ9pZ1AO1g4R+Wk2dJ9UG5jctGMznSwUa5R9LxiK9UvZTabwm9NfNHbyRxFz+r6miWY978pRc=
X-Received: by 2002:a17:906:6b88:: with SMTP id
 l8mr7206937ejr.482.1607617607798; 
 Thu, 10 Dec 2020 08:26:47 -0800 (PST)
MIME-Version: 1.0
References: <20201209180546.721296-1-mst@redhat.com>
 <20201209180546.721296-49-mst@redhat.com>
 <CAFEAcA9tgAJeTVPauNEvRfK8d9_-wAH_aQM6K+bXfweoX78m-Q@mail.gmail.com>
 <CABgObfbNO8jWz-AR9WumNAh62un3hsHKcGOQBEshSzyQOHjP_g@mail.gmail.com>
In-Reply-To: <CABgObfbNO8jWz-AR9WumNAh62un3hsHKcGOQBEshSzyQOHjP_g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 10 Dec 2020 16:26:36 +0000
Message-ID: <CAFEAcA9CWVXbfxeOth22nvS8K16dMb0z556LdfKzdYirkKyOhA@mail.gmail.com>
Subject: Re: [PULL v2 48/65] libvhost-user: make it a meson subproject
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 10 Dec 2020 at 16:17, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On Thu, Dec 10, 2020 at 5:11 PM Peter Maydell <peter.maydell@linaro.org> =
wrote:
> > Looking at the commit, it's not clear to me why the
> > vhost-user changes have resulted in all binaries getting
> > a change to their link line. Paolo ?
>
> Because libvhost-user/meson.build is not using the GLIB flags from
> QEMU's configure and is not honoring --static, so whatever links
> libvhost-user-glib.a will get the shared library copy.  Marc-Andr=C3=A9,
> you can try using override_dependency but I wouldn't mind reverting
> this instead.

It turns out I can work around it with --disable-vhost-user, so
we don't need to revert it entirely, but it would be nice to
fix the bug.

thanks
-- PMM

