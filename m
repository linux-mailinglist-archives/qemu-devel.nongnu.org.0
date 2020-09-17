Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FEB726D154
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 04:48:08 +0200 (CEST)
Received: from localhost ([::1]:53794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIjxu-0003N6-Ol
	for lists+qemu-devel@lfdr.de; Wed, 16 Sep 2020 22:48:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kIjx7-0002iM-KN
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 22:47:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kIjx4-0006dO-N4
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 22:47:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600310832;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=78zHJiEeULje0l5YBCQ95qjmLDHg4lx0S+twWKM3bSM=;
 b=S8lHVisA0b5Rv9LGdWnpoy3whbDd3lvBVuiMsjFZYF67drIAOrju9LB0xz7dqCxyKLGvpk
 CQvSHSYNRbC0Wb0kv5YXREzXaf1RzXwetHM7aEZTp2iUz3bRmZUFVW87vZq4zrUVNL+0gQ
 l4UqP6VlCRI7plqID+0AzHMVCwFW/XE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-383-WOoE--kqMza4_O5moOhj8A-1; Wed, 16 Sep 2020 22:47:10 -0400
X-MC-Unique: WOoE--kqMza4_O5moOhj8A-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 28FBC1074640;
 Thu, 17 Sep 2020 02:47:08 +0000 (UTC)
Received: from localhost (ovpn-119-217.rdu2.redhat.com [10.10.119.217])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7ED3610021AA;
 Thu, 17 Sep 2020 02:47:03 +0000 (UTC)
Date: Wed, 16 Sep 2020 22:47:02 -0400
From: Eduardo Habkost <ehabkost@redhat.com>
To: David Gibson <david@gibson.dropbear.id.au>
Subject: Re: [PATCH 2/2] qom: Use DECLARE_INTERFACE_CHECKER macro
Message-ID: <20200917024702.GM7594@habkost.net>
References: <20200916223258.599367-1-ehabkost@redhat.com>
 <20200916223258.599367-3-ehabkost@redhat.com>
 <20200917004434.GF5258@yekko.fritz.box>
MIME-Version: 1.0
In-Reply-To: <20200917004434.GF5258@yekko.fritz.box>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0.002
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Received-SPF: pass client-ip=216.205.24.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/16 22:47:12
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.999,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P. Berrange" <berrange@redhat.com>, Corey Minyard <minyard@acm.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-ppc@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-arm@nongnu.org,
 =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
 =?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Berger <stefanb@linux.ibm.com>,
 =?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Sep 17, 2020 at 10:44:34AM +1000, David Gibson wrote:
[...]
> > diff --git a/include/hw/acpi/acpi_dev_interface.h b/include/hw/acpi/acpi_dev_interface.h
> > index 9adf1e4706..96aa63919a 100644
> > --- a/include/hw/acpi/acpi_dev_interface.h
> > +++ b/include/hw/acpi/acpi_dev_interface.h
> > @@ -21,9 +21,8 @@ typedef enum {
> >  typedef struct AcpiDeviceIfClass AcpiDeviceIfClass;
> >  DECLARE_CLASS_CHECKERS(AcpiDeviceIfClass, ACPI_DEVICE_IF,
> >                         TYPE_ACPI_DEVICE_IF)
> > -#define ACPI_DEVICE_IF(obj) \
> > -     INTERFACE_CHECK(AcpiDeviceIf, (obj), \
> > -                     TYPE_ACPI_DEVICE_IF)
> > +DECLARE_INTERFACE_CHECKER(AcpiDeviceIf, ACPI_DEVICE_IF,
> > +                          TYPE_ACPI_DEVICE_IF)
> >  
> >  typedef struct AcpiDeviceIf AcpiDeviceIf;

This is broken because the typedef needs to be before
DECLARE_INTERFACE_CHECKER.  I will send v2.

-- 
Eduardo


