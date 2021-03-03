Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6FF32B8DA
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 16:12:54 +0100 (CET)
Received: from localhost ([::1]:43464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHTBF-0002iU-60
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 10:12:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47588)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHTAH-00028T-5V
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 10:11:53 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:53795)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHTAD-00022c-OD
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 10:11:52 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614784308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oiMnle5+Sfo7uRIB8PtL0n96WNWq5icx5ZlcE/Gx+nc=;
 b=P3GYkx6EO9s3kAUu/KB9Y0Ai0hVei6gIJpmyzIXEC1NsejRa74B8tE/XmNOJj2zGR5Y6iS
 EMDNaOltgv4dRaIZui4uSzzi/GIbmiGhBnVTbE70i083Ot4mjVrTLm5b0+sasBnhNHGFkG
 IdK/+mSogNTMfBRrGBEQ4JUWLA34MKs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-0kt45ItTNG6kRpWb8B_ryw-1; Wed, 03 Mar 2021 10:11:45 -0500
X-MC-Unique: 0kt45ItTNG6kRpWb8B_ryw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id E5658100CCC0;
 Wed,  3 Mar 2021 15:11:43 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-115-146.ams2.redhat.com [10.36.115.146])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 895A35C5DF;
 Wed,  3 Mar 2021 15:11:28 +0000 (UTC)
Subject: Re: [PATCH v2 1/8] ui: Replace the word 'whitelist'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <20210205171817.2108907-1-philmd@redhat.com>
 <20210205171817.2108907-2-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <7aac6ece-cb4a-3800-9751-ecac3a3fb76f@redhat.com>
Date: Wed, 3 Mar 2021 16:11:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210205171817.2108907-2-philmd@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
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
Cc: Eduardo Otubo <otubo@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-block@nongnu.org, Michael Roth <michael.roth@amd.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 05/02/2021 18.18, Philippe Mathieu-Daudé wrote:
> Follow the inclusive terminology from the "Conscious Language in your
> Open Source Projects" guidelines [*] and replace the words "whitelist"
> appropriately.
> 
> [*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md
> 
> Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
> v2: Do not use acronyms (danpb)
> ---
>   ui/console.c       | 2 +-
>   ui/vnc-auth-sasl.c | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/ui/console.c b/ui/console.c
> index c5d11bc7017..5a8311ced20 100644
> --- a/ui/console.c
> +++ b/ui/console.c
> @@ -1708,7 +1708,7 @@ bool dpy_gfx_check_format(QemuConsole *con,
>                   return false;
>               }
>           } else {
> -            /* default is to whitelist native 32 bpp only */
> +            /* default is to allow native 32 bpp only */
>               if (format != qemu_default_pixman_format(32, true)) {
>                   return false;
>               }
> diff --git a/ui/vnc-auth-sasl.c b/ui/vnc-auth-sasl.c
> index f67111a3662..df7dc08e9fc 100644
> --- a/ui/vnc-auth-sasl.c
> +++ b/ui/vnc-auth-sasl.c
> @@ -288,7 +288,7 @@ static int protocol_client_auth_sasl_step(VncState *vs, uint8_t *data, size_t le
>               goto authreject;
>           }
>   
> -        /* Check username whitelist ACL */
> +        /* Check the username access control list */
>           if (vnc_auth_sasl_check_access(vs) < 0) {
>               goto authreject;
>           }
> @@ -409,7 +409,7 @@ static int protocol_client_auth_sasl_start(VncState *vs, uint8_t *data, size_t l
>               goto authreject;
>           }
>   
> -        /* Check username whitelist ACL */
> +        /* Check the username access control list */
>           if (vnc_auth_sasl_check_access(vs) < 0) {
>               goto authreject;
>           }
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


