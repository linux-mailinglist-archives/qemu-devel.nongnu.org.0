Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8765B4E593F
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Mar 2022 20:37:32 +0100 (CET)
Received: from localhost ([::1]:47382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nX6nT-0006AC-52
	for lists+qemu-devel@lfdr.de; Wed, 23 Mar 2022 15:37:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56226)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nX6mX-0005KC-Ou
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 15:36:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27390)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nX6mU-0000Ef-SJ
 for qemu-devel@nongnu.org; Wed, 23 Mar 2022 15:36:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648064189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xOBEyZTqwXcvKIG32m1xtZFZVFtIP1MmfpcHe33UR3Y=;
 b=cW4C30FmfbAA8klD3eE7HPdS8u/lNH5hUKSjW8pUDCxe+zdrE55ROvaKblbHHrYSq8f0HA
 1VNN3pC+hlqYIgzmhcqcMBxbggvPLf2nen3RCDLYxK11FrqbuQimTbPnFg9paGAdmzfUTh
 o8ZuomDYEckqot5fvHul+x32fcnj6Ts=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-120-A531xxdrOvWz9Mt4DCC5Nw-1; Wed, 23 Mar 2022 15:36:27 -0400
X-MC-Unique: A531xxdrOvWz9Mt4DCC5Nw-1
Received: by mail-vk1-f198.google.com with SMTP id
 u66-20020a1fdd45000000b0033708b98d46so504166vkg.10
 for <qemu-devel@nongnu.org>; Wed, 23 Mar 2022 12:36:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=xOBEyZTqwXcvKIG32m1xtZFZVFtIP1MmfpcHe33UR3Y=;
 b=fmHubrReB23XcQKSVwqgKyoIAPYXEuvzi2AvZjxM9cOnKE7G0C9qPzTu+AC/gUKUqB
 3+VPmVkRSfx/saFdJRkeyrd+M3egKzeFiT2msKJvV5ZWsNXLE8rYw1RhEAd0to98zJz0
 uNQj5Dp2kbKgoDENOGG8dUQAx3a+JAwbK5HgCV3NEXujiE+UZO/1hci8jlfNTDj6qkaB
 H7RhbYwmUDTHl+F95iBJ0IJV9Zm9RXCmuGmin+t409LhxGrtSU8v6RSsupFYAMdHiauR
 e0y1Y2/GbkxJKRAbjbolpg4etoHH4o9+A1IWOWVt0DhUDNTvuWmog4svS/2Q4r0cMNFa
 QRCw==
X-Gm-Message-State: AOAM53098b56P8Um1HiPeT0oZy60S0NdYl7zZD+3BiUC4Wsi/9ZlfYNn
 ulwKSCqVk2ZVXof7MKNIBl/8czbAR+4LmNZ0KQhHSLh8LZFUGg7YPuhjILy+u5SGQ+0jy0l5rI1
 hUZ+LQNrG92e9gWBzFqEShrS9YoKnPYA=
X-Received: by 2002:ab0:ae:0:b0:351:4e9a:c3fd with SMTP id
 43-20020ab000ae000000b003514e9ac3fdmr793297uaj.119.1648064187045; 
 Wed, 23 Mar 2022 12:36:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJ6so4JgPl4v0GsQ1ni02pifhAYADLeWO4JZ2BeAehTpW0yn4CxrbKLLcRpc/QLHsZci7zJb2oHoErTAjwfXU=
X-Received: by 2002:ab0:ae:0:b0:351:4e9a:c3fd with SMTP id
 43-20020ab000ae000000b003514e9ac3fdmr793280uaj.119.1648064186749; 
 Wed, 23 Mar 2022 12:36:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220321210847.914787-1-jsnow@redhat.com>
 <20220321210847.914787-7-jsnow@redhat.com>
 <e265172c-39b7-2f2d-54ca-79ac77cc27fb@redhat.com>
In-Reply-To: <e265172c-39b7-2f2d-54ca-79ac77cc27fb@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 23 Mar 2022 15:36:15 -0400
Message-ID: <CAFn=p-bqhQiiMWpREjvS9o33aGtvhrD5i=+8q0+dT-7o1R0TmA@mail.gmail.com>
Subject: Re: [PATCH 06/10] python/aqmp: copy qmp docstrings to qemu.aqmp.legacy
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Beraldo Leal <bleal@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 23, 2022 at 2:24 PM Hanna Reitz <hreitz@redhat.com> wrote:
>
> On 21.03.22 22:08, John Snow wrote:
> > Copy the docstrings out of qemu.qmp, adjusting them as necessary to
> > more accurately reflect the current state of this class.
> >
> > (Licensing: This is copying and modifying GPLv2-only licensed docstring=
s
> > into a GPLv2-only file.)
> >
> > Signed-off-by: John Snow <jsnow@redhat.com>
> > Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> > Reviewed-by: Beraldo Leal <bleal@redhat.com>
> > ---
> >   python/qemu/aqmp/legacy.py | 102 ++++++++++++++++++++++++++++++++++--=
-
> >   1 file changed, 94 insertions(+), 8 deletions(-)
> >
> > diff --git a/python/qemu/aqmp/legacy.py b/python/qemu/aqmp/legacy.py
> > index 10c7c99c4f..20ffdd8956 100644
> > --- a/python/qemu/aqmp/legacy.py
> > +++ b/python/qemu/aqmp/legacy.py
>
> [...]
>
> > @@ -60,6 +63,21 @@ class QMPBadPortError(QMPError):
> >
> >
> >   class QEMUMonitorProtocol:
> > +    """
> > +    Provide an API to connect to QEMU via QEMU Monitor Protocol (QMP)
> > +    and then allow to handle commands and events.
> > +
> > +    :param address:  QEMU address, can be either a unix socket path (s=
tring)
> > +                     or a tuple in the form ( address, port ) for a TC=
P
> > +                     connection
> > +    :param server:   Deprecated, ignored. (See 'accept')
>
> Can=E2=80=99t help but notice that this is (technically) just wrong, beca=
use it
> isn=E2=80=99t ignored.  Are you afraid people might not be sufficiently
> dissuaded by the =E2=80=9Cdeprecated=E2=80=9D keyword?  (I mean, if that =
were the case,
> I=E2=80=99d suggest you write =E2=80=9CDeprecated, because setting this t=
o true might
> make your computer explode=E2=80=9D instead.)
>

Oops, this is outdated. I *did* drop this parameter. once. And then I
re-added it.

Thanks for noticing.

--js


