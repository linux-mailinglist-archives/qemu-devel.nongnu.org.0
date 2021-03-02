Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CD1F32AA3A
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 20:22:28 +0100 (CET)
Received: from localhost ([::1]:47868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHAbD-000138-FU
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 14:22:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHA5i-0000AR-TW
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:49:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:56606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lHA5g-0006j4-Qh
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 13:49:54 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1614710991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IR1YAVeJ202fVrs/8ViqUhFw7rZvCOQ+z8TsDd76k1g=;
 b=Kc/2Zn4Dah2KGHEdcPE+lyL1+skatziQMpnRv0yRYUfSc/Aw3Bb95Kt5kuGNdKL+bX+noQ
 k/x3zYmMzw021NxWdvAv/7Zig9VHzY1pcpSGnVH7Q0jWdpMxC6ftHExWJoJjwYVCCWKYtI
 0a0N12g7NDtUJA8LpFRs82IYXPQyhFc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-162-pxWDeOI1Poej7F2iQZNPaQ-1; Tue, 02 Mar 2021 13:49:50 -0500
X-MC-Unique: pxWDeOI1Poej7F2iQZNPaQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8427B107ACC7
 for <qemu-devel@nongnu.org>; Tue,  2 Mar 2021 18:49:49 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-57.ams2.redhat.com [10.36.112.57])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B0B566026B;
 Tue,  2 Mar 2021 18:49:48 +0000 (UTC)
Subject: Re: [PATCH v3] vl: deprecate -writeconfig
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20210302180023.54555-1-pbonzini@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <00b49052-0338-8753-114f-a8eca9bbb11f@redhat.com>
Date: Tue, 2 Mar 2021 19:49:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210302180023.54555-1-pbonzini@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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
Cc: armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/03/2021 19.00, Paolo Bonzini wrote:
> The functionality of -writeconfig is limited and the code
> does not even try to detect cases where it prints incorrect
> syntax (for example if values have a quote in them, since
> qemu_config_parse does not support any kind of escaping)
> so remove it.
> 
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   docs/system/deprecated.rst | 7 +++++++
>   qemu-options.hx            | 7 +------
>   softmmu/vl.c               | 1 +
>   3 files changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/docs/system/deprecated.rst b/docs/system/deprecated.rst
> index 2fcac7861e..561c916da2 100644
> --- a/docs/system/deprecated.rst
> +++ b/docs/system/deprecated.rst
> @@ -146,6 +146,13 @@ library enabled as a cryptography provider.
>   Neither the ``nettle`` library, or the built-in cryptography provider are
>   supported on FIPS enabled hosts.
>   
> +``-writeconfig`` (since 6.0)
> +'''''''''''''''''''''''''''''
> +
> +The ``-writeconfig`` option is not able to serialize the entire contents
> +of the QEMU command line.  It is thus considered a failed experiment
> +and deprecated, with no current replacement.
> +
>   QEMU Machine Protocol (QMP) commands
>   ------------------------------------
>   
> diff --git a/qemu-options.hx b/qemu-options.hx
> index 34be5a7a2d..252db9357c 100644
> --- a/qemu-options.hx
> +++ b/qemu-options.hx
> @@ -4335,13 +4335,8 @@ SRST
>   ERST
>   DEF("writeconfig", HAS_ARG, QEMU_OPTION_writeconfig,
>       "-writeconfig <file>\n"
> -    "                read/write config file\n", QEMU_ARCH_ALL)
> +    "                read/write config file (deprecated)\n", QEMU_ARCH_ALL)
>   SRST
> -``-writeconfig file``
> -    Write device configuration to file. The file can be either filename
> -    to save command line and device configuration into file or dash
> -    ``-``) character to print the output to stdout. This can be later
> -    used as input file for ``-readconfig`` option.
>   ERST
>   
>   DEF("no-user-config", 0, QEMU_OPTION_nouserconfig,
> diff --git a/softmmu/vl.c b/softmmu/vl.c
> index b219ce1f35..10bd8a10a3 100644
> --- a/softmmu/vl.c
> +++ b/softmmu/vl.c
> @@ -3356,6 +3356,7 @@ void qemu_init(int argc, char **argv, char **envp)
>               case QEMU_OPTION_writeconfig:
>                   {
>                       FILE *fp;
> +                    warn_report("-writeconfig is deprecated and will go away without a replacement");
>                       if (strcmp(optarg, "-") == 0) {
>                           fp = stdout;
>                       } else {
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>


