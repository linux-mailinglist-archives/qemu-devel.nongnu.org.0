Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BA7718FC8
	for <lists+qemu-devel@lfdr.de>; Thu,  9 May 2019 19:59:13 +0200 (CEST)
Received: from localhost ([127.0.0.1]:58880 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOnK4-0007w5-Hd
	for lists+qemu-devel@lfdr.de; Thu, 09 May 2019 13:59:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35052)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hOnEm-0003Uu-2A
	for qemu-devel@nongnu.org; Thu, 09 May 2019 13:53:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hOnEk-0006gb-3g
	for qemu-devel@nongnu.org; Thu, 09 May 2019 13:53:43 -0400
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633]:45105)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hOnEi-0006at-5D
	for qemu-devel@nongnu.org; Thu, 09 May 2019 13:53:41 -0400
Received: by mail-pl1-x633.google.com with SMTP id a5so1486297pls.12
	for <qemu-devel@nongnu.org>; Thu, 09 May 2019 10:53:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=tZspNkHDi8B5NZIIUZTWWcNPDy926n62xxi1IYNKWpQ=;
	b=H/gF1hGhcPgPCwni3wGQ3VFe2MBb/6CQYvgvF2L/ZYQ44H5slIfni5P9qotMqvkOq6
	n3W8uJPEUg/FdBiVuWv0hRsvPEdQ7J4spMEVqPjrYW1uU4ezRROQSC7lL0npJbHVLNq5
	p6ExPE+CffJF+Wu8LkR2Z4qXdlIhaeH7Uxf6sBN9vbQFooBFae+obsEY2GkZKhGwMqD2
	ns8RUHq5CW9KcoGvUvHmAxumUGLJers2eBf7zqNhaaPwRc8MgndbHsvJ0JMpetfcoLPj
	XVs38QOb8ZStZxuWOIXJXLpLj03Bgfy+Scqws70XHnDC2MxEJscEj47YzuwtKzTCKioL
	7zdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=tZspNkHDi8B5NZIIUZTWWcNPDy926n62xxi1IYNKWpQ=;
	b=UsxA998aKRf5Xddm1ofcd2DgNIA8SX0NKFS/7oiujG90j8tdlH3HbnCWt+S5I7O51e
	ScX16f0Psu58u6EciCf0lJtugjVhszkJYQ/jyVG3cXnKZi3+vL/OZ+/bP7IhZ+XvhGxY
	oKrYgEZ5G5czAOKGvyPoP045D0lobDKiLAC6R5QIpUA31t5HF1SYNmxs0RbA6aCcTk3W
	qC1RfqhIhGZ1j1V+veiQGs9NlsXgqVb5YKBeaJy01Q1ju74EXKf67b2Uo3p+SzZ+xHW+
	uGlXLJRjVlEpLFiMYceklVJ58+oWKfl1QPh3LoTxIsBM1l/TA7Kt/SvNHdjR/aOIN2Tt
	Jc2A==
X-Gm-Message-State: APjAAAUmQ8jDxFybY1k7mbrtvnw6wYAzYpHP4WtQkGWUnKpue3zRA/zd
	9POmRNFynHgeI6EPlSiXVDLP/w==
X-Google-Smtp-Source: APXvYqwmo/IyNC7Dy2evI+0thCJTFVfN03rAch6TRCyrTzuanFjUw9FP6rH/cdfOjb7Ci7EE142X+w==
X-Received: by 2002:a17:902:521:: with SMTP id
	30mr6810185plf.248.1557424410953; 
	Thu, 09 May 2019 10:53:30 -0700 (PDT)
Received: from [172.31.99.192] (50-248-210-99-static.hfc.comcastbusiness.net.
	[50.248.210.99]) by smtp.gmail.com with ESMTPSA id
	i27sm9531986pfk.162.2019.05.09.10.53.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 May 2019 10:53:29 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
References: <20190509165912.10512-1-alex.bennee@linaro.org>
	<20190509165912.10512-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <37051934-a02b-1461-537d-9f6ed93ae4a9@linaro.org>
Date: Thu, 9 May 2019 10:53:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509165912.10512-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::633
Subject: Re: [Qemu-devel] [PATCH v1 02/23] tests/docker: Test more
 components on the Fedora default image
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
Cc: Fam Zheng <fam@euphon.net>, qemu-arm@nongnu.org,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/9/19 9:58 AM, Alex Bennée wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> Install optional dependencies of QEMU to get better coverage.
> 
> The following components are now enabled:
> 
>   $ ./configure
>   ...
>   Multipath support yes
>   VNC SASL support  yes
>   RDMA support      yes
>   PVRDMA support    yes
>   libiscsi support  yes
>   seccomp support   yes
>   libpmem support   yes
>   libudev           yes
> 
> Note: The udev-devel package is provided by systemd-devel.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Message-Id: <20190504055440.20406-1-philmd@redhat.com>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/docker/dockerfiles/fedora.docker | 7 +++++++
>  1 file changed, 7 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

