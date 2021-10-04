Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8632421368
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Oct 2021 18:02:07 +0200 (CEST)
Received: from localhost ([::1]:45794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXQPm-0007WM-Az
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 12:02:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mXQM4-00054s-SF
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 11:58:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47114)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mXQM1-0004ko-Ue
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 11:58:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633363092;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B9p4NCNaYqsxQ/SaXVXA6eWAHXEB9TPH6j1GKwPeayY=;
 b=Rolw6BlFVMJeXN/q8OVieHwvim8U/k+3g7RPuLSrfHVdrXVuLYOMGRzQqUTn5PzI7EbPe9
 CLSIy9CAS+/IFSxCjZq+4oC3U4xeSnnCsRmEQXI+f/RbplTQp+tw/1HVy6I08s3DTd5SD7
 wPCm7vkaRUKiNBF2NWqxcyhfKWZUPOI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-1-rrflzrC1PIeFtH2RVEfokA-1; Mon, 04 Oct 2021 11:57:54 -0400
X-MC-Unique: rrflzrC1PIeFtH2RVEfokA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5FC8A1015DA0;
 Mon,  4 Oct 2021 15:57:53 +0000 (UTC)
Received: from redhat.com (unknown [10.39.192.197])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CDE2660BF4;
 Mon,  4 Oct 2021 15:57:49 +0000 (UTC)
Date: Mon, 4 Oct 2021 16:57:47 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v3 07/19] qapi: introduce x-query-roms QMP command
Message-ID: <YVske1SPAu0UTpLY@redhat.com>
References: <20210930132349.3601823-1-berrange@redhat.com>
 <20210930132349.3601823-8-berrange@redhat.com>
 <YVr0TufQdOS59bta@work-vm>
MIME-Version: 1.0
In-Reply-To: <YVr0TufQdOS59bta@work-vm>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.066,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon, Oct 04, 2021 at 01:32:14PM +0100, Dr. David Alan Gilbert wrote:
> * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > This is a counterpart to the HMP "info roms" command. It is being
> > added with an "x-" prefix because this QMP command is intended as an
> > adhoc debugging tool and will thus not be modelled in QAPI as fully
> > structured data, nor will it have long term guaranteed stability.
> > The existing HMP command is rewritten to call the QMP command.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  hw/core/loader.c            | 53 +++++++++++++++++++++++++------------
> >  hw/core/machine-qmp-cmds.c  |  1 +
> >  include/qapi/type-helpers.h | 14 ++++++++++
> >  qapi/common.json            | 11 ++++++++
> >  qapi/machine.json           | 12 +++++++++
> >  qapi/meson.build            |  3 +++
> >  qapi/qapi-type-helpers.c    | 23 ++++++++++++++++
> >  7 files changed, 100 insertions(+), 17 deletions(-)
> >  create mode 100644 include/qapi/type-helpers.h
> >  create mode 100644 qapi/qapi-type-helpers.c
> > 
> > diff --git a/hw/core/loader.c b/hw/core/loader.c
> > index c623318b73..5ebdca3087 100644
> > --- a/hw/core/loader.c
> > +++ b/hw/core/loader.c
> > @@ -46,6 +46,8 @@
> >  #include "qemu-common.h"
> >  #include "qemu/datadir.h"
> >  #include "qapi/error.h"
> > +#include "qapi/qapi-commands-machine.h"
> > +#include "qapi/type-helpers.h"
> >  #include "trace.h"
> >  #include "hw/hw.h"
> >  #include "disas/disas.h"
> > @@ -1472,32 +1474,49 @@ void *rom_ptr_for_as(AddressSpace *as, hwaddr addr, size_t size)
> >      return cbdata.rom;
> >  }
> >  
> > -void hmp_info_roms(Monitor *mon, const QDict *qdict)
> > +HumanReadableText *qmp_x_query_roms(Error **errp)
> >  {
> >      Rom *rom;
> > +    g_autoptr(GString) buf = g_string_new("");
> >  
> >      QTAILQ_FOREACH(rom, &roms, next) {
> >          if (rom->mr) {
> > -            monitor_printf(mon, "%s"
> > -                           " size=0x%06zx name=\"%s\"\n",
> > -                           memory_region_name(rom->mr),
> > -                           rom->romsize,
> > -                           rom->name);
> > +            g_string_append_printf(buf, "%s"
> > +                                   " size=0x%06zx name=\"%s\"\n",
> > +                                   memory_region_name(rom->mr),
> > +                                   rom->romsize,
> > +                                   rom->name);
> >          } else if (!rom->fw_file) {
> > -            monitor_printf(mon, "addr=" TARGET_FMT_plx
> > -                           " size=0x%06zx mem=%s name=\"%s\"\n",
> > -                           rom->addr, rom->romsize,
> > -                           rom->isrom ? "rom" : "ram",
> > -                           rom->name);
> > +            g_string_append_printf(buf, "addr=" TARGET_FMT_plx
> > +                                   " size=0x%06zx mem=%s name=\"%s\"\n",
> > +                                   rom->addr, rom->romsize,
> > +                                   rom->isrom ? "rom" : "ram",
> > +                                   rom->name);
> >          } else {
> > -            monitor_printf(mon, "fw=%s/%s"
> > -                           " size=0x%06zx name=\"%s\"\n",
> > -                           rom->fw_dir,
> > -                           rom->fw_file,
> > -                           rom->romsize,
> > -                           rom->name);
> > +            g_string_append_printf(buf, "fw=%s/%s"
> > +                                   " size=0x%06zx name=\"%s\"\n",
> > +                                   rom->fw_dir,
> > +                                   rom->fw_file,
> > +                                   rom->romsize,
> > +                                   rom->name);
> >          }
> >      }
> > +
> > +    return human_readable_text_from_str(buf);
> > +}
> > +
> > +
> > +void hmp_info_roms(Monitor *mon, const QDict *qdict)
> > +{
> > +    Error *err = NULL;
> > +    g_autoptr(HumanReadableText) info = qmp_x_query_roms(&err);
> > +
> > +    if (err) {
> > +        error_report_err(err);
> > +        return;
> > +    }
> > +
> > +    monitor_printf(mon, "%s", info->human_readable_text);
> 
> This is getting copied in each one of these; it looks like you need
> either:
>   a) A helper function like:
>        void hmp_info_from_qmp(Monitor *mon, HumanReadableText *(void)func) 
>        {
>            ...
>        }
> 
>   b) Or teach the hmp parser to do the calls?


This pattern is repeated in many, but not all, or the handlers in
this series, because I started with the easy cases of no-arg 'info'
commands. There's a few exceptions such as commands which drive off
the currently selected CPU state.  I'm not convince it is worth
adding specials to the hmp parser, since it will only be used for
a subset of the commands lng term. A helper function though could
do the job, since I've already introduced a helper for the QMP
side converting GString to HumanReadableText


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


