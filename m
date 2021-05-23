Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3544938D9E8
	for <lists+qemu-devel@lfdr.de>; Sun, 23 May 2021 10:04:11 +0200 (CEST)
Received: from localhost ([::1]:54426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lkj5l-0006XL-RG
	for lists+qemu-devel@lfdr.de; Sun, 23 May 2021 04:04:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lkj4g-0005gj-VY
 for qemu-devel@nongnu.org; Sun, 23 May 2021 04:03:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1lkj4e-0000n0-F8
 for qemu-devel@nongnu.org; Sun, 23 May 2021 04:03:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621756978;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GEUjU14OJxOMpMwYbGCpZd0GXP6hP6CTz55rfv47wT4=;
 b=PbqQugg7OTVpJqbCettYo8ZMqPKbZM3HHEHwtgGAQvf6DPC1OaPur2s4b+VW2Hr9XEt0AD
 6YEz0k1gyBlsS6MYv/SnrJqBSkuGHd60YIqy/f4V59+l7KUa+DQnauyi9SBYj7f6Pod0j0
 BjEdkwtoMjxoj+jHolffBuSKFTB9LSw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-QE2cEjf8NC6PNvL_-m-2rQ-1; Sun, 23 May 2021 04:02:55 -0400
X-MC-Unique: QE2cEjf8NC6PNvL_-m-2rQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 22-20020adf82960000b02901115ae2f734so11263638wrc.5
 for <qemu-devel@nongnu.org>; Sun, 23 May 2021 01:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=GEUjU14OJxOMpMwYbGCpZd0GXP6hP6CTz55rfv47wT4=;
 b=saMMwRo/dMT38beH3/ZvNKUk4VZ+3ZxB/909xmasqid1T44rSTdgSEykJz12+ovxBA
 z/RuHxriuDtLU+Nv+0WHjy1bb8ucEDOUmn4g9B9uQZX3LBBpy9v9P0AtnKguMna5jXNt
 RvqING+hdp3V8TkvBUls0o6AAa/+nQxQ3JCTWXur+sq+tEWofiKN0zmlNtv1QoT4qu3/
 6qBElqMhGkEV2j/cyZMmYL6aNPQvz8MToVDFcATdyJCueNGSB7Z2J4OXnYA9zcEqFgXz
 e7b2ztBO8GSVn74x5be5BEvX2uI3L/Kd4Hl1BPVLjX0nliRFZGN2GFTMIXeOXwD+ab5y
 7uUA==
X-Gm-Message-State: AOAM530PegqPj58zWZefvC0jfbXDxzPkS8nxGuC6eVVsOQEqIpyefhPV
 2mCUeH3gk7e8fX5XAwhYQsuHyfv5h6pP8/2ih9ZPewvfFJIVbMhv2UKqQBefclDK58XLqVBbLqC
 ftAjAtYzk3dMkEpQ=
X-Received: by 2002:a5d:638e:: with SMTP id p14mr16517630wru.299.1621756974422; 
 Sun, 23 May 2021 01:02:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwFsgeHhs1g0HxaVfY+0WdBQZ4JD4TO7cyXc2t+vYO0kEaDNDv6V4AgMk2ARTVcOmKzj+am4A==
X-Received: by 2002:a5d:638e:: with SMTP id p14mr16517616wru.299.1621756974218; 
 Sun, 23 May 2021 01:02:54 -0700 (PDT)
Received: from redhat.com ([2a10:8006:fcda:0:90d:c7e7:9e26:b297])
 by smtp.gmail.com with ESMTPSA id u8sm4295848wmq.29.2021.05.23.01.02.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 May 2021 01:02:53 -0700 (PDT)
Date: Sun, 23 May 2021 04:02:50 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH] hw/virtio: Document *_should_notify() are called within
 rcu_read_lock()
Message-ID: <20210523040228-mutt-send-email-mst@kernel.org>
References: <20210520064900.2413612-1-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210520064900.2413612-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-trivial@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, May 20, 2021 at 08:49:00AM +0200, Philippe Mathieu-Daudé wrote:
> Such comments make reviewing this file somehow easier.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>

ok but

> ---
>  hw/virtio/virtio.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index e02544b2df7..2b4c6c4b875 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -2449,6 +2449,7 @@ static void virtio_set_isr(VirtIODevice *vdev, int value)
>      }
>  }
>  
> +/* Called within rcu_read_lock().  */
>  static bool virtio_split_should_notify(VirtIODevice *vdev, VirtQueue *vq)
>  {
>      uint16_t old, new;
> @@ -2485,6 +2486,7 @@ static bool vring_packed_need_event(VirtQueue *vq, bool wrap,
>      return vring_need_event(off, new, old);
>  }
>  
> +/* Called within rcu_read_lock().  */
>  static bool virtio_packed_should_notify(VirtIODevice *vdev, VirtQueue *vq)
>  {
>      VRingPackedDescEvent e;


one space before */ please, not two.

> -- 
> 2.26.3


