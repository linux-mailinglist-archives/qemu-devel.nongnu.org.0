Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 840B05ED0F5
	for <lists+qemu-devel@lfdr.de>; Wed, 28 Sep 2022 01:19:54 +0200 (CEST)
Received: from localhost ([::1]:54320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odJrl-00051B-EN
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 19:19:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odJnX-0002c0-JY
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 19:15:31 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1odJnU-0004IQ-T1
 for qemu-devel@nongnu.org; Tue, 27 Sep 2022 19:15:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1664320528;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xIMojhpvEKk2Djba2hObQj/BRFekMxfN7IUgQu3+N+0=;
 b=AA3u+WY8tmGEpfZ1ewyiZ2JLw+9rfvkyRjXOO4BEW6lm06Aduwew7rgbVWqjs3pBd+BKEA
 hc6QcY40fEdErytdzQikPQCPk1n8AM/jX8EgpbHfM2ENyuE1cEz6mCsEZFbObQN0FF1pSi
 k28nWF/SpqnSsO3LENBujdshHv3jpuM=
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-501-Vz7bF3q3Pymyl3k3esk43Q-1; Tue, 27 Sep 2022 19:15:26 -0400
X-MC-Unique: Vz7bF3q3Pymyl3k3esk43Q-1
Received: by mail-vk1-f199.google.com with SMTP id
 w6-20020a1f9406000000b00388997b8d31so3806737vkd.3
 for <qemu-devel@nongnu.org>; Tue, 27 Sep 2022 16:15:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=xIMojhpvEKk2Djba2hObQj/BRFekMxfN7IUgQu3+N+0=;
 b=duej6Izi1VZUdNmxrz06VIapXSzOhN3GuK3Wu05010fRgl/iGEjkLpH4hjsu1G19m+
 KarpBEA5X3dxh33OUsZjiOZPnx3oNI+L0jDeRWWU0wpe/RC48HAkc2gCv3rsZAPJMbs3
 X/grigrgnf9BoAYsFMHELfkhoe/9TNrVl62tKsp7pelCJ9cBfwIM2nvFnWLcE2IN5EkN
 /ew6pSeL8k3LJGHz8rjrnRd1c026kpJXz0CpcA1X5VzUYQaKDk4T6wD4ME3kRyvrykty
 xYTWLQOKqZ/Axc4h3muGKcT1xELv4wGugQqTGx/66gGkg189YK9rFZ7UCIvl2YxOI+41
 odMQ==
X-Gm-Message-State: ACrzQf39Cz3mecfFPya4fworXB8thDyPSGmIhvzfnrUksHlF4+wD5mvd
 dibsJXH6KYPP+t7WRfyZsaKailt+7hlQhzvt4jgRvX4sds3fOQHJ1Ari5IgAGy9/BcyRsI/xBNP
 oybBqqQOQ0g+KmFMU7j5IhJZ4RibF26M=
X-Received: by 2002:a67:fc44:0:b0:398:30ac:1c95 with SMTP id
 p4-20020a67fc44000000b0039830ac1c95mr12650285vsq.16.1664320526291; 
 Tue, 27 Sep 2022 16:15:26 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM5JGc5C53BlB1/IO1METmCKO6z/LijHt1HwmE1YPYuzi7QPoUz7K0sMMTkEmYW3kMKaO7z16g17hblM9h5pyFg=
X-Received: by 2002:a67:fc44:0:b0:398:30ac:1c95 with SMTP id
 p4-20020a67fc44000000b0039830ac1c95mr12650271vsq.16.1664320526008; Tue, 27
 Sep 2022 16:15:26 -0700 (PDT)
MIME-Version: 1.0
References: <20220927213501.4069117-1-alex.bennee@linaro.org>
In-Reply-To: <20220927213501.4069117-1-alex.bennee@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Wed, 28 Sep 2022 01:15:14 +0200
Message-ID: <CABgObfYjhe7_qTRYMz_eeTCaJekHOBe3WLrx_OnPBfaMRcuMKA@mail.gmail.com>
Subject: Re: [RFC PATCH] tests/qtest: bump up QOS_PATH_MAX_ELEMENT_SIZE
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel <qemu-devel@nongnu.org>, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000bed6ee05e9b0d17b"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

--000000000000bed6ee05e9b0d17b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

What is an example of one such huge path? This would mean that LTO is
changing the set of tests that are run, which is unexpected.

Paolo

Il mar 27 set 2022, 23:35 Alex Benn=C3=A9e <alex.bennee@linaro.org> ha scri=
tto:

> It seems the depth of path we need to support can vary depending on
> the order of the init constructors getting called. It seems
> --enable-lto shuffles things around just enough to push you over the
> limit.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Fixes: https://gitlab.com/qemu-project/qemu/-/issues/1186
> ---
>  tests/qtest/libqos/qgraph.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tests/qtest/libqos/qgraph.h b/tests/qtest/libqos/qgraph.h
> index 6e94824d09..5c0046e989 100644
> --- a/tests/qtest/libqos/qgraph.h
> +++ b/tests/qtest/libqos/qgraph.h
> @@ -24,7 +24,7 @@
>  #include "libqos-malloc.h"
>
>  /* maximum path length */
> -#define QOS_PATH_MAX_ELEMENT_SIZE 50
> +#define QOS_PATH_MAX_ELEMENT_SIZE 64
>
>  typedef struct QOSGraphObject QOSGraphObject;
>  typedef struct QOSGraphNode QOSGraphNode;
> --
> 2.34.1
>
>

--000000000000bed6ee05e9b0d17b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">What is an example of one such huge path? This would mean=
 that LTO is changing the set of tests that are run, which is unexpected.<d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Paolo</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il mar 27 set 2022, =
23:35 Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.org">alex.b=
ennee@linaro.org</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex=
">It seems the depth of path we need to support can vary depending on<br>
the order of the init constructors getting called. It seems<br>
--enable-lto shuffles things around just enough to push you over the<br>
limit.<br>
<br>
Signed-off-by: Alex Benn=C3=A9e &lt;<a href=3D"mailto:alex.bennee@linaro.or=
g" target=3D"_blank" rel=3D"noreferrer">alex.bennee@linaro.org</a>&gt;<br>
Fixes: <a href=3D"https://gitlab.com/qemu-project/qemu/-/issues/1186" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://gitlab.com/qemu-projec=
t/qemu/-/issues/1186</a><br>
---<br>
=C2=A0tests/qtest/libqos/qgraph.h | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/tests/qtest/libqos/qgraph.h b/tests/qtest/libqos/qgraph.h<br>
index 6e94824d09..5c0046e989 100644<br>
--- a/tests/qtest/libqos/qgraph.h<br>
+++ b/tests/qtest/libqos/qgraph.h<br>
@@ -24,7 +24,7 @@<br>
=C2=A0#include &quot;libqos-malloc.h&quot;<br>
<br>
=C2=A0/* maximum path length */<br>
-#define QOS_PATH_MAX_ELEMENT_SIZE 50<br>
+#define QOS_PATH_MAX_ELEMENT_SIZE 64<br>
<br>
=C2=A0typedef struct QOSGraphObject QOSGraphObject;<br>
=C2=A0typedef struct QOSGraphNode QOSGraphNode;<br>
-- <br>
2.34.1<br>
<br>
</blockquote></div>

--000000000000bed6ee05e9b0d17b--


