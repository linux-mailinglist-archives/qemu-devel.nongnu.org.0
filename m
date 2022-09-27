Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EBDE5ED0D2
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 01:11:57 +0200 (CEST)
Received: from localhost ([::1]:60780 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odJk4-0002Ga-7x
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 19:11:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odJil-0000v8-Hv
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 19:10:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:36600)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odJii-0003g9-0R
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 19:10:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664320230;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=K2JYcgv5xOxxafrVuaBtd3NT6vZeblcsukh9rEz9Q9A=;
 b=iYVPhrhhaNPnCyfwDpzGIqjaNyu32TgKGufHVEHCSjapcdXJ7iZqoYDb7atIC9FBJl5U6l
 SIxX1PB+qDQsWEZhhSg451uawsUAdwen8oqv3zsNLRNpJwU93auK1UNsku/7KTju/V7ucf
 Iu1FOBTx/w9FBIFBhDwIw3GTuirra9c=
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-507-YSKXTeJiMnWJ-xhXYokE9w-1; Tue, 27 Sep 2022 19:10:28 -0400
X-MC-Unique: YSKXTeJiMnWJ-xhXYokE9w-1
Received: by mail-vs1-f72.google.com with SMTP id
 i186-20020a6722c3000000b0039e78fd2daeso1999232vsi.11
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 16:10:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=K2JYcgv5xOxxafrVuaBtd3NT6vZeblcsukh9rEz9Q9A=;
 b=OjsjRdM+6Du5GFbWSrSfeCc8DF/MOc/c/5q62YVRbkdnoifMG9pmgy5B9yRk5IS75F
 Kuw5DMuTJDZnj7WHMyxDYLkubFbwZnZvVQF3gWRDghAIxeyHIsPKwBPIc0gVdsVPQyxd
 kzc0108Z7b/roZRGB2LhCY8AROrt2/ec5QCfikBv0Cq45aWfb8nZdc52BGanw/Exuknh
 gI9hiMjNK7oFDD3RHP0DaFmYltwYQKgvKYTxylzrWRBroOYbDWC+cCijL+uR3oQC4IRZ
 CagXeUEVuvsWpR4yFEfaF5IxDIFy1O0+l0lRkIhCaZoyBdbMY9pXn/UEEThQU4ZkodgL
 f2Kg==
X-Gm-Message-State: ACrzQf2lO7hZHOStRJlo+kkSOr1pJGDSTPKuSAOHallu0L/64OGq2YQz
 vH1uvIY4C04w9ExA0rqrrn4q8QV+Nd7KkIRN1DiLwal6g7kh8hBu6GwHq+JrjQDHl3wwKiXwS2a
 w/bA/VM+FSDwK6xfRENyouEw779q2zA4=
X-Received: by 2002:a67:fc44:0:b0:398:30ac:1c95 with SMTP id
 p4-20020a67fc44000000b0039830ac1c95mr12640157vsq.16.1664320227992; 
 Tue, 27 Sep 2022 16:10:27 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4AyhihLpOvoHu3DXWCWfNiQJBf/36pNDJaBtrgl4uSGWSnnsQAhyiG0RchGQwYrzHOys/364RWKUPZAWDOSFE=
X-Received: by 2002:a67:fc44:0:b0:398:30ac:1c95 with SMTP id
 p4-20020a67fc44000000b0039830ac1c95mr12640150vsq.16.1664320227801; Tue, 27
 Sep 2022 16:10:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220710170014.1673480-1-ani@anisinha.ca>
 <20220710170014.1673480-8-ani@anisinha.ca>
 <CABgObfYW8O-JGhjLm47HmHG7WRhOQDO1EhUCTP59TZo4DnkQVg@mail.gmail.com>
 <20220927175440-mutt-send-email-mst@kernel.org>
In-Reply-To: <20220927175440-mutt-send-email-mst@kernel.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 28 Sep 2022 01:10:15 +0200
Message-ID: <CABgObfYv=-CwuxgjfPHeZ-yJMu0HFM=GSjkMSuvvVLtbQCEbHQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] acpi/tests/bits: add python test that exercizes
 QEMU bios tables using biosbits
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Ani Sinha <ani@anisinha.ca>, qemu-devel <qemu-devel@nongnu.org>, 
 Thomas Huth <thuth@redhat.com>, "Maydell, Peter" <peter.maydell@linaro.org>, 
 "P. Berrange, Daniel" <berrange@redhat.com>, John Snow <jsnow@redhat.com>, 
 "Mammedov, Igor" <imammedo@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f8921905e9b0bf12"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000f8921905e9b0bf12
Content-Type: text/plain; charset="UTF-8"

Il mer 28 set 2022, 00:09 Michael S. Tsirkin <mst@redhat.com> ha scritto:

> On Tue, Sep 27, 2022 at 11:44:56PM +0200, Paolo Bonzini wrote:
> > I also second the idea of using avocado instead of pytest, by the way.
> >
> > Paolo
>
> I do not think this is a good fit for bios tests.
> bios tests are intended for a wide audience of ACPI developers
> across a variety of host systems. They basically do not need anything
> from the host and they need to be super easy to configure
> since we have lots of drive through contributors.
>

The setup would be the same, with avocado installed in a virtual
environment via pip. It doesn't need to be set up outside, neither with
distro packages nor in ~/.local, and especially it is not necessary to deal
with avocado-vt.

Paolo

--000000000000f8921905e9b0bf12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il mer 28 set 2022, 00:09 Michael S. Tsirkin &lt;<a hr=
ef=3D"mailto:mst@redhat.com">mst@redhat.com</a>&gt; ha scritto:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px =
#ccc solid;padding-left:1ex">On Tue, Sep 27, 2022 at 11:44:56PM +0200, Paol=
o Bonzini wrote:<br>
&gt; I also second the idea of using avocado instead of pytest, by the way.=
<br>
&gt; <br>
&gt; Paolo<br>
<br>
I do not think this is a good fit for bios tests.<br>
bios tests are intended for a wide audience of ACPI developers<br>
across a variety of host systems. They basically do not need anything<br>
from the host and they need to be super easy to configure<br>
since we have lots of drive through contributors.<br></blockquote></div></d=
iv><div dir=3D"auto"><br></div><div dir=3D"auto">The setup would be the sam=
e, with avocado installed in a virtual environment via pip. It doesn&#39;t =
need to be set up outside, neither with distro packages nor in ~/.local, an=
d especially it is not necessary to deal with avocado-vt.</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Paolo</div></div>

--000000000000f8921905e9b0bf12--


