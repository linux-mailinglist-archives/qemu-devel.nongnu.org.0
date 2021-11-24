Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D212045D0ED
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Nov 2021 00:14:09 +0100 (CET)
Received: from localhost ([::1]:59056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mq1Sq-0006vF-BQ
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 18:14:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60476)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mq1RR-0005tt-Hb
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 18:12:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58035)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mq1RM-000294-9I
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 18:12:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637795555;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=JhYAoUNcKRCbgHwm2F74DYM5C1gvCSR2UFTu13AjExE=;
 b=R94FjTlQZBh4+zf7J6e2hT8a9BndObKGSLUBoV2XP0ClLeMAs5hq2e7pp8UQ0efzpz02Lk
 GGQ/TdCzxxExbQXcgC8iVC5BZMWXDTBXLXqFn6lvub+R0gqQkLorlRQreHueeoglH45Uc1
 rVG6Lz2GsNaeDKFY1TFwsCO/JS/7T4M=
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com
 [209.85.221.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-ViJjsMdFMkiOgr3KnUxMMQ-1; Wed, 24 Nov 2021 18:12:31 -0500
X-MC-Unique: ViJjsMdFMkiOgr3KnUxMMQ-1
Received: by mail-vk1-f198.google.com with SMTP id
 77-20020a1f1950000000b002fec8b725c5so2936768vkz.14
 for <qemu-devel@nongnu.org>; Wed, 24 Nov 2021 15:12:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JhYAoUNcKRCbgHwm2F74DYM5C1gvCSR2UFTu13AjExE=;
 b=N7hxlmEHTE25gw3X0XM7zcsqnbfGf7p565ydkTxp+nUzuG0cQXDOnU7q2ZN8vgHyJl
 AU4wrlWc0VPeqRMRSW26Ud36jILmAVQdid49pJibf1KBxEOXgFdQNgf2P0YHdIwInGpH
 HD/oG2VW1a7jGaa/tkrNXaXQfzFQSIJtXC2cThj42H2GEcWqVrgcp29rQ4Bd9VGPcP1x
 zAyQX4YOCqKK7VP8kncp3Sk6X8kEDeShWRhA6IK3lTrhRToNCXbf2qHsXJBfDadJ7+rV
 KoFeZYOLfBZebIdtC8c10U4dgHLMLwzA7K/NEsyurD6ixMZQMaIG6Am4ojtxZAHP7Cjp
 i54g==
X-Gm-Message-State: AOAM530hoKEt8Z8WT1HOnvZdbvdM1N7EhuEGKKdnJv7PCvTva9TgkmWw
 94WyIRChJI0g3gkaLmD4qN+8z5AgqJBW4LpeqGerkp/DQJbKNQNRc2IFigLXnBYz7XmrFXxtiSE
 Vl3oJ3xKw0ecjC/OwICvOS7Ybza0QAFk=
X-Received: by 2002:a67:d78c:: with SMTP id q12mr1409658vsj.35.1637795551402; 
 Wed, 24 Nov 2021 15:12:31 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxy7qiyawjay4JnMaDgpTT+DRQ9EjO+nz64xPZlOvX8XCuMkjW5l/m70OmyVja/AbdnHEtK4ll3otdWmKrDtUQ=
X-Received: by 2002:a67:d78c:: with SMTP id q12mr1409627vsj.35.1637795551260; 
 Wed, 24 Nov 2021 15:12:31 -0800 (PST)
MIME-Version: 1.0
References: <20211124161536.631563-1-philmd@redhat.com>
In-Reply-To: <20211124161536.631563-1-philmd@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 24 Nov 2021 18:12:20 -0500
Message-ID: <CAFn=p-bBB31Di1XzxqhjKmFNhcBV0Rz+C-4OnrYTHuK7hNRY_A@mail.gmail.com>
Subject: Re: [PATCH v4 0/3] hw/block/fdc: Fix CVE-2021-20196
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000000c493805d190fe8f"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000000c493805d190fe8f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 24, 2021 at 11:15 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat=
.com>
wrote:

> Since v3:
> - Preliminary extract blk_create_empty_drive()
> - qtest checks qtest_check_clang_sanitizer() enabled
> - qtest uses null-co:// driver instead of file
>
> Philippe Mathieu-Daud=C3=A9 (3):
>   hw/block/fdc: Extract blk_create_empty_drive()
>   hw/block/fdc: Kludge missing floppy drive to fix CVE-2021-20196
>   tests/qtest/fdc-test: Add a regression test for CVE-2021-20196
>
>  hw/block/fdc.c         | 23 ++++++++++++++++++++---
>  tests/qtest/fdc-test.c | 38 ++++++++++++++++++++++++++++++++++++++
>  2 files changed, 58 insertions(+), 3 deletions(-)
>
> --
> 2.33.1
>
>
I'm testing this now. I'm going to take your word for it. If Hanna is fine
with the block-layer components of the fix, I'll probably take it, but I
will be sending a patch to remove myself as maintainer in the process,
since I don't have the time to do the "proper fix" for these devices, and
haven't for quite some time.

--js

--0000000000000c493805d190fe8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Nov 24, 2021 at 11:15 AM Phil=
ippe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@red=
hat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">Since v3:<br>
- Preliminary extract blk_create_empty_drive()<br>
- qtest checks qtest_check_clang_sanitizer() enabled<br>
- qtest uses null-co:// driver instead of file<br>
<br>
Philippe Mathieu-Daud=C3=A9 (3):<br>
=C2=A0 hw/block/fdc: Extract blk_create_empty_drive()<br>
=C2=A0 hw/block/fdc: Kludge missing floppy drive to fix CVE-2021-20196<br>
=C2=A0 tests/qtest/fdc-test: Add a regression test for CVE-2021-20196<br>
<br>
=C2=A0hw/block/fdc.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 23 ++++++++++++++++=
++++---<br>
=C2=A0tests/qtest/fdc-test.c | 38 ++++++++++++++++++++++++++++++++++++++<br=
>
=C2=A02 files changed, 58 insertions(+), 3 deletions(-)<br>
<br>
-- <br>
2.33.1<br>
<br></blockquote><div><br></div><div>I&#39;m testing this now. I&#39;m goin=
g to take your word for it. If Hanna is fine with the block-layer component=
s of the fix, I&#39;ll probably take it, but I will be sending a patch to r=
emove myself as maintainer in the process, since I don&#39;t have the time =
to do the &quot;proper fix&quot; for these devices, and haven&#39;t for qui=
te some time.<br><br></div><div> --js<br></div></div></div>

--0000000000000c493805d190fe8f--


