Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49D04455FEE
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Nov 2021 16:51:44 +0100 (CET)
Received: from localhost ([::1]:59302 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnjhP-00008R-4X
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 10:51:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44240)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mnjgX-0007Qd-5T
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 10:50:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20805)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mnjgV-0001Jt-JZ
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 10:50:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637250646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=He7ksKjjXS0a4BtXsOZZMWgGYhJCaxAmAcdQYoJXr74=;
 b=K2ZMyYOtFfcKho58c5VelG98X4K2rNyCPRrcjI750xAIh1YY5VYfq8RXFD/HVa/QUgWDVZ
 Ui4iiHiQ4eGAIjqDgFA4E/Qyh/TRxiy7puBaK2k+El8mOtKuYrV+4fNa0l6JRPa3W42cQS
 07PHcoNfcmJcgmyDpSmLoPjyGVdEzuE=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-102-VAA6tPTYMw6zraCV76gBuA-1; Thu, 18 Nov 2021 10:50:43 -0500
X-MC-Unique: VAA6tPTYMw6zraCV76gBuA-1
Received: by mail-vk1-f198.google.com with SMTP id
 m190-20020a1feec7000000b002fa5912bcd7so3155999vkh.21
 for <qemu-devel@nongnu.org>; Thu, 18 Nov 2021 07:50:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=He7ksKjjXS0a4BtXsOZZMWgGYhJCaxAmAcdQYoJXr74=;
 b=oh0ycQNO/LcQTagDnk/wDvJjSKO88ek3j/P0U2ir/CC5g3D4WWdj9GlFS07e08Omuh
 gWB26xtj4il5dMNe4vKf9F1zVQS3rON1P3NR0B5dqj3U7m4IyfXIIB7Suqf7zfc2/03e
 i0EJxy6bja6by8RS8NKhFvASPdJtsZQeBv7G57F7QQ15/a+crPCD5RuCstK7MqKAeN/M
 9TPJu1q3wFrQd66Gr0uqyQ7VhvkwHJfcnyp7Fsug+PI2B/HBXT1saJaXN3pp19vo5gcq
 tjjg4LTeI0l6VyY5YGXr1wYE4SIvUuClUkD6O/rlzMiZSlbB28MaphG0iyuxFzwnztfy
 hPIQ==
X-Gm-Message-State: AOAM533vqoF/tt3PodUY0r4WG0kRhd+4LUlpFZfm6Myt2hl4RQ9htfe/
 yFvXIn3bXaEWolxEP1vDGiHSxxF4mLQfmjv9leFohvILYHmOHJSiMD3t+G90uKmxTjDru2v38ue
 edO4b1AfLa0ze6WqMS/HBfWVAjxnSIL4=
X-Received: by 2002:a67:cb0c:: with SMTP id b12mr84692933vsl.13.1637250642705; 
 Thu, 18 Nov 2021 07:50:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzpC9TF40EWGYqfhTwoUM+OypzPjaeGcOTElmJD6ZYYgPz05ck9D/MSeKD19PsxRh6MWa05Rv+uKhvO+pRtG7o=
X-Received: by 2002:a67:cb0c:: with SMTP id b12mr84692887vsl.13.1637250642492; 
 Thu, 18 Nov 2021 07:50:42 -0800 (PST)
MIME-Version: 1.0
References: <20211117003317.2844087-1-jsnow@redhat.com>
 <20211117094157.cef4x5jdsddd3hfy@sirius.home.kraxel.org>
 <CAFn=p-Y-dxRLrvEwz1M=HgPumQqwzUSHe1UTy-H_9D8PuCv0xg@mail.gmail.com>
 <20211118064534.vbamk7ky2b5hawqm@sirius.home.kraxel.org>
In-Reply-To: <20211118064534.vbamk7ky2b5hawqm@sirius.home.kraxel.org>
From: John Snow <jsnow@redhat.com>
Date: Thu, 18 Nov 2021 10:50:31 -0500
Message-ID: <CAFn=p-adBsoLYCEX0UM8PyHW0QcGKBQXUPeFBez8yZ-0AHMaDw@mail.gmail.com>
Subject: Re: [PULL 0/5] Python patches
To: Gerd Hoffmann <kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000f44f4105d1121ed2"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Daniel Berrange <berrange@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Qemu-block <qemu-block@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Willian Rampazzo <willianr@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f44f4105d1121ed2
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 18, 2021 at 1:46 AM Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
>
> > - Split python/qemu/qmp out into its own repository and begin uploading
> it
> > to PyPI, as a test. (Do not delete python/qemu/qmp yet at this phase.)
>
> I think you can do that as two separate steps.
>
> pip can install from vcs too, i.e. when splitted to a separate repo but
> not yet uploaded to pypi you can simply drop something like ...
>
>         git+https://gitlab.com/qemu/qemu-python.git@master
>
> ... into pip-requirements.txt.  That way you can easily test things
> before actually uploading to pypi.
>
>
Indeed - a limitation here however is that pip will not install from this
source unless explicitly asked to, so you couldn't use this package as a
requirement for another one, for example -- but it works as a testing step.
but that's the rough outline of where I am headed and what I think needs to
be done to get there. It's just taking me a while to get everything put in
order exactly the right way to be able to flip the switch. Hopefully soon,
though.

I realized when re-reading my mails last night that I said I wouldn't be
able to do it until "next release" but what I really meant was "until the
next development window".

--js

--000000000000f44f4105d1121ed2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 18, 2021 at 1:46 AM Gerd =
Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0 H=
i,<br>
<br>
&gt; - Split python/qemu/qmp out into its own repository and begin uploadin=
g it<br>
&gt; to PyPI, as a test. (Do not delete python/qemu/qmp yet at this phase.)=
<br>
<br>
I think you can do that as two separate steps.<br>
<br>
pip can install from vcs too, i.e. when splitted to a separate repo but<br>
not yet uploaded to pypi you can simply drop something like ...<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 git+<a href=3D"https://gitlab.com/qemu/qemu-pyt=
hon.git@master" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/qem=
u/qemu-python.git@master</a><br>
<br>
... into pip-requirements.txt.=C2=A0 That way you can easily test things<br=
>
before actually uploading to pypi.<br>
<br></blockquote><div><br></div><div>Indeed - a limitation here however is =
that pip will not install from this source unless explicitly asked to, so y=
ou couldn&#39;t use this package as a requirement for another one, for exam=
ple -- but it works as a testing step. but that&#39;s the rough outline of =
where I am headed and what I think needs to be done to get there. It&#39;s =
just taking me a while to get everything put in order exactly the right way=
 to be able to flip the switch. Hopefully soon, though.<br><br></div><div>I=
 realized when re-reading my mails last night that I said I wouldn&#39;t be=
 able to do it until &quot;next release&quot; but what I really meant was &=
quot;until the next development window&quot;.<br></div><div><br></div><div>=
--js<br></div></div></div>

--000000000000f44f4105d1121ed2--


