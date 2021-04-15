Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4260B3609A0
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 14:42:05 +0200 (CEST)
Received: from localhost ([::1]:55892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lX1Js-0007Ae-CT
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 08:42:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lX1F1-0004BS-Tp
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 08:37:05 -0400
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634]:39662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lX1Ez-00035P-I7
 for qemu-devel@nongnu.org; Thu, 15 Apr 2021 08:37:03 -0400
Received: by mail-ej1-x634.google.com with SMTP id v6so35329842ejo.6
 for <qemu-devel@nongnu.org>; Thu, 15 Apr 2021 05:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Yt//deazkWWgZJCLeaSWIi0B8z9gLGVxw/9qkxIc0kM=;
 b=KZIhERybOXHPIuy09yMkn7QGGThKvxIKpq1NTU1iSh/K72Mx8/Kabw6hqeJwgZPHi5
 VnoUnZjpd7uquw+fO+opNk8dYHGCGNgcKwh3Pf02bdC2Ir3UT9ku+vtb6GHoxJ0eU2F6
 52NfegshPYk87bZxj2SLWpLwve0x942IxNgs1695BvXQOzgJwVesSFp6dyltvYPswEld
 DJJBmh2OvNL8PoQFHld9fYfAkoCwonjzc90KyxtgkDMChLgiROF4DMnTc+TmOwPtq5Lb
 sFtBa3PMOvpkPxrNUdBzGOqYNTfwPWSHxijFTHlwemArxfrkm25mEX/9V4/y0V/EpnBx
 LDwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Yt//deazkWWgZJCLeaSWIi0B8z9gLGVxw/9qkxIc0kM=;
 b=qk5IlDYd4tD7hitZnRofeRb6nqKmTD5K+mF6Zxyt2r+x+dO/xZXbLNyLOnijjooriN
 ftSqJ+X812UaUdJs1kbamTaNz7to8nFdgrQkKH/uvzn1B2tKwQoan8EnQduXgWB3OvjA
 FL56uS4GwT1Zm9PG88mcyi+0HsYgnmBwgByEUys8a8NamHU3TUxdMJvFL4BUjug1/fWu
 9BYnYknwZyWCYVJxr0PqKVR0pgJVJhBFzf1SJL4U95AZSZVWJtyzUvnuvzJ9cTCqgV22
 QlSFJLOjO09wOwaBnTdPxF6spmeEhUe0Q0DlwywxcvBGxW0IwD1YVQJ14BQGPsya5iV3
 NGYA==
X-Gm-Message-State: AOAM532x8vG3tf3LnCI01OqglDYq0hKDlydfpXtlCH33ufCDX4QffGXU
 wHdsEK0MwGG7vfkUp7zPYhgt9PbKtwPX7lxTrNb3ZQhIBrQ=
X-Google-Smtp-Source: ABdhPJzFDaP08thCa8EyQdaD4efvCxrmbWO09LzMiI754LKeJi9Sg+pPbBaUI2PECvqN6YJgwZyvaRp0zcojRw0i/pk=
X-Received: by 2002:a17:907:629e:: with SMTP id
 nd30mr3157257ejc.407.1618490219616; 
 Thu, 15 Apr 2021 05:36:59 -0700 (PDT)
MIME-Version: 1.0
References: <161834460731.13851.12350778402155141357.malonedeb@chaenomeles.canonical.com>
 <87fsztny5a.fsf@dusky.pond.sub.org>
In-Reply-To: <87fsztny5a.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Apr 2021 13:36:12 +0100
Message-ID: <CAFEAcA-=85_YdVpQMURN6TVJ67MRbj4NCx8fAPrWWUFYBWG5aQ@mail.gmail.com>
Subject: Re: [Bug 1923663] [NEW] Can't(?) disable default floppy drive any
 more in qemu 6.0
To: Markus Armbruster <armbru@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::634;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x634.google.com
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
Cc: Adam Williamson <1923663@bugs.launchpad.net>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 14 Apr 2021 at 08:07, Markus Armbruster <armbru@redhat.com> wrote:
> In my opinion, management applications are better off with -nodefaults.
> It's easier to understand than the complicated mess I'm going to
> describe under "Long answer" below.

Is there a mechanism to get QEMU to tell me "what are all the
long options I need to specify explicitly now to get the same
behaviour that I had before I started passing -nodefaults" ?
Otherwise it's a pretty painful route to suggest that people
go down (though I agree that for a management app as opposed to
an individual user it's probably a worthwhile route in the long
term).

-- PMM

