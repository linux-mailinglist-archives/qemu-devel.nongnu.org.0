Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A574ACF84
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 04:15:42 +0100 (CET)
Received: from localhost ([::1]:60830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHGyi-0004AF-VK
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 22:15:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nHGx7-0003TO-UI
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 22:14:02 -0500
Received: from [2a00:1450:4864:20::631] (port=35641
 helo=mail-ej1-x631.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nHGx1-0005l4-Jq
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 22:13:58 -0500
Received: by mail-ej1-x631.google.com with SMTP id y3so27231111ejf.2
 for <qemu-devel@nongnu.org>; Mon, 07 Feb 2022 19:13:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9CyZrzoAM4aF7gUz+j03l8zKQK6/ItG3/3t6+aHkY7I=;
 b=0vmTmc5Cvfkfj0RHtwuELAsLwCgsjwPt9X7a/i2gaxQgftxJa2WKifmJvaG/G1LkTc
 hzkWuLpGC2wa9Z+BJlcwAXaShPV2zfFCmwNA5ExaicFE6TGLrqRQTTw0Pp2BCCWWCIye
 tfawS2fGIZDp9sj7R00fxFFHsVxLt5BQ+7AL0ToR09oC3KFDQ2oAD2CGrOf9Hj2UNQLZ
 aNI0PibmgC+lfEb6Yc9MCP+1w9GJRf/1pziKxqNTtmwdQIGAWQDieOvzhs3OfqMNUtqi
 s3ghaU3yt3TOTqR6tvAv47qNhWDUPF2JRhnUSz4znd7PMThyoNIbNfgJIpysQDI0JbgH
 Y63g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9CyZrzoAM4aF7gUz+j03l8zKQK6/ItG3/3t6+aHkY7I=;
 b=Tn6gFdWonSr6qjIhCrgmdRggpOqE5evlpZsU8QGD1CX3TQekkLaZxT2m4V4PIjZZYJ
 yzjD/QWsAn2fbzd//AItsR+PVhtxVtxaP7c0jZxVVz9YwgLTmjDNQqBIWNznSJlHqwA0
 Bsb+BjzoIlYiQqk2V6+X7lMZuycHBlXRmVHAmlsG2M7OAfXXIxN1xYF1V2A/BT5hQMuH
 9VXvLDqEjty3xGhLdnjrZA+g0L095jMYK4Rml7QTRbomNp3gljn4AqyWRjTKsZ4lImtD
 6cOHa25ZXDnJR+fnm9QXMeUWlK4LOzEBeQxOPBSjMp0Q4+ZCw4XKcMaPy1L34Hjcww2x
 Vviw==
X-Gm-Message-State: AOAM532EMVn/Bf3hlb8aYekwLQLRCHe+hz8FpBsdj6sxqIwXXoB5c3/Y
 xsgCqE1yGYHv3dzJFoVc1PSvzbj/sBWh7TasfIzK
X-Google-Smtp-Source: ABdhPJxa8Tg+Q28jCUKTkZHwgMLy4BkzxrjjrxPc21Txsx57+bJXViKzzYE9esYAj7Pps5n2tgnjrozlpWK32HeBDtM=
X-Received: by 2002:a17:907:7292:: with SMTP id
 dt18mr1893486ejc.667.1644290033384; 
 Mon, 07 Feb 2022 19:13:53 -0800 (PST)
MIME-Version: 1.0
References: <20220125131800.91-1-xieyongji@bytedance.com>
 <20220125131800.91-2-xieyongji@bytedance.com>
 <YgEaoFwlZH3++9hu@stefanha-x1.localdomain>
In-Reply-To: <YgEaoFwlZH3++9hu@stefanha-x1.localdomain>
From: Yongji Xie <xieyongji@bytedance.com>
Date: Tue, 8 Feb 2022 11:13:42 +0800
Message-ID: <CACycT3tT=Cp=AhSagRN21=-rGk0oNd+kQvog7O__48jGC1BX8g@mail.gmail.com>
Subject: Re: [PATCH 1/5] linux-headers: Add vduse.h
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::631
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=xieyongji@bytedance.com; helo=mail-ej1-x631.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, mreitz@redhat.com, mlureau@redhat.com,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 7, 2022 at 9:12 PM Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> On Tue, Jan 25, 2022 at 09:17:56PM +0800, Xie Yongji wrote:
> > diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
> > index fea4d6eb65..4c7846076f 100755
> > --- a/scripts/update-linux-headers.sh
> > +++ b/scripts/update-linux-headers.sh
> > @@ -198,6 +198,7 @@ for i in "$tmpdir"/include/linux/*virtio*.h \
> >           "$tmpdir/include/linux/const.h" \
> >           "$tmpdir/include/linux/kernel.h" \
> >           "$tmpdir/include/linux/vhost_types.h" \
> > +         "$tmpdir/include/linux/vduse.h" \
> >           "$tmpdir/include/linux/sysinfo.h"; do
> >      cp_portable "$i" "$output/include/standard-headers/linux"
>
> VDUSE is only available on Linux hosts so it should go in linux-headers/
> instead of standard-headers/linux/:
>
>   # - linux-headers/ for files that are required for compiling for a
>   #   Linux host.  Generally we have these so we can use kernel structs
>   #   and defines that are more recent than the headers that might be
>   #   installed on the host system.  Usually this script can do simple
>   #   file copies for these headers.
>   #
>   # - include/standard-headers/ for files that are used for guest
>   #   device emulation and are required on all hosts.  For instance, we
>   #   get our definitions of the virtio structures from the Linux
>   #   kernel headers, but we need those definitions regardless of which
>   #   host OS we are building for.  This script has to be careful to
>   #   sanitize the headers to remove any use of Linux-specifics such as
>   #   types like "__u64".  This work is done in the cp_portable function.

Got it! Will fix it in v2.

Thanks,
Yongji

