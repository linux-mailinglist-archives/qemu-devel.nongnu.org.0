Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C36443268
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:12:34 +0100 (CET)
Received: from localhost ([::1]:40568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwOn-0001CK-Cp
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:12:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mhwH5-0006UR-Bb
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:04:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1mhwGu-00040e-Mp
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:04:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635869063;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yUiGphgsFeZyC3gSCAV3fAQX1CjKqdChCBFltGyj4as=;
 b=gStlj/xOmnZ/f2JcMwUZTCCSQOJQkNiFt7NkncoNihzTlk+QkIe8d+d/wB7GoIAvwz9s5V
 IpnDCNwdaT8mncx12naGQAHRl9ZdiFh7BR8TJ1BMoVZVtdSmeDHkgMF3oCbyPBMD2DHoye
 yuPr1y2Zltt4c2eNkwp4cR77nt2CEvM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-372-fTyQaAg7PXyNW4ToYqqQNQ-1; Tue, 02 Nov 2021 12:04:11 -0400
X-MC-Unique: fTyQaAg7PXyNW4ToYqqQNQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C61D31006AA5;
 Tue,  2 Nov 2021 16:04:09 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.194])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BEBEC101E592;
 Tue,  2 Nov 2021 16:03:00 +0000 (UTC)
Date: Tue, 2 Nov 2021 16:02:58 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v4 20/22] qapi: introduce x-query-irq QMP command
Message-ID: <YYFhMj1LqgsoIdkP@redhat.com>
References: <20211028155457.967291-1-berrange@redhat.com>
 <20211028155457.967291-21-berrange@redhat.com>
 <0a2e6289-ce3c-86b4-943f-c08366866911@redhat.com>
MIME-Version: 1.0
In-Reply-To: <0a2e6289-ce3c-86b4-943f-c08366866911@redhat.com>
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
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, Nov 02, 2021 at 03:57:08PM +0100, Philippe Mathieu-Daudé wrote:
> On 10/28/21 17:54, Daniel P. Berrangé wrote:
> > This is a counterpart to the HMP "info irq" command. It is being
> > added with an "x-" prefix because this QMP command is intended as an
> > adhoc debugging tool and will thus not be modelled in QAPI as fully
> > structured data, nor will it have long term guaranteed stability.
> > The existing HMP command is rewritten to call the QMP command.
> > 
> > This command is unable to use the pre-existing HumanReadableText,
> > because if 'common.json' is included into 'machine-target.json'
> > the static marshalling method for HumanReadableText will be reported
> > as unused by the compiler on all architectures except s390x.
> > 
> > Possible options were
> > 
> >  1 Support 'if' conditionals on 'include' statements in QAPI
> >  2 Add further commands to 'machine-target.json' that use
> >    HumanReadableText, such that it has at least one usage
> >    on all architecture targets.
> >  3 Duplicate HumanReadableText as TargetHumanReadableText
> >    adding conditions
> > 
> > This patch takes option (3) in the belief that we will eventually
> > get to a point where option (2) happens, and TargetHumanReadableText
> > can be removed again.
> 
> Outdated description from v2, otherwise:

Opps, this one should actually never have had this footnote,
as its command is in machine.json, not machine-target.json !

> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >  hmp-commands-info.hx |  2 +-
> >  monitor/hmp-cmds.c   | 38 --------------------------------------
> >  monitor/qmp-cmds.c   | 44 ++++++++++++++++++++++++++++++++++++++++++++
> >  qapi/machine.json    | 12 ++++++++++++
> >  4 files changed, 57 insertions(+), 39 deletions(-)
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


