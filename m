Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 126E751D059
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 06:40:46 +0200 (CEST)
Received: from localhost ([::1]:49740 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmpll-0007so-0R
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 00:40:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1nmpjw-0007CQ-N3
 for qemu-devel@nongnu.org; Fri, 06 May 2022 00:38:52 -0400
Received: from speedy.comstyle.com ([2607:f938:3000:8::2]:13146
 helo=mail.comstyle.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim 4.90_1) (envelope-from <brad@comstyle.com>) id 1nmpju-0001uv-UN
 for qemu-devel@nongnu.org; Fri, 06 May 2022 00:38:52 -0400
Received: from mail.comstyle.com (localhost [127.0.0.1])
 by mail.comstyle.com (Postfix) with ESMTP id 4KvdB04MYGz8PbN;
 Fri,  6 May 2022 00:38:48 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=comstyle.com; h=
 content-type:message-id:date:mime-version:subject:to:cc
 :references:from:in-reply-to; s=default; bh=8evOjaIvFkh7ayH2JpLX
 AWSAmFY=; b=o+pKiVRaO4+ZlT7IymMYu2YXkacOpdReIENQnNlDKujLQGFldl+D
 P5DwoVKfB8evQvxQSngdJkAk38xcLPa+RCDA2kF8Aar11vJBWA0VKgfOMSh7xOYb
 e1C8StecutpIzcaeNOSmNdv2GtROGeIkEVem/lFJR4prdnP9z3aEOYM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=comstyle.com; h=content-type
 :message-id:date:mime-version:subject:to:cc:references:from
 :in-reply-to; q=dns; s=default; b=nnvXCHOSsgPEtMqRgnczmv08OghUtF
 AESg5JScMko65pbPwWY6MNUAtzNjy33Lm5yStjTmzKvjAFKZj6JaOvG40cHoNeoi
 IOx0pZT0XLn0bMSjQcetvEFxWP15t0UDtXazY4gyGxiCbwyZJccFH7Etw7CpPWjX
 ZbB24XGsgrY/U=
Received: from [IPV6:2001:470:b050:6:3805:3640:f044:256c] (unknown
 [IPv6:2001:470:b050:6:3805:3640:f044:256c])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: brad)
 by mail.comstyle.com (Postfix) with ESMTPSA id 4KvdB0145Xz8PbK;
 Fri,  6 May 2022 00:38:48 -0400 (EDT)
Content-Type: multipart/alternative;
 boundary="------------6ygw8Px2GUiuRFxGs5WJ1NqJ"
Message-ID: <b3a4e9f4-d768-4eb1-3d9f-4a55a149fb57@comstyle.com>
Date: Fri, 6 May 2022 00:38:47 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:100.0) Gecko/20100101
 Thunderbird/100.0
Subject: Re: [PATCH] tests/vm: update openbsd to release 7.1
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>
Cc: Kyle Evans <kevans@freebsd.org>, Alex Benn_e <alex.bennee@linaro.org>,
 Philippe Mathieu-Daud_ <f4bug@amsat.org>, Thomas Huth <thuth@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
References: <YnRed7sw45lTbRjb@humpty.home.comstyle.com>
 <CANCZdfpQ4oBx=bZq1xTPdRA3fZW=FSKw9-LGUQC9NcGROSFQuA@mail.gmail.com>
From: Brad Smith <brad@comstyle.com>
In-Reply-To: <CANCZdfpQ4oBx=bZq1xTPdRA3fZW=FSKw9-LGUQC9NcGROSFQuA@mail.gmail.com>
Received-SPF: pass client-ip=2607:f938:3000:8::2;
 envelope-from=brad@comstyle.com; helo=mail.comstyle.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

This is a multi-part message in MIME format.
--------------6ygw8Px2GUiuRFxGs5WJ1NqJ
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

The checksum can be found here...

https://cdn.openbsd.org/pub/OpenBSD/7.1/amd64/SHA256

SHA256 (install71.iso) =3D=20
d3a7c5b9bf890bc404304a1c96f9ee72e1d9bbcf9cc849c1133bdb0d67843396

