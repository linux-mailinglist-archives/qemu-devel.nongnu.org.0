Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C68A62BA77D
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Nov 2020 11:35:31 +0100 (CET)
Received: from localhost ([::1]:59708 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kg3lK-0007vJ-SB
	for lists+qemu-devel@lfdr.de; Fri, 20 Nov 2020 05:35:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1kg3jW-0007Dy-QN
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 05:33:40 -0500
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:35208)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1kg3jT-0004lb-SZ
 for qemu-devel@nongnu.org; Fri, 20 Nov 2020 05:33:38 -0500
Received: by mail-wm1-x343.google.com with SMTP id w24so9363953wmi.0
 for <qemu-devel@nongnu.org>; Fri, 20 Nov 2020 02:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=izi/+3GQVvv6ylb4eoz5qfCN7h+rm4Fyx9uyOgjA+hQ=;
 b=MRmOIwMMnMHVSgVLB+HltU23Od2wLANLE5xOUDcPiLPQJmvYiUqWlobGy7t40n3Cgx
 WqcOb4ErqaSotW1Sb5W6AYLB6iFQjrhN0+my5aWObZUoi3Jtcl2fvup8XLxIH3XIEjkN
 Gq3qoTnbLvG+cW8pUKMUgsB94dukOYAvUhxqpzAruXkullAMKJxxWnrXKLLOw/H0QPEc
 xE47hkeVJt2JRxUz4aBlxkGANsboC2aJ8fVZGVokA8N8xcK903xq+PeFLJztNEJq5MUX
 ZZo+XqYijST3xMLoOGbFIM2VHcNYsx/0xaZ2IrgcS6n5voWrlW0HTtzhs3Kk6V4Ldf6X
 77Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=izi/+3GQVvv6ylb4eoz5qfCN7h+rm4Fyx9uyOgjA+hQ=;
 b=enyyTFH5CE6bGnWJJV1E5tCgX0K9o9FJCz9QIxsZSWNHrxvtFNVf5LM9EjMTna/SoU
 q6GtqKclXTMQyQujvThZeZz5vm2Np2Bug0S3deqb6YtzbMQhI9fT+DvPC6WatsEt4/Sv
 K84uCi7RaEJFsd0kbRSaBvg0RyTtB/5nwOjX2dPxJ1iB80nxQue+DwwvLJlJdI3UrpFF
 74eHHzBLUhwVYzXHiqUWXyb08eJn/BSWjYfiGVenPLyulob9aN2vybaD4IYhkcwV+pnT
 y+M5ztzONp7k20er1uZMtKPktVrgPkE2N6v23Ru7TntfnYV4lSkoaOyexu45046NqeVr
 ke2Q==
X-Gm-Message-State: AOAM532A+rwVeFCqNfWNUVe7wdPXXnom8/PyDfJ/MgNnIGsfFth5VfrE
 z6KAtyf2PPvJyeUxZnR9PKNk/TMfOtenv5OMVXk3sU8eHgg=
X-Google-Smtp-Source: ABdhPJzPMhwfOHmYACXvzkF3p88XHr0gaRUMIiVIIufUa+SVX/Ie6Zk0P8349gk8r3ShCNr+Y+DX3AVdVS/DkyQi73Q=
X-Received: by 2002:a1c:e482:: with SMTP id b124mr9599327wmh.25.1605868413382; 
 Fri, 20 Nov 2020 02:33:33 -0800 (PST)
MIME-Version: 1.0
References: <20200716035532.1407660-1-andrew@daynix.com>
In-Reply-To: <20200716035532.1407660-1-andrew@daynix.com>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Fri, 20 Nov 2020 13:05:36 +0200
Message-ID: <CABcq3pGFPkDMmEegGaw6UjHBijPZiyFj-uR+6Phz+0K44VRNgw@mail.gmail.com>
Subject: Re: [PATCH] hmp: Changed hmp_netdev_add() using
 qmp_marshal_netdev_add()
To: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="0000000000005615b405b4876031"
Received-SPF: none client-ip=2a00:1450:4864:20::343;
 envelope-from=andrew@daynix.com; helo=mail-wm1-x343.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Yan Vugenfirer <yan@daynix.com>,
 Yuri Benditovich <yuri.benditovich@daynix.com>, dgilbert@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000005615b405b4876031
Content-Type: text/plain; charset="UTF-8"

Ping

On Thu, Jul 16, 2020 at 6:26 AM <andrew@daynix.com> wrote:

