Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D79CF26117B
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Sep 2020 14:39:27 +0200 (CEST)
Received: from localhost ([::1]:49414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kFcuF-0006bR-0D
	for lists+qemu-devel@lfdr.de; Tue, 08 Sep 2020 08:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kFcrv-0003VF-01
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 08:37:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:51607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kFcrt-0000ID-7T
 for qemu-devel@nongnu.org; Tue, 08 Sep 2020 08:37:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599568620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=beNf1RWaRkSGnYCdxNHyDjnxNdYpPdXjoU5qH8vtbTE=;
 b=iYOeOZzSKOC5YMKuP5dQ7OPS4juarHThoRQ0SbdvOzC+ZXssLNptUtUyi1POOYSx/6jo4r
 8XXAB/EPCRrxZcxbQ/m9PeCZrbqXjeOROs/g04UWUF0Gz4Tdz+nwng65yMSpmhJPc+iaNK
 0guU+/qMV+5RcQvOEIh44Kvnu0SKDhc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-9-DzYtW-OMPMmAE9Rc1hRpBg-1; Tue, 08 Sep 2020 08:36:55 -0400
X-MC-Unique: DzYtW-OMPMmAE9Rc1hRpBg-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3889618B9EEC;
 Tue,  8 Sep 2020 12:36:54 +0000 (UTC)
Received: from [10.3.112.176] (ovpn-112-176.phx2.redhat.com [10.3.112.176])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E468F5D9F3;
 Tue,  8 Sep 2020 12:36:47 +0000 (UTC)
Subject: Re: [PATCH v3 1/4] qapi: net: Add query-netdevs command
To: Markus Armbruster <armbru@redhat.com>,
 Alexey Kirillov <lekiravi@yandex-team.ru>
References: <20200901182326.59633-1-lekiravi@yandex-team.ru>
 <20200901182326.59633-2-lekiravi@yandex-team.ru>
 <87lfhsjubv.fsf@dusky.pond.sub.org> <37711599469320@mail.yandex-team.ru>
 <871rjdrca0.fsf@dusky.pond.sub.org>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <b632d444-bdf9-648b-9d55-a9e72efb8fbc@redhat.com>
Date: Tue, 8 Sep 2020 07:36:47 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <871rjdrca0.fsf@dusky.pond.sub.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/08 02:10:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -36
X-Spam_score: -3.7
X-Spam_bar: ---
X-Spam_report: (-3.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.626, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Jason Wang <jasowang@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Vincenzo Maffione <v.maffione@gmail.com>,
 "yc-core@yandex-team.ru" <yc-core@yandex-team.ru>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Giuseppe Lettieri <g.lettieri@iet.unipi.it>, Luigi Rizzo <rizzo@iet.unipi.it>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/7/20 7:39 AM, Markus Armbruster wrote:

>>>
>>> This is union Netdev plus a common member @peer-id, less the variant
>>> members for NetClientDriver values 'nic' and 'hubport'.
>>>
>>> Can 'type: 'nic' and 'type': 'hubport' occur?
>>
>> No, it can't. We don't support NIC/hubport in query-netdevs, so we neither create this
>> structure for them, nor store config.
> 
> Same for 'none', I guess.
> 
> As defined, NetdevInfo allows types 'none', 'nic', and 'hubport', it
> just has no variant members for them.  The fact that they can't occur is
> not coded into the type, and therefore not visible in introspection.
> 
> To make introspection more precise, we'd have to define a new enum type.
> How much that would complicate the C code is unclear.
> 
> Do we need it to be more precise?  Eric, got an opinion?

Is the problem that a new enum would be duplicating things?  Is it worth 
allowing one enum to have a 'base':'OtherEnum' in the schema to reduce 
some of the duplication?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


