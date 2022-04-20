Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD94B508B7B
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Apr 2022 17:02:59 +0200 (CEST)
Received: from localhost ([::1]:41552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhBr8-0004oQ-RE
	for lists+qemu-devel@lfdr.de; Wed, 20 Apr 2022 11:02:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nhBIS-00019M-8S
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:27:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:24822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1nhBIP-0006HP-N8
 for qemu-devel@nongnu.org; Wed, 20 Apr 2022 10:27:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650464819;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dwsl3BDk5xZ4E8gEBxFZC4IrCI2Y7T86lfL1m8FWc5Y=;
 b=Kc/f5i5iWoPNl4Bi12hb33w+jEw8CLoX0bwMBFur5hqBwKX6pxk5qLMgUDL1tIZyoPtwMz
 c1s3uwygQAR2cvCdPvi/oMaVKUtSEsQ9fKSqhcKi7cN385q7t0xL1zWtM49v3MfIQgcL96
 xOfEUaKa1pgrPKJJCrSjtJuNQr0ai/w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-137-TPtM7jidOC6zK0P4a-QE9g-1; Wed, 20 Apr 2022 10:26:58 -0400
X-MC-Unique: TPtM7jidOC6zK0P4a-QE9g-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id BE22680346F;
 Wed, 20 Apr 2022 14:26:57 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.162])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E8E57145BA5A;
 Wed, 20 Apr 2022 14:26:56 +0000 (UTC)
Date: Wed, 20 Apr 2022 15:26:53 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Subject: Re: [PATCH 01/41] qga: use fixed-length for usecs formatting
Message-ID: <YmAYLYC7bgnDcFS7@redhat.com>
References: <20220420132624.2439741-1-marcandre.lureau@redhat.com>
 <20220420132624.2439741-2-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220420132624.2439741-2-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.7
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Apr 20, 2022 at 05:25:44PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> The old code is kind of wrong. Say it's 1649309843.000001 seconds past
> the epoch. Prints "1649309843.1". 9us later, it prints "1649309843.10".
> Should really use %06lu for the microseconds part.
> 
> Use int64_t/PRId64 instead of old GLib-style.
> 
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>  qga/main.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/qga/main.c b/qga/main.c
> index 1deb0ee2fbfe..ac63d8e47802 100644
> --- a/qga/main.c
> +++ b/qga/main.c
> @@ -328,11 +328,10 @@ static void ga_log(const gchar *domain, GLogLevelFlags level,
>  #else
>      if (level & s->log_level) {
>  #endif
> -        gint64 t = g_get_real_time();
> +        int64_t t = g_get_real_time();
>          fprintf(s->log_file,
> -                "%" G_GINT64_FORMAT ".%" G_GINT64_FORMAT
> -                ": %s: %s\n", t / G_USEC_PER_SEC, t % G_USEC_PER_SEC,
> -                level_str, msg);
> +                "%" PRId64 ".%06" PRId64 ": %s: %s\n",
> +                t / G_USEC_PER_SEC, t % G_USEC_PER_SEC, level_str, msg);
>          fflush(s->log_file);

IMHO better to get rid of the manual date formatting entirely and
use GDateTime :

  g_autoptr(GDateTime) now = g_date_time_now_utc();
  g_autofree char *nowstr = g_date_time_format("%s.%f", now)
  fprintf(s->log_file, "%s: %s: %s\n", nowstr, level_str, msg);
  fflush(s->log_file);


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