On 5/5/2022 10:45 PM, Warner Losh wrote:
>
>
> On Thu, May 5, 2022 at 5:32 PM Brad Smith <brad@comstyle.com> wrote:
>
>     tests/vm/openbsd: Update to release 7.1
>
>     Signed-off-by: Brad Smith <brad@comstyle.com>
>
>
> Reviewed-by: Warner Losh <imp@bsdimp.com>
>
> Though i didn't verify the csum.
>
> Warner
>
>     ---
>     =C2=A0tests/vm/openbsd | 4 ++--
>     =C2=A01 file changed, 2 insertions(+), 2 deletions(-)
>
>     diff --git a/tests/vm/openbsd b/tests/vm/openbsd
>     index 337fe7c303..dc34b2718b 100755
>     --- a/tests/vm/openbsd
>     +++ b/tests/vm/openbsd
>     @@ -22,8 +22,8 @@ class OpenBSDVM(basevm.BaseVM):
>     =C2=A0 =C2=A0 =C2=A0name =3D "openbsd"
>     =C2=A0 =C2=A0 =C2=A0arch =3D "x86_64"
>
>     -=C2=A0 =C2=A0 link =3D
>     "https://cdn.openbsd.org/pub/OpenBSD/7.0/amd64/install70.iso"
>     -=C2=A0 =C2=A0 csum =3D
>     "1882f9a23c9800e5dba3dbd2cf0126f552605c915433ef4c5bb672610a4ca3a4"
>     +=C2=A0 =C2=A0 link =3D
>     "https://cdn.openbsd.org/pub/OpenBSD/7.1/amd64/install71.iso"
>     +=C2=A0 =C2=A0 csum =3D
>     "d3a7c5b9bf890bc404304a1c96f9ee72e1d9bbcf9cc849c1133bdb0d67843396"
>     =C2=A0 =C2=A0 =C2=A0size =3D "20G"
>     =C2=A0 =C2=A0 =C2=A0pkgs =3D [
>     =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# tools
>     --=20
>     2.36.0
>
--------------6ygw8Px2GUiuRFxGs5WJ1NqJ
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<html>
  <head>
    <meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DUTF=
-8">
  </head>
  <body>
    <p>The checksum can be found here...<br>
      <br>
      <a class=3D"moz-txt-link-freetext" href=3D"https://cdn.openbsd.org/=
pub/OpenBSD/7.1/amd64/SHA256">https://cdn.openbsd.org/pub/OpenBSD/7.1/amd=
64/SHA256</a><br>
      <br>
      SHA256 (install71.iso) =3D
      d3a7c5b9bf890bc404304a1c96f9ee72e1d9bbcf9cc849c1133bdb0d67843396<br=
>
      <br>
    </p>
    <div class=3D"moz-cite-prefix">On 5/5/2022 10:45 PM, Warner Losh
      wrote:<br>
    </div>
    <blockquote type=3D"cite"
cite=3D"mid:CANCZdfpQ4oBx=3DbZq1xTPdRA3fZW=3DFSKw9-LGUQC9NcGROSFQuA@mail.=
gmail.com">
      <meta http-equiv=3D"content-type" content=3D"text/html; charset=3DU=
TF-8">
      <div dir=3D"ltr">
        <div dir=3D"ltr"><br>
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 5, 2022 at 5:=
32
            PM Brad Smith &lt;<a href=3D"mailto:brad@comstyle.com"
              moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">br=
ad@comstyle.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">tests/vm/openbsd: Update
            to release 7.1<br>
            <br>
            Signed-off-by: Brad Smith &lt;<a
              href=3D"mailto:brad@comstyle.com" target=3D"_blank"
              moz-do-not-send=3D"true" class=3D"moz-txt-link-freetext">br=
ad@comstyle.com</a>&gt;<br>
          </blockquote>
          <div><br>
          </div>
          <div>Reviewed-by: Warner Losh &lt;<a
              href=3D"mailto:imp@bsdimp.com" moz-do-not-send=3D"true"
              class=3D"moz-txt-link-freetext">imp@bsdimp.com</a>&gt;</div=
>
          <div><br>
          </div>
          <div>Though i didn't verify the csum.</div>
          <div><br>
          </div>
          <div>Warner</div>
          <div>=C2=A0<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px
            0.8ex;border-left:1px solid
            rgb(204,204,204);padding-left:1ex">
            ---<br>
            =C2=A0tests/vm/openbsd | 4 ++--<br>
            =C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
            <br>
            diff --git a/tests/vm/openbsd b/tests/vm/openbsd<br>
            index 337fe7c303..dc34b2718b 100755<br>
            --- a/tests/vm/openbsd<br>
            +++ b/tests/vm/openbsd<br>
            @@ -22,8 +22,8 @@ class OpenBSDVM(basevm.BaseVM):<br>
            =C2=A0 =C2=A0 =C2=A0name =3D "openbsd"<br>
            =C2=A0 =C2=A0 =C2=A0arch =3D "x86_64"<br>
            <br>
            -=C2=A0 =C2=A0 link =3D "<a
              href=3D"https://cdn.openbsd.org/pub/OpenBSD/7.0/amd64/insta=
ll70.iso"
              rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tru=
e"
              class=3D"moz-txt-link-freetext">https://cdn.openbsd.org/pub=
/OpenBSD/7.0/amd64/install70.iso</a>"<br>
            -=C2=A0 =C2=A0 csum =3D
            "1882f9a23c9800e5dba3dbd2cf0126f552605c915433ef4c5bb672610a4c=
a3a4"<br>
            +=C2=A0 =C2=A0 link =3D "<a
              href=3D"https://cdn.openbsd.org/pub/OpenBSD/7.1/amd64/insta=
ll71.iso"
              rel=3D"noreferrer" target=3D"_blank" moz-do-not-send=3D"tru=
e"
              class=3D"moz-txt-link-freetext">https://cdn.openbsd.org/pub=
/OpenBSD/7.1/amd64/install71.iso</a>"<br>
            +=C2=A0 =C2=A0 csum =3D
            "d3a7c5b9bf890bc404304a1c96f9ee72e1d9bbcf9cc849c1133bdb0d6784=
3396"<br>
            =C2=A0 =C2=A0 =C2=A0size =3D "20G"<br>
            =C2=A0 =C2=A0 =C2=A0pkgs =3D [<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# tools<br>
            -- <br>
            2.36.0<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------6ygw8Px2GUiuRFxGs5WJ1NqJ--

