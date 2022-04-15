Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C256502699
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 10:21:41 +0200 (CEST)
Received: from localhost ([::1]:38836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfHD2-0008EO-Ds
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 04:21:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43882)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nfH6G-0004Vw-TY
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 04:14:40 -0400
Received: from mail-oo1-xc2c.google.com ([2607:f8b0:4864:20::c2c]:33563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nfH6F-0007Rr-6e
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 04:14:40 -0400
Received: by mail-oo1-xc2c.google.com with SMTP id
 w20-20020a4ae9f4000000b003243aa2c71aso1283081ooc.0
 for <qemu-devel@nongnu.org>; Fri, 15 Apr 2022 01:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/QYDKt+o0ufY3I8XE9u5GC35UEFMVOv/q8vkXRHcH8Q=;
 b=jYRkDBSct6u2n9NyXH6k5LfZSYdpdYSqDrIRAvlQpJ/J3E0jZtOn1L9CQ0fYljeD/z
 /8fDzat14cOPtOTiacOm/NADintDrV1Nv2WcpGZ4P5+qBr/vmYLBtv3uKL3qi6OXxs0f
 XCxD39bUCOhAPVuys9OW2EdOtYpcAwGkrm8RHNotG3OpFla9jVN5Z2hFVfrg8IeA3uma
 KwT2NEEjuEmAXL/TwwUiy9xp4yLibFKpPo1mfLiGTGJf4iiM9Ya032Iu9ghYaZ5QrpB8
 dI86aNuXYo9nLLlyYraW3TV55x273A3yaVJPkuYZO3ffVWgdZwDG8byXg5KMAeZTUp+E
 ZfwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/QYDKt+o0ufY3I8XE9u5GC35UEFMVOv/q8vkXRHcH8Q=;
 b=ro7C+iqlDs2UqDgb15/K21cvH/Y0e+iq0mibLDlN40zG9RgeO01hSG5gjwpSZvSQ+q
 aC3BuRn2MHH53oSLfNsjVUER3bZu+7kjv/Cx05AdYqRshIWbKZH9ih86uWspUi9zW6VU
 pqmQ+PiLY5/LodsqLzfApApf8PgnJDaVZzD/XaIKOoPyBF2atr4LicEu8/r1qBXKYVoB
 XqYQ12Vyeh2EoiIrmjc8wzz464+DQ4Kyg44/VsXvoSHADIEPxmuPuT5j880YT9r5L5BR
 1+7PO1BDM/lUnWNJ3hyJTXUl33Y3tBaiJJSNSn+xBFyfJDwty6+KNDTkSsUeXSVoOC6+
 jAxg==
X-Gm-Message-State: AOAM5320px1S0saiH80z4fcHyIXhE1aY9EyYc1doQgdV0aDZbXZxJNGX
 k8ng8AxnbUaunbNo7Yp48aU8XT7lLh7456kGmEk=
X-Google-Smtp-Source: ABdhPJxsNl+k+J2A7ZQ99QzgJgbEaVkYL0e8/RsPLwqFDQvTxH6RjcZ31toJBocfCC2bwPqgNJu0v/0PI77EXMayz90=
X-Received: by 2002:a4a:e4c7:0:b0:329:afad:cb2d with SMTP id
 w7-20020a4ae4c7000000b00329afadcb2dmr1951202oov.77.1650010478026; Fri, 15 Apr
 2022 01:14:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220413220007.14467-1-adeason@sinenomine.net>
 <20220413220007.14467-5-adeason@sinenomine.net>
In-Reply-To: <20220413220007.14467-5-adeason@sinenomine.net>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Fri, 15 Apr 2022 12:14:25 +0400
Message-ID: <CAJ+F1CK3tSYzs7WpH==qvwvxvtbn2jHyjEf8QvUxAFv4eE5tcw@mail.gmail.com>
Subject: Re: [PATCH v2 4/5] qga/commands-posix: Log all net stats failures
To: Andrew Deason <adeason@sinenomine.net>
Content-Type: multipart/alternative; boundary="0000000000006b24ee05dcad00c6"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-oo1-xc2c.google.com
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
Cc: Michael Roth <michael.roth@amd.com>, QEMU <qemu-devel@nongnu.org>,
 Michal Privoznik <mprivozn@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000006b24ee05dcad00c6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 14, 2022 at 2:01 AM Andrew Deason <adeason@sinenomine.net>
wrote:

> guest_get_network_stats can silently fail in a couple of ways. Add
> debug messages to these cases, so we're never completely silent on
> failure.
>
> Signed-off-by: Andrew Deason <adeason@sinenomine.net>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>


> ---
> Changes since v1:
> - new in v2
>
>  qga/commands-posix.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/qga/commands-posix.c b/qga/commands-posix.c
> index c0b00fc488..97e001e998 100644
> --- a/qga/commands-posix.c
> +++ b/qga/commands-posix.c
> @@ -2789,20 +2789,22 @@ static int guest_get_network_stats(const char
> *name,
>                         GuestNetworkInterfaceStat *stats)
>  {
>  #ifdef CONFIG_LINUX
>      int name_len;
>      char const *devinfo =3D "/proc/net/dev";
>      FILE *fp;
>      char *line =3D NULL, *colon;
>      size_t n =3D 0;
>      fp =3D fopen(devinfo, "r");
>      if (!fp) {
> +        g_debug("failed to open network stats %s: %s", devinfo,
> +                g_strerror(errno));
>          return -1;
>      }
>      name_len =3D strlen(name);
>      while (getline(&line, &n, fp) !=3D -1) {
>          long long dummy;
>          long long rx_bytes;
>          long long rx_packets;
>          long long rx_errs;
>          long long rx_dropped;
>          long long tx_bytes;
> @@ -2837,21 +2839,23 @@ static int guest_get_network_stats(const char
> *name,
>              stats->tx_errs =3D tx_errs;
>              stats->tx_dropped =3D tx_dropped;
>              fclose(fp);
>              g_free(line);
>              return 0;
>          }
>      }
>      fclose(fp);
>      g_free(line);
>      g_debug("/proc/net/dev: Interface '%s' not found", name);
> -#endif /* CONFIG_LINUX */
> +#else /* !CONFIG_LINUX */
> +    g_debug("Network stats reporting available only for Linux");
> +#endif /* !CONFIG_LINUX */
>      return -1;
>  }
>
>  /*
>   * Build information about guest interfaces
>   */
>  GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **errp=
)
>  {
>      GuestNetworkInterfaceList *head =3D NULL, **tail =3D &head;
>      struct ifaddrs *ifap, *ifa;
> --
> 2.11.0
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000006b24ee05dcad00c6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, Apr 14, 2022 at 2:01 AM Andre=
w Deason &lt;<a href=3D"mailto:adeason@sinenomine.net">adeason@sinenomine.n=
et</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">guest_get_network_stats can silently fail in a couple of ways. Add<br>
debug messages to these cases, so we&#39;re never completely silent on<br>
failure.<br>
<br>
Signed-off-by: Andrew Deason &lt;<a href=3D"mailto:adeason@sinenomine.net" =
target=3D"_blank">adeason@sinenomine.net</a>&gt;<br></blockquote><div><br><=
/div><div><div>Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:ma=
rcandre.lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a=
>&gt;</div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
Changes since v1:<br>
- new in v2<br>
<br>
=C2=A0qga/commands-posix.c | 6 +++++-<br>
=C2=A01 file changed, 5 insertions(+), 1 deletion(-)<br>
<br>
diff --git a/qga/commands-posix.c b/qga/commands-posix.c<br>
index c0b00fc488..97e001e998 100644<br>
--- a/qga/commands-posix.c<br>
+++ b/qga/commands-posix.c<br>
@@ -2789,20 +2789,22 @@ static int guest_get_network_stats(const char *name=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 GuestNetworkInterfaceStat *stats)<br>
=C2=A0{<br>
=C2=A0#ifdef CONFIG_LINUX<br>
=C2=A0 =C2=A0 =C2=A0int name_len;<br>
=C2=A0 =C2=A0 =C2=A0char const *devinfo =3D &quot;/proc/net/dev&quot;;<br>
=C2=A0 =C2=A0 =C2=A0FILE *fp;<br>
=C2=A0 =C2=A0 =C2=A0char *line =3D NULL, *colon;<br>
=C2=A0 =C2=A0 =C2=A0size_t n =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0fp =3D fopen(devinfo, &quot;r&quot;);<br>
=C2=A0 =C2=A0 =C2=A0if (!fp) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_debug(&quot;failed to open network stats %s:=
 %s&quot;, devinfo,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_strerror(errno))=
;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0name_len =3D strlen(name);<br>
=C2=A0 =C2=A0 =C2=A0while (getline(&amp;line, &amp;n, fp) !=3D -1) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0long long dummy;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0long long rx_bytes;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0long long rx_packets;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0long long rx_errs;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0long long rx_dropped;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0long long tx_bytes;<br>
@@ -2837,21 +2839,23 @@ static int guest_get_network_stats(const char *name=
,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stats-&gt;tx_errs =3D tx_er=
rs;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0stats-&gt;tx_dropped =3D tx=
_dropped;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fclose(fp);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0g_free(line);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0 =C2=A0 =C2=A0fclose(fp);<br>
=C2=A0 =C2=A0 =C2=A0g_free(line);<br>
=C2=A0 =C2=A0 =C2=A0g_debug(&quot;/proc/net/dev: Interface &#39;%s&#39; not=
 found&quot;, name);<br>
-#endif /* CONFIG_LINUX */<br>
+#else /* !CONFIG_LINUX */<br>
+=C2=A0 =C2=A0 g_debug(&quot;Network stats reporting available only for Lin=
ux&quot;);<br>
+#endif /* !CONFIG_LINUX */<br>
=C2=A0 =C2=A0 =C2=A0return -1;<br>
=C2=A0}<br>
<br>
=C2=A0/*<br>
=C2=A0 * Build information about guest interfaces<br>
=C2=A0 */<br>
=C2=A0GuestNetworkInterfaceList *qmp_guest_network_get_interfaces(Error **e=
rrp)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0GuestNetworkInterfaceList *head =3D NULL, **tail =3D &a=
mp;head;<br>
=C2=A0 =C2=A0 =C2=A0struct ifaddrs *ifap, *ifa;<br>
-- <br>
2.11.0<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000006b24ee05dcad00c6--

