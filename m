Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D2E832CC10
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 06:38:09 +0100 (CET)
Received: from localhost ([::1]:43690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHgga-0004uO-89
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 00:38:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51600)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHgfK-0004BS-3Y
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 00:36:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:50619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHgfH-0001MR-6A
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 00:36:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614836206;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qVnIxoln5A3jbAOoeJlhytTMjeR1GSgtbbc8y/OSwic=;
 b=KGOALMIngwRfjldmziFHpQppdYo63zIb2BTAPQ6mMKRkFttNGwmkjMCSroUS+PbjgDgqnE
 4pE+VxAdNn96O6f5FUhfi2HbNHyyFAdNyQF0HBJBL5Y4UoNiH/WxUD/jRCf94avdAFH8iT
 kZ5iLNV1GKErq54uw1o3v1YbwzFE9CI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-151-4h1ok6LIPK22e2gPkWeGUA-1; Thu, 04 Mar 2021 00:36:44 -0500
X-MC-Unique: 4h1ok6LIPK22e2gPkWeGUA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2BFDE80196E;
 Thu,  4 Mar 2021 05:36:43 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-31.ams2.redhat.com [10.36.112.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3E79C10013D6;
 Thu,  4 Mar 2021 05:36:24 +0000 (UTC)
Subject: Re: [PATCH v3 4/5] qemu-options: Replace the word 'blacklist'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>,
 Eduardo Otubo <otubo@redhat.com>
References: <20210303184644.1639691-1-philmd@redhat.com>
 <20210303184644.1639691-5-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f4d59c51-d40e-6d51-851a-82984fd43151@redhat.com>
Date: Thu, 4 Mar 2021 06:36:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210303184644.1639691-5-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Michael Roth <michael.roth@amd.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 03/03/2021 19.46, Philippe Mathieu-Daudé wrote:
> Follow the inclusive terminology from the "Conscious Language in your
> Open Source Projects" guidelines [*] and replace the word "blacklist"
> appropriately.
> 
> [*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   qemu-options.hx | 6 +++---
>   1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 252db9357ca..8462dc5f158 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4299,12 +4299,12 @@ DEF("sandbox", HAS_ARG, QEMU_OPTION_sandbox, \
>       "                use 'obsolete' to allow obsolete system calls that are provided\n" \
>       "                    by the kernel, but typically no longer used by modern\n" \
>       "                    C library implementations.\n" \
> -    "                use 'elevateprivileges' to allow or deny QEMU process to elevate\n" \
> -    "                    its privileges by blacklisting all set*uid|gid system calls.\n" \
> +    "                use 'elevateprivileges' to allow or deny the QEMU process ability\n" \
> +    "                    to elevate privileges using set*uid|gid system calls.\n" \
>       "                    The value 'children' will deny set*uid|gid system calls for\n" \
>       "                    main QEMU process but will allow forks and execves to run unprivileged\n" \
>       "                use 'spawn' to avoid QEMU to spawn new threads or processes by\n" \
> -    "                     blacklisting *fork and execve\n" \
> +    "                     blocking *fork and execve\n" \
>       "                use 'resourcecontrol' to disable process affinity and schedular priority\n",
>       QEMU_ARCH_ALL)
>   SRST
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


