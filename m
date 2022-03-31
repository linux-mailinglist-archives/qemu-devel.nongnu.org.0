Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02E9D4EDB7E
	for <lists+qemu-devel@lfdr.de>; Thu, 31 Mar 2022 16:11:50 +0200 (CEST)
Received: from localhost ([::1]:36144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nZvWe-0003Rq-ED
	for lists+qemu-devel@lfdr.de; Thu, 31 Mar 2022 10:11:48 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZvRH-0001HF-Mk
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 10:06:15 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:56000)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <damien.hedde@greensocs.com>)
 id 1nZvRF-00024m-7u
 for qemu-devel@nongnu.org; Thu, 31 Mar 2022 10:06:15 -0400
Received: from [172.17.10.10] (unknown [172.17.10.10])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 0C0A22077C;
 Thu, 31 Mar 2022 14:06:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1648735568;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SeAlHh/kTNPCRIG6XIr8ShTksjbqGsIsnfmb56ZKSNQ=;
 b=Ea0PoymaJnP1D5vaM1fK0uO9RqJbxGnpBJU+at0a/V2sVRvqOBw8agKZ7Hq0ogMJGVXxjF
 xYGgO1dR4sHn7rjXXDvRbZdVEZF+22REFp+djM9PpOmTYRY1uBDA7kWOl8t/hkkr7V7pIU
 KOlZ0hmz049RGKreZXRzpELKJ+kGeXg=
Message-ID: <f1b5c24a-f8ed-6cf1-9f4e-91b9a84c7a06@greensocs.com>
Date: Thu, 31 Mar 2022 16:06:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] doc/build-platforms: document supported compilers
Content-Language: en-US-large
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
References: <20220331135647.1686375-1-marcandre.lureau@redhat.com>
 <20220331135647.1686375-2-marcandre.lureau@redhat.com>
From: Damien Hedde <damien.hedde@greensocs.com>
In-Reply-To: <20220331135647.1686375-2-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=damien.hedde@greensocs.com; helo=beetle.greensocs.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Reviewed-by: Damien Hedde <damien.hedde@greensocs.com>

On 3/31/22 15:56, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> According to our configure checks, this is the list of supported
> compilers.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   docs/about/build-platforms.rst | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/docs/about/build-platforms.rst b/docs/about/build-platforms.rst
> index c29a4b8fe649..1980c5d2476f 100644
> --- a/docs/about/build-platforms.rst
> +++ b/docs/about/build-platforms.rst
> @@ -92,6 +92,16 @@ hosted on Linux (Debian/Fedora).
>   The version of the Windows API that's currently targeted is Vista / Server
>   2008.
>   
> +Supported compilers
> +-------------------
> +
> +To compile, QEMU requires either:
> +
> +- GCC >= 7.4.0
> +- Clang >= 6.0
> +- XCode Clang >= 10.0
> +
> +
>   .. _HomeBrew: https://brew.sh/
>   .. _MacPorts: https://www.macports.org/
>   .. _Repology: https://repology.org/

