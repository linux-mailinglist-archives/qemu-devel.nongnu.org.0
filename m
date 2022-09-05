Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0435AD18B
	for <lists+qemu-devel@lfdr.de>; Mon,  5 Sep 2022 13:27:57 +0200 (CEST)
Received: from localhost ([::1]:49576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oVAGi-0005BR-ED
	for lists+qemu-devel@lfdr.de; Mon, 05 Sep 2022 07:27:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33296)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oV9pn-0003e2-85
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:00:07 -0400
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132]:45932)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1oV9pl-000383-AN
 for qemu-devel@nongnu.org; Mon, 05 Sep 2022 07:00:06 -0400
Received: by mail-lf1-x132.google.com with SMTP id w8so12549328lft.12
 for <qemu-devel@nongnu.org>; Mon, 05 Sep 2022 04:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=FHY7qalRbI7c6iXRSj9wwZQwpoe+3zb6QUbsBUqO690=;
 b=axUywU27thfG+n/9bsdMg/rHY+LeoZQ1XcMcE8VNOSAdw7+repAjae7XD7BLRkffjP
 25ic78z37i8TX6MGudjYHYVeabE6nhWvUfA5P47/HbvapfZp+1qe7ijqyUc2qQpnVwDt
 FD7MtRRLw8rCzp29twxk89tJ1f6m0RhAYqLIafNN7csZu+yBjNetEwKhfGvGeChDla3B
 WBh8qVun8+U9xHxILTC1aiLj/9qLIlq3cWyCyjT5JImbcStBvum0lOe2nPWQ/Pk51tXf
 HDg4OhysO3v+OfMGiPE6jBLBU/SmKcReTVcBfaaOiZK4agqCSgry+yr0qoL0qysYvOJ2
 WCgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=FHY7qalRbI7c6iXRSj9wwZQwpoe+3zb6QUbsBUqO690=;
 b=4FpiJjL9jTpsFTWlQQuFeNFsTIHe4HFdICAao23ttlvb6H3kvltpZuR8k2uh0w+C9X
 aWD0edTMpGnIaHxDQMxXTDkGYgiD7ghM2tfvx7sDNUUJwTNAudHyl8pwTzZbL8gLyZJp
 WnF1iXzcbCLSpp5W/aW1I3lvmfCJ/PCchOAAuhR09RMfk6F4FtjH2y2ml3oVvlqJ6XEc
 HZXAyXkGsk57Db7YpyJel8/HbKt9rac+d+K7rkzDxCYAwofddRhi1F9w2nmS1Xbw2hDJ
 RjJyBkWEyGK17f6H43t/jGlgGDEdD3E4e+aXZY0cyGN7EnpTi9qRjlCdvJmMIe7F3+Mg
 DkBg==
X-Gm-Message-State: ACgBeo3OLsBZhX7o1N5VN6WqI89KNE8iM/CzjKFf1/8q2xwKsZfi07yG
 iotKFmxok9CtaoXDNdzXCfM2Dci+O4K3ycF3kOs=
X-Google-Smtp-Source: AA6agR7ZyU/OoNtxDzK7fi/KWiSkqkkIqKQQYwsC6U8XtqUvvxU9IOvWh28tjy8cSLKyYdr+xnlsjF3H6maqVysNZVA=
X-Received: by 2002:a05:6512:3c9d:b0:494:a03a:13bf with SMTP id
 h29-20020a0565123c9d00b00494a03a13bfmr6407513lfv.329.1662375603455; Mon, 05
 Sep 2022 04:00:03 -0700 (PDT)
MIME-Version: 1.0
References: <20220905100621.18289-1-pbonzini@redhat.com>
In-Reply-To: <20220905100621.18289-1-pbonzini@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 5 Sep 2022 14:59:51 +0400
Message-ID: <CAJ+F1CJwkGGQRhpWLK7XTX+kvm4DNY80jpqM+kvA0XjSVgi39g@mail.gmail.com>
Subject: Re: [PATCH] kvm: fix memory leak on failure to read stats descriptors
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000053cc2405e7ebfb5e"
Received-SPF: pass client-ip=2a00:1450:4864:20::132;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lf1-x132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--00000000000053cc2405e7ebfb5e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 5, 2022 at 2:32 PM Paolo Bonzini <pbonzini@redhat.com> wrote:

> Reported by Coverity as CID 1490142.
>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
>  accel/kvm/kvm-all.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 7c8ce18bdd..208b0c74e3 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -3962,6 +3962,7 @@ static StatsDescriptors
> *find_stats_descriptors(StatsTarget target, int stats_fd
>                     size_desc * kvm_stats_header->num_desc, ret);
>          g_free(descriptors);
>          g_free(kvm_stats_desc);
> +        g_free(kvm_stats_header);
>          return NULL;
>      }
>      descriptors->kvm_stats_header =3D kvm_stats_header;
> --
> 2.37.2
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000053cc2405e7ebfb5e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Sep 5, 2022 at 2:32 PM Paolo =
Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com">pbonzini@redhat.com</a>&=
gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Repor=
ted by Coverity as CID 1490142.<br>
<br>
Signed-off-by: Paolo Bonzini &lt;<a href=3D"mailto:pbonzini@redhat.com" tar=
get=3D"_blank">pbonzini@redhat.com</a>&gt;<br></blockquote><div><br></div><=
div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lur=
eau@redhat.com">marcandre.lureau@redhat.com</a>&gt;</div><div>=C2=A0<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0accel/kvm/kvm-all.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c<br>
index 7c8ce18bdd..208b0c74e3 100644<br>
--- a/accel/kvm/kvm-all.c<br>
+++ b/accel/kvm/kvm-all.c<br>
@@ -3962,6 +3962,7 @@ static StatsDescriptors *find_stats_descriptors(Stats=
Target target, int stats_fd<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 size_=
desc * kvm_stats_header-&gt;num_desc, ret);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(descriptors);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(kvm_stats_desc);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(kvm_stats_header);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0descriptors-&gt;kvm_stats_header =3D kvm_stats_header;<=
br>
-- <br>
2.37.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000053cc2405e7ebfb5e--

