Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [IPv6:2001:470:142::17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C94F1C8D53
	for <lists+qemu-devel@lfdr.de>; Thu,  7 May 2020 16:03:54 +0200 (CEST)
Received: from localhost ([::1]:50144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jWh7x-0006KU-MO
	for lists+qemu-devel@lfdr.de; Thu, 07 May 2020 10:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jWh21-0001NX-SA
 for qemu-devel@nongnu.org; Thu, 07 May 2020 09:57:45 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:27070
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1jWh20-0002gL-K7
 for qemu-devel@nongnu.org; Thu, 07 May 2020 09:57:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1588859863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9xwVYFOzz4pINA3HPcdPCxP5VHFSDLXCtMq/ysc873M=;
 b=ZIFkqtDJWb5L9MXV86Vz0HOoF1gRRIC8e/+lt1EcaRVhcnvSJLqe4UkmnlWq3vfzdduW9T
 YiNA2zsKhBo+3MFCQmlkwtTiXlaT5FS2vmvTbNkStHcSbBn2nlOFVEaH6omrunpwIZK1XS
 gbv4/exgCOoUP3aArEY5oqvPzN35B28=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-77-JQw7bJUhP8K9LAyZuhuPDQ-1; Thu, 07 May 2020 09:57:39 -0400
X-MC-Unique: JQw7bJUhP8K9LAyZuhuPDQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 909B580183C;
 Thu,  7 May 2020 13:57:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-113-193.ams2.redhat.com
 [10.36.113.193])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C51C7707A9;
 Thu,  7 May 2020 13:57:32 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id B0FCC17477; Thu,  7 May 2020 15:57:31 +0200 (CEST)
Date: Thu, 7 May 2020 15:57:31 +0200
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH v2 00/13] microvm: add acpi support
Message-ID: <20200507135731.tnwiznaqbrgq2j22@sirius.home.kraxel.org>
References: <20200505134305.22666-1-kraxel@redhat.com>
 <20200505100010-mutt-send-email-mst@kernel.org>
 <20200506114635.b5msujuhhbim2kdv@sirius.home.kraxel.org>
 <20200506074939-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200506074939-mutt-send-email-mst@kernel.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline
Received-SPF: pass client-ip=207.211.31.81; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/07 00:55:34
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 qemu-devel@nongnu.org, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  Hi,

> > I expect dropping the rtc is easier with acpi too, the kernel probably
> > wouldn't try to find it then.  Right now seabios needs rtc cmos for
> > ram size probing, so I didn't test that yet.

Confirmed.  With rtc=3Doff I get this ...

           CPU0      =20
  1:          0   IO-APIC   9-edge      ACPI:Ged
  2:         62   IO-APIC  23-fasteoi   virtio0
  3:       5664   IO-APIC  22-fasteoi   virtio1
  4:       1854   IO-APIC   4-edge      ttyS0
NMI:          0   Non-maskable interrupts
[ ... ]

... i.e. rtc irq is gone.

> Let's leave flipping the default as a separate patch, to be
> decided on merits after a bunch of people test with/without.

Sure.

take care,
  Gerd


