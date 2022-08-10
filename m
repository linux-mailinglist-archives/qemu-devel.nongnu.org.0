Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DAA1258E6A6
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Aug 2022 07:13:51 +0200 (CEST)
Received: from localhost ([::1]:41518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oLe2R-0001ud-0C
	for lists+qemu-devel@lfdr.de; Wed, 10 Aug 2022 01:13:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43978)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oLdwz-0003Kr-3x
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 01:08:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:35040)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1oLdwx-0006rU-L0
 for qemu-devel@nongnu.org; Wed, 10 Aug 2022 01:08:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660108091;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HFx+Qjwf0c5N57IxGTQOBZ8EeeEN7seBmZ9imOwaS8c=;
 b=jSCITayM/m+78pZi3BulUxdV+Rw+s0WiDfPZLK2b2bUa9qmJiDhpMglubTik3CWcu4l26d
 IfCGrg52BeeF3z08PDKiuaw6vrGz6remh7Ms9PBt3CpgVhV1DC5pgVsC7SdCTR9zHUQMXO
 ngsf4lBUhIR+XQxMOw15KXI2SKXy0Sw=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-xPZesM2fN-OAVat7xhYu1Q-1; Wed, 10 Aug 2022 01:08:09 -0400
X-MC-Unique: xPZesM2fN-OAVat7xhYu1Q-1
Received: by mail-lf1-f70.google.com with SMTP id
 v16-20020a056512049000b0048d0d86c689so801777lfq.15
 for <qemu-devel@nongnu.org>; Tue, 09 Aug 2022 22:08:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc;
 bh=HFx+Qjwf0c5N57IxGTQOBZ8EeeEN7seBmZ9imOwaS8c=;
 b=JuGNr9DKYEPU/nK2x8D3z4QgaOSMHiZk/pGpIhAyoTYm0zpvjH1aGd+kcXTST5IW15
 HZeglTUL0Jcyka5fKB8sSrXZMRsORT8N+YMy8eGHzgPhapsuMTRV/1IZ5PArp39Zx/9k
 eVAZAjdm4PDPL0OihEZkYzdA4nFvmsIPCUg0CX/AxDykgHaMD2h5BkqoSWOVNFab3a23
 MtFtDuQlepzBlvEZDpj5enHdL7Jx9M5wXOKrM+g/qYoWq2MMg5kPcK+fGCzwajHeqKPh
 s0Hxesv+P2zWEgxC8MzZsB2sgRXrTxMWiAjOgA4PT4kVTlCYyaEkkXo/E7gXefyOeNx2
 k3SA==
X-Gm-Message-State: ACgBeo2tI2TejRVkbfLFuXZiN+mrJwA0t6PIILaRDVZiYOhULmSEabWa
 pLhHT7AAe4yeeX5K2RIBPdK1aph0GsaGV5Y3GR+mHXx1zjrnrXL/raCebfzOChjpecG/uUvanYH
 vjmZWocb7vjET8EEWpTQgbDBotHki7LU=
X-Received: by 2002:a05:6512:12c7:b0:48b:3bc4:10f4 with SMTP id
 p7-20020a05651212c700b0048b3bc410f4mr7579795lfg.411.1660108088220; 
 Tue, 09 Aug 2022 22:08:08 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6QZESxBc2phkDJucDtuVY/5GtGbHAU0oij/99wfqRHgZgpbFhdwi9Q3YUssFvtbQhPP4mrtJ/QDyv49jA/n9A=
X-Received: by 2002:a05:6512:12c7:b0:48b:3bc4:10f4 with SMTP id
 p7-20020a05651212c700b0048b3bc410f4mr7579781lfg.411.1660108088054; Tue, 09
 Aug 2022 22:08:08 -0700 (PDT)
MIME-Version: 1.0
References: <20220809173926.1695280-1-eperezma@redhat.com>
 <20220809173926.1695280-11-eperezma@redhat.com>
In-Reply-To: <20220809173926.1695280-11-eperezma@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 10 Aug 2022 13:07:56 +0800
Message-ID: <CACGkMEsA-P_6As1bD2+GQHqpFPo0+xRCmfSRH2rtoacCydef_w@mail.gmail.com>
Subject: Re: [PATCH v8 10/12] vhost_net: add NetClientState->load() callback
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

On Wed, Aug 10, 2022 at 1:40 AM Eugenio P=C3=A9rez <eperezma@redhat.com> wr=
ote:
>
> It allows per-net client operations right after device's successful
> start. In particular, to load the device status.
>
> Vhost-vdpa net will use it to add the CVQ buffers to restore the device
> status.
>
> Signed-off-by: Eugenio P=C3=A9rez <eperezma@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
> v5: Rename start / load, naming it more specifically.
> ---
>  include/net/net.h  | 2 ++
>  hw/net/vhost_net.c | 7 +++++++
>  2 files changed, 9 insertions(+)
>
> diff --git a/include/net/net.h b/include/net/net.h
> index 476ad45b9a..81d0b21def 100644
> --- a/include/net/net.h
> +++ b/include/net/net.h
> @@ -45,6 +45,7 @@ typedef struct NICConf {
>  typedef void (NetPoll)(NetClientState *, bool enable);
>  typedef bool (NetCanReceive)(NetClientState *);
>  typedef int (NetStart)(NetClientState *);
> +typedef int (NetLoad)(NetClientState *);
>  typedef void (NetStop)(NetClientState *);
>  typedef ssize_t (NetReceive)(NetClientState *, const uint8_t *, size_t);
>  typedef ssize_t (NetReceiveIOV)(NetClientState *, const struct iovec *, =
int);
> @@ -74,6 +75,7 @@ typedef struct NetClientInfo {
>      NetReceiveIOV *receive_iov;
>      NetCanReceive *can_receive;
>      NetStart *start;
> +    NetLoad *load;
>      NetStop *stop;
>      NetCleanup *cleanup;
>      LinkStatusChanged *link_status_changed;
> diff --git a/hw/net/vhost_net.c b/hw/net/vhost_net.c
> index 9d4b334453..d28f8b974b 100644
> --- a/hw/net/vhost_net.c
> +++ b/hw/net/vhost_net.c
> @@ -281,6 +281,13 @@ static int vhost_net_start_one(struct vhost_net *net=
,
>              }
>          }
>      }
> +
> +    if (net->nc->info->load) {
> +        r =3D net->nc->info->load(net->nc);
> +        if (r < 0) {
> +            goto fail;
> +        }
> +    }
>      return 0;
>  fail:
>      file.fd =3D -1;
> --
> 2.31.1
>


