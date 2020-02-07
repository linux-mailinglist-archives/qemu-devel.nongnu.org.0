Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C21115575D
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 13:06:28 +0100 (CET)
Received: from localhost ([::1]:55118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j02Ox-00017Y-NS
	for lists+qemu-devel@lfdr.de; Fri, 07 Feb 2020 07:06:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41781)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j02Nu-0000aV-M3
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 07:05:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j02Nt-0000mP-Hx
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 07:05:22 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:45365)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j02Nt-0000it-Cm
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 07:05:21 -0500
Received: by mail-oi1-x244.google.com with SMTP id v19so1691570oic.12
 for <qemu-devel@nongnu.org>; Fri, 07 Feb 2020 04:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tHUoR3padVMe0/lveG4FmzH69RJlGW608W3ZOi4ZZY4=;
 b=lT2o1hi/a45hFPFVyCmIX4CroFlyqq9ZblvXOTR6cXS85J+kzgNThqo4ecHnmlktQN
 HCORYXZNUDwB6Am/JUUjiELHXP8HNwcV8wBo4+aTDkmLwK2LoxrWn+iu7Sv161duQ6Ev
 oYVEB4lKldUU+1lu+K8tblC7MGRW8EXaLAG7hAyx7Iosrl4pcuvMpfmG8McFezp4LSr+
 PAIsik6fg0Prgbi9DZ4Wux4+/VIJGFj8tXt55xYj0rvwjhrDOm19n/60mxKLf2fbfJNv
 m3YEmu2FIxlddlgD/Ksq9Z6sJL2WOfGUcF43w1DImXv24Ryj4X8orbDzf4J4CEEiZl/b
 +wGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tHUoR3padVMe0/lveG4FmzH69RJlGW608W3ZOi4ZZY4=;
 b=oyWTrDm+qFfYgkZ7BOyVPpo+VY8FQesJB3NH3F5m9cPs5k8lSkOxJNtzeZbQfeJeF7
 4ExiBrSIZgMnhkwueHiNrEk2PGMkdtwiu6ByT2HLF979G3xT8Zg1pFQc6bCK9TtFIu2/
 XuXQTmK/3x416EOGxMFFiR7qI/lw/bC9zRljfbkLwyyRhHAHfl8OOIlbyEEomUAS4vqK
 o2WTTRa/tf9JZ1EbvUWOpPIIxTSZQJl5vnLRMNWCkD5Xw3OPaEOayqQRXNfc+OV3ODFy
 bRrHPCpeznIye/A28bxFK/1PoWpmuIF/9qf1qMqkUI/4dxDxq2JgCGTfvNRDXaGKzaVr
 iQuQ==
X-Gm-Message-State: APjAAAWYieLxJwP18nWaiky9lBf/kkce0355wJbHiQs8lqp9e8sy+5vb
 zmtPDaKKsD9ZFDMkuhN6aketg0852v5A+ZFL4k/dww==
X-Google-Smtp-Source: APXvYqwznGnaqo0Sje/cceRXxVZnVxzQ/rNSXFH9RsGYa9+bwFz0n4JPCrIW8YdPISKHuOuCdMVROsSMvMY45La6AWI=
X-Received: by 2002:aca:b2c5:: with SMTP id b188mr1843459oif.163.1581077120423; 
 Fri, 07 Feb 2020 04:05:20 -0800 (PST)
MIME-Version: 1.0
References: <20200128180142.15132-1-cohuck@redhat.com>
 <20200128180142.15132-2-cohuck@redhat.com>
In-Reply-To: <20200128180142.15132-2-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Feb 2020 12:05:09 +0000
Message-ID: <CAFEAcA9kkxNZg7ij5vXQU-pA+sxed13L0GB6RfiWsvyT2rPPYg@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] docs: rstfy s390 dasd ipl documentation
To: Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: Tony Krowiak <akrowiak@linux.ibm.com>,
 "Jason J . Herne" <jjherne@linux.ibm.com>, Thomas Huth <thuth@redhat.com>,
 Pierre Morel <pmorel@linux.ibm.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 28 Jan 2020 at 19:36, Cornelia Huck <cohuck@redhat.com> wrote:
>
> While at it, also fix the numbering in 'What QEMU does'.
>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---

> diff --git a/docs/devel/s390-dasd-ipl.txt b/docs/devel/s390-dasd-ipl.rst
> similarity index 77%
> rename from docs/devel/s390-dasd-ipl.txt
> rename to docs/devel/s390-dasd-ipl.rst
> index 9107e048e4e6..1f6a7ea01ce6 100644
> --- a/docs/devel/s390-dasd-ipl.txt
> +++ b/docs/devel/s390-dasd-ipl.rst
> @@ -1,25 +1,28 @@
> -*****************************
> -***** s390 hardware IPL *****
> -*****************************
> +Booting from real channel-attached devices on s390x
> +===================================================
> +
> +s390 hardware IPL
> +-----------------
>
>  The s390 hardware IPL process consists of the following steps.
>
> -1. A READ IPL ccw is constructed in memory location 0x0.
> +1. A READ IPL ccw is constructed in memory location ``0x0``.
>      This ccw, by definition, reads the IPL1 record which is located on the disk
>      at cylinder 0 track 0 record 1. Note that the chain flag is on in this ccw
>      so when it is complete another ccw will be fetched and executed from memory
> -    location 0x08.
> +    location ``0x08``.

I think the indentation here is off -- rST likes to see every line
in a multiline bullet point start in the same column, like this:

1. A READ IPL ccw is constructed in memory location ``0x0``.
   This ccw, by ...
   at cylinder...

Otherwise I think you end up with a blockquote by accident.

Formatting-wise the rest looks OK to me (and the other enumerated
lists in this document don't have this odd indentation, just this
first set of 1..4).

thanks
-- PMM

