Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 746552EE655
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 20:43:23 +0100 (CET)
Received: from localhost ([::1]:46364 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxbBq-0001hZ-Hx
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 14:43:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxbAi-00012m-VI
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 14:42:12 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35129)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kxbAf-0005kf-77
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 14:42:12 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610048527;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y0sO6xsxqJO9hWvzYeG73IDH3YEGj8+E3VSoQBNcxYw=;
 b=cCQ8mJKcp5yBGusvvMlEQ7YaFM75VF59J/7acSVMvwO3NAEcyp3D1JW6EsFvXk8yWXjq+k
 5iCRKLm6QP0DOsPW3H1HfeVA/O0LUsRwoLf+ZbbyT2AE7LLR5XjhrUvfSvw/Qb3KDF8+ii
 FKewzK8LZW6Vrx9duU9w1lpPEHO1f8E=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-439-uI4greQ5Mzqr7cQjAeO70w-1; Thu, 07 Jan 2021 14:42:04 -0500
X-MC-Unique: uI4greQ5Mzqr7cQjAeO70w-1
Received: by mail-pl1-f199.google.com with SMTP id 98so4653868pla.12
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 11:42:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y0sO6xsxqJO9hWvzYeG73IDH3YEGj8+E3VSoQBNcxYw=;
 b=dhSBSvOl5HQvhBLEVZQ4JuV867gtQ7LWDe07QZkawMUmVGNQkBRFrWukoy5GbSAFad
 0XSoO5GV8LchGoNodvAoLAlBEwQDvCpZ6uiYK6oQ3uYKXKaU7NDeD9ZgckZG3okUqZdX
 bCUeXe18Xf2slp5XJlnLKneSNnEPF+w9hyQVri3VZwk873Hrhg7dsUPKRr7L/RiXKlxY
 SyarqfucIs6sjwsLPfAGll6MJDPpjPYe5TuDVYOIE2gqiRVoVcjL/JgRGh55eoJWLB7v
 yzA5GHmVuqhaiX9xjozWBQ3jyQJojr48exWzLRZC63/Cg1eHNlqsZHkPulE9G2THxauy
 u/Rw==
X-Gm-Message-State: AOAM532OdiQ07Uoil4OIxQ+OwxLPRejy/uJhBQaAu9/ckDFMvMdZ7dMd
 0o32X8wNrkPWoPFVPLZD/Nr4ADnu0upNpJ9JM3q8N2AchcWU0lDxXt58yAdrAzwRF/r97jfQoSc
 DMVpFlelhvp0Dqehq9eja5HOnFyste0M=
X-Received: by 2002:a63:cb06:: with SMTP id p6mr3376853pgg.146.1610048523636; 
 Thu, 07 Jan 2021 11:42:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzxaZTWucm102yH7gEhTrerkclw3bizNEsDptYLUITC0Yryz+CAERyLncw2cOVbPeC/zghllzx0yB3N/Pvk2so=
X-Received: by 2002:a63:cb06:: with SMTP id p6mr3376828pgg.146.1610048523391; 
 Thu, 07 Jan 2021 11:42:03 -0800 (PST)
MIME-Version: 1.0
References: <CAFEAcA-X6DSKeyS4bbNe3tu-QFGxc1VM+Eoz_UMk-8jb--zq9g@mail.gmail.com>
 <ea49da2a-47f9-8ffe-8dbc-1974f34cb6f1@redhat.com>
 <X/NPRqMkdM0/IxTh@SPB-NB-133.local>
 <af0194cd-cdcc-44a3-f023-80d73d96c9e8@redhat.com>
 <X/R5xtvMn4PcSkTf@SPB-NB-133.local>
 <690581da-9258-41e5-14cb-bb1b162e8993@redhat.com>
 <X/cvK5Xkh6+1Qn1K@SPB-NB-133.local>
 <86bebbbf-ff0f-263d-96a2-4e6df9f85776@redhat.com>
 <X/dQb7xj/RYiT00R@SPB-NB-133.local>
 <74d3e1a4-3f0e-f3bb-6079-03043530bfa5@redhat.com>
 <X/ditOsBmc4A1lJn@SPB-NB-133.local>
In-Reply-To: <X/ditOsBmc4A1lJn@SPB-NB-133.local>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Thu, 7 Jan 2021 20:41:50 +0100
Message-ID: <CABgObfbYXoGVv4_KSzKR5J4XfJ2du9z77LEh1vrShz-q-O_t4g@mail.gmail.com>
Subject: Re: [PATCH] meson: Propagate gnutls dependency
To: Roman Bolshakov <r.bolshakov@yadro.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000004ee9bd05b854a242"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.246,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "open list:Block layer core" <qemu-block@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004ee9bd05b854a242
Content-Type: text/plain; charset="UTF-8"

Il gio 7 gen 2021, 20:36 Roman Bolshakov <r.bolshakov@yadro.com> ha scritto:

> > No I think that Meson should simply explode link_whole libraries to their
> > constituent objects.  This way duplicates are avoided.
> >
>
> Ok. I've looked through related changes in meson and it flattens object
> files implicitly for link_with/link_whole parameters of static_library:
>
>   https://github.com/mesonbuild/meson/pull/6030/files
>
> But qemu adds dependencies to source set and populates dependencies
> parameter of static_library and declare_dependency and we get duplicate
> symbols:
>
>   https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg00411.html
>
> Perhaps it's a bug then.
>

No, the same deduplication is not done for executables, because executables
use libraries directly and not their object files.

Paolo

>
> Regards,
> Roman
>
>

--0000000000004ee9bd05b854a242
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il gio 7 gen 2021, 20:36 Roman Bolshakov &lt;<a href=
=3D"mailto:r.bolshakov@yadro.com">r.bolshakov@yadro.com</a>&gt; ha scritto:=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex">
&gt; No I think that Meson should simply explode link_whole libraries to th=
eir<br>
&gt; constituent objects.=C2=A0 This way duplicates are avoided.<br>
&gt; <br>
<br>
Ok. I&#39;ve looked through related changes in meson and it flattens object=
<br>
files implicitly for link_with/link_whole parameters of static_library:<br>
<br>
=C2=A0 <a href=3D"https://github.com/mesonbuild/meson/pull/6030/files" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://github.com/mesonbuild/=
meson/pull/6030/files</a><br>
<br>
But qemu adds dependencies to source set and populates dependencies<br>
parameter of static_library and declare_dependency and we get duplicate<br>
symbols:<br>
<br>
=C2=A0 <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2021-01/msg=
00411.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.g=
nu.org/archive/html/qemu-devel/2021-01/msg00411.html</a><br>
<br>
Perhaps it&#39;s a bug then.<br></blockquote></div></div><div dir=3D"auto">=
<br></div><div dir=3D"auto">No, the same deduplication is not done for exec=
utables, because executables use libraries directly and not their object fi=
les.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=
=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Regards,<br>
Roman<br>
<br>
</blockquote></div></div></div>

--0000000000004ee9bd05b854a242--


