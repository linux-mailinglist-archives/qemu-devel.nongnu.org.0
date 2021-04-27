Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 553A636C8D7
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 17:44:18 +0200 (CEST)
Received: from localhost ([::1]:42052 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbPsm-00014e-U8
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 11:44:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lbPr9-0000a7-TR
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 11:42:36 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:40319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lbPr0-0006mI-QO
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 11:42:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619538145;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SgX0WvwLE3UFaaM7XFEDg9tgHLEcVBICvo93kjHiZRM=;
 b=hXqSgvgiBgsw6YzUE1dkfQFiFk/3kFVYvUpdKfWaqzUmCe5uCzhjcclFR8BkTUtU3NoM+b
 rWmHzymVO/TrCfsINFAFWO40IAnAD0oBffMbef5u6J0AEmV5PWYAGaBei2ipIC200JONp1
 BN6VrqLqncnAEJaoJT8oTFDoo644hRI=
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-596-Ls-HFmavMeG9xyBJHLv6kw-1; Tue, 27 Apr 2021 11:42:21 -0400
X-MC-Unique: Ls-HFmavMeG9xyBJHLv6kw-1
Received: by mail-pg1-f200.google.com with SMTP id
 b2-20020a6567c20000b02901fda3676f83so19831905pgs.9
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 08:42:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SgX0WvwLE3UFaaM7XFEDg9tgHLEcVBICvo93kjHiZRM=;
 b=WN5y91dsZs/y6X6oJjDqkJ0ZWmurqHwmqHMC4Gi5/cmSa1cDGA4btwMwbP9tKb9Q7w
 IMWt/BrjkTCIevrthRMgb9L9U1BjNjFDEi264PKeMv90AGEcdTtmNAkPwom+h81hBn+E
 BXU5v5Tos+O6Co4zBPuxh8ceMvFDery50Eu+pS02YSyLAtD4TgRTc7UOrdUJpcJdtJ/I
 euEj7oZHMXan+fnNaSuJNFuMpl50iKJH8wh7Z1CyXp3kipH5somMNadFnZI5gxl1h0dk
 YJYKR/LCWlBBFffZ+5Iq4GajkR1lBw/Sm2MMSWI/w1lzn4aUED2y0ceKDMzJkFPxkRao
 loQw==
X-Gm-Message-State: AOAM531yDPbvtexCiX9v81Pp44+xjXwQaj6wNU3cVVShnWBp7d0dnyZC
 IayOnHDcPkyjkmhpGbwXbR1bCJ+qupDhJ6a5VHLfGa0cmz6jDnpoAUq63G/PJbGO7KWVV7l7qAr
 qW1byLRbCRwSiSAz1zB0IsDE5jn3o6dA=
X-Received: by 2002:a17:90a:fd95:: with SMTP id
 cx21mr5401658pjb.137.1619538140213; 
 Tue, 27 Apr 2021 08:42:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyX4P2TzCwlzJY9tPpbUnjP/yS8XnvzDT/BEyDNqxj9zM9Oqjgma5p4Y2L6aT+L5cWEtGOSMbdbLVJMtd83EYM=
X-Received: by 2002:a17:90a:fd95:: with SMTP id
 cx21mr5401628pjb.137.1619538140011; 
 Tue, 27 Apr 2021 08:42:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210423083351.2096734-1-kraxel@redhat.com>
 <20210423083351.2096734-5-kraxel@redhat.com>
 <CAMxuvazpGJdpdWMYa7a9M48yk48kkr8F-96HivkSvMfko8GPow@mail.gmail.com>
 <20210427150430.ri2qq3kbcq3cyscb@sirius.home.kraxel.org>
In-Reply-To: <20210427150430.ri2qq3kbcq3cyscb@sirius.home.kraxel.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 27 Apr 2021 19:42:09 +0400
Message-ID: <CAMxuvawPE86ZaG0OeOgkSeTepWNNy4Lm+i7NuT_0ANjy8=y1Cw@mail.gmail.com>
Subject: Re: [PATCH v4 4/9] ui/vdagent: core infrastructure
To: Gerd Hoffmann <kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000089302405c0f61b9d"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.218,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000089302405c0f61b9d
Content-Type: text/plain; charset="UTF-8"

Hi

On Tue, Apr 27, 2021 at 7:04 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
>
> > What about the endianness of the vdagent messages?
> >
> > It looks like this was never well defined, but that it was settled on LE:
> >
> https://gitlab.freedesktop.org/spice/linux/vd_agent/-/commit/99d9d3583143aef7143ec986cebe2980fdeeb776
> >
> > It's worth checking or leaving a TODO, I suppose.
>
> Ah, good to know, adding a comment and TODO item for now.
>
> How does things look on the guest side?  Does vdagent work in bigendian
> guests?  Which is pretty much s390x these days with even ppc moving to
> little endian ...
>

Based on the commit above, I suppose there were some users on big-endian.

Fwiw, the Spice protocol clearly states that it's LE (unless explicitly
stated differently):
https://www.spice-space.org/spice-protocol.html#_common_protocol_definition

--00000000000089302405c0f61b9d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 27, 2021 at 7:04 PM Ger=
d Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0=
 Hi,<br>
<br>
&gt; What about the endianness of the vdagent messages?<br>
&gt; <br>
&gt; It looks like this was never well defined, but that it was settled on =
LE:<br>
&gt; <a href=3D"https://gitlab.freedesktop.org/spice/linux/vd_agent/-/commi=
t/99d9d3583143aef7143ec986cebe2980fdeeb776" rel=3D"noreferrer" target=3D"_b=
lank">https://gitlab.freedesktop.org/spice/linux/vd_agent/-/commit/99d9d358=
3143aef7143ec986cebe2980fdeeb776</a><br>
&gt; <br>
&gt; It&#39;s worth checking or leaving a TODO, I suppose.<br>
<br>
Ah, good to know, adding a comment and TODO item for now.<br>
<br>
How does things look on the guest side?=C2=A0 Does vdagent work in bigendia=
n<br>
guests?=C2=A0 Which is pretty much s390x these days with even ppc moving to=
<br>
little endian ...<br></blockquote><div><br></div><div>Based on the commit a=
bove, I suppose there were some users on big-endian.</div><div><br></div><d=
iv>Fwiw, the Spice protocol clearly states that it&#39;s LE (unless explici=
tly stated differently):</div><div><a href=3D"https://www.spice-space.org/s=
pice-protocol.html#_common_protocol_definition">https://www.spice-space.org=
/spice-protocol.html#_common_protocol_definition</a></div></div></div>

--00000000000089302405c0f61b9d--


