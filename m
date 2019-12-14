Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A2E711F44D
	for <lists+qemu-devel@lfdr.de>; Sat, 14 Dec 2019 22:44:03 +0100 (CET)
Received: from localhost ([::1]:33638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1igFCk-0000Zp-4m
	for lists+qemu-devel@lfdr.de; Sat, 14 Dec 2019 16:44:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44734)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1igFB1-0007K1-Tn
 for qemu-devel@nongnu.org; Sat, 14 Dec 2019 16:42:17 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1igFB0-00037R-Jb
 for qemu-devel@nongnu.org; Sat, 14 Dec 2019 16:42:15 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:44097)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1igFB0-00034v-Cp
 for qemu-devel@nongnu.org; Sat, 14 Dec 2019 16:42:14 -0500
Received: by mail-ot1-x343.google.com with SMTP id x3so3737817oto.11
 for <qemu-devel@nongnu.org>; Sat, 14 Dec 2019 13:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=p9TiU/p3iswBYZrdHpdDNv4k35V7tGo3wIsIIqH6Ut8=;
 b=UmX267PJ+IKeDMSTN0V3PZv2FHiub2P2r+RC6k05+7qBd3TWpLmfwXUwrcObbEuAKb
 qdw9Bqt7kVS39SJgc6/Ht5EdxnlQ9tlvmCURQLW/TS56voA0jqE9+W1zvBYee5PcWgl8
 C7YbNPvlcrhW8OhFqvBkqRAAwGJuukZAnU8gbwUDMd1HGvciBzCgd1gg9TgaHVLxHaUP
 zo915ceyznORJxfbYwib2hxkFL0GYEi2xcMJdiNcSP34NePaydSXsxE9hgCF9oMkCiBn
 hmC2++LOmgEC++diZ7hJAV0piPgpM6ujTg9HuohGHqdGPz+sBcCW3fe0gJJK2Z7ipFAM
 8Vxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=p9TiU/p3iswBYZrdHpdDNv4k35V7tGo3wIsIIqH6Ut8=;
 b=ixPfhFuZfdbyweeSMJcLBJfEJQo/GFCdj7E+DFi0w/92l1FPoYqGv8qMjFULlRlTAr
 5TXJc7ul6/mg6cLlubZh0L94l8i+9BgN+mJH8IN5vfGhkFfpWI7pXD5mouN4u8XUoBMg
 BAXw5yP2rozTet95t+x6F4L/bpg3rsrWVUj1+L/aZ44dOr3eCWe7VexCrRgx9l+wR3R4
 +vCLqY1H2/HAxdsgpD6kR4tOLRKUH/LjmABj2n0xBx4y4fXtZ93lNKjOY+5LjjpuZHRX
 W0/mTncHigDGRzUHLBYVR4bdmh/8RKwOguzfaeTI2a94CTNUtLmvxBA6sNKbYfyd5AJz
 PGUQ==
X-Gm-Message-State: APjAAAWYpgEgW4U/rU3THn2PC0meAF4ghji6DcMxrlSSpaNrtBVhJLup
 mbjkRBgEhm+q7ANi+dmQ5Ht+ozb2yVEt3F8O384nOQ==
X-Google-Smtp-Source: APXvYqy/OPz3AmlE14QgU8VrRdOrCV26Ga9rccZipU0fmod/VFkxGGBRAPL5BNxU9UP3XWDwpKvIUN6iZPAdYPtQvdc=
X-Received: by 2002:a9d:4d8a:: with SMTP id u10mr21854614otk.232.1576340900088; 
 Sat, 14 Dec 2019 08:28:20 -0800 (PST)
MIME-Version: 1.0
References: <20191214155614.19004-1-philmd@redhat.com>
In-Reply-To: <20191214155614.19004-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 14 Dec 2019 16:28:08 +0000
Message-ID: <CAFEAcA_QZtU9X4fxZk2oWAkN-zxXdQZejrSKZbDxPKLMwdFWgw@mail.gmail.com>
Subject: Re: [PATCH 0/8] Simplify memory_region_add_subregion_overlap(...,
 priority=0)
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
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
Cc: Paul Burton <pburton@wavecomp.com>,
 Alistair Francis <alistair@alistair23.me>,
 Eduardo Habkost <ehabkost@redhat.com>, kvm-devel <kvm@vger.kernel.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 Alex Williamson <alex.williamson@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, 14 Dec 2019 at 15:56, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> Hi,
>
> In this series we use coccinelle to replace:
> - memory_region_add_subregion_overlap(..., priority=3D0)
> + memory_region_add_subregion(...)
>
> Rationale is the code is easier to read, and reviewers don't
> have to worry about overlapping because it isn't used.

So our implementation of these two functions makes them
have the same behaviour, but the documentation comments
in memory.h describe them as different: a subregion added
with memory_region_add_subregion() is not supposed to
overlap any other subregion unless that other subregion
was explicitly marked as overlapping. My intention with the
API design here was that using the _overlap() version is
a statement of intent -- this region is *expected* to be
overlapping with some other regions, which hopefully
have a priority set so they go at the right order wrt this one.
Use of the non-overlap function says "I don't expect this
to overlap". (It doesn't actually assert that it doesn't
overlap because we have some legacy uses, notably
in the x86 PC machines, which do overlap without using
the right function, which we've never tried to tidy up.)

We used to have some #if-ed out code in memory.c which
was able to detect incorrect overlap, but it got removed
in commit b613597819587. I thought then and still do
that rather than removing code and API distinctions that
allow us to tell if the board code has done something
wrong (unintentional overlap, especially unintentional
overlap at the same priority value) it would be better to
fix the board bugs so we could enable the warnings/asserts...

thanks
-- PMM

