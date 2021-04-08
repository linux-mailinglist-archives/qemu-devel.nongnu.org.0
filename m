Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1DF3583B4
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Apr 2021 14:51:42 +0200 (CEST)
Received: from localhost ([::1]:57334 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUU8L-0004yI-FP
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 08:51:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lUU3E-0001n8-PK
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 08:46:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1lUU38-0006U1-4v
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 08:46:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617885977;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ss0cujC4ewjbQ9nAMsM8ZdeNN+or1B8xI2Jf6sy9lNk=;
 b=YoFJui4jGVBlrbxhzhDT+Tqh/wNdWUN7HhR6amC6KjifYrf9OjgS1F0Ewh562f6UKuFQvH
 fkCUpm1aiF5YLKyh2WUT+8WUZzoGdRAU5ZE0jKpudpUgP67KqDIaIS9O/U/NttkuE8wZhe
 QiUzpdizyjjJOLqBJYdJ0YRkZWRNX7Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-lzmEjWZvMIqkM0oMr8U2yA-1; Thu, 08 Apr 2021 08:46:11 -0400
X-MC-Unique: lzmEjWZvMIqkM0oMr8U2yA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1E1FC81746A
 for <qemu-devel@nongnu.org>; Thu,  8 Apr 2021 12:46:11 +0000 (UTC)
Received: from redhat.com (ovpn-115-81.ams2.redhat.com [10.36.115.81])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id CEA3810013D7;
 Thu,  8 Apr 2021 12:46:09 +0000 (UTC)
Date: Thu, 8 Apr 2021 13:46:06 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Subject: Re: QMP introspecting device props common to a bus type
Message-ID: <YG77DnwTyCVPL3nw@redhat.com>
References: <YG23ILea4H36TllU@redhat.com> <87pmz5at1v.fsf@dusky.pond.sub.org>
MIME-Version: 1.0
In-Reply-To: <87pmz5at1v.fsf@dusky.pond.sub.org>
User-Agent: Mutt/2.0.5 (2021-01-21)
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
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Apr 08, 2021 at 01:56:28PM +0200, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > When introspecting properties for devices, libvirt issues a sequence of
> > QMP  'device-list-properties' commands, one for each device type we
> > need info for.  The result of this command tells us about all properties
> > possible on that specific device, which is generally just fine.
> >
> > Every now and then though, there are properties that are inherited from
> > / defined by the parent class, usually props that are common to all
> > devices attached to a given bus type.
> >
> > The current case in point is the "acpi-index" property that was added to
> > the "PCI" bus type, that is a parent for any type that is a PCI dev.
> >
> > Generally when libvirt adds support for a property, it will enable it
> > across all devices that can support the property. So we're enabling use
> > of "acpi-index" across all PCI devices.
> >
> > The question thus becomes how should we probe for existence of the
> > "acpi-index" property. The qemu-system-x86_64 emulator has somewhere
> > around 150 user creatable PCI devices according to "-device help".
> >
> > The existance of a class hierarchy is explicitly not exposed in QMP
> > because we consider that an internal impl detail, so we can't just
> > query "acpi-index" on the "PCI" parent type. 
> 
> Not true.
> 
> qapi/qom.json:
> 
>     ##
>     # @ObjectTypeInfo:
>     #
>     # This structure describes a search result from @qom-list-types
>     #
>     # @name: the type name found in the search
>     #
>     # @abstract: the type is abstract and can't be directly instantiated.
>     #            Omitted if false. (since 2.10)
>     #
>     # @parent: Name of parent type, if any (since 2.10)
>     #
>     # Since: 1.1
>     ##
>     { 'struct': 'ObjectTypeInfo',
>       'data': { 'name': 'str', '*abstract': 'bool', '*parent': 'str' } }
> 
>     ##
>     # @qom-list-types:
>     #
>     # This command will return a list of types given search parameters
>     #
>     # @implements: if specified, only return types that implement this type name
>     #
>     # @abstract: if true, include abstract types in the results
>     #
>     # Returns: a list of @ObjectTypeInfo or an empty list if no results are found
>     #
>     # Since: 1.1
>     ##
>     { 'command': 'qom-list-types',
>       'data': { '*implements': 'str', '*abstract': 'bool' },
>       'returns': [ 'ObjectTypeInfo' ],
>       'allow-preconfig': true }
> 
> Example 1:
> 
>     {"execute": "qom-list-types", "arguments": {"abstract": true}}
> 
> returns all type names with their parent type names.

Ah, libvirt isn't setting abstract=true when listing types during its
probing of QEMU capabilities, which is why I didn't see the parents.


> > We certainly don't want to issue 'device-list-properties' over and
> > over for all 147 devices.
> >
> > If we just pick one device type, say virtio-blk-pci, and query that
> > for "acpi-index", then our code is fragile because anyone can make
> > a QEMU build that compiles-out a specific device. This is fairly
> > unlikely for virtio devices, but never say never.
> >
> > For PCI, i'm tending towards probing for the "acpi-index" property on
> > both "pci-bridge" and "pcie-root-port", as it seems unlikely that both
> > of those will be compiled out of QEMU while still retaining PCI support.
> >
> > I'm wondering if QEMU maintainers have a view on "best practice" to
> > probe for device props that are common to specific bus types ?
> 
> The obvious
> 
>     {"execute": "device-list-properties",
>      "arguments": {"typename": "pci-device"}}
> 
> fails with "Parameter 'typename' expects a non-abstract device type".
> But its cousin qom-list-properties works:
> 
>     {"execute": "qom-list-properties",
>      "arguments": {"typename": "pci-device"}}
>     {"return": [
>      {"name": "type", "type": "string"},
>      {"name": "parent_bus", "type": "link<bus>"},
>      {"name": "realized", "type": "bool"},
>      {"name": "hotplugged", "type": "bool"},
>      {"name": "hotpluggable", "type": "bool"},
>      {"name": "failover_pair_id", "type": "str"},
>      {"name": "romfile", "type": "str"},
>      {"name": "addr", "description": "Slot and optional function number, example: 06.0 or 06", "type": "int32"},
>      {"name": "romsize", "type": "uint32"},
>      {"name": "x-pcie-lnksta-dllla", "description": "on/off", "type": "bool"},
>      {"name": "rombar", "type": "uint32"},
>      {"name": "x-pcie-extcap-init", "description": "on/off", "type": "bool"},
>      {"name": "acpi-index", "type": "uint32"},
>      {"name": "multifunction", "description": "on/off", "type": "bool"},
>      {"name": "legacy-addr", "type": "str"}]}
> 
> Does this help?

Yes, its good.

Is there any reason to use 'device-list-properties' at all, given that
'qom-list-properties' exists and works for all types ?


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|


