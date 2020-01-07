Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B968C132C9E
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jan 2020 18:10:01 +0100 (CET)
Received: from localhost ([::1]:53576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iosMi-0007zO-Hw
	for lists+qemu-devel@lfdr.de; Tue, 07 Jan 2020 12:10:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46547)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iosJ6-0002Uv-2c
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 12:06:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iosJ5-00070i-5F
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 12:06:15 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231]:40410)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iosJ5-00070Y-16
 for qemu-devel@nongnu.org; Tue, 07 Jan 2020 12:06:15 -0500
Received: by mail-oi1-x231.google.com with SMTP id c77so102261oib.7
 for <qemu-devel@nongnu.org>; Tue, 07 Jan 2020 09:06:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+QUdzuKCt2vIM6GeENeuSg4pDrygiUIt0KhoCO356dU=;
 b=WTx+ol8ofJNvqRmmN2HnkQkV0olruesAygXzQTL6r3t6KTo3rr/Lting4bQS9rN4mH
 0uGB6DjpPnhKfXTDH1gjfRf31zdCD5kaI2P3tjhpsQMIKV5QmVoBzfb973lVs7xTSGcd
 3Y7b2gU3AgkWLakxivWQWeIe4i4YAqwUPXhg1gdYRAJTJ6nnrNRzOuwUMIETRUHezzHG
 4gGOdTssck2QNruMQFpwGILCFVQ+udkamIijw+P0lAuI5IJMK4mpbG6zTXt5sN08xWWD
 oKSS0LMdgRoOyhHCxjlqgAIQkF0dpt6QQrRt6gkbA5AUeGeqj/5zByrTXozPhSh7D2nn
 fr5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+QUdzuKCt2vIM6GeENeuSg4pDrygiUIt0KhoCO356dU=;
 b=bY7SlLZDM8i/J9h9ZvXHZJKJoE4v+zR/wyVlTOCy7Nn0ulUboCiVs3hbywlHzArosy
 CW7KYzANZrqWzRL3qOdyI1A/DcAqknsLZGUTetu9O/lHYyYr8iwLNqxNl3KicUBOWG4V
 edMHiZW4GVTMsV9kxz5ZydAFYgjUItP1xivEqsxlrcpHsEZCGlmdS5B+aJFA8hde/uFB
 F0cPmTsuBZuxsBLfGjAYgc0wmOXlUrK5j+VcJdTplnnbDPMtI50S9OrVD1oXjdMJtYqQ
 GszJhBzrGA1LMYsL3WE5pdcLBV0+jiBt1GjE8Ca3a47wPqK5H5g+8xGrKftiStowvA/0
 FBAA==
X-Gm-Message-State: APjAAAWXKQYHgZWAs+k3UYklTx1SjgOyMDFU7DnsTa1SzpBzuaSQ+wSz
 dH+yliUZ8cYFLSbZ70bcz63RVOHFxTr5p/Gk+GXhaQ==
X-Google-Smtp-Source: APXvYqw/oIjJPMT3XUQlWG/4+uW2SZzD8JyYb9Rz1+Iob8TFx3UKD4E0ph9oiAI1/fqiHomVcfiXbAb6X51FrHA4v5E=
X-Received: by 2002:aca:570d:: with SMTP id l13mr432953oib.146.1578416774106; 
 Tue, 07 Jan 2020 09:06:14 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA-U1JqzH8m2AWV7KuJKm0WfczDKK+ddzPs44y9usujB2Q@mail.gmail.com>
 <87imlnjj05.fsf@linaro.org>
In-Reply-To: <87imlnjj05.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Jan 2020 17:06:03 +0000
Message-ID: <CAFEAcA-oNYP+-ej52GniCUoNU1K16Ah3pk0SDQXDqEnz+2SSgQ@mail.gmail.com>
Subject: Re: race condition in tests/fp/Makefile
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::231
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
Cc: "Emilio G. Cota" <cota@braap.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 7 Jan 2020 at 17:04, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
> Peter Maydell <peter.maydell@linaro.org> writes:
> > Also, should we change tests/vm to separately invoke
> > 'make' and 'make check' ? I think that doing a single
> > 'make check' is a bit fragile because we don't
> > really test it and there's no rule that says
> > "check depends on all" or similar AFAIK.
>
> OK - although shouldn't our rules be robust enough for this.

Ideally, you might hope that -- but I'm a bit
sceptical that we really correctly express all the
dependencies that every test has on the build having
actually built the things it needs to build...

-- PMM

