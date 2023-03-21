Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F42F6C34BE
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Mar 2023 15:50:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pedIu-0003o8-OP; Tue, 21 Mar 2023 10:49:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@linux.dev>)
 id 1pedIs-0003mo-L1
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 10:49:34 -0400
Received: from out-51.mta0.migadu.com ([2001:41d0:1004:224b::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew.jones@linux.dev>)
 id 1pedIq-0007Mb-Sb
 for qemu-devel@nongnu.org; Tue, 21 Mar 2023 10:49:34 -0400
Date: Tue, 21 Mar 2023 15:49:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1679410164;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=qbQfRBfczUJav6FHt3ZKMjH+csQpxkzMB8JxUvxdhEg=;
 b=hfMGnzoG6xzWlox+ufsQX1egceC/3JbHyhVSilkiaV+C05kj5/k/2jyb75UTOgfVe9SVO8
 Dv0iKHcJVeJyPZTUhDUpu/N3qpFLSn6BX4v4acfZSWDNG2UvylXHh1RokgUtIlbvvCkTkz
 NlbjZ3Xw03ajFpUmCbPcF375angm+zo=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
 qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, kvmarm@lists.linux.dev,
 qemu-arm@nongnu.org
Subject: Re: [kvm-unit-tests PATCH v10 1/7] Makefile: add GNU global tags
 support
Message-ID: <20230321144922.kiptey3aiwnz7j65@orel>
References: <20230307112845.452053-1-alex.bennee@linaro.org>
 <20230307112845.452053-2-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230307112845.452053-2-alex.bennee@linaro.org>
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=2001:41d0:1004:224b::33;
 envelope-from=andrew.jones@linux.dev; helo=out-51.mta0.migadu.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Tue, Mar 07, 2023 at 11:28:39AM +0000, Alex Bennée wrote:
> If you have ctags you might as well offer gtags as a target.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20211118184650.661575-4-alex.bennee@linaro.org>
> 
> ---
> v10
>   - update .gitignore
> ---
>  Makefile   | 5 ++++-
>  .gitignore | 3 +++
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/Makefile b/Makefile
> index 6ed5deac..f22179de 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -145,6 +145,9 @@ cscope:
>  		-name '*.[chsS]' -exec realpath --relative-base=$(CURDIR) {} \; | sort -u > ./cscope.files
>  	cscope -bk
>  
> -.PHONY: tags
> +.PHONY: tags gtags
>  tags:
>  	ctags -R
> +
> +gtags:
> +	gtags
> diff --git a/.gitignore b/.gitignore
> index 33529b65..4d5f460f 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -12,6 +12,9 @@ tags
>  patches
>  .stgit-*
>  cscope.*
> +GPATH
> +GRTAGS
> +GTAGS
>  *.swp
>  /lib/asm
>  /lib/config.h
> -- 
> 2.39.2
>

Acked-by: Andrew Jones <andrew.jones@linux.dev>

