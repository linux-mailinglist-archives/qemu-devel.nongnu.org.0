Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AF291A4C
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Aug 2019 01:26:01 +0200 (CEST)
Received: from localhost ([::1]:43726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hzUYi-00035I-Ug
	for lists+qemu-devel@lfdr.de; Sun, 18 Aug 2019 19:26:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51567)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1hzUXp-0002av-Uf
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 19:25:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hzUXo-0003Py-W5
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 19:25:05 -0400
Received: from mx1.redhat.com ([209.132.183.28]:54308)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hzUXo-0003Pb-RB
 for qemu-devel@nongnu.org; Sun, 18 Aug 2019 19:25:04 -0400
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DA48F4E908
 for <qemu-devel@nongnu.org>; Sun, 18 Aug 2019 23:25:03 +0000 (UTC)
Received: by mail-wr1-f72.google.com with SMTP id s18so4295217wrt.21
 for <qemu-devel@nongnu.org>; Sun, 18 Aug 2019 16:25:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UMw/hfRnw/ejgBy8MR64EWqIpKyiWfDPzTzl8/pWrOE=;
 b=UmxQ9ZUOhBP7sRb3ZBFEf3MnehAqtx/r5SJaQra3mIuAk+nKNzhiwLJRlO/m7fyGH9
 C95P8Ybc7aHB8kuVo5jxwaGgd4uDk54jfCPlLdmTvFG4bXsMOEnGFP87Xzm9iVg4flry
 7hYWBStpk6jPHqxA0Kg+ddPr5Tw0nMwC6kl3T0f++gKFGvaKxnuXQIi4JqiAtbH2LvKt
 LelWZ5NZuUEQXD0qP6ZXdXjL/GKtwzzXwwcHAJk5yETJC0tlHHsReftSu37kuvZymFwU
 uj5UXMObJRT4gO+L8vTVYcDR2I/igkTaHbx3QakZviHowKheLKjc26hoOkFVgjDwtyCY
 xR6A==
X-Gm-Message-State: APjAAAW+cy4BajB2pygKWtWXE4nIUBDArIXSjRDJREGcBoXT9qvcFMPW
 WD00nwtDb3FBpkNbpZHQirbPch3Wn+acIH+mnO+Ew/Bd6UKSeIl16GjXbgTZYb5ueHbBLl/iHg0
 lUJaAZDEHTvmBubo=
X-Received: by 2002:adf:bace:: with SMTP id w14mr22780763wrg.283.1566170702717; 
 Sun, 18 Aug 2019 16:25:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyq/E5Ya4yp9cY1blX7Xmc0EGLH9FZK/28gU+N7rB1IwnjVEwC4EHm52fPCOcLCBHO3v0fhOQ==
X-Received: by 2002:adf:bace:: with SMTP id w14mr22780752wrg.283.1566170702565; 
 Sun, 18 Aug 2019 16:25:02 -0700 (PDT)
Received: from [192.168.1.39] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id g7sm301171wmh.1.2019.08.18.16.25.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Aug 2019 16:25:01 -0700 (PDT)
To: =?UTF-8?B?S8WRdsOhZ8OzLCBab2x0w6Fu?= <dirty.ice.hu@gmail.com>,
 qemu-devel@nongnu.org
References: <cover.1566168923.git.DirtY.iCE.hu@gmail.com>
 <ed35e9e72aa77c9376e9c8a8f3a5443703fe6fbe.1566168923.git.DirtY.iCE.hu@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <4db4fa19-65f5-0bc8-3354-a1779bbdb0f3@redhat.com>
Date: Mon, 19 Aug 2019 01:25:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <ed35e9e72aa77c9376e9c8a8f3a5443703fe6fbe.1566168923.git.DirtY.iCE.hu@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-devel] [PATCH v4 14/14] audio: fix memory leak reported
 by ASAN
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Zolt=C3=A1n,

On 8/19/19 1:06 AM, K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n wrote:
> Signed-off-by: K=C5=91v=C3=A1g=C3=B3, Zolt=C3=A1n <DirtY.iCE.hu@gmail.c=
om>
> ---
>  audio/audio.c | 6 ++++++
>  1 file changed, 6 insertions(+)
>=20
> diff --git a/audio/audio.c b/audio/audio.c
> index 924dddf2e7..9b28abca14 100644
> --- a/audio/audio.c
> +++ b/audio/audio.c
> @@ -1343,6 +1343,12 @@ static void free_audio_state(AudioState *s)
>          qapi_free_Audiodev(s->dev);
>          s->dev =3D NULL;
>      }
> +
> +    if (s->ts) {
> +        timer_free(s->ts);
> +        s->ts =3D NULL;
> +    }

Why not directly fix audio_cleanup() previous to your series?

> +
>      g_free(s);
>  }
> =20
>=20

