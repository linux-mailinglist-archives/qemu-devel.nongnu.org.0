Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 23642310C71
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 15:05:01 +0100 (CET)
Received: from localhost ([::1]:37706 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l81jI-00062A-24
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 09:05:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l81hW-0004XF-DR
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 09:03:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41267)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1l81hU-0000vt-Kz
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 09:03:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612533787;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9gBmu76JpMnz87az7vDT9d7n1qZVxVk09DGLxhrK6L4=;
 b=aKxWjrO0g0r68d4Kt5qDeauW0APxpddJv7esIVa6F1z38k7mU/7yhwRRBejkPSvY2yiAAg
 BNTM83Eja15VpMcky1CVU+PcUMtl7/EBLBxiEUY5Cj+fJZtMbNyzAQiDRe57QKFyZkI8eL
 1Iv8A8XzgFundS+mSamSiXCo0B7jcMA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-487-vg2tupm6MFeqNMzEP9-MuQ-1; Fri, 05 Feb 2021 09:03:01 -0500
X-MC-Unique: vg2tupm6MFeqNMzEP9-MuQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A6EBE814303;
 Fri,  5 Feb 2021 14:03:00 +0000 (UTC)
Received: from redhat.com (ovpn-114-212.ams2.redhat.com [10.36.114.212])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id AD84A5D9CC;
 Fri,  5 Feb 2021 14:02:58 +0000 (UTC)
Date: Fri, 5 Feb 2021 14:02:55 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Eric Blake <eblake@redhat.com>
Subject: Re: [PATCH 2/3] utils: Deprecate hex-with-suffix sizes
Message-ID: <20210205140255.GN908621@redhat.com>
References: <20210204190708.1306296-1-eblake@redhat.com>
 <20210204190708.1306296-3-eblake@redhat.com>
 <20210205111302.GF908621@redhat.com>
 <f08f11a9-f76c-4473-a770-9939f28c7373@redhat.com>
MIME-Version: 1.0
In-Reply-To: <f08f11a9-f76c-4473-a770-9939f28c7373@redhat.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.352,
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
Cc: vsementsov@virtuozzo.com, qemu-block@nongnu.org, rjones@redhat.com,
 "reviewer:Incompatible changes" <libvir-list@redhat.com>, tao3.xu@intel.com,
 armbru@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Feb 05, 2021 at 07:40:36AM -0600, Eric Blake wrote:
> On 2/5/21 5:13 AM, Daniel P. Berrangé wrote:
> > On Thu, Feb 04, 2021 at 01:07:07PM -0600, Eric Blake wrote:
> >> Supporting '0x20M' looks odd, particularly since we have an 'E' suffix
> >> that is ambiguous between a hex digit and the extremely large exibyte
> >> suffix, as well as a 'B' suffix for bytes.  In practice, people using
> >> hex inputs are specifying values in bytes (and would have written
> >> 0x2000000, or possibly relied on default_suffix in the case of
> >> qemu_strtosz_MiB), and the use of scaling suffixes makes the most
> >> sense for inputs in decimal (where the user would write 32M).  But
> >> rather than outright dropping support for hex-with-suffix, let's
> >> follow our deprecation policy.  Sadly, since qemu_strtosz() does not
> >> have an Err** parameter, we pollute to stderr.
> > 
> > Err** is only appropriate for errors, not warnings, so this statement
> > can be removed.
> 
> The point of the comment was that we have no other mechanism for
> reporting the deprecation other than polluting to stderr.  And if we
> ever remove the support, we'll either have to silently reject input that
> we used to accept, or plumb through Err** handling to allow better
> reporting of WHY we are rejecting input.  But I didn't feel like adding
> Err** support now.

Yeah, I guess what I meant was that warning on stderr is the expected
standard practice for deprecations. We only need to worry about other
thing once the deprecation turns into a hard error later.

> 
> >> @@ -309,6 +309,10 @@ static int do_strtosz(const char *nptr, const char **end,
> >>      c = *endptr;
> >>      mul = suffix_mul(c, unit);
> >>      if (mul > 0) {
> >> +        if (hex) {
> >> +            fprintf(stderr, "Using a multiplier suffix on hex numbers "
> >> +                    "is deprecated: %s\n", nptr);
> > 
> > warn_report(), since IIUC, that'll get into HMP response correctly.
> 
> Yes, that sounds better.  I'll use that in v2, as well as tweaking the
> commit message.
> 
> > 
> >> +        }
> >>          endptr++;
> >>      } else {
> >>          mul = suffix_mul(default_suffix, unit);
> > 
> > Regards,
> > Daniel
> > 
> 
> -- 
> Eric Blake, Principal Software Engineer
> Red Hat, Inc.           +1-919-301-3226
> Virtualization:  qemu.org | libvirt.org

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


