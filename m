Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC85514E99
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 16:59:59 +0200 (CEST)
Received: from localhost ([::1]:35430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkS6A-0005uS-QW
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 10:59:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1nkS12-00076L-L0
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:54:40 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60250)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mkletzan@redhat.com>)
 id 1nkS0z-0001mR-6d
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 10:54:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651244075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2rqy94NU3E5k5iXXzU8hiOPHMQLr8FiwaUPzqtBuNxo=;
 b=h/0vZ7xocDz8E3V9eJ3c8l5OHEKUe3Yjt6mjOUbU5vn0CzfkmWEXsbJ+5AsL1kIy1QdHZq
 pf3GKA556nxiidiLN2uzaCMkuhstgtTv4DU8NB0IeGJLE4eqTBMYcorcSiuusE9vdEWGru
 IuwOa1nusnZGCa09I4MED7SlK8b9veA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-574-NyfG5-ClMam0P9rmBCnwhg-1; Fri, 29 Apr 2022 10:54:33 -0400
X-MC-Unique: NyfG5-ClMam0P9rmBCnwhg-1
Received: by mail-wm1-f70.google.com with SMTP id
 p32-20020a05600c1da000b00393fbf9ab6eso5051335wms.4
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 07:54:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=2rqy94NU3E5k5iXXzU8hiOPHMQLr8FiwaUPzqtBuNxo=;
 b=amdJHqGSMYWnlMFMpuwRGimdKk3dOt1C58/Bn2QbYC72t00/xQMLy28dG+tPQiW0SR
 g/fVhahdcuABW3z6YoAdVZCd5WFZElSwlhudNBhadoNy2NDcBTIbEO15wsBTNOQOXwCH
 XShqwdtXnHiMh6RnaGjanENvnBIo446UNwTnQ7QxpTSCISTQSjmZZxyWxvFbfrd0tOS+
 84EpCZKtx42pZNtsiRzHHbS6fkZskb27UJJQUcGaazOYLjSV7TFjH99zny01obwrpnCC
 Qf+GNaMHmpkMWa/795wxTVSB2GH6BhvyvklA4mCAQWd7G/m0pXypgOFUDNSMAfRj7zPf
 wSFA==
X-Gm-Message-State: AOAM532ZhPJ4W2vzTKhTZ0ExnPu6voEAbVv5I2S+ANnTw1wjTXkaJdnE
 deF2EEQNaJRw91K5MHtuv7a2WGXP3vMwaK14aRBMFvTOtz/FRyQNXqZ5UsBIVSc//QcfpSGsPc3
 lgeZeXBhvXsnPcAceZJWv8wyg01O5/ulLb3V2YSuACCw1lJpb16g2af6Ji/s9Hj3xhto=
X-Received: by 2002:a5d:588a:0:b0:204:1f46:cf08 with SMTP id
 n10-20020a5d588a000000b002041f46cf08mr31629093wrf.133.1651244072562; 
 Fri, 29 Apr 2022 07:54:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwG0VLcneZdwJhwQCt21jYq0RsQP1EssOs8FOYaoJHVpZMv99wwaTuW2Fa06vhET6nuwMw/pw==
X-Received: by 2002:a5d:588a:0:b0:204:1f46:cf08 with SMTP id
 n10-20020a5d588a000000b002041f46cf08mr31629060wrf.133.1651244072171; 
 Fri, 29 Apr 2022 07:54:32 -0700 (PDT)
