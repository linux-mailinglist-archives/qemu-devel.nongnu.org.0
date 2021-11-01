Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E95D0441DA0
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 16:59:46 +0100 (CET)
Received: from localhost ([::1]:54720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhZis-0006VJ-27
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 11:59:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mhZi4-0005p7-8L
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 11:58:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39380)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mhZi0-0000QV-Sl
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 11:58:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635782332;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ypYwbyToF9bsJJI0FbQ9meqgUXQyO2CrBolqt8VEG9M=;
 b=RBi7As7iUUolQ4MjgRma3xFlBmze9CnFAGaxyQt7L5Dt/G5IWKje7qrqLzn2HQz1TobjGg
 O1ZYMOQL/88zOhoeg3kHIWyxfgAkjLOk+nIc830m2jf5lnaU7kmjlQWKzgsW77ei9AYMQ2
 q/K1G7ExjNxNrVd8PMjyT2dn8TBxT1Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-271-7mZtnrcMPcO7MQK2bG8mPw-1; Mon, 01 Nov 2021 11:58:47 -0400
X-MC-Unique: 7mZtnrcMPcO7MQK2bG8mPw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7B0E4802682;
 Mon,  1 Nov 2021 15:58:45 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.164])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2C28A100EB3D;
 Mon,  1 Nov 2021 15:58:41 +0000 (UTC)
Date: Mon, 1 Nov 2021 15:58:38 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 22/22] qapi: introduce x-query-opcount QMP command
Message-ID: <YYAOrh2b7kdCFMUz@redhat.com>
References: <20211028155457.967291-1-berrange@redhat.com>
 <20211028155457.967291-23-berrange@redhat.com>
 <b67dc308-acb3-c88d-b3d3-3ce612b27137@redhat.com>
MIME-Version: 1.0
In-Reply-To: <b67dc308-acb3-c88d-b3d3-3ce612b27137@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
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
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, David Hildenbrand <david@redhat.com>,
 Michael Roth <michael.roth@amd.com>, Cornelia Huck <cohuck@redhat.com>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Oct 28, 2021 at 07:08:13PM +0200, Philippe Mathieu-Daudé wrote:
> On 10/28/21 17:54, Daniel P. Berrangé wrote:
> > This is a counterpart to the HMP "info opcount" command. It is being
> > added with an "x-" prefix because this QMP command is intended as an
> > ad hoc debugging tool and will thus not be modelled in QAPI as fully
> > structured data, nor will it have long term guaranteed stability.
> > The existing HMP command is rewritten to call the QMP command.
> > 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  accel/tcg/cpu-exec.c       | 14 ++++++++++++++
> >  accel/tcg/hmp.c            |  7 +------
> >  accel/tcg/translate-all.c  |  4 ++--
> >  include/exec/cpu-all.h     |  2 +-
> >  include/tcg/tcg.h          |  2 +-
> >  qapi/machine.json          | 13 +++++++++++++
> >  tcg/tcg.c                  | 10 +++++-----
> >  tests/qtest/qmp-cmd-test.c |  1 +
> >  8 files changed, 38 insertions(+), 15 deletions(-)
> > 
> > diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> > index 4212645cb6..7a7e813207 100644
> > --- a/accel/tcg/cpu-exec.c
> > +++ b/accel/tcg/cpu-exec.c
> > @@ -1066,4 +1066,18 @@ HumanReadableText *qmp_x_query_jit(Error **errp)
> >      return human_readable_text_from_str(buf);
> >  }
> >  
> > +HumanReadableText *qmp_x_query_opcount(Error **errp)
> > +{
> > +    g_autoptr(GString) buf = g_string_new("");
> > +
> > +    if (!tcg_enabled()) {
> > +        error_setg(errp, "JIT information is only available with accel=tcg");
> 
> s/JIT/Opcode count/ ? Otherwise,

Opps, yes.

> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


