Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CBA4338B7F
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 12:31:45 +0100 (CET)
Received: from localhost ([::1]:43558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKg1A-0000K9-IL
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 06:31:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lKfz4-0006zZ-OL
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 06:29:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60673)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lKfz3-0007Xj-3j
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 06:29:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615548572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+8UzY49dT4pe7tH175G27xptLdLBgGD71oQlAUmDuxU=;
 b=VQ9Do71C94ZjVB6NJapJQPrh69qDxb+v8XlrUgTHV9C+jppcVT6Se2ADy5lljD0l+dsAeO
 9YGgwBvuQ3V0xXsyzAa/i68DuhuC3CIMHoKatxrkFipVnJzXBwamEfbm4ClOiqRl2HOrSa
 ObepKffvguAhcMdU26o4V4Kn6qkXffw=
Received: from mail-il1-f200.google.com (mail-il1-f200.google.com
 [209.85.166.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-tRWIl4f2OoqfEm_5lI5lYA-1; Fri, 12 Mar 2021 06:29:30 -0500
X-MC-Unique: tRWIl4f2OoqfEm_5lI5lYA-1
Received: by mail-il1-f200.google.com with SMTP id w8so17807198ilg.21
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 03:29:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+8UzY49dT4pe7tH175G27xptLdLBgGD71oQlAUmDuxU=;
 b=ojVEobbG5WK04l3/zokHOFJtfFYSJ4wMKfNfZlkqbhWleJtASI/+Oajaz8hvb7AMsi
 cI9t8AzfmuI8DXDjfUPxPvvP93GK1ASE4MSDe68+b2O7Iyhd4Iso4GUH4lnMfkCPNMd3
 6SDAZ0LPiiHDdHRUIcKehoNdMbgIPzNGKi1W7JJPUHWae4j2+eEjoaHEXalS8kPX/dYC
 gA0X6/QTOkqq3PgpB5D5oMhf01u5LshdR7mVDzdd0sL9wveDMzMKJFLCIyzcUYtRJh+V
 dziaB1RzKze1qL603InTq0FNU11bi/v04IdmM+9u5GjcqcfHHXNIpcDd948MNe+LgmFd
 En/w==
X-Gm-Message-State: AOAM530ra6kX++Z4cKYmiPhpkO8kMSiFBkZC7sizscrcyNw3zIYelicv
 pCSct86P1YPks40cBnlK9/iGKYwVy3Ta8CkEonK1D5VOxMAWfrSFWhmfIv7CbbdTsmJIJ38VKtG
 p5HiiofhLSufngBajRBQiS/dNcV9wZMg=
X-Received: by 2002:a02:230d:: with SMTP id u13mr8005793jau.53.1615548569801; 
 Fri, 12 Mar 2021 03:29:29 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwVCb7nhv+VGKtwPcKMsDPmG3rMUnFd3CDC6TtXtWyQFqN+NPAxrLZSl+0A+iJWIc2z1jKp8P5eSL3mAT0g2d0=
X-Received: by 2002:a02:230d:: with SMTP id u13mr8005788jau.53.1615548569693; 
 Fri, 12 Mar 2021 03:29:29 -0800 (PST)
MIME-Version: 1.0
References: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
 <20210312111806.zdh2c63cxaiyabyp@sirius.home.kraxel.org>
In-Reply-To: <20210312111806.zdh2c63cxaiyabyp@sirius.home.kraxel.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Fri, 12 Mar 2021 15:29:18 +0400
Message-ID: <CAMxuvayh_8=bp4=_CZ9ezEjE6god+35RJ9dBx6TBF34NnO_+zw@mail.gmail.com>
Subject: Re: [PATCH 00/27] Add D-Bus display backend
To: Gerd Hoffmann <kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000009d474c05bd5536f9"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009d474c05bd5536f9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Fri, Mar 12, 2021 at 3:18 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> On Fri, Mar 12, 2021 at 02:00:41PM +0400, marcandre.lureau@redhat.com
> wrote:
> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
>
> The whole series calls for a splitup.  First the bugfixes, which we
> should be able to fast-track for 6.0.  Next the ui opengl changes.  For
> those a cover letter would be nice, describing the overall direction and
> motivation for the change.  Make sure these don't re-introduce a opengl
> dependency to core qemu for modular builds.  Finally the new display
> backend patches / discussion.
>

I agree, what about reviewing and queuing the first patches? Then I can
resend up to the second part.

>
>

--0000000000009d474c05bd5536f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Mar 12, 2021 at 3:18 PM Ger=
d Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Fri=
, Mar 12, 2021 at 02:00:41PM +0400, <a href=3D"mailto:marcandre.lureau@redh=
at.com" target=3D"_blank">marcandre.lureau@redhat.com</a> wrote:<br>
&gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@re=
dhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br>
<br>
The whole series calls for a splitup.=C2=A0 First the bugfixes, which we<br=
>
should be able to fast-track for 6.0.=C2=A0 Next the ui opengl changes.=C2=
=A0 For<br>
those a cover letter would be nice, describing the overall direction and<br=
>
motivation for the change.=C2=A0 Make sure these don&#39;t re-introduce a o=
pengl<br>
dependency to core qemu for modular builds.=C2=A0 Finally the new display<b=
r>
backend patches / discussion.<br></blockquote><div><br></div><div>I agree, =
what about reviewing and queuing the first patches? Then I can resend up to=
 the second part.<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
<br>
</blockquote></div></div>

--0000000000009d474c05bd5536f9--


