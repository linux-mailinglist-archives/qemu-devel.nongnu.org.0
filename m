Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A77D04E81C6
	for <lists+qemu-devel@lfdr.de>; Sat, 26 Mar 2022 16:29:29 +0100 (CET)
Received: from localhost ([::1]:59922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nY8M4-0005FH-5v
	for lists+qemu-devel@lfdr.de; Sat, 26 Mar 2022 11:29:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1nY8KS-0004Xs-9X
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 11:27:48 -0400
Received: from [2607:f8b0:4864:20::62e] (port=44677
 helo=mail-pl1-x62e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <niteesh.gs@gmail.com>)
 id 1nY8KQ-0006Wr-Is
 for qemu-devel@nongnu.org; Sat, 26 Mar 2022 11:27:47 -0400
Received: by mail-pl1-x62e.google.com with SMTP id j8so874846pll.11
 for <qemu-devel@nongnu.org>; Sat, 26 Mar 2022 08:27:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=c7mBq2i1euwpzc6xB1zm4mME//EFOh6WPDYVo5Lq6HE=;
 b=CTlYC8x4wWFfBxlZazt0ia6v0cPHSwmIyrXETelsnldbAMEmjkSddgdm/stLZRTUlK
 vkNLu4yi+ub1W8xlMLgU4TWTchFxoVpfuPdUFy64q9jZeQ4+UVeLPPJyV5sRyipmkjFH
 kX9y9ioHMBThFFK+pBBAATwhlLmNFCS22EkkqzJwOIrOjFx8Zbii9EseyJifwa3+fs0x
 oaHnhbFnazQBlos26BU/FNRVkkCCJi9kjjeY8h+EiIS97KnAWoh4Lz0tXg23jBj5abbQ
 cMR8rmc/NNXB55fZvk+PdI4HebIcBW9D6eLolGqZmsgciNsgtWbxO78ouf831z7iXjSR
 o/aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=c7mBq2i1euwpzc6xB1zm4mME//EFOh6WPDYVo5Lq6HE=;
 b=Df8t2TD3tfYZ0v/qBwFLxk71aXGJKx+HhlGOyOhCl5ibc3zi0SJrYPEJjCwX4bV6na
 Bwz8B6nck+1S63N1cmOUCHBNMJ9RbGSRKFbtAjqXS0vgEi4r4hUhlsiC2XGjZDxj7zj3
 ZlWj0+sXJDEt0RFPfDzVyKviD3cPJI0s1QZQ7CbjvrR1qA//BWfPF0FYtrj4qb+Nm/7+
 9xqoTaRWCjQE0uVNRrP/ScFJ3A4GKChPjOSURKHiFKG4jqUzRcxPhQCOkZ2MIbQUkF73
 qQ4KYICok2Pnc5/F583oqqqJr1HQrAqPQD/e2Sw528xGjEKlpNJjIBV019IpBo9gNz6+
 lPXA==
X-Gm-Message-State: AOAM533dGZZmISAhWSp+13nn7bnHnpm2NTiFzpcQcmWFChCJkQTWE2JY
 rBBmb9LOSYV+sdgXvswuYL7lo1mp2knB8QPgInE=
X-Google-Smtp-Source: ABdhPJxOQCEpj9afiW6E9GGxoPIQ/GD+a92C15VubWZ1rSkQh6thNNaLLxWhE/+uoG+NL1+KI440I2jxzgt/qOJ+qzU=
X-Received: by 2002:a17:902:ccd1:b0:154:359:7e17 with SMTP id
 z17-20020a170902ccd100b0015403597e17mr17374071ple.42.1648308464723; Sat, 26
 Mar 2022 08:27:44 -0700 (PDT)
MIME-Version: 1.0
References: <20220325200438.2556381-1-jsnow@redhat.com>
 <20220325200438.2556381-5-jsnow@redhat.com>
In-Reply-To: <20220325200438.2556381-5-jsnow@redhat.com>
From: "Niteesh G. S." <niteesh.gs@gmail.com>
Date: Sat, 26 Mar 2022 20:57:21 +0530
Message-ID: <CAN6ztm9yTfAeM+2ZR3jVQu7LbX7_2ybQQfViYtN7oXcHtbsyhQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] python/aqmp-tui: relicense as LGPLv2+
To: John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000008528fe05db20b8c9"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::62e
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=niteesh.gs@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eric Blake <eblake@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 Daniel Berrange <berrange@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Cleber Rosa <crosa@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000008528fe05db20b8c9
Content-Type: text/plain; charset="UTF-8"

Hii John,

On Sat, Mar 26, 2022 at 1:34 AM John Snow <jsnow@redhat.com> wrote:

> aqmp-tui, the async QMP text user interface tool, is presently licensed
> as GPLv2+. I intend to include this tool as an add-on to an LGPLv2+
> library package hosted on PyPI.org. I've selected LGPLv2+ to maximize
> compatibility with other licenses while retaining a copyleft license.
>
> To keep licensing matters simple, I'd like to relicense this tool as
> LGPLv2+ as well in order to keep the resultant license of the hosted
> release files simple -- even if library users won't "link against" this
> command line tool.
>
> Therefore, I am asking permission to loosen the license.
>
> Niteesh is effectively the sole author of this code, with scattered
> lines from myself.
>
> CC: G S Niteesh Babu <niteesh.gs@gmail.com>
> Signed-off-by: John Snow <jsnow@redhat.com>
>
   Reviewed-by: G S Niteesh Babu <niteesh.gs@gmail.com>