> From: Andrew Melnychenko <andrew@daynix.com>
>
> There is an issue, that netdev can't be removed if it was added using hmp.
> The bug appears after 08712fcb851034228b61f75bd922863a984a4f60 commit.
> It happens because of unclear QemuOpts that was created during
> hmp_netdev_add(), now it uses qmp analog function -
> qmp_marshal_netdev_add().
>
> Signed-off-by: Andrew Melnychenko <andrew@daynix.com>
> ---
>  monitor/hmp-cmds.c | 15 +++------------
>  1 file changed, 3 insertions(+), 12 deletions(-)
>
> diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c
> index 2b0b58a336..b747935687 100644
> --- a/monitor/hmp-cmds.c
> +++ b/monitor/hmp-cmds.c
> @@ -1597,19 +1597,10 @@ void hmp_migrate(Monitor *mon, const QDict *qdict)
>  void hmp_netdev_add(Monitor *mon, const QDict *qdict)
>  {
>      Error *err = NULL;
> -    QemuOpts *opts;
> -
> -    opts = qemu_opts_from_qdict(qemu_find_opts("netdev"), qdict, &err);
> -    if (err) {
> -        goto out;
> -    }
> +    QDict *non_constant_dict = qdict_clone_shallow(qdict);
>
> -    netdev_add(opts, &err);
> -    if (err) {
> -        qemu_opts_del(opts);
> -    }
> -
> -out:
> +    qmp_marshal_netdev_add(non_constant_dict, NULL, &err);
> +    qobject_unref(non_constant_dict);
>      hmp_handle_error(mon, err);
>  }
>
> --
> 2.27.0
>
>

--0000000000005615b405b4876031
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Ping<br></div><br><div class=3D"gmail_quote"><div dir=3D"l=
tr" class=3D"gmail_attr">On Thu, Jul 16, 2020 at 6:26 AM &lt;<a href=3D"mai=
lto:andrew@daynix.com">andrew@daynix.com</a>&gt; wrote:<br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex">From: Andrew Melnychenko &lt;<a hre=
f=3D"mailto:andrew@daynix.com" target=3D"_blank">andrew@daynix.com</a>&gt;<=
br>
<br>
There is an issue, that netdev can&#39;t be removed if it was added using h=
mp.<br>
The bug appears after 08712fcb851034228b61f75bd922863a984a4f60 commit.<br>
It happens because of unclear QemuOpts that was created during<br>
hmp_netdev_add(), now it uses qmp analog function -<br>
qmp_marshal_netdev_add().<br>
<br>
Signed-off-by: Andrew Melnychenko &lt;<a href=3D"mailto:andrew@daynix.com" =
target=3D"_blank">andrew@daynix.com</a>&gt;<br>
---<br>
=C2=A0monitor/hmp-cmds.c | 15 +++------------<br>
=C2=A01 file changed, 3 insertions(+), 12 deletions(-)<br>
<br>
diff --git a/monitor/hmp-cmds.c b/monitor/hmp-cmds.c<br>
index 2b0b58a336..b747935687 100644<br>
--- a/monitor/hmp-cmds.c<br>
+++ b/monitor/hmp-cmds.c<br>
@@ -1597,19 +1597,10 @@ void hmp_migrate(Monitor *mon, const QDict *qdict)<=
br>
=C2=A0void hmp_netdev_add(Monitor *mon, const QDict *qdict)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0Error *err =3D NULL;<br>
-=C2=A0 =C2=A0 QemuOpts *opts;<br>
-<br>
-=C2=A0 =C2=A0 opts =3D qemu_opts_from_qdict(qemu_find_opts(&quot;netdev&qu=
ot;), qdict, &amp;err);<br>
-=C2=A0 =C2=A0 if (err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 goto out;<br>
-=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 QDict *non_constant_dict =3D qdict_clone_shallow(qdict);<br>
<br>
-=C2=A0 =C2=A0 netdev_add(opts, &amp;err);<br>
-=C2=A0 =C2=A0 if (err) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_opts_del(opts);<br>
-=C2=A0 =C2=A0 }<br>
-<br>
-out:<br>
+=C2=A0 =C2=A0 qmp_marshal_netdev_add(non_constant_dict, NULL, &amp;err);<b=
r>
+=C2=A0 =C2=A0 qobject_unref(non_constant_dict);<br>
=C2=A0 =C2=A0 =C2=A0hmp_handle_error(mon, err);<br>
=C2=A0}<br>
<br>
-- <br>
2.27.0<br>
<br>
</blockquote></div>

--0000000000005615b405b4876031--

