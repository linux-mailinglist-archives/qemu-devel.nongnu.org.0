Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A0AD671584
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jul 2019 11:50:50 +0200 (CEST)
Received: from localhost ([::1]:40726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hprRZ-0002ss-Sr
	for lists+qemu-devel@lfdr.de; Tue, 23 Jul 2019 05:50:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51294)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hprRM-0002Tn-VV
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 05:50:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hprRM-0001IE-2o
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 05:50:36 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:45192)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hprRL-0001Hr-SB
 for qemu-devel@nongnu.org; Tue, 23 Jul 2019 05:50:36 -0400
Received: by mail-oi1-x242.google.com with SMTP id m206so31836856oib.12
 for <qemu-devel@nongnu.org>; Tue, 23 Jul 2019 02:50:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7G2rW9mX4JjSjfDb2TZc8qUcmgSFHaKc79K3qyw+0II=;
 b=cSMAvPJK8Xd0ud+MoFM5JlZajzkgxmfcu3lkMze464zPOAWOn2vVffyG8ACWS0I3st
 T1GaJEVn6cEVz4izZD/u1tXqgvKglz0XxbIL2VMOMj+uCoQVk7ATb9/eL4WaYc2UzHJk
 H+SyExmHf1t2up175YrgC6CTNpGRpWwUFFWwr4RAl4R4r/qquGxNxDS3AdnHMa2Mi4yU
 5N0+upFgbuPnNn30kwn+Tfic12SkDaU7SbEUZNG/Poi/BVba0wVbKgbyyO0ta2Pip3Pg
 wkKY00y3TkrLF83qm60RJAc2xRGlydLo00gUE+ln9pil1foNIJQFhXt7QO2EZ3j+qVhT
 Kqsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7G2rW9mX4JjSjfDb2TZc8qUcmgSFHaKc79K3qyw+0II=;
 b=aQ78WfsIBiatKhqZQCH7hrkQs0LWmb8hpQA8MyR+/EXIxM9hPgFiDi2e0I720KJGLR
 AekasLdrfcE1yd3SCyOfRWaY0Xa7F3Q14qEAX/eUrTmpGSjJ3JhGZvw/6QxArV78W2wE
 dj1TMZ+6x5cauiD3QsuVf7yIA8iiwa8MuZOweS0ifaGSqWNyh2xKte1Xkg6P5hlwIAOU
 JGdqdUfDHytTPccUSELhis0oLPNG45h5s0/8+pN58gd9m6996qQWaAbpQvron7IiP23v
 g1YekSapVtzsROe983TTsoVq4DNpLOcQCBnCV8b0UdWEJzJU2VqRRQIE8OSvrR+vdjQc
 dFig==
X-Gm-Message-State: APjAAAWTxlpmF8dD54o+FByv2240LifFIJCuiHIgDxyc2rNcfI2s4PVS
 VvMXG06J/DuMezlieAyrZeERKVoFvv2L+auL92s4vg==
X-Google-Smtp-Source: APXvYqw+Kx27etY1RlAe5+yfp4QX2pKYgabj9jmd1QJ4b5QshHR7Mj3HGQKXdEsPf0ZA66K4CEf4jKLGCJUh3n/B3m4=
X-Received: by 2002:aca:5cd7:: with SMTP id
 q206mr33546394oib.146.1563875434840; 
 Tue, 23 Jul 2019 02:50:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190723090718.14590-1-sgarzare@redhat.com>
 <20190723090718.14590-2-sgarzare@redhat.com>
 <CAFEAcA_KspUxk75hR4YV444tj8-bQKOJ_4eq+aPD-idZ12Lzwg@mail.gmail.com>
 <20190723094241.7znxmk3wa6gti6tr@steredhat>
In-Reply-To: <20190723094241.7znxmk3wa6gti6tr@steredhat>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 23 Jul 2019 10:50:24 +0100
Message-ID: <CAFEAcA90Atw2KC-9zc5fM8oY8ikPDms1+UKtaj=YJcpq48PMSg@mail.gmail.com>
To: Stefano Garzarella <sgarzare@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-devel] [PATCH 1/2] elf-ops.h: Map into memory the ELF to
 load
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Julio Montes <julio.montes@intel.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 23 Jul 2019 at 10:42, Stefano Garzarella <sgarzare@redhat.com> wrote:
> Reading the 'g_mapped_file_new_from_fd()' docs [1]:
> "If writable is TRUE, the mapped buffer may be modified, otherwise it is an
> error to modify the mapped buffer. Modifications to the buffer are not visible
> to other processes mapping the same file, and are not written back to the file."
>
> I don't know what "error" means, but reading the second part I thought
> the changes in that case were only visible at the current process.

Ah, I misread the docs here (and thought the following paragraph
which talks about changes to the underlying file becoming visible
to the mapping process was talking about changes in the mapping
process becoming visible to the file).

So I think the answer is that we do want to pass writable=true.

Looking at the implementation, we always use mmap()'s MAP_PRIVATE,
so we get a copy-on-write mapping that doesn't change the underlying
file. The effect of the 'writable' flag is that we use PROT_READ|PROT_WRITE,
so if we don't pass writable=true we're liable to get a segfault.

thanks
-- PMM

