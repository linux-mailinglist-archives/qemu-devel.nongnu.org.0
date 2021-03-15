Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 203BD33ABC4
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 07:44:53 +0100 (CET)
Received: from localhost ([::1]:39736 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLgyB-0001ns-Tk
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 02:44:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54318)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lLgx8-0001MX-DW
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 02:43:46 -0400
Received: from mail-il1-x132.google.com ([2607:f8b0:4864:20::132]:39162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ma.mandourr@gmail.com>)
 id 1lLgx6-00018p-GJ
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 02:43:46 -0400
Received: by mail-il1-x132.google.com with SMTP id d5so8354862iln.6
 for <qemu-devel@nongnu.org>; Sun, 14 Mar 2021 23:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=V3C1gU15m4/Jmfogkv0yoGhxznoxxQNYOvZcXjaIAGo=;
 b=oL0VL65oXG7JPJ2hv4o8GTxuBCZ5FS8KnMj1RTmfPhvvQ/kmLUNHuzqYM0OR6rPCng
 o56jkjp97uu34AGvjQHcExMR7qo8+Z3TDdUtwRd/WLP12w8Iqn+OdFt9leiJ6l9L7UZM
 6118jK84Mfsd9WbdET8LCLybOhk8qREygUhlseDCXQ8Pfx6lKa9F3rlTLIhLWHKKlSA0
 8xtVXfwwmXS3pM5/+HN0uVSeCX/6HU5PAR6ic/lZcrQYc4ajMXrf6xlRD3hZIPSr/Q37
 mawWCVx7d8AcSCo82nIQ9Cc+Pfh03XqfQwvNCZoLv4LlYywLrCtTi4EAXGvnEWdun4XX
 Hcfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V3C1gU15m4/Jmfogkv0yoGhxznoxxQNYOvZcXjaIAGo=;
 b=R9YSoH0SdxCD22HzbVKmVrJ6T2NbG4UGZZ7npCA5KD+oYdyV3qJNii+LNsQ3M+DY2I
 6VMj73Znl6twzZfnxMA5gD0wKXza3mCdWruQqN4pNHlWPaeAJqNnFfVKSdl/PgTmFBE4
 B/ZqAjHxtug0/XygtKlwUzKobbrXmQ4FHLN2E+6OllHCeIigklVG3ZNved7oJvHvy0l/
 wxhBrJoW0jLHG+bHgUlj+tLcJH36VLtnUpNR3hy5BLETXqGW+z0pnnhoTdeXkFl6dIQ/
 eeuwAhrFYR+ZQeblsamTB3NBepRKdCYTrfj8BptvFUiHzni1/Qh/u1WJGT0a7jJwZOVW
 oCLA==
X-Gm-Message-State: AOAM533hnjkhCRico4VrCO4FOImFTQeWifZepEYRLeVLqwOewy9stYT8
 oNICjszkFAivNrgAP1uK6h6PzmUgjDMaWsHy3yw=
X-Google-Smtp-Source: ABdhPJwa3dPNtEVVLVG7PKqHXU3qpNew6/OQBJ7z7gdoUArE8yE4NAMyCBXyY3tYkaAnqjv4RYWyU0ctYub61iNQr+E=
X-Received: by 2002:a92:d7ce:: with SMTP id g14mr10047640ilq.255.1615790622815; 
 Sun, 14 Mar 2021 23:43:42 -0700 (PDT)
MIME-Version: 1.0
References: <20210314032324.45142-1-ma.mandourr@gmail.com>
 <20210314032324.45142-6-ma.mandourr@gmail.com>
 <dfa393ed-88ba-9c4b-e991-aeb9e73050a4@redhat.com>
In-Reply-To: <dfa393ed-88ba-9c4b-e991-aeb9e73050a4@redhat.com>
From: Mahmoud Mandour <ma.mandourr@gmail.com>
Date: Mon, 15 Mar 2021 08:43:31 +0200
Message-ID: <CAD-LL6hQuCFkzwnRGh1QLA8xsrTZoLYfNfXbKaU+E=UZAcozOA@mail.gmail.com>
Subject: Re: [PATCH 5/8] util/compatfd.c: Replaced a malloc with GLib's variant
To: Thomas Huth <thuth@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000001ab96c05bd8d92f2"
Received-SPF: pass client-ip=2607:f8b0:4864:20::132;
 envelope-from=ma.mandourr@gmail.com; helo=mail-il1-x132.google.com
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000001ab96c05bd8d92f2
Content-Type: text/plain; charset="UTF-8"

>
> If it's unrelated, then maybe better do it in a separate patch.
>

I thought so but I didn't know whether it was a so-small change
that it didn't require its own patch or not. I will amend that.

Since this is only a very small allocation, I think it would be better to
> use g_malloc() here and then simply remove the "if (info == NULL) ..."
> part.
>

I was thinking of always maintaining the semantics of the existing
code and since g_malloc() does not behave like malloc() on
error, I refrained from using g_malloc() anywhere, but of course
I'll do it since it's the better thing to do.

I will split the patches to a two-patch series regarding the
util/compactfd.c file (one for the style change and one for
changing the malloc() call into g_malloc()) and send them
again, is that ok?

--0000000000001ab96c05bd8d92f2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">If it&#39;s unrelated, then mayb=
e better do it in a separate patch.<div><div class=3D"gmail-adm"><div id=3D=
"gmail-q_161" class=3D"gmail-ajR gmail-h4"></div></div></div></blockquote><=
div><br></div><div>I thought so but I didn&#39;t know whether it was a so-s=
mall change=C2=A0</div><div>that it didn&#39;t=C2=A0require its own patch o=
r not. I will amend that.</div><div><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Since this is only a very small allocation, I think it=
 would be better to<br>use g_malloc() here and then simply remove the &quot=
;if (info =3D=3D NULL) ...&quot; part.<br></blockquote><div><br></div><div>=
I was thinking of always maintaining the semantics of the existing=C2=A0</d=
iv><div>code and since g_malloc() does not behave like malloc() on=C2=A0</d=
iv><div>error, I refrained from using g_malloc() anywhere, but of course</d=
iv><div>I&#39;ll do it since it&#39;s the better thing to do.</div><div><br=
></div><div>I will split the patches to a two-patch series regarding the=C2=
=A0</div><div>util/compactfd.c file (one for the style change and one for=
=C2=A0</div><div>changing the malloc() call into g_malloc()) and send them<=
/div><div>again, is that ok?</div><div><br></div></div></div></div>
</div>

--0000000000001ab96c05bd8d92f2--

