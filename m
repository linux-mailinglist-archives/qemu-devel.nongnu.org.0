Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E383A3A0812
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Jun 2021 01:56:35 +0200 (CEST)
Received: from localhost ([::1]:60270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqlaF-0003hg-16
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 19:56:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lqlZL-0002tT-0A
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 19:55:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21104)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lqlZF-0004BO-L9
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 19:55:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623196531;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=//NQZd4qrXW1T55TH8lQFj6a+hKQCPq/RN+AnIi9cew=;
 b=T1rVqzT2bMcZWkYORY7q5FiW7hmIjoYYW/s8EOl8IjolXbMsZvkq3/5Ix28Pb1Wvqq5GPQ
 +cWOwsBQ0oWOOB1LH9T4ISpY+ok+e4ULLF1gzf56HusoyPlrk0OlmsLvdtip6h5eHnzpSC
 HcQqK8Gt6ToBS/2v/2f+ytbYZZs2Gck=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-252-KNEbN-IRMHS8uVqkhn_JHw-1; Tue, 08 Jun 2021 19:55:29 -0400
X-MC-Unique: KNEbN-IRMHS8uVqkhn_JHw-1
Received: by mail-ej1-f70.google.com with SMTP id
 jy19-20020a1709077633b02903eb7acdb38cso7337809ejc.14
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 16:55:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=//NQZd4qrXW1T55TH8lQFj6a+hKQCPq/RN+AnIi9cew=;
 b=MaGwho22Nhp0L2h4zbHZK4ZYVw9PJijJWW/OGukH44hSJXydmrEWxsoCk0Z1BHUeFY
 NJEwQJJyfDqUj4cCnXxk3PfnnliDFh7OwE1IfXH/zWUCY3eEVagAouNYVolrCW3NUlMa
 o9vSr6KmxyXlfw8rx5GNaxjTrqu2NOFv7gXrrunm+Z778npPF2jWwvPRnESANeVZqdQs
 1HOMoTangf71KOTkK1WXyjttgB4nZvqcXyEthHYzb5Hh4myL/XCZEAHjLdiNjiknIwZR
 vqhNE1FbEfd0J3I3WLd4A/YpKL2m/WSZPA8tWZ9OY9M965t1TSDz4szbV7pUSwaFZnzk
 IJFw==
X-Gm-Message-State: AOAM533VnZKaARMl+gj4oFuc+b9dIubp3ECsmAqnjq8hk/wcLR/fp2R9
 wT3FEx9vWxVh7BR+4kO5R2vdN9hMXvkg0Pul04mzsuVZJj6MwBgawMl5mOpSjCAJIGYfM3+TsuE
 E8CiNdYzh5pc2rIOKGOh7GbPQzq5d65k=
X-Received: by 2002:a05:6402:1713:: with SMTP id
 y19mr28103577edu.346.1623196528607; 
 Tue, 08 Jun 2021 16:55:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxeO+Bj9Pcd8IHQqjei5OEnokLX63w0Df8uS5PDYJqoURZZFryflmEUdCXoOiPqF9g4Q3urCrQnOuaBL0c6emA=
X-Received: by 2002:a05:6402:1713:: with SMTP id
 y19mr28103544edu.346.1623196528336; 
 Tue, 08 Jun 2021 16:55:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210608140938.863580-1-crosa@redhat.com>
 <20210608140938.863580-3-crosa@redhat.com>
 <f2c7ab9f-27b4-aa04-75f5-fcb8a36a4668@redhat.com>
In-Reply-To: <f2c7ab9f-27b4-aa04-75f5-fcb8a36a4668@redhat.com>
From: Cleber Rosa Junior <crosa@redhat.com>
Date: Tue, 8 Jun 2021 19:55:17 -0400
Message-ID: <CA+bd_6J-eA_VXyJZHEe3WiS2Cged+C=Ugs5YOGv4k01aczRAZw@mail.gmail.com>
Subject: Re: [PATCH 2/4] Python QEMU utils: introduce a generic feature list
To: Wainer dos Santos Moschetta <wainersm@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000078f20505c449e424"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=crosa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-block@nongnu.org, Erik Skultety <eskultet@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>, Willian Rampazzo <willianr@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Willian Rampazzo <wrampazz@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>, Andrea Bolognani <abologna@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 John Snow <jsnow@redhat.com>, Beraldo Leal <bleal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000078f20505c449e424
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 8, 2021 at 5:42 PM Wainer dos Santos Moschetta <
wainersm@redhat.com> wrote:

> Hi,
>
> On 6/8/21 11:09 AM, Cleber Rosa wrote:
> > Which can be used to check for any "feature" that is available as a
> > QEMU command line option, and that will return its list of available
> > options.
> >
> > This is a generalization of the list_accel() utility function, which
> > is itself re-implemented in terms of the more generic feature.
> >
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > ---
> >   python/qemu/utils/__init__.py |  2 ++
> >   python/qemu/utils/accel.py    | 15 ++----------
> >   python/qemu/utils/feature.py  | 44 +++++++++++++++++++++++++++++++++++
> >   3 files changed, 48 insertions(+), 13 deletions(-)
> >   create mode 100644 python/qemu/utils/feature.py
> >
> > diff --git a/python/qemu/utils/__init__.py
> b/python/qemu/utils/__init__.py
> > index 7f1a5138c4..1d0789eaa2 100644
> > --- a/python/qemu/utils/__init__.py
> > +++ b/python/qemu/utils/__init__.py
> > @@ -20,12 +20,14 @@
> >
> >   # pylint: disable=import-error
> >   from .accel import kvm_available, list_accel, tcg_available
> > +from .feature import list_feature
> >
> >
> >   __all__ = (
> >       'get_info_usernet_hostfwd_port',
> >       'kvm_available',
> >       'list_accel',
> > +    'list_feature',
> >       'tcg_available',
> >   )
> >
> > diff --git a/python/qemu/utils/accel.py b/python/qemu/utils/accel.py
> > index 297933df2a..b5bb80c6d3 100644
> > --- a/python/qemu/utils/accel.py
> > +++ b/python/qemu/utils/accel.py
> > @@ -14,13 +14,11 @@
> >   # the COPYING file in the top-level directory.
> >   #
> >
> > -import logging
> >   import os
> > -import subprocess
> >   from typing import List, Optional
> >
> > +from qemu.utils.feature import list_feature
> >
> > -LOG = logging.getLogger(__name__)
> >
> >   # Mapping host architecture to any additional architectures it can
> >   # support which often includes its 32 bit cousin.
> > @@ -39,16 +37,7 @@ def list_accel(qemu_bin: str) -> List[str]:
> >       @raise Exception: if failed to run `qemu -accel help`
> >       @return a list of accelerator names.
> >       """
> > -    if not qemu_bin:
> > -        return []
> > -    try:
> > -        out = subprocess.check_output([qemu_bin, '-accel', 'help'],
> > -                                      universal_newlines=True)
> > -    except:
> > -        LOG.debug("Failed to get the list of accelerators in %s",
> qemu_bin)
> > -        raise
> > -    # Skip the first line which is the header.
> > -    return [acc.strip() for acc in out.splitlines()[1:]]
> > +    return list_feature(qemu_bin, 'accel')
> >
> >
> >   def kvm_available(target_arch: Optional[str] = None,
> > diff --git a/python/qemu/utils/feature.py b/python/qemu/utils/feature.py
> > new file mode 100644
> > index 0000000000..b4a5f929ab
> > --- /dev/null
> > +++ b/python/qemu/utils/feature.py
> > @@ -0,0 +1,44 @@
> > +"""
> > +QEMU feature module:
> > +
> > +This module provides a utility for discovering the availability of
> > +generic features.
> > +"""
> > +# Copyright (C) 2022 Red Hat Inc.
> Cleber, please, tell me how is the future like! :)
>

I grabbed a sports almanac.  That's all I can say. :)

Now seriously, thanks for spotting the typo.


> > +#
> > +# Authors:
> > +#  Cleber Rosa <crosa@redhat.com>
> > +#
> > +# This work is licensed under the terms of the GNU GPL, version 2.  See
> > +# the COPYING file in the top-level directory.
> > +#
> > +
> > +import logging
> > +import subprocess
> > +from typing import List
> > +
> > +
> > +LOG = logging.getLogger(__name__)
> > +
> > +
> > +def list_feature(qemu_bin: str, feature: str) -> List[str]:
> > +    """
> > +    List available options the QEMU binary for a given feature type.
> > +
> > +    By calling a "qemu $feature -help" and parsing its output.
>
> I understand we need a mean to easily cancel the test if given feature
> is not present. However, I'm unsure this generic list_feature() is what
> we need.
>
> The `-accel help` returns a simple list of strings (besides the header,
> which is dismissed). Whereas `-machine help` returns what could be
> parsed as a tuple of (name, description).
>
> Another example is `-cpu help` which will print a similar list as
> `-machine`, plus a section with CPUID flags.
>
>
I made sure it worked with both "accel" and "machine", but you're right
about many other "-$feature help" that won't conform to the mapping
("-chardev help" is probably the only other one that should work).  What I
thought about was to keep the same list_feature(), but make its parsing of
items flexible.  Then it could be reused for other list_$feature() like
methods.  At the same time, it could be an opportunity to standardize a bit
more of the "help" outputs.

