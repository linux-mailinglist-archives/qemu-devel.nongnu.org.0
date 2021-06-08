Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F75B39F7ED
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 15:38:06 +0200 (CEST)
Received: from localhost ([::1]:48090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqbvg-0002Iy-GM
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 09:38:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lqbuc-0001Sq-F7
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 09:36:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24161)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <crosa@redhat.com>) id 1lqbuZ-0006Ks-DM
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 09:36:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623159414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HdAhJfaJyTMgITmmhXtvcltY8dnDS6eECWpJf+fBY3U=;
 b=GGeIwPOjY1EdFMe7uwU5e6ZrrQbX2xfmO+scN9RUTMoRPMlcTYh7sjnsuSiJVIZ5/PE+ha
 QZVqZPO3L+QUITqUVwlVVEIpsbTDLGKF0GLR04Rgux70HCAy1HX8lg0AUbYcyQjRmeTVhK
 Jvr7+S29geyEIenZNFjeMb7riHB+2qA=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-392-PCEiYfuzODqUDu7i-MvpZg-1; Tue, 08 Jun 2021 09:36:50 -0400
X-MC-Unique: PCEiYfuzODqUDu7i-MvpZg-1
Received: by mail-lj1-f200.google.com with SMTP id
 f22-20020a2e38160000b0290130cf22822aso7949329lja.16
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 06:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=HdAhJfaJyTMgITmmhXtvcltY8dnDS6eECWpJf+fBY3U=;
 b=mlTv1N+PLhGzHVqGyuGFkoQWJlmCDlM0WyuS3wuMDV04Or0L08cKLIe28Mj/+mDNUx
 Nl7N4gflYIwcH78s0RYidarvMU1EyOmJHQrFuYYGQXoiod5va84sfE+NdBLlgtJIJpjG
 ilkFZKHOrI4vkcOU2S2hwk2RLvQP4XbwfkXjpJRWnwCjITUcz0MVkeLc0x6v8lbp1xA1
 PsMopziJ6jUtC2l14PRMqVQnk+HndRDLIw03ZWoLYO5YcXg/OrMdEucWp7YU8TOfcrV+
 hUkE8YLeY+W2batDGUyWTgHME4flHxpuJpIUDDFdTg35+8gr6Yhpbms/yzwCFLo/4aY2
 gYjw==
X-Gm-Message-State: AOAM531wFTAvyR+R45rrNpJoETwjhq5T8b6Oe4zW4Bld3vJnvwEqdxHW
 Mp1OmZufYKKfSYZc9KAvp/0TjXx+u+0i/mTFv2YZ1JWzMv8Cnpv0pE09Ewv06scYcU0vRUHoQ2s
 CXR77f/HuBnS3brAGRbOlhuzxp99FB30=
X-Received: by 2002:a05:6512:3a84:: with SMTP id
 q4mr8916964lfu.626.1623159408693; 
 Tue, 08 Jun 2021 06:36:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMr+GUMXf64X4XXN0vD02Fh+P/hamiCAO53goL2nIeABikHQ4iu/2o/cybIBwCdNianeAVmNujhan+M6Y06LU=
X-Received: by 2002:a05:6512:3a84:: with SMTP id
 q4mr8916940lfu.626.1623159408414; 
 Tue, 08 Jun 2021 06:36:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210608031425.833536-1-crosa@redhat.com>
 <20210608031425.833536-5-crosa@redhat.com>
 <9770910a-f586-0b79-395c-7154c4693690@amsat.org>
In-Reply-To: <9770910a-f586-0b79-395c-7154c4693690@amsat.org>
From: Cleber Rosa Junior <crosa@redhat.com>
Date: Tue, 8 Jun 2021 09:36:37 -0400
Message-ID: <CA+bd_6+-je9t3DzegS0uiyC9fCYF++sMXkRJhAz1Dxe2zz-v1A@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] Jobs based on custom runners: add job definitions
 for QEMU's machines
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=crosa@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f3ebd905c4413fca"
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>, "Daniel P . Berrange" <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Erik Skultety <eskultet@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Andrea Bolognani <abologna@redhat.com>, Willian Rampazzo <willianr@redhat.com>,
 Willian Rampazzo <wrampazz@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f3ebd905c4413fca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 8, 2021 at 2:30 AM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
wrote:

> Hi Alex, Stefan,
>
> On 6/8/21 5:14 AM, Cleber Rosa wrote:
> > The QEMU project has two machines (aarch64 and s390x) that can be used
> > for jobs that do build and run tests.
>
> AFAIK there is more hardware available to the project, so I'm wondering
> what happened to the rest, is it a deliberate choice to start small?
>

Hi Phil,

Yes, this series was deliberately focused on the first two machines owned
and available to QEMU.


> What will happen with the rest, since we are wasting resources?
>

