Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1407524E25E
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Aug 2020 23:03:19 +0200 (CEST)
Received: from localhost ([::1]:46808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k9EBx-0007mT-M7
	for lists+qemu-devel@lfdr.de; Fri, 21 Aug 2020 17:03:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51064)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k9EAq-0006zB-Qq
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 17:02:08 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:26678
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1k9EAn-0002iW-FF
 for qemu-devel@nongnu.org; Fri, 21 Aug 2020 17:02:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1598043723;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=yNmzfv+4UyB84wVM5gjFI//fDsw9DEZmIhAPE5UYKV8=;
 b=borR4o7QANxHiU0+S6OSLZUE+qzo7sfNUASNotFDDVTIupLFWPwJhwDlkBneHp8BAp06TJ
 EDE4wj3xHuCQ4fFB0wltmaS31xmVO6SHloEAY9teBaz8GOAtJu8xCcG+/GHJxfUzIO6UC8
 AqnzX2uplcu27sK3cTg7tUej3aLTbJw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-103-4-m3lWeROvujlpYIE9fhog-1; Fri, 21 Aug 2020 17:02:01 -0400
X-MC-Unique: 4-m3lWeROvujlpYIE9fhog-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3EC681CAFB;
 Fri, 21 Aug 2020 21:01:58 +0000 (UTC)
Received: from localhost (unknown [10.10.67.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A8B5F7AED1;
 Fri, 21 Aug 2020 21:01:49 +0000 (UTC)
Date: Fri, 21 Aug 2020 17:01:49 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: Suspicious QOM types without instance/class size
Message-ID: <20200821210149.GN642093@habkost.net>
References: <20200820215529.GH642093@habkost.net>
 <20200821114335.2b100333.cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200821114335.2b100333.cohuck@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/21 05:15:56
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-block@nongnu.org,
 David Hildenbrand <david@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 =?iso-8859-1?Q?Herv=E9?= Poussineau <hpoussin@reactos.org>,
 David Gibson <david@gibson.dropbear.id.au>, Thomas Huth <thuth@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Cameron Esfahani <dirty@apple.com>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org,
 =?iso-8859-1?Q?C=E9dric?= Le Goater <clg@kaod.org>,
 Richard Henderson <rth@twiddle.net>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, Aug 21, 2020 at 11:43:35AM +0200, Cornelia Huck wrote:
> On Thu, 20 Aug 2020 17:55:29 -0400
> Eduardo Habkost <ehabkost@redhat.com> wrote:
> 
> > While trying to convert TypeInfo declarations to the new
> > OBJECT_DECLARE* macros, I've stumbled on a few suspicious cases
> > where instance_size or class_size is not set, despite having type
> > checker macros that use a specific type.
> > 
> > The ones with "WARNING" are abstract types (maybe not serious if
> > subclasses set the appropriate sizes).  The ones with "ERROR"
> > don't seem to be abstract types.
> > 
> > ERROR: hw/s390x/virtio-ccw.c:1237:1: class_size should be set to sizeof(VirtioCcwBusClass)?
> > ERROR: hw/virtio/virtio-pci.c:2101:1: class_size should be set to sizeof(VirtioPCIBusClass)?
> 
> VirtioCcwBusClass and VirtioPCIBusClass are both simple typedefs of
> VirtioBusClass (it's likely that I copied the ccw definition from the
> pci one). virtio-mmio instead uses VirtioBusClass directly in its
> checker macros.
> 
> I don't see a real reason for the typedefs, maybe ccw and pci should
> use the mmio approach as well?

I think it's OK to keep the typedefs if the code is consistent
(i.e. we set instance_size and class_size just in case the
typedefs are replaced by a real struct one day).

I'm not sure about the TYPE_VIRTIO_MMIO_BUS approach.  If the
code just needs VirtioBusState or VirtioBusClass pointers, it can
already use the VIRTIO_BUS* macros.

The OBJECT_DECLARE_TYPE macro Daniel sent expects each QOM type
to have a separate struct being defined, which isn't true in many
cases.  I'm considering removing the "typedef struct Foo Foo"
lines from OBJECT_DECLARE_TYPE(), to make initial conversion
easier.

-- 
Eduardo


