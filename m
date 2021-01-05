Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 195F22EB1D8
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:55:37 +0100 (CET)
Received: from localhost ([::1]:54104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwqYS-0007US-1g
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:55:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kwqJO-0002mf-FO
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:40:02 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59647)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1kwqJL-00010W-Nd
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:40:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1609868399;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1975RotN7bx/pVjtP8np8aGkQPQ5G5ysFfkrpFOJ6Bo=;
 b=QKpKyh3OzEjJ/cPgCJ612dyfAa/IRtxBE046hO4H64RAX5SbvRc8QTyV35SdI5SQoi8cbN
 Cyhw9EkbUbllcK75oW+o6SYJ9H4gnsYqqCvqZaKdbDj4P3p2Kj5RTkcU1Zg0heTQ8Y7oB/
 ey25HeJrDgJleh5XOINxx8wGbOS+m40=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-13-JUv-phf2PAS_UHPcbjOGmQ-1; Tue, 05 Jan 2021 12:39:53 -0500
X-MC-Unique: JUv-phf2PAS_UHPcbjOGmQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CE03E1922021;
 Tue,  5 Jan 2021 17:39:51 +0000 (UTC)
Received: from redhat.com (ovpn-114-197.ams2.redhat.com [10.36.114.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 1273A1349A;
 Tue,  5 Jan 2021 17:39:46 +0000 (UTC)
Date: Tue, 5 Jan 2021 17:39:44 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PULL for-5.2 2/2] scripts/tracetool: silence SystemTap
 dtrace(1) long long warnings
Message-ID: <20210105173944.GJ724458@redhat.com>
References: <20201111155654.1430860-1-stefanha@redhat.com>
 <20201111155654.1430860-3-stefanha@redhat.com>
 <702283f5-13c1-00f9-4c83-49c469287483@redhat.com>
MIME-Version: 1.0
In-Reply-To: <702283f5-13c1-00f9-4c83-49c469287483@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
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
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Jan 04, 2021 at 09:31:19PM +0100, Laurent Vivier wrote:
> On 11/11/2020 16:56, Stefan Hajnoczi wrote:
> > SystemTap's dtrace(1) prints the following warning when it encounters
> > long long arguments:
> > 
> >   Warning: /usr/bin/dtrace:trace/trace-dtrace-hw_virtio.dtrace:76: syntax error near:
> >   probe vhost_vdpa_dev_start
> > 
> >   Warning: Proceeding as if --no-pyparsing was given.
> > 
> > Use the uint64_t and int64_t types, respectively. This works with all
> > host CPU 32- and 64-bit data models (ILP32, LP64, and LLP64) that QEMU
> > supports.
> > 
> > Reported-by: Markus Armbruster <armbru@redhat.com>
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> > Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > Message-id: 20201020094043.159935-1-stefanha@redhat.com
> > Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
> > Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> > ---
> >  scripts/tracetool/format/d.py | 6 ++++++
> >  1 file changed, 6 insertions(+)
> > 
> > diff --git a/scripts/tracetool/format/d.py b/scripts/tracetool/format/d.py
> > index 353722f89c..ebfb714200 100644
> > --- a/scripts/tracetool/format/d.py
> > +++ b/scripts/tracetool/format/d.py
> > @@ -57,6 +57,12 @@ def generate(events, backend, group):
> >                  # Avoid it by changing probe type to signed char * beforehand.
> >                  if type_ == 'int8_t *':
> >                      type_ = 'signed char *'
> > +
> > +            # SystemTap dtrace(1) emits a warning when long long is used
> > +            type_ = type_.replace('unsigned long long', 'uint64_t')
> > +            type_ = type_.replace('signed long long', 'int64_t')
> > +            type_ = type_.replace('long long', 'int64_t')
> > +
> >              if name in RESERVED_WORDS:
> >                  name += '_'
> >              args.append(type_ + ' ' + name)
> > 
> 
> This patch fixes the warning with "d" format, but we have the same kind of problem with
> log-stap format:
> 
>   $ sudo stap -e 'probe begin{printf ("BEGIN")}'  -I .
>   parse error: invalid or missing conversion specifier
>           saw: operator ',' at ./qemu-system-x86_64-log.stp:15118:101
>        source:     printf("%d@%d vhost_vdpa_set_log_base dev: %p base: 0x%x size: %llu
> refcnt: %d fd: %d log: %p\n", pid(), gettimeofday_ns(), dev, base, size, refcnt, fd, log)
> 
>                        ^
> 
>   1 parse error.
>   WARNING: tapset "./qemu-system-x86_64-log.stp" has errors, and will be skipped
>   BEGIN
> 
> This happens because of the "%llu" in the format string.
> 
> I'm wondering if we need to fix all the stap based format or simply replace the "unsigned
> long long" by "uint64_t" in hw/virtio/trace-events?

The problem isn't really the data type, but rather the format string.
systemtap format strings are not quite the same as C format strings.

So we need to re-write %llu into %lu I expect. We already do some
rewriting in log_stap.py but we obviously need a bit more.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


