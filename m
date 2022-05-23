Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE984530D4F
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 12:41:52 +0200 (CEST)
Received: from localhost ([::1]:35476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nt5VX-0007Tv-DD
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 06:41:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49264)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt5Or-0002e7-G9
 for qemu-devel@nongnu.org; Mon, 23 May 2022 06:34:59 -0400
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:36555)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nt5Op-0000H1-RS
 for qemu-devel@nongnu.org; Mon, 23 May 2022 06:34:57 -0400
Received: by mail-yb1-xb30.google.com with SMTP id t26so24597375ybt.3
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 03:34:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=AJTlxuLrTQj8YIyYqIOHdaqDuai7TDAJX0ZKXUvPTaA=;
 b=ojec7nO4g9JzS4KLJKx9FD3hcvZQ/JqDRYb199xD83ITC/3lRkiWkzdTN5UZdoI3Jt
 l/kbm4rWqvB9GiShloH21ekSlZmiWU6a4muE6ZTKPB1nGBRO6Msk8UEflfQ5PKSmiNIu
 tYmvTrwz1eLDiEitLE9ZInxpeKbvjwWZ4JG9UcbGd4Eaqi1TiwhGKJDck2aOT0yNnny6
 c2zKnwOEr6jwmlsmhUG8HenMx5XOl1WxlFUh+QkG4HfTV8ttHs4/Hi5OrNia7/BzhmJC
 GTavuNfc9SE6s2+ibggQR8ftrRKo6Or3BYf6tkPGZmHENyjVt6jWrrvn/kGNCS1UJ+gd
 ghTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=AJTlxuLrTQj8YIyYqIOHdaqDuai7TDAJX0ZKXUvPTaA=;
 b=JVDtkbsJTBfVaK94ynLkXJNlHvpYHZ3jegFohkHQdB/ndf7+dlh5UqVSMTDfjFZIWl
 rz9V4uFDDkAXvcMmGR9jOOFf5+mM/g85/h4s+PF5fz4dB+Jafb/GAtu7FF377yUu83Kq
 BBa6la4N1RX7+guY0ZBw3ANuxkH7E/m6wlkCKvmZRpLfojTaq/TWU7RfLmuSKHygs3YY
 ixWSCjV7N24e8KBRFr0mHYj7rFDUOQGztHHigmqt+ZzD7RKRVF4iER3Yk6t/3+Fz6dbm
 mNofW+karuVcdiB99NU4X+9846q1VHU7loEpDGi6osMy97uyfUFR44y88hqyEr2M8pms
 BDvA==
X-Gm-Message-State: AOAM5302bkLkT4POCSxQXnUSRARCqnfNfwXktu1E0n4TN/3tcCJQDugG
 GlivaCaPXyornRFgsR2IfkWRfovcA9WCH5C4WrROLA==
X-Google-Smtp-Source: ABdhPJx4lh6axCHMFfZuEMBQNKkedWDj0kDZKy/Y6IKDEygEzcNnrT1I7SdBCDWBEqc7UzFV4IwcS0/9l6B4278eVEk=
X-Received: by 2002:a5b:14c:0:b0:64f:c826:a76b with SMTP id
 c12-20020a5b014c000000b0064fc826a76bmr5606735ybp.479.1653302093459; Mon, 23
 May 2022 03:34:53 -0700 (PDT)
MIME-Version: 1.0
References: <20220523095629.144441-1-dgilbert@redhat.com>
 <CAFEAcA8G0foQ0WrvknfdCTOUZHNEomJmB19xxTmjdzrS6xv18w@mail.gmail.com>
 <Yotg4WL1RYpiLfM2@work-vm>
In-Reply-To: <Yotg4WL1RYpiLfM2@work-vm>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 May 2022 11:34:41 +0100
Message-ID: <CAFEAcA9=QCsXXgCEpy3aiO0X5h1hzOtX3ZXw+VyqvdUuMW_SnA@mail.gmail.com>
Subject: Re: [PATCH] Trivial: 3 char repeat typos
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-trivial@nongnu.org, laurent@vivier.eu, 
 mjt@tls.msk.ru, danielhb413@gmail.com, clg@kaod.org, mst@redhat.com, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b30;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb30.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On Mon, 23 May 2022 at 11:24, Dr. David Alan Gilbert
<dgilbert@redhat.com> wrote:
>
> * Peter Maydell (peter.maydell@linaro.org) wrote:
> > On Mon, 23 May 2022 at 11:09, Dr. David Alan Gilbert (git)
> > <dgilbert@redhat.com> wrote:
> > >
> > > From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> > >
> > > Inspired by Julia Lawall's fixing of Linux
> > > kernel comments, I looked at qemu, although I did it manually.
> > >
> > > Signed-off-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
> >
> > Checkpatch would probably ask you to fix up some of the comment
> > styles when you touch some of these. Either way:
>
> The only one it actually moaned about was hw/pci/shpc.c's comment style.
> Does this need fixing in this patch?

Personally I would fix it, but I don't insist that you do
(hence "Either way").

-- PMM

