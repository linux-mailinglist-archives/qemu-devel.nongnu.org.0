Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D72C024A5D4
	for <lists+qemu-devel@lfdr.de>; Wed, 19 Aug 2020 20:18:51 +0200 (CEST)
Received: from localhost ([::1]:42922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8Sfi-0007k8-Vi
	for lists+qemu-devel@lfdr.de; Wed, 19 Aug 2020 14:18:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1k8Sei-0007Jd-5J
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 14:17:48 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:21863
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1k8Sef-0000RN-WC
 for qemu-devel@nongnu.org; Wed, 19 Aug 2020 14:17:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1597861064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y+NbhNle/Uu3TpCBYssVMVzmFvXSVFsyIEUVCPfXcVM=;
 b=hW3GfcHDHZNIoN7a0H61MFb+8zhBnhS0LcxZGQ+/Voslvhyb8FuxgVSYFfqK1K3W5B1kPU
 jQLkZIxVz4yf7woK4pWOEwvR1LUmb0NtGbs8l2sI+wifojl45Xm5oQlBvDo++RFAKmgvjm
 makbaeiE1/EQ74bcyElVpWgGug2TCxk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-rdmc2Ic2NjeYEGmwtgSlTg-1; Wed, 19 Aug 2020 14:17:42 -0400
X-MC-Unique: rdmc2Ic2NjeYEGmwtgSlTg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id BCDDA1005E6D;
 Wed, 19 Aug 2020 18:17:41 +0000 (UTC)
Received: from [10.3.112.136] (ovpn-112-136.phx2.redhat.com [10.3.112.136])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6771D26366;
 Wed, 19 Aug 2020 18:17:41 +0000 (UTC)
Subject: Re: [RFC PATCH 02/22] qapi: Create block-export module
To: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org
References: <20200813162935.210070-1-kwolf@redhat.com>
 <20200813162935.210070-3-kwolf@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <d7f241b5-a959-4ce1-18f1-daa01212aca8@redhat.com>
Date: Wed, 19 Aug 2020 13:17:40 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200813162935.210070-3-kwolf@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/19 04:57:22
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/13/20 11:29 AM, Kevin Wolf wrote:
> Move all block export related types and commands from block-core to the
> new QAPI module block-export.
> 
> Signed-off-by: Kevin Wolf <kwolf@redhat.com>
> ---

> +++ b/qapi/block-export.json
> @@ -0,0 +1,172 @@
> +##
> +# == Block device exports
> +##
> +
> +{ 'include': 'sockets.json' }
> +

> +++ b/qapi/Makefile.objs
> @@ -5,7 +5,8 @@ util-obj-y += opts-visitor.o qapi-clone-visitor.o
>   util-obj-y += qmp-event.o
>   util-obj-y += qapi-util.o
>   
> -QAPI_COMMON_MODULES = audio authz block-core block char common control crypto
> +QAPI_COMMON_MODULES = audio authz block-core block-export block char common
> +QAPI_COMMON_MODULES += control crypto

I don't know what Paolo's Meson conversion will affect here, but even if 
it changes how this hunk looks, the intent is obvious.

Looks like a straightforward refactoring.  I agree with Max's comment on 
the missing modeline, but that doesn't stop me from:

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


