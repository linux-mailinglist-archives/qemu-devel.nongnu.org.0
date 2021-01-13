Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8872F4A82
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 12:46:27 +0100 (CET)
Received: from localhost ([::1]:57976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzebZ-0004uY-TP
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 06:46:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzeZS-0004BY-PA
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 06:44:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37253)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1kzeZO-0007hV-HG
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 06:44:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610538248;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TVQXem6d6es3et9cIgRFBuMZ7obTDCX3HXAVmxZEJDk=;
 b=FkecUbjG0zELWcabeffU/h2Uv9zRw8ZZVMbTQwKr4+/14Sq4GQzkm9O5ign1lDMhxJV/8l
 XibQSuUIiMkTgMDVCYd5gu7xL733bhdN8t0+PHNshO29TvY24hqY6N2NuNyTgiDkc0zoIz
 4YiEvCIAQIS1b9FSSvBwPBIeYJ8x/ec=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-OMFDFNqIOwO2GVm9fymA2Q-1; Wed, 13 Jan 2021 06:44:06 -0500
X-MC-Unique: OMFDFNqIOwO2GVm9fymA2Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id DCA8018C89CF;
 Wed, 13 Jan 2021 11:44:05 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-122.ams2.redhat.com [10.36.112.122])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 16A1760BF1;
 Wed, 13 Jan 2021 11:44:04 +0000 (UTC)
Subject: Re: [PATCH] osdep.h: Remove <sys/signal.h> include
To: Michael Forney <mforney@mforney.org>, qemu-devel@nongnu.org
References: <20201027003848.10920-1-mforney@mforney.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f7d88d49-6108-9035-85e2-b68aff77b316@redhat.com>
Date: Wed, 13 Jan 2021 12:44:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20201027003848.10920-1-mforney@mforney.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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

On 27/10/2020 01.38, Michael Forney wrote:
> Prior to 2a4b472c3c, sys/signal.h was only included on OpenBSD
> (apart from two .c files). The POSIX standard location for this
> header is just <signal.h> and in fact, OpenBSD's signal.h includes
> sys/signal.h itself.
> 
> Unconditionally including <sys/signal.h> on musl causes warnings
> for just about every source file:
> 
>    /usr/include/sys/signal.h:1:2: warning: #warning redirecting incorrect #include <sys/signal.h> to <signal.h> [-Wcpp]
>        1 | #warning redirecting incorrect #include <sys/signal.h> to <signal.h>
>          |  ^~~~~~~
> 
> Since there don't seem to be any platforms which require including
> <sys/signal.h> in addition to <signal.h>, and some platforms like
> Haiku lack it completely, just remove it.
> 
> Tested building on OpenBSD after removing this include.
> 
> Signed-off-by: Michael Forney <mforney@mforney.org>
> ---
>   configure            | 10 ----------
>   include/qemu/osdep.h |  4 ----
>   2 files changed, 14 deletions(-)
> 
> diff --git a/configure b/configure
> index 55e07c82dd..7b57456052 100755
> --- a/configure
> +++ b/configure
> @@ -3095,13 +3095,6 @@ if check_include "libdrm/drm.h" ; then
>       have_drm_h=yes
>   fi
>   
> -#########################################
> -# sys/signal.h check
> -have_sys_signal_h=no
> -if check_include "sys/signal.h" ; then
> -  have_sys_signal_h=yes
> -fi
> -
>   ##########################################
>   # VTE probe
>   
> @@ -6182,9 +6175,6 @@ fi
>   if test "$have_openpty" = "yes" ; then
>       echo "HAVE_OPENPTY=y" >> $config_host_mak
>   fi
> -if test "$have_sys_signal_h" = "yes" ; then
> -    echo "HAVE_SYS_SIGNAL_H=y" >> $config_host_mak
> -fi
>   
>   # Work around a system header bug with some kernel/XFS header
>   # versions where they both try to define 'struct fsxattr':
> diff --git a/include/qemu/osdep.h b/include/qemu/osdep.h
> index f9ec8c84e9..a434382c58 100644
> --- a/include/qemu/osdep.h
> +++ b/include/qemu/osdep.h
> @@ -104,10 +104,6 @@ extern int daemon(int, int);
>   #include <setjmp.h>
>   #include <signal.h>
>   
> -#ifdef HAVE_SYS_SIGNAL_H
> -#include <sys/signal.h>
> -#endif
> -
>   #ifndef _WIN32
>   #include <sys/wait.h>
>   #else
> 

Seems like this felt through the cracks, sorry. Since there have been some 
changes to the configure scripts, could you please rework your patch and 
post again, setting qemu-trivial@nongnu.org into CC: so that it gets more 
attention?

  Thanks,
   Thomas


