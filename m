Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6145B346728
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 19:06:42 +0100 (CET)
Received: from localhost ([::1]:44968 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOlQP-0000uo-Bz
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 14:06:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lOlKY-0006PS-WC
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:00:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44780)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1lOlKU-0005n6-4c
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 14:00:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616522431;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iGpMcwfRRtW96+sdfTUPeBc64Ob55eCs+AYLvN4dFGc=;
 b=FS9RwtSCNSg6HoCM6TPHVpbVbXjBM/n8a5e+TSAhvLN5a3yuoD0vFQ5nhqx+r6K1vQFHqo
 9MlSYQyZ13Ypj2ZZtTLI3RW92J/I2uBhrp6WwrYgIvN9m0m6p935rEHp+nCCl70SBF1XRS
 2WghmLbhmP7hswV9TO6pP7l7DLnUsyY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-kBJEvYqYM0m50rGnzuqaHw-1; Tue, 23 Mar 2021 14:00:27 -0400
X-MC-Unique: kBJEvYqYM0m50rGnzuqaHw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32F9618C89DE;
 Tue, 23 Mar 2021 18:00:26 +0000 (UTC)
Received: from [10.3.112.201] (ovpn-112-201.phx2.redhat.com [10.3.112.201])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9AF8860BE5;
 Tue, 23 Mar 2021 18:00:25 +0000 (UTC)
Subject: Re: [PATCH 1/4] qapi/qdev.json: add DEVICE_NOT_DELETED event
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20210312200740.815014-1-danielhb413@gmail.com>
 <20210312200740.815014-2-danielhb413@gmail.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <02e3226b-647f-2282-d61b-5f571d796471@redhat.com>
Date: Tue, 23 Mar 2021 13:00:24 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210312200740.815014-2-danielhb413@gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: david@gibson.dropbear.id.au, qemu-ppc@nongnu.org, armbru@redhat.com,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/21 2:07 PM, Daniel Henrique Barboza wrote:
> This new event informs QAPI listeners that a previously issued
> 'device_del' command failed to delete the device from the machine.
> 
> Note that no assertion can be made about the failure reason. The goal of
> this event is to inform management that QEMU is not able to assess
> whether the hotunplug is taking too long to complete or failed in the
> guest and, as result, the device is not removed from QOM. When receiving
> this event, users/management must check inside the guest to verify the
> result of the hotunplug operation.
> 
> This scenario happens with architectures where the guest does not have
> an official way to report the hotunplug error back to the hypervisor,
> such as PowerPC and the pseries machine type.
> 
> Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
> ---
>  qapi/qdev.json | 28 ++++++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/qapi/qdev.json b/qapi/qdev.json
> index b83178220b..df9a1b9e67 100644
> --- a/qapi/qdev.json
> +++ b/qapi/qdev.json
> @@ -124,3 +124,31 @@
>  ##
>  { 'event': 'DEVICE_DELETED',
>    'data': { '*device': 'str', 'path': 'str' } }
> +
> +##
> +# @DEVICE_NOT_DELETED:
> +#
> +# Emitted whenever the device removal process expired and the device
> +# still exists in QOM. This indicates that the guest took too long
> +# to acknowlege the device removal, and we can not be sure of whether

acknowledge

> +# the process will be completed in the guest later on or a guest
> +# side error occurred.
> +#
> +# It is not safe to reuse the specified device ID.
> +#
> +# @device: device name
> +#
> +# @path: device path
> +#
> +# Since: 6.0

This is a new event, and we've missed feature freeze; is this fixing a
bug that was not present in 5.2 (in which case it is fine for -rc1), or
is this a long-standing problem where one more release without the
mechanism won't make life any worse?

> +#
> +# Example:
> +#
> +# <- { "event": "DEVICE_NOT_DELETED",
> +#      "data": { "device": "core1",
> +#                "path": "/machine/peripheral/core1" },
> +#      "timestamp": { "seconds": 1615570254, "microseconds": 573986 } }
> +#
> +##
> +{ 'event': 'DEVICE_NOT_DELETED',
> +  'data': { '*device': 'str', 'path': 'str' } }
> \ No newline at end of file

You'll want to fix that.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


