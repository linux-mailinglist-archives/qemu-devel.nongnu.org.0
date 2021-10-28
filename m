Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3D5E43E444
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 16:52:23 +0200 (CEST)
Received: from localhost ([::1]:34598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg6lT-0000a7-2q
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 10:52:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mg6i6-0005OU-8M
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 10:48:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47204)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mg6i3-00026B-Ld
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 10:48:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635432528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=EtKnt+8g1XUUPGlmHmbmo5JG99Zv2J1aE59geeHm0/c=;
 b=EviCd9+AAEq+yrEPPNxAkS8SqJDmXhJZTv07+RniNadioAxB8JmQe2iMYfS7gI/BdXrwtL
 e1MPIV+M/NNfTNNf7k6MRRFlGtJFpx7bH5EkEfVscGsBNjXO2LCPaEea7Lb7mS1rVtrMF8
 BCM46SLbdgiBgj7AyS+92oh/q53pbxY=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-389-fln29M-dNWChsBDZT98HsA-1; Thu, 28 Oct 2021 10:48:46 -0400
X-MC-Unique: fln29M-dNWChsBDZT98HsA-1
Received: by mail-vk1-f199.google.com with SMTP id
 r3-20020a1fc103000000b002dc60ab179cso2184176vkf.23
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 07:48:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EtKnt+8g1XUUPGlmHmbmo5JG99Zv2J1aE59geeHm0/c=;
 b=spMAi/gCVj3fCTV8110kDuac9YYJnNKVB7qzfLxZGKdZiswNRLPjasLtq81EQUcX1M
 Tn6lDOXud8lEPHcWffwfWmRUp0Goubdj+bV63lNaJIMB9iDiidQVwLktLooLjjKKbmd2
 4CfnBWO3ROvjPUa403lJWp5qB+rn8toyDwtc+xiPMwiFyQ4J41nfv8FWD5OEpH34E8r/
 XjFUnA3jai2GhhlijzBSjfzySKmXxrH22dP5UYKhPfjCH0k7oZC/rb0PLdvKn+PiAa8Y
 5kd2Qo7ttNgwyLhPVwaj/XDJYiaIAgQkUMkZIrM5+blOKyLVRp5ar1EbUiySyh7p4GXA
 6p6A==
X-Gm-Message-State: AOAM532MotqgB1CsCMA9EoliXTkbFyTAvstcI0C0OwwNSbsnmYkYNcW6
 pE4aRi7CuFjE10PUzeblSkqC+xw+2m5oLzrHaxq2eSsK1HCJpSw3ZQ0kTgZ2PhZe0gRYfyqC/cV
 Ale5mMUihBq2yWsiwpzpBGIpF0W4pAk4=
X-Received: by 2002:a67:f685:: with SMTP id n5mr4710508vso.31.1635432526114;
 Thu, 28 Oct 2021 07:48:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwmvjxgt46w7hzAw+K90ccIe7GyjBUBpTdjxjprti9UOg45lm8tMfc2r6NFIcx4RYDqmhRsby8o/M/VyG5ZD2g=
X-Received: by 2002:a67:f685:: with SMTP id n5mr4710483vso.31.1635432525954;
 Thu, 28 Oct 2021 07:48:45 -0700 (PDT)
MIME-Version: 1.0
References: <20211026175612.4127598-1-jsnow@redhat.com>
 <YXp9eqW+bJlB4R2K@redhat.com>
In-Reply-To: <YXp9eqW+bJlB4R2K@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Thu, 28 Oct 2021 10:48:35 -0400
Message-ID: <CAFn=p-bDFdFHN6Zqy7KToBiPaHbfeTVzCEgNYH_U_8yXwMQZ2A@mail.gmail.com>
Subject: Re: [PATCH v5 0/8] Switch iotests to using Async QMP
To: Kevin Wolf <kwolf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000c3957905cf6ace52"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c3957905cf6ace52
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 28, 2021 at 6:37 AM Kevin Wolf <kwolf@redhat.com> wrote:

> Am 26.10.2021 um 19:56 hat John Snow geschrieben:
> > GitLab:
> https://gitlab.com/jsnow/qemu/-/commits/python-aqmp-iotest-wrapper
> > CI: https://gitlab.com/jsnow/qemu/-/pipelines/395925703
> >
> > Hiya,
> >
> > This series continues where the last two AQMP series left off and adds a
> > synchronous 'legacy' wrapper around the new AQMP interface, then drops
> > it straight into iotests to prove that AQMP is functional and totally
> > cool and fine. The disruption and churn to iotests is pretty minimal.
> >
> > In the event that a regression happens and I am not physically proximate
> > to inflict damage upon, one may set the QEMU_PYTHON_LEGACY_QMP variable
> > to any non-empty string as it pleases you to engage the QMP machinery
> > you are used to.
>
> I obviously haven't reviewed systematically that AQMP is actually
> correctly implemented and does what this series expects it to do, but
> treating it as a black box should be good enough for this series:
>
> Reviewed-by: Kevin Wolf <kwolf@redhat.com>
>

Yeah. I've tested it "a lot" and I think it should work fine, it seems to
work fine in practice, there's lots of unit tests for the core
transport/async bits. And worst case, we can switch it back with a single
line change.

Thanks!

--js

--000000000000c3957905cf6ace52
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Oct 28, 2021 at 6:37 AM Kevin=
 Wolf &lt;<a href=3D"mailto:kwolf@redhat.com">kwolf@redhat.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Am 26.10.2021=
 um 19:56 hat John Snow geschrieben:<br>
&gt; GitLab: <a href=3D"https://gitlab.com/jsnow/qemu/-/commits/python-aqmp=
-iotest-wrapper" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/js=
now/qemu/-/commits/python-aqmp-iotest-wrapper</a><br>
&gt; CI: <a href=3D"https://gitlab.com/jsnow/qemu/-/pipelines/395925703" re=
l=3D"noreferrer" target=3D"_blank">https://gitlab.com/jsnow/qemu/-/pipeline=
s/395925703</a><br>
&gt; <br>
&gt; Hiya,<br>
&gt; <br>
&gt; This series continues where the last two AQMP series left off and adds=
 a<br>
&gt; synchronous &#39;legacy&#39; wrapper around the new AQMP interface, th=
en drops<br>
&gt; it straight into iotests to prove that AQMP is functional and totally<=
br>
&gt; cool and fine. The disruption and churn to iotests is pretty minimal.<=
br>
&gt; <br>
&gt; In the event that a regression happens and I am not physically proxima=
te<br>
&gt; to inflict damage upon, one may set the QEMU_PYTHON_LEGACY_QMP variabl=
e<br>
&gt; to any non-empty string as it pleases you to engage the QMP machinery<=
br>
&gt; you are used to.<br>
<br>
I obviously haven&#39;t reviewed systematically that AQMP is actually<br>
correctly implemented and does what this series expects it to do, but<br>
treating it as a black box should be good enough for this series:<br>
<br>
Reviewed-by: Kevin Wolf &lt;<a href=3D"mailto:kwolf@redhat.com" target=3D"_=
blank">kwolf@redhat.com</a>&gt;<br></blockquote><div><br></div><div>Yeah. I=
&#39;ve tested it &quot;a lot&quot; and I think it should work fine, it see=
ms to work fine in practice, there&#39;s lots of unit tests for the core tr=
ansport/async bits. And worst case, we can switch it back with a single lin=
e change.</div><div><br></div><div>Thanks!</div><div><br></div><div>--js<br=
></div><div><br></div><div> <br></div></div></div>

--000000000000c3957905cf6ace52--


