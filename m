Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E255B3A271B
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Jun 2021 10:32:30 +0200 (CEST)
Received: from localhost ([::1]:40024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lrG74-00051g-0K
	for lists+qemu-devel@lfdr.de; Thu, 10 Jun 2021 04:32:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46886)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lrG3r-0002Ym-Uy
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 04:29:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51257)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lrG3p-0007Bg-DC
 for qemu-devel@nongnu.org; Thu, 10 Jun 2021 04:29:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623313748;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lKgYp2b2cqii2c+D3GOYQnwb/C6bBcyz9DlgPy/vO50=;
 b=ZSxkPF86/azL5EGKxTsYBr9JL3kJJNh/Ka/QSXtPOuzmU5C5jQNkgLYz64C+5rUnMcAFUd
 AqK72GnBEglFqK0stBJuTslwbpNDDARZpzVwz90FDxjP8ghW1ONNoQqrogEC6qxdt4u8n5
 QTHmzXYmrLmU1HDJdv7ojvgHj96dAYw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-541-Lm4KXvllP-ySN5prEB05dg-1; Thu, 10 Jun 2021 04:28:57 -0400
X-MC-Unique: Lm4KXvllP-ySN5prEB05dg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C6437BBEE9;
 Thu, 10 Jun 2021 08:28:55 +0000 (UTC)
Received: from redhat.com (ovpn-115-51.ams2.redhat.com [10.36.115.51])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D464F60C05;
 Thu, 10 Jun 2021 08:28:51 +0000 (UTC)
Date: Thu, 10 Jun 2021 09:28:48 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH 1/1] hw/nvme: namespace parameter for EUI64
Message-ID: <YMHNQOMr5HijEFmu@redhat.com>
References: <20210609114657.33301-1-xypron.glpk@gmx.de>
 <YMCwjV7Vpbk5au/U@apples.localdomain>
 <f5f15ac1-0876-331e-7433-a6ca551b9e10@gmx.de>
 <YMC1BJ5zOGQWmg7Q@apples.localdomain> <YMDSmEgfMeZa8cWd@redhat.com>
 <969B60CA-0E05-4510-9B5B-74B19133A874@gmx.de>
 <YMEdJi16P3c4tQm0@apples.localdomain>
 <F17FDDE8-ACAC-44A9-8E8A-4B424FD429DB@gmx.de>
 <YMGjtICqb9aXckg2@apples.localdomain>
MIME-Version: 1.0
In-Reply-To: <YMGjtICqb9aXckg2@apples.localdomain>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, qemu-devel@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>, Keith Busch <kbusch@kernel.org>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jun 10, 2021 at 07:31:32AM +0200, Klaus Jensen wrote:
> On Jun  9 22:15, Heinrich Schuchardt wrote:
> > Am 9. Juni 2021 21:57:26 MESZ schrieb Klaus Jensen <its@irrelevant.dk>:
> > > On Jun  9 20:13, Heinrich Schuchardt wrote:
> > > > Am 9. Juni 2021 16:39:20 MESZ schrieb "Daniel P. Berrangé"
> > > <berrange@redhat.com>:
> > > > > On Wed, Jun 09, 2021 at 02:33:08PM +0200, Klaus Jensen wrote:
> > > > > > On Jun  9 14:21, Heinrich Schuchardt wrote:
> > > > > > > On 6/9/21 2:14 PM, Klaus Jensen wrote:
> > > > > > > > On Jun  9 13:46, Heinrich Schuchardt wrote:
> > > > > > > > Would it make sense to provide a sensible default for EUI64
> > > such
> > > > > that it
> > > > > > > > is always there? That is, using the same IEEE OUI as we already
> > > > > report
> > > > > > > > in the IEEE field and add an extension identifier by grabbing 5
> > > > > bytes
> > > > > > > > from the UUID?
> > > > > > >
> > > > > > > According to the NVMe 1.4 specification it is allowable to have a
> > > > > NVMe
> > > > > > > device that does not support EUI64. As the EUI64 is used to
> > > define
> > > > > boot
> > > > > > > options in UEFI using a non-zero default may break existing
> > > > > installations.
> > > > > > >
> > > > > > 
> > > > > > Right. We dont wanna do that.
> > > > > 
> > > > > Any change in defaults can (must) be tied to the machine type
> > > versions,
> > > > > so that existing installs are unchanged, but new installs using
> > > latest
> > > > > machine type get the new default.
> > > > 
> > > > The road of least surprise is preferable. All machine should behave
> > > the
> > > > same if there is no real necessity to deviate.
> > > > 
> > > 
> > > I'd rather not introduce a new user-facing knob for this when a very
> > > sensible default can be derived from the uuid and the QEMU IEEE OUI. We
> > > 
> > > already have the uuid parameter that allows users to ensure that the
> > > namespace holds a persistent unique identifier. Adding another
> > > parameter
> > > with the same purpose seems unnecessary. And since we are adding EUI64,
> > > 
> > > we should probably also add NGUID while we are at it.
> > > 
> > > So, instead of adding parameters for EUI64 and NGUID that the user must
> > > 
> > > specify to get this more real-world behavior, I'd prefer to rely on a
> > > couple of boolean compat properties, e.g. 'support-eui64' and
> > > 'support-nguid' that defaults to 'on', but is set to 'off' for pre-6.1
> > > machines.
> > > 
> > > I think this is a nice compromise between making sure that having
> > > sensible EUI64 and NGUID values set is the new default while making
> > > sure
> > > that we do not break existing setup.
> > > 
> > > Would this be an acceptable compromise to you Heinrich?
> > 
> > EUI64 defined on some machine and not on others is totally obscure for
> > users.
> 
> I don't think that is obscure. This is exactly why machine types are
> versioned. It is documented as a feature to ensure working live migration
> between versions, but it is definitely also useful for just making sure that
> no behavior changes between qemu upgrades.
> 
> We have used this feature in the past to change the PCI Vendor/Device ID of
> the device.
> 
> > 
> > The virt machine is typically used and is pre-6.1. As pointed out above
> > you should not change the EUI64 when QEMU is upgraded and invoked with
> > the same parameter set.
> > 
> 
> From an NVMe perspective we are not changing it. We are going from "not
> supported" to "supported". But I acknowledge that there are systems that
> rely on EUI64 being zero - I just don't see why that should refrain us from
> adding EUI64 and NGUID by default in future versions when we can ensure
> compatibility with the versioned machine type (i.e. virt-6.0).

Yes, the whole point of versioned machine types is that they let us fix
bugs and add features to device implementations, while maintaining back
compat. So going from no-EUI64 to  EUI64 by default in a new machine
type version is exactly the kind of thing that is intended to happen.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


