Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B960154388
	for <lists+qemu-devel@lfdr.de>; Thu,  6 Feb 2020 12:53:04 +0100 (CET)
Received: from localhost ([::1]:37322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1izfiR-00075H-Nr
	for lists+qemu-devel@lfdr.de; Thu, 06 Feb 2020 06:53:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:53152)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1izfhi-0006gZ-Pe
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 06:52:19 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1izfhh-0008Qo-IR
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 06:52:18 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:44696)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1izfhh-0008Os-8t
 for qemu-devel@nongnu.org; Thu, 06 Feb 2020 06:52:17 -0500
Received: by mail-oi1-x243.google.com with SMTP id d62so4248824oia.11
 for <qemu-devel@nongnu.org>; Thu, 06 Feb 2020 03:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OZM/s0q294l6xBCdZRZjIOZ2gPGQ9imlQWr38DWI7f4=;
 b=x1h/I76Jhpc0/w9O3Fa3r2RDllxJz0BJy7uUHWqdRCP7Swvo4OzK5SmrwH7uSkCiK4
 KxErmXuqzjRA7pwssPAlAAtKU3k8uF+Yv8xXdk/+kGZOVslXulDI0ZAhd7Xp4ZQzNRVo
 UIhufvPTtRHaw06HUvfQIwtxF3ECoQOxdyUmzoUzE2C6jMnHbil1+FY9ZRvNvQsdS180
 Nygy0tPlEEmmGM/KtiRRUcCKaZAyXW+E6DE9Vg3ebo7/a8xs3rbjLo6RKwSqtGj7wHBt
 pujEVSA0fTZCHieKPm/HR2sa4nmgAYbQJc2A984lMFviSWbYzqBLsBnmr3odECCAgomY
 CchQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OZM/s0q294l6xBCdZRZjIOZ2gPGQ9imlQWr38DWI7f4=;
 b=tjDRq7ab5IWi+TJXw9CfTrMa2isLvdaRwzhU9JKa3EVHHW/Ps6a7iEgNwr+OTYuGb4
 jcwGP9vLpuaOpDWCUARskuKxaR3s6TYJoZVUM7Cg8QOAtdwnPfVLEeeGRlHy73K2aUrA
 1BpN8K2XvvU8x65QZgjgN1c0+cLThmv8y8CTeD1X8+hdGcObUjemmBqS/fdJ07kDyRo1
 uDdVST2lPXXCnur0fjjEq1UBr5wc/ufFuczginCz1Y+hLeq9Jqn5fAGOLh0C8VvELd+P
 B9N3TPLI399NzURPejnDB7eQl/Cm/z+CGoO9RgWrBvt7GzZ6E9xU/lTiMjR0yf665+qw
 XAgA==
X-Gm-Message-State: APjAAAX9eVVKSefnZ5ffe5x7IHt029+jOdfs+0S/LJwGciF1zBqaoNJq
 Jdsv1f6H4Xm8v98it/3lYV9r0Y3bspUxAzDoIh+QYQ==
X-Google-Smtp-Source: APXvYqwgGhKeeDDBZoi0Xv4CD5eIo025Yteu3Lzbws8FFQKIIIUk20RYO+zthayNf2d2U+hMnXMitMknJkpj9Ff11Ak=
X-Received: by 2002:aca:3d7:: with SMTP id 206mr6687952oid.98.1580989935840;
 Thu, 06 Feb 2020 03:52:15 -0800 (PST)
MIME-Version: 1.0
References: <20200206112908.5002-1-kraxel@redhat.com>
In-Reply-To: <20200206112908.5002-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Feb 2020 11:52:05 +0000
Message-ID: <CAFEAcA8eHS7KuMW6RXdxoYAdQAJOJK6thqp5Vn+LZav7B79MWw@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] ui: rework -show-cursor option
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: =?UTF-8?Q?J=C3=A1n_Tomko?= <jtomko@redhat.com>,
 Libvirt <libvir-list@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 jpewhacker@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 6 Feb 2020 at 11:29, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>

This cover letter is missing a description of what the patchset does...

The closest thing the patchset seems to get to documentation is the
oneliner in ui.json:
+# @show-cursor:   Force showing the mouse cursor (default: off).

but looking at the ui/cocoa.m implementation that isn't what it
actually does -- it just seems to mean "default to shown on
startup", because the logic that unconditionally hides the host
cursor on mousegrab and unhides it on ungrab remains
unchanged. This doesn't on the face of it sound like very
useful behaviour, since the option will only have an effect for
the short period of time between QEMU startup and the first
mouse-grab, but without documentation of what the option
is intended to do and in particular how it's intended to
interact with grab/ungrab I don't know what your intention
for the behaviour was.

thanks
-- PMM

