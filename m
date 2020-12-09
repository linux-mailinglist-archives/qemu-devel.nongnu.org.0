Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D4712D4A83
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 20:38:51 +0100 (CET)
Received: from localhost ([::1]:59586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kn5IY-0004XY-Dq
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 14:38:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kn41H-0000n5-RT
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:16:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:25272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <ehabkost@redhat.com>)
 id 1kn41F-0002PN-Q1
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 13:16:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1607537811;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s4OK1dYkvfk9o/g6aLkp1UJT4221LqFkOiHQXDay2BE=;
 b=VZECYWqEtYyd5xbZrmWyrTZje9Iub7cwZ5KoxbgHC8oV2uDWAPa+vwEFAfScrovw8t3YIo
 b6/ZxJka3liSamQlJZCg/h0SEE2ERajL3guDBqmHo4ar17O0uWkaOVz+b47udhFWwvf4q/
 UIvj6cuwLqV5BMjh7R6m/baVOWlQC4U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-qIVaS0wXP3Gd43yMZVkmDQ-1; Wed, 09 Dec 2020 13:16:47 -0500
X-MC-Unique: qIVaS0wXP3Gd43yMZVkmDQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BD0A1C742A
 for <qemu-devel@nongnu.org>; Wed,  9 Dec 2020 18:16:46 +0000 (UTC)
Received: from localhost (ovpn-120-147.rdu2.redhat.com [10.10.120.147])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0DF075C8AD;
 Wed,  9 Dec 2020 18:16:27 +0000 (UTC)
Date: Wed, 9 Dec 2020 13:16:26 -0500
From: Eduardo Habkost <ehabkost@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH] smbios: entry-point-type option
Message-ID: <20201209181626.GU1289986@habkost.net>
References: <20201208212023.1560846-1-ehabkost@redhat.com>
 <20201209094225.GE3214234@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20201209094225.GE3214234@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ehabkost@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=ehabkost@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Dec 09, 2020 at 09:42:25AM +0000, Daniel P. Berrangé wrote:
> On Tue, Dec 08, 2020 at 04:20:23PM -0500, Eduardo Habkost wrote:
> > Add command-line option that lets the SMBIOS entry point type to
> > be configured.
> > 
> > SMBIOS 3.0 support is necessary to allow us to support more
> > than 720 VCPUs in x86_64, due to SMBIOS 2.1 table size limits.
> > 
> > Note that it's still up to firmware to decide whether to generate
> > SMBIOS 2.1 and/or 3.0 entry points for the guest, using the
> > information contained in etc/smbios/smbios-anchor.  OVMF, for
> > example, is able to generate both entry points, depending on the
> > value of PcdSmbiosEntryPointProvideMethod.
> > 
> > The SMBIOS 3.0 entry point won't be enabled by default because it
> > is not supported yet by Seabios.  This may be changed once
> > Seabios starts supporting SMBIOS 3.0 entry points.
> > 
> > Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> > ---
> > Laszlo, Philippe: do you know how exactly the value of
> > PcdSmbiosEntryPointProvideMethod is chosen when running OVMF?
> 
> Laszlo proides alot of detail in my original proposal for
> selecting SMBIOS entry point here:
> 
> https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg03347.html

Thanks!

> 
[...]
> > diff --git a/qemu-options.hx b/qemu-options.hx
> > index 104632ea34..d2a973f8a7 100644
> > --- a/qemu-options.hx
> > +++ b/qemu-options.hx
> > @@ -2294,7 +2294,9 @@ DEF("smbios", HAS_ARG, QEMU_OPTION_smbios,
> >      "                specify SMBIOS type 11 fields\n"
> >      "-smbios type=17[,loc_pfx=str][,bank=str][,manufacturer=str][,serial=str]\n"
> >      "               [,asset=str][,part=str][,speed=%d]\n"
> > -    "                specify SMBIOS type 17 fields\n",
> > +    "                specify SMBIOS type 17 fields\n"
> > +    "-smbios entry-point-type=2.1|3.0\n"
> > +    "                specify SMBIOS entry point type\n",
> 
> My previous patch:
> 
>   https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg03027.html
> 
> exposed the entry point version as a property on the PC machine
> rather than the -smbios arg, principally because it is the machin
> setup code that currently defines what version is used via the calls
> to smbios_set_defaults().
> 
> IIUC from Laszlo's reply,  SMBIOS 2.1 is not valid for AArch64
> at all - they only support 3.0.  So there's a small benefit from
> configuring this against the PC machine types, because it prevents
> ability to select 2.1 for ARM SMBIOS which would be invalid.

Good point.  It would also make it easier to change the machine
type default in the future.

I will submit something based on your patches, instead.

-- 
Eduardo


