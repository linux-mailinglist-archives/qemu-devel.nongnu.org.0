Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E5C0205AFF
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Jun 2020 20:43:23 +0200 (CEST)
Received: from localhost ([::1]:37278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jnntB-0000iu-SP
	for lists+qemu-devel@lfdr.de; Tue, 23 Jun 2020 14:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jnnrV-0007nt-Sc
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 14:41:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:24356
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1jnnrT-0001b0-84
 for qemu-devel@nongnu.org; Tue, 23 Jun 2020 14:41:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1592937693;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=12a5z3buWkBG2zVwDiqHiOQMoVyyNxKToEo7rcgO9IE=;
 b=fwNZ1/tZ6KFahFtoquWv7Bqj3kl7z0w0BVmpKjLIqUBwrlaEU9SYeW4bVhv5e/HWDW4Cv8
 +guoyqlR7PY2+BGAp6dFYQyckLXWX7zc/9lk3h0S56xEgLpE/9lxgiWy1+iiMrFWr7HckN
 tSPI/7+Xsy6Cqxal/DIIqiBvZ/XC5OE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-8-i2nv-lDdP_6qAtEDzKT7vQ-1; Tue, 23 Jun 2020 14:41:17 -0400
X-MC-Unique: i2nv-lDdP_6qAtEDzKT7vQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A1BE0800597
 for <qemu-devel@nongnu.org>; Tue, 23 Jun 2020 18:41:16 +0000 (UTC)
Received: from [10.3.114.107] (ovpn-114-107.phx2.redhat.com [10.3.114.107])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 6F87A5D9D3;
 Tue, 23 Jun 2020 18:41:16 +0000 (UTC)
Subject: Re: [PATCH] configure: disable -Wxor-used-as-pow
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20200623173726.20909-1-pbonzini@redhat.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <cc8efdbc-0d09-37ca-199a-2b82700aea00@redhat.com>
Date: Tue, 23 Jun 2020 13:41:15 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200623173726.20909-1-pbonzini@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=eblake@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/06/23 01:53:54
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/23/20 12:37 PM, Paolo Bonzini wrote:
> Clang being clang and adding more pointless warnings.  In a hardware
> emulator there are going to be plenty of bitwise operations, and the
> chance of someone writing ^ for pow and not being caught is basically
> zero.

Did this warning actually fire?

My understanding (from a quick glance of 
https://reviews.llvm.org/D63423) is that it is supposed to catch 
instances of '2 ^ 16' where someone meant '1 << 16' instead of 18.  I 
don't know if it is supposed to flag 'a ^ 16' (if it does, then it is 
indeed useless), or only when both lhs and rhs are constants and where 
lhs is 2 or 10, so my initial reaction is that without seeing an actual 
false positive, we are premature in disabling it.

> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   configure | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/configure b/configure
> index 8d9435a0e0..d42f060ee7 100755
> --- a/configure
> +++ b/configure
> @@ -2062,6 +2062,7 @@ add_to nowarn_flags -Wno-string-plus-int
>   add_to nowarn_flags -Wno-typedef-redefinition
>   add_to nowarn_flags -Wno-tautological-type-limit-compare
>   add_to nowarn_flags -Wno-psabi
> +add_to nowarn_flags -Wno-xor-used-as-pow

Pre-existing, but is it worth ordering flag additions in alphabetical 
order (the three preceding lines are in the wrong order if so).

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org


