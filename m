Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C52412FFF5D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 10:42:33 +0100 (CET)
Received: from localhost ([::1]:52674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2sxc-0000EF-Sk
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 04:42:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2swT-0008Fd-TM
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 04:41:21 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:39057)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1l2swQ-0002Uc-2I
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 04:41:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611308474;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=P6z0HG0tg3vNPsFaDXBuGr9t1xSmO3ZYWCObfWMSDH0=;
 b=Qb3D5qfjQKEU4kwlcBykYMR1uBOvdq0SMiWjEq6323IFdeVs1t1UQ8nUyDpNq063UcC/EJ
 zXZGbWq2ndx4ldx/blgaMaMMDzPBJf11zwP/WIFJ44hvYEGM91OvEeLEC4cVeS8n564MyG
 GkcxIDCy4sKv2ti9NrHYrq38V4aex3U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-264-ekT2sgsjOy6zz0rGtDUo_g-1; Fri, 22 Jan 2021 04:41:11 -0500
X-MC-Unique: ekT2sgsjOy6zz0rGtDUo_g-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1FDEC107ACF7;
 Fri, 22 Jan 2021 09:41:10 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-109.ams2.redhat.com [10.36.112.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 76ECD5C23D;
 Fri, 22 Jan 2021 09:41:08 +0000 (UTC)
Subject: Re: [PATCH 1/2] meson: Explicit TCG backend used
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20210122092205.1855659-1-philmd@redhat.com>
 <20210122092205.1855659-2-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <1029e65b-38b8-9e89-1f21-b075e29ffe76@redhat.com>
Date: Fri, 22 Jan 2021 10:41:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210122092205.1855659-2-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.168,
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
Cc: Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/01/2021 10.22, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   meson.build | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index 8535a83fb70..0a645e54662 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2419,8 +2419,12 @@
>   endif
>   summary_info += {'TCG support':       config_all.has_key('CONFIG_TCG')}
>   if config_all.has_key('CONFIG_TCG')
> +  if config_host.has_key('CONFIG_TCG_INTERPRETER')
> +    summary_info += {'TCG backend':   'TCG interpreter (experimental)'}

maybe say "experimental and slow" in the parentheses?

> +  else
> +    summary_info += {'TCG backend':   'native (@0@)'.format(cpu)}
> +  endif
>     summary_info += {'TCG debug enabled': config_host.has_key('CONFIG_DEBUG_TCG')}
> -  summary_info += {'TCG interpreter':   config_host.has_key('CONFIG_TCG_INTERPRETER')}
>   endif
>   summary_info += {'target list':       ' '.join(target_dirs)}
>   if have_system
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


