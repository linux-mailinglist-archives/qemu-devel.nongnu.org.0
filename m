Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB2914BDCC
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jan 2020 17:32:54 +0100 (CET)
Received: from localhost ([::1]:33054 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iwTnJ-0003kK-6F
	for lists+qemu-devel@lfdr.de; Tue, 28 Jan 2020 11:32:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56758)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iwTll-000230-Dt
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 11:31:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iwTlk-0005Oz-Ac
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 11:31:17 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:33953
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>) id 1iwTlk-0005Oo-6t
 for qemu-devel@nongnu.org; Tue, 28 Jan 2020 11:31:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580229075;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K5kq3H8n44ZyiAKEpnF8R3ej9byCNJRj+VIn4y/JyGE=;
 b=WEc3HOBj10mB1YefmgVyTni3nsFI59lisBzUOxpIetnP8qzEkNl60K+jVN8iK76zs+Gaeb
 JQwaG10KJ8rHAu8er5eIRYO4oB0gqCe5Riy75+7BsPlBhrISA3rAe/SYvDHdPBKkVxren1
 FvIartqQ6XyHSUOR1Wrbf+ub5UZoU9M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-15-f6OXxjCCN-mCpdzQHnIACw-1; Tue, 28 Jan 2020 11:31:14 -0500
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 135801005510;
 Tue, 28 Jan 2020 16:31:13 +0000 (UTC)
Received: from [10.3.117.16] (ovpn-117-16.phx2.redhat.com [10.3.117.16])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 053795DA70;
 Tue, 28 Jan 2020 16:31:09 +0000 (UTC)
Subject: Re: [PATCH v3 06/18] hw/core: Add core complex id in X86CPU topology
To: Babu Moger <babu.moger@amd.com>, ehabkost@redhat.com,
 marcel.apfelbaum@gmail.com, mst@redhat.com, pbonzini@redhat.com,
 rth@twiddle.net, armbru@redhat.com, imammedo@redhat.com
References: <157541968844.46157.17994918142533791313.stgit@naples-babu.amd.com>
 <157541985531.46157.16935250205964640126.stgit@naples-babu.amd.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <b06a0db8-928f-34d4-1175-ceaa28e47d4d@redhat.com>
Date: Tue, 28 Jan 2020 10:31:09 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <157541985531.46157.16935250205964640126.stgit@naples-babu.amd.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-MC-Unique: f6OXxjCCN-mCpdzQHnIACw-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 207.211.31.120
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/3/19 6:37 PM, Babu Moger wrote:
> Introduce last level cache id(llc_id) in x86CPU topology.  This information is
> required to build the topology in EPIC mode.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

> +++ b/qapi/machine.json
> @@ -646,9 +646,11 @@
>   # @node-id: NUMA node ID the CPU belongs to
>   # @socket-id: socket number within node/board the CPU belongs to
>   # @die-id: die number within node/board the CPU belongs to (Since 4.1)
> -# @core-id: core number within die the CPU belongs to# @thread-id: thread number within core the CPU belongs to
> +# @llc-id: last level cache number within node/board the CPU belongs to (Since 4.2)

s/4.2/5.0/

> +# @core-id: core number within die the CPU belongs to
> +# @thread-id: thread number within core the CPU belongs to
>   #
> -# Note: currently there are 5 properties that could be present
> +# Note: currently there are 6 properties that could be present
>   # but management should be prepared to pass through other
>   # properties with device_add command to allow for future
>   # interface extension. This also requires the filed names to be kept in
> @@ -660,6 +662,7 @@
>     'data': { '*node-id': 'int',
>               '*socket-id': 'int',
>               '*die-id': 'int',
> +            '*llc-id': 'int',
>               '*core-id': 'int',
>               '*thread-id': 'int'
>     }
-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


