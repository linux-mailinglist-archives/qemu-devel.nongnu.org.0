Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 668064292CF
	for <lists+qemu-devel@lfdr.de>; Mon, 11 Oct 2021 17:04:11 +0200 (CEST)
Received: from localhost ([::1]:36290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZwqY-0002Kn-11
	for lists+qemu-devel@lfdr.de; Mon, 11 Oct 2021 11:04:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony@codemonkey.ws>)
 id 1mZwnl-0001CP-Bw
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 11:01:17 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:46876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <anthony@codemonkey.ws>)
 id 1mZwnf-0001V6-AV
 for qemu-devel@nongnu.org; Mon, 11 Oct 2021 11:01:14 -0400
Received: by mail-wr1-x42e.google.com with SMTP id k7so57040575wrd.13
 for <qemu-devel@nongnu.org>; Mon, 11 Oct 2021 08:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=codemonkey-ws.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QIzf+ReG4c7m70mQ0PdyrbC5O0S6O+YWiwk++6Ngto0=;
 b=bbQO0XeFJo3UCNW7Mz8QWfNbDpcfJCIMnehsbvAQU2CYK25+owipHw8drKHWF9FQ6/
 8LlhuEZyNIm78xzyB8pvKZHhzIcChcvd3oWBRl1XTYhn2Wf+7lJz/zVuJQSJqvmgs2KC
 hTMfv9g/ZkfR/cZg5F8i9XpvoPNtoij5KrbF/GXKU9KYcbYqhoMGDwjIWsUCpUjnOcaZ
 RdqQMS7KMIPyuRdmnqQoEKFLCecoweOjVIWEh4Xs6t032TsKQMbd8BsQdJN9jnveuSlI
 HqGxNM8v97zS4mM9JNCLQCyT8pXeb7TMouGBIsXmxpYzveUU7FOX/9pZG2or/DppixUe
 ZLJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QIzf+ReG4c7m70mQ0PdyrbC5O0S6O+YWiwk++6Ngto0=;
 b=4fDip0u3vY4P1m/aI1htT2C3VI/a5qo9XSzTmkIrDD7BpOrA4gQlTQv8XlqUljAALm
 5naCyXc7JnHBMKDlsPvpaAao2tzcHRB/qK71LOE2YzUVDQ4sjP1ePPrZ5hXn/klj3dIN
 24q0kWnkv9+paPZJLh4rXTPhlqOvCW0vVjbEzOPT8ZlrBW+sf1Vg8H+Civ2E4EGV20RI
 IsWbIsnSzbLrYc2YsdYkkui9KboNftBL7STAIKl2iefzTk+n6H9sA+H3QKdMaqzDyIaa
 UB18OxVMfqZruEhRWloCrt0r5BxSpECLXj8/VzTkeDIlaNdMjPMurxj/YUmQjv5lkUzb
 fEyA==
X-Gm-Message-State: AOAM532Rj/HkbrXREDwhA1GkDGV0//2a/SOGUefogyvrw6zWOdRgM52U
 mUlVqjSuFauGqK21wKMmhicExozjDSSftb6TzQbi5A==
X-Google-Smtp-Source: ABdhPJzcI2YFcm4LkD5fg7h5oV2L5KL/zgkiWUx0sOLxUOjyJYUlhU40qWHWTCzpGM5hl4IBGQUeC2XJyU3HkKyIGQc=
X-Received: by 2002:adf:b31d:: with SMTP id j29mr25362377wrd.429.1633964468922; 
 Mon, 11 Oct 2021 08:01:08 -0700 (PDT)
MIME-Version: 1.0
References: <YVW+ZGmIs+repvj4@stefanha-x1.localdomain>
 <CAJSP0QUq46nOTAv=4V0mhT2ZNbfKBPJXLNLY5Jun5B_h=sedQw@mail.gmail.com>
 <YVXePK28T7nl9J7k@invalid> <YVa0p4rZDh3teOwC@stefanha-x1.localdomain>
In-Reply-To: <YVa0p4rZDh3teOwC@stefanha-x1.localdomain>
From: Anthony Liguori <anthony@codemonkey.ws>
Date: Mon, 11 Oct 2021 08:00:57 -0700
Message-ID: <CA+aC4ksY_dbovAE1i91h1=sE-BRrdRx0yYfp_4DQ3QKXW30F4A@mail.gmail.com>
Subject: Re: Moving QEMU downloads to GitLab Releases?
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000bf2f8d05ce14ff91"
Received-SPF: none client-ip=2a00:1450:4864:20::42e;
 envelope-from=anthony@codemonkey.ws; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Stefan Hajnoczi <stefanha@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 qemu-devel <qemu-devel@nongnu.org>, Eldon Stegall <eldon-qemu@eldondev.com>,
 michael.roth@amd.com, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000bf2f8d05ce14ff91
