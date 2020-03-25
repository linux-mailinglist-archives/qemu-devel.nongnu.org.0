Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F251930CA
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Mar 2020 20:01:46 +0100 (CET)
Received: from localhost ([::1]:41748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jHBHd-0002KZ-R6
	for lists+qemu-devel@lfdr.de; Wed, 25 Mar 2020 15:01:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50410)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1jHBG2-0001nc-To
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 15:00:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1jHBG1-00054e-UN
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 15:00:06 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:38191)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>) id 1jHBG1-00054O-PF
 for qemu-devel@nongnu.org; Wed, 25 Mar 2020 15:00:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585162805;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iqgM+agn8AMUj1kYHHtzRXUypGmupEVVkQ7S+cq/KII=;
 b=Cpcr65v8irJ5uqlkUgNjRXNP/P/441HHCgup1wrJlYi+Ye2bk3Nnt5PfV/Rzn/T2+AkqEi
 afTaSiOiA4YKuRHTv5iYNiroiBgFVolDwhm2sXLXXIrmIA7JM/D11RCYEtx9/pRPwvvocI
 XXrioqNSp/t34O7LF94Ab+dlL7L7iFE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-95-VA3zcQytMauNecWV5dGjEA-1; Wed, 25 Mar 2020 15:00:03 -0400
X-MC-Unique: VA3zcQytMauNecWV5dGjEA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3CCB801E53;
 Wed, 25 Mar 2020 19:00:02 +0000 (UTC)
Received: from localhost (unknown [10.40.208.76])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0AAD47E311;
 Wed, 25 Mar 2020 18:59:52 +0000 (UTC)
Date: Wed, 25 Mar 2020 19:59:50 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gerd Hoffmann <kraxel@redhat.com>
Subject: Re: [PATCH 04/13] microvm: add minimal acpi support.
Message-ID: <20200325195950.0cdbe5a2@redhat.com>
In-Reply-To: <20200325090429.gx4bpz244w4fcfz7@sirius.home.kraxel.org>
References: <20200319080117.7725-1-kraxel@redhat.com>
 <20200319080117.7725-5-kraxel@redhat.com>
 <20200319150033.13f50947@redhat.com>
 <20200325090429.gx4bpz244w4fcfz7@sirius.home.kraxel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 25 Mar 2020 10:04:29 +0100
Gerd Hoffmann <kraxel@redhat.com> wrote:

>   Hi,
> 
> > > +    {
> > > +        AcpiRsdpData rsdp_data = {
> > > +            .revision = 0,
> > > +            .oem_id = ACPI_BUILD_APPNAME6,
> > > +            .xsdt_tbl_offset = NULL,
> > > +            .rsdt_tbl_offset = &rsdt,  
> > are we interested in 32-bit guests?  
> 
> Well, sort-of.  seabios runs in 32bit mode.
seabios isn't consumer of it though, so as far as being loaded kernel
is able to deal with xsdt it should be fine.

> > if not than maybe use xsdt and newer revision like arm/virt does  
> 
> Point being?  It's not like we can place the tables above 4G then.
point is to use current standard vs legacy one on new machine
> 
> cheers,
>   Gerd
> 


