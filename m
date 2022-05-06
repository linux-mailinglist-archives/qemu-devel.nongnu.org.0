Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0587051D061
	for <lists+qemu-devel@lfdr.de>; Fri,  6 May 2022 06:50:46 +0200 (CEST)
Received: from localhost ([::1]:52826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmpvQ-0002Bb-Uc
	for lists+qemu-devel@lfdr.de; Fri, 06 May 2022 00:50:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52390)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nmpsf-0001An-7f
 for qemu-devel@nongnu.org; Fri, 06 May 2022 00:47:53 -0400
Received: from mail-ua1-x92e.google.com ([2607:f8b0:4864:20::92e]:35617)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nmpsd-0003SZ-8N
 for qemu-devel@nongnu.org; Fri, 06 May 2022 00:47:52 -0400
Received: by mail-ua1-x92e.google.com with SMTP id x11so2406329uao.2
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 21:47:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ul9mK3Qwxi4EevswnlV5tUe++c05ySqwDgsJ3JEYXos=;
 b=yr5P5jm/x+HrMZ8Po2O6Wl2j2mOQ7aggRz/HylAVR379VpfensoaPyWonqcCjQyP4x
 WmCgN0S6PO1H/aD/nB5xxxl0FC7CZ/IAGSwYnwkzU/7wtLC7Hunz6sqYHXN1NJEgbdvG
 GwCGQvoNKOuP3luyvvaalbaAgPOMacYkNC8MZGiQmxDkPhjqIKVxwpV2UDjFvppkYLtH
 wUIiB04X4y/MV4Qguveriu5USSZFgKqZbh66LVP2R3l4uZ64LszyniMjYDfosfDQ6pkP
 nXFbhZwsd+pcJBYnVGL+uXnWb+BXywHHGY0PmEU2XwXZJaZ5uuwiPfucq4a2L2Rh84Zx
 WQWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ul9mK3Qwxi4EevswnlV5tUe++c05ySqwDgsJ3JEYXos=;
 b=3+MFn/geCkAFGf5CfJ25sEQXvwrmiwhrdN2pAfzYETrbxNwIGT2YlDgMLpae/tM0lp
 NPZhViqMFsoCh6P5UehRdb0DKu9kSrADuaaRFvejtGu3/kSIqV0pzLR+pW/Wqx6DlHQ/
 5x1eREvkNBOOWULDeX6CetVjud+pdX84FVdd8cjsHGn9ndnLxiTpjBYn89sv/Y3qeg5Q
 6dV7/MMvms56N17RvBx52dNQpPyqewISCarjvDd6KExcoW07Yn7iZVQCgCgJziryU9Kc
 dBLF0XYoimtPdRxZf1veGDhoi6NB3r7hJiWeQZ+cpJDy3BO2z+6bGAGbrCzEl/jQnNbp
 2vuA==
X-Gm-Message-State: AOAM532ywvCrMENgKM5RRNaJt6e2HdLeImMT+OW6QO/d2+FgcKmLTgn/
 4Ukjss09v66IrsZE1nfgEKKQ4WEUH0w8csEI/l7z6g==
X-Google-Smtp-Source: ABdhPJyssn9lWHg7/Z5g88Zp6OQxX5E3iwILeud45zabDDV1x4qnQIE1Up7W4ZLDZsejNSa8/mZZpys9bIhIhubx4fY=
X-Received: by 2002:a05:6130:90:b0:362:891c:edef with SMTP id
 x16-20020a056130009000b00362891cedefmr455022uaf.106.1651812469654; Thu, 05
 May 2022 21:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <YnRed7sw45lTbRjb@humpty.home.comstyle.com>
 <CANCZdfpQ4oBx=bZq1xTPdRA3fZW=FSKw9-LGUQC9NcGROSFQuA@mail.gmail.com>
 <b3a4e9f4-d768-4eb1-3d9f-4a55a149fb57@comstyle.com>
In-Reply-To: <b3a4e9f4-d768-4eb1-3d9f-4a55a149fb57@comstyle.com>
From: Warner Losh <imp@bsdimp.com>
Date: Thu, 5 May 2022 22:47:38 -0600
Message-ID: <CANCZdfpVa5UGfCbUN6=huhtEZCsoZiyuKEf4z5mevbqpdYJFZQ@mail.gmail.com>
Subject: Re: [PATCH] tests/vm: update openbsd to release 7.1
To: Brad Smith <brad@comstyle.com>
Cc: Kyle Evans <kevans@freebsd.org>, Alex Benn_e <alex.bennee@linaro.org>, 
 Philippe Mathieu-Daud_ <f4bug@amsat.org>, Thomas Huth <thuth@redhat.com>, 
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: multipart/alternative; boundary="0000000000007d5a5e05de508f45"
Received-SPF: none client-ip=2607:f8b0:4864:20::92e;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001,
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

--0000000000007d5a5e05de508f45
Content-Type: text/plain; charset="UTF-8"

On Thu, May 5, 2022 at 10:38 PM Brad Smith <brad@comstyle.com> wrote:

> The checksum can be found here...
>
> https://cdn.openbsd.org/pub/OpenBSD/7.1/amd64/SHA256
>
> SHA256 (install71.iso) =
> d3a7c5b9bf890bc404304a1c96f9ee72e1d9bbcf9cc849c1133bdb0d67843396
>
Indeed.  Then they do match. :)

Warner

