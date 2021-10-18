Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A617D4313DB
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 11:54:58 +0200 (CEST)
Received: from localhost ([::1]:36128 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcPM9-0004tj-Pv
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 05:54:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mcPIg-0000Xx-1N
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:51:22 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mcPIc-0001gF-0v
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:51:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634550677;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8g6bJg9dj5ESpYcN6Nq2QJohi/IHfb86A5jjBAb/Jp4=;
 b=itQcvk+dHTVDDHEfHkU2vuuQbXEABwHFM09q++tNad652m8dMRBQy/yS96us7EhLWdnrid
 yLuWCbeCPMWHv1qunT9aaF+kqNXwvuOgz+gH+R3FH0vqjEZ9UfqdGAkXTrHuT+BG06pRni
 p3u0SbcSb7STUwjVtvd+v0w3Qw0Ei1w=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-292-GcciU_xXMzup_R0BdrqCHQ-1; Mon, 18 Oct 2021 05:51:02 -0400
X-MC-Unique: GcciU_xXMzup_R0BdrqCHQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8F12C879500;
 Mon, 18 Oct 2021 09:51:01 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A6C360C4A;
 Mon, 18 Oct 2021 09:50:14 +0000 (UTC)
Date: Mon, 18 Oct 2021 10:50:11 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v3 13/19] qapi: introduce x-query-skeys QMP command
Message-ID: <YW1DU3ME7f6gq4OU@redhat.com>
References: <20210930132349.3601823-1-berrange@redhat.com>
 <20210930132349.3601823-14-berrange@redhat.com>
 <e09570bc-cbf6-2f60-481a-94c1ca71c2eb@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e09570bc-cbf6-2f60-481a-94c1ca71c2eb@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 David Hildenbrand <david@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Cornelia Huck <cohuck@redhat.com>, Yuval Shaia <yuval.shaia.ml@gmail.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Oct 12, 2021 at 09:12:23AM +0200, Thomas Huth wrote:
> On 30/09/2021 15.23, Daniel P. Berrangé wrote:
> > This is a counterpart to the HMP "info skeys" command. It is being
> > added with an "x-" prefix because this QMP command is intended as an
> > adhoc debugging tool and will thus not be modelled in QAPI as fully
> > structured data, nor will it have long term guaranteed stability.
> > The existing HMP command is rewritten to call the QMP command.
> > 
> > Including 'common.json' into 'machine-target.json' created a little
> > problem because the static marshalling method for HumanReadableText
> > is generated unconditionally. It is only used, however, conditionally
> > on certain target architectures.
> > 
> > To deal with this we change the QAPI code generator to simply mark
> > all static marshalling functions with G_GNUC_UNSED to hide the
> > compiler warning.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> ...
> > +void hmp_info_skeys(Monitor *mon, const QDict *qdict)
> > +{
> > +    Error *err = NULL;
> > +    g_autoptr(HumanReadableText) info = NULL;
> > +    uint64_t addr = qdict_get_int(qdict, "addr");
> > +
> > +    info = qmp_x_query_skeys(addr, &err);
> > +    if (err) {
> > +        error_report_err(err);
> 
> Shouldn't that rather be:
> 
>            monitor_printf(mon, "%s\n", error_get_pretty(err));
> 
> or something similar?

error_report_err gets (eventually) hooked into monitor_printf() if
current monitor in the thread is non-NULL

> 
> >           return;
> >       }
> > -    monitor_printf(mon, "  key: 0x%X\n", key);
> > +    monitor_printf(mon, "%s", info->human_readable_text);
> >   }
> 
> Apart the question above, patch looks fine to me.
> 
>  Thomas
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


