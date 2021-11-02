Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71C63443294
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:18:35 +0100 (CET)
Received: from localhost ([::1]:57798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwUc-0004Ng-IC
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:18:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mhwIN-0007DG-Kl
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:05:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:33283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mhwIK-0004Fh-7s
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:05:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635869151;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rgGV0+SB1PzYuLFuBXRuQVmOAYXnxUZv3aqNMZHADDE=;
 b=b8hNsf6qWJNgweAjy1Keo87lKfET53ueNYQf6xDRJPFIuufWwuS3btM7rUSgKlP3rb7rI+
 9M4M+7ni48Bjx+N3VkowPVFk+adgwrLha7QVXWI9KZwqYwXzWgRmc9HIxK21nwnCQQqCVq
 lUH5cZPlsprTYGPt36qzemim74X9upE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-HE6VMtrKPfmQjj99jruNXQ-1; Tue, 02 Nov 2021 12:05:50 -0400
X-MC-Unique: HE6VMtrKPfmQjj99jruNXQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 81E488066F5;
 Tue,  2 Nov 2021 16:05:48 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 442DCADCD;
 Tue,  2 Nov 2021 16:05:07 +0000 (UTC)
Date: Tue, 2 Nov 2021 16:05:05 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 16/22] qapi: introduce x-query-skeys QMP command
Message-ID: <YYFhsQWGe6q9HP0v@redhat.com>
References: <20211028155457.967291-1-berrange@redhat.com>
 <20211028155457.967291-17-berrange@redhat.com>
 <6dfe8af9-0b26-6057-9b67-ee7c05e4dfdf@redhat.com>
MIME-Version: 1.0
In-Reply-To: <6dfe8af9-0b26-6057-9b67-ee7c05e4dfdf@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Yuval Shaia <yuval.shaia.ml@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Peter Xu <peterx@redhat.com>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Nov 02, 2021 at 04:02:42PM +0100, Philippe Mathieu-Daudé wrote:
> On 10/28/21 17:54, Daniel P. Berrangé wrote:
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
> >  hw/s390x/s390-skeys.c    | 35 +++++++++++++++++++++++++++--------
> >  qapi/machine-target.json | 17 +++++++++++++++++
> >  scripts/qapi/commands.py |  1 +
> >  3 files changed, 45 insertions(+), 8 deletions(-)
> 
> > diff --git a/scripts/qapi/commands.py b/scripts/qapi/commands.py
> > index 3654825968..01d8d1ea2c 100644
> > --- a/scripts/qapi/commands.py
> > +++ b/scripts/qapi/commands.py
> > @@ -91,6 +91,7 @@ def gen_call(name: str,
> >  def gen_marshal_output(ret_type: QAPISchemaType) -> str:
> >      return mcgen('''
> >  
> > +G_GNUC_UNUSED
> >  static void qmp_marshal_output_%(c_name)s(%(c_type)s ret_in,
> >                                  QObject **ret_out, Error **errp)
> >  {
> > 
> 
> I think 1/ this change should be in a separate patch,
> but 2/ Markus is not going to accept it:
> https://lore.kernel.org/qemu-devel/87r1haasht.fsf@dusky.pond.sub.org/
> 
> I'll see if we can get ride of it with Kconfig rules.
> 
> Meanwhile, could we get the series merged without it?

Yeah, since soft freeze is today I'm going to drop the 3 patches that
touch machine-target.json, so we can debate this later.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


