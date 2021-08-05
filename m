Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A5853E17CB
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Aug 2021 17:21:55 +0200 (CEST)
Received: from localhost ([::1]:51778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mBfBx-000880-S4
	for lists+qemu-devel@lfdr.de; Thu, 05 Aug 2021 11:21:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43394)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mBfAh-0007Rx-6F
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 11:20:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47436)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mBfAf-0000hB-2p
 for qemu-devel@nongnu.org; Thu, 05 Aug 2021 11:20:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628176831;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9iWBc2UoUYu/D6SbFUOGTsq4ybqYcyHW1g+/HJf0lRw=;
 b=UjMvzq2Fc1+QnNvuVIxxm4pyuNRnCYhlRQ+noAF87RIe1bgFYwY+BIcMHls6lbUTm4xRL/
 Y5u/+1BuiWJIVuk+273nvV9ylqZB+OM55p7TgUjkGJVpJ2w/Png3rjb6ik77BcnL8npfla
 gNER1z/kWyLuBLmW5T2MV9revnqQWeU=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-yXMzLaBNNeinZhOFKAFuyg-1; Thu, 05 Aug 2021 11:20:29 -0400
X-MC-Unique: yXMzLaBNNeinZhOFKAFuyg-1
Received: by mail-oi1-f198.google.com with SMTP id
 i16-20020a0568080310b029025cd3c0e2bdso2913741oie.1
 for <qemu-devel@nongnu.org>; Thu, 05 Aug 2021 08:20:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9iWBc2UoUYu/D6SbFUOGTsq4ybqYcyHW1g+/HJf0lRw=;
 b=HIpcfLgeVYSqpRkMX/TrJQeHsz6AkILGoLX9P+l9geTjcJVVaBZgu4Uv1oItUSJlXu
 2aKNsUcsRrwUNYa7EpdzmFwhMaUeQh14U1AYbWqkPQPOL+d1wj25CpDrSmkW2Wd1Sb4j
 8SXvf21KEp+aKT2t+MZRCOu4KtID5PB2idyLyvTEllwSA7O46y5TPUXBFNZIcbG5iBer
 DcevmfWVMjwA3qpJaQr+4oRvsF8CVeOksXWnLCLkwrKRn+JvApG3U4TSCtTNZHz1VdVq
 /CBv3HgJdaJ8Ds4Hcz0xJuFDz0sMjmq3GbJgLI1My9wwst0NGILiUok5SGIlJNVve2rr
 9VIA==
X-Gm-Message-State: AOAM530OTIPgZ+9+Qr5Bd6WztSOKqb+UvFLXaK3ij2Fel5ql9whwGzxy
 JgEJ4UKmwjsnGKEvdt/wT79So0z1V/Y166QsyEFTEFZrbGoJh99I/W77QHvrWmGObPxyrbzEWVj
 xxNJe/5HlPcFN/5cDPV2RIgtjNX+COQo=
X-Received: by 2002:a54:489a:: with SMTP id r26mr4074521oic.168.1628176829283; 
 Thu, 05 Aug 2021 08:20:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqogFe9tuAuZV1EJb0IYPZHOVIYbm0hPUxFNk/eHeqhwrHKnsDRUcI2PKX4YXiMm0HEK745wBd0e/ER4NLDdc=
X-Received: by 2002:a54:489a:: with SMTP id r26mr4074514oic.168.1628176829160; 
 Thu, 05 Aug 2021 08:20:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210804005621.1577302-1-jsnow@redhat.com>
 <20210804005621.1577302-5-jsnow@redhat.com>
 <87czqsks8o.fsf@linaro.org>
In-Reply-To: <87czqsks8o.fsf@linaro.org>
From: John Snow <jsnow@redhat.com>
Date: Thu, 5 Aug 2021 11:20:16 -0400
Message-ID: <CAFn=p-bmyGw3dML67kagdkH8nc5R1DwQtpFB5d3-9BVD6Jv9dQ@mail.gmail.com>
Subject: Re: [PATCH 4/6] docs/devel: create TCG subsection
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000088b16405c8d175aa"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000088b16405c8d175aa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 5, 2021 at 8:09 AM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:

>
> John Snow <jsnow@redhat.com> writes:
>
> > Signed-off-by: John Snow <jsnow@redhat.com>
>
> modulo Peter's comments re decodetree:
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
>
> --
> Alex Benn=C3=A9e
>
>
OK, I'm making that change. Thanks!

--js

--00000000000088b16405c8d175aa
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Aug 5, 2021 at 8:09 AM Alex B=
enn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.bennee@linaro=
.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex"><br>
John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"_blank">jsnow@r=
edhat.com</a>&gt; writes:<br>
<br>
&gt; Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" targe=
t=3D"_blank">jsnow@redhat.com</a>&gt;<br>
<br>
modulo Peter&#39;s comments re decodetree:<br>
<br>
Reviewed-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org"=
 target=3D"_blank">alex.bennee@linaro.org</a>&gt;<br>
<br>
-- <br>
Alex Benn=C3=A9e<br>
<br></blockquote><div><br></div><div>OK, I&#39;m making that change. Thanks=
!</div><div><br></div><div>--js<br></div></div></div>

--00000000000088b16405c8d175aa--


