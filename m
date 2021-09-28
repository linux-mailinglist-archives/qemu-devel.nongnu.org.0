Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5B641B56A
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Sep 2021 19:50:58 +0200 (CEST)
Received: from localhost ([::1]:56868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVHFp-0005Gl-1v
	for lists+qemu-devel@lfdr.de; Tue, 28 Sep 2021 13:50:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mVHC2-0001nn-0a
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 13:47:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38054)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mVHC0-0006Pq-Au
 for qemu-devel@nongnu.org; Tue, 28 Sep 2021 13:47:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632851219;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6FYYzPi2rY1cAaLatHs8sqd+GFhdNHRVhmNBoKz4Q8w=;
 b=TQNSCaXd3bHMsvqDQy3xt9MRwSNn3rizGlfrG/B4K1ws06vjsfJxV2w/3QxzNfaOE4/uO3
 GEV8xKIQbm8QM0XnzhqLVCWKKiOOxf82tladpYgoMJ3ccN4ebOxTNUwvhFk+9+ig8cysV7
 tvZj0QPnIaNdlHwITnWi0+5ZfkVHs88=
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com
 [209.85.222.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-ErYl59HvP3qW0JE-KQMdwg-1; Tue, 28 Sep 2021 13:46:57 -0400
X-MC-Unique: ErYl59HvP3qW0JE-KQMdwg-1
Received: by mail-ua1-f72.google.com with SMTP id
 o9-20020ab03769000000b002c96409f0c5so7787039uat.16
 for <qemu-devel@nongnu.org>; Tue, 28 Sep 2021 10:46:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6FYYzPi2rY1cAaLatHs8sqd+GFhdNHRVhmNBoKz4Q8w=;
 b=JxvJSdlfjhxBVzLZQyjj3KCiMBfTJNlGKjGC6o8+fV7C6mRYPpTxTtnaLRShdgac9C
 3n299jymcy1DXkD1WMe0lbwyFcK81J4E+X7Xn4J8iIp8r0XCc6Rd0cu0Try8jQmLu/KS
 O9ZHLcwzksllM4QONqlxtzzfm7R4sC5qZKPOqbWMSKsvRX7ITdWezxbdGpLWKAOk0w1J
 LJwnhfaesSgwv1EW6wvP4FrLqeJ19nvfH2u8vmqlVrd4agHt08XY/WrHkxeXYTY3k5Dx
 4zk2+zFWnQsXH+nEJdQQMnAsdhDfEpPHJ6CDFpIhfYGQ0TTFcgsDg0u/K8U1Kqzs/2Uo
 HRAg==
X-Gm-Message-State: AOAM532eUG6MZ1O9UM+AecNMwReYQN7tftsPM3UG+MoKcT25nYhSUTTz
 DK+60NIzxdc1ezRq+y5qWiSYVaWctJUSqt2OSuD0boUUtXj8VVwyYtglwLdvPvji7QA1CyUr+6B
 JTQPPUo5bN240NQH0mQjSDHLTYL3M/Sc=
X-Received: by 2002:ab0:5684:: with SMTP id a4mr6127274uab.79.1632851217219;
 Tue, 28 Sep 2021 10:46:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz0bH47Dks2yEx5dTHFmA3k2rxlS+JpCqgC1e46tJslyAKaV9FBX+Ntz04IjaQyoHXAAylSSbyCQ3KVaTgxyMQ=
X-Received: by 2002:ab0:5684:: with SMTP id a4mr6127259uab.79.1632851217041;
 Tue, 28 Sep 2021 10:46:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210928135309.199796-1-pbonzini@redhat.com>
In-Reply-To: <20210928135309.199796-1-pbonzini@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 28 Sep 2021 13:46:46 -0400
Message-ID: <CAFn=p-aivdXHB1fKE_s-ZgfZ64UyuOKVxpfzfw=bzWwcA=ts=Q@mail.gmail.com>
Subject: Re: [PATCH 0/3] python: remove socket_scm_helper
To: Paolo Bonzini <pbonzini@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000c360d805cd11cc2b"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
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
Cc: qemu-devel <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000c360d805cd11cc2b
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 28, 2021 at 9:53 AM Paolo Bonzini <pbonzini@redhat.com> wrote:

> I suspect no one has ever looked at socket_scm_helper.c, because when I
> did my reaction was just "why".  The functionality of this 136-line program
> can be reproduced in Python with fewer lines of code than it takes to
> invoke it.  Do it, and let it rest in peace.
>
> The only reason not to do that could be because of the upcoming switch
> to aqmp.  For that, the new send_fd method has to be wrapped to use
> transport.get_extra_info('socket') and loop.run_in_executor.  Let me
> know if you prefer to hold on this until later.
>
> Paolo
>
> Paolo Bonzini (4):
>   python: stop using socket_scm_helper
>   socket_scm_helper: remove
>   python: raise OSError from send_fd_scm
>   python: split the two sides of send_fd_scm
>
>  python/qemu/machine/machine.py         |  58 +++--------
>  python/qemu/machine/qtest.py           |   2 -
>  python/qemu/qmp/__init__.py            |  15 +++
>  tests/Makefile.include                 |   5 +-
>  tests/meson.build                      |   4 -
>  tests/qemu-iotests/045                 |   3 +-
>  tests/qemu-iotests/147                 |   3 +-
>  tests/qemu-iotests/iotests.py          |   3 -
>  tests/qemu-iotests/meson.build         |   5 -
>  tests/qemu-iotests/socket_scm_helper.c | 136 -------------------------
>  tests/qemu-iotests/testenv.py          |   8 +-
>  11 files changed, 35 insertions(+), 207 deletions(-)
>  delete mode 100644 tests/qemu-iotests/meson.build
>  delete mode 100644 tests/qemu-iotests/socket_scm_helper.c
>
> --
> 2.31.1
>

 We discussed this extremely briefly on IRC, but I have some similar
patches already floating around on the list, so I won't be taking these.
Nevertheless, we're in agreement about socket_scm_helper setting sail for
the great beyond!
Any additional cleanups made in these patches I'll just pull into my
ongoing series of Python cleanups and add additional authorship credits.

Thanks!
--js

(For patchew? I don't know if this works. Let's find out:)
NACK

--000000000000c360d805cd11cc2b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 28, 2021 at 9:53 AM Paolo=
 Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I su=
spect no one has ever looked at socket_scm_helper.c, because when I<br>
did my reaction was just &quot;why&quot;.=C2=A0 The functionality of this 1=
36-line program<br>
can be reproduced in Python with fewer lines of code than it takes to<br>
invoke it.=C2=A0 Do it, and let it rest in peace.<br>
<br>
The only reason not to do that could be because of the upcoming switch<br>
to aqmp.=C2=A0 For that, the new send_fd method has to be wrapped to use<br=
>
transport.get_extra_info(&#39;socket&#39;) and loop.run_in_executor.=C2=A0 =
Let me<br>
know if you prefer to hold on this until later.<br>
<br>
Paolo<br>
<br>
Paolo Bonzini (4):<br>
=C2=A0 python: stop using socket_scm_helper<br>
=C2=A0 socket_scm_helper: remove<br>
=C2=A0 python: raise OSError from send_fd_scm<br>
=C2=A0 python: split the two sides of send_fd_scm<br>
<br>
=C2=A0python/qemu/machine/machine.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 58 +++--------<br>
=C2=A0python/qemu/machine/qtest.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
|=C2=A0 =C2=A02 -<br>
=C2=A0python/qemu/qmp/__init__.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
|=C2=A0 15 +++<br>
=C2=A0tests/Makefile.include=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A05 +-<br>
=C2=A0tests/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 -<br>
=C2=A0tests/qemu-iotests/045=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +-<br>
=C2=A0tests/qemu-iotests/147=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A03 +-<br>
=C2=A0tests/qemu-iotests/iotests.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A03 -<br>
=C2=A0tests/qemu-iotests/meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=
=A0 =C2=A05 -<br>
=C2=A0tests/qemu-iotests/socket_scm_helper.c | 136 ------------------------=
-<br>
=C2=A0tests/qemu-iotests/testenv.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A08 +-<br>
=C2=A011 files changed, 35 insertions(+), 207 deletions(-)<br>
=C2=A0delete mode 100644 tests/qemu-iotests/meson.build<br>
=C2=A0delete mode 100644 tests/qemu-iotests/socket_scm_helper.c<br>
<br>
-- <br>
2.31.1<br></blockquote><div><br></div><div>=C2=A0We discussed this extremel=
y briefly on IRC, but I have some similar patches already floating around o=
n the list, so I won&#39;t be taking these. Nevertheless, we&#39;re in agre=
ement about socket_scm_helper setting sail for the great beyond!<br></div><=
div>Any additional cleanups made in these patches I&#39;ll just pull into m=
y ongoing series of Python cleanups and add additional authorship credits.<=
/div><div><br></div><div>Thanks!</div><div>--js</div><div><br></div><div>(F=
or patchew? I don&#39;t know if this works. Let&#39;s find out:)<br></div><=
div>NACK</div><div><br></div></div></div>

--000000000000c360d805cd11cc2b--


