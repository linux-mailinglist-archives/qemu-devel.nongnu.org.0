Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABB49340455
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 12:14:13 +0100 (CET)
Received: from localhost ([::1]:48176 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMqbU-0007KX-Oi
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 07:14:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMqaG-0006kZ-Rr
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 07:12:58 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:38472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lMqYK-0001ZD-49
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 07:12:56 -0400
Received: by mail-ed1-x533.google.com with SMTP id h13so6111946eds.5
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 04:10:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DcUIa+1DOcgs9Nce5DzuObJji5UJcKFLAXJTZH/GKI4=;
 b=RICbH/qffmFYbkOipHw00pQJH7E7bHlEENlgRFT8wOVimsN8QkDH9JtdDjNGg7qL9c
 dWQ1pm1uluFHx1JWmXfG4F9QkjlOffvAVS6Cund7/XZ+MK7e+5yE/1zXhLq5LjixNRTY
 QuozNMrOGPZs2n/cGw2ghBvyW2/IjWNGiCRBVvwNxmvSoUE5ZMJD1wGQqCtn82OAbTqV
 bDIeMiK+Mq0Nl5dbYqzXLzOGVJAzc/hQFoVmEIfmlHqxAtJV+55qqZAKXFbR5b6wFtsQ
 RN5+F7CRs4n9N9E8vdeOmj72sdlKqdmSx8WUVjQxaof/dE//fZ6TYT0ZS2aiIQttD7P5
 N2IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DcUIa+1DOcgs9Nce5DzuObJji5UJcKFLAXJTZH/GKI4=;
 b=YpkFkly1IwrHs6IwUbL4oBfb0YmDRear5BCKs7ks//LGdf5F5Gkba3+NtOKKXYvVwk
 W5r7nyMbhgMEVM+1/py/+0acdx4EPALker/L8KMq0mVAsazYeGC2JA6bKf+qmyuOrnWp
 2wS/0T3d1Z9ZT3k4hgzeFLjm7TYwV5RPnlpH6D+OQXjJb5jEiYTHtKlh1lYjcNLDHqmi
 oJI0JQPNTuoQK70oKGP4QaXQbL/27SDfp6v520k95aIBuqcEXpPc31axcVmi0YIw8F3c
 jMyI56gDRu3MzetI94HUN3R3CdYz8vGjXL9a+TQxGU7JQ/nrfZqlLeL1LaZiMUb80stv
 2Lgw==
X-Gm-Message-State: AOAM532BO9sdGIXAJ7gFEXGAXz5+WpB6zeLiKy0U1UEcEkb3pTz2l4hm
 JmSUEZMupDnhtrNoan8HesNZOSkcxUdzZ7+Xu0Fn/g==
X-Google-Smtp-Source: ABdhPJzQVjndEfrt3uzZ+OKG4nrJdGnp+JPnVwk/xz0aFrZk8sCw+m4m37E8kILXZCopNqrQNnJjFJWEwkI8BiLDx5I=
X-Received: by 2002:a05:6402:4244:: with SMTP id
 g4mr2955188edb.204.1616065854379; 
 Thu, 18 Mar 2021 04:10:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210315204226.3481044-1-laurent@vivier.eu>
 <20210315204226.3481044-6-laurent@vivier.eu>
 <2730eee0-6f1b-2139-f93c-6a0a64727e29@redhat.com>
 <905c797a-25c3-bb43-5946-54b28d9530c0@vivier.eu>
 <d515dabd-b84d-5aa3-0bf5-d824bdc7da6e@redhat.com>
 <ffa12ba8-4988-b464-2267-5d14c59b43ab@vivier.eu>
 <a90be442-97c9-cefc-df6f-655a6387d54d@redhat.com>
 <CAFEAcA_BcRkJHjoRaxQs2ZO=JJqPpvGhHkG2bNJOqh_-EHr_xg@mail.gmail.com>
 <0644d4cb-cfc6-83f0-5887-2bff29cb58c4@redhat.com>
In-Reply-To: <0644d4cb-cfc6-83f0-5887-2bff29cb58c4@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Mar 2021 11:10:30 +0000
Message-ID: <CAFEAcA-6xAHOBC5e2uEh1EkXmWK+k9d5By9aXugA7hbxC8fZiQ@mail.gmail.com>
Subject: Re: [PULL 5/5] m68k: add Virtual M68k Machine
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 18 Mar 2021 at 10:45, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 18/03/21 11:40, Peter Maydell wrote:
> > On Thu, 18 Mar 2021 at 10:37, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >>
> >> On 18/03/21 11:06, Laurent Vivier wrote:
> >>> This also removes the virtio-devices test, I think we should keep the
> >>> files, but in the files to disable the PCI part when it is not
> >>> available.
> >>
> >> I think we should just shuffle the targets in the gitlab YAML to bypass
> >> the issue.
> >
> > Then we'll hit it again later. I'm pretty sure this isn't the
> > first time we've run into "some test makes dubious assumptions"...
>
> We can both fix qemu-iotests and CI configuration, but m68k is certainly
> not the culprit here.  And we are going to make more assumptions over
> time, not fewer, in order to keep the CI time at bay.

I don't see why CI time is relevant to whether the test says
"I require X,Y,Z, so don't run me on configs without those"
or whether it just randomly assumes X,Y,Z are always present
or that if it says "I require W" than W must imply X,Y,Z...

thanks
-- PMM

