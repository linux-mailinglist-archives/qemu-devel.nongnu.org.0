Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A59954CA8DE
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Mar 2022 16:14:25 +0100 (CET)
Received: from localhost ([::1]:58294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPQgK-0003wn-7A
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 10:14:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nPQej-0002WL-Qy
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 10:12:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43350)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.williamson@redhat.com>)
 id 1nPQee-0004pl-Pz
 for qemu-devel@nongnu.org; Wed, 02 Mar 2022 10:12:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1646233959;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6TNiLFlYcGF3ddTJpMJSNjgDj1FGfe5b4PLw2nW6z80=;
 b=jQx5SxpT5TQyiQro4w3afKwvwxoZT1BFrI7cqo/iNgV73gnyCGtgFpTbb5OQpN6lYLQQJC
 QwGxftEb5WTB4EyS2JteL24dJl1KtRe/JOHYMlwMDQpPucR0UQZ9oUDHR2I8JQcyAOazqU
 FnJrs7jYgcREYpM3zS46esj5wlHHAUw=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-149-gkLMSBeuPTyfYs5KXD6hTw-1; Wed, 02 Mar 2022 10:12:38 -0500
X-MC-Unique: gkLMSBeuPTyfYs5KXD6hTw-1
Received: by mail-ot1-f71.google.com with SMTP id
 m24-20020a9d4c98000000b005af3b88a817so1439165otf.14
 for <qemu-devel@nongnu.org>; Wed, 02 Mar 2022 07:12:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:organization:mime-version:content-transfer-encoding;
 bh=6TNiLFlYcGF3ddTJpMJSNjgDj1FGfe5b4PLw2nW6z80=;
 b=xxOlIUuk4m9c2baRwgHRJlDWDanwYHUwm1CP5YVpJtavTFLuyTU89yZL7yoNDyxo5n
 3N/HMHcMoF7JtH3cGjYTifZQUM53yV/8qafHL+PVLxF4hN2CnRO3/esa8vs0mJfgxnDu
 Dc37gXfCD4laU8edOsKYfeTN+H72AlLR52r5yhNH3rY3+QNPNt32hOw0YqS5S9XJlHpc
 v0VgiT4ZrHQ7hp4xXmP85EIO8C0MdUD8ubwaQ+xFHXqrMMW2WqrwjXKSGTdB8HC+hTgq
 fmng6NO8R7lrO7XxUnP6YSmsCFgkTo5KjhBOIxNQ1sBFQs7JW8GMYjr/nQsilXNaPqrK
 mo6g==
X-Gm-Message-State: AOAM531llj1CML2kXBpa+HxJod9IcYv4bQjjj5ERAshHBDb9Wz6XxaJ4
 fFiaEXWtpSNTNsbhqMnwlSmvI1EzaVyG2XmXzOF8lzc8x/fBOCxfFIYXapvhji4fF2TbZ7/ZMU+
 jFO12VgeBE7ShdhQ=
X-Received: by 2002:a05:6830:23b8:b0:5a5:75fd:8f9 with SMTP id
 m24-20020a05683023b800b005a575fd08f9mr15666174ots.152.1646233957361; 
 Wed, 02 Mar 2022 07:12:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwUKXcvdMYSNpSDmRV4uh5gtX/gNvk81VHFgaMMwZYft8TCoicAQaumaccPdPuVeKcHQyh9kA==
X-Received: by 2002:a05:6830:23b8:b0:5a5:75fd:8f9 with SMTP id
 m24-20020a05683023b800b005a575fd08f9mr15666135ots.152.1646233957112; 
 Wed, 02 Mar 2022 07:12:37 -0800 (PST)
Received: from redhat.com ([38.15.36.239]) by smtp.gmail.com with ESMTPSA id
 s3-20020a056808208300b002d38ef031d6sm9680263oiw.36.2022.03.02.07.12.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Mar 2022 07:12:36 -0800 (PST)
Date: Wed, 2 Mar 2022 08:12:34 -0700
From: Alex Williamson <alex.williamson@redhat.com>
To: Sergio Lopez <slp@redhat.com>
Subject: Re: [PATCH 1/2] Allow returning EventNotifier's wfd
Message-ID: <20220302081234.2378ef33.alex.williamson@redhat.com>
In-Reply-To: <20220302113644.43717-2-slp@redhat.com>
References: <20220302113644.43717-1-slp@redhat.com>
 <20220302113644.43717-2-slp@redhat.com>
Organization: Red Hat
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=alex.williamson@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=alex.williamson@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 kvm@vger.kernel.org, John G Johnson <john.g.johnson@oracle.com>,
 David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Jagannathan Raman <jag.raman@oracle.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>, vgoyal@redhat.com,
 Eric Farman <farman@linux.ibm.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Stefan Hajnoczi <stefanha@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <f4bug@amsat.org>,
 Hanna Reitz <hreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed,  2 Mar 2022 12:36:43 +0100
Sergio Lopez <slp@redhat.com> wrote:

> event_notifier_get_fd(const EventNotifier *e) always returns
> EventNotifier's read file descriptor (rfd). This is not a problem when
> the EventNotifier is backed by a an eventfd, as a single file
> descriptor is used both for reading and triggering events (rfd ==
> wfd).
> 
> But, when EventNotifier is backed by a pipefd, we have two file
> descriptors, one that can only be used for reads (rfd), and the other
> only for writes (wfd).
> 
> There's, at least, one known situation in which we need to obtain wfd
> instead of rfd, which is when setting up the file that's going to be
> sent to the peer in vhost's SET_VRING_CALL.
> 
> Extend event_notifier_get_fd() to receive an argument which indicates
> whether the caller wants to obtain rfd (false) or wfd (true).

There are about 50 places where we add the false arg here and 1 where
we use true.  Seems it would save a lot of churn to hide this
internally, event_notifier_get_fd() returns an rfd, a new
event_notifier_get_wfd() returns the wfd.  Thanks,

Alex


