Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C58A458882
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Nov 2021 04:59:20 +0100 (CET)
Received: from localhost ([::1]:60520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mp0UB-0005mO-Dw
	for lists+qemu-devel@lfdr.de; Sun, 21 Nov 2021 22:59:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:56104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mp0ST-0004H8-M4
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 22:57:33 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25181)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1mp0SR-0005QI-O4
 for qemu-devel@nongnu.org; Sun, 21 Nov 2021 22:57:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637553451;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=f6MMhv4ZySLzlkNRHt+MIidgMd8Ju+d7Qatctz7WV1M=;
 b=Z+oJ+dmG850TXmO/lbumBAUmwizMKJNdpq9ijeD7tBqZb7OZxpjXf/eUzm/8B4rh90/8hR
 V7hKr73rmJ++dCWPma72cLxFRuoPep5gnwKfsUesz96jpbaKKi+QRku8+cldzs3fno8yfa
 bT7UqxjAFA5JVEhDeHXJJgS57M2qMUE=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-441-doHcNdBvOPKtWhpbC3mVAQ-1; Sun, 21 Nov 2021 22:57:30 -0500
X-MC-Unique: doHcNdBvOPKtWhpbC3mVAQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 k5-20020a05651210c500b0040934a07fbdso11120599lfg.22
 for <qemu-devel@nongnu.org>; Sun, 21 Nov 2021 19:57:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=f6MMhv4ZySLzlkNRHt+MIidgMd8Ju+d7Qatctz7WV1M=;
 b=7v99AEbSr1CB+ZzBKjY6UytvUcGHbF3JMYX77SrbBHt9xIprVX4MNPCCKVJbnoVk6e
 em+IAgxghLSqUfJFG3Kmp2tNgo2dMF93bpZrhrz2nfAEEm6gYupK0oxVOXQtL8ReVb0T
 lUKJubfEGorvFDXgsf2pr79K23Ts4Avi0Uv/99pB4XNvBNjB6BO2gbrR2NYD+q4py39E
 r4/yVXvcXF0VTP4UBfXNos4OSVi4pnA7dU0h6Q0GHd+CLU0EOhnyHFZl8ewLJZ0V+Ya0
 wEhnlXQXNOzr1jNXCmHR32s/jJkoMFAaVayfbiPod6PTQBJSm+CI3wrD7P1YAb9fkMiZ
 anTg==
X-Gm-Message-State: AOAM532wuE6X4m7I4ZiA9ddpbwgW8RcYjEM58sx3Grt5XOFQVvTogYww
 pSUk3mKFFDBQy1dUq5U/MAZvC4+ghcybAgpqjH5JZreDg9NjQ/xL+qmi4NTKS5Z2uvvBXmfxzno
 52Xd3jn9i6AgQxhph0XIWLtSKitShibs=
X-Received: by 2002:a05:6512:2081:: with SMTP id
 t1mr55218947lfr.348.1637553448487; 
 Sun, 21 Nov 2021 19:57:28 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQIAV1/EDjlXqtc9q4xegEOWD55oH5wO89pyGLoWvc/bbZRrsuxuYdfN4UPAEHrTUsQq7C5LGtut1Ayvh+Xes=
X-Received: by 2002:a05:6512:2081:: with SMTP id
 t1mr55218925lfr.348.1637553448241; 
 Sun, 21 Nov 2021 19:57:28 -0800 (PST)
MIME-Version: 1.0
References: <20211119053506.290459-1-chen.zhang@intel.com>
In-Reply-To: <20211119053506.290459-1-chen.zhang@intel.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 22 Nov 2021 11:57:17 +0800
Message-ID: <CACGkMEuPF+9SAs7TFauDB1CDUmW05A5U7zC3V4e2FLokm+RiDg@mail.gmail.com>
Subject: Re: [PATCH V3 1/2] net/filter: Enable the vnet_hdr_support by default
To: Zhang Chen <chen.zhang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-dev <qemu-devel@nongnu.org>, Li Zhijian <lizhijian@cn.fujitsu.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Nov 19, 2021 at 1:45 PM Zhang Chen <chen.zhang@intel.com> wrote:
>
> This patch make filters and colo-compare module support vnet_hdr by
> default. And also support -device non-virtio-net(like e1000.).
> Because when enabled the support will make the vnet_hdr_len field
> become must-delivery part of filter transfer protocol(even 0 in use
> -device e1000). It fully guarantees the compatibility for management
> layer like libvirt. But it still can't avoid user manual
> configuration error between different filters connected
> when enable/disable vnet_hdr_support.
>
> Signed-off-by: Zhang Chen <chen.zhang@intel.com>

Queued for 7.0.

