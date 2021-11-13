Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F7C344F3D6
	for <lists+qemu-devel@lfdr.de>; Sat, 13 Nov 2021 16:16:13 +0100 (CET)
Received: from localhost ([::1]:44776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlulH-0001da-Li
	for lists+qemu-devel@lfdr.de; Sat, 13 Nov 2021 10:16:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mluk9-0000xF-5p
 for qemu-devel@nongnu.org; Sat, 13 Nov 2021 10:15:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:41090)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mluk6-0000eX-1E
 for qemu-devel@nongnu.org; Sat, 13 Nov 2021 10:15:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636816496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=QRp8Umqfl/etXe0JDCL5w/gqEyX/6MGffED3Ytaifcc=;
 b=TMwhkilk6/f6bxjfbtAThrXn+TpKA1VOGKlJM4sjHVrD4JuJTK8In4JdjTk6v4sgSchXz1
 zNfslYHlzHc7jjeyaYNCjepumyyv0ZynCSAQRAhhWApbIVM+u2e6myMg2d1SmmH0vTUWRp
 qRbFxlH0V96TjHJDVTFmmmMq2HnXcNM=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-r2WXseweNmuQ-WqNI5yXcw-1; Sat, 13 Nov 2021 10:14:54 -0500
X-MC-Unique: r2WXseweNmuQ-WqNI5yXcw-1
Received: by mail-pj1-f69.google.com with SMTP id
 x6-20020a17090a6c0600b001a724a5696cso6042836pjj.6
 for <qemu-devel@nongnu.org>; Sat, 13 Nov 2021 07:14:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QRp8Umqfl/etXe0JDCL5w/gqEyX/6MGffED3Ytaifcc=;
 b=eCn51MNV28gAjm7A7K7ruTAzJJLE4RvDLTDrbmcnC0m3vHgDUzghjHBwXLD/Wa0gzn
 BYLTl+UuTO21qSGrdeRRgdTiCXy2myc6hG29DpKnFdAsUxN9Qms8ylt0Hp0Z1UKy2pKM
 okvyUTh02EDadLI/KHj344LOwFUJAn/ePF/sZhiTrPgMN7CU8kgnZqdajSxA/Mj29qsX
 ZATg+0rl+bWXaMAGdrRPul2/JO5uQTgNOXX/1mKps9nVJ2FRqnaeI1san/PgnupNOfTr
 bj3aZgigthn4wBizhZk7t04EScG8JcFtMa8fYkS+ynFUuqGQDMi0aeAGou9dmNiIe5+4
 epYw==
X-Gm-Message-State: AOAM530xDahq4TjpAztoWVqj4aadiQbw2G+kLa1ftyG7vW5N43oZzW68
 AiRZstB9YiIlSUYd7p46nXwzIgDeLvlP9kDIAT0qNGP0s4bzCXLECxDOGL2NWxiF7BZUWLuN6po
 YT8iR4LkPd0HA6qLUGuFVVBsFTIM/3HQ=
X-Received: by 2002:a63:4542:: with SMTP id u2mr15567501pgk.396.1636816493398; 
 Sat, 13 Nov 2021 07:14:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJznj6CNFo/JaXwL789nA4Tf0dncWDo8VHdwxBlOokrQvwtP8Q3gF1NUhhwsLu9mPHkwxtXT9sM2chO9DxPljDk=
X-Received: by 2002:a63:4542:: with SMTP id u2mr15567479pgk.396.1636816493098; 
 Sat, 13 Nov 2021 07:14:53 -0800 (PST)
MIME-Version: 1.0
References: <YYdh3l1HTh+kpONa@humpty.home.comstyle.com>
 <53345e90-747e-85f9-cfb4-f5e90da526f7@redhat.com>
 <dcb4aa07-1d2b-0f24-f9cb-196a5bcff6ec@comstyle.com>
In-Reply-To: <dcb4aa07-1d2b-0f24-f9cb-196a5bcff6ec@comstyle.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sat, 13 Nov 2021 12:38:25 +0100
Message-ID: <CABgObfYzh-yvzU4e7QNWEp=-bR71Vj6_y76hdiTT=oLPyAsWow@mail.gmail.com>
Subject: Re: [PATCH] audio: Add sndio backend
To: Brad Smith <brad@comstyle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000a255f105d0ad0949"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DATE_IN_PAST_03_06=1.592,
 DKIMWL_WL_HIGH=-0.701, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7,
 RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a255f105d0ad0949
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

El mar., 9 nov. 2021 22:53, Brad Smith <brad@comstyle.com> escribi=C3=B3:

> On 11/8/2021 9:58 AM, Paolo Bonzini wrote:
>
> > Maybe you want to add sndio to the audio_drivers_priority array if
> > targetos =3D=3D 'openbsd'?
>
> That part I was not 100% sure of.
>
> Am I to understand with the current Meson code it will try to use
> PulseAudio instead of
> ALSA on a Linux system unless overrriden?
>

Yes, correct.

Paolo

>
>

--000000000000a255f105d0ad0949
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">El mar., 9 nov. 2021 22:53, Brad Smith &lt;<a href=3D"=
mailto:brad@comstyle.com">brad@comstyle.com</a>&gt; escribi=C3=B3:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1=
px #ccc solid;padding-left:1ex">On 11/8/2021 9:58 AM, Paolo Bonzini wrote:<=
br><br>
&gt; Maybe you want to add sndio to the audio_drivers_priority array if <br=
>
&gt; targetos =3D=3D &#39;openbsd&#39;?<br>
<br>
That part I was not 100% sure of.<br>
<br>
Am I to understand with the current Meson code it will try to use <br>
PulseAudio instead of<br>
ALSA on a Linux system unless overrriden?<br></blockquote></div></div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Yes, correct.</div><div dir=3D"aut=
o"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"auto"><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex">
<br>
</blockquote></div></div></div>

--000000000000a255f105d0ad0949--


