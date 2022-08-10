Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B09C858E69F
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 07:10:10 +0200 (CEST)
Received: from localhost ([::1]:35246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLdyr-0005vn-Qr
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 01:10:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oLdvi-0001wX-64
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 01:06:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57185)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oLdvg-0006jt-A2
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 01:06:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660108011;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n5rWp9wH+k8lyMsnEv+gAP6AJ3ARXBdc5peS9SDY1Wc=;
 b=S3ZjEdBNEDNRe+4akUFiezHdkT2YDFMhCYyWUmy+0Svy2DHswZ/udpB3kLfTSMwq0/25/y
 2TrH/3DKEaaBCMGnQa5+XvI5U9aT4IwnYz9B55fYNC8MqxTVBcPaZO9qzQCqt5HZMpkHEM
 UsUd28gNH/wkilYp/MPIXIYAri7cBS0=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-169-M4aGvBOTMKuF8KOrEJIUAw-1; Wed, 10 Aug 2022 01:06:49 -0400
X-MC-Unique: M4aGvBOTMKuF8KOrEJIUAw-1
Received: by mail-lf1-f69.google.com with SMTP id
 j5-20020ac253a5000000b0048ce9fc0e38so1705225lfh.1
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 22:06:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=n5rWp9wH+k8lyMsnEv+gAP6AJ3ARXBdc5peS9SDY1Wc=;
 b=eNpSMGvr1/rowEeKe+Ux5ew+OeigYAwk3CppyBKJG14VP9IzG+fVvT5bwUKaKcFxl2
 F71Ly/Sx3SI3hAx98Z+TT3a+NPBbiNzS94Pu4fqFAB+5mBd5HVgaLQrtaDO9Z2ZB/deG
 0/mKpla40qfBJ7szknsSrzffwR9sMpfu4vNDr66IocSIHmm2S5Jp71tGhMO4cHXSpPrY
 7moXwUCHy4QbEqKK4ojOOMikSG20xdJU/dLNpopOQze1FJAr/sNTj91BYyk9sgS6DTMJ
 cVp50tyYMzgT3UwXq1Hfk6X0Garv5DJfjtuRmwDTRyACKsOEvJTl9vfmoT78lAPA0XBr
 EMgw==
X-Gm-Message-State: ACgBeo2SnROUyBQ/nRPyZ8nqnsWNjqFANbRNHYD5OhX4c8D74blFyBTU
 lL+bUaB6LS2Pxs7a3/vV6rkq8Rk25S383wGDVb5Pg7R/3sXr9Lji7loVUyHET9oiguA3WF08A4h
 CX2eMWMBoccDgb7xNjGLRvhTg7mj6YME=
X-Received: by 2002:a05:651c:2103:b0:25d:6478:2a57 with SMTP id
 a3-20020a05651c210300b0025d64782a57mr8133059ljq.496.1660108007889; 
 Tue, 09 Aug 2022 22:06:47 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7AeIINmWoQJNy8ycfQB3CV5S5gAI9ApvfBV13V9/U4EkfphRSr1Jvd8OD/Vww16RYo08uBrSVfaWtGgUW9jtw=
X-Received: by 2002:a05:651c:2103:b0:25d:6478:2a57 with SMTP id
 a3-20020a05651c210300b0025d64782a57mr8133051ljq.496.1660108007705; Tue, 09
 Aug 2022 22:06:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220809173926.1695280-1-eperezma@redhat.com>
 <20220809173926.1695280-7-eperezma@redhat.com>
In-Reply-To: <20220809173926.1695280-7-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 10 Aug 2022 13:06:36 +0800
Message-ID: <CACGkMEv8KyQAVqG3gQZgcoV-Nfamnky7Sgc+maYWVBTOqnXd5Q@mail.gmail.com>
Subject: Re: [PATCH v8 06/12] vhost_net: Add NetClientInfo stop callback
To: =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Harpreet Singh Anand <hanand@xilinx.com>, 
 Gautam Dawar <gdawar@xilinx.com>, Laurent Vivier <lvivier@redhat.com>, 
 Liuxiangdong <liuxiangdong5@huawei.com>, Cindy Lu <lulu@redhat.com>, 
 "Gonglei (Arei)" <arei.gonglei@huawei.com>,
 Zhu Lingshan <lingshan.zhu@intel.com>, 
 Eric Blake <eblake@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Eli Cohen <eli@mellanox.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Stefano Garzarella <sgarzare@redhat.com>, 
 Markus Armbruster <armbru@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Stefan Hajnoczi <stefanha@redhat.com>, Parav Pandit <parav@mellanox.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Aug 10, 2022 at 1:39 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> Used by the backend to perform actions after the device is stopped.
>
> In particular, vdpa net use it to unmap CVQ buffers to the device,
> cleaning the actions performend in prepare().

Should be "performed".

Other than this,

Acked-by: Jason Wang <jasowang@redhat.com>

>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>
> ---
>  include/net/net.h  | 2 ++
>  hw/net/vhost_net.c | 3 +++
>  2 files changed, 5 insertions(+)
>
> diff --git a/include/net/net.h b/include/net/net.h
> index ad9e80083a..476ad45b9a 100644
> --- a/include/net/net.h
> +++ b/include/net/net.h
> @@ -45,6 +45,7 @@ typedef struct NICConf {
>  typedef void (NetPoll)(NetClientState *, bool enable);
>  typedef bool (NetCanReceive)(NetClientState *);
>  typedef int (NetStart)(NetClientState *);
> +typedef void (NetStop)(NetClientState *);
>  typedef ssize_t (NetReceive)(NetClientState *, const uint8_t *, size_t);
>  typedef ssize_t (NetReceiveIOV)(NetClientState *, const struct iovec *, =
int);
>  typedef void (NetCleanup) (NetClientState *);
> @@ -73,6 +74,7 @@ typedef struct NetClientInfo {
>      NetReceiveIOV *receive_iov;
>      NetCanReceive *can_receive;
>      NetStart *start;
> +    NetStop *stop;
>      NetCleanup *cleanup;
>      LinkStatusChanged *link_status_changed;
>      QueryRxFilter *query_rx_filter;
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 2e0baeba26..9d4b334453 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -320,6 +320,9 @@ static void vhost_net_stop_one(struct vhost_net *net,
>          net->nc->info->poll(net->nc, true);
>      }
>      vhost_dev_stop(&net->dev, dev);
> +    if (net->nc->info->stop) {
> +        net->nc->info->stop(net->nc);
> +    }
>      vhost_dev_disable_notifiers(&net->dev, dev);
>  }
>
> --
> 2.31.1
>


