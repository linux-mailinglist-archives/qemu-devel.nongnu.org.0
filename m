Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B271C31CC58
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 15:48:05 +0100 (CET)
Received: from localhost ([::1]:60730 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC1e0-0003Uj-QA
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 09:48:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lC1bv-0002gv-LB
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 09:45:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lC1br-00042a-Ob
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 09:45:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613486749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=1PM0S1JVUEZmCOWspvhKaJWZ2PQT95X8HAj0WMFpJyo=;
 b=crsEGYzm/n0vDlgbWWjJgTfFS5zVSgfS1sZe8jzzVxK8Xb9xnI19xMKR4hOzX96MFmu/Na
 AYRoUVL0a4YgAPfU0LXySPqyyT5JS7oiMrMJ5Ag5bsO2cBsBOyAyq+KkO7ZbzJRx8/xOKg
 KSkgoubcrODy/ZGp3J+5GJjhJP+8G/8=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-1rjCsVAaN5ia7NEE0O1iqA-1; Tue, 16 Feb 2021 09:45:47 -0500
X-MC-Unique: 1rjCsVAaN5ia7NEE0O1iqA-1
Received: by mail-pl1-f197.google.com with SMTP id s5so9265062plg.14
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 06:45:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1PM0S1JVUEZmCOWspvhKaJWZ2PQT95X8HAj0WMFpJyo=;
 b=AK4AbOOWGBkg0G2+2RJavropR+uwxYZADYABpEeVeCvg3mqwdUGwsczRQhvWafAILq
 hA/dEgYimdNLYCsyxPH0e11m9HT4qI3JnxeDUcg/6r8Vj7RMxMawv8mT85D75EWrqTfw
 nqqfR+vBsdOvJFkQp/0l1ECQ8N8QGt1Q2IjmzR4AXA5m2U9oIAuy4EdQREGYfmNky1EU
 J0QbX4m4dnZjW9HwxJyPHmKlqKeeN18osWgog6oFVY1/4HDp9yW81fy9+giu00+N4VVV
 Klv5mtMEHclrVFV1O1G0ghbUI5jXK67/tAxxqEmMEQLj1brOpSR0NAioRmsNMhTjffuj
 dXtg==
X-Gm-Message-State: AOAM533fdT5FZwBIp+ls5tHJC3bixJpI9ZgXr2UtTo2rdWJM+0T9kMBu
 zlFfUz/MJU4Km+H4kaUA+6XKKOywjQqxsCksoZ9r324/phEbnJE7q7a4DSa2v1EqI/WrnbYR7u/
 o2NQl6MdNAwkN0lCtO/m4vjb29osZdY0=
X-Received: by 2002:a05:6a00:8f:b029:1e8:6975:395e with SMTP id
 c15-20020a056a00008fb02901e86975395emr20021336pfj.55.1613486746178; 
 Tue, 16 Feb 2021 06:45:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxS3BWw6cfmbUXcZ13n4kdC+MaqZkUdIQmF/szoO7lCvp8yrGilFVCuHrzietHY4ZzALoItekl6dP5b/4eQ45s=
X-Received: by 2002:a05:6a00:8f:b029:1e8:6975:395e with SMTP id
 c15-20020a056a00008fb02901e86975395emr20021322pfj.55.1613486745874; Tue, 16
 Feb 2021 06:45:45 -0800 (PST)
MIME-Version: 1.0
References: <20210123143128.1167797-1-pbonzini@redhat.com>
 <20210123143128.1167797-32-pbonzini@redhat.com>
 <CAFEAcA8R84_-BPG-suKDvkpE1BxG8o1edGv=zfU_CCw27pK4eg@mail.gmail.com>
 <CABgObfZNy_j3DYt3NKKvC1Ou8TW2zACZ2LffnrR7LU8PeS5hww@mail.gmail.com>
 <CAFEAcA_6RiR+ud5U0Y9K3jNmEoQ-Ex8fZN3-o0MkLxpK8PROgw@mail.gmail.com>
 <378df6af-8383-8a51-4286-54739dba99e4@redhat.com>
 <CAFEAcA9-bOggKPjJiZNc3WXD9Uu-TxzDc7NMvUDGgoM7ERg3hg@mail.gmail.com>
 <1a8f0b62-0adf-9360-2365-e9881a6aef94@redhat.com>
 <CAFEAcA8VCGmqbdLFLQ0R9Uun4MzxLTnOZExmYJZ65qZ_fjDUvg@mail.gmail.com>
 <f61447bf-f556-b626-4a6c-f86e724b0f7f@redhat.com>
 <CAFEAcA9G7CQDPb1QNaajwG5wSdND-E5nkTox1yEocdsBDsfc3g@mail.gmail.com>
 <9f9999eb-66a5-3fe4-64fe-41f64edb49ff@redhat.com>
 <CAFEAcA9c01xj0bGcKai-wOeR_c67+Uvcse1Xn=tbYRE7tjwhSw@mail.gmail.com>
In-Reply-To: <CAFEAcA9c01xj0bGcKai-wOeR_c67+Uvcse1Xn=tbYRE7tjwhSw@mail.gmail.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 16 Feb 2021 15:45:33 +0100
Message-ID: <CABgObfa+0zJdDvJPbX4j2+-cSU=BxVHTd5_U+mnbfYn7ct8qJw@mail.gmail.com>
Subject: Re: [PULL 31/31] qemu-option: warn for short-form boolean options
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000056949005bb752804"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000056949005bb752804
Content-Type: text/plain; charset="UTF-8"

Il mar 16 feb 2021, 15:11 Peter Maydell <peter.maydell@linaro.org> ha
scritto:

> On Tue, 16 Feb 2021 at 13:44, Paolo Bonzini <pbonzini@redhat.com> wrote:
> >
> > On 16/02/21 14:36, Peter Maydell wrote:
> > > Broadly, I think that being able to say 'foo' when foo is a
> > > boolean option being set to true is obvious and nice-to-use
> > > syntax, and I don't really want it to go away. 'nofoo' for
> > > 'foo=false' is much less obvious and I'm happy if we only
> > > support it as a special-case for 'nowait'.
> >
> > It really depends on what the default  "-M pc,nographics" arguably makes
> > sense too (more so than "-M pc,graphics" since true is the default).
>
> Is anybody using 'pc,nographics' ? google didn't find any examples.
>

It's just an example that the prevalence of "nowait" over "wait" is simply
because the default of "server" is false while the default of "wait" is
true. Any boolean option whose default is true could benefit from a
"no"-prefixed short form. But I am pretty sure that there are users in the
wild for noipv4 or noipv6.

> How do you propose to resolve the issues and ambiguities in the grammar?
> >
> > 1) due to QemuOpts not understanding types, you can specify "serial" and
> > get "serial=on" instead
>
> We should fix this by plumbing through the type information,
> so that we only allow 'foo' to mean 'foo=on' if foo is really
> a boolean (or other type that specifies that it has similar behaviour).
>

