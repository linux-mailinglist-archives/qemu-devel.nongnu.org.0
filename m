Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1436C3FC824
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 15:22:54 +0200 (CEST)
Received: from localhost ([::1]:37662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL3j3-0006HE-6I
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 09:22:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mL3Cj-0000Vf-LY
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:49:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35152)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1mL3Ch-0000tn-Hd
 for qemu-devel@nongnu.org; Tue, 31 Aug 2021 08:49:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1630414166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gcaC7MEv0aOAszF35+VEpyEBluOx661c08MIsuY5SIc=;
 b=ACpuv3u/9CAKNKpCo2jrKlHoxOZbW9A7XvDu3gvUFdXcP+mR7Eh/IKlZU0DeJY8ZlzgRvZ
 J+1k0krtfnopO8hff3ygvOwdtagDJD0L6AxJaozq1n3xWo9ORqdGH0RHBFme8eGuwWZXFt
 H4nKEMvYriIMKLkjlb9sEXoLJJj76Vc=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-560-XnjwcwMzOhu4gl8XYt6Lkw-1; Tue, 31 Aug 2021 08:49:24 -0400
X-MC-Unique: XnjwcwMzOhu4gl8XYt6Lkw-1
Received: by mail-pl1-f199.google.com with SMTP id
 u1-20020a17090282c100b00138f7f7a49dso10902plz.6
 for <qemu-devel@nongnu.org>; Tue, 31 Aug 2021 05:49:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gcaC7MEv0aOAszF35+VEpyEBluOx661c08MIsuY5SIc=;
 b=Y2cTub9/cXJ7QasEO2vPTtniNJmV4rpdq7rPunbiGAPPvYQbawr+Zyw74ljx4V5P2V
 v8V20ALKHrnfFtRcV2DMgZiIUv9ApBpUX2Aqhs8CZrxCmbXiRQzM4OAeLIfF9gh1fgAZ
 9yRvp0+wKnrnRIPUS8WLh6VHNp2ZOuAenhy9kKTlxPI6WzIirzoeaoNWAyX90QkNONfr
 jko2RVeMZi+ZeIGitwK+XWlmI+RFer954PDrBcpWgdVau1Ui71WsdaPJjIfkRxu6ajt+
 VNBo556MsUrydGEjtiOariUWll+qJr8lfb8e6LQ6HiYomOiKaKDHRqYZsLkEK8SHpV7Q
 1eqw==
X-Gm-Message-State: AOAM53345pQeFnj+dubd140u3UdPIZm7mX3ahpliRb3G+yQ6+Xlx5YjH
 w/U2PrnTAJ65guWNixZsOcDyFSKaqCHtqrQy6VXnCbqovEtvxfBTW5bW0lvr1jG6syokjtLWZsm
 EMdLJ4Dy2OPzPIEarCvCh4c+doilT3cM=
X-Received: by 2002:a17:90a:7d11:: with SMTP id
 g17mr5269453pjl.150.1630414163263; 
 Tue, 31 Aug 2021 05:49:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxnMep0Qw7mh1hrk7G4lAt5ceC+1VukEIncJaibe2Hq0G6tnYFqc1nHeX2p5r1sjWjlfm5c89D7zAALhxBfBBc=
X-Received: by 2002:a17:90a:7d11:: with SMTP id
 g17mr5269422pjl.150.1630414162897; 
 Tue, 31 Aug 2021 05:49:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210829173210.39562-1-thuth@redhat.com>
 <CAMxuvawhwnwWRXAZOJj3SbtHXE8kC89=pHR+2-TD7ByLzoC_Pw@mail.gmail.com>
 <48ccdd11-5836-5886-f928-95c960fb810a@redhat.com>
In-Reply-To: <48ccdd11-5836-5886-f928-95c960fb810a@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Tue, 31 Aug 2021 14:49:11 +0200
Message-ID: <CABgObfaYTGc8NZifmkWj2SWgcyC47LeiNRchVyEXd9mMQtQiZA@mail.gmail.com>
Subject: Re: [PATCH 0/3] Use meson_options.txt in the configure script
To: Thomas Huth <thuth@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000004431405cada6112"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
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
Cc: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000004431405cada6112
Content-Type: text/plain; charset="UTF-8"

Il lun 30 ago 2021, 07:11 Thomas Huth <thuth@redhat.com> ha scritto:

> Paolo, why did your patch get stalled?


It just wasn't worthwhile at the time given how few meson options were
there. I missed 6.1 and was going to send it out again for 6.2.

The reason for using Perl was because there's no guarantee of knowing the
path to the Python interpreter until after --python is parsed, so there
would be a risk of not being able to give a full help. I don't like Perl
very much, but the difference in obscurity between Perl and Eric-level sh
is small. :)

Paolo

... my way of parsing is certainly
> way more fragile, but it's less complicated and seems to work as long as
> all
> the options are written in the same way in meson_options.txt (e.g. as long
> as nobody tries to use multi-line descriptions of the options there
> etc.)...
> so maybe if the additional Perl script was too much, this could be a good
> compromise?
>
>   Thomas
>
>

--00000000000004431405cada6112
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il lun 30 ago 2021, 07:11 Thomas Huth &lt;<a href=3D"m=
ailto:thuth@redhat.com">thuth@redhat.com</a>&gt; ha scritto:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">Paolo, why did your patch get stalled?</blockquot=
e></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">It just wasn&#3=
9;t worthwhile at the time given how few meson options were there. I missed=
 6.1 and was going to send it out again for 6.2.</div><div dir=3D"auto"><br=
></div><div dir=3D"auto">The reason for using Perl was because there&#39;s =
no guarantee of knowing the path to the Python interpreter until after --py=
thon is parsed, so there would be a risk of not being able to give a full h=
elp. I don&#39;t like Perl very much, but the difference in obscurity betwe=
en Perl and Eric-level sh is small. :)</div><div dir=3D"auto"><br></div><di=
v dir=3D"auto">Paolo</div><div dir=3D"auto"><br></div><div dir=3D"auto"><di=
v class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"> ... my way of parsi=
ng is certainly <br>
way more fragile, but it&#39;s less complicated and seems to work as long a=
s all <br>
the options are written in the same way in meson_options.txt (e.g. as long =
<br>
as nobody tries to use multi-line descriptions of the options there etc.)..=
. <br>
so maybe if the additional Perl script was too much, this could be a good <=
br>
compromise?<br>
<br>
=C2=A0 Thomas<br>
<br>
</blockquote></div></div></div>

--00000000000004431405cada6112--