For instance, I think it would make sense for "cpu" to keep showing the
amount of information it shows, but:

1) The first item could be the name of the relevant "option" (the cpu
model) for that feature (cpu), instead of, say, "x86". Basically reversing
the order of first and second, or first and third fields.
2) Everything *after* an empty line would be extra information, not
necessarily an option available for that feature.

But, this is most probably not going to be achieved in the short term.

What I can do here, is to hide list_feature(), say call it _list_feature()
so that we don't duplicate code, and expose a list_machine().

Let me know what you think.

Thanks,
- Cleber.


> If confess I still don't have a better idea, although I feel it will
> require a OO design.
>
> Thanks!
>
> - Wainer
>
> > +
> > +    @param qemu_bin (str): path to the QEMU binary.
> > +    @param feature (str): feature name, matching the command line
> option.
> > +    @raise Exception: if failed to run `qemu -feature help`
> > +    @return a list of available options for the given feature.
> > +    """
> > +    if not qemu_bin:
> > +        return []
> > +    try:
> > +        out = subprocess.check_output([qemu_bin, '-%s' % feature,
> 'help'],
> > +                                      universal_newlines=True)
> > +    except:
> > +        LOG.debug("Failed to get the list of %s(s) in %s", feature,
> qemu_bin)
> > +        raise
> > +    # Skip the first line which is the header.
> > +    return [item.split(' ', 1)[0] for item in out.splitlines()[1:]]
>
>

--00000000000078f20505c449e424
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 8, 2021 at 5:42 PM Wainer=
 dos Santos Moschetta &lt;<a href=3D"mailto:wainersm@redhat.com">wainersm@r=
edhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hi,<br>
<br>
On 6/8/21 11:09 AM, Cleber Rosa wrote:<br>
&gt; Which can be used to check for any &quot;feature&quot; that is availab=
le as a<br>
&gt; QEMU command line option, and that will return its list of available<b=
r>
&gt; options.<br>
&gt;<br>
&gt; This is a generalization of the list_accel() utility function, which<b=
r>
&gt; is itself re-implemented in terms of the more generic feature.<br>
&gt;<br>
&gt; Signed-off-by: Cleber Rosa &lt;<a href=3D"mailto:crosa@redhat.com" tar=
get=3D"_blank">crosa@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0python/qemu/utils/__init__.py |=C2=A0 2 ++<br>
&gt;=C2=A0 =C2=A0python/qemu/utils/accel.py=C2=A0 =C2=A0 | 15 ++----------<=
br>
&gt;=C2=A0 =C2=A0python/qemu/utils/feature.py=C2=A0 | 44 ++++++++++++++++++=
+++++++++++++++++<br>
&gt;=C2=A0 =C2=A03 files changed, 48 insertions(+), 13 deletions(-)<br>
&gt;=C2=A0 =C2=A0create mode 100644 python/qemu/utils/feature.py<br>
&gt;<br>
&gt; diff --git a/python/qemu/utils/__init__.py b/python/qemu/utils/__init_=
_.py<br>
&gt; index 7f1a5138c4..1d0789eaa2 100644<br>
&gt; --- a/python/qemu/utils/__init__.py<br>
&gt; +++ b/python/qemu/utils/__init__.py<br>
&gt; @@ -20,12 +20,14 @@<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# pylint: disable=3Dimport-error<br>
&gt;=C2=A0 =C2=A0from .accel import kvm_available, list_accel, tcg_availabl=
e<br>
&gt; +from .feature import list_feature<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0__all__ =3D (<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;get_info_usernet_hostfwd_port&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;kvm_available&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;list_accel&#39;,<br>
&gt; +=C2=A0 =C2=A0 &#39;list_feature&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;tcg_available&#39;,<br>
&gt;=C2=A0 =C2=A0)<br>
&gt;=C2=A0 =C2=A0<br>
&gt; diff --git a/python/qemu/utils/accel.py b/python/qemu/utils/accel.py<b=
r>
&gt; index 297933df2a..b5bb80c6d3 100644<br>
&gt; --- a/python/qemu/utils/accel.py<br>
&gt; +++ b/python/qemu/utils/accel.py<br>
&gt; @@ -14,13 +14,11 @@<br>
&gt;=C2=A0 =C2=A0# the COPYING file in the top-level directory.<br>
&gt;=C2=A0 =C2=A0#<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -import logging<br>
&gt;=C2=A0 =C2=A0import os<br>
&gt; -import subprocess<br>
&gt;=C2=A0 =C2=A0from typing import List, Optional<br>
&gt;=C2=A0 =C2=A0<br>
&gt; +from qemu.utils.feature import list_feature<br>
&gt;=C2=A0 =C2=A0<br>
&gt; -LOG =3D logging.getLogger(__name__)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0# Mapping host architecture to any additional architecture=
s it can<br>
&gt;=C2=A0 =C2=A0# support which often includes its 32 bit cousin.<br>
&gt; @@ -39,16 +37,7 @@ def list_accel(qemu_bin: str) -&gt; List[str]:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@raise Exception: if failed to run `qemu -ac=
cel help`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0@return a list of accelerator names.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;&quot;&quot;<br>
&gt; -=C2=A0 =C2=A0 if not qemu_bin:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 return []<br>
&gt; -=C2=A0 =C2=A0 try:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 out =3D subprocess.check_output([qemu_bin=
, &#39;-accel&#39;, &#39;help&#39;],<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 universal_n=
ewlines=3DTrue)<br>
&gt; -=C2=A0 =C2=A0 except:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 LOG.debug(&quot;Failed to get the list of=
 accelerators in %s&quot;, qemu_bin)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise<br>
&gt; -=C2=A0 =C2=A0 # Skip the first line which is the header.<br>
&gt; -=C2=A0 =C2=A0 return [acc.strip() for acc in out.splitlines()[1:]]<br=
>
&gt; +=C2=A0 =C2=A0 return list_feature(qemu_bin, &#39;accel&#39;)<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0def kvm_available(target_arch: Optional[str] =3D None,<br>
&gt; diff --git a/python/qemu/utils/feature.py b/python/qemu/utils/feature.=
py<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..b4a5f929ab<br>
&gt; --- /dev/null<br>
&gt; +++ b/python/qemu/utils/feature.py<br>
&gt; @@ -0,0 +1,44 @@<br>
&gt; +&quot;&quot;&quot;<br>
&gt; +QEMU feature module:<br>
&gt; +<br>
&gt; +This module provides a utility for discovering the availability of<br=
>
&gt; +generic features.<br>
&gt; +&quot;&quot;&quot;<br>
&gt; +# Copyright (C) 2022 Red Hat Inc.<br>
Cleber, please, tell me how is the future like! :)<br></blockquote><div><br=
></div><div>I grabbed a sports almanac.=C2=A0 That&#39;s all I can say. :)<=
/div><div><br></div><div>Now seriously, thanks for spotting the typo.</div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; +#<br>
&gt; +# Authors:<br>
&gt; +#=C2=A0 Cleber Rosa &lt;<a href=3D"mailto:crosa@redhat.com" target=3D=
"_blank">crosa@redhat.com</a>&gt;<br>
&gt; +#<br>
&gt; +# This work is licensed under the terms of the GNU GPL, version 2.=C2=
=A0 See<br>
&gt; +# the COPYING file in the top-level directory.<br>
&gt; +#<br>
&gt; +<br>
&gt; +import logging<br>
&gt; +import subprocess<br>
&gt; +from typing import List<br>
&gt; +<br>
&gt; +<br>
&gt; +LOG =3D logging.getLogger(__name__)<br>
&gt; +<br>
&gt; +<br>
&gt; +def list_feature(qemu_bin: str, feature: str) -&gt; List[str]:<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 List available options the QEMU binary for a given feat=
ure type.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 By calling a &quot;qemu $feature -help&quot; and parsin=
g its output.<br>
<br>
I understand we need a mean to easily cancel the test if given feature <br>
is not present. However, I&#39;m unsure this generic list_feature() is what=
 <br>
we need.<br>
<br>
The `-accel help` returns a simple list of strings (besides the header, <br=
>
which is dismissed). Whereas `-machine help` returns what could be <br>
parsed as a tuple of (name, description).<br>
<br>
Another example is `-cpu help` which will print a similar list as <br>
`-machine`, plus a section with CPUID flags.<br>
<br></blockquote><div><br></div><div>I made sure it worked with both &quot;=
accel&quot; and &quot;machine&quot;, but you&#39;re right about many other =
&quot;-$feature help&quot; that won&#39;t conform to the mapping (&quot;-ch=
ardev help&quot; is probably the only other one that should work).=C2=A0 Wh=
at I thought about was to keep the same list_feature(), but make its parsin=
g of items flexible.=C2=A0 Then it could be reused for other list_$feature(=
) like methods.=C2=A0 At the same time, it could be an opportunity to stand=
ardize a bit more of the &quot;help&quot; outputs.</div><div><br></div><div=
>For instance, I think it would make sense for &quot;cpu&quot; to keep show=
ing the amount of information it shows, but:</div><div><br></div><div>1) Th=
e first item could be the name of the relevant &quot;option&quot; (the cpu =
model) for that feature (cpu), instead of, say, &quot;x86&quot;. Basically =
reversing the order of first and second, or first and third fields.</div><d=
iv>2) Everything *after* an empty line would be extra information, not nece=
ssarily an option available for that feature.</div><div><br></div><div>But,=
 this is most probably not going to be achieved in the short term.</div><di=
v><br></div><div>What I can do here, is to hide list_feature(), say call it=
 _list_feature() so that we don&#39;t duplicate code, and expose a list_mac=
hine().</div><div><br></div><div>Let me know what you think.</div><div><br>=
</div><div>Thanks,</div><div>- Cleber.</div><div>=C2=A0</div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">
If confess I still don&#39;t have a better idea, although I feel it will <b=
r>
require a OO design.<br>
<br>
Thanks!<br>
<br>
- Wainer<br>
<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 @param qemu_bin (str): path to the QEMU binary.<br>
&gt; +=C2=A0 =C2=A0 @param feature (str): feature name, matching the comman=
d line option.<br>
&gt; +=C2=A0 =C2=A0 @raise Exception: if failed to run `qemu -feature help`=
<br>
&gt; +=C2=A0 =C2=A0 @return a list of available options for the given featu=
re.<br>
&gt; +=C2=A0 =C2=A0 &quot;&quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 if not qemu_bin:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return []<br>
&gt; +=C2=A0 =C2=A0 try:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 out =3D subprocess.check_output([qemu_bin=
, &#39;-%s&#39; % feature, &#39;help&#39;],<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 universal_n=
ewlines=3DTrue)<br>
&gt; +=C2=A0 =C2=A0 except:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 LOG.debug(&quot;Failed to get the list of=
 %s(s) in %s&quot;, feature, qemu_bin)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 raise<br>
&gt; +=C2=A0 =C2=A0 # Skip the first line which is the header.<br>
&gt; +=C2=A0 =C2=A0 return [item.split(&#39; &#39;, 1)[0] for item in out.s=
plitlines()[1:]]<br>
<br>
</blockquote></div></div>

--00000000000078f20505c449e424--


