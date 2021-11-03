Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9E7D443B33
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 03:05:27 +0100 (CET)
Received: from localhost ([::1]:48620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mi5eY-0000IN-T7
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 22:05:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mi5dO-00080C-Mx
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 22:04:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56236)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mi5dL-0007rR-Rj
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 22:04:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635905050;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=d+bK5Sih/ajKfH+Ca+54sEA+iHdqX6en8YU9rhxFacg=;
 b=CKCZ2kMe0ErxszGg0bP+vPY1opS/O8GNk0v28EOyEvLibbSfuWeMKfK2zCmduLwIjLu4RJ
 rqJUVo948XUWsHbkM7S23d63JgyyGj+xL/IOkzAvcQtEusgez02CYox76YqPuIjei0FLRS
 hq5daONo94uOdNMnyZa2WaW8CDa97NY=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-284-_piQvELDPga7VWRhQHoUTw-1; Tue, 02 Nov 2021 22:04:08 -0400
X-MC-Unique: _piQvELDPga7VWRhQHoUTw-1
Received: by mail-lj1-f197.google.com with SMTP id
 e13-20020a2e9e0d000000b00216ace8e8e5so438674ljk.10
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 19:04:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d+bK5Sih/ajKfH+Ca+54sEA+iHdqX6en8YU9rhxFacg=;
 b=3rUTgobNsYmVvrSjYXeaSR2iinr0pb5iVxfErgFBanbFu+YTqUF46XROA5sHzfEHLI
 XdupTuUl/vtVLWCx0OTVqv6RXsRW4MO6jWRyTeilnP0O2HcgqDd2RXCUnTSeYswI6T74
 8Vr6UtbzOyDORKZ+RPdDBQUGTcUcoiZt6nUnKwN7oqcAak6GrWZgSP9kh86tAfS8N2OS
 Bl8aY27xw/5mkqei2PMW3c5WDp6+VmsJHZyg1g6fFOI6YfpDT6/Puuvn9ZOs7lC0YVyi
 QMPBaw6fhwNNqTysbevN6DmmVhJDO9peVGntYNG7xCBdVRnmd2BPSmv8Yn339L34l02j
 P/tg==
X-Gm-Message-State: AOAM5300TsovAaxHBHVh51xahCscI2dMTtAe5aTZQOjJdvliEt5MZneO
 E2q0ygsrb0zJcPKf4VpSmnBwNARb/yuZYSSC4Rt5hOekR4G/aiw1FifAAib8VnpCY2y1vpSV75v
 wCntjM2VO5grXAMLiKVsh9pOXG+Se4fI=
X-Received: by 2002:a05:6512:1291:: with SMTP id
 u17mr39447757lfs.84.1635905047451; 
 Tue, 02 Nov 2021 19:04:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzp0ZcVRPXhr9MMqdnWu3pHVc5ELXFBj3pEFgM1Lzp8nlyS5YCcoh4DF5rNf9gXkUUDQzCQC1dw7e1Sje1muro=
X-Received: by 2002:a05:6512:1291:: with SMTP id
 u17mr39447739lfs.84.1635905047236; 
 Tue, 02 Nov 2021 19:04:07 -0700 (PDT)
MIME-Version: 1.0
References: <20211102155157.241034-1-sgarzare@redhat.com>
In-Reply-To: <20211102155157.241034-1-sgarzare@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 3 Nov 2021 10:03:56 +0800
Message-ID: <CACGkMEuAzehb-42uso0hETcJMk0oi8YdUiJAf0JA3shBq66CXw@mail.gmail.com>
Subject: Re: [PATCH] net/vhost-vdpa: fix memory leak in
 vhost_vdpa_get_max_queue_pairs()
To: Stefano Garzarella <sgarzare@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel <qemu-devel@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 2, 2021 at 11:52 PM Stefano Garzarella <sgarzare@redhat.com> wrote:
>
> Use g_autofree to ensure that `config` is freed when
> vhost_vdpa_get_max_queue_pairs() returns.
>
> Reported-by: Coverity (CID 1465228: RESOURCE_LEAK)
> Fixes: 402378407d ("vhost-vdpa: multiqueue support")
> Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  net/vhost-vdpa.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 49ab322511..373b706b90 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -214,7 +214,7 @@ static NetClientState *net_vhost_vdpa_init(NetClientState *peer,
>  static int vhost_vdpa_get_max_queue_pairs(int fd, int *has_cvq, Error **errp)
>  {
>      unsigned long config_size = offsetof(struct vhost_vdpa_config, buf);
> -    struct vhost_vdpa_config *config;
> +    g_autofree struct vhost_vdpa_config *config = NULL;
>      __virtio16 *max_queue_pairs;
>      uint64_t features;
>      int ret;
> --
> 2.31.1
>


