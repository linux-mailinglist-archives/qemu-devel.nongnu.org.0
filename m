Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2214EA910
	for <lists+qemu-devel@lfdr.de>; Tue, 29 Mar 2022 10:16:55 +0200 (CEST)
Received: from localhost ([::1]:35728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZ726-0002sQ-EL
	for lists+qemu-devel@lfdr.de; Tue, 29 Mar 2022 04:16:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:41310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nZ6zE-0001RF-6x
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 04:13:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:46209)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1nZ6zC-0002UG-3m
 for qemu-devel@nongnu.org; Tue, 29 Mar 2022 04:13:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648541632;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wmqWdezH4Uu6L29Goar7BR47cEI3GgBJc1jHZo/cBeQ=;
 b=OI6pPHMXCGaf/DZ7WAlRd1qDSkJzhdhY/y1KJDYv7JCaDzlTAl5pUMixNRvXPIZSL0qMbu
 Yg4WnLFLRIfzdBCWRutQl+oERs6CzajJ2ZZ8f861XlLs/0EPiUgD5PYlTuuB+EA2mkNELT
 MbF5/hqN8u4DKK83wu9yTlxaAC3HAXs=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-39-k-r_-hGgNCG0juT8LbN9Ow-1; Tue, 29 Mar 2022 04:13:49 -0400
X-MC-Unique: k-r_-hGgNCG0juT8LbN9Ow-1
Received: by mail-yw1-f200.google.com with SMTP id
 00721157ae682-2e5db04460cso138956647b3.17
 for <qemu-devel@nongnu.org>; Tue, 29 Mar 2022 01:13:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=wmqWdezH4Uu6L29Goar7BR47cEI3GgBJc1jHZo/cBeQ=;
 b=a5k2xj7+/QzHMttygOSihomZFeb5GeOKlh0Sxrh/dYGCfu3Z4A7v9hkXBQWBouyDDk
 cTMFIk7mDtR9Cn1SasB8E5MQHH8pRICOf+yban0uK7+wjo3No4y3qV9giVRVuB0turWm
 xH2T5eAThcecLTTB8TEyYCCLuZuBUXK4ybVKI02y170cn2NyAIOpojj9Eq9iEJfWPi2K
 GyEK9zaFn4tT4kK4UcT4ZWoOSpYCStAxrQ8hUXpPKUVFrz+m4ylMSrOOjEoqoKLJXobw
 Njts3wYYel/+wiNXbWMbfOYxAvKwUMISbv4kDZ2HCuvwgJRtK4pVPREoGsuB+l0BK4HK
 v0xA==
X-Gm-Message-State: AOAM533jV9Vp4NNgfWuIfABieR+nsYNtMahlltfMgH7s6ccgD0cuW/pI
 Lnfy+TS+0xyo4sv/LpmgPNnqgoWHpb31NDsSLrUVhq4fQ/BKf2tOlZBSmmlHcPsY6ahg9gsK9VC
 12qjcJ2YnpBzV0SWg2XZYji1Jf8I1IPQ=
X-Received: by 2002:a25:8c01:0:b0:634:712d:3def with SMTP id
 k1-20020a258c01000000b00634712d3defmr27008257ybl.343.1648541628555; 
 Tue, 29 Mar 2022 01:13:48 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyQDKWN0o3KoFzdoeBweTXtjrZfeRtvo7PXN3zncY31a451gQs6CCjk5RHAVl7luUvdrFL8CilulSn7KTcJAGI=
X-Received: by 2002:a25:8c01:0:b0:634:712d:3def with SMTP id
 k1-20020a258c01000000b00634712d3defmr27008252ybl.343.1648541628410; Tue, 29
 Mar 2022 01:13:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220328211539.90170-1-maxim.davydov@openvz.org>
 <20220328211539.90170-5-maxim.davydov@openvz.org>
In-Reply-To: <20220328211539.90170-5-maxim.davydov@openvz.org>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 29 Mar 2022 12:13:37 +0400
Message-ID: <CAMxuvawN7QF6D_5mRphgv6=h0Yjmux3E5iQsT7ZTBj-OpH+WVg@mail.gmail.com>
Subject: Re: [PATCH v1 4/9] msmouse: add appropriate unregister handler
To: Maxim Davydov <maxim.davydov@openvz.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Eduardo Habkost <eduardo@habkost.net>, v.sementsov-og@mail.ru, "P. Berrange,
 Daniel" <berrange@redhat.com>, Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Michael Tsirkin <mst@redhat.com>, "Armbruster, Markus" <armbru@redhat.com>,
 Cleber Rosa <crosa@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 lizhijian@fujitsu.com,
 =?UTF-8?B?TWF0aGlldS1EYXVkw6ksIFBoaWxpcHBl?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Zhang Chen <chen.zhang@intel.com>,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>, "Bonzini,
 Paolo" <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>, den@openvz.org,
 "Blake, Eric" <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 29, 2022 at 1:15 AM Maxim Davydov <maxim.davydov@openvz.org> wr=
ote:
>
> Attempt to finalize msmouse after initalization brings to segmentation
> fault in QTAILQ_REMOVE.
>
> Signed-off-by: Maxim Davydov <maxim.davydov@openvz.org>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

> ---
>  chardev/msmouse.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/chardev/msmouse.c b/chardev/msmouse.c
> index eb9231dcdb..2cc1b16561 100644
> --- a/chardev/msmouse.c
> +++ b/chardev/msmouse.c
> @@ -146,7 +146,9 @@ static void char_msmouse_finalize(Object *obj)
>  {
>      MouseChardev *mouse =3D MOUSE_CHARDEV(obj);
>
> -    qemu_input_handler_unregister(mouse->hs);
> +    if (mouse->hs) {
> +        qemu_input_handler_unregister(mouse->hs);
> +    }
>  }
>
>  static QemuInputHandler msmouse_handler =3D {
> --
> 2.31.1
>