Received: from wheatley.localdomain (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 f66-20020a1c3845000000b00393e84ea043sm2907450wma.44.2022.04.29.07.54.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 07:54:31 -0700 (PDT)
Received: by wheatley.localdomain (Postfix, from userid 1000)
 id E78776934CFF; Fri, 29 Apr 2022 16:54:30 +0200 (CEST)
Date: Fri, 29 Apr 2022 16:54:30 +0200
From: Martin Kletzander <mkletzan@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [RFC PATCH 6/6] vl: introduce -audio as a replacement for -soundhw
Message-ID: <Ymv8JkbNR67HFKGa@wheatley>
References: <20220427113225.112521-1-pbonzini@redhat.com>
 <20220427113225.112521-7-pbonzini@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="fqmB2s3AXzFRSl84"
Content-Disposition: inline
In-Reply-To: <20220427113225.112521-7-pbonzini@redhat.com>
X-Clacks-Overhead: GNU Terry Pratchett
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mkletzan@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: berrange@redhat.com, qemu-devel@nongnu.org, kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


--fqmB2s3AXzFRSl84
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline

On Wed, Apr 27, 2022 at 01:32:25PM +0200, Paolo Bonzini wrote:
>-audio is used like "-audio pa,model=sb16".  It is almost as simple as
>-soundhw, but it reuses the -audiodev parsing machinery and attaches an
>audiodev to the newly-created device.  The main 'feature' is that
>it knows about adding the codec device for model=intel-hda, and adding
>the audiodev to the codec device.
>
>In the future, it could be extended to support default models or
>builtin devices, just like -nic, or even a default backend.  For now,
>keep it simple.
>
>JSON parsing is not supported for -audio.  This is okay because the
>option is targeted at end users, not programs.
>
>Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>---
> audio/audio.c                   |  8 +++++-
> audio/audio.h                   |  1 +
> docs/about/deprecated.rst       |  9 ------
> docs/about/removed-features.rst |  7 +++++
> hw/audio/intel-hda.c            |  5 ++--
> hw/audio/soundhw.c              | 12 +++++---
> include/hw/audio/soundhw.h      |  4 +--
> qemu-options.hx                 | 51 ++++++++++++++++-----------------
> softmmu/vl.c                    | 28 ++++++++++++++++--
> 9 files changed, 76 insertions(+), 49 deletions(-)
>

[...]

>diff --git a/softmmu/vl.c b/softmmu/vl.c
>index 5bea0eb3eb..979bbda5aa 100644
>--- a/softmmu/vl.c
>+++ b/softmmu/vl.c
>@@ -3018,13 +3020,33 @@ void qemu_init(int argc, char **argv, char **envp)
>             case QEMU_OPTION_audiodev:
>                 audio_parse_option(optarg);
>                 break;
>-            case QEMU_OPTION_soundhw:
>-                if (is_help_option(optarg)) {
>+            case QEMU_OPTION_audio: {
>+                QDict *dict = keyval_parse(optarg, "driver", NULL, &error_fatal);
>+                char *model;
>+                Audiodev *dev = NULL;
>+                Visitor *v;
>+
>+                if (!qdict_haskey(dict, "id")) {
>+                    qdict_put_str(dict, "id", "audiodev0");
>+                }
>+                if (!qdict_haskey(dict, "model")) {
>+                    error_setg(&error_fatal, "Parameter 'model' is missing");
>+                }
>+                model = g_strdup(qdict_get_str(dict, "model"));
>+                qdict_del(dict, "model");
>+                if (is_help_option(model)) {
>                     show_valid_soundhw();
>                     exit(0);
>                 }
>-                select_soundhw (optarg);
>+                v = qobject_input_visitor_new_keyval(QOBJECT(dict));
>+                qobject_unref(dict);
>+                visit_type_Audiodev(v, NULL, &dev, &error_fatal);
>+                visit_free(v);
>+                audio_define(dev);

I was looking at this and thought that you might be creating multiple
audiodevs if there are multiple -audio options.  And I found out that
even with current master it is possible to create multiple audiodevs not
only with the same driver, but even with the same ID (and different
drivers).

I guess that is not preferable, but I can't say for sure how this is
supposed to be handled.

Other than that it looks fine to me.

--fqmB2s3AXzFRSl84
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiXAnXDYdKAaCyvS1CB/CnyQXht0FAmJr/CYACgkQCB/CnyQX
ht05YA//c5U94R6uD3S0S20pI/d+x7X3gVS9GkvlaUFvkMMYHJz1XACxlqF/eB3m
zNWZ0QUxWhA5eFSqFnobHUeYO/tF4H5T+En3kOKVg51bNmLBha9aqCU2ZL0iJaAo
9r/6VkXXz+Mcr9/umQy0mGpCOw60IN3Rs43RC7XY1krF888ssXMy03kv0+ydPbPQ
rAxQnWPA8u0QOe0s+c4eSLqrOiKi+JLxTifz+HEE9IxjU2iFQoueWY+pOS2V80hm
XoH4yNOmNN0GqGFb+liTmiUmUxyOqi7uL0MrFmJa9Bi+LH7aZqS7+xo/Y3DHAqf8
aKXz93xSUeDcW/+/FjP48SrYgGGe2tKB6PdYciZZPxSZLWFVDpOKbec0+2OEiwQJ
G3/gudkoOu2ZQf20H59XO+sJOxwQCvHbmhNKphHQy8KcfJuJ8+cPsh/zrVwqC7DF
W0Ep/Xt8q2FOKpRvp8saPBHykTN51JEeOlt2rzXQBQQaMm7STLMaveLYfQEbMdYr
0IEkCQ60RPHKgCOe/4vTLLnoepqZmRgoPxLe0iVzjd7r57E3n4ODhO0L9/H/uWK7
IY2QLODYPRB/DeOKpJCnsBa3xn1hhTTt/fwj1EuZNwozekT+FmELss9X+odGSguT
gdqtjiEf10Ab71PcsXril4MceDXkhjStvLMKlqLqMu0j1tQTPaA=
=G7Kw
-----END PGP SIGNATURE-----

--fqmB2s3AXzFRSl84--


