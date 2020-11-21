Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A04C62BBEA4
	for <lists+qemu-devel@lfdr.de>; Sat, 21 Nov 2020 12:33:01 +0100 (CET)
Received: from localhost ([::1]:55254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kgR8W-0000TJ-O9
	for lists+qemu-devel@lfdr.de; Sat, 21 Nov 2020 06:33:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kgR7d-0008Rh-Uz
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 06:32:05 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kgR7b-0001OP-8I
 for qemu-devel@nongnu.org; Sat, 21 Nov 2020 06:32:04 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605958321;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Ufh8cb5wbhgG9vmtkveCcjFmUekq+54DpDy7scRgf1I=;
 b=O2mW3upJygYWUFb2wuQb/ds+0bwzTtAGf7kztww1DxMPJxXU5CI9F4H6YL6lbXa5a+bfw8
 wwmXNYWkQv4VsVf/C5V5nc/3FjMTIlyqBinvg1gDw1T44MhV4MQtPI5QAgxLiUu38f1VsD
 W1Hir4+Au0IjjUEG6sG4ThzsUT40zAI=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-_109HsWIMZ-ZE08vfjkLtg-1; Sat, 21 Nov 2020 06:31:58 -0500
X-MC-Unique: _109HsWIMZ-ZE08vfjkLtg-1
Received: by mail-pf1-f199.google.com with SMTP id b11so8986624pfi.7
 for <qemu-devel@nongnu.org>; Sat, 21 Nov 2020 03:31:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ufh8cb5wbhgG9vmtkveCcjFmUekq+54DpDy7scRgf1I=;
 b=iGeuTEFXAD/wqSFKcay+j5sSnTs/4FwAM4iFw4PxUeV3Z0jkYvs9cvsDasrt170W6Q
 1E7kpLL24M35ZoJlnzzRh9IW5jySNdX8Z46N4+Orq+UviJE4HHoEw2ufAFOH37Opgp19
 8fEHY64H3kTmcyl94Gd8DQqjEv/QF7ZV5s8balQPPSrvfPhAMuN6e2tWD7XKjvB8BBxC
 h2Hh9/a5UaGaa8WHy9jxJrvp6Wv+elyfD2tcKiDerTc0ORsBkwVHlsbWYqLcruynOo1D
 lZZi2QUX1dKeXW042ku0XjmPvgBc1ZiW0i/QTtcC/lkKNrA5FkYDe2b6ecyQnqd+9nL3
 JhtQ==
X-Gm-Message-State: AOAM531wzrP3aaSd5lyQcp5OEK+QxiJaNtkdvqSMVVcqW1pzwoVCwPdo
 RpmHaB/zN0/ZKkfHvjlJ7cMNKisDZBeA/dv4X6SrPRaxQ0oep+fCmnMyv2AsnRWwxCVkEqawKlO
 4PvbWlzZM1abYJUmmNRhYxqesTZRGC60=
X-Received: by 2002:a63:344a:: with SMTP id b71mr8156577pga.146.1605958317692; 
 Sat, 21 Nov 2020 03:31:57 -0800 (PST)
X-Google-Smtp-Source: ABdhPJza34EA2WDjKD60TikMF81OJovpcW6q5zKvJa23k02D7wBn10Xg/X5G5hLQbwhaE0V7sLCcdlI+aW+tUQ8BYRM=
X-Received: by 2002:a63:344a:: with SMTP id b71mr8156558pga.146.1605958317321; 
 Sat, 21 Nov 2020 03:31:57 -0800 (PST)
MIME-Version: 1.0
References: <97b04446-ca94-cebd-2d8d-4c2013521208@weilnetz.de>
 <20201117175030.eqz5run2m7qmx5qt@steredhat>
 <a6c8de1a-da41-1a4a-8907-790c2467a0b0@redhat.com>
 <ee31c6f2-19dd-f3f6-d916-f04490909dd8@weilnetz.de>
 <d69b024e-9762-2b27-b558-0c60b3e96811@weilnetz.de>
 <a642f513-1d71-8a88-c073-aa607dd60d3c@weilnetz.de>
In-Reply-To: <a642f513-1d71-8a88-c073-aa607dd60d3c@weilnetz.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 21 Nov 2020 12:31:44 +0100
Message-ID: <CABgObfYXZ3HxqQCGcA-Y0nDA3+J8qJW8EzSwArrCrACtrkX+oQ@mail.gmail.com>
Subject: Re: Regressions in build process introduced since August
To: Stefan Weil <sw@weilnetz.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000007488005b49c4fa8"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000007488005b49c4fa8
Content-Type: text/plain; charset="UTF-8"

Il sab 21 nov 2020, 12:26 Stefan Weil <sw@weilnetz.de> ha scritto:

> One more regression: a lot of build targets are no longer supported with
> the new meson based build.
>
> Personally I am missing `make install-doc` and found no good replacement
> up to now.
>

Just use DESTDIR to install in a staging area, and copy the contents of the
docdir.

Paolo

>

--00000000000007488005b49c4fa8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il sab 21 nov 2020, 12:26 Stefan Weil &lt;<a href=3D"m=
ailto:sw@weilnetz.de">sw@weilnetz.de</a>&gt; ha scritto:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex">One more regression: a lot of build targets are no lo=
nger supported with <br>
the new meson based build.<br>
<br>
Personally I am missing `make install-doc` and found no good replacement <b=
r>
up to now.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Just use DESTDIR to install in a staging area, and copy the conte=
nts of the docdir.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo=
</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">
</blockquote></div></div></div>

--00000000000007488005b49c4fa8--


