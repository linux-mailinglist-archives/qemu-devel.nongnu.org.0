Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D087923CB74
	for <lists+qemu-devel@lfdr.de>; Wed,  5 Aug 2020 16:22:14 +0200 (CEST)
Received: from localhost ([::1]:41166 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k3KJ3-0004Zp-UC
	for lists+qemu-devel@lfdr.de; Wed, 05 Aug 2020 10:22:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1k3KHj-0003ui-5Z
 for qemu-devel@nongnu.org; Wed, 05 Aug 2020 10:20:51 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:32116
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1k3KHh-0000A9-Bu
 for qemu-devel@nongnu.org; Wed, 05 Aug 2020 10:20:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596637248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vc+Uqp1NoEAjt5G+R+B4kg7J6NyuW+U9JQjjo7jwmRo=;
 b=b2Dd8otKmBgCDi2ahtma6PvWmpUH/X2FDPbLaYQd9ukHlApOMu8S3c0aBbvHK+G78UK0rS
 nUfpBPcqVToGycHjzKbhl0QpCe1gSqBRrON3KONDqLVhsmnLI+26abqS4y9hoIneALuXrF
 eAZdpsHVOn9sEKWYvRbXesbFPc3PgD4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-91-FjjOlyVDP0SyFwpxiLGTjQ-1; Wed, 05 Aug 2020 10:20:45 -0400
X-MC-Unique: FjjOlyVDP0SyFwpxiLGTjQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E847380183C
 for <qemu-devel@nongnu.org>; Wed,  5 Aug 2020 14:20:43 +0000 (UTC)
Received: from [10.3.115.21] (ovpn-115-21.phx2.redhat.com [10.3.115.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 970335C1BD;
 Wed,  5 Aug 2020 14:20:43 +0000 (UTC)
Subject: Re: [PATCH v2] qapi/block-core.json: Remove stale description of
 'blockdev-add'
To: Kashyap Chamarthy <kchamart@redhat.com>, qemu-devel@nongnu.org
References: <20200805100158.1239390-1-kchamart@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <792dfd44-d514-8db8-0409-d9ac6750f914@redhat.com>
Date: Wed, 5 Aug 2020 09:20:43 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200805100158.1239390-1-kchamart@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/05 03:37:07
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/5/20 5:01 AM, Kashyap Chamarthy wrote:
> On a 'qemu-discuss' thread[1], Kevin identifies that the current doc
> blurb for @blockdev-add is stale:
> 
>      This is actually a documentation bug. @id doesn't exist,
>      blockdev-add never creates a BlockBackend. This was different in the
>      very first versions of the patches to add blockdev-add and we
>      probably just forgot to update the documentation after removing it.
> 
> So remove the stale bits.
> 
> And the requirement for 'node-name' is already mentioned in the
> documentation of @BlockdevOptions:
> 
>      [...]
>      # @node-name: the node name of the new node (Since 2.0).
>      #             This option is required on the top level of blockdev-add.
>      #             Valid node names start with an alphabetic character and may
>      #             contain only alphanumeric characters, '-', '.' and '_'. Their
>      #             maximum length is 31 characters.
>      [...]
> 
> [1] https://lists.nongnu.org/archive/html/qemu-discuss/2020-07/msg00071.html
>      -- equivalent to "-drive if=ide,id=disk0....."
> 
> Fixes: be4b67bc7d ("blockdev: Allow creation of BDS trees without BB")
> 
> Signed-off-by: Kashyap Chamarthy <kchamart@redhat.com>
> Suggested-by: Kevin Wolf <kwolf@redhat.com>
> ---

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