>
> ---
>
> Niteesh, if you agree to loosening the license on your work, you can
> reply with a Reviewed-by line to let us know that you agree to the
> change. If you disagree, an explicit 'nack' would be helpful.
>
> There is no obligation for you to agree to this change, but it'd make
> things easier for me if you did.
>


> Thanks,
> --js
>
> ---
>  python/qemu/aqmp/aqmp_tui.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py
> index f1e926dd75..946ba9af24 100644
> --- a/python/qemu/aqmp/aqmp_tui.py
> +++ b/python/qemu/aqmp/aqmp_tui.py
> @@ -3,7 +3,7 @@
>  # Authors:
>  #  Niteesh Babu G S <niteesh.gs@gmail.com>
>  #
> -# This work is licensed under the terms of the GNU GPL, version 2 or
> +# This work is licensed under the terms of the GNU LGPL, version 2 or
>  # later.  See the COPYING file in the top-level directory.
>  """
>  AQMP TUI
> --
> 2.34.1
>
>

--0000000000008528fe05db20b8c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small">Hii John,<br></div></div><br><div class=3D"gmail_quote"><div =
dir=3D"ltr" class=3D"gmail_attr">On Sat, Mar 26, 2022 at 1:34 AM John Snow =
&lt;<a href=3D"mailto:jsnow@redhat.com">jsnow@redhat.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">aqmp-tui, the async=
 QMP text user interface tool, is presently licensed<br>
as GPLv2+. I intend to include this tool as an add-on to an LGPLv2+<br>
library package hosted on PyPI.org. I&#39;ve selected LGPLv2+ to maximize<b=
r>
compatibility with other licenses while retaining a copyleft license.<br>
<br>
To keep licensing matters simple, I&#39;d like to relicense this tool as<br=
>
LGPLv2+ as well in order to keep the resultant license of the hosted<br>
release files simple -- even if library users won&#39;t &quot;link against&=
quot; this<br>
command line tool.<br>
<br>
Therefore, I am asking permission to loosen the license.<br>
<br>
Niteesh is effectively the sole author of this code, with scattered<br>
lines from myself.<br>
<br>
CC: G S Niteesh Babu &lt;<a href=3D"mailto:niteesh.gs@gmail.com" target=3D"=
_blank">niteesh.gs@gmail.com</a>&gt;<br>
Signed-off-by: John Snow &lt;<a href=3D"mailto:jsnow@redhat.com" target=3D"=
_blank">jsnow@redhat.com</a>&gt;<br></blockquote><div><span class=3D"gmail_=
default" style=3D"font-size:small">=C2=A0=C2=A0 <span class=3D"gmail_defaul=
t" style=3D"font-size:small"></span>Reviewed-by: G S Niteesh</span><span cl=
ass=3D"gmail_default" style=3D"font-size:small"></span><span class=3D"gmail=
_default" style=3D"font-size:small"> Babu &lt;<a href=3D"mailto:niteesh.gs@=
gmail.com">niteesh.gs@gmail.com</a>&gt;</span>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
---<br>
<br>
Niteesh, if you agree to loosening the license on your work, you can<br>
reply with a <span class=3D"gmail_default" style=3D"font-size:small"></span=
>Reviewed-by line to let us know that you agree to the<br>
change. If you disagree, an explicit &#39;nack&#39; would be helpful.<br>
<br>
There is no obligation for you to agree to this change, but it&#39;d make<b=
r>
things easier for me if you did.<br></blockquote><div>=C2=A0</div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">
Thanks,<br>
--js<br>
<br>
---<br>
=C2=A0python/qemu/aqmp/aqmp_tui.py | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/python/qemu/aqmp/aqmp_tui.py b/python/qemu/aqmp/aqmp_tui.py<br=
>
index f1e926dd75..946ba9af24 100644<br>
--- a/python/qemu/aqmp/aqmp_tui.py<br>
+++ b/python/qemu/aqmp/aqmp_tui.py<br>
@@ -3,7 +3,7 @@<br>
=C2=A0# Authors:<br>
=C2=A0#=C2=A0 Niteesh Babu G S &lt;<a href=3D"mailto:niteesh.gs@gmail.com" =
target=3D"_blank">niteesh.gs@gmail.com</a>&gt;<br>
=C2=A0#<br>
-# This work is licensed under the terms of the GNU GPL, version 2 or<br>
+# This work is licensed under the terms of the GNU LGPL, version 2 or<br>
=C2=A0# later.=C2=A0 See the COPYING file in the top-level directory.<br>
=C2=A0&quot;&quot;&quot;<br>
=C2=A0AQMP TUI<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div></div>

--0000000000008528fe05db20b8c9--

