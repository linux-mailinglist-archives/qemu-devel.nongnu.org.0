Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CEBA3DE8C4
	for <lists+qemu-devel@lfdr.de>; Tue,  3 Aug 2021 10:48:29 +0200 (CEST)
Received: from localhost ([::1]:40046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mAq68-0002Nt-Hs
	for lists+qemu-devel@lfdr.de; Tue, 03 Aug 2021 04:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mAq4o-00010W-Oo
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 04:47:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mAq4m-0005z1-VQ
 for qemu-devel@nongnu.org; Tue, 03 Aug 2021 04:47:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627980424;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nP1wPbYGDS/YlrvA3/ZXh/Fxl/qXXjOv0RbXMisDI10=;
 b=Px+Sd5kgDFQbrIbqcqzzLNCDtVg5vEUJXF2gp+5qGTc2TAgHOXIAcT77N+BHp0iAuKjbms
 pf8kkmnYKqMmAWGqJ1UXENU9EGX/C8G84KT+O9bwr/urPCsNvDxST8mgC0L2X+cfUynOvI
 vuvKM9zWLD//HEJ1OwQYdu+E8q317Tk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-325-2noiRWZYN_a80MsIa6eHIA-1; Tue, 03 Aug 2021 04:47:03 -0400
X-MC-Unique: 2noiRWZYN_a80MsIa6eHIA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 62032189CD01
 for <qemu-devel@nongnu.org>; Tue,  3 Aug 2021 08:47:02 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.216])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5EB795D6A8;
 Tue,  3 Aug 2021 08:46:57 +0000 (UTC)
Date: Tue, 3 Aug 2021 09:46:55 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 4/4] chardev: add some comments about the class methods
Message-ID: <YQkCf9Mrky3uYp63@redhat.com>
References: <20210723102825.1790112-1-marcandre.lureau@redhat.com>
 <20210723102825.1790112-5-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210723102825.1790112-5-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.701,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Jul 23, 2021 at 02:28:25PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  include/chardev/char.h | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
> 
> diff --git a/include/chardev/char.h b/include/chardev/char.h
> index 589e7fe46d..2e4c16f82f 100644
> --- a/include/chardev/char.h
> +++ b/include/chardev/char.h
> @@ -254,24 +254,57 @@ struct ChardevClass {
>  
>      bool internal; /* TODO: eventually use TYPE_USER_CREATABLE */
>      bool supports_yank;
> +
> +    /* parse command line options and populate QAPI @backend */
>      void (*parse)(QemuOpts *opts, ChardevBackend *backend, Error **errp);
>  
> +    /* called after construction, open/starts the backend */
>      void (*open)(Chardev *chr, ChardevBackend *backend,
>                   bool *be_opened, Error **errp);
>  
> +    /* write buf to the backend */
>      int (*chr_write)(Chardev *s, const uint8_t *buf, int len);
> +
> +    /*
> +     * Read from the backend (blocking). A typical front-end will instead rely
> +     * on char_can_read/chr_read being called when polling/looping.
> +     */

chr_can_read

>      int (*chr_sync_read)(Chardev *s, const uint8_t *buf, int len);
> +
> +    /* create a watch on the backend */
>      GSource *(*chr_add_watch)(Chardev *s, GIOCondition cond);
> +
> +    /* update the backend internal sources */
>      void (*chr_update_read_handler)(Chardev *s);
> +
> +    /* send an ioctl to the backend */
>      int (*chr_ioctl)(Chardev *s, int cmd, void *arg);
> +
> +    /* get ancillary-received fds during last read */
>      int (*get_msgfds)(Chardev *s, int* fds, int num);
> +
> +    /* set ancillary fds to be sent with next write */
>      int (*set_msgfds)(Chardev *s, int *fds, int num);
> +
> +    /* accept the given fd */
>      int (*chr_add_client)(Chardev *chr, int fd);
> +
> +    /* wait for a connection */
>      int (*chr_wait_connected)(Chardev *chr, Error **errp);
> +
> +    /* disconnect a connection */
>      void (*chr_disconnect)(Chardev *chr);
> +
> +    /* called by frontend when it can read */
>      void (*chr_accept_input)(Chardev *chr);
> +
> +    /* set terminal echo */
>      void (*chr_set_echo)(Chardev *chr, bool echo);
> +
> +    /* notify the backend of frontend open state */
>      void (*chr_set_fe_open)(Chardev *chr, int fe_open);
> +
> +    /* handle various events */
>      void (*chr_be_event)(Chardev *s, QEMUChrEvent event);
>  };

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


