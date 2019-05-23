Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 33B102880D
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 21:27:54 +0200 (CEST)
Received: from localhost ([127.0.0.1]:42268 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTtNZ-0008MS-Bf
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 15:27:53 -0400
Received: from eggs.gnu.org ([209.51.188.92]:50471)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hTtMI-0007EL-Gm
	for qemu-devel@nongnu.org; Thu, 23 May 2019 15:26:35 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hTtMH-0001mj-Np
	for qemu-devel@nongnu.org; Thu, 23 May 2019 15:26:34 -0400
Received: from mail-vs1-xe41.google.com ([2607:f8b0:4864:20::e41]:35939)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hTtMH-0001mb-IA
	for qemu-devel@nongnu.org; Thu, 23 May 2019 15:26:33 -0400
Received: by mail-vs1-xe41.google.com with SMTP id l20so4294625vsp.3
	for <qemu-devel@nongnu.org>; Thu, 23 May 2019 12:26:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:from:to:cc:references:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=Jqr4YpGhBvLIwwVuMxStc12w4Tkj7i3zgdfyvV1fr/0=;
	b=voch1lQWvg0RyYqZOsPhi6uQq2HPhbeiq8mZYOJNo06Q2T2Jgiw5Yx7DemgcklJSsA
	5pcsBTld/Nbzyzi61sCDdIVVsy7TepVx/WVBxdsTpUYEMkAzZnY1ODz38sdBS4E62k17
	E6vU/G5BkBsXpSspxrZkUdh3y7eHhqXPDkOKrKjjw1bmY9GbAkox3Ea9WE57dix/qYKX
	6c5NSwbjDFYRY4PmxiVzmnPlnCLdznJKqPgi7y+XVwWIuhSLnDPUCi3UONlPJhZHyums
	/8l8P3BLCPk6khD5N6MJUVJWd3z0x1acFJUZrIu0hBPPJ+YKzcnpEzZtVLkPr1Dw55KE
	EOEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:cc:references:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=Jqr4YpGhBvLIwwVuMxStc12w4Tkj7i3zgdfyvV1fr/0=;
	b=pKE9gxjS2J1zpJjKkRQaAxE++6r0SRK6FDisVfdUNYhRCwq6I9jedi8gndsuG7dEl2
	DwoHgShjaMc1ekdWLaTPw0+O5OMbTBBYWTxGl1mGvb0w1slO1rDH5E7F5RPY7rxJnZ6T
	5ORdTSsiP8jMn+L/H9fS/QJXRPVdPbHq8nFqoqm4EX3dMdlaxXzpy2C7jC+409K231/k
	EFCkjLgCMeHfb3DKgQDxTnqYIlSg9yRUcP5CnjIsSxILjZKfvP19EdHdx5pGdAKYQ7pD
	697xd/XLEA3izfBIX5XiXEbL7w8MSZVj/KZ3pZj7qPE3m4bN/LH/B1fZM+7TqOj7mOpT
	4z2g==
X-Gm-Message-State: APjAAAWdYppMB28hNAyJesRVhVYZ0tBP1fbzvMzoSW+0fBBbQfY1vsKS
	Ce+Mu53UMzHM+kXP6iYkjMQHvOgimFE=
X-Google-Smtp-Source: APXvYqwMZLmTqnoU7oLaahrDFvvFOvcf8FEfNS9ywuk9F2xg9xqvZaHU9w8QfzVC5pIrxCU7c+slSw==
X-Received: by 2002:a67:8e01:: with SMTP id q1mr1993905vsd.1.1558639592726;
	Thu, 23 May 2019 12:26:32 -0700 (PDT)
Received: from [192.168.43.94] (ip-173-130-172-85.orldfl.spcsdns.net.
	[173.130.172.85])
	by smtp.gmail.com with ESMTPSA id 9sm63031vkk.43.2019.05.23.12.26.31
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 May 2019 12:26:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20190523024229.1158-1-richard.henderson@linaro.org>
	<20190523024229.1158-4-richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <1c073eb0-b7d0-f5dd-ed16-5d59e7531fe1@linaro.org>
Date: Thu, 23 May 2019 15:26:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190523024229.1158-4-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::e41
Subject: Re: [Qemu-devel] [PATCH 3/3] capstone: Enable disassembly for s390x
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alex.bennee@linaro.org, david@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/22/19 10:42 PM, Richard Henderson wrote:
> Enable s390x, aka SYSZ, in the git submodule build.
> Set the capstone parameters for both s390x host and guest.
> Install a skipdata hook to keep capstone in sync with the
> instruction stream for unknown opcodes.
> 
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  Makefile           |  1 +
>  disas.c            | 40 ++++++++++++++++++++++++++++++++++++++++
>  target/s390x/cpu.c |  4 ++++
>  3 files changed, 45 insertions(+)

I'm going to put this patch on hold for now, as I'm trying to get this fixed
upstream.  If that fails, I'll re-introduce it here.


r~

