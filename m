Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 044A9126406
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Dec 2019 14:54:12 +0100 (CET)
Received: from localhost ([::1]:41912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihwFn-0003Fs-4A
	for lists+qemu-devel@lfdr.de; Thu, 19 Dec 2019 08:54:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50853)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <marcandre.lureau@gmail.com>) id 1ihwEy-0002os-2p
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 08:53:21 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <marcandre.lureau@gmail.com>) id 1ihwEw-0000DS-T1
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 08:53:19 -0500
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:43679)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <marcandre.lureau@gmail.com>)
 id 1ihwEw-00006E-IJ
 for qemu-devel@nongnu.org; Thu, 19 Dec 2019 08:53:18 -0500
Received: by mail-wr1-x443.google.com with SMTP id d16so6035366wre.10
 for <qemu-devel@nongnu.org>; Thu, 19 Dec 2019 05:53:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Hg+oOcpP5bFaYXf4GJ1sLxu4YJq+UZWaCc3c9eYBEbk=;
 b=YjCU03iqKBwK1Kiz0PuVjVNWBZm8Jbky3MQOz970b5+KNUtOVJlEhwskcj4Wpf/55E
 aisaJCTO9V8ruXjI1jPP9hReT+cTrMN21F1bQKEzOLeRjnkiH0f3iyG/jhqglSNCygIM
 ITLluO2UfL7YP8YnLmH8kV8PXct8CSeTTmHNVtnlNq4LSRNsbDGpSJ4AHv3/nCsaOVXq
 od2CYRd+ni0MrGw64ucELd0cEX/Rr04m0Ujzdr+lULg/ywj7t7s0YoQNuw6/vyxElhtu
 clbsd4MdewwP+ftOaX4fQLk5QOsFVxvuAJo+6sXb1NGrUd4UugkvbVjqYvQxIg1XnYxq
 RYRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Hg+oOcpP5bFaYXf4GJ1sLxu4YJq+UZWaCc3c9eYBEbk=;
 b=RhEOHX41eoJQb+9wWcXllM2aoD03L/HUXo/DI1sWhoIrmQieRpCnYNje2u/BHo+LYb
 A1p11fSXTJhOcp6ygjCwRIhVZiaJTA7yHYa+hAP0tw+iulV5Q5W0PbQ4UM8c8grLzPfZ
 wn5ZEKRzETi+HvERCArkn1M83zOsJ0TXN5j9hEiomtuCe6u91CbAX3P5Z1zjwT6z2cl+
 hRX06t3OCSAHkNXyfhzH4aiiy0TdpUVyDF3amK1XeMK7aVhuxvtfiYP+OEcUZOcYe+l7
 /EYTfe4vFt0ShcCZQOjY9oREjeTJ7NarW/YUyOj9+dwO80DnTEcAKPf7bluIQWyHIpIz
 9Qiw==
X-Gm-Message-State: APjAAAVZ3jAzCR4yivMXz8s7pJbUVQj+EJyGEgxKUi0Dn7467HqMQvNG
 IUhvMGX5lX9KkEqnsr6B/ZrwT1rNDghzPyhgGM2t7hdkmfE=
X-Google-Smtp-Source: APXvYqztexRD0eGlxy5byPO+pFhOHh4rS6BZ/0RCw5uUbgQRB7Ww3S5Cg7g8gMUcFF3p6HT2Kqg6N0QgFtxqLhxYFKE=
X-Received: by 2002:a5d:66c3:: with SMTP id k3mr8993194wrw.370.1576763596044; 
 Thu, 19 Dec 2019 05:53:16 -0800 (PST)
MIME-Version: 1.0
References: <20191120152442.26657-1-marcandre.lureau@redhat.com>
 <CAJ+F1CLV_JRhXX=tB7ZXYxa1En4LzYgJr+7egKzVRNBOLY2nSA@mail.gmail.com>
 <CAJ+F1CLS4HV-SckggfYNRKXxPa0R2BxSQrpPv8CRVkfvRB3E4w@mail.gmail.com>
In-Reply-To: <CAJ+F1CLS4HV-SckggfYNRKXxPa0R2BxSQrpPv8CRVkfvRB3E4w@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 19 Dec 2019 17:53:03 +0400
Message-ID: <CAJ+F1CJO7wsz7WaxZybasWj9H8m1sbwtQBvVjG1cuOPH3MECnQ@mail.gmail.com>
Subject: Re: [PATCH v4 00/37] Clean-ups: qom-ify serial and remove
 QDEV_PROP_PTR
To: QEMU <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::443
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
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi

Still trying to make progress on this series (which is preliminary to
other pending work..):

On Wed, Dec 11, 2019 at 4:01 PM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Sun, Dec 1, 2019 at 2:19 PM Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@gmail.com> wrote:
> >
> >
> > - "chardev: generate an internal id when none given"
> >
> > As explained, this is necessary for qdev_prop_set_chr()
>
> ping
>

ping

> >
> > - "serial: register vmsd with DeviceClass"
> >
> > This is standard qdev-ification, however it breaks backward migration,
> > but that's just how qdev_set_legacy_instance_id() works.
>
> See thread, someone could review or nack (if backward migration is a prob=
lem).
>

ping

> >
> > - "sm501: make SerialMM a child, export chardev property"
> >
> > review?
>
> ping
>

rebased on top of "hw/display/sm501: Always map the UART0" as
requested by Philippe. Can wait for v5 to get review.


> >
> > - "qdev/qom: remove some TODO limitations now that PROP_PTR is gone"
> >
> > This should be straightforward.
>
> ping

ping


thanks


--=20
Marc-Andr=C3=A9 Lureau

