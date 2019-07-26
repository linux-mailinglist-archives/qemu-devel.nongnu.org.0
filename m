Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 944E4762F8
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Jul 2019 12:01:59 +0200 (CEST)
Received: from localhost ([::1]:37890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hqwu4-0007c1-OD
	for lists+qemu-devel@lfdr.de; Fri, 26 Jul 2019 05:52:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59184)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hqwtn-00079J-GO
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 05:52:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hqwti-0005Zg-A3
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 05:52:24 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:43461)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hqwti-00056d-3u
 for qemu-devel@nongnu.org; Fri, 26 Jul 2019 05:52:22 -0400
Received: by mail-ot1-x344.google.com with SMTP id j11so30485824otp.10
 for <qemu-devel@nongnu.org>; Fri, 26 Jul 2019 02:52:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=4mYSBdPiIPkzLnUxeR75ZEp7DWfaNSOgQ2gziwNFtU8=;
 b=fXDWMeH9q9LcoJgZ1/hxdIsjG05fgznICbZBxTqU/hZ2JBB7xhkjb6h31GocBw5DiE
 ZoMHxI7w7foACg3vPx6M2e0VkAKB9SMB9zeJXd65+tdHAZT5a92mFgp+G33VZ6wQCvIj
 xI7VHRBMR63kta6TWtb177UXhPVe9mr8YGMOw1o/59U6JbzWxc82A130zcAhLgmzznUe
 a3PjFLEXdis6j0PF5Yw1Xr/7GdHejzFFXH4VzkfmIvjnNGDLOhnhrPv6PFFTtxxhVlVw
 9SmIz9SvIofOoIEf6l3CV/b1LgS+v3+U+JB4uaSmlknr5NEMVY/hrWk+9x2D+P7heb7v
 oF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=4mYSBdPiIPkzLnUxeR75ZEp7DWfaNSOgQ2gziwNFtU8=;
 b=We0Aqyzax6IqgdQSzdLpouVTtzgOjeklB0xMyWGgXDooYnLxnWKVwtWGZK0h7gPG+j
 F2IQDaCSGN9yXEPJrdnpM4UIQcOEo1Q6/QSR/WtpPzlm4piAYn0k22QFDAgcKKi5mJCi
 ax54j6nF7lw96xxvSGO8U9m6kCjmDVH8ofcLeDWubtjq5DVEGgeKe1lpGd1j8nf9vuWQ
 kzhD1N1pcF4CukNP2CM8KTRXLLKqwMICiqR7YJCqtBAoMHDKTSqrLaV8cXYa9H2BCbVb
 v6BLrKxtFLPlXxskskC29dyuiNdwceEEn3uh3O3nfFvDhWizNv9f8AeuWfoAVMLrLiuG
 zA7g==
X-Gm-Message-State: APjAAAUijKWyj6XmDxABM+978r53du+GDGODkUWxTXT3RBFRk6rtCL3b
 tKDVhCdlGeoXhNpMt1cy1PUXFgVFkB/63w8DThlRZw==
X-Google-Smtp-Source: APXvYqwuH0o5Ei/wGj1kGSpy1V/53uZ0DjChhxHX9kYM/NcQNQ1SAk17gzCnv6cSXY2sNRuvVhLQ9Bk1m6A+jFzYk+w=
X-Received: by 2002:a9d:6a0f:: with SMTP id g15mr39502736otn.135.1564134736255; 
 Fri, 26 Jul 2019 02:52:16 -0700 (PDT)
MIME-Version: 1.0
References: <20190725163710.11703-1-peter.maydell@linaro.org>
 <20190725163710.11703-2-peter.maydell@linaro.org>
 <20190725170228.GL2656@work-vm>
 <c5a0799e-2ebe-5a79-915a-af52d471a589@redhat.com>
In-Reply-To: <c5a0799e-2ebe-5a79-915a-af52d471a589@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jul 2019 10:52:05 +0100
Message-ID: <CAFEAcA8PROpFeKfxXFdVvVoZaus-MsX_EHGxw+yEUty_mnQdMQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [PATCH for-4.1? 1/2] stellaris_input: Fix vmstate
 description of buttons field
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
Cc: Damien Hedde <damien.hedde@greensocs.com>,
 Juan Quintela <quintela@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 25 Jul 2019 at 18:40, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 7/25/19 7:02 PM, Dr. David Alan Gilbert wrote:
> > * Peter Maydell (peter.maydell@linaro.org) wrote:
> >> gamepad_state::buttons is a pointer to an array of structs,
> >> not an array of structs, so should be declared in the vmstate
> >> with VMSTATE_STRUCT_VARRAY_POINTER_INT32; otherwise we
> >> corrupt memory on incoming migration.
> >>
> >> We bump the vmstate version field as the easiest way to
> >> deal with the migration break, since migration wouldn't have
> >> worked reliably before anyway.
> >>
> >> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> >
> > OK, it would be great to change num_buttons to uint32_t and make that a
> > UINT32 at some point;  it's hard to press negative buttons.
>
> Since the version is incremented, now seems to be a good time.

...except this patch is for 4.1 and we've already done rc2,
so it's not really an ideal time to put in code cleanups...

thanks
-- PMM

