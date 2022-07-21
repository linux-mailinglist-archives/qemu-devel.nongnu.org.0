Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD8257D3E6
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jul 2022 21:14:58 +0200 (CEST)
Received: from localhost ([::1]:42254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oEbdR-0002hL-I2
	for lists+qemu-devel@lfdr.de; Thu, 21 Jul 2022 15:14:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58388)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1oEbcC-0001Lb-Dp
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 15:13:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:45893)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1oEbc8-0008Ix-0J
 for qemu-devel@nongnu.org; Thu, 21 Jul 2022 15:13:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1658430814;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H9sI8+aZpj+2Y+QSyc9WUYX67kkoOGRHXfVs4EhzZ6Y=;
 b=SVlsT8HLUuU0iP/yBhrvKUGLDWO0SRk2NjH3UP1S5XBgq9JshvtruucOQKssSS4DHx46kk
 DfExezRDv+Ts2iVGarASRKAlQzR2gR/1V8Jk9dB7MlEGTIBThPNWxvHD+E5/KA+emjmIg9
 LzlXDvk8/IYelvIT8BCNvRw6cWN7ZfU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-35-nkmRUI1MMBaWfm2n69FQwQ-1; Thu, 21 Jul 2022 15:13:31 -0400
X-MC-Unique: nkmRUI1MMBaWfm2n69FQwQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A840885A585;
 Thu, 21 Jul 2022 19:13:30 +0000 (UTC)
Received: from redhat.com (unknown [10.2.16.47])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B7BFE40C1288;
 Thu, 21 Jul 2022 19:13:29 +0000 (UTC)
Date: Thu, 21 Jul 2022 14:13:28 -0500
From: Eric Blake <eblake@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH v3 7/9] tests/style: check qemu/osdep.h is included in
 all .c files
Message-ID: <20220721191305.thbv4bqi6jbene25@redhat.com>
References: <20220707163720.1421716-1-berrange@redhat.com>
 <20220707163720.1421716-8-berrange@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220707163720.1421716-8-berrange@redhat.com>
User-Agent: NeoMutt/20220429
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jul 07, 2022 at 05:37:18PM +0100, Daniel P. Berrangé wrote:
> The qemu/osdep.h file must be included as the very first header in
> all C source files, to ensure its definitions take effect over all
> other header files, including system headers.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  tests/style.yml | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/tests/style.yml b/tests/style.yml
> index d06c55bb29..6d91ac6115 100644
> --- a/tests/style.yml
> +++ b/tests/style.yml
> @@ -120,4 +120,26 @@ double_words:
>      - pc-bios/
>      - qemu-options\.hx
>      - scripts/checkpatch\.pl
> -    - tests/qtest/arm-cpu-features\.c
> \ No newline at end of file
> +    - tests/qtest/arm-cpu-features\.c

Unrelated to the patch at hand, but a good example of the issue...

Can we add a style checker to ensure that text files (including
style.yml) end in a trailing newline?

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org


