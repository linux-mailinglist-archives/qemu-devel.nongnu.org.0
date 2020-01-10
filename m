Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E5E136B1E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jan 2020 11:33:46 +0100 (CET)
Received: from localhost ([::1]:43822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iprbt-00043c-Jn
	for lists+qemu-devel@lfdr.de; Fri, 10 Jan 2020 05:33:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50769)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ipraN-0003EH-Ql
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 05:32:12 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ipraM-0002Id-BW
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 05:32:11 -0500
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e]:43447)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ipraL-0002EU-VO
 for qemu-devel@nongnu.org; Fri, 10 Jan 2020 05:32:10 -0500
Received: by mail-ot1-x32e.google.com with SMTP id p8so1448145oth.10
 for <qemu-devel@nongnu.org>; Fri, 10 Jan 2020 02:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=ZyuMq4sNBaLd4y8hIdvlp6XZdOKlB3JWOv5iRcLMWRU=;
 b=n+0xrr0TXlswpLExAEeWLRIqwvRuiJMqvdrJxVrZOzAz8h8h4473x/dHE6lkjbgUXF
 O2mtCUlvqoxFac7Q1OJjyDwhwdsics7lwxr0KwA5MNCvGBdo43V2AxPZxOzc36xTZBg5
 p9R2kYuGS3fCpYKxuMyCwXce2OYt1XMMX95O1ZgufEe20UHnukbDTiwYi0IpF2jBKh9s
 k7nUWqvj311CuZ5xLCJ87F2WGcTT+HO01Jj8I17BndHoCcKMEvjmml3va91EvvDB6tjs
 aXbihOvLDtO/dBVMuFepNMizPRtRlnLWZoP/xmADfqhiAZuyDZmhfGu41TfiKXHXTbk9
 WmtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZyuMq4sNBaLd4y8hIdvlp6XZdOKlB3JWOv5iRcLMWRU=;
 b=FRbQotHep1BsakRLKpSGOKMXkZryKHR3453upA+q1Weiec1DWGzyN0DOXdl5fxJp25
 6eYiiOmPpYLfNxlgMmcOHb3jYDvtU1fsJRwRH3sS+tTAq2mk6TvTBqDcwXNMsDjPGXUo
 8rud3cUviRln1VM6XTB1zHJ/OwtrMKpUuw9ZEsxNfhS1JekDR7MF2b6E2Mmayup1TeXN
 JPx0nPVdbqx6sDslWkF13vrh58OFIxbWsw7jP2JoTxe83CkMBua6gldVcT+XgkDSxgmI
 EUZ71vh2HJF5GKO+iOECib6SdoErUQbe440dCZFvOuGweVkyliILrmakuf/MPqx9U6cR
 t25g==
X-Gm-Message-State: APjAAAWiBtp4864Wn0ChFlLaZ9kWR0P9frLkgkp9kq1I4x0MmXUo+5z9
 q5hDFnbeUGHMEHeCddZQQ53qQVQSf18LuxYuijCtQw==
X-Google-Smtp-Source: APXvYqx2ZC/uHis3NVqwp8mVRu+3F1J7loZ1L0V6rydtwpOz+5KNkoN3DrsnQETKn4avk1O23wKFOXfHvpN6W1eiYKk=
X-Received: by 2002:a05:6830:1586:: with SMTP id
 i6mr1850195otr.221.1578652328796; 
 Fri, 10 Jan 2020 02:32:08 -0800 (PST)
MIME-Version: 1.0
References: <20200107150442.1727958-1-marcandre.lureau@redhat.com>
In-Reply-To: <20200107150442.1727958-1-marcandre.lureau@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jan 2020 10:31:57 +0000
Message-ID: <CAFEAcA_gmgRU+1f1nRcc4bBYhHo+HARgkKy2rK0wmUWLc=P40A@mail.gmail.com>
Subject: Re: [PULL 00/37] qom-ify serial and remove QDEV_PROP_PTR
To: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::32e
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
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 7 Jan 2020 at 15:04, Marc-Andr=C3=A9 Lureau
<marcandre.lureau@redhat.com> wrote:
>
> The following changes since commit cdbc5c51c8755e4e9ce964fc92ba755e1c71a9=
14:
>
>   Merge remote-tracking branch 'remotes/xtensa/tags/20200106-xtensa' into=
 staging (2020-01-07 10:31:07 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/elmarco/qemu.git tags/prop-ptr-pull-request
>
> for you to fetch changes up to f0d753b1c1e6c334cd089be97a0eb9f1bc415559:
>
>   qdev/qom: remove some TODO limitations now that PROP_PTR is gone (2020-=
01-07 17:24:29 +0400)
>
> ----------------------------------------------------------------
> Clean-ups: qom-ify serial and remove QDEV_PROP_PTR
>
> Hi,
>
> QDEV_PROP_PTR is marked in multiple places as "FIXME/TODO/remove
> me". In most cases, it can be easily replaced with QDEV_PROP_LINK when
> the pointer points to an Object.
>
> There are a few places where such substitution isn't possible. For
> those places, it seems reasonable to use a specific setter method
> instead, and keep the user_creatable =3D false. In other places,
> proper usage of qdev or other facilies is the solution.
>
> The serial code wasn't converted to qdev, which makes it a bit more
> archaic to deal with. Let's convert it first, so we can more easily
> embed it from other devices, and re-export some properties and drop
> QDEV_PROP_PTR usage.
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.0
for any user-visible changes.

-- PMM

