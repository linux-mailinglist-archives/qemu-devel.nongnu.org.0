Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2706B4DB21F
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 15:03:57 +0100 (CET)
Received: from localhost ([::1]:56428 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUUFo-0002xw-8M
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 10:03:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:45292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1nUTw4-0001h5-6G
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:43:32 -0400
Received: from [2607:f8b0:4864:20::12b] (port=34365
 helo=mail-il1-x12b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1nUTw1-0007DR-Im
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:43:31 -0400
Received: by mail-il1-x12b.google.com with SMTP id r11so1541363ila.1
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 06:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yGv0eKtlDvEkez3htkEXC9fuh3p1JLdFl+1IhFMBKes=;
 b=clhXAETfOec1OqxuRJ6dR5sLp2A+xBAVCJuVx/U0bPRpO93i1kzmmOwgpjhVtEQ5xo
 H5t6QaTxy6zJ5o8UYjZeTvF7jgx+3tjiKwvKZ3Yh/wyx5IU3/IM1J2FULIGyEKSOv9BJ
 RI1q0RyGYZF87Wi5ZHxT628Nnd1BW+hbsV4BB8bdGeVaig3rS+gN/3a5p1EBgXl3mSd6
 j3kOYcBdfbsI+qabfhPF/G5LnTjHBqfCpXfStYLfsjU5QLFVVP0R51H6bOl+9/i+fZyG
 AJ6ePPmQ7YOaX+eN+QgI+j0yDIhhgoCSswwjPI7JjKWYJqGKmk7U+1mRfEL4eti9iQjN
 tDsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yGv0eKtlDvEkez3htkEXC9fuh3p1JLdFl+1IhFMBKes=;
 b=J8pVEiD8i8piGdBoAh17/mRDy48GrzC+M3bSOuiqAHHJSA9nMdcqLY+VK7JpFVClAb
 vonBPR+p+cLTXV6gTOgTPwGIUAY00MIrbezKMrPCMqEFjGbJyv/JSIf0EDm6KawRz/Dz
 7h4C7gjaBcJshkrVouzTBJU/NxTeBfrxp91JIR8t+pX0dQ75krClqLy7I0UTDZQ5w01V
 J3C+ptDytxUXSXUo5jvUeW58Bue8FhCyU/YezbCwmErzO5et8GPYy6mLuVzhwME7KH0R
 pXcBaPmjGn28mPmc4kcQNF21LnI84oUuLMfF1IN7XBPoQKdHvfZB7Vug1OVx6X5rUa61
 OIjg==
X-Gm-Message-State: AOAM533ckx4RuqSL0poACKFAo7pSOaTXseSN9bZA7uLWaA09gmcHY8eN
 aabhiVYh+cW3i3C/jpN9w4G+K7nY/l7248dFkEc=
X-Google-Smtp-Source: ABdhPJyN/6UsbUe+6EvsyW54j9dwswidWTIVvNhj6GY0mbAdpCKkoRaUVBKS2+MlHTYHcl+qffDSNBYIaW9szT0YK7s=
X-Received: by 2002:a05:6e02:1b07:b0:2c7:9a58:7c4e with SMTP id
 i7-20020a056e021b0700b002c79a587c4emr11151524ilv.173.1647438207864; Wed, 16
 Mar 2022 06:43:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220316124012.1413954-1-cmuellner@linux.com>
In-Reply-To: <20220316124012.1413954-1-cmuellner@linux.com>
From: Mahmoud Abumandour <ma.mandourr@gmail.com>
Date: Wed, 16 Mar 2022 15:43:17 +0200
Message-ID: <CAD-LL6jHd6WhiFujvOjajvuKrKWVFVD79Qro9HqmYrQOfN9cGg@mail.gmail.com>
Subject: Re: [PATCH] docs/tcg-plugins: document QEMU_PLUGIN behaviour
To: Christoph Muellner <cmuellner@linux.com>
Content-Type: multipart/alternative; boundary="0000000000002b557505da561918"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::12b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::12b;
 envelope-from=ma.mandourr@gmail.com; helo=mail-il1-x12b.google.com
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
Cc: Alexandre Iooss <erdnaxe@crans.org>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002b557505da561918
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 16, 2022 at 2:40 PM Christoph Muellner <cmuellner@linux.com>
wrote:

> QEMU plugins can be loaded via command line arguments or via
> the QEMU_PLUGIN environment variable. Currently, only the first method
> is documented. Let's document QEMU_PLUGIN.
>
> Signed-off-by: Christoph Muellner <cmuellner@linux.com>
> ---
>  docs/devel/tcg-plugins.rst | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
> index f93ef4fe52..ba48be18d0 100644
> --- a/docs/devel/tcg-plugins.rst
> +++ b/docs/devel/tcg-plugins.rst
> @@ -34,6 +34,10 @@ Arguments are plugin specific and can be used to modify
> their
>  behaviour. In this case the howvec plugin is being asked to use inline
>  ops to count and break down the hint instructions by type.
>
> +QEMU also evaluates the environment variable ``QEMU_PLUGIN``::
> +
> +  QEMU_PLUGIN="file=tests/plugin/libhowec.so,inline=on,count=hint" $QEMU
>

The plugin howvec is in contrib/plugins, so I think giving the correct path
would be
better. Note also that there's a typo in "libhowec.so".

If you want, you could also fix the next example that has the same path or
leave it
for another patch.

+
>  Writing plugins
>  ---------------
>
> --
> 2.35.1
>
>
Other than that,
Reviewed-By: Mahmoud Mandour <ma.mandourr@gmail.com>

Thanks,
Mahmoud

--0000000000002b557505da561918
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 16, 2022 at 2:40 PM Chris=
toph Muellner &lt;<a href=3D"mailto:cmuellner@linux.com">cmuellner@linux.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>QEMU plugins can be loaded via command line arguments or via<br>
the QEMU_PLUGIN environment variable. Currently, only the first method<br>
is documented. Let&#39;s document QEMU_PLUGIN.<br>
<br>
Signed-off-by: Christoph Muellner &lt;<a href=3D"mailto:cmuellner@linux.com=
" target=3D"_blank">cmuellner@linux.com</a>&gt;<br>
---<br>
=C2=A0docs/devel/tcg-plugins.rst | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst<br>
index f93ef4fe52..ba48be18d0 100644<br>
--- a/docs/devel/tcg-plugins.rst<br>
+++ b/docs/devel/tcg-plugins.rst<br>
@@ -34,6 +34,10 @@ Arguments are plugin specific and can be used to modify =
their<br>
=C2=A0behaviour. In this case the howvec plugin is being asked to use inlin=
e<br>
=C2=A0ops to count and break down the hint instructions by type.<br>
<br>
+QEMU also evaluates the environment variable ``QEMU_PLUGIN``::<br>
+<br>
+=C2=A0 QEMU_PLUGIN=3D&quot;file=3Dtests/plugin/libhowec.so,inline=3Don,cou=
nt=3Dhint&quot; $QEMU<br></blockquote><div><br></div><div>The plugin howvec=
 is in contrib/plugins, so I think giving the correct path would be</div><d=
iv>better. Note also that there&#39;s a typo in &quot;libhowec.so&quot;.</d=
iv><div><br></div><div>If you want, you could also fix the next example tha=
t has the same path or leave it</div><div>for another patch.</div><div><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
=C2=A0Writing plugins<br>
=C2=A0---------------<br>
<br>
-- <br>
2.35.1<br>
<br></blockquote><div><br></div><div>Other than that,</div><div>Reviewed-By=
: Mahmoud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail.com">ma.mandourr@=
gmail.com</a>&gt;</div><div><br></div><div>Thanks,</div><div>Mahmoud</div><=
/div></div>

--0000000000002b557505da561918--

