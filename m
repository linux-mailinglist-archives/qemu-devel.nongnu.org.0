Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA4B943B6FB
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 18:19:15 +0200 (CEST)
Received: from localhost ([::1]:51188 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfPAQ-0006rL-TJ
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 12:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfP0z-00044y-8l
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:09:29 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49721)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mfP0x-0005h4-5N
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:09:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635264566;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PAPMDihZW5bRCjGpFhAQgtPfywXUPobk2P77VKbbT60=;
 b=TAKtAghxBsOjtjOk6uyT+JyDG3EDn3xqamH7L2RmtMo2AbSwNxiQZDGmeUGGH+5VsW8Rvx
 g3qNE9IbAVqqkCdTSWaP6VtJNkXaXKCu7XnHgVLHiUgZJn2gOdhXMspQrO8bVYpmGzEMO0
 lG0Pa1trD+qcp4yfn07F1sT+z2NuyTA=
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com
 [209.85.222.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-179-ZBPB5yy8MKubXpd-T_Mnww-1; Tue, 26 Oct 2021 12:09:24 -0400
X-MC-Unique: ZBPB5yy8MKubXpd-T_Mnww-1
Received: by mail-ua1-f69.google.com with SMTP id
 60-20020a9f23c2000000b002cb6cb64439so6689541uao.5
 for <qemu-devel@nongnu.org>; Tue, 26 Oct 2021 09:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PAPMDihZW5bRCjGpFhAQgtPfywXUPobk2P77VKbbT60=;
 b=5vamo2be13kO+jWBd7T2b1U+IQxYeUeF3H7I93wF1ykYM2Um7nUZGQycQS1AsDzWlq
 ePh0bGilWaM7Ced0YDwYDYwuZnpvZ4s7B/p89Kaa2pnIgrmcDNXmtmAsjzmVfYbawZhS
 GD1pORaDrFXuGlm2NkTAZLjBby7GXsb6GvGmJlRlLn2nahN4xZiDCZ6Buc032LX/xcbq
 xN2DVM6A0lhGT/5+ujXpr7Jzuo94oMA8/QjTq6WXiY1RrA4AattQCSLKyMsU9uUnYzDT
 N4fYzxuQKWmJXEM3eIpqEVgpThKhWrk425E0aw0hyFY8QLjrnv4fcinR1RP5KMnrPgky
 fktw==
X-Gm-Message-State: AOAM5305QfCiBaS7HafYdPx+verSe3xLv8lE3nv05lNbzosaP3ylSmwd
 IuawbDRtB904NDqsITi+nH5OYQwsSjNtZHFbTekvHAlmdoHFwaoKh/UwYbdDfNMHMszDl2Sy3CM
 yVH20KKxw8xKyFxsMtuNHjq4SxmwYfHQ=
X-Received: by 2002:a67:f685:: with SMTP id n5mr24031514vso.31.1635264563978; 
 Tue, 26 Oct 2021 09:09:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwJ7d8BrEDP/4yFxk4whQk8FrwqzrGF9eXF3ulS/CjOcd+7fo49mnG0IlXlRNJdQjCpAAy99RdkjQzh8TICn70=
X-Received: by 2002:a67:f685:: with SMTP id n5mr24031472vso.31.1635264563637; 
 Tue, 26 Oct 2021 09:09:23 -0700 (PDT)
MIME-Version: 1.0
References: <20211026111023.76937-1-armbru@redhat.com>
 <20211026111023.76937-2-armbru@redhat.com>
In-Reply-To: <20211026111023.76937-2-armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Tue, 26 Oct 2021 12:09:12 -0400
Message-ID: <CAFn=p-aeUyaaomFkc_WjK-7FkzbvzNgwgs1FDsibeOuOBNt1dw@mail.gmail.com>
Subject: Re: [PATCH 1/2] docs/devel/qapi-code-gen: Drop a duplicate paragraph
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000006e01d005cf43b3bc"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
 Eric Blake <eblake@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006e01d005cf43b3bc
Content-Type: text/plain; charset="UTF-8"

On Tue, Oct 26, 2021 at 7:10 AM Markus Armbruster <armbru@redhat.com> wrote:

> Commit 55ec69f8b1 "docs/devel/qapi-code-gen.txt: Update to new rST
> backend conventions" accidentally duplicated a paragraph.  Drop it.
>
>
Fixes: 55ec69f8b1
.... well, on second thought, that backport would have to go backwards
through a ReST conversion, so ... maybe not. Nevermind.


> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>

Reviewed-by: John Snow <jsnow@redhat.com>


> ---
>  docs/devel/qapi-code-gen.rst | 6 ------
>  1 file changed, 6 deletions(-)
>
> diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst
> index b2569de486..1f6805a705 100644
> --- a/docs/devel/qapi-code-gen.rst
> +++ b/docs/devel/qapi-code-gen.rst
> @@ -993,12 +993,6 @@ multiline argument descriptions.
>  A 'Since: x.y.z' tagged section lists the release that introduced the
>  definition.
>
> -The text of a section can start on a new line, in
> -which case it must not be indented at all.  It can also start
> -on the same line as the 'Note:', 'Returns:', etc tag.  In this
> -case if it spans multiple lines then second and subsequent
> -lines must be indented to match the first.
> -
>  An 'Example' or 'Examples' section is automatically rendered
>  entirely as literal fixed-width text.  In other sections,
>  the text is formatted, and rST markup can be used.
> --
> 2.31.1
>
>

--0000000000006e01d005cf43b3bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 26, 2021 at 7:10 AM Marku=
s Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Comm=
it 55ec69f8b1 &quot;docs/devel/qapi-code-gen.txt: Update to new rST<br>
backend conventions&quot; accidentally duplicated a paragraph.=C2=A0 Drop i=
t.<br>
<br></blockquote><div><br></div><div>Fixes: 55ec69f8b1</div><div>.... well,=
 on second thought, that backport would have to go backwards through a ReST=
 conversion, so ... maybe not. Nevermind.<br></div><div>=C2=A0</div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">
Cc: Peter Maydell &lt;<a href=3D"mailto:peter.maydell@linaro.org" target=3D=
"_blank">peter.maydell@linaro.org</a>&gt;<br>
Signed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" t=
arget=3D"_blank">armbru@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>Reviewed-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@re=
dhat.com</a>&gt;<br></div><div>=C2=A0</div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">
---<br>
=C2=A0docs/devel/qapi-code-gen.rst | 6 ------<br>
=C2=A01 file changed, 6 deletions(-)<br>
<br>
diff --git a/docs/devel/qapi-code-gen.rst b/docs/devel/qapi-code-gen.rst<br=
>
index b2569de486..1f6805a705 100644<br>
--- a/docs/devel/qapi-code-gen.rst<br>
+++ b/docs/devel/qapi-code-gen.rst<br>
@@ -993,12 +993,6 @@ multiline argument descriptions.<br>
=C2=A0A &#39;Since: x.y.z&#39; tagged section lists the release that introd=
uced the<br>
=C2=A0definition.<br>
<br>
-The text of a section can start on a new line, in<br>
-which case it must not be indented at all.=C2=A0 It can also start<br>
-on the same line as the &#39;Note:&#39;, &#39;Returns:&#39;, etc tag.=C2=
=A0 In this<br>
-case if it spans multiple lines then second and subsequent<br>
-lines must be indented to match the first.<br>
-<br>
=C2=A0An &#39;Example&#39; or &#39;Examples&#39; section is automatically r=
endered<br>
=C2=A0entirely as literal fixed-width text.=C2=A0 In other sections,<br>
=C2=A0the text is formatted, and rST markup can be used.<br>
-- <br>
2.31.1<br>
<br>
</blockquote></div></div>

--0000000000006e01d005cf43b3bc--