There's already type information for non-freeform options (those where the
QemuOptsList includes the list of valid suboptions, such as -smp or -m).
Adding it for freeform options (-M, -device) is basically impossible since
the type information comes from a mix of QAPI schema, QOM class
declarations and C code. One would basically have to do an incremental
visit of the schema (assuming there is a schema, and it's not just C code)
during the parsing. This is understandably not something I plan to spend
time on.

I could change QemuOpts to allow short forms for non-freeform option
groups, and turn -chardev into a non-freeform option. That would solve the
immediate issue with chardev. But I agree that consistent behavior is
better, so I don't think this is a good idea either.

> 2) with a parser that understands other types than strings, you would
> > not be able to specify "-M kernel-irqchip" because it would be converted
> > to the boolean "true" and not the enum "'on'"
>
> We should decide whether 'kernel-irqchip' has a type that
> allows 'no parameter specified' => 'use this default value'
> or not, and if we go for the latter use whatever default value
> the backend expects.


I don't understand, the point of short-form options is to use a
*non-default* value. (In other words, the affirmative short form would
typically be used to specify true when the default is false).

(And probably "boolean-and-an-extra-value"
> types should allow the boolean bit to be specified in all the
> same ways that a plain-old-boolean is.)


> > 3) one is not be able to specify "-M pc" -M usb" because the second
> > kernel-irqchip would be interpreted as a machine type?
>
> I don't understand this one, I'm afraid.
>

I mean that "-M pc -M usb" is parsed as "-machine type=pc -machine
type=usb" and then merged into "-machine type=usb". The user would expect
"-machine type=c -machine usb=on" since "-M pc -M usb=on" works. So
"usb=on" cannot always be shortened to "usb", which is surprising. I think
this one only affects -M though.

Paolo


> -- PMM
>
>

--00000000000056949005bb752804
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">Il mar 16 feb 2021, 15:11 Peter Maydell &lt;<a href=3D"mailto:=
peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; ha scritto:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-le=
ft:1px #ccc solid;padding-left:1ex">On Tue, 16 Feb 2021 at 13:44, Paolo Bon=
zini &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank" rel=3D"no=
referrer">pbonzini@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 16/02/21 14:36, Peter Maydell wrote:<br>
&gt; &gt; Broadly, I think that being able to say &#39;foo&#39; when foo is=
 a<br>