The plan is to allow all machines (currently available and to-be available)
to be connected as custom runners.  This hopefully gets that started.

About "more hardware available to the project", there's one VM from
fosshost which was made available not long ago, and which I set up even
more recently, which could be used as a gitlab runner too.  But, even
though some new hardware resource is available (and wasted?), the human
resources to maintain them have not been properly determined, so I believe
it's a good decision to start with the machines that have been operational
for long, and that already have to the best of my knowledge, people
maintaining them.

I also see a "Debian unstable mips64el (Debian) @ cipunited.cn" registered
as a runner, but I don't have extra information about it.

Besides that, I'll send another series shortly, that builds upon this
series, and adds a Red Hat focused job, on a Red Hat managed machine.  This
should be what other entities should be capable of doing and allowed to do.


> Who has access to what and should do what (setup)? How is this list of
> hw managed btw? Should there be some public visibility (i.e. Wiki)?
>

These are good questions, and I believe Alex can answer them about those
two machines.  Even though I hooked them up to GitLab, AFAICT he is the
ultimate admin (maybe Peter too?).

About hardware management, it has been suggested to use either the Wiki or
a MAINTAINERS entry.  This is still unresolved and feedback would be
appreciated.  For me to propose a MAINTAINERS entry, say, on a v7, I'd need
the information on who is managing them.


> Is there a document explaining what are the steps to follow for an
> entity to donate / sponsor hardware? Where would it be stored, should
> this hw be shipped somewhere? What documentation should be provided for
> its system administration?
>
> In case an entity manages hosting and maintenance, can the QEMU project
> share the power bill? Up to which amount?
> Similar question if a sysadmin has to be paid.
>
> If the QEMU project can't spend money on CI, what is expected from
> resource donators? Simply hardware + power (electricity) + network
> traffic? Also sysadmining and monitoring? Do we expect some kind of
> reliability on the data stored here or can we assume disposable /
> transient runners?
> Should donators also provide storage? Do we have a minimum storage
> requirement?
>
> Should we provide some guideline explaining any code might be run by
> our contributors on these runners and some security measures have to
> be taken / considered?
>
> Sponsors usually expect some advertising to thanks them, and often
> regular reports on how their resources are used, else they might not
> renew their offer. Who should care to keep the relationship with
> sponsors?
>
> Where is defined what belong to the project, who is responsible, who can
> request access to this hardware, what resource can be used?
>
>
You obviously directed the question towards Alex and Stefan (rightfully
so), so I won't attempt to answer these ones at this point.


> More generically, what is the process for a private / corporate entity
> to register a runner to the project? (how did it work for this aarch64
> and s390x one?)
>

The steps are listed on the documentation.  Basically anyone with knowledge
of the "registration token" can add new machines to GitLab as runners.  For
the two aarch64 and s390x, it was a matter of following the documentation
steps which basically involve:

1) providing the hostname(s) in the inventory file
2) provide the "registration token" in the vars.yml file
3) running the playbooks


>
> What else am I missing?
>
>
I think you're missing the answers to all your good questions :).

And I understand that are a lot of them (from everyone, including myself).
The dilemma here is: should we activate the machines already available, and
learn in practice, what's missing?  I honestly believe we should.

Thanks,
- Cleber.


> Thanks,
>
> Phil.
>
> > This introduces those jobs,
> > which are a mapping of custom scripts used for the same purpose.
> >
> > Signed-off-by: Cleber Rosa <crosa@redhat.com>
> > ---
> >  .gitlab-ci.d/custom-runners.yml | 208 ++++++++++++++++++++++++++++++++
> >  1 file changed, 208 insertions(+)
>
>

--000000000000f3ebd905c4413fca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 8, 2021 at 2:30 AM Philip=
pe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:f4bug@amsat.org">f4bug@amsat.or=
g</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>Hi Alex, Stefan,<br>
<br>
On 6/8/21 5:14 AM, Cleber Rosa wrote:<br>
&gt; The QEMU project has two machines (aarch64 and s390x) that can be used=
<br>
&gt; for jobs that do build and run tests.<br>
<br>
AFAIK there is more hardware available to the project, so I&#39;m wondering=
<br>
what happened to the rest, is it a deliberate choice to start small?<br></b=
lockquote><div><br></div><div>Hi Phil,</div><div><br></div><div>Yes, this s=
eries was deliberately focused on the first two machines owned and availabl=
e to QEMU.=C2=A0</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
What will happen with the rest, since we are wasting resources?<br></blockq=
uote><div><br></div><div>The plan is to allow all machines (currently avail=
able and to-be available) to be connected as custom runners.=C2=A0 This hop=
efully gets that started.</div><div><br></div><div>About &quot;more hardwar=
e available to the project&quot;, there&#39;s one VM from fosshost which wa=
s made available not long ago, and which I set up even more recently, which=
 could be used as a gitlab runner too.=C2=A0 But, even though some new hard=
