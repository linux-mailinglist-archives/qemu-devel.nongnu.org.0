Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEC74DB2BD
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 15:18:51 +0100 (CET)
Received: from localhost ([::1]:59300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUUUB-0007Iu-4t
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 10:18:47 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <christophm30@gmail.com>)
 id 1nUUB6-0005Cj-4o
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:59:04 -0400
Received: from mail-vs1-f52.google.com ([209.85.217.52]:44943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <christophm30@gmail.com>)
 id 1nUUAw-0001aL-BC
 for qemu-devel@nongnu.org; Wed, 16 Mar 2022 09:58:55 -0400
Received: by mail-vs1-f52.google.com with SMTP id y4so2244741vsd.11
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 06:58:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wGS2fDCB8NnYHD5CYOWHPYx1x8aaBLAqvCNuDw17qlM=;
 b=CvKbC7s5XY4v0SpyEkCZHZQt3dZgt3gIl8wzfui6pBh2NzTIVkiskYheQ9Le2XNEWT
 Ohrq7P0jq6wrotGMfFBH5hbUAeTN1FDROtizM9Tfsu1ywlP0m7cUBaDATuya44hKbHc5
 Q4Z9nfZlr6f0V0te5P6Ib5jlV0yCmjoP00PE+OmYOSnw2YZxQWzACQjJKcirARp/Gaa5
 8arV4P1lC/GK42Kp7+4W7Tu+V4QmQPmum7AQXlOc7nSgQwjq5d6ipi9uB4Ivf4hFnecp
 gbk996AeqWft4Dv+Ze/mq00lmtLuuoSE0agi1r4e1sCn7AXinJ5t1Cheec2QU+2yIe93
 J8hg==
X-Gm-Message-State: AOAM5334JmyZagiaJgBiRk8TlCBH+yT5gMksihAaU8iZoDsw2gUJ623w
 1oEnRpnMYe14z7e6eD0F3IMTHSSJ71cdXg==
X-Google-Smtp-Source: ABdhPJwCJw5nRBzV2zWeIRK/Xqxe3Gpz+4JsUDkG41TcMVQog0ZbsbvoCPZdw1lI9zzlfcuUeDVqfQ==
X-Received: by 2002:a05:6102:200c:b0:320:985b:52d7 with SMTP id
 p12-20020a056102200c00b00320985b52d7mr13317493vsr.20.1647439133183; 
 Wed, 16 Mar 2022 06:58:53 -0700 (PDT)
Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com.
 [209.85.221.171]) by smtp.gmail.com with ESMTPSA id
 e20-20020ab02b14000000b00345f0381ddcsm235793uar.0.2022.03.16.06.58.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Mar 2022 06:58:52 -0700 (PDT)
Received: by mail-vk1-f171.google.com with SMTP id e188so1254985vkh.2
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 06:58:52 -0700 (PDT)
X-Received: by 2002:a05:6122:2213:b0:31b:76c3:16df with SMTP id
 bb19-20020a056122221300b0031b76c316dfmr24627vkb.31.1647439132589; Wed, 16 Mar
 2022 06:58:52 -0700 (PDT)
MIME-Version: 1.0
References: <20220316124012.1413954-1-cmuellner@linux.com>
 <CAD-LL6jHd6WhiFujvOjajvuKrKWVFVD79Qro9HqmYrQOfN9cGg@mail.gmail.com>
In-Reply-To: <CAD-LL6jHd6WhiFujvOjajvuKrKWVFVD79Qro9HqmYrQOfN9cGg@mail.gmail.com>
From: =?UTF-8?Q?Christoph_M=C3=BCllner?= <cmuellner@linux.com>
Date: Wed, 16 Mar 2022 14:58:41 +0100
X-Gmail-Original-Message-ID: <CAHB2gtRZ-fsqtYig2Sn--DXURNOZxRXMGmueeZWR0Hf-yqdwYw@mail.gmail.com>
Message-ID: <CAHB2gtRZ-fsqtYig2Sn--DXURNOZxRXMGmueeZWR0Hf-yqdwYw@mail.gmail.com>
Subject: Re: [PATCH] docs/tcg-plugins: document QEMU_PLUGIN behaviour
To: Mahmoud Abumandour <ma.mandourr@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000049814405da565019"
Received-SPF: pass client-ip=209.85.217.52;
 envelope-from=christophm30@gmail.com; helo=mail-vs1-f52.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_ENVFROM_END_DIGIT=0.25,
 FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, HTML_MESSAGE=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

