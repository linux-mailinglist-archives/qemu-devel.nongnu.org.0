Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 218AD292F95
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Oct 2020 22:40:44 +0200 (CEST)
Received: from localhost ([::1]:48204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kUbxR-0006rh-Fm
	for lists+qemu-devel@lfdr.de; Mon, 19 Oct 2020 16:40:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kUbwD-0005ul-5D
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 16:39:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23697)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1kUbwA-0004uD-Hn
 for qemu-devel@nongnu.org; Mon, 19 Oct 2020 16:39:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603139960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WCstWsHm8uWMM1cjtzwE7pekPROhIVqQvPgsyZC+NTE=;
 b=hjn8FOdqz/3DiobZvKjBtLrojXT27f2m4pInNH5ka3xPn0FXZ/w8bzSnyDuIb5slXHspc9
 bNot5BSSwdoowmHym7BYRdAC9Lf75sTA27ToloDaExmLdFwtwVE5cAGzF8LgkY8a5/No6D
 e0LrINBb4P8qi+kHWjuqnm7NXhRaGk0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-174-zPoFaTM0PWGLEziqkFcxCw-1; Mon, 19 Oct 2020 16:39:18 -0400
X-MC-Unique: zPoFaTM0PWGLEziqkFcxCw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 68E13800050;
 Mon, 19 Oct 2020 20:39:17 +0000 (UTC)
Received: from [10.3.112.28] (ovpn-112-28.phx2.redhat.com [10.3.112.28])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 054F25D9D2;
 Mon, 19 Oct 2020 20:39:13 +0000 (UTC)
Subject: Re: [PATCH] virtio-gpu: fix incorrect print type
To: Zhengui li <lizhengui@huawei.com>, pbonzini@redhat.com,
 stefanha@redhat.com, mreitz@redhat.com, kwolf@redhat.com
References: <1603117382-7832-1-git-send-email-lizhengui@huawei.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <f49e2a7c-9913-9882-24d6-76e09f2c59cf@redhat.com>
Date: Mon, 19 Oct 2020 15:39:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <1603117382-7832-1-git-send-email-lizhengui@huawei.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/19 02:32:01
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: xieyingtai@huawei.com, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/20 9:23 AM, Zhengui li wrote:
> The type of input variable is unsigned int
> while the printer type is int. So fix incorrect print type.
> 
> Signed-off-by: Zhengui li <lizhengui@huawei.com>
> ---
>   hw/display/virtio-gpu.c | 32 ++++++++++++++++----------------
>   1 file changed, 16 insertions(+), 16 deletions(-)

This looks like an updated version of an earlier patch.  If so, please 
remember to send with -v2 in the subject line and a summary of the 
differences after the --- comment (even if the differences are just an 
enhanced commit message), to save on reviewer's time.

As an example, 'git send-email -v2 -5' can send a series of 5 patches 
all with -v2 in the subject line, and include a 0/5 cover letter if you 
have git configured correctly.

More patch submission hints at:
https://wiki.qemu.org/Contribute/SubmitAPatch

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


