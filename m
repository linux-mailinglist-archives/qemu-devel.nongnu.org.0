Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E3B62336A3
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jul 2020 18:22:58 +0200 (CEST)
Received: from localhost ([::1]:46252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k1BKb-0005pa-Kl
	for lists+qemu-devel@lfdr.de; Thu, 30 Jul 2020 12:22:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36862)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1k1BJ4-0004cK-Cn
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 12:21:22 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:47459
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1k1BJ2-0001rk-FC
 for qemu-devel@nongnu.org; Thu, 30 Jul 2020 12:21:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596126079;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RpwrwfuyOv3rz+YG9e+XnjscTlzN4BdFoO3cxPxhNck=;
 b=Qamam3HiFMZlzbGZKRTTP30oEaORA0NF7AyRi3AIhD1rQTrUEXzy3eJ5RGwSq8XcCinw8u
 q+wrNXrFkRnY2UIIUqYZTIYd5hOiUnfbZRsFfTisq5h/bSM1AmiHy/ntzb9qDruhRHVOGF
 DedxlcBWMjQX3zvLxr6WdgI82j4fuqA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-497-RmrhKBkaP-y_UmhZKIMxtw-1; Thu, 30 Jul 2020 12:21:14 -0400
X-MC-Unique: RmrhKBkaP-y_UmhZKIMxtw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C81B5800465;
 Thu, 30 Jul 2020 16:21:13 +0000 (UTC)
Received: from [10.3.114.255] (ovpn-114-255.phx2.redhat.com [10.3.114.255])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2F40487B12;
 Thu, 30 Jul 2020 16:20:59 +0000 (UTC)
Subject: Re: [PATCH V1 12/32] vl: pause option
To: Steve Sistare <steven.sistare@oracle.com>, qemu-devel@nongnu.org
References: <1596122076-341293-1-git-send-email-steven.sistare@oracle.com>
 <1596122076-341293-13-git-send-email-steven.sistare@oracle.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <1dea1698-f8be-519d-e00c-d163b08dca65@redhat.com>
Date: Thu, 30 Jul 2020 11:20:58 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1596122076-341293-13-git-send-email-steven.sistare@oracle.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/30 03:51:24
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/30/20 10:14 AM, Steve Sistare wrote:
> Provide the -pause command-line parameter and the QEMU_PAUSE environment
> variable to briefly pause QEMU in main and allow a developer to attach gdb.
> Useful when the developer does not invoke QEMU directly, such as when using
> libvirt.

How would you set this option with libvirt?

It feels like you are trying to reinvent something that is already 
well-documented:

https://www.berrange.com/posts/2011/10/12/debugging-early-startup-of-kvm-with-gdb-when-launched-by-libvirtd/

> 
> Usage:
>    qemu -pause <seconds>
>    or
>    export QEMU_PAUSE=<seconds>
> 
> Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
> ---
>   qemu-options.hx |  9 +++++++++
>   softmmu/vl.c    | 15 ++++++++++++++-
>   2 files changed, 23 insertions(+), 1 deletion(-)

> @@ -3204,6 +3211,12 @@ void qemu_init(int argc, char **argv, char **envp)
>               case QEMU_OPTION_gdb:
>                   add_device_config(DEV_GDB, optarg);
>                   break;
> +            case QEMU_OPTION_pause:
> +                seconds = atoi(optarg);

atoi() cannot detect overflow.  You should never use it in robust 
parsing of untrusted input.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


