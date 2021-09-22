Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3AF414F99
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Sep 2021 20:10:08 +0200 (CEST)
Received: from localhost ([::1]:50638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mT6h5-0005RF-MA
	for lists+qemu-devel@lfdr.de; Wed, 22 Sep 2021 14:10:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mT6fF-0003i9-Kz
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:08:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1mT6fB-0005l0-LY
 for qemu-devel@nongnu.org; Wed, 22 Sep 2021 14:08:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632334087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=pPYNlauVMKVFoLLprF+8xTsLLrfjowLg5l54NEFcwqU=;
 b=bc2QLKgKp3bCjxe42dOff4Jk7nDJ1PmZ7d9ON65hjjQfJa6wLCxoVUzAxi2wTQcfXc19iZ
 U9LD4E7tBNaPt3tgtx2kr/VXMsocnqUgkrwyOKLnBVNbNkMATfgjfkWK3UWqmY5v8P0xF7
 674GXB4yEU+cRKoENLBxBYuKu8CyaOA=
Received: from mail-oo1-f71.google.com (mail-oo1-f71.google.com
 [209.85.161.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-171-CdunhbB5NO2vM-Be8pbl5Q-1; Wed, 22 Sep 2021 14:08:05 -0400
X-MC-Unique: CdunhbB5NO2vM-Be8pbl5Q-1
Received: by mail-oo1-f71.google.com with SMTP id
 o16-20020a4a3850000000b002ac67e1a6e9so2145618oof.14
 for <qemu-devel@nongnu.org>; Wed, 22 Sep 2021 11:08:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pPYNlauVMKVFoLLprF+8xTsLLrfjowLg5l54NEFcwqU=;
 b=yK4nbp7DtHrlaHR4HpC0yvv93KVHmgRXxBuwvkWRvV8RxL2yjzHz3fHrOd7/aVTF0S
 S5velFzscMO42JKKT7Ffvg4yxGC+jHob0NobeFSqxLsvBJbBfW0vKROuJDxdaV47LWvb
 MU1lyOSFsRjmrBEn7xhd0vpv8sBxQkSDMDCqBt05igONjAuAevU3AMSlHLB3k5f1wt65
 cO9twbwbjnUFzgSYSVv0ACIeivqaQrb2oiZdFGWBxqAa3SaRBQCZqa4Z6CjnV6k5fN38
 FnFvAZz9j1wUnbzSz+3TeKaPA+lYq3cT1UvU3UlAa/N7cL2hdDjiC1mcNxjPPZMVwjMO
 Gkrw==
X-Gm-Message-State: AOAM531nU2qu42kIHGmOkMojaAQV0K7lbZtyfI85KhDn3auVX0NEMAiV
 S15E3T9TYGMg6nzTxaHX9o3T/WFkuuNhwN4rA6nbdQ89e+llU7yDeEcYtRJ706WtBe/H2lmS0eV
 H5YThxnuB35GcIOQeCyreA4+xIhwXRPo=
X-Received: by 2002:a05:6808:209b:: with SMTP id
 s27mr9228517oiw.168.1632334085107; 
 Wed, 22 Sep 2021 11:08:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwfN2qw+ExftEfEtjIOTVgRAtCYwMHj0UZIYmv9McPfepl8/0cmFLW2zNNCjB6CmlscD/sb0Th+elD6XFjWHso=
X-Received: by 2002:a05:6808:209b:: with SMTP id
 s27mr9228504oiw.168.1632334084923; 
 Wed, 22 Sep 2021 11:08:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210922125619.670673-1-armbru@redhat.com>
 <20210922125619.670673-2-armbru@redhat.com>
In-Reply-To: <20210922125619.670673-2-armbru@redhat.com>
From: John Snow <jsnow@redhat.com>
Date: Wed, 22 Sep 2021 14:07:53 -0400
Message-ID: <CAFn=p-YasVLZbFWqx=rxFNLcwyHhBKxcJgeKpQLjDZC2bj-_nQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] tests/qapi-schema: Use Python OSError instead of
 outmoded IOError
To: Markus Armbruster <armbru@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="00000000000049765805cc996534"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
Cc: marcandre.lureau@gmail.com, qemu-devel <qemu-devel@nongnu.org>,
 mdroth@linux.vnet.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000049765805cc996534
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 22, 2021 at 8:56 AM Markus Armbruster <armbru@redhat.com> wrote:

> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> ---
>  tests/qapi-schema/test-qapi.py | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/tests/qapi-schema/test-qapi.py
> b/tests/qapi-schema/test-qapi.py
> index 73cffae2b6..2e384f5efd 100755
> --- a/tests/qapi-schema/test-qapi.py
> +++ b/tests/qapi-schema/test-qapi.py
> @@ -154,7 +154,7 @@ def test_and_diff(test_name, dir_name, update):
>          errfp = open(os.path.join(dir_name, test_name + '.err'), mode)
>          expected_out = outfp.readlines()
>          expected_err = errfp.readlines()
> -    except IOError as err:
> +    except OSError as err:
>          print("%s: can't open '%s': %s"
>                % (sys.argv[0], err.filename, err.strerror),
>                file=sys.stderr)
> @@ -180,7 +180,7 @@ def test_and_diff(test_name, dir_name, update):
>          errfp.truncate(0)
>          errfp.seek(0)
>          errfp.writelines(actual_err)
> -    except IOError as err:
> +    except OSError as err:
>          print("%s: can't write '%s': %s"
>                % (sys.argv[0], err.filename, err.strerror),
>                file=sys.stderr)
> --
> 2.31.1
>
>
If you're happy with the expanded scope of the exception-catcher, I am too.

Reviewed-by: John Snow <jsnow@redhat.com>

--00000000000049765805cc996534
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 22, 2021 at 8:56 AM Marku=
s Armbruster &lt;<a href=3D"mailto:armbru@redhat.com">armbru@redhat.com</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Sign=
ed-off-by: Markus Armbruster &lt;<a href=3D"mailto:armbru@redhat.com" targe=
t=3D"_blank">armbru@redhat.com</a>&gt;<br>
---<br>
=C2=A0tests/qapi-schema/test-qapi.py | 4 ++--<br>
=C2=A01 file changed, 2 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/tests/qapi-schema/test-qapi.py b/tests/qapi-schema/test-qapi.p=
y<br>
index 73cffae2b6..2e384f5efd 100755<br>
--- a/tests/qapi-schema/test-qapi.py<br>
+++ b/tests/qapi-schema/test-qapi.py<br>
@@ -154,7 +154,7 @@ def test_and_diff(test_name, dir_name, update):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errfp =3D open(os.path.join(dir_name, tes=
t_name + &#39;.err&#39;), mode)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0expected_out =3D outfp.readlines()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0expected_err =3D errfp.readlines()<br>
-=C2=A0 =C2=A0 except IOError as err:<br>
+=C2=A0 =C2=A0 except OSError as err:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print(&quot;%s: can&#39;t open &#39;%s&#3=
9;: %s&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0% (sys.argv[0], err.=
filename, err.strerror),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file=3Dsys.stderr)<b=
r>
@@ -180,7 +180,7 @@ def test_and_diff(test_name, dir_name, update):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errfp.truncate(0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errfp.seek(0)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0errfp.writelines(actual_err)<br>
-=C2=A0 =C2=A0 except IOError as err:<br>
+=C2=A0 =C2=A0 except OSError as err:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0print(&quot;%s: can&#39;t write &#39;%s&#=
39;: %s&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0% (sys.argv[0], err.=
filename, err.strerror),<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file=3Dsys.stderr)<b=
r>
-- <br>
2.31.1<br>
<br></blockquote><div><br></div><div>If you&#39;re happy with the expanded =
scope of the exception-catcher, I am too.</div><div><br></div><div>Reviewed=
-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>=
&gt;</div></div></div>

--00000000000049765805cc996534--