> On 5/5/2022 10:45 PM, Warner Losh wrote:
>
>
>
> On Thu, May 5, 2022 at 5:32 PM Brad Smith <brad@comstyle.com> wrote:
>
>> tests/vm/openbsd: Update to release 7.1
>>
>> Signed-off-by: Brad Smith <brad@comstyle.com>
>>
>
> Reviewed-by: Warner Losh <imp@bsdimp.com>
>
> Though i didn't verify the csum.
>
> Warner
>
>
>> ---
>>  tests/vm/openbsd | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/vm/openbsd b/tests/vm/openbsd
>> index 337fe7c303..dc34b2718b 100755
>> --- a/tests/vm/openbsd
>> +++ b/tests/vm/openbsd
>> @@ -22,8 +22,8 @@ class OpenBSDVM(basevm.BaseVM):
>>      name = "openbsd"
>>      arch = "x86_64"
>>
>> -    link = "https://cdn.openbsd.org/pub/OpenBSD/7.0/amd64/install70.iso"
>> -    csum =
>> "1882f9a23c9800e5dba3dbd2cf0126f552605c915433ef4c5bb672610a4ca3a4"
>> +    link = "https://cdn.openbsd.org/pub/OpenBSD/7.1/amd64/install71.iso"
>> +    csum =
>> "d3a7c5b9bf890bc404304a1c96f9ee72e1d9bbcf9cc849c1133bdb0d67843396"
>>      size = "20G"
>>      pkgs = [
>>          # tools
>> --
>> 2.36.0
>>
>>

--0000000000007d5a5e05de508f45
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 5, 2022 at 10:38 PM Brad =
Smith &lt;<a href=3D"mailto:brad@comstyle.com">brad@comstyle.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div>
    <p>The checksum can be found here...<br>
      <br>
      <a href=3D"https://cdn.openbsd.org/pub/OpenBSD/7.1/amd64/SHA256" targ=
et=3D"_blank">https://cdn.openbsd.org/pub/OpenBSD/7.1/amd64/SHA256</a><br>
      <br>
      SHA256 (install71.iso) =3D
      d3a7c5b9bf890bc404304a1c96f9ee72e1d9bbcf9cc849c1133bdb0d67843396</p><=
/div></blockquote><div>Indeed.=C2=A0 Then they do match. :)<br></div><div><=
br></div><div>Warner=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex"><div><p>On 5/5/2022 10:45 PM, Warner Losh
      wrote:<br></p>
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr"><br>
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Thu, May 5, 2022 at 5:32
            PM Brad Smith &lt;<a href=3D"mailto:brad@comstyle.com" target=
=3D"_blank">brad@comstyle.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">tests/vm/openbs=
d: Update
            to release 7.1<br>
            <br>
            Signed-off-by: Brad Smith &lt;<a href=3D"mailto:brad@comstyle.c=
om" target=3D"_blank">brad@comstyle.com</a>&gt;<br>
          </blockquote>
          <div><br>
          </div>
          <div>Reviewed-by: Warner Losh &lt;<a href=3D"mailto:imp@bsdimp.co=
m" target=3D"_blank">imp@bsdimp.com</a>&gt;</div>
          <div><br>
          </div>
          <div>Though i didn&#39;t verify the csum.</div>
          <div><br>
          </div>
          <div>Warner</div>
          <div>=C2=A0<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            ---<br>
            =C2=A0tests/vm/openbsd | 4 ++--<br>
            =C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
            <br>
            diff --git a/tests/vm/openbsd b/tests/vm/openbsd<br>
            index 337fe7c303..dc34b2718b 100755<br>
            --- a/tests/vm/openbsd<br>
            +++ b/tests/vm/openbsd<br>
            @@ -22,8 +22,8 @@ class OpenBSDVM(basevm.BaseVM):<br>
            =C2=A0 =C2=A0 =C2=A0name =3D &quot;openbsd&quot;<br>
            =C2=A0 =C2=A0 =C2=A0arch =3D &quot;x86_64&quot;<br>
            <br>
            -=C2=A0 =C2=A0 link =3D &quot;<a href=3D"https://cdn.openbsd.or=
g/pub/OpenBSD/7.0/amd64/install70.iso" rel=3D"noreferrer" target=3D"_blank"=
>https://cdn.openbsd.org/pub/OpenBSD/7.0/amd64/install70.iso</a>&quot;<br>
            -=C2=A0 =C2=A0 csum =3D
            &quot;1882f9a23c9800e5dba3dbd2cf0126f552605c915433ef4c5bb672610=
a4ca3a4&quot;<br>
            +=C2=A0 =C2=A0 link =3D &quot;<a href=3D"https://cdn.openbsd.or=
g/pub/OpenBSD/7.1/amd64/install71.iso" rel=3D"noreferrer" target=3D"_blank"=
>https://cdn.openbsd.org/pub/OpenBSD/7.1/amd64/install71.iso</a>&quot;<br>
            +=C2=A0 =C2=A0 csum =3D
            &quot;d3a7c5b9bf890bc404304a1c96f9ee72e1d9bbcf9cc849c1133bdb0d6=
7843396&quot;<br>
            =C2=A0 =C2=A0 =C2=A0size =3D &quot;20G&quot;<br>
            =C2=A0 =C2=A0 =C2=A0pkgs =3D [<br>
            =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# tools<br>
            -- <br>
            2.36.0<br>
            <br>
          </blockquote>
        </div>
      </div>
    </blockquote>
  </div>

</blockquote></div></div>

--0000000000007d5a5e05de508f45--

