Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC81C341B8E
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 12:34:10 +0100 (CET)
Received: from localhost ([::1]:53092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNDOL-0006iX-Uw
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 07:34:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lNDIE-0008WB-93
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:27:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35201)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cohuck@redhat.com>) id 1lNDIC-0002jw-TQ
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:27:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616153268;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jV2xc3Lc9UArKSKS2jjyvT+LiErGFfpdiP7/LfaJvEI=;
 b=TFsIjP0gjThKxCAZaTbP7z0qyyfDsQx8n2Z2RLF/Imi8sCBIhhK+yjUIdImrHRWUEFl6Yv
 23gfRcpAi9AtG54JB2JgsTNJDgn5Cm0g+T8Y8KGdTc9ooGKAEFYSQw4o+SKuV1R86NNowp
 r4lp6BIaZxGeP3PWoezlSWDMfU9Uy1o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-168-FTpKBhBeOHGLLpOtR50xCQ-1; Fri, 19 Mar 2021 07:27:44 -0400
X-MC-Unique: FTpKBhBeOHGLLpOtR50xCQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FD808189CA;
 Fri, 19 Mar 2021 11:27:43 +0000 (UTC)
Received: from gondolin (ovpn-112-229.ams2.redhat.com [10.36.112.229])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EC71560CD7;
 Fri, 19 Mar 2021 11:27:37 +0000 (UTC)
Date: Fri, 19 Mar 2021 12:27:35 +0100
From: Cornelia Huck <cohuck@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 4/4] iotests: iothreads need ioeventfd
Message-ID: <20210319122735.0daed44b.cohuck@redhat.com>
In-Reply-To: <4c03ef1c-d39f-dd53-c13a-7620b7899e35@redhat.com>
References: <20210318223907.1344870-1-laurent@vivier.eu>
 <20210318223907.1344870-5-laurent@vivier.eu>
 <4c03ef1c-d39f-dd53-c13a-7620b7899e35@redhat.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=cohuck@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=cohuck@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Philippe =?UTF-8?B?TWF0aGll?= =?UTF-8?B?dS1EYXVkw6k=?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 19 Mar 2021 12:06:43 +0100
Paolo Bonzini <pbonzini@redhat.com> wrote:

> On 18/03/21 23:39, Laurent Vivier wrote:
> > And ioeventfd are only available with virtio-scsi-pci, so don't use the alias
> > and add a rule to require virtio-scsi-pci for the tests that use iothreads.
> > 
> > Signed-off-by: Laurent Vivier <laurent@vivier.eu>
> > ---
> >   tests/qemu-iotests/127        | 4 ++--
> >   tests/qemu-iotests/256        | 2 ++
> >   tests/qemu-iotests/iotests.py | 5 +++++
> >   3 files changed, 9 insertions(+), 2 deletions(-)
> > 
> > diff --git a/tests/qemu-iotests/127 b/tests/qemu-iotests/127
> > index 98e8e82a8210..a3693533685a 100755
> > --- a/tests/qemu-iotests/127
> > +++ b/tests/qemu-iotests/127
> > @@ -44,7 +44,7 @@ trap "_cleanup; exit \$status" 0 1 2 3 15
> >   _supported_fmt qcow2
> >   _supported_proto file fuse
> >   
> > -_require_devices virtio-scsi scsi-hd
> > +_require_devices virtio-scsi-pci scsi-hd  
> 
> Maybe
> 
> _require_devices scsi-hd
> _require_devices virtio-scsi-pci || _require_devices virtio-scsi ccw
> 
> ?
> 
> Paolo
> 

Yes, ioeventfds are also available for ccw; I'd expect only mmio to be
the problem here.