--00000000000049814405da565019
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 16, 2022 at 2:44 PM Mahmoud Abumandour <ma.mandourr@gmail.com>
wrote:

>
>
> On Wed, Mar 16, 2022 at 2:40 PM Christoph Muellner <cmuellner@linux.com>
> wrote:
>
>> QEMU plugins can be loaded via command line arguments or via
>> the QEMU_PLUGIN environment variable. Currently, only the first method
>> is documented. Let's document QEMU_PLUGIN.
>>
>> Signed-off-by: Christoph Muellner <cmuellner@linux.com>
>> ---
>>  docs/devel/tcg-plugins.rst | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/docs/devel/tcg-plugins.rst b/docs/devel/tcg-plugins.rst
>> index f93ef4fe52..ba48be18d0 100644
>> --- a/docs/devel/tcg-plugins.rst
>> +++ b/docs/devel/tcg-plugins.rst
>> @@ -34,6 +34,10 @@ Arguments are plugin specific and can be used to
>> modify their
>>  behaviour. In this case the howvec plugin is being asked to use inline
>>  ops to count and break down the hint instructions by type.
>>
>> +QEMU also evaluates the environment variable ``QEMU_PLUGIN``::
>> +
>> +  QEMU_PLUGIN="file=tests/plugin/libhowec.so,inline=on,count=hint" $QEMU
>>
>
> The plugin howvec is in contrib/plugins, so I think giving the correct
> path would be
> better. Note also that there's a typo in "libhowec.so".
>

Oh yes, I was just copying the contents of the example above but did not
notice
that this is also wrong.

I'll respin a v2 which fixes the paths.

Thanks!


>
> If you want, you could also fix the next example that has the same path or
> leave it
> for another patch.
>
> +
>>  Writing plugins
>>  ---------------
>>
>> --
>> 2.35.1
>>
>>
> Other than that,
> Reviewed-By: Mahmoud Mandour <ma.mandourr@gmail.com>
>
> Thanks,
> Mahmoud
>

--00000000000049814405da565019
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 16, 2022 at 2:44 PM Mahmo=
ud Abumandour &lt;<a href=3D"mailto:ma.mandourr@gmail.com">ma.mandourr@gmai=
l.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 16, 2022 at 2:40 PM =
Christoph Muellner &lt;<a href=3D"mailto:cmuellner@linux.com" target=3D"_bl=
ank">cmuellner@linux.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">QEMU plugins can be loaded via command line argumen=
ts or via<br>
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
iv></div></div></blockquote><div><br></div><div>Oh yes, I was just copying =
the contents of the example above but did not notice</div><div>that this is=
 also wrong.</div><div><br></div><div>I&#39;ll respin a v2 which fixes the =
paths.</div><div><br></div><div>Thanks!</div><div>=C2=A0</div><blockquote c=
lass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px soli=
d rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_q=
uote"><div><br></div><div>If you want, you could also fix the next example =
that has the same path or leave it</div><div>for another patch.</div><div><=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
+<br>
=C2=A0Writing plugins<br>
=C2=A0---------------<br>
<br>
-- <br>
2.35.1<br>
<br></blockquote><div><br></div><div>Other than that,</div><div>Reviewed-By=
: Mahmoud Mandour &lt;<a href=3D"mailto:ma.mandourr@gmail.com" target=3D"_b=
lank">ma.mandourr@gmail.com</a>&gt;</div><div><br></div><div>Thanks,</div><=
div>Mahmoud</div></div></div>
</blockquote></div></div>

--00000000000049814405da565019--

