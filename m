Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 097F94CD258
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Mar 2022 11:25:20 +0100 (CET)
Received: from localhost ([::1]:35578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQ57f-0007fN-41
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 05:25:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ52n-0003ca-NV
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:20:17 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60448)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1nQ52l-0001vd-MZ
 for qemu-devel@nongnu.org; Fri, 04 Mar 2022 05:20:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646389214;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xT9rMbAJiIPmZJCBsFjN9G6fildk+Sf62878RFPslXU=;
 b=O0Xrx7Xuuh+vIbHP2BBZZ0uhHGpxtaZxIPU29j5C8HIb9YSx68Z4bRwgtQ2YtUMqu3ubR1
 Jn6VNRIr1LixPUe9RFBUR0WK0hAdME5cziPJRy40f8rrxu7ocbrlMYH7r70vXGATF+GI0f
 iJXhrUkBOcZKkjg6msO+2s0NwUsi6TI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-196-tDKSH2-EMUyRB-PejTe8Lw-1; Fri, 04 Mar 2022 05:20:13 -0500
X-MC-Unique: tDKSH2-EMUyRB-PejTe8Lw-1
Received: by mail-wr1-f71.google.com with SMTP id
 b7-20020a05600003c700b001efac398af7so3208342wrg.22
 for <qemu-devel@nongnu.org>; Fri, 04 Mar 2022 02:20:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=xT9rMbAJiIPmZJCBsFjN9G6fildk+Sf62878RFPslXU=;
 b=ppgIsTMHhs/IyTPshpo1gzDbIM5cHX/Om/QIGJhe1xf+Lyqjjlt/A1V3noPc81RdpR
 jkIEibQprK+85mtvhLEqR3hrP7z5HZAQrWsA8bPNU5rc+CILP5/+nMebWm2iIK/P6DTg
 SQFmPfrkHIp8Cz8BGgISi6z/uRrIWk6gPXO0+qdJOFgZDAEdhNbyCpJ2yJBER6S5hxZF
 53XECVxjTKN7Pae1X2mlpc2Lhzk9OuSIql5SngFRL30IqB4qdk6LgwjRIJJQRoeMGhZV
 TGCHiXXSWeEURmM9yM6AidLgCCzvS4mblYXkA1HtYruKX25ePr4UaXW70F217xXUz2bR
 FARA==
X-Gm-Message-State: AOAM531M9jqCcGmkoJHvoOfPPj7oOLXcI8b/iRIFxdhKXrBcDw/T2X9E
 /l6S6HZqHvNOt+6cv8rTB7/G1jT1x0MFSzazJhrA15POStRUI0MedyiXBR0lk14beSOwAr/riT8
 QF4UR4HsDJ7gfQZg=
X-Received: by 2002:a05:600c:2314:b0:381:8931:2387 with SMTP id
 20-20020a05600c231400b0038189312387mr7292626wmo.76.1646389211922; 
 Fri, 04 Mar 2022 02:20:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpGLeu6GFNwzLmx6/18eiP2hVylgSCWZjJnfi97EUQfV/GACBYS0j9xP16Gr5VdqGRWxR7QQ==
X-Received: by 2002:a05:600c:2314:b0:381:8931:2387 with SMTP id
 20-20020a05600c231400b0038189312387mr7292602wmo.76.1646389211537; 
 Fri, 04 Mar 2022 02:20:11 -0800 (PST)
Received: from redhat.com ([2.52.16.157]) by smtp.gmail.com with ESMTPSA id
 d8-20020a056000114800b001f045f3435asm5966127wrx.108.2022.03.04.02.20.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Mar 2022 02:20:10 -0800 (PST)
Date: Fri, 4 Mar 2022 05:20:07 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Bernhard Beschow <shentey@gmail.com>
Subject: Re: [PATCH vRESEND] virtio/virtio-balloon: Prefer Object* over void*
 parameter
Message-ID: <20220304051952-mutt-send-email-mst@kernel.org>
References: <20220301222301.103821-1-shentey@gmail.com>
 <20220301222301.103821-2-shentey@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20220301222301.103821-2-shentey@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 David Hildenbrand <david@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Mar 01, 2022 at 11:23:01PM +0100, Bernhard Beschow wrote:
> *opaque is an alias to *obj. Using the ladder makes the code consistent with
> with other devices, e.g. accel/kvm/kvm-all and accel/tcg/tcg-all. It also
> makes the cast more typesafe.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>

Acked-by: Michael S. Tsirkin <mst@redhat.com>

trivial tree pls

> ---
>  hw/virtio/virtio-balloon.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/hw/virtio/virtio-balloon.c b/hw/virtio/virtio-balloon.c
> index e6c1b0aa46..163d244eb4 100644
> --- a/hw/virtio/virtio-balloon.c
> +++ b/hw/virtio/virtio-balloon.c
> @@ -242,7 +242,7 @@ static void balloon_stats_get_all(Object *obj, Visitor *v, const char *name,
>                                    void *opaque, Error **errp)
>  {
>      Error *err = NULL;
> -    VirtIOBalloon *s = opaque;
> +    VirtIOBalloon *s = VIRTIO_BALLOON(obj);
>      int i;
>  
>      if (!visit_start_struct(v, name, NULL, 0, &err)) {
> @@ -277,7 +277,7 @@ static void balloon_stats_get_poll_interval(Object *obj, Visitor *v,
>                                              const char *name, void *opaque,
>                                              Error **errp)
>  {
> -    VirtIOBalloon *s = opaque;
> +    VirtIOBalloon *s = VIRTIO_BALLOON(obj);
>      visit_type_int(v, name, &s->stats_poll_interval, errp);
>  }
>  
> @@ -285,7 +285,7 @@ static void balloon_stats_set_poll_interval(Object *obj, Visitor *v,
>                                              const char *name, void *opaque,
>                                              Error **errp)
>  {
> -    VirtIOBalloon *s = opaque;
> +    VirtIOBalloon *s = VIRTIO_BALLOON(obj);
>      int64_t value;
>  
>      if (!visit_type_int(v, name, &value, errp)) {
> @@ -1015,12 +1015,12 @@ static void virtio_balloon_instance_init(Object *obj)
>      s->free_page_hint_notify.notify = virtio_balloon_free_page_hint_notify;
>  
>      object_property_add(obj, "guest-stats", "guest statistics",
> -                        balloon_stats_get_all, NULL, NULL, s);
> +                        balloon_stats_get_all, NULL, NULL, NULL);
>  
>      object_property_add(obj, "guest-stats-polling-interval", "int",
>                          balloon_stats_get_poll_interval,
>                          balloon_stats_set_poll_interval,
> -                        NULL, s);
> +                        NULL, NULL);
>  }
>  
>  static const VMStateDescription vmstate_virtio_balloon = {
> -- 
> 2.35.1


