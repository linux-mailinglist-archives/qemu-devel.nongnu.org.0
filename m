Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA20A01F8
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Aug 2019 14:39:04 +0200 (CEST)
Received: from localhost ([::1]:35964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i2xE7-0004gq-Jf
	for lists+qemu-devel@lfdr.de; Wed, 28 Aug 2019 08:39:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52149)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alex.bennee@linaro.org>) id 1i2x5h-0001Iw-Io
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 08:30:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1i2x5f-0008OS-1H
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 08:30:21 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:35823)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1i2x5e-0008NQ-MM
 for qemu-devel@nongnu.org; Wed, 28 Aug 2019 08:30:18 -0400
Received: by mail-wm1-x342.google.com with SMTP id l2so2682314wmg.0
 for <qemu-devel@nongnu.org>; Wed, 28 Aug 2019 05:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=lyysIg4GJOARFaGAm4FYDnsFBX7G7Ukw8pHIpA8GdVk=;
 b=pC4h2h/XBY1Sc40b3wTOGe/hdTB+PbsOzKyfvnRM/20sir+f7Lq0RvHVrC4GqW8NEm
 u5Kv2CxGOaMvbQENCkZHEqyP1elEixHhsP+mzhWTFm1r4gqo5Y2qtvjQEGWU1bSWokd9
 P6vUDzqSW6Gddv18/v3wKhQjwIaWiaDnF3QAHgo9ICGvHcaCWVwjlyx3kP49cq18SFZt
 Fvif2pbzp0SeT/oL9GlVFE3PXvd43LCzg1ffedbE3HJyHpA6rOus7/V85YvEtYbp1qbA
 xiR5YXVUn+QNA6qpYroWJNJ3vkp8Jk3lAxxQy26JP8dzCMcYOQ4eweqMqec5fRYgbw7Y
 eFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=lyysIg4GJOARFaGAm4FYDnsFBX7G7Ukw8pHIpA8GdVk=;
 b=cg34kbAbYmt6CKqP4pTFawmAJ6gii3KRglup/1g0YrwW+CONJn1T05EllNWTDDGJA7
 3xWouuj0oInj28s+HRREJb+Hpn33CXw/vug4WoioowbTdVUqYBJCizya4YE5Hxhdx5hA
 BVONtE6lfFQj36ZVY41y9AlppWdW1uaxzvJ3BCRoxuAVNb7lG6igyAH/bCxB1wVw5nWf
 NZSxScvtNF0AL8vFhLWY8jVBAUsPMGHRa2/ev92b2nqLzHB04NLEkVq9W+4xp2YMhqif
 wqa6F03QsOGlGHRrQD1+cVdsMBc3W/JTsqEU2Lax9Vr7K9CkyWS1LLAd9VnkKjHihz4m
 szgQ==
X-Gm-Message-State: APjAAAWA7yo6FbliljgDbaLuCWgXn5f+qPsatyZrE06y7hRl8wXEiWFv
 k1xjRvMeyDJneKJqJ0NVbIwrXXyigWs=
X-Google-Smtp-Source: APXvYqx9+M73U4Vf4HRvdSaXLIJIUNIsukmcuucKz95uErD6NTcHWynzF2eVhkmYZhS66Z1m5gTFZA==
X-Received: by 2002:a1c:4d06:: with SMTP id o6mr4726488wmh.43.1566995417083;
 Wed, 28 Aug 2019 05:30:17 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id f10sm2739264wrs.22.2019.08.28.05.30.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 05:30:16 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id EF0451FF87;
 Wed, 28 Aug 2019 13:30:15 +0100 (BST)
References: <20190823163931.7442-1-berrange@redhat.com>
 <CAJ+F1CJsYQDAMwD9pHifGzFT=vPanBeKrCDvYmzqO522MeLhgg@mail.gmail.com>
User-agent: mu4e 1.3.4; emacs 27.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
In-reply-to: <CAJ+F1CJsYQDAMwD9pHifGzFT=vPanBeKrCDvYmzqO522MeLhgg@mail.gmail.com>
Date: Wed, 28 Aug 2019 13:30:15 +0100
Message-ID: <87d0gp5v6w.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
Subject: Re: [Qemu-devel] [PATCH 0/4] docs: add docs about use of automatic
 cleanup functions
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
Cc: =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:

> Hi
>
> On Fri, Aug 23, 2019 at 8:41 PM Daniel P. Berrang=C3=A9 <berrange@redhat.=
com> wrote:
>>
>> This is ostensibly about adding docs for the g_autofree/g_autoptr
>> macros. As part of doing that, however, the existing HACKING doc
>> is merged into the CODING_STYLE doc and the text is converted to
>> markdown with a table of contents.
>
> Why not rst, so it can integrate with the rest of qemu sphinx doc?
>
> (markdown is quite poor when it comes to documenting code or
> cross-referencing etc)

I was going to say markdown does have the advantage of being renderable
on the fly on code hosting sites but it appears it works on
gitlab/github so that is an argument for being consistent with the rest
of the docs.

Does anyone know what is left to get the publishing pipeline up and
running and the results linked to from www.qemu.org?

>
>
>
>>
>> Daniel P. Berrang=C3=A9 (4):
>>   docs: convert CODING_STYLE and HACKING to markdown syntax
>>   docs: merge HACKING.md contents into CODING_STYLE.md
>>   docs: document use of automatic cleanup functions in glib
>>   docs: add table of contents to CODING_STYLE.md
>>
>>  CODING_STYLE    | 216 -----------------
>>  CODING_STYLE.md | 613 ++++++++++++++++++++++++++++++++++++++++++++++++
>>  HACKING         | 257 --------------------
>>  README          |   2 +-
>>  4 files changed, 614 insertions(+), 474 deletions(-)
>>  delete mode 100644 CODING_STYLE
>>  create mode 100644 CODING_STYLE.md
>>  delete mode 100644 HACKING
>>
>> --
>> 2.21.0
>>
>>


--
Alex Benn=C3=A9e