Content-Type: text/plain; charset="UTF-8"

On Fri, Oct 1, 2021 at 12:20 AM Stefan Hajnoczi <stefanha@redhat.com> wrote:

> On Thu, Sep 30, 2021 at 03:57:49PM +0000, Eldon Stegall wrote:
> > Hello!
> > I'd be happy to help with this. I'm mostly a consumer of QEMU, but
> > greatly appreciate all the work this community has done, and was able
> > to contribute a little by helping with QEMU advent this past year. I
> > would be happy to help streamline some of this activities if that would
> > be welcome, and would gratefully contribute time and resources. Hosting
> > and serving data like this has been core to my recent experience.
> >
> > I would be happy to suggest and build out a distribution strategy for
> > these packages, and believe I could cut some costs, and even convince a
> > small consultancy I am a part of here that uses QEMU to foot a
> > reasonable bill.
> >
> > A brief introduction, since I haven't had the pleasure of attending
> > FOSDEM or any other QEMU meetups: I am a startup-oriented Cloud Security
> > Architect, based out of Atlanta, previously with companies like
> > DataStax, but now working on AWS video pipelines for a startup here.
>
> Thanks for joining the discussion and for running last year's QEMU
> Advent Calendar, Eldon.
>
> Any ideas for moving download.qemu.org to a hosted service would be
> appreciated! We haven't compared CDN and cloud providers closely yet. If
> you have experience in this area or time to check them out, then that
> would be valuable.
>
> QEMU has funds if there is a cost for file hosting (probably less than
> $100/month). Some providers may be willing to support an open source
> project for free. Possible providers include CloudFlare, Akamai, Fastly,
> Microsoft Azure, Google Cloud Storage, etc.
>

https://aws.amazon.com/blogs/opensource/aws-promotional-credits-open-source-projects/

Let me know if ya'll apply and I'm happy to push it through.

Regards,

Anthony Liguori

--000000000000bf2f8d05ce14ff91
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Fri, Oct 1, 2021 at 12:20 AM Stefan Ha=
jnoczi &lt;<a href=3D"mailto:stefanha@redhat.com">stefanha@redhat.com</a>&g=
t; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">On Thu, Sep 30, 2021 at 03:57:49PM +0000, Eldon Stegal=
l wrote:<br>
&gt; Hello!<br>
&gt; I&#39;d be happy to help with this. I&#39;m mostly a consumer of QEMU,=
 but<br>
&gt; greatly appreciate all the work this community has done, and was able<=
br>
&gt; to contribute a little by helping with QEMU advent this past year. I<b=
r>
&gt; would be happy to help streamline some of this activities if that woul=
d<br>
&gt; be welcome, and would gratefully contribute time and resources. Hostin=
g<br>
&gt; and serving data like this has been core to my recent experience.<br>
&gt; <br>
&gt; I would be happy to suggest and build out a distribution strategy for<=
br>
&gt; these packages, and believe I could cut some costs, and even convince =
a<br>
&gt; small consultancy I am a part of here that uses QEMU to foot a<br>
&gt; reasonable bill.<br>
&gt; <br>
&gt; A brief introduction, since I haven&#39;t had the pleasure of attendin=
g<br>
&gt; FOSDEM or any other QEMU meetups: I am a startup-oriented Cloud Securi=
ty<br>
&gt; Architect, based out of Atlanta, previously with companies like<br>
&gt; DataStax, but now working on AWS video pipelines for a startup here.<b=
r>
<br>
Thanks for joining the discussion and for running last year&#39;s QEMU<br>
Advent Calendar, Eldon.<br>
<br>
Any ideas for moving <a href=3D"http://download.qemu.org" rel=3D"noreferrer=
" target=3D"_blank">download.qemu.org</a> to a hosted service would be<br>
appreciated! We haven&#39;t compared CDN and cloud providers closely yet. I=
f<br>
you have experience in this area or time to check them out, then that<br>
would be valuable.<br>
<br>
QEMU has funds if there is a cost for file hosting (probably less than<br>
$100/month). Some providers may be willing to support an open source<br>
project for free. Possible providers include CloudFlare, Akamai, Fastly,<br=
>
Microsoft Azure, Google Cloud Storage, etc.<br></blockquote><div><br></div>=
<div><a href=3D"https://aws.amazon.com/blogs/opensource/aws-promotional-cre=
dits-open-source-projects/">https://aws.amazon.com/blogs/opensource/aws-pro=
motional-credits-open-source-projects/</a><br></div><div><br></div><div>Let=
 me know if ya&#39;ll apply and I&#39;m happy to push it through.</div><div=
><br>Regards,</div><div><br></div><div>Anthony Liguori</div><div>=C2=A0</di=
v></div></div>

--000000000000bf2f8d05ce14ff91--

