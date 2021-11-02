Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D69A7442E78
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:50:52 +0100 (CET)
Received: from localhost ([::1]:44208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhtFc-0005df-0E
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:50:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40116)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mht3H-00021t-BE
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:38:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38240)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mht3B-0003TQ-PP
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 08:38:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635856681;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NaUOcdt0d3hUpE0+4fj5IlDzhd/sstYNyV5OV3eQeaA=;
 b=O8Uv0Hmav3mD5ZNVfEV7kO7LNpQ7KzO5zFcUQ/TgQD1NknDYHYp9+Hmgh2M2AHmv8KzvC0
 TmbSZqBTM7t9z9c+Qdnqy5thkF7UJIckoN1fRJTQg+AWNuEvLG60sz5GgjO4Z+4+y8Q5QL
 d20rO1k0r8HeelAHRq7la0j7nsWQAo0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-584-8ikxe6_iNpOq3n4vA2sAyA-1; Tue, 02 Nov 2021 08:37:55 -0400
X-MC-Unique: 8ikxe6_iNpOq3n4vA2sAyA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0E9BC801107;
 Tue,  2 Nov 2021 12:37:55 +0000 (UTC)
Received: from [10.39.192.88] (unknown [10.39.192.88])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 23959100E12D;
 Tue,  2 Nov 2021 12:37:53 +0000 (UTC)
Message-ID: <e0e35e77-79d8-0a94-b298-c174ef0919c1@redhat.com>
Date: Tue, 2 Nov 2021 13:37:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] meson: remove unnecessary coreaudio test program
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20211102113044.204344-2-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <20211102113044.204344-2-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -60
X-Spam_score: -6.1
X-Spam_bar: ------
X-Spam_report: (-6.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.549, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/11/2021 12.30, Paolo Bonzini wrote:
> AudioGetCurrentHostTime has been present forever, so the test is not
> enforcing a specific version of macOS.  In fact the test was broken
> since it was not linking against the coreaudio dependency; just remove it.
> 
> Fixes: 87430d5b13 ("configure, meson: move audio driver detection to Meson", 2021-10-14)
> Reported-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   meson.build | 16 ----------------
>   1 file changed, 16 deletions(-)
> 
> diff --git a/meson.build b/meson.build
> index 3dadb245a8..d800b9c5fb 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -944,22 +944,6 @@ coreaudio = not_found
>   if not get_option('coreaudio').auto() or (targetos == 'darwin' and have_system)
>     coreaudio = dependency('appleframeworks', modules: 'CoreAudio',
>                            required: get_option('coreaudio'))
> -  if coreaudio.found() and not cc.links('''
> -    #include <CoreAudio/CoreAudio.h>
> -    int main(void)
> -    {
> -      return (int)AudioGetCurrentHostTime();
> -    }''')
> -    coreaudio = not_found
> -  endif
> -
> -  if not coreaudio.found()
> -    if get_option('coreaudio').enabled()
> -      error('CoreAudio not found')
> -    else
> -      warning('CoreAudio not found, disabling')
> -    endif
> -  endif
>   endif
>   
>   opengl = not_found
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


