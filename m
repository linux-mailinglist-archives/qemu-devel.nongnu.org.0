Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F23F5345DDD
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 13:14:23 +0100 (CET)
Received: from localhost ([::1]:34030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOfvS-0007kZ-AL
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 08:14:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOftU-0006rW-5Z
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 08:12:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:29507)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jsnow@redhat.com>) id 1lOftE-0005zT-Ow
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 08:12:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616501523;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3c6NTzfPW1QaoN/qbsBqZVSPwNvR0oZtVbdl8g7tSI8=;
 b=B2joEgdkhR3MMpHP8UbW1z0X+a9KoRJ4ptHT85XdIFrLdyoKC7PADsq6wgdG9QvhdGepYb
 TQ7f17sZVTyzDns4iFVCCmmmyFM7pwlzLikeda5gg9uZq2deOlR5J9BhGAV9yo2V+rJuYF
 vTh4rcTl7EvVpzUc34QtvSHtEl1gMAw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-401-ggSHrihqPYadgr4NhV6L_A-1; Tue, 23 Mar 2021 08:12:01 -0400
X-MC-Unique: ggSHrihqPYadgr4NhV6L_A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6664719251A3;
 Tue, 23 Mar 2021 12:12:00 +0000 (UTC)
Received: from [10.10.117.181] (ovpn-117-181.rdu2.redhat.com [10.10.117.181])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C133318377;
 Tue, 23 Mar 2021 12:11:52 +0000 (UTC)
Subject: Re: [PATCH v2] docs: simplify each section title
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20210323074704.4078381-1-marcandre.lureau@redhat.com>
From: John Snow <jsnow@redhat.com>
Message-ID: <fafb41c3-3821-c0ac-00e5-2fd475c14ffe@redhat.com>
Date: Tue, 23 Mar 2021 08:11:52 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210323074704.4078381-1-marcandre.lureau@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jsnow@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=jsnow@redhat.com;
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
Cc: peter.maydell@linaro.org, berrange@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 3:47 AM, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Now that we merged into one doc, it makes the nav looks nicer.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

Reviewed-by: John Snow <jsnow@redhat.com>

> ---
> v2:
>   - Developers -> Developer Information (suggested by Peter)
> 
>   docs/devel/index.rst   | 4 ++--
>   docs/interop/index.rst | 4 ++--
>   docs/specs/index.rst   | 4 ++--
>   docs/system/index.rst  | 4 ++--
>   docs/tools/index.rst   | 4 ++--
>   docs/user/index.rst    | 4 ++--
>   6 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/docs/devel/index.rst b/docs/devel/index.rst
> index 7c424ea6d7..60039faa68 100644
> --- a/docs/devel/index.rst
> +++ b/docs/devel/index.rst
> @@ -1,8 +1,8 @@
>   .. This is the top level page for the 'devel' manual.
>   
>   
> -QEMU Developer's Guide
> -======================
> +Developer Information
> +=====================
>   
>   This manual documents various parts of the internals of QEMU.
>   You only need to read it if you are interested in reading or
> diff --git a/docs/interop/index.rst b/docs/interop/index.rst
> index 95d56495f6..219a5e5fc5 100644
> --- a/docs/interop/index.rst
> +++ b/docs/interop/index.rst
> @@ -1,8 +1,8 @@
>   .. This is the top level page for the 'interop' manual.
>   
>   
> -QEMU System Emulation Management and Interoperability Guide
> -===========================================================
> +System Emulation Management and Interoperability
> +================================================
>   
>   This manual contains documents and specifications that are useful
>   for making QEMU interoperate with other software.
> diff --git a/docs/specs/index.rst b/docs/specs/index.rst
> index 1b0eb979d5..7b08314d33 100644
> --- a/docs/specs/index.rst
> +++ b/docs/specs/index.rst
> @@ -1,8 +1,8 @@
>   .. This is the top level page for the 'specs' manual
>   
>   
> -QEMU System Emulation Guest Hardware Specifications
> -===================================================
> +System Emulation Guest Hardware Specifications
> +==============================================
>   
>   
>   Contents:
> diff --git a/docs/system/index.rst b/docs/system/index.rst
> index 6ad9c93806..02d0707181 100644
> --- a/docs/system/index.rst
> +++ b/docs/system/index.rst
> @@ -1,8 +1,8 @@
>   .. This is the top level page for the 'system' manual.
>   
>   
> -QEMU System Emulation User's Guide
> -==================================
> +System Emulation
> +================
>   
>   This manual is the overall guide for users using QEMU
>   for full system emulation (as opposed to user-mode emulation).
> diff --git a/docs/tools/index.rst b/docs/tools/index.rst
> index 3a5829c17a..d923834a73 100644
> --- a/docs/tools/index.rst
> +++ b/docs/tools/index.rst
> @@ -1,8 +1,8 @@
>   .. This is the top level page for the 'tools' manual
>   
>   
> -QEMU Tools Guide
> -================
> +Tools
> +=====
>   
>   
>   Contents:
> diff --git a/docs/user/index.rst b/docs/user/index.rst
> index e030dadf65..a5b47459ec 100644
> --- a/docs/user/index.rst
> +++ b/docs/user/index.rst
> @@ -1,8 +1,8 @@
>   .. This is the top level page for the 'user' manual.
>   
>   
> -QEMU User Mode Emulation User's Guide
> -=====================================
> +User Mode Emulation
> +===================
>   
>   This manual is the overall guide for users using QEMU
>   for user-mode emulation.  In this mode, QEMU can launch
> 


