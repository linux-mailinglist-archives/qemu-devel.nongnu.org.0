Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 329703A4689
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Jun 2021 18:31:45 +0200 (CEST)
Received: from localhost ([::1]:52672 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrk4O-0007rn-99
	for lists+qemu-devel@lfdr.de; Fri, 11 Jun 2021 12:31:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lrk1x-00069y-I5
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 12:29:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23945)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lrk1v-00069z-Rp
 for qemu-devel@nongnu.org; Fri, 11 Jun 2021 12:29:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623428951;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zj59guWg/ri4FKTlawe6nW7vfRx9NasDPOJn8Sjo4fE=;
 b=SVAylvUhLn/j+7cjKNyg2mXvY6Um+u2KbqweQ2J1Vm/QeoWmN3zi8x4Hy/6wkXBE6DTIk1
 vxWuwuL3RSMMt+BpSKJUQ+6wEoNTtXFbDigSVWvfpvTcO3GevZxKBYn4OERFEmnzBLiKOF
 O1iT13P8pGVb1fNrlBS8EU9IBFASCuY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-431-E8xhA1PdN92Ci9XsZZVvrQ-1; Fri, 11 Jun 2021 12:29:04 -0400
X-MC-Unique: E8xhA1PdN92Ci9XsZZVvrQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21AB48015A4;
 Fri, 11 Jun 2021 16:29:03 +0000 (UTC)
Received: from redhat.com (ovpn-115-90.ams2.redhat.com [10.36.115.90])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B040619D9F;
 Fri, 11 Jun 2021 16:28:38 +0000 (UTC)
Date: Fri, 11 Jun 2021 17:28:35 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: qemu-devel@nongnu.org
Subject: Re: [PATCH 3/7] net/rocker: use GDateTime for formatting timestamp
 in debug messages
Message-ID: <YMOPM87ZdWWQOUsR@redhat.com>
References: <20210505103702.521457-1-berrange@redhat.com>
 <20210505103702.521457-4-berrange@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210505103702.521457-4-berrange@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Kevin Wolf <kwolf@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Max Reitz <mreitz@redhat.com>,
 virtio-fs@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

ping: anyone willing to give a review of this one

On Wed, May 05, 2021 at 11:36:58AM +0100, Daniel P. Berrangé wrote:
> The GDateTime APIs provided by GLib avoid portability pitfalls, such
> as some platforms where 'struct timeval.tv_sec' field is still 'long'
> instead of 'time_t'. When combined with automatic cleanup, GDateTime
> often results in simpler code too.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  hw/net/rocker/rocker.h | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/net/rocker/rocker.h b/hw/net/rocker/rocker.h
> index 941c932265..412fa44d01 100644
> --- a/hw/net/rocker/rocker.h
> +++ b/hw/net/rocker/rocker.h
> @@ -25,14 +25,9 @@
>  #if defined(DEBUG_ROCKER)
>  #  define DPRINTF(fmt, ...) \
>      do {                                                           \
> -        struct timeval tv;                                         \
> -        char timestr[64];                                          \
> -        time_t now;                                                \
> -        gettimeofday(&tv, NULL);                                   \
> -        now = tv.tv_sec;                                           \
> -        strftime(timestr, sizeof(timestr), "%T", localtime(&now)); \
> -        fprintf(stderr, "%s.%06ld ", timestr, tv.tv_usec);         \
> -        fprintf(stderr, "ROCKER: " fmt, ## __VA_ARGS__);           \
> +        g_autoptr(GDateTime) now = g_date_time_new_now_local();    \
> +        g_autofree char *nowstr = g_date_time_format(now, "%T.%f");\
> +        fprintf(stderr, "%s ROCKER: " fmt, nowstr, ## __VA_ARGS__);\
>      } while (0)
>  #else
>  static inline GCC_FMT_ATTR(1, 2) int DPRINTF(const char *fmt, ...)
> -- 
> 2.31.1
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


