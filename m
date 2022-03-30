Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C03B84EBD9E
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Mar 2022 11:25:26 +0200 (CEST)
Received: from localhost ([::1]:57910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZUZx-00084y-Fn
	for lists+qemu-devel@lfdr.de; Wed, 30 Mar 2022 05:25:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nZUQr-0000BX-V8
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 05:16:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37965)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nZUQq-0003Ni-5L
 for qemu-devel@nongnu.org; Wed, 30 Mar 2022 05:16:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1648631759;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Zd6r+bmEa3ewBUIlS/8HQcgPdvsyN9FbHy6CJioAsKY=;
 b=Fm5iTwKzLqIryPEKLOzLJOsBmxXe5JL5g8yI/gdKJr7Fk/IgET/HlNY1NODb4WzpK83Dut
 HOEXxb2GDac4jmW2A6sW4Q2ud8gp+Az5wzEz0REZSbts1NDszVEdBbr7cjStfGzRmA2ajA
 T6+rF5bPlbXm7nZEnzO/3u8BHUbfDcs=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-484-Q8BX3eBXPC6S5ZSgTEOx1g-1; Wed, 30 Mar 2022 05:15:58 -0400
X-MC-Unique: Q8BX3eBXPC6S5ZSgTEOx1g-1
Received: by mail-lf1-f70.google.com with SMTP id
 bt40-20020a056512262800b004481fbe2d29so6286770lfb.16
 for <qemu-devel@nongnu.org>; Wed, 30 Mar 2022 02:15:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zd6r+bmEa3ewBUIlS/8HQcgPdvsyN9FbHy6CJioAsKY=;
 b=wC5L4A7ioIwSZJapwVmCHKmzBgrMYBr8ZHdxMtgat3BAMVGkP/f1CfQH9J/118xop1
 qXlCrATgM4jDTC0L/nKGgdxhYtSAVg+W7Ikv8QMXXcON/Hm6fFh7s6wxF6FzeVV5J3A2
 zNrXq+kqf4mi/bWey0eFijJldgvrE6ef3SvgjvGFxuOThgdaCfUm6B/C3di5mAMhrUhm
 gEehtaSQXqhYYOsnird5U+F+T8LHIZPPhW65SnOZrepUtSDUZe7xadzMZAPXaHkeCEKG
 knG6L8Wayu0+XgHmidMgDRrly+Vw3rkrEOtJfiHKXU4zPbdFRZtIlPphflgmEpUBHPq2
 j4Mg==
X-Gm-Message-State: AOAM531bOXA2rmKeKTEs49fxY0P0sDvaQWIR7/fkUuBuma8FC4fgWP2C
 7cMaR8+Xyzif12n9CiwoOsJrnnojDkwUzKn0ymMUY3DEav4UN91f2J/K2gBmvTWl/8xdQCsgjYP
 v3PLhGhV17JigStZ5/SsIUOlDK7V2MOc=
X-Received: by 2002:a05:651c:90a:b0:249:5d82:fe9c with SMTP id
 e10-20020a05651c090a00b002495d82fe9cmr6019634ljq.300.1648631756453; 
 Wed, 30 Mar 2022 02:15:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy1Eoo817ldyQ2bk0a18Rbj+cy2RbKJQ7xNQDVXb3NI64nRnioaMRD7yQvOtmvYg4jsFaw1Hlbb8N1mb0uJyz4=
X-Received: by 2002:a05:651c:90a:b0:249:5d82:fe9c with SMTP id
 e10-20020a05651c090a00b002495d82fe9cmr6019621ljq.300.1648631756257; Wed, 30
 Mar 2022 02:15:56 -0700 (PDT)
MIME-Version: 1.0
References: <1648621997-22416-1-git-send-email-si-wei.liu@oracle.com>
 <1648621997-22416-6-git-send-email-si-wei.liu@oracle.com>
In-Reply-To: <1648621997-22416-6-git-send-email-si-wei.liu@oracle.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 30 Mar 2022 17:15:45 +0800
Message-ID: <CACGkMEvR+C61iNG8TTthawCho0+-EQbwxn2ckRoeCM6QUSw+1g@mail.gmail.com>
Subject: Re: [PATCH 5/7] vhost-vdpa: fix improper cleanup in
 net_init_vhost_vdpa
To: Si-Wei Liu <si-wei.liu@oracle.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=jasowang@redhat.com;
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
Cc: eperezma <eperezma@redhat.com>, Eli Cohen <eli@mellanox.com>,
 qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Mar 30, 2022 at 2:33 PM Si-Wei Liu <si-wei.liu@oracle.com> wrote:
>
> ... such that no memory leaks on dangling net clients in case of
> error.
>
> Signed-off-by: Si-Wei Liu <si-wei.liu@oracle.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  net/vhost-vdpa.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/net/vhost-vdpa.c b/net/vhost-vdpa.c
> index 1e9fe47..df1e69e 100644
> --- a/net/vhost-vdpa.c
> +++ b/net/vhost-vdpa.c
> @@ -306,7 +306,9 @@ int net_init_vhost_vdpa(const Netdev *netdev, const char *name,
>
>  err:
>      if (i) {
> -        qemu_del_net_client(ncs[0]);
> +        for (i--; i >= 0; i--) {
> +            qemu_del_net_client(ncs[i]);
> +        }
>      }
>      qemu_close(vdpa_device_fd);
>
> --
> 1.8.3.1
>


