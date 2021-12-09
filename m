Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4723546ED03
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Dec 2021 17:24:25 +0100 (CET)
Received: from localhost ([::1]:48628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvMDX-00083g-Vv
	for lists+qemu-devel@lfdr.de; Thu, 09 Dec 2021 11:24:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57638)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elima@redhat.com>) id 1mvMBg-0006Dl-7h
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 11:22:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <elima@redhat.com>) id 1mvMBc-0003GY-Px
 for qemu-devel@nongnu.org; Thu, 09 Dec 2021 11:22:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639066943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BEI5MIxhi6zk2lOBek2rPzJIXD+uzRIa//y+c7mWQow=;
 b=NS5uFGlYfFj+USNgummSw39ffCrAv9/ouC/z29lRAiVyz7tcPfB1KVg+9s1f0B5IqeoyA/
 EE+7iEGXGCnN8Ci5CEUjjt0aXe6KXD8oidi91efCe3WWEMPNKe8LjudmZe7I/SWvrPZlK9
 +AhcwSspj92rNfl2OCQnwuw/ANGE1NQ=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-230-Miuz5HddM8GfdQOMa4Ejow-1; Thu, 09 Dec 2021 11:22:19 -0500
X-MC-Unique: Miuz5HddM8GfdQOMa4Ejow-1
Received: by mail-pg1-f197.google.com with SMTP id
 i12-20020a63584c000000b00330ec6e2c37so3501466pgm.7
 for <qemu-devel@nongnu.org>; Thu, 09 Dec 2021 08:22:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BEI5MIxhi6zk2lOBek2rPzJIXD+uzRIa//y+c7mWQow=;
 b=bHlWB890XXO1uq3lSXIZXvSqNc/YaMB2hdSt6zLWv98oNCdW8Q20lChDIlJ0tJg2R2
 VJaUDuLONPSgeb1Sm9APVrSks0ngvYpvVkY20UswcBk7IqwqJp1ahbbL+K+eEqs+bSx4
 dDTzhRoXSjPAdDyL9x1EHQmdbSX5XADvipel8ILnOFbhj5q9E8SaWqaC9w2GN/zNzIGJ
 1kzDzwvS7bgo4mTnKoythFpJer4B42XOdvDRe+my3M1IlXKUBuRj6PPwpImaZBO14jJ3
 TrASKzS9tX1Zz9CzW29KPJt7dzFmZCtuxsxNcnHhKbnPM+AEo+Ifn9LslpLw/icWuWGJ
 o7iA==
X-Gm-Message-State: AOAM530l8h23qYe7nXvAMbk6ascGrei+iMUq8+pHXmWFhlNPzfS3gtYk
 RDoY6i8Qq+xFEZ6JrUgVqM57vfvYU1uov7SoVMG/Exea6tzasmR+KrI3GikBjAKI7u+45firaAX
 tG7Ssqi4r7taI+8e7cUEHLHwDL6Ppun8=
X-Received: by 2002:a63:88c1:: with SMTP id
 l184mr34081674pgd.460.1639066938754; 
 Thu, 09 Dec 2021 08:22:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyWO02PUS/Rs0sh3rqpI+iESh9fIs8Pu1dbaPDpZ3lVnhqWfhah4w5F4NxqCxnzZMzlNGKsCNsMNMqVOmch944=
X-Received: by 2002:a63:88c1:: with SMTP id
 l184mr34081658pgd.460.1639066938462; 
 Thu, 09 Dec 2021 08:22:18 -0800 (PST)
MIME-Version: 1.0
References: <CAJzYwARYDA+E4wrszx-F1D_9+VAYB2dU=M-LtvzPJey02gu2qg@mail.gmail.com>
 <20211203193725.GB1127@redhat.com>
 <CAJzYwASbiKGe5n7Ggs3u+6b6-7KEyqLCHxFsv2YMh2xyU4Y1MQ@mail.gmail.com>
 <20211203210325.GG1127@redhat.com>
 <ca5c4fb4-3e9e-03c7-b682-cd29a01e0f13@linaro.org>
 <a4421d15-81aa-4128-11f9-726765c814c5@linaro.org>
