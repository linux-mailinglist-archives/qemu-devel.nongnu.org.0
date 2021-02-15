Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A2DA31B75D
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Feb 2021 11:42:41 +0100 (CET)
Received: from localhost ([::1]:58104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lBbKy-0000IC-7U
	for lists+qemu-devel@lfdr.de; Mon, 15 Feb 2021 05:42:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <chirantan@google.com>)
 id 1lBbEf-0000dm-IB
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:36:09 -0500
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629]:40613)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <chirantan@google.com>)
 id 1lBbEd-0003Gt-C5
 for qemu-devel@nongnu.org; Mon, 15 Feb 2021 05:36:09 -0500
Received: by mail-ej1-x629.google.com with SMTP id b14so4326266eju.7
 for <qemu-devel@nongnu.org>; Mon, 15 Feb 2021 02:36:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=lT/LLKzu5HIqoSbSW/QvdHYh/J21YhqJ53RuEd1nGlY=;
 b=SVdhVZvVixektXLbPk6WMBq4bXc46Awf+Jc+6NUZnaPK/wk2YTVrQG7ohz9xPW4tcK
 KEkrHrQTEYhkgbxwDIXCRpVQn+hTOrPTJE5dEwIxg3DoIOHh/QnRh5FOy7rt6zmxi71A
 1/ONnfRJFnirbDGgsJQtyWWxJxc9f1M+oxGlc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=lT/LLKzu5HIqoSbSW/QvdHYh/J21YhqJ53RuEd1nGlY=;
 b=a8OcSa6cvN5dLGaIgC5Sd8Kx2277nXV5zjjtJ9CdkmHQ2WPvGNEZtg/X7utJdRSnal
 jcv3FdPG0Zl91t9VR/cbUsuL0lUJmlb12YmgpV0FNK3f8zo78G7zJOb+qXn0pH0/JeQE
 4gqht+Q5XqRUWjHuwfC0OILqsW5Z/vnb6RqBBnYvIrVyc3wNRF+GEOWQezVr/8Yr3K5t
 IGFD72McepCzajNFj7PoS0JQ7+RUS4LlSuo33KbstM0Mb4Qnl+Ov98wyMr/0+p1TMeTP
 if9XZ0YuNOPHpZm42zYpKLe2DKKi0LGR3PIjA8sMENYXGkLnSGEKradxXvXBgZHa7l7H
 luqw==
X-Gm-Message-State: AOAM533+eCmqBj1o6ddUy0MbPW3/MnPRgB7P6VQJ2TuTqmtJeySU2PDH
 oMbLiRJtLxsZZOmdrNY/g+Qx9DpzTaRWJPVR47bhNA==
X-Google-Smtp-Source: ABdhPJzkOGw8nfOlkBDjh5IXAND7jVkuEIzADPlMwCGYq23iuQ48rm8+pUExVioTLyVY3y3BEw7QGbQw//sTQe+VEnY=
X-Received: by 2002:a17:906:c10a:: with SMTP id
 do10mr15034474ejc.543.1613385364237; 
 Mon, 15 Feb 2021 02:36:04 -0800 (PST)
MIME-Version: 1.0
References: <20210209190224.62827-1-dgilbert@redhat.com>
 <20210209190224.62827-8-dgilbert@redhat.com>
In-Reply-To: <20210209190224.62827-8-dgilbert@redhat.com>
From: Chirantan Ekbote <chirantan@chromium.org>
Date: Mon, 15 Feb 2021 19:35:53 +0900
Message-ID: <CAJFHJrqioXu7K8Z=dFgMQDWoKoNK3pddcgf9znCS72BR4WHSYA@mail.gmail.com>
Subject: Re: [Virtio-fs] [PATCH 07/24] DAX: virtio-fs: Add vhost-user slave
 commands for mapping
To: "Dr. David Alan Gilbert (git)" <dgilbert@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=chirantan@google.com; helo=mail-ej1-x629.google.com
X-Spam_score_int: -92
X-Spam_score: -9.3
X-Spam_bar: ---------
X-Spam_report: (-9.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
Cc: mst@redhat.com, qemu-devel@nongnu.org,
 virtio-fs-list <virtio-fs@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 marcandre.lureau@redhat.com, Vivek Goyal <vgoyal@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Feb 10, 2021 at 4:04 AM Dr. David Alan Gilbert (git)
<dgilbert@redhat.com> wrote:
>
> From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
> +
> +typedef struct {
> +    /* Offsets within the file being mapped */
> +    uint64_t fd_offset[VHOST_USER_FS_SLAVE_ENTRIES];
> +    /* Offsets within the cache */
> +    uint64_t c_offset[VHOST_USER_FS_SLAVE_ENTRIES];
> +    /* Lengths of sections */
> +    uint64_t len[VHOST_USER_FS_SLAVE_ENTRIES];
> +    /* Flags, from VHOST_USER_FS_FLAG_* */
> +    uint64_t flags[VHOST_USER_FS_SLAVE_ENTRIES];
> +} VhostUserFSSlaveMsg;
> +

Is it too late to change this?  This struct allocates space for up to
8 entries but most of the time the server will only try to set up one
mapping at a time so only 32 out of the 256 bytes in the message are
actually being used.  We're just wasting time memcpy'ing bytes that
will never be used.  Is there some reason this can't be dynamically
sized?  Something like:

typedef struct {
    /* Number of mapping requests */
    uint16_t num_requests;
    /* `num_requests` mapping requests */
   MappingRequest requests[];
} VhostUserFSSlaveMsg;

typedef struct {
    /* Offset within the file being mapped */
    uint64_t fd_offset;
    /* Offset within the cache */
    uint64_t c_offset;
    /* Length of section */
    uint64_t len;
    /* Flags, from VHOST_USER_FS_FLAG_* */
    uint64_t flags;
} MappingRequest;

The current pre-allocated structure both wastes space when there are
fewer than 8 requests and requires extra messages to be sent when
there are more than 8 requests.  I realize that in the grand scheme of
things copying 224 extra bytes is basically not noticeable but it just
irks me that we could fix this really easily before it gets propagated
to too many other places.

Chirantan

> --
> 2.29.2
>
> _______________________________________________
> Virtio-fs mailing list
> Virtio-fs@redhat.com
> https://www.redhat.com/mailman/listinfo/virtio-fs
>

