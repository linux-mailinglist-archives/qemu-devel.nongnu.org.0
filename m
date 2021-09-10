Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF1B4071C0
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Sep 2021 21:11:44 +0200 (CEST)
Received: from localhost ([::1]:46180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOlw7-0006ll-K3
	for lists+qemu-devel@lfdr.de; Fri, 10 Sep 2021 15:11:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mOlvC-00064e-Rx
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 15:10:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mOlv9-0000hT-0Z
 for qemu-devel@nongnu.org; Fri, 10 Sep 2021 15:10:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631301041;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i1XBP+7vhxoC2PiussOvmzQ6K1/IWYuiPa72043q8ek=;
 b=EJo+MEA6HEQ20JoHz9HF5zyyWg7qKBCoD4Tjy3kFst1RkIRaZd5dKtOTKGByK2QyoU+A6E
 6zx0Wv3uN14TXrnFLZNl2r+6fwfXB11t3HAzVEx2+uE8e2RosWfmrVA2hAOLILb6SviWRJ
 JtgQj+OaKPCgr2bmGehkiz7ZVvXst9Q=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-rOHb4mpKOnm-tOtGb4SHrg-1; Fri, 10 Sep 2021 15:10:35 -0400
X-MC-Unique: rOHb4mpKOnm-tOtGb4SHrg-1
Received: by mail-pj1-f69.google.com with SMTP id
 v9-20020a17090a778900b001883abeabf0so2410390pjk.1
 for <qemu-devel@nongnu.org>; Fri, 10 Sep 2021 12:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=i1XBP+7vhxoC2PiussOvmzQ6K1/IWYuiPa72043q8ek=;
 b=tsrHC7G42uWbfyXQ8Np6W5S1gAdzoDILhP3oXd0OQWqeCkpK1YbyBrMCH+qoRWh3wL
 4eILFpPGF6GWEvuXuO9DT2JhwBx/cNfFjChD/t/Ivscfx8fvU6tvKvPvOovhhBzHkvqd
 sS+xUXXH03Z4v28ZfwWFr/JH7ai9TqcsdTpaM4VbvMj0DbTq3myZvMH5+STks8HtRTMH
 RlRC/jv2wVhXTZZaFWZjvEh5qkdDttlH/0l0ulTjp5sWyHX78/kgFwqZ5jCgKiaWgTkj
 5LhWmtjB6YHYdEh1qEOtQ6kPihDcTsFbAUyksWMqa2mxAuN23YhCfCfL0OvmuUGI96lP
 E6xw==
X-Gm-Message-State: AOAM533wapxgJNE0NADY8xJjJVribbusP20X/YCr4utUXzVxEmCXXjF/
 fvHL8rSW/V6Qqu53mBb+hSSKDUiHzbgbTVXf2b+44R8cAfeAzEu1BRF66zE3es8LsB2mqh8FWJf
 rb70fK2q5Y1k8Va+zFS9stqoVjgDFU+Y=
X-Received: by 2002:a17:90b:4f8e:: with SMTP id
 qe14mr11177805pjb.122.1631301033753; 
 Fri, 10 Sep 2021 12:10:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3DGRKKU8eO6xgEre4fEmj/CkH2AtsPXDR0qs/FftG1Ex4766YS0/Sd0BJQ9f7wMTOzjsV7AnzCwAWlRGP6tc=
X-Received: by 2002:a17:90b:4f8e:: with SMTP id
 qe14mr11177773pjb.122.1631301033393; 
 Fri, 10 Sep 2021 12:10:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210910102258.46648-1-yang.zhong@intel.com>
 <91c0fa12-1191-ddae-efb4-35dc1eb61d39@redhat.com>
 <YTtqAUAyFR3ENdsY@redhat.com>
In-Reply-To: <YTtqAUAyFR3ENdsY@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Fri, 10 Sep 2021 21:10:21 +0200
Message-ID: <CABgObfZoJmNJQq9u_tCTLvQVGaje_59vei=92_Dv1L=mo4EpBg@mail.gmail.com>
Subject: Re: [PATCH v2 0/3] The HMP/QMP interfaces in Qemu SGX
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000009e149705cba8de4c"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.392,
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
Cc: Yang Zhong <yang.zhong@intel.com>,
 Philippe Mathieu Daude <philmd@redhat.com>, "Blake, Eric" <eblake@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Sean Christopherson <seanjc@google.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000009e149705cba8de4c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il ven 10 set 2021, 16:22 Daniel P. Berrang=C3=A9 <berrange@redhat.com> ha
scritto:

> > Queued 1-2, thanks.
>
> I had just posted a bunch of comments on patch 1 ...
>

Sorry, I had already queued it a few hours earlier and just noticed I
hadn't sent out the message.

I have some updates to the main series too, so I might just pick up your
suggestions and send out everything next week or on Sunday.

Paolo


>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>

--0000000000009e149705cba8de4c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il ven 10 set 2021, 16:22 Daniel P. Berrang=C3=A9 &lt;=
<a href=3D"mailto:berrange@redhat.com">berrange@redhat.com</a>&gt; ha scrit=
to:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">&gt; Queued 1-2, thanks.<br>
<br>
I had just posted a bunch of comments on patch 1 ...<br></blockquote></div>=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">Sorry, I had already qu=
eued it a few hours earlier and just noticed I hadn&#39;t sent out the mess=
age.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I have some updates=
 to the main series too, so I might just pick up your suggestions and send =
out everything next week or on Sunday.</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
<br>
Regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer noreferrer" target=3D=
"_blank">https://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a h=
ref=3D"https://www.flickr.com/photos/dberrange" rel=3D"noreferrer noreferre=
r" target=3D"_blank">https://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer noreferrer" target=3D"=
_blank">https://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com=
" rel=3D"noreferrer noreferrer" target=3D"_blank">https://fstop138.berrange=
.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer noreferrer" tar=
get=3D"_blank">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0=
 <a href=3D"https://www.instagram.com/dberrange" rel=3D"noreferrer noreferr=
er" target=3D"_blank">https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div></div></div>

--0000000000009e149705cba8de4c--


