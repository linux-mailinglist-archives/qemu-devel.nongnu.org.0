Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F00BA1B066D
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Apr 2020 12:20:13 +0200 (CEST)
Received: from localhost ([::1]:32808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQTXA-0003bz-32
	for lists+qemu-devel@lfdr.de; Mon, 20 Apr 2020 06:20:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53542 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <igotti@gmail.com>) id 1jQTW2-0003D5-E5
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 06:19:02 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <igotti@gmail.com>) id 1jQTW1-0000V7-Ao
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 06:19:02 -0400
Received: from mail-lf1-x141.google.com ([2a00:1450:4864:20::141]:34066)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <igotti@gmail.com>) id 1jQTW0-0000T8-Tg
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 06:19:01 -0400
Received: by mail-lf1-x141.google.com with SMTP id x23so7459311lfq.1
 for <qemu-devel@nongnu.org>; Mon, 20 Apr 2020 03:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OyeIQoOv+CBKXLeZgJ1HGwbxMgFE5TUlgdeLbHR6Kjc=;
 b=Y6gyFRkj5TJAkgr9Pn/SgfS+pf4cHI4VUezDk/DfOZ7HuhwRikEo607h+fSFw3wvfa
 32s+UvNul3bbxQH9wscPpbmWWQ6CQA1Tvd8f+URfn+7y2Kat4VGJz72hMLQ9RV5cdBuZ
 VinSpmuH3oRSx5HLD1gsBlQAIP87qNPyDhgH5KRdt+nCeyHXoDfxEuImXIo8RKWsRex+
 LGrfh1MBaqJfNE5/TgmtV20r3gf9Yqu+FrgQ8ODdsB5jjNeKQx21h22hXnOv7quJCkxA
 wG/IY5F7JlZpzs07cUBHe/+m7L9leFU3sIFAAdoyGY1w6HZh0msfTMH2M4jXm4AY7ChG
 JA/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OyeIQoOv+CBKXLeZgJ1HGwbxMgFE5TUlgdeLbHR6Kjc=;
 b=mds3FfUz0ORjxfR1gOHPQof6hmuCvU1G66Z7+wD175XVe8Po25F/GlnGaF+GC/iL0a
 iFvyJlG/NlGHlK9Cr3wMMX/KGs4KX3gzrqz6UfR1hSBiLqcsmoSdFFkp2ivX9P0kfA+M
 Rc/dHMstvzd+w/Y8y1n9ULCdw3W2iQpq30YvFUmemV3GLceDYk0kP2vqQxNMw7nOYqrm
 c5G2urQzshYv5s1rXmumulf/8hu6ZQRdTY3Ze/Q5bPPk13qPDwqK+RJ7Jv3vknICZCRw
 lTmL8xbh9tmEnUyVUZbF9uaf2ambA80uJxxlWFGN+yKFH5FaHIEzd2GAUDXtMwncH19c
 Imlw==
X-Gm-Message-State: AGi0PuY47GbFyI6uPI/XBU/g2naJlyQpgIve0ClOD6FJujc2wdJD5SC+
 0E0/PmZR06nW5W24Cslon1F9mHMkfW4B8gLCCns=
X-Google-Smtp-Source: APiQypLbAomzIphBLNuYM3KgiU8Apw6Entsz850iR3gJ4FvIS+7l0Wh/qc4GoMpGc7DD4wnPUzlvgugXoXTZanOraes=
X-Received: by 2002:a05:6512:1082:: with SMTP id
 j2mr10204688lfg.53.1587377938530; 
 Mon, 20 Apr 2020 03:18:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAEme+7FPF+inSJSXQPmuv8Up3Eam0N7fT03zqM-RvcvKsxjfVQ@mail.gmail.com>
 <CAFEAcA9Yk53oK5YstN7DpCCq344+tbyjvDA6RaWcJCrL9QSjMw@mail.gmail.com>
In-Reply-To: <CAFEAcA9Yk53oK5YstN7DpCCq344+tbyjvDA6RaWcJCrL9QSjMw@mail.gmail.com>
From: Nikolay Igotti <igotti@gmail.com>
Date: Mon, 20 Apr 2020 13:18:47 +0300
Message-ID: <CAEme+7Gt+TX99-pun80doARC5gE6=zDsuJLd1PVxt_SvRPf6Yw@mail.gmail.com>
Subject: Re: [PATCH 3/3] plugins: avoid failing plugin when CPU is inited
 several times
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: multipart/alternative; boundary="0000000000002683c905a3b63a08"
Received-SPF: pass client-ip=2a00:1450:4864:20::141;
 envelope-from=igotti@gmail.com; helo=mail-lf1-x141.google.com
X-detected-operating-system: by eggs1p.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2a00:1450:4864:20::141
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
Cc: Riku Voipio <riku.voipio@iki.fi>, Laurent Vivier <laurent@vivier.eu>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002683c905a3b63a08
Content-Type: text/plain; charset="UTF-8"

Maybe, I've tried least intrusive change as not entirely familiar with
plugin login in QEMU.

On Mon, Apr 20, 2020 at 1:11 PM Peter Maydell <peter.maydell@linaro.org>
wrote:

> On Mon, 20 Apr 2020 at 10:16, Nikolay Igotti <igotti@gmail.com> wrote:
> >
> > In linux-user multithreaded scenarious CPU could be inited many times
> with the same id,
> >
> > so avoid assertions on already present hashtable entry.
> >
> >
> > Signed-off-by: Nikolay Igotti <igotti@gmail.com>
>
> Wouldn't it be better to make sure we remove the entry from
> the hashtable when the old thread that was using that CPU
> ID exits, or is that not feasible ?
>
> thanks
> -- PMM
>

--0000000000002683c905a3b63a08
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Maybe, I&#39;ve tried least intrusive change as not entire=
ly familiar with plugin login in QEMU.</div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Apr 20, 2020 at 1:11 PM Peter=
 Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org">peter.maydell@lina=
ro.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Mon, 20 Apr 2020 at 10:16, Nikolay Igotti &lt;<a href=3D"mailto:ig=
otti@gmail.com" target=3D"_blank">igotti@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; In linux-user multithreaded scenarious CPU could be inited many times =
with the same id,<br>
&gt;<br>
&gt; so avoid assertions on already present hashtable entry.<br>
&gt;<br>
&gt;<br>
&gt; Signed-off-by: Nikolay Igotti &lt;<a href=3D"mailto:igotti@gmail.com" =
target=3D"_blank">igotti@gmail.com</a>&gt;<br>
<br>
Wouldn&#39;t it be better to make sure we remove the entry from<br>
the hashtable when the old thread that was using that CPU<br>
ID exits, or is that not feasible ?<br>
<br>
thanks<br>
-- PMM<br>
</blockquote></div>

--0000000000002683c905a3b63a08--