&gt; &gt; boolean option being set to true is obvious and nice-to-use<br>
&gt; &gt; syntax, and I don&#39;t really want it to go away. &#39;nofoo&#39=
; for<br>
&gt; &gt; &#39;foo=3Dfalse&#39; is much less obvious and I&#39;m happy if w=
e only<br>
&gt; &gt; support it as a special-case for &#39;nowait&#39;.<br>
&gt;<br>
&gt; It really depends on what the default=C2=A0 &quot;-M pc,nographics&quo=
t; arguably makes<br>
&gt; sense too (more so than &quot;-M pc,graphics&quot; since true is the d=
efault).<br>
<br>
Is anybody using &#39;pc,nographics&#39; ? google didn&#39;t find any examp=
les.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"au=
to">It&#39;s just an example that the prevalence of &quot;nowait&quot; over=
 &quot;wait&quot; is simply because the default of &quot;server&quot; is fa=
lse while the default of &quot;wait&quot; is true. Any boolean option whose=
 default is true could benefit from a &quot;no&quot;-prefixed short form. B=
ut I am pretty sure that there are users in the wild for noipv4 or noipv6.<=
/div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quot=
e"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex">&gt; How do you propose to resolve the is=
sues and ambiguities in the grammar?<br>
&gt;<br>
&gt; 1) due to QemuOpts not understanding types, you can specify &quot;seri=
al&quot; and<br>
&gt; get &quot;serial=3Don&quot; instead<br>
<br>
We should fix this by plumbing through the type information,<br>
so that we only allow &#39;foo&#39; to mean &#39;foo=3Don&#39; if foo is re=
ally<br>
a boolean (or other type that specifies that it has similar behaviour).<br>=
</blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">Ther=
e&#39;s already type information for non-freeform options (those where the =
QemuOptsList includes the list of valid suboptions, such as -smp or -m). Ad=
ding it for freeform options (-M, -device) is basically impossible since th=
e type information comes from a mix of QAPI schema, QOM class declarations =
and C code. One would basically have to do an incremental visit of the sche=
ma (assuming there is a schema, and it&#39;s not just C code) during the pa=
rsing. This is understandably not something I plan to spend time on.</div><=
div dir=3D"auto"><br></div><div dir=3D"auto">I could change QemuOpts to all=
ow short forms for non-freeform option groups, and turn -chardev into a non=
-freeform option. That would solve the immediate issue with chardev. But I =
agree that consistent behavior is better, so I don&#39;t think this is a go=
od idea either.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div cla=
ss=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex">&gt; 2) with a parser tha=
t understands other types than strings, you would<br>
&gt; not be able to specify &quot;-M kernel-irqchip&quot; because it would =
be converted<br>
&gt; to the boolean &quot;true&quot; and not the enum &quot;&#39;on&#39;&qu=
ot;<br>
<br>
We should decide whether &#39;kernel-irqchip&#39; has a type that<br>
allows &#39;no parameter specified&#39; =3D&gt; &#39;use this default value=
&#39;<br>
or not, and if we go for the latter use whatever default value<br>
the backend expects.</blockquote></div></div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto">I don&#39;t understand, the point of short-form options is =
to use a *non-default* value. (In other words, the affirmative short form w=
ould typically be used to specify true when the default is false).</div><di=
v dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">(And probably &quot;boolean-and-an-extra-value&qu=
ot;<br>
types should allow the boolean bit to be specified in all the<br>
same ways that a plain-old-boolean is.)</blockquote></div></div><div dir=3D=
"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
&gt; 3) one is not be able to specify &quot;-M pc&quot; -M usb&quot; becaus=
e the second<br>
&gt; kernel-irqchip would be interpreted as a machine type?<br>
<br>
I don&#39;t understand this one, I&#39;m afraid.<br></blockquote></div></di=
v><div dir=3D"auto"><br></div><div dir=3D"auto">I mean that &quot;-M pc -M =
usb&quot; is parsed as &quot;-machine type=3Dpc -machine type=3Dusb&quot; a=
nd then merged into &quot;-machine type=3Dusb&quot;. The user would expect =
&quot;-machine type=3Dc -machine usb=3Don&quot; since &quot;-M pc -M usb=3D=
on&quot; works. So &quot;usb=3Don&quot; cannot always be shortened to &quot=
;usb&quot;, which is surprising. I think this one only affects -M though.</=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div><div dir=3D"au=
to"><br></div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">
<br>
-- PMM<br>
<br>
</blockquote></div></div></div>

--00000000000056949005bb752804--


