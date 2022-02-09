Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F380E4AF7F7
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Feb 2022 18:21:36 +0100 (CET)
Received: from localhost ([::1]:39484 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHqer-0006l5-WA
	for lists+qemu-devel@lfdr.de; Wed, 09 Feb 2022 12:21:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nHqEV-0001B5-7b
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 11:54:20 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:41195)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1nHqET-0002j3-4h
 for qemu-devel@nongnu.org; Wed, 09 Feb 2022 11:54:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644425645;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RQjpnHFBXFtW0wlQHFBtBaD/xryHNa0T0Z0C+Ngbl0U=;
 b=cmNeayRkqJAypUicfIURjhyo96rzu+KD1xIzkaLNkQEfYe/6sSeGXNF9J3SMAehA2zzc6/
 x5AJnQ2Stb1L54EajykAJM35pzgD5NL3BcLip92VZIhP83zLizL+L3rpETzlow4kLuMix5
 oU4l8BFwEYdFA6zc6tqViIci7iCoUbQ=
Received: from mail-vs1-f70.google.com (mail-vs1-f70.google.com
 [209.85.217.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-318-QWoXFsEPNWKOlemtaBiZ1A-1; Wed, 09 Feb 2022 11:54:02 -0500
X-MC-Unique: QWoXFsEPNWKOlemtaBiZ1A-1
Received: by mail-vs1-f70.google.com with SMTP id
 h20-20020a056102215400b0031a81e69805so251257vsg.12
 for <qemu-devel@nongnu.org>; Wed, 09 Feb 2022 08:54:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RQjpnHFBXFtW0wlQHFBtBaD/xryHNa0T0Z0C+Ngbl0U=;
 b=qLtHZxZBxRKs4oUbXTYFCSRGK8h7jTXFdEMUZg2chlWpDkPpYm51dpiOzlNHMLCHeK
 n7JdsFQ1W36+n0saKkQFOvAimFKYorwHZ+12SMwVtKALPWu045LNCeN3ajrg5FUJ5FT0
 gjsnMIFr/eC2LTxZ4QjQnY1DZOyBHucjDRrPfGwACa8v769pN+DZKX0D+tXKZfOJ1WNo
 DqOXiS/1isana8WZvDhpRePV/gdk6WPwxiL6afmCC6p6H7wtblDJaL860TgTgPkPXNDV
 192tyro5KfiqH5+3N49kVn7BEeiAIcWX9HDeuuB3GFw7P27Y8FHJorRtZpEKeKHF/0gT
 cIOQ==
X-Gm-Message-State: AOAM530xilsVBKC840hUVy5aiQ7m/lTbDyqnCBmXwtwY3YLsecgvjFNs
 IoKuVeRrrNLosqrR8XnRt4ggipnYmJCwshX+XWx5jE4odCbXC+nEbp9zZKh7K8xPBeBRkcs9mga
 +BZUb9BFsqK3L/l/1ON36MwZzo68DC+c=
X-Received: by 2002:a05:6122:d07:: with SMTP id
 az7mr1100765vkb.35.1644425641623; 
 Wed, 09 Feb 2022 08:54:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJybnmcl3F4+mvAVMy2D0g02sFZn8y9Xo8es0XHeKy2K1fXwjeg4vrzJT/ORm8Lcsqf8n9Oq0ImJNJQNQNWtQg8=
X-Received: by 2002:a05:6122:d07:: with SMTP id
 az7mr1100761vkb.35.1644425641420; 
 Wed, 09 Feb 2022 08:54:01 -0800 (PST)
MIME-Version: 1.0
References: <20220207213039.2278569-1-jsnow@redhat.com>
 <CAFEAcA8Diwoioh6U95Q_c8y+cjsuVRv-VvW89Ngp9a2k47UuiQ@mail.gmail.com>
In-Reply-To: <CAFEAcA8Diwoioh6U95Q_c8y+cjsuVRv-VvW89Ngp9a2k47UuiQ@mail.gmail.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 9 Feb 2022 11:53:51 -0500
Message-ID: <CAFn=p-Zzwyg2Rb_Dj24BHGGiUOPtZTY1-4PQ8DerZxW14=PUwQ@mail.gmail.com>
Subject: Re: [PATCH] Python: discourage direct setup.py install
To: Peter Maydell <peter.maydell@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000037eb7b05d798ae43"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000037eb7b05d798ae43
Content-Type: text/plain; charset="UTF-8"

On Wed, Feb 9, 2022, 8:35 AM Peter Maydell <peter.maydell@linaro.org> wrote:

> On Mon, 7 Feb 2022 at 21:34, John Snow <jsnow@redhat.com> wrote:
> >
> > When invoking setup.py directly, the default behavior for 'install' is
> > to run the bdist_egg installation hook, which is ... actually deprecated
> > by setuptools. It doesn't seem to work quite right anymore.
> >
> > By contrast, 'pip install' will invoke the bdist_wheel hook
> > instead. This leads to differences in behavior for the two approaches. I
> > advocate using pip in the documentation in this directory, but the
> > 'setup.py' which has been used for quite a long time in the Python world
> > may deceptively appear to work at first glance.
> >
> > Add an error message that will save a bit of time and frustration
> > that points the user towards using the supported installation
> > invocation.
>
> While we're on the topic of python installation, is there any way
> to suppress or otherwise deal with the warning Meson prints out?
>
> WARNING: Broken python installation detected. Python files installed
> by Meson might not be found by python interpreter.
>
> (I vaguely recall tracking down a meson bug, and this seems to be
> some issue the meson developers have with the way Ubuntu/Debian
> have done their python packaging. But I forget the details.)
>
> thanks
> -- PMM
>

Unknown, I don't think I see this message on Fedora. Are you seeing it from
Debian? I'll see if it shows up in any of the VM build tests.

>

--00000000000037eb7b05d798ae43
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Wed, Feb 9, 2022, 8:35 AM Peter Maydell &lt;<a href=
=3D"mailto:peter.maydell@linaro.org">peter.maydell@linaro.org</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bor=
der-left:1px #ccc solid;padding-left:1ex">On Mon, 7 Feb 2022 at 21:34, John=
 Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank" rel=3D"nore=
ferrer">jsnow@redhat.com</a>&gt; wrote:<br>
&gt;<br>
&gt; When invoking setup.py directly, the default behavior for &#39;install=
&#39; is<br>
&gt; to run the bdist_egg installation hook, which is ... actually deprecat=
ed<br>
&gt; by setuptools. It doesn&#39;t seem to work quite right anymore.<br>
&gt;<br>
&gt; By contrast, &#39;pip install&#39; will invoke the bdist_wheel hook<br=
>
&gt; instead. This leads to differences in behavior for the two approaches.=
 I<br>
&gt; advocate using pip in the documentation in this directory, but the<br>
&gt; &#39;setup.py&#39; which has been used for quite a long time in the Py=
thon world<br>
&gt; may deceptively appear to work at first glance.<br>
&gt;<br>
&gt; Add an error message that will save a bit of time and frustration<br>
&gt; that points the user towards using the supported installation<br>
&gt; invocation.<br>
<br>
While we&#39;re on the topic of python installation, is there any way<br>
to suppress or otherwise deal with the warning Meson prints out?<br>
<br>
WARNING: Broken python installation detected. Python files installed<br>
by Meson might not be found by python interpreter.<br>
<br>
(I vaguely recall tracking down a meson bug, and this seems to be<br>
some issue the meson developers have with the way Ubuntu/Debian<br>
have done their python packaging. But I forget the details.)<br>
<br>
thanks<br>
-- PMM<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Unknown, I don&#39;t think I see this message on Fedora. Are you seei=
ng it from Debian? I&#39;ll see if it shows up in any of the VM build tests=
.</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gm=
ail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-le=
ft:1ex"></blockquote></div></div></div>

--00000000000037eb7b05d798ae43--


