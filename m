Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7962C36C905
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 18:02:35 +0200 (CEST)
Received: from localhost ([::1]:58686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbQAU-0000gt-5i
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 12:02:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47030)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lbQ7Q-0008D5-Jf
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 11:59:24 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:45020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lbQ7O-0004Y5-UQ
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 11:59:24 -0400
Received: by mail-ej1-x636.google.com with SMTP id r20so40499931ejo.11
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 08:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=LUCbdeyv+kJp6uvCLhPdKK+6jd6HMhp3Lu55g/eDgX4=;
 b=j+TFVctyUY7t9FSOZs+bc1d/OmHfX8IBVGmqa/wqEL+OFGe10W8yGEFkkRA8ry4NqN
 LfaUcUoNQsmIo51ooyERJVudtJw+RaGIUiyFlkIpoAwWxGg2/xDLjFLIWPIJKJ9o8rS3
 QWJh3EpX103rzfYr5iwyzDQ0K4HAFLJTyn7WC9a4F6YOZTTpSUrt+i1tvnpzvT+uJw3C
 HCpQEmTFjDvcvJQm9GUITv8S+N1bW9tezo+y03eXQY16P3LzEM2gdAkT95g/wFu2X784
 97IWCWxt4w1ahrLAYmRk1l2lSCkL0VBh5sd/2weuEB3Dga5qzesVu8bu2A8AIDggCjvf
 O8kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LUCbdeyv+kJp6uvCLhPdKK+6jd6HMhp3Lu55g/eDgX4=;
 b=fugSU8LfrmIYLNPSvEJN4NXYQCqy63TS97YwfEAPdElUcOxDsgaUxwMotVGCz4oLxI
 aKpAjKqbHABX7lKfDAGczGeSD/7a4Bkz3Via1VfS4MUKyNvEWpHh3nx110ZNGVSYxOeh
 paTwvEUwHHzhPA83QuwiZBOXNyWChgNUopQQ/lRdbVWYMgofuEdpcpD0l4VRSs8VRn7v
 KkOtShDaWA2jzJXe1fsxZHQhIUj/ocklKUR1PtK5FM+liFS4PnTz4qDRv4ut02qehCSX
 Ml+3e8ZSWFQtR5RGyntftBQXnQI5Jb9Lf1Vjn734yZ5uaPviF0ICrIcEhNFzdYFYJahS
 t3LQ==
X-Gm-Message-State: AOAM533P1ajboWtqrJFedw1rtjArwbLOnDzW6GNSArpqiVI3ZgQTqnzl
 Mt/BP/ZnZ351ZbuVa0ir2B3hqmkH9ydJsaRiqd8=
X-Google-Smtp-Source: ABdhPJxUCpfyoQekVO5CdS7VSTvGgtmDHj3geuJpoFz14db339//PeaSh5buZMDrbe1U7f7xNJ/bzeIQgqGa42TMcv8=
X-Received: by 2002:a17:906:6d48:: with SMTP id
 a8mr24636818ejt.92.1619539161131; 
 Tue, 27 Apr 2021 08:59:21 -0700 (PDT)
MIME-Version: 1.0
References: <20210427150824.638359-1-kraxel@redhat.com>
 <20210427150824.638359-5-kraxel@redhat.com>
In-Reply-To: <20210427150824.638359-5-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 27 Apr 2021 19:59:08 +0400
Message-ID: <CAJ+F1CKCw+0n8ZoTLekryZGNP8HRHSrJDO1J2F=zaGqdMQkBXQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/8] edid: use dta extension block descriptors
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000006630d505c0f65815"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x636.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006630d505c0f65815
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 27, 2021 at 7:23 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> When the 4 descriptors in the base edid block are filled, jump to the
> dta extension block.  This allows for more than four descriptors.
> Happens for example when generating an edid blob with a serial number
> (qemu-edid -s $serial).
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  hw/display/edid-generate.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/hw/display/edid-generate.c b/hw/display/edid-generate.c
> index 25f790c7bd85..42a130f0ff5c 100644
> --- a/hw/display/edid-generate.c
> +++ b/hw/display/edid-generate.c
> @@ -152,6 +152,14 @@ static uint8_t *edid_desc_next(uint8_t *edid, uint8_=
t
> *dta, uint8_t *desc)
>      if (desc + 18 + 18 < edid + 127) {
>          return desc + 18;
>      }
> +    if (dta) {
> +        if (desc < edid + 127) {
> +            return dta + dta[2];
> +        }
> +        if (desc + 18 + 18 < dta + 127) {
> +            return desc + 18;
> +        }
> +    }
>      return NULL;
>  }
>
> --
> 2.30.2
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000006630d505c0f65815
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Apr 27, 2021 at 7:23 PM Gerd =
Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">When the=
 4 descriptors in the base edid block are filled, jump to the<br>
dta extension block.=C2=A0 This allows for more than four descriptors.<br>
Happens for example when generating an edid blob with a serial number<br>
(qemu-edid -s $serial).<br>
<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br></blockquote><div><br></div><div>=
Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0hw/display/edid-generate.c | 8 ++++++++<br>
=C2=A01 file changed, 8 insertions(+)<br>
<br>
diff --git a/hw/display/edid-generate.c b/hw/display/edid-generate.c<br>
index 25f790c7bd85..42a130f0ff5c 100644<br>
--- a/hw/display/edid-generate.c<br>
+++ b/hw/display/edid-generate.c<br>
@@ -152,6 +152,14 @@ static uint8_t *edid_desc_next(uint8_t *edid, uint8_t =
*dta, uint8_t *desc)<br>
=C2=A0 =C2=A0 =C2=A0if (desc + 18 + 18 &lt; edid + 127) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return desc + 18;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 if (dta) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (desc &lt; edid + 127) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return dta + dta[2];<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (desc + 18 + 18 &lt; dta + 127) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return desc + 18;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0return NULL;<br>
=C2=A0}<br>
<br>
-- <br>
2.30.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000006630d505c0f65815--

