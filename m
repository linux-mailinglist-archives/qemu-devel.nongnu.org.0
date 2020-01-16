Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D0D913FCCE
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Jan 2020 00:15:02 +0100 (CET)
Received: from localhost ([::1]:49656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1isELs-0001uU-VL
	for lists+qemu-devel@lfdr.de; Thu, 16 Jan 2020 18:15:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52063)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <jkz@google.com>) id 1isEL2-0000zM-6V
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 18:14:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <jkz@google.com>) id 1isEL1-0004PA-5P
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 18:14:08 -0500
Received: from mail-vk1-xa2c.google.com ([2607:f8b0:4864:20::a2c]:33070)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <jkz@google.com>) id 1isEL0-0004Om-Vp
 for qemu-devel@nongnu.org; Thu, 16 Jan 2020 18:14:07 -0500
Received: by mail-vk1-xa2c.google.com with SMTP id i78so6168469vke.0
 for <qemu-devel@nongnu.org>; Thu, 16 Jan 2020 15:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ceCc4dSOPvn5wagwALp9uRtD1NhUZMLrl8qf8ieBmQo=;
 b=t97N1QcJcZSLBgLomJNgqlDvhMVW6Y5Os9H5BuZbS/VyTWaz572CVYuW+sQb1ZM+Zz
 zy+2bEdd5WYwsbofVsDUEYHWDR+H89/D+Yw55iYRLEnBRlwgzvA7WyPxQmUKSDw9xZx1
 p1Ty8GWvn8KOggV3gnCpv+ouTt8RgDQGg8sH51SDM6uMlhFbHIH0xQrvt+o1nHa4DV1/
 mRaZnfyZB0YgUT3R7RTueR3n9stSVUY/Tprko8daCL+Q6N0buHEEaAmV/Y+kTbvdFMP7
 A2pYWdUoEoMmGlBqcURCJlrXF9Rz98EVunoQ0OnXOiZhZ38z79qvvEKifYpxWR9omawo
 sOTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ceCc4dSOPvn5wagwALp9uRtD1NhUZMLrl8qf8ieBmQo=;
 b=oaAW9kps7LH2Mt7aay+8cDiY9QPK9oH712O3+rV+XMP0DqoLDtJsq22WAOP8CysyG4
 8hc9j0p2Vn9I+Osqj5+BXGNXT7qYb6h9o9KN6vAzNcP/pHlQLQT6r5ryPZzgnvHv+nd5
 f0Gib0Cs4RzFdweuvbqbqXs0u/662moLs/qcMKr9dZmZ16TuSa3EKPfkjn/3H8Cz/Tz1
 wpzarzV91914ZWydGghbuK/m07FYGjgWyApLHqSrTqBgnSjhSLauYtKWrU6n+8P85NAj
 SUBl7horKHs8wPZIrg43CQoMFXHre+xj6e/Naq98EbCWxZ9Nc2k17YwlcOlQMZJsN3hk
 iZeQ==
X-Gm-Message-State: APjAAAV63kQiLOtxwnBhPIaTEm0THLXaT6kY01P6ZIQwiJGmD30L8OJY
 /2PKl3+uH+JRMQnFMjIcYV2npcXhlQAkJKwuiBL5mV1U
X-Google-Smtp-Source: APXvYqwpDSz0Q1TFsBItB+xfZgxCDJmzI7p0BgbeLYGVHsJZj1lwdf5wMitGKye9Tk7vcrMgyb4ge904E5BDz7uYXZY=
X-Received: by 2002:a1f:5fc1:: with SMTP id t184mr19434167vkb.57.1579216445799; 
 Thu, 16 Jan 2020 15:14:05 -0800 (PST)
MIME-Version: 1.0
References: <20200114030138.260347-1-jkz@google.com>
 <CANCZdfq66Fsw=C0YSi6zWs_=r+0cNfPjhvchiSJnfY2MBWT8LA@mail.gmail.com>
In-Reply-To: <CANCZdfq66Fsw=C0YSi6zWs_=r+0cNfPjhvchiSJnfY2MBWT8LA@mail.gmail.com>
From: Josh Kunz <jkz@google.com>
Date: Thu, 16 Jan 2020 15:13:54 -0800
Message-ID: <CADgy-2ukDWB_nCTqsUa4yhOr-d0PS05rpenfi2FPh6RodjkpmA@mail.gmail.com>
Subject: Re: [PATCH 0/4] migration: Replace gemu_log with qemu_log
To: Warner Losh <imp@bsdimp.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, Riku Voipio <riku.voipio@iki.fi>, 
 Laurent Vivier <laurent@vivier.eu>, alex.bennee@linaro.org,
 armbru@redhat.com
Content-Type: multipart/alternative; boundary="00000000000046e739059c49fb9f"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::a2c
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000046e739059c49fb9f
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 13, 2020 at 7:06 PM Warner Losh <imp@bsdimp.com> wrote:

> The bsd-user that is in tree doesn't work. I've been trying to catch up to
> qemu head of tree, but I'm only up to 3.2... chances are the bsd-user
> changes will not change the state of things...
>

Ah good to know. Would you all prefer I don't modify it at all, to try and
keep the code "pristine"? Or is it OK to keep the patch as is?

--00000000000046e739059c49fb9f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jan 13, 2020 at 7:06 PM Warne=
r Losh &lt;<a href=3D"mailto:imp@bsdimp.com">imp@bsdimp.com</a>&gt; wrote:<=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"auto"><d=
iv dir=3D"auto">The bsd-user that is in tree doesn&#39;t work. I&#39;ve bee=
n trying to catch up to qemu head of tree, but I&#39;m only up to 3.2... ch=
ances are the bsd-user changes will not change the state of things...</div>=
</div></blockquote><div><br></div><div>Ah good to know. Would you all prefe=
r I don&#39;t modify it at all, to try and keep the code &quot;pristine&quo=
t;? Or is it OK to keep the patch as is?</div></div></div>

--00000000000046e739059c49fb9f--

