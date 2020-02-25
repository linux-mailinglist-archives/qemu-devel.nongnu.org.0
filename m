Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12D0D16EC3A
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Feb 2020 18:13:03 +0100 (CET)
Received: from localhost ([::1]:60868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j6dlV-00021x-MR
	for lists+qemu-devel@lfdr.de; Tue, 25 Feb 2020 12:13:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47678)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j6dkL-0001bP-DJ
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 12:11:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j6dkK-00029u-Fv
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 12:11:49 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:33291)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j6dkK-000290-Aj
 for qemu-devel@nongnu.org; Tue, 25 Feb 2020 12:11:48 -0500
Received: by mail-ot1-x343.google.com with SMTP id w6so251616otk.0
 for <qemu-devel@nongnu.org>; Tue, 25 Feb 2020 09:11:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P37E6KBGaD5heJy++bsYKawy4U+DZQUFkA1OEW6vGfc=;
 b=z1OSn8ZGy7rejlVWIfMDcFmEIcigUFrkZyld6ncqDaMgNRa9ISUuajxgZwPYdSSQmZ
 YMvRU1S70JCBYe6ha+AzJB5H5a1vMSvi7R22ghXGCv2giBlS7hCULChe/xUDaThSg/kK
 Bw8gHIdMvvSSHH1M1WsteS3bN9sFedAsDCI4Lss7iohUMKPawLqmJWs1XFzst7CXu2X/
 JLgjvci3k7FHIt3njl/0gXuJ+p7mt1ajS7Et48zKx1POpx3KEhsbCvL1trdCbt+mv37S
 YDzXdOYtX8gTMO+Ku/ikEnk3yijU9/CqavFb/CARHdoF/9wENGfrIL+m1HR5im8N2PET
 R72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P37E6KBGaD5heJy++bsYKawy4U+DZQUFkA1OEW6vGfc=;
 b=C0FtXaDD2R2I9vjpfGrenfwxdSxeTSECifypy6iEp0TdnN1XsBMy+GfQe9ynTv0dZV
 E0Gv0Hjp8fAqDtrbWjKnBVuxnhywg9mUULS14hZEixE65octhTexV2s7agBTZPIbPi1+
 hvWLqU0A3zoy1rdbgsICfmHImgOcLMB/gQZ9UXNVrhIF5Q2vLHiFaAdabShuFoOX0EGP
 /Xr8ukh7ldtTE3EvPbQAiZR6lQHL4dhrpwS7adksdnjbH2giN+/d4xQ0WoRFL6IznbLY
 yK+rpwM1srJxusvl+rIE2Kx60Sth7xNtpTTha2SddJgrhVrc0inJTVQTJdXFAwpOHb2r
 LR/g==
X-Gm-Message-State: APjAAAV7w0LkHmX0yfcyAYpavaX7LKQkXsx9F/VhJ1QIkM95sMlwMenV
 4Ap/fuvGRtgQrZB6GtzssWPXTVA4b9BskC0lh0tr2Q==
X-Google-Smtp-Source: APXvYqyNiducVBcKWHJMjp4mTCYfane3hR1toWqLdlhfmiYUhW1/Z97fBKywnJAFJlNcjy/6W8sDKAM2wk81XZsjjIo=
X-Received: by 2002:a05:6830:13da:: with SMTP id
 e26mr42552334otq.97.1582650706999; 
 Tue, 25 Feb 2020 09:11:46 -0800 (PST)
MIME-Version: 1.0
References: <20200225154121.21116-1-peter.maydell@linaro.org>
 <5a6757cb-fda2-ba3f-6c24-f09829faf4ab@redhat.com>
In-Reply-To: <5a6757cb-fda2-ba3f-6c24-f09829faf4ab@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2020 17:11:36 +0000
Message-ID: <CAFEAcA-C0o_u8VABdRky7GUCvyiWhkn74cT1UYAtEAAFjGBLAA@mail.gmail.com>
Subject: Re: [PATCH 0/4] docs: Miscellaneous rST conversions
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 25 Feb 2020 at 17:01, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 25/02/20 16:41, Peter Maydell wrote:
> > This patchset converts some texi files used in qemu-doc.texi to rST:
> >
> >  * docs/security.texi
> >  * qemu-tech.texi
> >  * qemu-deprecated.texi
> >
> > which all end up as sections of the "system" manual.
> >
> > In all cases, these pieces of the documentation are part of
> > the qemu-doc HTML file, but not included in the qemu.1 manpage,
> > so they are just a straightforward format conversion.
> >
> > security and deprecated are pure conversions with only
> > changes to the formatting, not to the contents.
> >
> > For qemu-tech.texi, a large part of it was an extremely out of
> > date and partial attempt to document the limitations of our
> > CPU emulation. Apart from a change to the Xtensa section in
> > 2012, no part of the actual text seems to have been updated
> > since 2008. I judged it better to simply dump this rather
> > than carry it over. Creating an actually accurate section
> > about the limitations of the various guest architectures
> > is probably easier done from scratch if we want it and are
> > prepared to actually keep it up to date this time...
>
> I assume these are not meant to be applied now, except patch 2?

No, I intended them to be reviewable and applied now. Why
do you think we should wait?

thanks
-- PMM

