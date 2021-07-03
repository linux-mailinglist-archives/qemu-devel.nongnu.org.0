Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB6F3BA90D
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 16:52:59 +0200 (CEST)
Received: from localhost ([::1]:32914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzh0s-0007nn-0z
	for lists+qemu-devel@lfdr.de; Sat, 03 Jul 2021 10:52:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lzgyd-0006hS-NO
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 10:50:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27450)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <nsoffer@redhat.com>)
 id 1lzgyZ-0003Ie-0w
 for qemu-devel@nongnu.org; Sat, 03 Jul 2021 10:50:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625323833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=liMU6pQGPK5hg1VHyLrzcfAWY4T+O34B8UZ6tMn84mw=;
 b=YVq2zS9mxuYdYDkQKQuaiIOdOdIqbsN8Lao0pYSNkbLSQxR0U8KdH+KoHm+5T9dOedzeZ9
 zj8ZxtouS3uxuo++08tV6zp4IggJBzOXMwRsxuNlRWiqdTY8pfOnsSvXqaldHpNKRhULqA
 Dcl4rGTKpqEOwkxhIwCmi/3cdunwraM=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-31-xDfwTO1sPZStMYB_Sd7nWQ-1; Sat, 03 Jul 2021 10:50:32 -0400
X-MC-Unique: xDfwTO1sPZStMYB_Sd7nWQ-1
Received: by mail-ot1-f69.google.com with SMTP id
 y59-20020a9d22c10000b0290451891192f0so8593844ota.1
 for <qemu-devel@nongnu.org>; Sat, 03 Jul 2021 07:50:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=liMU6pQGPK5hg1VHyLrzcfAWY4T+O34B8UZ6tMn84mw=;
 b=bosnxgCt0vUfGus2KJQCyFiecviVZUE0C3wHjdP1TNKUIYe8epM+OHYHohw0uM7KrX
 4jUAkp8VsJD+nqojCsgcTjJfIkCvTpgztC9j22dvTJdvQPSypGjWAvEc2BG0NctJQM7T
 iQMYGv1EblXO1w2jSg6RKE3Wl8y1e0cV4t7jkOUTv50LP4/6cF8jHjREFBLCYUWczf7H
 KITm8uZXjm92hJzUWuPV7LwHqrau9aCPgNWQdQTpB+ZJwVBcRCFodDjhqYvcEaQCKNml
 1nEtA88BY+GFQ8L+AXyD1V9EWjWFKLDM5IJ0nDYzLlQ+1BdJYXVnjXL5gwDaWErPMUUX
 dXjQ==
X-Gm-Message-State: AOAM533Pu/xJ4df3nROarGg7+zVOj2HKHuq/B9XKroyy9lVRVG6rKe03
 x5NmLCCN6FBxMfs6kt9nLc/eR0D6ZW6tI3xZSfOyc2pblPcp0eUfVgdneKqlAM6R1McZla64oWK
 XogSSnmVEgsMVIu8PjGXv4laIAy1iOPQ=
X-Received: by 2002:a05:6808:a94:: with SMTP id
 q20mr3904205oij.41.1625323831335; 
 Sat, 03 Jul 2021 07:50:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwc9I0yTNB5wwggv7Gf6kaaQGsLMQC1rZEvYsRg2VFrtKqGXXQmzqvJ/yQfZjMq+S1AiIrZFupXGwwB0/RoMIg=
X-Received: by 2002:a05:6808:a94:: with SMTP id
 q20mr3904191oij.41.1625323831024; 
 Sat, 03 Jul 2021 07:50:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210703135033.835344-1-vsementsov@virtuozzo.com>
In-Reply-To: <20210703135033.835344-1-vsementsov@virtuozzo.com>
From: Nir Soffer <nsoffer@redhat.com>
Date: Sat, 3 Jul 2021 17:50:14 +0300
Message-ID: <CAMRbyysqP+by8PrF7WQD4D2R7GXLwya4L1GMm8V8oHPS3AyJjw@mail.gmail.com>
Subject: Re: [PATCH v2] docs: document file-posix locking protocol
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=nsoffer@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=nsoffer@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.377,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 qemu-block <qemu-block@nongnu.org>, Markus Armbruster <armbru@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 den@openvz.org, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sat, Jul 3, 2021 at 4:51 PM Vladimir Sementsov-Ogievskiy
<vsementsov@virtuozzo.com> wrote:
>
> Let's document how we use file locks in file-posix driver, to allow
> external programs to "communicate" in this way with Qemu.

