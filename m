Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1B231E622
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 07:11:14 +0100 (CET)
Received: from localhost ([::1]:46594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCcWv-0003Sg-Au
	for lists+qemu-devel@lfdr.de; Thu, 18 Feb 2021 01:11:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lCcVZ-0002v1-Ot
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 01:09:49 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41167)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lCcVV-0003lP-EN
 for qemu-devel@nongnu.org; Thu, 18 Feb 2021 01:09:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1613628584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WzQUNgBnvSwTS74oCcMh6UtxDn1SYetUmW6T6o6tRBA=;
 b=Dh+CRKa1dYHmmanpeHtqNsdMYVcfd/63nzMQkSPqfHjXa1/Io903m4Q4BQBO3v6GZTiql0
 8NoSMOWDn6mWNycvEmidquNYt9+o2L9bBvXMeBYXg479/wLKIwDkwrO947GqBtEh4lUTqg
 BycfMOHzjSyqsm2abDsuDMVM3W2l6E0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-477-2daW3xwJM-eJZ-3pHCY6Ag-1; Thu, 18 Feb 2021 01:09:41 -0500
X-MC-Unique: 2daW3xwJM-eJZ-3pHCY6Ag-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CD6C38030C1;
 Thu, 18 Feb 2021 06:09:40 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-83.ams2.redhat.com [10.36.112.83])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 3146210016FF;
 Thu, 18 Feb 2021 06:09:39 +0000 (UTC)
Subject: Re: [PATCH v4 70/71] tests/tcg: Increase timeout for TCI
To: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
References: <20210217202036.1724901-1-richard.henderson@linaro.org>
 <20210217202036.1724901-71-richard.henderson@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <a8fa5191-e387-b759-fa16-ebe969d4a020@redhat.com>
Date: Thu, 18 Feb 2021 07:09:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210217202036.1724901-71-richard.henderson@linaro.org>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 17/02/2021 21.20, Richard Henderson wrote:
> The longest test at the moment seems to be a (slower)
> aarch64 host, for which test-mmap takes 64 seconds.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   configure                 | 3 +++
>   tests/tcg/Makefile.target | 6 ++++--
>   2 files changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/configure b/configure
> index a79b3746d4..b8924276bc 100755
> --- a/configure
> +++ b/configure
> @@ -5797,6 +5797,9 @@ fi
>   if test "$optreset" = "yes" ; then
>     echo "HAVE_OPTRESET=y" >> $config_host_mak
>   fi
> +if test "$tcg" = "enabled" -a "$tcg_interpreter" = "true" ; then
> +  echo "CONFIG_TCG_INTERPRETER=y" >> $config_host_mak
> +fi
>   if test "$fdatasync" = "yes" ; then
>     echo "CONFIG_FDATASYNC=y" >> $config_host_mak
>   fi
> diff --git a/tests/tcg/Makefile.target b/tests/tcg/Makefile.target
> index 24d75a5801..fa5813192a 100644
> --- a/tests/tcg/Makefile.target
> +++ b/tests/tcg/Makefile.target
> @@ -77,8 +77,10 @@ LDFLAGS=
>   QEMU_OPTS=
>   
>   
> -# If TCG debugging is enabled things are a lot slower
> -ifeq ($(CONFIG_DEBUG_TCG),y)
> +# If TCG debugging, or TCI is enabled things are a lot slower
> +ifneq ($(CONFIG_TCG_INTERPRETER),)
> +TIMEOUT=90
> +else ifneq ($(CONFIG_DEBUG_TCG),)
>   TIMEOUT=60
>   else
>   TIMEOUT=15

Reviewed-by: Thomas Huth <thuth@redhat.com>

Does it even get slower if you enable both at the same time, TCG debugging 
and TCI?


