Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCE348BB7C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 00:36:28 +0100 (CET)
Received: from localhost ([::1]:48270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7Qgl-0007Cv-IC
	for lists+qemu-devel@lfdr.de; Tue, 11 Jan 2022 18:36:27 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n7Qf6-0006SX-6w
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 18:34:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43400)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1n7Qf0-0005gD-Sl
 for qemu-devel@nongnu.org; Tue, 11 Jan 2022 18:34:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1641944073;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=L3tKAS8+AF5sbaIb6UCHiuukqgkGSIIZfmeLmGIXBbY=;
 b=grqoGmwd0terbPKuZeColhXTKsH+WK3rnmwoijQSTHC2ejXyfwgfysMfCY6alSMhRmhdwp
 Rq2bvjX4586FmtWdei6D5L3NhjvvWT1nNn2+OUQQuJY2cyA4cZgwvilc16TPqhlr6gLG8P
 SKhtcdcbxa+Uk57kECIOANFHILw4aEY=
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com
 [209.85.222.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-119-4goIB0F2PhSn4DC5HUzKyg-1; Tue, 11 Jan 2022 18:34:31 -0500
X-MC-Unique: 4goIB0F2PhSn4DC5HUzKyg-1
Received: by mail-ua1-f71.google.com with SMTP id
 e22-20020ab031d6000000b0030525c25702so507111uan.6
 for <qemu-devel@nongnu.org>; Tue, 11 Jan 2022 15:34:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=L3tKAS8+AF5sbaIb6UCHiuukqgkGSIIZfmeLmGIXBbY=;
 b=n9kANONzbj4pgjnl8HQq3ZTirCDR+kP4VH51TmvEVW+izhngNPLQhE37XbhVoz+Eai
 syaVBSra+XbkbRDkNOtH8FQP1Z3HPhg3r6On3zikDG2UTDiUAsG4Dw6vTBd56Tl20GdU
 Uvsn3BF6cJ7IWWIKNEv9oG/0LFm54uGh6IvrSMqvOZ/9UWR9rLau64A8RPDs7hdt5bUD
 1wnj2WV4mWD7IAI11Z/FHRE+9qCNMJ5T+mgk/J/vwFkVD8MWgRcPFwZLusNWNubvkZ1i
 g4Dx+7r14IQVtT9xEuHarrD6WUDr35jd9xj5cGTdD2uYmO0yg0Agfq5Zv8bGAqdX28Yf
 0H7w==
X-Gm-Message-State: AOAM531xrd8VVYfk7dYtn8oJ1cnCGb6HedHfQ0OoWDNI176dHrJtxkvg
 ih9gJlbBm/6HTy2Ej4nSxqNptRM/G2wKDjjyoSa2ybFXIum7Lbsu9pMhpPQGgWyyh2T3RN9RI7A
 yEOsbLmDqOfGPvRZB88kMAWjsSFSshNA=
X-Received: by 2002:ab0:15c5:: with SMTP id j5mr3178959uae.128.1641944071044; 
 Tue, 11 Jan 2022 15:34:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIRxau40AMQnJuIsqZgfCDpv4D/nxOE5g0IiGs7rgG2FM4CfJeSlvpjBvTZpgesB6f6WTCEvpf94Ox8GmqWXM=
X-Received: by 2002:ab0:15c5:: with SMTP id j5mr3178953uae.128.1641944070850; 
 Tue, 11 Jan 2022 15:34:30 -0800 (PST)
MIME-Version: 1.0
References: <9d84ab18-72a6-4913-4c56-ffd02ff386ed@redhat.com>
 <4e54ef7d-ac0a-e2b2-faee-fddeaeac422b@redhat.com>
In-Reply-To: <4e54ef7d-ac0a-e2b2-faee-fddeaeac422b@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 11 Jan 2022 18:34:20 -0500
Message-ID: <CAFn=p-Zhab9KT050opxOWbvsBGR3+nx-1Xgm-rEJ11KnvttW4w@mail.gmail.com>
Subject: Re: test_isa_retry_flush() in ide-test.c
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000015a16c05d556e525"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.595,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000015a16c05d556e525
Content-Type: text/plain; charset="UTF-8"

On Fri, Jan 7, 2022, 12:27 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 1/7/22 17:01, Thomas Huth wrote:
> >   Hi John!
> >
> > I just notice that test_isa_retry_flush() is not doing anything useful
> > anymore: It likely was supposed to run the test_retry_flush() function
> > with the "isapc" machine type, but actually test_retry_flush() ignores
> > the machine option parameter completely and always uses PCI accessor
> > functions nowadays (since commit 9c268f8ae84ae186).
> > Question is: Is it worth the effort to try to restore the original
> > intended behavior for the ISA test here, or shall we rather simply
> > remove it instead to save some testing cycles?
>
> The right way to fix it would be to use qgraph.  Second best option is
> to nuke it, because the conversion to qgraph would give the test back
> for free without writing more code.
>
> Paolo
>
>
Uh, nuke it. I think maybe this never worked correctly ...?

I'm looking at baca2b9e3a94be1690fc4a842a97b64a4c8f892c and it doesn't look
like I ever routed the const char *machine to go anywhere ... ? Maybe it
was a mis-merge or just a thinko, but I think you're safe to just destroy
it...

--js

--00000000000015a16c05d556e525
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div><br><div class=3D"gmail_quote"><div=
 dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 7, 2022, 12:27 PM Paolo Bonzi=
ni &lt;<a href=3D"mailto:pbonzini@redhat.com" target=3D"_blank">pbonzini@re=
dhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">On 1/7/22 17:01, Thomas Huth wrote:<br>
&gt;=C2=A0 =C2=A0Hi John!<br>
&gt; <br>
&gt; I just notice that test_isa_retry_flush() is not doing anything useful=
 <br>
&gt; anymore: It likely was supposed to run the test_retry_flush() function=
 <br>
&gt; with the &quot;isapc&quot; machine type, but actually test_retry_flush=
() ignores <br>
&gt; the machine option parameter completely and always uses PCI accessor <=
br>
&gt; functions nowadays (since commit 9c268f8ae84ae186).<br>
&gt; Question is: Is it worth the effort to try to restore the original <br=
>
&gt; intended behavior for the ISA test here, or shall we rather simply <br=
>
&gt; remove it instead to save some testing cycles?<br>
<br>
The right way to fix it would be to use qgraph.=C2=A0 Second best option is=
 <br>
to nuke it, because the conversion to qgraph would give the test back <br>
for free without writing more code.<br>
<br>
Paolo<br>
<br></blockquote><div><br></div><div><div dir=3D"auto">Uh, nuke it. I think=
 maybe this never worked correctly ...?</div><div dir=3D"auto"><br></div><d=
iv>I&#39;m
 looking at baca2b9e3a94be1690fc4a842a97b64a4c8f892c and it doesn&#39;t loo=
k
 like I ever routed the const char *machine to go anywhere ... ? Maybe=20
it was a mis-merge or just a thinko, but I think you&#39;re safe to just=20
destroy it...</div><div><br></div><div>--js</div>=C2=A0</div></div>
</div>

--00000000000015a16c05d556e525--