In-Reply-To: <a4421d15-81aa-4128-11f9-726765c814c5@linaro.org>
From: Eduardo Lima <elima@redhat.com>
Date: Thu, 9 Dec 2021 13:22:07 -0300
Message-ID: <CAJzYwARxgVstp=0jgaBWxyjZGX73D5rFdp=TQ4QssQYRFnKaRw@mail.gmail.com>
Subject: Re: QEMU 6.2.0 and rhbz#1999878
To: Richard Henderson <richard.henderson@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=elima@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000a169bf05d2b902f8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=elima@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.618,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel@nongnu.org, sw@weilnetz.de,
 f4bug@amsat.org, "Richard W.M. Jones" <rjones@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000a169bf05d2b902f8
Content-Type: text/plain; charset="UTF-8"

Thanks all, I saw the patch has been merged and is part of rc4. I'm
removing it from the fedora package.

On Fri, Dec 3, 2021 at 9:09 PM Richard Henderson <
richard.henderson@linaro.org> wrote:

> On 12/3/21 2:00 PM, Richard Henderson wrote:
> >> Oh I see, it was indeed replaced by Richard Henderson's patch:
> >>
> >>
> https://src.fedoraproject.org/rpms/qemu/blob/rawhide/f/0001-tcg-arm-Reduce-vector-alignment-requirement-for-NEON.patch
> >>
> >>
> >>> At the moment I kept it as part of 6.2.0 build, which I am just about
> to push
> >>> to rawhide. It builds locally, and I am only waiting for the
> scratch-build to
> >>> finish.
> >>
> >> Yes looks like we need to keep it, and get it upstream too.
> >
> > Whoops.  That dropped through the cracks.
> > I'll queue that now-ish.
>
>
> https://patchew.org/QEMU/20210912174925.200132-1-richard.henderson@linaro.org/
>
> Ah right, I was supposed to test your kernel and never got there.
> Plus it never got any r-b's.
>
> Rebase was smooth and regression testing went ok on cortex-a57 host.
>
>
> r~
>
>

--000000000000a169bf05d2b902f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,sa=
ns-serif;font-size:small">Thanks all, I saw the patch has been merged and i=
s part of rc4. I&#39;m removing it from the fedora package.</div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, De=
c 3, 2021 at 9:09 PM Richard Henderson &lt;<a href=3D"mailto:richard.hender=
son@linaro.org">richard.henderson@linaro.org</a>&gt; wrote:<br></div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">On 12/3/21 2:00 PM, Richard Hen=
derson wrote:<br>
&gt;&gt; Oh I see, it was indeed replaced by Richard Henderson&#39;s patch:=
<br>
&gt;&gt;<br>
&gt;&gt; <a href=3D"https://src.fedoraproject.org/rpms/qemu/blob/rawhide/f/=
0001-tcg-arm-Reduce-vector-alignment-requirement-for-NEON.patch" rel=3D"nor=
eferrer" target=3D"_blank">https://src.fedoraproject.org/rpms/qemu/blob/raw=
hide/f/0001-tcg-arm-Reduce-vector-alignment-requirement-for-NEON.patch</a> =
<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;&gt; At the moment I kept it as part of 6.2.0 build, which I am jus=
t about to push<br>
&gt;&gt;&gt; to rawhide. It builds locally, and I am only waiting for the s=
cratch-build to<br>
&gt;&gt;&gt; finish.<br>
&gt;&gt;<br>
&gt;&gt; Yes looks like we need to keep it, and get it upstream too.<br>
&gt; <br>
&gt; Whoops.=C2=A0 That dropped through the cracks.<br>
&gt; I&#39;ll queue that now-ish.<br>
<br>
<a href=3D"https://patchew.org/QEMU/20210912174925.200132-1-richard.henders=
on@linaro.org/" rel=3D"noreferrer" target=3D"_blank">https://patchew.org/QE=
MU/20210912174925.200132-1-richard.henderson@linaro.org/</a><br>
<br>
Ah right, I was supposed to test your kernel and never got there.<br>
Plus it never got any r-b&#39;s.<br>
<br>
Rebase was smooth and regression testing went ok on cortex-a57 host.<br>
<br>
<br>
r~<br>
<br>
</blockquote></div>

--000000000000a169bf05d2b902f8--


