Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0CAA2B8022
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 16:13:07 +0100 (CET)
Received: from localhost ([::1]:59278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfP8s-0005rz-GG
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 10:13:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kfP7D-0004ud-EK
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:11:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:37206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kfP7A-0008Nm-5D
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 10:11:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1605712277;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=06UGy3x7pjkSBSCf7LG0cTSnV6PJLLqyegezSVvyvc4=;
 b=TNMaBKagWnEBLwaErz/7U7j9KQx/9zf9Ickpmp13/0v6hjvdXoA9D8aDimUwukZqSfufGr
 hleGVTgDz4gBWgMFvGxuk23lnBmz8zQK/kkGR4Hol9Xmc6dioAAri01RGXUj0bzSDsl39l
 Vnki7OzlwD9TZn4DrAE251UKX/6j73Q=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-d9HTYHFZOAii2-Tko8v_bg-1; Wed, 18 Nov 2020 10:11:13 -0500
X-MC-Unique: d9HTYHFZOAii2-Tko8v_bg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 21790804028;
 Wed, 18 Nov 2020 15:11:12 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-113-139.ams2.redhat.com [10.36.113.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C05EF196FB;
 Wed, 18 Nov 2020 15:11:10 +0000 (UTC)
Subject: Re: [RFC PATCH] .cirrus.yml: bump timeout period for MacOS builds
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20201118140739.18377-1-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <44c6c5c4-2152-b31f-9610-1a8e7f72037e@redhat.com>
Date: Wed, 18 Nov 2020 16:11:09 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201118140739.18377-1-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/17 19:41:43
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: pbonzini@redhat.com, Ed Maste <emaste@freebsd.org>,
 Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/11/2020 15.07, Alex Bennée wrote:
> These seem to trigger timeouts with some regularity.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .cirrus.yml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/.cirrus.yml b/.cirrus.yml
> index f0209b7a3e..08db7c419f 100644
> --- a/.cirrus.yml
> +++ b/.cirrus.yml
> @@ -18,6 +18,7 @@ freebsd_12_task:
>      - gmake -j$(sysctl -n hw.ncpu) check V=1
>  
>  macos_task:
> +  timeout_in: 90m
>    osx_instance:
>      image: catalina-base
>    install_script:
> @@ -32,6 +33,7 @@ macos_task:
>      - gmake check V=1
>  
>  macos_xcode_task:
> +  timeout_in: 90m
>    osx_instance:
>      # this is an alias for the latest Xcode
>      image: catalina-xcode
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>

... we could maybe also split the --target-list between the two jobs if they
take too long...


