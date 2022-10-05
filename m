Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1245F5B97
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Oct 2022 23:20:21 +0200 (CEST)
Received: from localhost ([::1]:37876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogBoS-0005qy-DE
	for lists+qemu-devel@lfdr.de; Wed, 05 Oct 2022 17:20:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ogBbp-0005ZU-E3
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 17:07:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ogBbi-0000uv-UF
 for qemu-devel@nongnu.org; Wed, 05 Oct 2022 17:07:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665004029;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PZYc5fqXz2GW1g5U8saGSKCDBe7XafWihCo/UvVcFhM=;
 b=O5mJ3Q1DSbhqjS7SOM6NGLdgCkChTIaU43KEoXrvCOBPTtNPAJ+Ji3/Pzmw5eDB+C+C+po
 IVPxdsmn515MZR2ZwUJw9zVyQCJa3KHSqXVcWfXatBtRxaC/AWFjlFKVZ1Ei6SAAMo8mdr
 OWGFp6DmZyPNE07YCStqKWVMLrR1ITM=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-472-OefIlzV8P4evCUBN8rP3Rg-1; Wed, 05 Oct 2022 17:07:08 -0400
X-MC-Unique: OefIlzV8P4evCUBN8rP3Rg-1
Received: by mail-ua1-f69.google.com with SMTP id
 t21-20020ab04ad5000000b003d6a29c1824so5597618uae.13
 for <qemu-devel@nongnu.org>; Wed, 05 Oct 2022 14:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=PZYc5fqXz2GW1g5U8saGSKCDBe7XafWihCo/UvVcFhM=;
 b=UXI+oCkfg7p4RPmIgMJIa+1vR8QSWdc9e7PxCep/22Le4NMu0LdvM1Ve6ULMdn74GW
 MZVjMddEqt8px64h4LE1vIy8gUW+aaEni/Nt0KSsyJA3Pe1hkycDF/jFopV62anU3L9h
 D6SLXJcCpf1se7QUAho+MvDDOhHrtM6cLhp97gJV57vjkUjK7wJqvUgQzfEsspQwVfE8
 XVAnrk6zUfOBsCCBrp/4i1i2a176c9e5XuxFXfG0FGZM1130uMjk/ahNwEaAdbtzthld
 VQ7kodU8UMd8OkUM905m9J++5fJNXKBHhYqt3ojJtm0hqNT3o+xKjEej7UIdntDG5VKg
 Lo7A==
X-Gm-Message-State: ACrzQf0Ib8r6PB2xe8Zjw29VFYBmDDefrSPcfmyeBpY58EwQ6ti3+E78
 MUKRPy4XS8NTa1zE1DEtNpDK2hppd/04DKksIxdOvykQBOEOBlVnG/2p7PgAsih7IKLuVOgrYRw
 UsGbgiRliz8q1A0vxpddY2/M8pYndi+c=
X-Received: by 2002:a67:ed07:0:b0:3a6:5bf7:8ba1 with SMTP id
 l7-20020a67ed07000000b003a65bf78ba1mr994814vsp.62.1665004022561; 
 Wed, 05 Oct 2022 14:07:02 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7+gi0iKsB6gP0MhTefUj+UzQVoTHI1eZr8C/my8dtCEcdnaZsY72TgLQW8VymKADMyOETZMPhJCwZRmWLmgek=
X-Received: by 2002:a67:ed07:0:b0:3a6:5bf7:8ba1 with SMTP id
 l7-20020a67ed07000000b003a65bf78ba1mr994799vsp.62.1665004022328; Wed, 05 Oct
 2022 14:07:02 -0700 (PDT)
MIME-Version: 1.0
References: <20221001140935.465607-1-richard.henderson@linaro.org>
 <CABgObfaCCJRSKpdYKjn4EH1Lf6JjZaBREg51USr9tLc7zvU3Mw@mail.gmail.com>
 <15240986-73b2-958c-ed7c-275e64c0659c@linaro.org>
In-Reply-To: <15240986-73b2-958c-ed7c-275e64c0659c@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 5 Oct 2022 17:06:52 -0400
Message-ID: <CABgObfa10HE49XK0O0uzSdRSy4=e9bO5tTPR5RsS-U3+deQWDw@mail.gmail.com>
Subject: Re: [PATCH v3 00/26] target/i386: pc-relative translation blocks
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000004d022505ea4ff504"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000004d022505ea4ff504
Content-Type: text/plain; charset="UTF-8"

Great, then if you want I can merge this myself.

Paolo

Il mer 5 ott 2022, 16:26 Richard Henderson <richard.henderson@linaro.org>
ha scritto:

> On 10/1/22 13:59, Paolo Bonzini wrote:
> >
> >
> > Il sab 1 ott 2022, 16:09 Richard Henderson <richard.henderson@linaro.org
> > <mailto:richard.henderson@linaro.org>> ha scritto:
> >
> >     This is the x86 specific changes required to reduce the
> >     amount of translation for address space randomization.
> >     For v3, quite a few changes based on Paolo's feedback.
> >
> >
> > Reviewed-by: Paolo Bonzini <pbonzini@redhat.com <mailto:
> pbonzini@redhat.com>>
> >
> >
> >
> >     r~
> >
> >     Based-on: 20220930212622.108363-1-richard.henderson@linaro.org
> >     <mailto:20220930212622.108363-1-richard.henderson@linaro.org>
> >     ("[PATCH v6 00/18] tcg: CPUTLBEntryFull and TARGET_TB_PCREL")
>
> Thanks.  FYI, yhe Based-on dependency is now upstream.
>
>
> r~
>
>

--0000000000004d022505ea4ff504
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Great, then if you want I can merge this myself.<div dir=
=3D"auto"><br></div><div dir=3D"auto">Paolo=C2=A0</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il mer 5 ott 2022, 1=
6:26 Richard Henderson &lt;<a href=3D"mailto:richard.henderson@linaro.org">=
richard.henderson@linaro.org</a>&gt; ha scritto:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">On 10/1/22 13:59, Paolo Bonzini wrote:<br>
&gt; <br>
&gt; <br>
&gt; Il sab 1 ott 2022, 16:09 Richard Henderson &lt;<a href=3D"mailto:richa=
rd.henderson@linaro.org" target=3D"_blank" rel=3D"noreferrer">richard.hende=
rson@linaro.org</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:richard.henderson@linaro.org" target=3D"_=
blank" rel=3D"noreferrer">richard.henderson@linaro.org</a>&gt;&gt; ha scrit=
to:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0This is the x86 specific changes required to reduce=
 the<br>
&gt;=C2=A0 =C2=A0 =C2=A0amount of translation for address space randomizati=
on.<br>
&gt;=C2=A0 =C2=A0 =C2=A0For v3, quite a few changes based on Paolo&#39;s fe=
edback.<br>
&gt; <br>
&gt; <br>
&gt; Reviewed-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" =
target=3D"_blank" rel=3D"noreferrer">pbonzini@redhat.com</a> &lt;mailto:<a =
href=3D"mailto:pbonzini@redhat.com" target=3D"_blank" rel=3D"noreferrer">pb=
onzini@redhat.com</a>&gt;&gt;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0r~<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Based-on: <a href=3D"mailto:20220930212622.108363-1=
-richard.henderson@linaro.org" target=3D"_blank" rel=3D"noreferrer">2022093=
0212622.108363-1-richard.henderson@linaro.org</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:20220930212622.108363-=
1-richard.henderson@linaro.org" target=3D"_blank" rel=3D"noreferrer">202209=
30212622.108363-1-richard.henderson@linaro.org</a>&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0(&quot;[PATCH v6 00/18] tcg: CPUTLBEntryFull and TA=
RGET_TB_PCREL&quot;)<br>
<br>
Thanks.=C2=A0 FYI, yhe Based-on dependency is now upstream.<br>
<br>
<br>
r~<br>
<br>
</blockquote></div>

--0000000000004d022505ea4ff504--