Thanks

> ---
>  net/colo-compare.c    | 2 +-
>  net/filter-mirror.c   | 4 ++--
>  net/filter-rewriter.c | 2 +-
>  qemu-options.hx       | 9 +++++----
>  4 files changed, 9 insertions(+), 8 deletions(-)
>
> diff --git a/net/colo-compare.c b/net/colo-compare.c
> index b966e7e514..0232249311 100644
> --- a/net/colo-compare.c
> +++ b/net/colo-compare.c
> @@ -1399,7 +1399,7 @@ static void colo_compare_init(Object *obj)
>                          get_max_queue_size,
>                          set_max_queue_size, NULL, NULL);
>
> -    s->vnet_hdr = false;
> +    s->vnet_hdr = true;
>      object_property_add_bool(obj, "vnet_hdr_support", compare_get_vnet_hdr,
>                               compare_set_vnet_hdr);
>  }
> diff --git a/net/filter-mirror.c b/net/filter-mirror.c
> index f20240cc9f..adb0c6d89a 100644
> --- a/net/filter-mirror.c
> +++ b/net/filter-mirror.c
> @@ -406,14 +406,14 @@ static void filter_mirror_init(Object *obj)
>  {
>      MirrorState *s = FILTER_MIRROR(obj);
>
> -    s->vnet_hdr = false;
> +    s->vnet_hdr = true;
>  }
>
>  static void filter_redirector_init(Object *obj)
>  {
>      MirrorState *s = FILTER_REDIRECTOR(obj);
>
> -    s->vnet_hdr = false;
> +    s->vnet_hdr = true;
>  }
>
>  static void filter_mirror_fini(Object *obj)
> diff --git a/net/filter-rewriter.c b/net/filter-rewriter.c
> index bf05023dc3..5698cd39d1 100644
> --- a/net/filter-rewriter.c
> +++ b/net/filter-rewriter.c
> @@ -407,7 +407,7 @@ static void filter_rewriter_init(Object *obj)
>  {
>      RewriterState *s = FILTER_REWRITER(obj);
>
> -    s->vnet_hdr = false;
> +    s->vnet_hdr = true;
>      s->failover_mode = FAILOVER_MODE_OFF;
>  }
>
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 7749f59300..c40e385ede 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4967,13 +4967,13 @@ SRST
>      ``-object filter-mirror,id=id,netdev=netdevid,outdev=chardevid,queue=all|rx|tx[,vnet_hdr_support][,position=head|tail|id=<id>][,insert=behind|before]``
>          filter-mirror on netdev netdevid,mirror net packet to
>          chardevchardevid, if it has the vnet\_hdr\_support flag,
> -        filter-mirror will mirror packet with vnet\_hdr\_len.
> +        filter-mirror will mirror packet with vnet\_hdr\_len(default: on).
>
>      ``-object filter-redirector,id=id,netdev=netdevid,indev=chardevid,outdev=chardevid,queue=all|rx|tx[,vnet_hdr_support][,position=head|tail|id=<id>][,insert=behind|before]``
>          filter-redirector on netdev netdevid,redirect filter's net
>          packet to chardev chardevid,and redirect indev's packet to
>          filter.if it has the vnet\_hdr\_support flag, filter-redirector
> -        will redirect packet with vnet\_hdr\_len. Create a
> +        will redirect packet with vnet\_hdr\_len(default: on). Create a
>          filter-redirector we need to differ outdev id from indev id, id
>          can not be the same. we can just use indev or outdev, but at
>          least one of indev or outdev need to be specified.
> @@ -4983,7 +4983,8 @@ SRST
>          packet to secondary from primary to keep secondary tcp
>          connection,and rewrite tcp packet to primary from secondary make
>          tcp packet can be handled by client.if it has the
> -        vnet\_hdr\_support flag, we can parse packet with vnet header.
> +        vnet\_hdr\_support flag, we can parse packet with vnet
> +        header(default: on).
>
>          usage: colo secondary: -object
>          filter-redirector,id=f1,netdev=hn0,queue=tx,indev=red0 -object
> @@ -5004,7 +5005,7 @@ SRST
>          checkpoint and send primary packet to out\_dev. In order to
>          improve efficiency, we need to put the task of comparison in
>          another iothread. If it has the vnet\_hdr\_support flag,
> -        colo compare will send/recv packet with vnet\_hdr\_len.
> +        colo compare will send/recv packet with vnet\_hdr\_len(default: on).
>          The compare\_timeout=@var{ms} determines the maximum time of the
>          colo-compare hold the packet. The expired\_scan\_cycle=@var{ms}
>          is to set the period of scanning expired primary node network packets.
> --
> 2.25.1
>