This makes the locking implementation public, so qemu can never change
it without breaking external programs. I'm not sure this is an issue since
even now qemu cannot change without breaking compatibility with older
qemu versions.

Maybe a better way to integrate with external programs is to provide
a library/tool to perform locking?

For example we can have tool like:

   qemu-img lock [how] image command

This example will take the lock specified by "how" on image while "command"
is running.

> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
>
> v2: improve some descriptions
>     add examples
>     add notice about old bad POSIX file locks
>
>  docs/system/qemu-block-drivers.rst.inc | 186 +++++++++++++++++++++++++
>  1 file changed, 186 insertions(+)
>
> diff --git a/docs/system/qemu-block-drivers.rst.inc b/docs/system/qemu-block-drivers.rst.inc
> index 16225710eb..74fb71600d 100644
> --- a/docs/system/qemu-block-drivers.rst.inc
> +++ b/docs/system/qemu-block-drivers.rst.inc
> @@ -909,3 +909,189 @@ some additional tasks, hooking io requests.
>    .. option:: prealloc-size
>
>      How much to preallocate (in bytes), default 128M.
> +
> +Image locking protocol
> +~~~~~~~~~~~~~~~~~~~~~~
> +
> +QEMU holds rd locks and never rw locks. Instead, GETLK fcntl is used with F_WRLCK
> +to handle permissions as described below.
> +QEMU process may rd-lock the following bytes of the image with corresponding
> +meaning:
> +
> +Permission bytes. If permission byte is rd-locked, it means that some process
> +uses corresponding permission on that file.
> +
> +Byte    Operation
> +100     read
> +          Lock holder can read
> +101     write
> +          Lock holder can write
> +102     write-unchanged
> +          Lock holder can write same data if it sure, that this write doesn't
> +          break concurrent readers. This is mostly used internally in Qemu
> +          and it wouldn't be good idea to exploit it somehow.
> +103     resize
> +          Lock holder can resize the file. "write" permission is also required
> +          for resizing, so lock byte 103 only if you also lock byte 101.
> +104     graph-mod
> +          Undefined. QEMU may sometimes locks this byte, but external programs
> +          should not. QEMU will stop locking this byte in future
> +
> +Unshare bytes. If permission byte is rd-locked, it means that some process
> +does not allow the others use corresponding options on that file.
> +
> +Byte    Operation
> +200     read
> +          Lock holder don't allow read operation to other processes.
> +201     write
> +          Lock holder don't allow write operation to other processes. This
> +          still allows others to do write-uncahnged operations. Better not
> +          exploit outside of Qemu.
> +202     write-unchanged
> +          Lock holder don't allow write-unchanged operation to other processes.
> +203     resize
> +          Lock holder don't allow resizing the file by other processes.
> +204     graph-mod
> +          Undefined. QEMU may sometimes locks this byte, but external programs
> +          should not. QEMU will stop locking this byte in future
> +
> +Handling the permissions works as follows: assume we want to open the file to do
> +some operations and in the same time want to disallow some operation to other
> +processes. So, we want to lock some of the bytes described above. We operate as
> +follows:
> +
> +1. rd-lock all needed bytes, both "permission" bytes and "unshare" bytes.
> +
> +2. For each "unshare" byte we rd-locked, do GETLK that "tries" to wr-lock
> +corresponding "permission" byte. So, we check is there any other process that
> +uses the permission we want to unshare. If it exists we fail.
> +
> +3. For each "permission" byte we rd-locked, do GETLK that "tries" to wr-lock
> +corresponding "unshare" byte. So, we check is there any other process that
> +unshares the permission we want to have. If it exists we fail.
> +
> +Important notice: Qemu may fallback to POSIX file locks only if OFD locks
> +unavailable. Other programs should behave similarly: use POSIX file locks
> +only if OFD locks unavailable and if you are OK with drawbacks of POSIX
> +file locks (for example, they are lost on close() of any file descriptor
> +for that file).

