Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A561037584E
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 18:17:29 +0200 (CEST)
Received: from localhost ([::1]:33506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leggq-0007RI-Le
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 12:17:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1legQs-0000sN-0w
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:00:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60038)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1legQp-0001i9-5M
 for qemu-devel@nongnu.org; Thu, 06 May 2021 12:00:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620316854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uDfIRM0D8rJc96MJ7x9B5n3m65AN29xrb+MMIkaQaT8=;
 b=J122pczGuuvJQKpL0G4iQB5ymOsSVc/gGTKS/x8lSPovzIE0H8yYao6FSoA2Y2eXcLJHHk
 c5MFweWpUjbjGHZoHaJqcBEjM2DB95Rl3QDLJRZMmnbYaqYJiu9e42SROjotr6t7PkaiTx
 HK4U3iHyYctR8081xhIc8b2xiSmtcfU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-j-wjdtqTPTmiT2zo0USJeQ-1; Thu, 06 May 2021 12:00:49 -0400
X-MC-Unique: j-wjdtqTPTmiT2zo0USJeQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 195D8107ACE4;
 Thu,  6 May 2021 16:00:48 +0000 (UTC)
Received: from work-vm (ovpn-115-37.ams2.redhat.com [10.36.115.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 7C3E460657;
 Thu,  6 May 2021 16:00:33 +0000 (UTC)
Date: Thu, 6 May 2021 17:00:31 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Subject: Re: [PATCH 7/7] virtiofsd: use GDateTime for formatting timestamp
 for debug messages
Message-ID: <YJQSnyAIkww0ApJM@work-vm>
References: <20210505103702.521457-1-berrange@redhat.com>
 <20210505103702.521457-8-berrange@redhat.com>
 <YJKw/qcsSBvgB1hG@work-vm>
MIME-Version: 1.0
In-Reply-To: <YJKw/qcsSBvgB1hG@work-vm>
User-Agent: Mutt/2.0.6 (2021-03-06)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=dgilbert@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.69,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Jiri Pirko <jiri@resnulli.us>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-devel@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
 virtio-fs@redhat.com, Gerd Hoffmann <kraxel@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

* Dr. David Alan Gilbert (dgilbert@redhat.com) wrote:
> * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > The GDateTime APIs provided by GLib avoid portability pitfalls, such
> > as some platforms where 'struct timeval.tv_sec' field is still 'long'
> > instead of 'time_t'. When combined with automatic cleanup, GDateTime
> > often results in simpler code too.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> 
> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>

Queued this 7/7 via virtiofsd

> > ---
> >  tools/virtiofsd/passthrough_ll.c | 25 ++++---------------------
> >  1 file changed, 4 insertions(+), 21 deletions(-)
> > 
> > diff --git a/tools/virtiofsd/passthrough_ll.c b/tools/virtiofsd/passthrough_ll.c
> > index 1553d2ef45..cdd224918c 100644
> > --- a/tools/virtiofsd/passthrough_ll.c
> > +++ b/tools/virtiofsd/passthrough_ll.c
> > @@ -3558,10 +3558,6 @@ static void setup_nofile_rlimit(unsigned long rlimit_nofile)
> >  static void log_func(enum fuse_log_level level, const char *fmt, va_list ap)
> >  {
> >      g_autofree char *localfmt = NULL;
> > -    struct timespec ts;
> > -    struct tm tm;
> > -    char sec_fmt[sizeof "2020-12-07 18:17:54"];
> > -    char zone_fmt[sizeof "+0100"];
> >  
> >      if (current_log_level < level) {
> >          return;
> > @@ -3573,23 +3569,10 @@ static void log_func(enum fuse_log_level level, const char *fmt, va_list ap)
> >              localfmt = g_strdup_printf("[ID: %08ld] %s", syscall(__NR_gettid),
> >                                         fmt);
> >          } else {
> > -            /* try formatting a broken-down timestamp */
> > -            if (clock_gettime(CLOCK_REALTIME, &ts) != -1 &&
> > -                localtime_r(&ts.tv_sec, &tm) != NULL &&
> > -                strftime(sec_fmt, sizeof sec_fmt, "%Y-%m-%d %H:%M:%S",
> > -                         &tm) != 0 &&
> > -                strftime(zone_fmt, sizeof zone_fmt, "%z", &tm) != 0) {
> > -                localfmt = g_strdup_printf("[%s.%02ld%s] [ID: %08ld] %s",
> > -                                           sec_fmt,
> > -                                           ts.tv_nsec / (10L * 1000 * 1000),
> > -                                           zone_fmt, syscall(__NR_gettid),
> > -                                           fmt);
> > -            } else {
> > -                /* fall back to a flat timestamp */
> > -                localfmt = g_strdup_printf("[%" PRId64 "] [ID: %08ld] %s",
> > -                                           get_clock(), syscall(__NR_gettid),
> > -                                           fmt);
> > -            }
> > +            g_autoptr(GDateTime) now = g_date_time_new_now_local();
> > +            g_autofree char *nowstr = g_date_time_format(now, "%Y-%m-%d %H:%M:%S.%f%z");
> > +            localfmt = g_strdup_printf("[%s] [ID: %08ld] %s",
> > +                                       nowstr, syscall(__NR_gettid), fmt);
> >          }
> >          fmt = localfmt;
> >      }
> > -- 
> > 2.31.1
> > 
> -- 
> Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK
> 
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


