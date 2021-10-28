Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B98DE43E53B
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 17:34:03 +0200 (CEST)
Received: from localhost ([::1]:51286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg7Pm-0000tT-Sa
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 11:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mg7OF-0007kJ-CD
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:32:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28324)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mg7OD-0002t7-LJ
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:32:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635435144;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=57LrMt9xK62X+TLYo56CEkc3biNj5LChvQMnItBX74s=;
 b=NXEjvHWhq1tbKXagpN2Jdxk1pnfN5krEWyDwqTnSl/p7xtRz2xhuO0tXp64w6gLwqMwayZ
 e/qnOc2hmMMLgRzHuTkkgpmw2SeYS+qBmkp0FteLthLpafHNHT76gYNHDMM4CO71EMhsUx
 XcyU90oPQAwIt271HDXAH11AcL4uTuE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-296-G73z6KG-M6GboaKqyfvPvg-1; Thu, 28 Oct 2021 11:32:21 -0400
X-MC-Unique: G73z6KG-M6GboaKqyfvPvg-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D98FF802B4F;
 Thu, 28 Oct 2021 15:32:19 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.37])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 276791017E37;
 Thu, 28 Oct 2021 15:31:59 +0000 (UTC)
Date: Thu, 28 Oct 2021 16:31:56 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 04/19] docs/devel: add example of command returning
 unstructured text
Message-ID: <YXrCbIP2d19ofgL0@redhat.com>
References: <20210930132349.3601823-1-berrange@redhat.com>
 <20210930132349.3601823-5-berrange@redhat.com>
 <87r1c5nr4d.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87r1c5nr4d.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 28, 2021 at 04:47:14PM +0200, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > This illustrates how to add a QMP command returning unstructured text,
> > following the guidelines added in the previous patch. The example uses
> > a simplified version of 'info roms'.
> >
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  docs/devel/writing-monitor-commands.rst | 87 ++++++++++++++++++++++++-
> >  1 file changed, 86 insertions(+), 1 deletion(-)

> > +Implementing the HMP command
> > +~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +Now that the QMP command is in place, we can also make it available in
> > +the human monitor (HMP) as shown in previous examples. The HMP
> > +implementations will all look fairly similar, as all they need do is
> > +invoke the QMP command and then print the resulting text or error
> > +message. Here's the implementation of the "info roms" HMP command::
> > +
> > + void hmp_info_roms(Monitor *mon, const QDict *qdict)
> > + {
> > +     Error err = NULL;
> > +     g_autoptr(HumanReadableText) info = qmp_x_query_roms(&err);
> > +
> > +     if (err) {
> > +         error_report_err(err);
> > +         return;
> > +     }
> 
> There's hmp_handle_error().
> 
> If it returned whether there's an error, we could write
> 
>         if (hmp_handle_error(err)) {
>             return;
>         }

I'll add a return value to hmp_handle_error and update existing
callers where appropriate

> 
> Of course, qmp_x_query_roms() can't fail, so we could just as well do
> 
>         g_autoptr(HumanReadableText) info = qmp_x_query_roms(&error_abort);
> 
> Okay as long as we show how to report errors in HMP commands
> *somewhere*, but the use of &error_abort needs explaining.  Not sure
> that's an improvement here.

For the sake of illustration I think I'll stick with hmp_handle_error
and not &error_abort.  In fact following Dave's feedback, I've added
a helper to provide the HMP implementation with no code required in
the no-arg case.

> Aside: the existing examples show questionable error handling.  The
> first one uses error_get_pretty() instead of hmp_handle_error().  The
> other two throw away the error they get from the QMP command, and report
> "Could not query ..." instead, which is a bit of an anti-pattern.

I'll fix those examples

> 
> > +     monitor_printf(mon, "%s\n", info->human_readable_text);
> 
> Sure you want to print an extra newline?

Opps, mistake.

> If not, then consider
> 
>         monitor_puts(mon, info->human_readable_text);

I'd prefer "%s", since it avoids danger of the human readable
text possibly containing a '%' sign that trips up printf.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


