Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5333918C2E0
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Mar 2020 23:16:33 +0100 (CET)
Received: from localhost ([::1]:43752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jF3Sq-000710-9H
	for lists+qemu-devel@lfdr.de; Thu, 19 Mar 2020 18:16:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59877)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dnbrdsky@gmail.com>) id 1jF3Rf-0006RY-EJ
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 18:15:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dnbrdsky@gmail.com>) id 1jF3Re-0006Yr-DG
 for qemu-devel@nongnu.org; Thu, 19 Mar 2020 18:15:19 -0400
Received: from mail-il1-x134.google.com ([2607:f8b0:4864:20::134]:37506)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <dnbrdsky@gmail.com>)
 id 1jF3Re-0006WP-87; Thu, 19 Mar 2020 18:15:18 -0400
Received: by mail-il1-x134.google.com with SMTP id a6so3827554ilc.4;
 Thu, 19 Mar 2020 15:15:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LcnwlyBQyo7WyHhuzHgKrrtRZZVJkWSUf60FChgZuJk=;
 b=maPa+TM3X42gv/Oo1PT24bQNlhZrVqj3lxf4UCE9ahq3xOzvTt+xfDTCq+Db4hjFzh
 4Gw8gvirNSj1ujFKmEt5RA69mub/mLIX/0+mCdQSQihnG+WtnZl2ujLAaKPjrXfwjhN7
 XLmIE1sIdqwY62eOUmZNA4UIJTKiWMN4yMAOrbiHnnHmCIBgOk+3CZ5tl+BT8eCrbOcF
 l23o5JdOSx4dW+LipJu1U9JurVBcoJgMfcle+tYjquN583wTDKIwIqk2SJTTRMPiWDaK
 5sx/t+WWt/zHvPQ8IBLcXU/WeBfL50broylNLAwC1KOi1VvzZDV9ikPqu2UvjEUmPbu0
 uDXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LcnwlyBQyo7WyHhuzHgKrrtRZZVJkWSUf60FChgZuJk=;
 b=ZANo2sPHoYwksm+5eKI7Plv0yFXTDdIn6Fg8NxWEWXoJkFYrDYGDRg/2J4ipMNPQEw
 JiigK/uOcqVCv19WXKZIe948XhjDROYqrbwTHp8w2Ln1v3XpKlskdbmbOHt7ACGyz8SW
 xncBCzVo6jDk/dOuyVu5DevjmTOUcvi/HiSMHAgBdvmmyUWGPIrNQFmQLHT7NUJ1rZC9
 k79zzhBNPAA9uHFGR788ylK3kkdvAohhLqNt+KLGT1HyTHgLHxwygK6nwWUMW/1gSrRX
 XwTdvTIBk8MRZ75o23b/dD86bz359aLCLhpbTYd1lDCOGVg+uC7fxAskxHNUYOl05reW
 xDyw==
X-Gm-Message-State: ANhLgQ3g5JbzTp6AOoDKjuULq5bSzWgzQp/n8eRNCn8shuKw2Gzvmfwq
 dwzg+OIPP11q/pxGgKqcGEhW1DzXuuYHupoXWp0=
X-Google-Smtp-Source: ADFU+vuQOrpcDgu21yPSoaTW+0GyN/w9pS27lqAyNhEdOqN1Mz+gJyIN2wSk3Exv634c1L1+qtoPQ2ffOg0X1S/45xE=
X-Received: by 2002:a92:da51:: with SMTP id p17mr5425472ilq.254.1584656117486; 
 Thu, 19 Mar 2020 15:15:17 -0700 (PDT)
MIME-Version: 1.0
References: <158464628614.8795.7072935999807888220@39012742ff91>
 <d734a44f-b2d6-150f-ca82-160e334d99c8@redhat.com>
In-Reply-To: <d734a44f-b2d6-150f-ca82-160e334d99c8@redhat.com>
From: Daniel Brodsky <dnbrdsky@gmail.com>
Date: Thu, 19 Mar 2020 15:15:06 -0700
Message-ID: <CA+ZmoZXiH5o09xkD9aLhh3K55xh_kA5fG--06WdUk7pkZW2LSg@mail.gmail.com>
Subject: Re: [PATCH] lockable: replaced locks with lock guard macros where
 appropriate
To: Eric Blake <eblake@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f957d505a13c80bb"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::134
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
Cc: Kevin Wolf <kwolf@redhat.com>, "open list:iSCSI" <qemu-block@nongnu.org>,
 Juan Quintela <quintela@redhat.com>, Peter Lieven <pl@kamp.de>,
 Markus Armbruster <armbru@redhat.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f957d505a13c80bb
Content-Type: text/plain; charset="UTF-8"

On Thu, Mar 19, 2020 at 1:53 PM Eric Blake <eblake@redhat.com> wrote:

>
> Hmm. This one is a different failure than the other patchew warnings
> about variable redefinition; but is still evidence that it is missing
> your "[PATCH] misc: fix __COUNTER__ macro to be referenced properly".
> At any rate, the fact that we have a compiler warning about an unused
> variable (when in reality it IS used by the auto-cleanup attribute) is
> annoying; we may have to further tweak QEMU_LOCK_GUARD to add an
> __attribute__((unused)) to shut up this particular compiler false positive.
>
> This might fix itself once I revise the patch to properly reference the
prior patch
before this one. If not then I can add another patch to get rid of the
false positive.

--000000000000f957d505a13c80bb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, Mar 19, 2020 at 1:53 PM Eric Blak=
e &lt;<a href=3D"mailto:eblake@redhat.com">eblake@redhat.com</a>&gt; wrote:=
<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex"><br>
Hmm. This one is a different failure than the other patchew warnings <br>
about variable redefinition; but is still evidence that it is missing <br>
your &quot;[PATCH] misc: fix __COUNTER__ macro to be referenced properly&qu=
ot;. <br>
At any rate, the fact that we have a compiler warning about an unused <br>
variable (when in reality it IS used by the auto-cleanup attribute) is <br>
annoying; we may have to further tweak QEMU_LOCK_GUARD to add an <br>
__attribute__((unused)) to shut up this particular compiler false positive.=
<br>
<br></blockquote><div>This might fix itself once I revise the patch to prop=
erly reference the prior patch<br></div><div>before this one. If not then I=
 can add another patch to get rid of the false positive.<br></div></div></d=
iv>

--000000000000f957d505a13c80bb--