ware resource is available (and wasted?), the human resources to maintain t=
hem have not been properly determined, so I believe it&#39;s a good decisio=
n to start with the machines that have been operational for long, and that =
already have to the best of my knowledge, people maintaining them.</div><di=
v><br></div><div>I also see a &quot;Debian unstable mips64el (Debian) @ <a =
href=3D"http://cipunited.cn">cipunited.cn</a>&quot; registered as a runner,=
 but I don&#39;t have extra information about it.<br></div><div><br></div><=
div>Besides that, I&#39;ll send another series shortly, that builds upon th=
is series, and adds a Red Hat focused job, on a Red Hat managed machine.=C2=
=A0 This should be what other entities should be capable of doing and allow=
ed to do.<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
Who has access to what and should do what (setup)? How is this list of<br>
hw managed btw? Should there be some public visibility (i.e. Wiki)?<br></bl=
ockquote><div><br></div><div>These are good questions, and I believe Alex c=
an answer them about those two machines.=C2=A0 Even though I hooked them up=
 to GitLab, AFAICT he is the ultimate admin (maybe Peter too?).</div><div><=
br></div><div>About hardware management, it has been suggested to use eithe=
r the Wiki or a MAINTAINERS entry.=C2=A0 This is still unresolved and feedb=
ack would be appreciated.=C2=A0 For me to propose a MAINTAINERS entry, say,=
 on a v7, I&#39;d need the information on who is managing them.</div><div><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Is there a document explaining what are the steps to follow for an<br>
entity to donate / sponsor hardware? Where would it be stored, should<br>
this hw be shipped somewhere? What documentation should be provided for<br>
its system administration?<br>
<br>
In case an entity manages hosting and maintenance, can the QEMU project<br>
share the power bill? Up to which amount?<br>
Similar question if a sysadmin has to be paid.<br>
<br>
If the QEMU project can&#39;t spend money on CI, what is expected from<br>
resource donators? Simply hardware + power (electricity) + network<br>
traffic? Also sysadmining and monitoring? Do we expect some kind of<br>
reliability on the data stored here or can we assume disposable /<br>
transient runners?<br>
Should donators also provide storage? Do we have a minimum storage<br>
requirement?<br>
<br>
Should we provide some guideline explaining any code might be run by<br>
our contributors on these runners and some security measures have to<br>
be taken / considered?<br>
<br>
Sponsors usually expect some advertising to thanks them, and often<br>
regular reports on how their resources are used, else they might not<br>
renew their offer. Who should care to keep the relationship with<br>
sponsors?<br>
<br>
Where is defined what belong to the project, who is responsible, who can<br=
>
request access to this hardware, what resource can be used?<br>
<br></blockquote><div><br></div><div>You obviously directed the question to=
wards Alex and Stefan (rightfully so), so I won&#39;t attempt to answer the=
se ones at this point.</div><div>=C2=A0</div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">
More generically, what is the process for a private / corporate entity<br>
to register a runner to the project? (how did it work for this aarch64<br>
and s390x one?)<br></blockquote><div><br></div><div>The steps are listed on=
 the documentation.=C2=A0 Basically anyone with knowledge of the &quot;regi=
stration token&quot; can add new machines to GitLab as runners.=C2=A0 For t=
he two aarch64 and s390x, it was a matter of following the documentation st=
eps which basically involve:</div><div><br></div><div>1) providing the host=
name(s) in the inventory file</div><div>2) provide the &quot;registration t=
oken&quot; in the vars.yml file</div><div>3) running the playbooks</div><di=
v>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
What else am I missing?<br>
<br></blockquote><div><br></div><div>I think you&#39;re missing the answers=
 to all your good questions :).</div><div><br></div><div>And I understand t=
hat are a lot of them (from everyone, including myself).=C2=A0 The dilemma =
here is: should we activate the machines already available, and learn in pr=
actice, what&#39;s missing?=C2=A0 I honestly believe we should.</div><div><=
br></div><div>Thanks,</div><div>- Cleber.</div><div>=C2=A0</div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
Thanks,<br>
<br>
Phil.<br>
<br>
&gt; This introduces those jobs,<br>
&gt; which are a mapping of custom scripts used for the same purpose.<br>
&gt; <br>
&gt; Signed-off-by: Cleber Rosa &lt;<a href=3D"mailto:crosa@redhat.com" tar=
get=3D"_blank">crosa@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .gitlab-ci.d/custom-runners.yml | 208 ++++++++++++++++++++++++++=
++++++<br>
&gt;=C2=A0 1 file changed, 208 insertions(+)<br>
<br>
</blockquote></div></div>

--000000000000f3ebd905c4413fca--