Worth an example.

> +
> +Image locking examples
> +~~~~~~~~~~~~~~~~~~~~~~
> +
> +Read-only, allow others to write
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +So, we want to read and don't care what other users do with the image. We only
> +need to lock byte 100. Operation is as follows:
> +
> +1. rd-lock byte 100
> +
> +.. highlight:: c
> +
> +    struct flock fl = {
> +        .l_whence = SEEK_SET,
> +        .l_start  = 100,
> +        .l_len    = 1,
> +        .l_type   = F_RDLCK,
> +    };
> +    ret = fcntl(fd, F_OFD_SETLK, &fl);
> +    if (ret == -1) {
> +        /* Error */
> +    }
> +
> +2. try wr-lock byte 200, to check that no one is against our read access
> +
> +.. highlight:: c
> +
> +    struct flock fl = {
> +        .l_whence = SEEK_SET,
> +        .l_start  = 200,
> +        .l_len    = 1,
> +        .l_type   = F_WRLCK,
> +    };
> +    ret = fcntl(fd, F_OFD_GETLK, &fl);
> +    if (ret != -1 && fl.l_type == F_UNLCK) {
> +        /*
> +         * We are lucky, nobody against. So, now we have RO access
> +         * that we want.
> +         */
> +    } else {
> +        /* Error, or RO access is blocked by someone. We don't have access */
> +    }
> +
> +3. Now we can operate read the data.
> +
> +4. When finished, release the lock:
> +
> +.. highlight:: c
> +
> +    struct flock fl = {
> +        .l_whence = SEEK_SET,
> +        .l_start  = 100,
> +        .l_len    = 1,
> +        .l_type   = F_UNLCK,
> +    };
> +    ret = fcntl(fd, F_OFD_SETLK, &fl);
> +
> +RW, allow others to read only
> +^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> +
> +We want to read and write, and don't want others to modify the image.
> +So, let's lock bytes 100, 101, 201. Operation is as follows:
> +
> +1. rd-lock bytes 100 (read), 101 (write), 201 (don't allow others to write)
> +
> +.. highlight:: c
> +
> +    for byte in (100, 101, 201) {

Using python syntax here is a little bit confusing.

> +        struct flock fl = {
> +            .l_whence = SEEK_SET,
> +            .l_start  = byte,
> +            .l_len    = 1,
> +            .l_type   = F_RDLCK,
> +        };
> +        ret = fcntl(fd, F_OFD_SETLK, &fl);
> +        if (ret == -1) {
> +            /* Error */
> +        }
> +    }
> +
> +2. try wr-lock bytes 200 (to check that no one is against our read access),
> +   201 (no one against our write access), 101 (there are no writers currently)
> +
> +.. highlight:: c
> +
> +    for byte in (200, 201, 101) {
> +        struct flock fl = {
> +            .l_whence = SEEK_SET,
> +            .l_start  = byte,
> +            .l_len    = 1,
> +            .l_type   = F_WRLCK,
> +        };
> +        ret = fcntl(fd, F_OFD_GETLK, &fl);
> +        if (ret != -1 && fl.l_type == F_UNLCK) {
> +            /* We are lucky, nobody against. */
> +        } else {
> +            /*
> +             * Error, or feature we want is blocked by someone.
> +             * We don't have access.
> +             */
> +        }
> +    }
> +
> +3. Now we can read and write.
> +
> +4. When finished, release locks:
> +
> +.. highlight:: c
> +
> +    for byte in (100, 101, 201) {
> +        struct flock fl = {
> +            .l_whence = SEEK_SET,
> +            .l_start  = byte,
> +            .l_len    = 1,
> +            .l_type   = F_UNLCK,
> +        };
> +        fcntl(fd, F_OFD_SETLK, &fl);
> +    }
> --
> 2.29.2

Having this is great even if the locking protocol is not made public.

Nir


