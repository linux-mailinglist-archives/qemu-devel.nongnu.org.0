Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F067E54E55D
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Jun 2022 16:50:55 +0200 (CEST)
Received: from localhost ([::1]:44748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1qpj-0007hH-3S
	for lists+qemu-devel@lfdr.de; Thu, 16 Jun 2022 10:50:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o1qhC-0000e3-6M
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 10:42:06 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:47084)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1o1qh9-0004TT-F9
 for qemu-devel@nongnu.org; Thu, 16 Jun 2022 10:42:04 -0400
Received: by mail-lj1-x235.google.com with SMTP id l18so1706497lje.13
 for <qemu-devel@nongnu.org>; Thu, 16 Jun 2022 07:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=86NhjvFuQJapdnubqu2iUm4j/uRqNrHzJegip0iiiqs=;
 b=I1dwaABO18yCf/vLSZ4xZQ3m2GI+lnyYudFgwt1ZvzC1ach0C/F+KQY1F1M4ZQwGTj
 EHuihbPu//G9SZxjtPVGdjC5cIi4HQlYIN/looRPfqLe/VKOx374JeMVQfXhfEksjhJn
 3pK9dvBhqNZOqsvUbZHNE5VUHJi/IILKoVMoEiu4iyMghAK7MnoDsegOwVW1DRHMyqfW
 2/p3VGTbfexdj3JKxGnoKVU8WatWRzwAnOD8GVLfkLxouF+jdes+bKNYGKWm1ENIIIry
 qpRUeRiL0rEtvzJHqEMINsKFLu0gwjYbhdXPPDLHZktgMF9KTGDAZjwKcv5m0EJl6pb5
 wGPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=86NhjvFuQJapdnubqu2iUm4j/uRqNrHzJegip0iiiqs=;
 b=UIHbURTyrpciHP6MxydPGqh5K6Larm3vk1e0aDWRsnGKJdd8WIK9k1m0/Ld49bIxTa
 2yXlmii0aJKWqGOWmrbzb8jY3BfDwW/kG9HJBh8hPkzNXhZkDhwrX1UgsS0UM4pNXGOP
 LtMRRt/rIZbuH3C8vn1jlXuuuvoLNPdpmJhLox5yPe0SyykMpLASevDWZEAfrCq8LYVS
 PFwa1n8nnEjaS4ZWXGwKOj0cycZJnf7SSBDgU2HEOf/Yv2uzl160T43wIARzGepFMgsi
 2NXASQNJr3TIp7+mLgRnuC7TaoQvppzwO8fQi2sS3AdrjuMwI24odC8AmddfPbb2MmEN
 5wbA==
X-Gm-Message-State: AJIora8EQ5iNpSEPl2eJLEGkz2/s3MTd46yfzyVJdkp4yCUUtfic7iO/
 aTfgfsqXXJXA+CxrSdDMtKY1EsZ2q/9IOlEgQmQ=
X-Google-Smtp-Source: AGRyM1shJynmp/BSXiO9B0jAuhghmdpVypJnA0IcIm4qQkjD1dxiiFtN+3VLURLGpSojgkxNAbNE2AUkA34fTW3mnPY=
X-Received: by 2002:a2e:2281:0:b0:258:e918:2611 with SMTP id
 i123-20020a2e2281000000b00258e9182611mr2684675lji.14.1655390521895; Thu, 16
 Jun 2022 07:42:01 -0700 (PDT)
MIME-Version: 1.0
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
 <1655304746-102776-2-git-send-email-steven.sistare@oracle.com>
In-Reply-To: <1655304746-102776-2-git-send-email-steven.sistare@oracle.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 16 Jun 2022 18:41:50 +0400
Message-ID: <CAJ+F1CJUcbb-_ue7OjyjYFaAEOucnQC2RYrMQwAC_5VMWEBchw@mail.gmail.com>
Subject: Re: [PATCH V8 01/39] migration: fix populate_vfio_info
To: Steve Sistare <steven.sistare@oracle.com>
Cc: QEMU <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>, 
 "Daniel P. Berrange" <berrange@redhat.com>, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
 Jason Zeng <jason.zeng@linux.intel.com>, Zheng Chuan <zhengchuan@huawei.com>, 
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>, 
 Peter Maydell <peter.maydell@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>, David Hildenbrand <david@redhat.com>,
 John Snow <jsnow@redhat.com>
Content-Type: multipart/alternative; boundary="00000000000005af2905e191a43b"
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-lj1-x235.google.com
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

--00000000000005af2905e191a43b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 15, 2022 at 7:20 PM Steve Sistare <steven.sistare@oracle.com>
wrote:

> Include CONFIG_DEVICES so that populate_vfio_info is instantiated for
> CONFIG_VFIO.
>
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
>

Fixes: 43bd0bf30fce ("migration: Move populate_vfio_info() into a separate
file")

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  migration/target.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/migration/target.c b/migration/target.c
> index 907ebf0..a0991bc 100644
> --- a/migration/target.c
> +++ b/migration/target.c
> @@ -8,6 +8,7 @@
>  #include "qemu/osdep.h"
>  #include "qapi/qapi-types-migration.h"
>  #include "migration.h"
> +#include CONFIG_DEVICES
>
>  #ifdef CONFIG_VFIO
>  #include "hw/vfio/vfio-common.h"
> --
> 1.8.3.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000005af2905e191a43b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 15, 2022 at 7:20 PM Steve=
 Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.com">steven.sistare@or=
acle.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">Include CONFIG_DEVICES so that populate_vfio_info is instantiated f=
or<br>
CONFIG_VFIO.<br>
<br>
Signed-off-by: Steve Sistare &lt;<a href=3D"mailto:steven.sistare@oracle.co=
m" target=3D"_blank">steven.sistare@oracle.com</a>&gt;<br></blockquote><div=
><br></div><div>Fixes: 43bd0bf30fce (&quot;migration: Move populate_vfio_in=
fo() into a separate file&quot;)</div><div><br></div><div>Reviewed-by: Marc=
-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redhat.com">marca=
ndre.lureau@redhat.com</a>&gt;</div><div><br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
---<br>
=C2=A0migration/target.c | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/migration/target.c b/migration/target.c<br>
index 907ebf0..a0991bc 100644<br>
--- a/migration/target.c<br>
+++ b/migration/target.c<br>
@@ -8,6 +8,7 @@<br>
=C2=A0#include &quot;qemu/osdep.h&quot;<br>
=C2=A0#include &quot;qapi/qapi-types-migration.h&quot;<br>
=C2=A0#include &quot;migration.h&quot;<br>
+#include CONFIG_DEVICES<br>
<br>
=C2=A0#ifdef CONFIG_VFIO<br>
=C2=A0#include &quot;hw/vfio/vfio-common.h&quot;<br>
-- <br>
1.8.3.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000005af2905e191a43b--

