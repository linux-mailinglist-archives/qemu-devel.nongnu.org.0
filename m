Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 57F20404834
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Sep 2021 12:04:56 +0200 (CEST)
Received: from localhost ([::1]:50800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mOGvO-0007pQ-Nl
	for lists+qemu-devel@lfdr.de; Thu, 09 Sep 2021 06:04:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOGs6-0005R0-HK
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 06:01:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mOGs3-0000I9-Mb
 for qemu-devel@nongnu.org; Thu, 09 Sep 2021 06:01:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631181685;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iqQgwrA4+MnsiOJj4pNGnWOsB6AOQAgHMsjJHYeI7Wo=;
 b=ij2yuBLLjeY9SclltekVnIkRkm0Rnx+dRrjTWvvLa46oeyFWEDcFLhFZNRW5UnCF5xNfYo
 2vmRPvDpSBxVr+POHcYPOJlmEadHX9ph5GG3pe5XD9hKFAAUQD4E5lQa/LZwZ57LSGrdGQ
 jpGoipyHy6MJmKKRsaj0hEjP/rK3Zcs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-UpXqj8iPP8SMYgBIKaUsJQ-1; Thu, 09 Sep 2021 06:01:24 -0400
X-MC-Unique: UpXqj8iPP8SMYgBIKaUsJQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 183575074D;
 Thu,  9 Sep 2021 10:01:23 +0000 (UTC)
Received: from redhat.com (unknown [10.39.195.19])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B17361000186;
 Thu,  9 Sep 2021 10:01:21 +0000 (UTC)
Date: Thu, 9 Sep 2021 11:01:19 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 4/5] qapi: introduce x-query-registers QMP command
Message-ID: <YTnbb1JSZiEZyHcd@redhat.com>
References: <20210908103711.683940-1-berrange@redhat.com>
 <20210908103711.683940-5-berrange@redhat.com>
 <87czpinmpb.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87czpinmpb.fsf@dusky.pond.sub.org>
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
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) DKIMWL_WL_HIGH=-0.393, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 09, 2021 at 11:05:20AM +0200, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > This is a counterpart to the HMP "info registers" command. It is being
> > added with an "x-" prefix because this QMP command is intended as an
> > adhoc debugging tool and will thus not be modelled in QAPI as fully
> > structured data, nor will it have long term guaranteed stability.
> >
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  hw/core/machine-qmp-cmds.c | 28 ++++++++++++++++++++++++++++
> >  qapi/machine.json          | 37 +++++++++++++++++++++++++++++++++++++
> >  2 files changed, 65 insertions(+)
> >
> > diff --git a/hw/core/machine-qmp-cmds.c b/hw/core/machine-qmp-cmds.c
> > index 216fdfaf3a..0d9943ff60 100644
> > --- a/hw/core/machine-qmp-cmds.c
> > +++ b/hw/core/machine-qmp-cmds.c
> > @@ -204,3 +204,31 @@ MemdevList *qmp_query_memdev(Error **errp)
> >      object_child_foreach(obj, query_memdev, &list);
> >      return list;
> >  }
> > +
> > +RegisterInfo *qmp_x_query_registers(bool has_cpu, int64_t cpu, Error **errp)
> > +{
> > +    RegisterInfo *info = g_new0(RegisterInfo, 1);
> > +    g_autoptr(GString) buf = g_string_new("");
> > +    CPUState *cs = NULL, *tmp;
> > +
> > +    if (has_cpu) {
> > +        CPU_FOREACH(tmp) {
> > +            if (cpu == tmp->cpu_index) {
> > +                cs = tmp;
> > +            }
> > +        }
> > +        if (!cs) {
> > +            error_setg(errp, "CPU %"PRId64" not available", cpu);
> > +            return NULL;
> > +        }
> > +        cpu_format_state(cs, buf, CPU_DUMP_FPU);
> > +    } else {
> > +        CPU_FOREACH(cs) {
> > +            g_string_append_printf(buf, "\nCPU#%d\n", cs->cpu_index);
> > +            cpu_format_state(cs, buf, CPU_DUMP_FPU);
> > +        }
> > +    }
> > +
> > +    info->state = g_steal_pointer(&buf->str);
> > +    return info;
> > +}
> > diff --git a/qapi/machine.json b/qapi/machine.json
> > index 157712f006..27b922f2ce 100644
> > --- a/qapi/machine.json
> > +++ b/qapi/machine.json
> > @@ -1312,3 +1312,40 @@
> >       '*cores': 'int',
> >       '*threads': 'int',
> >       '*maxcpus': 'int' } }
> > +
> > +##
> > +# @RegisterParams:
> > +#
> > +# Information about the CPU to query state of
> > +#
> > +# @cpu: the CPU number to query. If omitted, queries all CPUs
> > +#
> > +# Since: 6.2.0
> > +#
> > +##
> > +{ 'struct': 'RegisterParams', 'data': {'*cpu': 'int' } }
> > +
> > +##
> > +# @RegisterInfo:
> > +#
> > +# Information about the CPU state
> > +#
> > +# @state: the CPU state in an architecture specific format
> > +#
> > +# Since: 6.2.0
> > +#
> > +##
> > +{ 'struct': 'RegisterInfo', 'data': {'state': 'str' } }
> > +
> > +##
> > +# @x-query-registers:
> > +#
> > +# Return information on the CPU registers
> > +#
> > +# Returns: the CPU state
> > +#
> > +# Since: 6.2.0
> > +##
> > +{ 'command': 'x-query-registers',
> > +  'data': 'RegisterParams',
> 
> Unless you have further uses of RegisterParams in mind, use an implicit
> type:
> 
>      'data': { '*cpu': 'int' } }

No further usage, so will do this.

> 
> > +  'returns': 'RegisterInfo' }
> 
> I'd like us to adopt a convention for commands returning formatted text
> for human consumption.  Like so:
> 
>      'returns': 'HumanReadableText' }
> 
> with the obvious
> 
>    ##
>    # @HumanReadableText:
>    #
>    # @human-readable-text: Formatted output intended for humans.
>    #
>    # Since: 6.2.0
>    ##
>    { 'struct': 'HumanReadableText',
>      'data': { 'human-readable-text': 'str' } }

Ah yes that's a nice idea that will apply easily for many/most
of the "info xxxx" commands without current QMP equivs.

> When the output needs explaining, do that in the command's doc string.
> I figure
> 
>    ##
>    # @x-query-registers:
>    #
>    # Returns information about the CPU state
>    #
>    # Returns: CPU state in an architecture-specific format
>    #
>    # Since: 6.2.0
>    ##
> 
> would do in this case.

Yep.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


