Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CFD0214BF2
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Jul 2020 13:16:17 +0200 (CEST)
Received: from localhost ([::1]:51662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1js2d5-0007UW-Uf
	for lists+qemu-devel@lfdr.de; Sun, 05 Jul 2020 07:16:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56230)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1js2bi-00074P-09
 for qemu-devel@nongnu.org; Sun, 05 Jul 2020 07:14:50 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:43508
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1js2bd-0001qA-Aw
 for qemu-devel@nongnu.org; Sun, 05 Jul 2020 07:14:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593947684;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0PbXWcgLxb27F1D3aXU2CE3bsYmKHtG1LHDWVLxzNhY=;
 b=J8mnoYYK7vVZdiRRLkHj7Fe+o/S3OTl8a80KsMSzGuukDrzo8fbHZE4IVgAnBfcIwb6hhn
 ceVTKOZBy/h/P1/x4GIJuY7+2Tzp4e749gEm1ak0ziMTC5QN62vLjXVuW3474MUJKBOjRP
 gVmCAyROuOJQXFD5ZmVHcW6yxv6A1I4=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-433-eV0uyt_ONvOgsUTyuP17tQ-1; Sun, 05 Jul 2020 07:14:42 -0400
X-MC-Unique: eV0uyt_ONvOgsUTyuP17tQ-1
Received: by mail-ej1-f71.google.com with SMTP id yw17so31592234ejb.12
 for <qemu-devel@nongnu.org>; Sun, 05 Jul 2020 04:14:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0PbXWcgLxb27F1D3aXU2CE3bsYmKHtG1LHDWVLxzNhY=;
 b=YDvt4vljvclm2cdATykFAzbqQMKqY9DytvOQsztzpq1tdrFMR88ZR2EynnYkC3gVKj
 OQwYSQ+Er5WmuSNsoFa8fMj/A4rPeppXOA8x14y8pMF60vetVaFDodVk7krS8Hi24+ym
 GBmROF2JyzvbB5UXUlOQ663A4LN8qF+97zNLP016zyWIdbuIiB5L8Bz2rGibokvD+Uei
 CnYdqgRw/fTex43Aa//iIETcfyNIF8I5Ys19uQo9QBLes34NPs2uEtJOE1cMHOb3QMGy
 nmujVkj/8PzYGBQhdRd3PI2hd4S+PuPjV3NvGqifKNljW9tX9xxDQteCCOjpvyy66QTt
 t18Q==
X-Gm-Message-State: AOAM531/n5YZ2lOeeiQ0TjieBHtsE/DOXKwoKvFB07W3FPZWS0HZU+gy
 eydtDkX9pPzYsmK6iJV9mmcPtNXcWTa0YhBhgb/5De8PixBF7Zffesd2GGUXxoDC+JLTRfzV0nU
 06g4esSLtivYcseFifpSnjssnf+LERFs=
X-Received: by 2002:aa7:db4f:: with SMTP id n15mr33849953edt.193.1593947681649; 
 Sun, 05 Jul 2020 04:14:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLVehjagcitC8Xw0UVl322KO242LVw+VfHrCb8xTMkrOeozfMZN4e4ZEdVIDwr9IBClUwxOsw/zw8CcJML/88=
X-Received: by 2002:aa7:db4f:: with SMTP id n15mr33849935edt.193.1593947681443; 
 Sun, 05 Jul 2020 04:14:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200620153837.14222-1-f4bug@amsat.org>
 <c0366cb5-fcb0-ff62-8ab5-92722a47d4e7@redhat.com>
 <65937a53-5430-e5df-a5f0-de93dad315f2@amsat.org>
In-Reply-To: <65937a53-5430-e5df-a5f0-de93dad315f2@amsat.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Sun, 5 Jul 2020 13:14:29 +0200
Message-ID: <CABgObfYbqHh6JZZ4z_KUovekUH2yac17oQr0WH6K9GkdEz6rkg@mail.gmail.com>
Subject: Re: [PATCH] hw/core/qdev: Increase qdev_realize() kindness
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000057e27905a9afddeb"
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/05 05:57:35
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000057e27905a9afddeb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Are we sure that qdev_realize is never called with user-provided input? If
it's a programming error, the call chain will end up passing &error_abort
anyway, won't it?

Paolo

Il dom 5 lug 2020, 12:05 Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org> ha
scritto:

> On 7/5/20 7:46 AM, Paolo Bonzini wrote:
> > On 20/06/20 17:38, Philippe Mathieu-Daud=C3=A9 wrote:
> >> -    } else {
> >> -        assert(!DEVICE_GET_CLASS(dev)->bus_type);
> >> +    } else if (DEVICE_GET_CLASS(dev)->bus_type) {
> >> +        error_report("%s: Unexpected bus '%s' for device '%s'",
> >> +                     __func__, DEVICE_GET_CLASS(dev)->bus_type,
> >> +                     object_get_typename(OBJECT(dev)));
> >> +        abort();
> >>      }
> >>
> >
> > Since there is an errp, should we use it and be even kinder?
>
> This is a programming error, not an user triggerable condition,
> so I'm not sure. IOW this must not happen, but if it does, then
> the error message helps the developer to notice the problem without
> having to use gdb.
>
>

--00000000000057e27905a9afddeb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Are we sure that qdev_realize is never called with user-p=
rovided input? If it&#39;s a programming error, the call chain will end up =
passing &amp;error_abort anyway, won&#39;t it?<div dir=3D"auto"><br></div><=
div dir=3D"auto">Paolo</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Il dom 5 lug 2020, 12:05 Philippe Mathieu-Dau=
d=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.org</a>&gt; ha s=
critto:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">On 7/5/20 7:46 AM, Paolo Bo=
nzini wrote:<br>
&gt; On 20/06/20 17:38, Philippe Mathieu-Daud=C3=A9 wrote:<br>
&gt;&gt; -=C2=A0 =C2=A0 } else {<br>
&gt;&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(!DEVICE_GET_CLASS(dev)-&gt;bus=
_type);<br>
&gt;&gt; +=C2=A0 =C2=A0 } else if (DEVICE_GET_CLASS(dev)-&gt;bus_type) {<br=
>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 error_report(&quot;%s: Unexpected bus=
 &#39;%s&#39; for device &#39;%s&#39;&quot;,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0__func__, DEVICE_GET_CLASS(dev)-&gt;bus_type,<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0object_get_typename(OBJECT(dev)));<br>
&gt;&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 abort();<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;&gt;=C2=A0 <br>
&gt; <br>
&gt; Since there is an errp, should we use it and be even kinder?<br>
<br>
This is a programming error, not an user triggerable condition,<br>
so I&#39;m not sure. IOW this must not happen, but if it does, then<br>
the error message helps the developer to notice the problem without<br>
having to use gdb.<br>
<br>
</blockquote></div>

--00000000000057e27905a9afddeb--


