Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 36CE115DADF
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Feb 2020 16:26:34 +0100 (CET)
Received: from localhost ([::1]:40322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j2crR-0007wc-9E
	for lists+qemu-devel@lfdr.de; Fri, 14 Feb 2020 10:26:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47465)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j2cll-0005g8-9D
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 10:20:42 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j2clj-00014O-Su
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 10:20:40 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:38529)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j2clj-00013Q-MP
 for qemu-devel@nongnu.org; Fri, 14 Feb 2020 10:20:39 -0500
Received: by mail-ot1-x343.google.com with SMTP id z9so9463946oth.5
 for <qemu-devel@nongnu.org>; Fri, 14 Feb 2020 07:20:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=oGP8xTna9n3xc5N0hWrzsdpLsZ4Z8Y5JKlSsBOv9kx8=;
 b=J2MzAqciupf/AVPjMhv4bie3cpOrU9WY3+96PwzklmZvSfKKWdjqr3354CncuWINFG
 34jStg3P3i7OSESa7ld1pgfTetpBuqFlxaLlBtAn9AwS438dky77tUNpkfVCSKWfOjVo
 LN5uBkxGes9A8/jSh7NxP0bITyf9EqBykmj3BMkNCDaexcbIU9lT2K4v9xxutGMe7eCT
 6sJb2zms62xWpDQIEExJRZ+jTF0LcT2O/I8spFbQ8gLMeojMEVCi4SJ6yhswffNG3xtX
 BYqaq+hUjaRCroGpMxJeE59Ky3a3wU2F8HaMZ+RMalKXvdmnBS+DVNStYpdCnTlTRJZe
 xt6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oGP8xTna9n3xc5N0hWrzsdpLsZ4Z8Y5JKlSsBOv9kx8=;
 b=elpD5OQALQXBDnFwg5z1DwYIgeVF2yCYPP+wymY1nVW0inX9KiVtWwMTOUj2pZm443
 VzNNAygvLfSVEAK026d4TIvCE1OhnfO5c0oM8X9kEvV/JVPHLYiDTvaN9iRpznRUX2wi
 TsTL6l6n7YkrjVw8djuDfS57Gu8oA6usTjLC43yEp7WreQW7TeO63ZqZX6QmNw4BrfxZ
 P8qPUOktXoEGm5ae6Pf5BERGpJDt2dQIitYbl6jjWVGdZtXuusgQpoKqOfl7Kv+HDQYI
 XXXL+rbKhPJAI1YjFDJ0Jv85cDyaeUwsGVYcdtVxKilSUAXuSbW75wDV5/GjH5JlcCVp
 gK9A==
X-Gm-Message-State: APjAAAUkRWEd5D32J0nzKC2J82q9ZZUZD0pnj2nMZ6yB1E0N/uiCdXQO
 62zVCfgZoU2RSU0Th+VOVd0GUDt0JNtkudDsE6Ud0Q==
X-Google-Smtp-Source: APXvYqzQaZvqHWvdxReoUBaLq6i5VKD+05MtqWu8HwKZxtGC9m7R9Ts9kxLV8hGT/DhzRAXdK01NrSiXM+yonjGWJQs=
X-Received: by 2002:a05:6830:1184:: with SMTP id
 u4mr2576371otq.221.1581693637050; 
 Fri, 14 Feb 2020 07:20:37 -0800 (PST)
MIME-Version: 1.0
References: <20200213175647.17628-1-peter.maydell@linaro.org>
 <20200213175647.17628-19-peter.maydell@linaro.org>
 <87pneh1wul.fsf@dusky.pond.sub.org>
 <87v9o9rylz.fsf@dusky.pond.sub.org>
In-Reply-To: <87v9o9rylz.fsf@dusky.pond.sub.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 14 Feb 2020 15:20:26 +0000
Message-ID: <CAFEAcA8b32o+CryKWZbDNj+KFcJPY8ToXW_fYaa_0FuDDE87WA@mail.gmail.com>
Subject: Re: [PATCH v2 18/30] qapi: Delete all the "foo: dropped in n.n" notes
To: Markus Armbruster <armbru@redhat.com>
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
Cc: John Snow <jsnow@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>,
 Michael Roth <mdroth@linux.vnet.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 14 Feb 2020 at 15:13, Markus Armbruster <armbru@redhat.com> wrote:
>
> Markus Armbruster <armbru@redhat.com> writes:
>
> > Peter Maydell <peter.maydell@linaro.org> writes:
> >
> >> A handful of QAPI doc comments include lines like
> >> "ppcemb: dropped in 3.1". The doc comment parser will just
> >> put these into whatever the preceding section was; sometimes
> >> that's "Notes", and sometimes it's some random other section,
> >> as with "NetClientDriver" where the "'dump': dropped in 2.12"
> >> line ends up in the "Since:" section.
> >>
> >> This tends to render wrongly, more so in the upcoming rST
> >> generator, but sometimes even in the texinfo, as in the case
> >> of QKeyCode:
> >>    ac_bookmarks
> >>        since 2.10 altgr, altgr_r: dropped in 2.10
> >>
> >> We now have a better place to tell users about deprecated
> >> and deleted functionality -- qemu-deprecated.texi.
> >> So just remove all these "dropped in" remarks entirely.
>
> The first sentence makes me expect we'll move these bits to the better
> place.  The second then tells me we drop them, without giving a reason.
>
> Suggest:
>
>    Since commit 3264ffced3 (v4.2.0), we have a better place to tell
>    users about deprecated and deleted functionality --
>    qemu-deprecated.texi.  These "dropped in" remarks all predate it, and
>    other feature drops of that vintage are not documented anywhere, so
>    moving these to qemu-deprecated.texi makes little sense.  Drop them
>    instead.
>
> With something like that
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

Yeah, I wrote the commit message on the assumption that we'd
be modifying the commit contents to include documenting this
stuff somewhere else. If we're happy not to document the
feature-drops at all then we can modify the commit message instead.

thanks
-- PMM

