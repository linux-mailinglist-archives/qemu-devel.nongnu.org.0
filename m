Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C7C0434661A
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:16:53 +0100 (CET)
Received: from localhost ([::1]:51360 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOkeC-00041o-RP
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:16:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lOjgx-000629-92
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:15:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:34387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lOjgt-00089N-Vw
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 12:15:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616516134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/prqJYgAU3eYlRwjekcwJV82nBRclweA+7ubZG4W9pA=;
 b=cEbL0DvSl/n9P/YBXSDAlsgi8HU5QEtpuuwKxuhar7jk4ku8hzJYDXk8pw6INeem2hrI+4
 dgz+G/amqw4qYm6TSLLU5q1TChcRmCrS36r+sDydBdCph5AZ3tyeg71CQWXztHHM6LupH1
 +NarZo9hSxTywxSiF0t9nM99LUfHI50=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-418-tn6P-qONPDGR_MDDj8fDEQ-1; Tue, 23 Mar 2021 12:15:31 -0400
X-MC-Unique: tn6P-qONPDGR_MDDj8fDEQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5424C84BA42;
 Tue, 23 Mar 2021 16:15:30 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-54.ams2.redhat.com [10.36.112.54])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0D9C9196E3;
 Tue, 23 Mar 2021 16:15:28 +0000 (UTC)
Subject: Re: [RFC PATCH 13/13] meson: Only build ROM/BIOS when system
 emulation is built
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210323155132.238193-1-f4bug@amsat.org>
 <20210323155132.238193-14-f4bug@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <33977da7-ae62-32b8-bbf2-6dab4ae0ffe9@redhat.com>
Date: Tue, 23 Mar 2021 17:15:28 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210323155132.238193-14-f4bug@amsat.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=thuth@redhat.com;
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/03/2021 16.51, Philippe Mathieu-Daudé wrote:
> As it is pointless to build ROMs/BIOS for user-only emulation,
> restrict this directory to system-mode emulation.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   meson.build | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meson.build b/meson.build
> index e484670c5b7..457a07047b1 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -2378,7 +2378,9 @@
>   
>   subdir('scripts')
>   subdir('tools')
> -subdir('pc-bios')
> +if have_system
> +  subdir('pc-bios')
> +endif
>   subdir('docs')
>   subdir('tests')
>   if gtk.found()
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


