Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAA92D1C39
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Dec 2020 22:38:14 +0100 (CET)
Received: from localhost ([::1]:48216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmOCz-0002SU-4u
	for lists+qemu-devel@lfdr.de; Mon, 07 Dec 2020 16:38:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1kmOAQ-0001AI-5D
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 16:35:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1kmOAL-0007FP-DU
 for qemu-devel@nongnu.org; Mon, 07 Dec 2020 16:35:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607376927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mU8RUMs7oWEoUJIA99T6jby7D0JBGuHBlC/3z8LD+3g=;
 b=DeXJODVwUJnQ9FbWCDVI1601gCOmhGrNOQgv/nxGe6tkJlZDsa84iTLxrwkMMuF97rda6Q
 di2UIQpywJF1hoDRWicycsWGJ1Dmn6ianxlkopdiexo5Wh9dPY4O6gNQ004gnuQnG9qIv6
 zae3baiajYPHNyeUVkhq8sf5g7b0LCA=
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com
 [209.85.222.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-530-gdIS96DoMVaGyBo17b_TyQ-1; Mon, 07 Dec 2020 16:35:25 -0500
X-MC-Unique: gdIS96DoMVaGyBo17b_TyQ-1
Received: by mail-ua1-f70.google.com with SMTP id 1so3558986uaz.21
 for <qemu-devel@nongnu.org>; Mon, 07 Dec 2020 13:35:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=mU8RUMs7oWEoUJIA99T6jby7D0JBGuHBlC/3z8LD+3g=;
 b=ctW0DZBHJhVk57sG5a8zL9gxQtiRMDmLssOdcQR0g3HXyoQ3C7ZA2iStmk98fgrdSe
 XOIqsCgMmq4qOYyTnIuSctXlLyxLDwut2HJWcK3o+9RqEr9g4npf0EcWEU2Tz4WUuSbv
 AbicMbWHdENFZ0t+EwWjRdsF2rbWrBp5OlEYUbjGgOsPcP0aJ9Tjq5qkMAdDnKNhlbJJ
 PA8IbokRQ35UIMtE66rwAqO9rPO/KHNFjFe8AiM5rKB9PF0X4MZaguQ4FwtZ2QOcXSVK
 Ry56HiLiMhvkq9vq2rdKjr/nNf05Kd8K4bSJqm1nOR7LOsRN0eDNYg64vHqejynx2hF7
 26kw==
X-Gm-Message-State: AOAM533gw3jKdvjZ+lZ0n7QC3XwZWv/++ykL1FqAOornoz75tFoKs6T4
 gaLpuspT4bPsbsvGia4fDGus/LT2a1CcswpyvSww8zpVWkPj8t64GlFd6Wcztkvr+7yqeihZMS1
 nprdjf9SpBwNy/AY95vULalLasvd/pTc=
X-Received: by 2002:a05:6102:394:: with SMTP id
 m20mr2455115vsq.50.1607376925479; 
 Mon, 07 Dec 2020 13:35:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyNC9HWA9mTky90jzz/vXAiJWirfADilu0ecJjn/wj9viVYdnJpTIBeEU3g1NfxwSklJA/nAsyCBruU+5Q3f1Y=
X-Received: by 2002:a05:6102:394:: with SMTP id
 m20mr2455105vsq.50.1607376925293; 
 Mon, 07 Dec 2020 13:35:25 -0800 (PST)
MIME-Version: 1.0
References: <20201207200737.5090-1-alex.bennee@linaro.org>
In-Reply-To: <20201207200737.5090-1-alex.bennee@linaro.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 7 Dec 2020 18:35:14 -0300
Message-ID: <CAKJDGDbdHXPAKUXpJFXufs6ip0LNikacvBstdyxr4v3kv8ox=w@mail.gmail.com>
Subject: Re: [RFC PATCH] python: add __repr__ to ConsoleSocket to aid debugging
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=63.128.21.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Cleber Rosa <crosa@redhat.com>, John Snow <jsnow@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Dec 7, 2020 at 5:10 PM Alex Benn=C3=A9e <alex.bennee@linaro.org> wr=
ote:
>
> While attempting to debug some console weirdness I thought it would be
> worth making it easier to see what it had inside.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  python/qemu/console_socket.py | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/python/qemu/console_socket.py b/python/qemu/console_socket.p=
y
> index f060d79e06..77966d1fe9 100644
> --- a/python/qemu/console_socket.py
> +++ b/python/qemu/console_socket.py
> @@ -45,6 +45,14 @@ class ConsoleSocket(socket.socket):
>          if drain:
>              self._drain_thread =3D self._thread_start()
>
> +    def __repr__(self):
> +        s =3D super(ConsoleSocket, self).__repr__()
> +        s =3D s.rstrip(">")
> +        s +=3D ", logfile=3D%s" % (self._logfile)
> +        s +=3D ", drain_thread=3D%s" % (self._drain_thread)
> +        s +=3D ">"

We could use something more pythonic for this file. Instead of 3
string concatenations, my suggestion is to go with string formatting,
like:

s =3D "%s,  logfile=3D%s, drain_thread=3D%s>" % (s, self._logfile, self._dr=
ain_thread)

As str is immutable in Python, it avoids unnecessary copies.

> +        return s
> +
>      def _drain_fn(self) -> None:
>          """Drains the socket and runs while the socket is open."""
>          while self._open:
> --
> 2.20.1
>
>


