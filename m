Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1FC64B429E
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 08:16:33 +0100 (CET)
Received: from localhost ([::1]:37862 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJVb6-0004R0-US
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 02:16:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:45268)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJVX7-00031K-Ci
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 02:12:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:49623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1nJVX3-0002uX-QF
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 02:12:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644822741;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hzA0HQa5ujd3Ai0XuT5gSif0pAhHKbKVJhqS5w3i8v8=;
 b=H0A5ZcMEPWqMEyJ6OREpVWenWOQclfVG9xNRxOeOE1dWtj/S43bl4QlBdscbLuVL/QbcjD
 xbzXdTkhj+pN6o/WOFc72I30DrlxUgF9TsrEtmgd1LXR+R1xnDzQiM2ZVxLv4LCy4ZkMeY
 g7xc+UgO0R8rZMD3+QAXtgc/MhhaZrA=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-107-_op7dLLDNBe1E-iLoThMzQ-1; Mon, 14 Feb 2022 02:12:19 -0500
X-MC-Unique: _op7dLLDNBe1E-iLoThMzQ-1
Received: by mail-lj1-f198.google.com with SMTP id
 184-20020a2e05c1000000b0023a30a97e36so5332874ljf.14
 for <qemu-devel@nongnu.org>; Sun, 13 Feb 2022 23:12:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hzA0HQa5ujd3Ai0XuT5gSif0pAhHKbKVJhqS5w3i8v8=;
 b=pKRYFXxDdlRa6yAk82NiVeZx6/9kvbgQcWXiqlPzzod6B7201709yriu6JiL8Vp9+T
 H03ZXFn76JLLE3178Z1G7fb0NOqLZtt7IQ1nxgSCME+L215hxV5+i0IB/ZHM+S5Fna1Z
 o+NoRq/yeixo8f8B9v8V44ZvK3u3IuxF+2W9T6+4848gT+PmBT7/5mt43Kfm5Om4PYgT
 89QEJdosulh/XA/+5d1Z5MdRze9Ty/aZbQJUdVH2dp/Qni3yVq3DY16AjfXKujtWPJzX
 G9lHytVBBAteGhCCDxeS1g+vHaCOelZdz+wzwXjhm5yZ27z/fCc4BITPk4QoGJ4QGeMU
 zuUw==
X-Gm-Message-State: AOAM533gEnFcDjMVmodXdTRdKUDENd5ikSWiSytH6K/Q+KIWPcg8mGHn
 s8v5cnOwFdDb8smXvrw4ZKq++HD2CHDgg0BeiIFvbeVx4GDTrYy0TGqJxr6Rtl5BDB/PHuCOiHm
 QT9TdIXTkdy7evidWbzU/Y+TqpGKciaw=
X-Received: by 2002:a05:6512:39c6:: with SMTP id
 k6mr9957798lfu.199.1644822738261; 
 Sun, 13 Feb 2022 23:12:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyTkWmf9HPS7RxFZpEyRblCDAz3hIHw5RnRRVV7yapSQVnTBF6uXcEva0m/SA4XZU1VNo7qeTAeP24jjcLk7pQ=
X-Received: by 2002:a05:6512:39c6:: with SMTP id
 k6mr9957792lfu.199.1644822738132; 
 Sun, 13 Feb 2022 23:12:18 -0800 (PST)
MIME-Version: 1.0
References: <20220214060346.72455-1-jasowang@redhat.com>
 <Ygn3I3T2DH3SHFXj@xz-m1.local>
 <CACGkMEvr+EDokjH6b3kMac-Zf_n+6KY5+L105Gh4QLquWZUX+Q@mail.gmail.com>
 <CACGkMEswB4HA0jnHS7KAM3qH=_kWUi8KE0TBK-hPqC+a3y6xFw@mail.gmail.com>
 <Ygn/GYWIXqzkTNp/@xz-m1.local>
In-Reply-To: <Ygn/GYWIXqzkTNp/@xz-m1.local>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 14 Feb 2022 15:12:06 +0800
Message-ID: <CACGkMEvyLqhG7wqpOz8SVk+W51k0ONfsJRS9GiAV73WRbR3fqw@mail.gmail.com>
Subject: Re: [PATCH] intel_iommu: support snoop control
To: Peter Xu <peterx@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jasowang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
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
Cc: qemu-devel <qemu-devel@nongnu.org>, mst <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Feb 14, 2022 at 3:05 PM Peter Xu <peterx@redhat.com> wrote:
>
> On Mon, Feb 14, 2022 at 02:40:20PM +0800, Jason Wang wrote:
> > Or we can do tricks like checking IOMMU_NOTIFIER_DEVIOTLB_UNMAP and
> > assume it's vhost.
> >
> > But I'm not sure it's worth it.
>
> If not any use, then probably not at all. :-)
>

Right. Let's leave it until there's a real user.

Thanks

> --
> Peter Xu
>


