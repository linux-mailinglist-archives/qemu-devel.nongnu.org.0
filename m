Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0A5410286
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Sep 2021 03:01:27 +0200 (CEST)
Received: from localhost ([::1]:55418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mROjO-0002rK-15
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 21:01:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mROgy-0001qb-LF
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 20:58:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mROgv-0002sB-53
 for qemu-devel@nongnu.org; Fri, 17 Sep 2021 20:58:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631926731;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=q4RVNMyHqVEdyUHtBMSFMHP+jlqRJMjF2IKBt+17/o4=;
 b=KDvn/rzDh7g9lryYfZ+QUVs0jOLfs/prhE9ROPjMFKRSadP2Nta7RwkfLapubNS//8Mgje
 8PJ2avWBt50OSeqm3FsrvXKTTqje6KX/jNjdZnK7JMsyDEWEldcNcasogob/w72Ktanr7h
 rQ7jl1lzpvJ6XWGROfRqMi+48gv5PLI=
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com
 [209.85.161.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-397-Ec-KQDM8NqGi9pmErVdv5Q-1; Fri, 17 Sep 2021 20:58:49 -0400
X-MC-Unique: Ec-KQDM8NqGi9pmErVdv5Q-1
Received: by mail-oo1-f70.google.com with SMTP id
 f2-20020a4a2202000000b0028c8a8074deso39378979ooa.20
 for <qemu-devel@nongnu.org>; Fri, 17 Sep 2021 17:58:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q4RVNMyHqVEdyUHtBMSFMHP+jlqRJMjF2IKBt+17/o4=;
 b=FQS0t2YAqCUiEW/s8FVQE+TbgH4j1pwTp2oosSA2iFIj0mb/5iVCxbyrOkXUr9t9Xv
 8QTF+vsmcR9AMy8MY1gzCwzPkEV26LIuOpIosu24LR7yuVUeTWHknGv/13kJbupwZl+h
 efYUfJWS+h2FtLYSR4tEMRVbLr3vfI4alPcqDVjDfBT/2eNjrdsdK1/SGDXHSX52QvDk
 yVrhNeAfPip7kYEFsoet9EEvNng4SMCsZD6TSXXUz4A8AuxWwxdOZU4cxLpvWT3uagBs
 wiKgltY6ju7c9UuzlyjQeRJO/xIQH3CCD3ZxA/IxgWl6fn7/ptel7sc7q3BH3Nq3vvTC
 8hIw==
X-Gm-Message-State: AOAM533nY3+UY8F18S2Ex3heFtmCeHMj0q/4vR85tK2+wz8ku12p+sWw
 6axtwx7LzSA0WAA3aMesGt1oXog4q0Bu8Pk/Q13gSDoCyXv/EC/6iGaqvxBcG7VGD4N1YrM7/J5
 Z0Yx9BMhI9uk/G8A/LLupkHRwV5UUPKc=
X-Received: by 2002:aca:3887:: with SMTP id f129mr7817325oia.112.1631926728266; 
 Fri, 17 Sep 2021 17:58:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyaVVzJpb9P42P3e5vcXawpPO0UBlsEJv4Z8+DltG3otNC2dM5mVRmCQh889F7x8nR9VtVPH0RGOE4sG6VHhKs=
X-Received: by 2002:aca:3887:: with SMTP id f129mr7817312oia.112.1631926728031; 
 Fri, 17 Sep 2021 17:58:48 -0700 (PDT)
MIME-Version: 1.0
References: <20210917054047.2042843-1-jsnow@redhat.com>
 <20210917054047.2042843-13-jsnow@redhat.com>
 <e885ae38-5e31-8a89-96d2-10ffab69e373@redhat.com>
In-Reply-To: <e885ae38-5e31-8a89-96d2-10ffab69e373@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Fri, 17 Sep 2021 20:58:37 -0400
Message-ID: <CAFn=p-aaU8OK99R8u21SGb0kyOz=RtNy_aZoYnLwoOu6d4WE6A@mail.gmail.com>
Subject: Re: [PATCH 12/15] iotests: Disable AQMP logging under non-debug modes
To: Hanna Reitz <hreitz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000ec984705cc3a8c8d"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 qemu-devel <qemu-devel@nongnu.org>, Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000ec984705cc3a8c8d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 17, 2021 at 10:30 AM Hanna Reitz <hreitz@redhat.com> wrote:

> On 17.09.21 07:40, John Snow wrote:
> > Disable the aqmp logger, which likes to (at the moment) print out
> > intermediate warnings and errors that cause session termination; disabl=
e
> > them so they don't interfere with the job output.
> >
> > Leave any "CRITICAL" warnings enabled though, those are ones that we
> > should never see, no matter what.
>
> I mean, looks OK to me, but from what I understand (i.e. little),
> qmp_client doesn=E2=80=99t log CRITICAL messages, at least I can=E2=80=99=
t see any. Only
> ERRORs.
>
>
There's *one* critical message in protocol.py, used for a circumstance that
I *think* should be impossible. I do not think I currently use any WARNING
level statements.


> I guess I=E2=80=99m missing some CRITICAL messages in external functions =
called
> from qmp_client.py, but shouldn=E2=80=99t we still keep ERRORs?
>

...Mayyyyyybe?

The errors logged by AQMP are *almost always* raised as Exceptions
somewhere else, eventually. Sometimes when we encounter them in one
context, we need to save them and then re-raise them in a different
execution context. There's one good exception to this: My pal, EOFError.

If the reader context encounters EOF, it raises EOFError and this causes a
disconnect to be scheduled asynchronously. *Any* Exception that causes a
disconnect to be scheduled asynchronously is dutifully logged as an ERROR.
At this point in the code, we don't really know if the user of the library
considers this an "error" yet or not. I've waffled a lot on how exactly to
treat this circumstance. ...Hm, I guess that's really the only case where I
have an error that really ought to be suppressed. I suppose what I will do
here is: if the exception happens to be an EOFError I will drop the
severity of the log message down to INFO. I don't know why it takes being
challenged on this stuff to start thinking clearly about it, but here we
are. Thank you for your feedback :~)

--js

--000000000000ec984705cc3a8c8d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Sep 17, 2021 at 10:30 AM Hann=
a Reitz &lt;<a href=3D"mailto:hreitz@redhat.com">hreitz@redhat.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On 17.09.=
21 07:40, John Snow wrote:<br>
&gt; Disable the aqmp logger, which likes to (at the moment) print out<br>
&gt; intermediate warnings and errors that cause session termination; disab=
le<br>
&gt; them so they don&#39;t interfere with the job output.<br>
&gt;<br>
&gt; Leave any &quot;CRITICAL&quot; warnings enabled though, those are ones=
 that we<br>
&gt; should never see, no matter what.<br>
<br>
I mean, looks OK to me, but from what I understand (i.e. little), <br>
qmp_client doesn=E2=80=99t log CRITICAL messages, at least I can=E2=80=99t =
see any. Only <br>
ERRORs.<br>
<br></blockquote><div><br></div><div>There&#39;s *one* critical message in =
protocol.py, used for a circumstance that I *think* should be impossible. I=
 do not think I currently use any WARNING level statements.<br></div><div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
I guess I=E2=80=99m missing some CRITICAL messages in external functions ca=
lled <br>
from qmp_client.py, but shouldn=E2=80=99t we still keep ERRORs?<br></blockq=
uote><div><br></div><div>...Mayyyyyybe?</div><div><br></div><div>The errors=
 logged by AQMP are *almost always* raised as Exceptions somewhere else, ev=
entually. Sometimes when we encounter them in one context, we need to save =
them and then re-raise them in a different execution context. There&#39;s o=
ne good exception to this: My pal, EOFError.</div><div><br></div><div>If th=
e reader context encounters EOF, it raises EOFError and this causes a disco=
nnect to be scheduled asynchronously. *Any* Exception that causes a disconn=
ect to be scheduled asynchronously is dutifully logged as an ERROR. At this=
 point in the code, we don&#39;t really know if the user of the library con=
siders this an &quot;error&quot; yet or not. I&#39;ve waffled a lot on how =
exactly to treat this circumstance. ...Hm, I guess that&#39;s really the on=
ly case where I have an error that really ought to be suppressed. I suppose=
 what I will do here is: if the exception happens to be an EOFError I will =
drop the severity of the log message down to INFO. I don&#39;t know why it =
takes being challenged on this stuff to start thinking clearly about it, bu=
t here we are. Thank you for your feedback :~)</div><div><br></div><div>--j=
s<br></div></div></div>

--000000000000ec984705cc3a8c8d--


