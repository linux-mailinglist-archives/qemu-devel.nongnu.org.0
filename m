Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EE3A38C8D8
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 16:00:52 +0200 (CEST)
Received: from localhost ([::1]:55872 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk5hr-0001mY-Nb
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 10:00:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37858)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lk5fK-0008Ao-7M
 for qemu-devel@nongnu.org; Fri, 21 May 2021 09:58:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:56960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lk5fG-0000bz-3w
 for qemu-devel@nongnu.org; Fri, 21 May 2021 09:58:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621605489;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bN/CDHcyPjv3TnlXhgYW2KVMrgH0SDnYfmIl7L1pCDw=;
 b=NDA/eIivTxGcWH3L4qkuE4qvbvFMwdQo4m58Vb3ru4KGJ9IEXckoZ7/6rNbZVzeDqxxtt0
 YbHe/xnWL9xtXB5CGMkQ8Drf8mtT31ISpYrwihjgkllWEiJiTbWe2zeukvE7C+D7Z3xJ6M
 hWGxkrYjmz12Vqb4alVRaVBmGVNhN/Y=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-pNqO2FFrOTKL7lYXAuCfuw-1; Fri, 21 May 2021 09:58:04 -0400
X-MC-Unique: pNqO2FFrOTKL7lYXAuCfuw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 07E4310CE78D;
 Fri, 21 May 2021 13:58:03 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-113.ams2.redhat.com [10.36.112.113])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E28805D9CA;
 Fri, 21 May 2021 13:58:01 +0000 (UTC)
Subject: Re: [RFC PATCH] meson.build: fix cosmetics of compiler display
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210521134411.31658-1-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <84b82cde-6bdf-0870-6671-7714460155b3@redhat.com>
Date: Fri, 21 May 2021 15:58:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210521134411.31658-1-alex.bennee@linaro.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/05/2021 15.44, Alex Bennée wrote:
> If you specify something like --cc="ccache gcc" on your configure line
> the summary output misses the rest of the cmd_array. Do some string
> joining to make it complete.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   meson.build | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 1559e8d873..ca65552f31 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2510,15 +2510,15 @@ summary(summary_info, bool_yn: true, section: 'Configurable features')
>   summary_info = {}
>   summary_info += {'host CPU':          cpu}
>   summary_info += {'host endianness':   build_machine.endian()}
> -summary_info += {'C compiler':        meson.get_compiler('c').cmd_array()[0]}
> -summary_info += {'Host C compiler':   meson.get_compiler('c', native: true).cmd_array()[0]}
> +summary_info += {'C compiler':        ' '.join(meson.get_compiler('c').cmd_array())}
> +summary_info += {'Host C compiler':   ' '.join(meson.get_compiler('c', native: true).cmd_array())}
>   if link_language == 'cpp'
> -  summary_info += {'C++ compiler':      meson.get_compiler('cpp').cmd_array()[0]}
> +  summary_info += {'C++ compiler':    ' '.join(meson.get_compiler('cpp').cmd_array())}
>   else
>     summary_info += {'C++ compiler':      false}
>   endif
>   if targetos == 'darwin'
> -  summary_info += {'Objective-C compiler': meson.get_compiler('objc').cmd_array()[0]}
> +  summary_info += {'Objective-C compiler': ' '.join(meson.get_compiler('objc').cmd_array())}
>   endif
>   if targetos == 'windows'
>     if 'WIN_SDK' in config_host
> -- 2.20.1
> 

Tested-by: Thomas Huth <thuth@redhat.com>


