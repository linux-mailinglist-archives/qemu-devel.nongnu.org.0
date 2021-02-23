Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5519E322F1E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 17:54:57 +0100 (CET)
Received: from localhost ([::1]:54392 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEaxc-0000wA-9f
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 11:54:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yshxxsjt715@gmail.com>)
 id 1lEVt3-00019H-33; Tue, 23 Feb 2021 06:29:53 -0500
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135]:43046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <yshxxsjt715@gmail.com>)
 id 1lEVt1-0005uS-AW; Tue, 23 Feb 2021 06:29:52 -0500
Received: by mail-il1-x135.google.com with SMTP id q5so13719046ilc.10;
 Tue, 23 Feb 2021 03:29:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=0h8eSDuU44Xs+IiTZ0oUmvRM5qz9Ku1A2lg61pQgzDY=;
 b=m7kH7vHmg8A2ZVQuwnJdrN3nx7XHadqtU4X1fd2TABSBMDyLD/UMvmMGjbuumQfq4C
 S3+lVYs1sP/xV3gPhHhCSzhiIAdkGIswNpn5tcFyD20gjwTWmdJzRHI5RmOZdxQrXBFL
 S9WgOM52UMsvrk3BkNJ+liOmqA962whN66B0UWuBnNqNOsYfpQKJaumaq4gfpvNcyot1
 T5l6WR+zrJJvy+Wqz+fkB2YDiGazCOcLXfWGUqeXIPGtfe8QDSooPPRmMoXqQLVv+AMZ
 8ui0rTjAVxtlhisTYNBO0ftByurAAOhKMekxMZw4nBBiAkaC6GTzvpTy223BbCnU0tOe
 BnVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0h8eSDuU44Xs+IiTZ0oUmvRM5qz9Ku1A2lg61pQgzDY=;
 b=Ow2Gy/R/3Zrrnn+S4aw+kwNQYZACt5wkyUFy5NaIJqj4Z6Wpz4UmKMO42VC1wjniKN
 hH6vFZXUnMOylMOR4Zo8BeB1i7KYKnDZL4pTdY2dnk8BSyVhF3co2mf0QsMjqkLTRpU6
 N1mqy4tQ02QlYbOZbJBmFe4aEyGBE2jrXjkbHjCDnTvAm5b8c/9MMkHGFS6gqjwjv7S3
 pnMRTW94LTTzzz6V44M3EVyUivPJ30oY35pCH6E4Kb+zFr6fi2Hh/X9vsC2dsePw/8V2
 Gce04QxXda5gIAFtfV7RDp9HOG/ZtFIT8s87CjrKINfyD8f2AoiJqj6LRiZobpXyxONd
 1BJw==
X-Gm-Message-State: AOAM533FctdAbru5Kcr9ABh5WoD9FPk3zqVSL83V9DHgxkG7/YzbZgV3
 VAbpHBDlsZg8PqvST7CQfibr6VdhGMCWFe/puW0=
X-Google-Smtp-Source: ABdhPJw+mh41qwEpjlcl4VTU+EnRMYZ3JjL9t328jmXOy8JGmKC7N9BVOgdpZmexD9GsraUG/k30fOT0J48/uV5g4I8=
X-Received: by 2002:a05:6e02:b2e:: with SMTP id
 e14mr18511929ilu.164.1614079789891; 
 Tue, 23 Feb 2021 03:29:49 -0800 (PST)
MIME-Version: 1.0
References: <CALqm=df_dH41LQfG+X2_qL2z68DPAF9vT=9HGSEbBMWec_zLQA@mail.gmail.com>
 <ef18782e-99d8-8406-152f-46c03bbd3280@redhat.com> <YDTO5yIR1IyxbVZt@work-vm>
 <CALqm=ddLcPh2wUcYTwrf5uXG1Oyakocef449dyQ8NUeb6CY2Ow@mail.gmail.com>
 <948fee76-e315-4155-c665-2379def3cae3@redhat.com>
In-Reply-To: <948fee76-e315-4155-c665-2379def3cae3@redhat.com>
From: Jiatong Shen <yshxxsjt715@gmail.com>
Date: Tue, 23 Feb 2021 19:29:38 +0800
Message-ID: <CALqm=dcgmZ1NWKhnU-qg0mNKpWjxwLKKjKQgGK-+=Qj6ZuGBUw@mail.gmail.com>
Subject: Re: romfile resize
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000084030b05bbff3cb5"
Received-SPF: pass client-ip=2607:f8b0:4864:20::135;
 envelope-from=yshxxsjt715@gmail.com; helo=mail-il1-x135.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 23 Feb 2021 11:52:20 -0500
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
Cc: qemu-devel <qemu-devel@nongnu.org>, "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-discuss@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000084030b05bbff3cb5
Content-Type: text/plain; charset="UTF-8"

alright, thank you very much for the help :)

On Tue, Feb 23, 2021 at 6:23 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 23/02/21 10:57, Jiatong Shen wrote:
> >
> >    Thank you very much for the answer. so if romfile on destination got
> > a larger size than source, why romfile check still does not
> > pass? because dest got enough space to hold romfile.
>
> Because QEMU checks that memory areas have the same size on the source
> and destination.  You're right that it's overly strict, but it's a case
> that has never been an issue before; probably because the ROM size
> should be fixed for each QEMU "machine type", and it's better to have a
> consistent set of ROM files on all your hosts.
>
> You can create a dummy file with the right size, or copy it from the
> source.
>
> Paolo
>
>

-- 

Best Regards,

Jiatong Shen

--00000000000084030b05bbff3cb5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">alright, thank you very much for the help :)</div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 23=
, 2021 at 6:23 PM Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">=
pbonzini@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On 23/02/21 10:57, Jiatong Shen wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 Thank you very much for the answer. so if romfile on dest=
ination got <br>
&gt; a larger size than source, why romfile check still does not<br>
&gt; pass? because dest got enough space to hold romfile.<br>
<br>
Because QEMU checks that memory areas have the same size on the source <br>
and destination.=C2=A0 You&#39;re right that it&#39;s overly strict, but it=
&#39;s a case <br>
that has never been an issue before; probably because the ROM size <br>
should be fixed for each QEMU &quot;machine type&quot;, and it&#39;s better=
 to have a <br>
consistent set of ROM files on all your hosts.<br>
<br>
You can create a dummy file with the right size, or copy it from the source=
.<br>
<br>
Paolo<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr"><br><div>Best Regards,</div><di=
v><br></div><div>Jiatong Shen</div></div></div>

--00000000000084030b05bbff3cb5--

