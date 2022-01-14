Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B032A48E901
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 12:17:04 +0100 (CET)
Received: from localhost ([::1]:43724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8KZr-0003yH-Hz
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 06:17:03 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n8KSe-0004i9-8d
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 06:09:37 -0500
Received: from [2a00:1450:4864:20::42a] (port=38619
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1n8KSc-0003yz-IT
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 06:09:35 -0500
Received: by mail-wr1-x42a.google.com with SMTP id a5so15004704wrh.5
 for <qemu-devel@nongnu.org>; Fri, 14 Jan 2022 03:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1m5YW/srwUyitaMlJweg8A7o/77IXIxRtDu4Lt9T9JU=;
 b=Fyy5RNvPC9O8asj02T7vSd+oVhJfSVvh0APLWr1/wOv18AAd4krRy8RgxKl1K/g0UD
 ZCmdnUxbh6ZkYdqOb0Ern7f9s0Ve/acA08dH72/4+NYLYh5H3AGFThcXukIKGLUugmEP
 R72KEWe2/+QgR3Ok6X8kNgY9x4hW73A7t8JBcsksiw1G+006q8EvO5KhYIQGGVJMzmu+
 NAGR01wzN1iHw86n+vYItiM3QFXnNsgpJWGjcIz2uiPZUqOpdqqH4WGu7gFhwQS8HjND
 W2gs5NrN4SMVAaE69DoEDXvvXVC3wZ1Yz5rV9vHKI7LQvXQDjbtKi8kG8LtY/6r3Y33t
 +dCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1m5YW/srwUyitaMlJweg8A7o/77IXIxRtDu4Lt9T9JU=;
 b=H8BWYnOmCtuM39dwwZnFDg61diFbbyzRKHl4AypkOu7YxhCFNQmJgCekQ5gq1YxcHp
 RT3SfZUuUjTO7Gj781l8DjiEaXM3FBYYN+s2m8066Lblwpa4SY9GqalEc93NWpJQGHBY
 IihdXeJzS6Td9lOdVL/1dOww+Ga1mmiutDA60R/uHzE3dDeihRuOCbUX6//ItqmGojLs
 AKDw/2S0lFCYQGO5tq4EOx93M9RFb+JU9Aj5Iuq180KfembTJ6LfS0+tpRmD9WS56tH7
 U3chE+DaBBl8b0FRaQ/7DXpYYiW5ArK8avcNTGj9SQ5Y4RVlG2qnfiteZrxBtC3TpYYs
 MQrg==
X-Gm-Message-State: AOAM530RdRegN5/wXLtX4199iUwmnwoLOF4tQ81aPRGy2lFwWG/CR3XH
 vhHC/6e6I0PwHMDEB0Dy1kY=
X-Google-Smtp-Source: ABdhPJzPq9+Yp6hkddrEJmP9k6IjOoFBiLhs1uSkibHb7TWHRAEliNLqruTAtKdFgmHqHcpjdhM3IA==
X-Received: by 2002:a5d:648e:: with SMTP id o14mr7913121wri.667.1642158564361; 
 Fri, 14 Jan 2022 03:09:24 -0800 (PST)
Received: from ?IPV6:2a01:e34:ec40:49e0:48b5:8fce:b44b:d951?
 ([2a01:e34:ec40:49e0:48b5:8fce:b44b:d951])
 by smtp.gmail.com with ESMTPSA id f9sm5906043wry.115.2022.01.14.03.09.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 14 Jan 2022 03:09:24 -0800 (PST)
Message-ID: <3b2d0d33-9e4c-cd07-8147-21a8566d4ea1@amsat.org>
Date: Fri, 14 Jan 2022 12:09:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.5.0
Subject: Re: [PATCH 2/2] docker: add msitools to Fedora/mingw cross
Content-Language: en-US
To: marcandre.lureau@redhat.com, qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, alex.bennee@linaro.org,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220114084312.3725242-1-marcandre.lureau@redhat.com>
 <20220114084312.3725242-2-marcandre.lureau@redhat.com>
In-Reply-To: <20220114084312.3725242-2-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 14/1/22 09:43, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> That should help catch build issues/regressions with wixl.
> 
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> ---
>   tests/docker/dockerfiles/fedora-win32-cross.docker | 1 +
>   tests/docker/dockerfiles/fedora-win64-cross.docker | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/tests/docker/dockerfiles/fedora-win32-cross.docker b/tests/docker/dockerfiles/fedora-win32-cross.docker
> index aad39dd97ff4..d80e66c6517d 100644
> --- a/tests/docker/dockerfiles/fedora-win32-cross.docker
> +++ b/tests/docker/dockerfiles/fedora-win32-cross.docker
> @@ -29,6 +29,7 @@ ENV PACKAGES \
>       mingw32-pixman \
>       mingw32-pkg-config \
>       mingw32-SDL2 \
> +    msitools \
>       perl \
>       perl-Test-Harness \
>       python3 \
> diff --git a/tests/docker/dockerfiles/fedora-win64-cross.docker b/tests/docker/dockerfiles/fedora-win64-cross.docker
> index 9a224a619bd4..2b12b94ccfb4 100644
> --- a/tests/docker/dockerfiles/fedora-win64-cross.docker
> +++ b/tests/docker/dockerfiles/fedora-win64-cross.docker
> @@ -26,6 +26,7 @@ ENV PACKAGES \
>       mingw64-libusbx \
>       mingw64-pixman \
>       mingw64-pkg-config \
> +    msitools \
>       perl \
>       perl-Test-Harness \
>       python3 \

This clashes with testing/next pull request:
https://lore.kernel.org/qemu-devel/20220112112722.3641051-10-alex.bennee@linaro.org/

