Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D98A1956F
	for <lists+qemu-devel@lfdr.de>; Fri, 10 May 2019 00:52:33 +0200 (CEST)
Received: from localhost ([127.0.0.1]:33823 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOrtw-0004wP-AS
	for lists+qemu-devel@lfdr.de; Thu, 09 May 2019 18:52:32 -0400
Received: from eggs.gnu.org ([209.51.188.92]:38106)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hOrsV-0003Zg-7c
	for qemu-devel@nongnu.org; Thu, 09 May 2019 18:51:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1hOrsT-00087U-Kd
	for qemu-devel@nongnu.org; Thu, 09 May 2019 18:51:03 -0400
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b]:34549)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1hOrsT-000878-4S
	for qemu-devel@nongnu.org; Thu, 09 May 2019 18:51:01 -0400
Received: by mail-pg1-x52b.google.com with SMTP id c13so1965342pgt.1
	for <qemu-devel@nongnu.org>; Thu, 09 May 2019 15:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=yvRqqDAqHNuZNYnIgDuR6IPFZqm4fCF5M05PO5Ov/MY=;
	b=RDXF7T0saPCn2PF9MTcyyj+zhYbDrTsY8ForJKOAkIDuU2IYhJhaHlPDtVeGdPgbtz
	IUAPw4Os6xA3UOuR8HURjaFMVdw5n73VuTiZ64hVPrBEWnpj/Nm3tKhAqqvgt//nV4vB
	GYD+SMGS/Yd15IMdMTvOWnFanLqgwixgi0tpV0k/rXlqV4cbQdQawRCrCBJNccxIx25B
	++aKoczHq36J/JmSSLZkxaGGvX5Knp7jE1E2jaFiYlkObfyH2wAB6I4Dc+59JJB38h/N
	YZxg6S0TQga/YSvoYw7jbKniXEG9gigki99+SfDY7yy12X1Q7wFFo/TxZobYbfoZnLwO
	EvQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=yvRqqDAqHNuZNYnIgDuR6IPFZqm4fCF5M05PO5Ov/MY=;
	b=Z3SIWJdLhhgyOhzcoD9KJMg9TxnsD+NrTReqBYWSm6TJBIzmLDUZPyeUrIb6OG5iqV
	G3C+WgHgMgFzEmQu+TnXMzMvQCj1uR2qQz6Fr5aWFpi3ZHlM7hMvTCUTX1p2JvoyBVab
	VyvVQpA0frbeQH1hGM4kFna9uAP4uCK7bneGDF7tjVpW076SE3mFvh5fa7eq2cv6dLDR
	zp6rvGmsZgYWeblmFeuPX3GTpufaAZFcWMJuzwGIxUolXUAcrSXseBR2XDtTHHZ/vCgV
	TTR4kYfWmKFDSZiomAoGqhBi4lOYQLo0b6navVBWgJHjAC3uplxjkp2u8hkXWV7ucTrG
	Hf6g==
X-Gm-Message-State: APjAAAWmp0+3JDrGD6E29XwU/znxYFzA1gq29qmUboYf6T9Xvz+NxIva
	BdFqu1rNxcBc+WMlXiSRScj4WMZSGWQ=
X-Google-Smtp-Source: APXvYqxFJz3eOsOLQsarRe90UeuFecPOzRsTF5uDftq+4ecZUb1FKD1kwd0qVw93vq/cAhy8MVDNFQ==
X-Received: by 2002:a63:27c3:: with SMTP id n186mr5732580pgn.189.1557442260074;
	Thu, 09 May 2019 15:51:00 -0700 (PDT)
Received: from [192.168.1.11] (97-113-13-231.tukw.qwest.net. [97.113.13.231])
	by smtp.gmail.com with ESMTPSA id
	g188sm4382446pfc.151.2019.05.09.15.50.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 May 2019 15:50:59 -0700 (PDT)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org
References: <20190509165912.10512-1-alex.bennee@linaro.org>
	<20190509165912.10512-7-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9a4eabac-07ae-81d3-a473-0c261744bf96@linaro.org>
Date: Thu, 9 May 2019 15:50:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509165912.10512-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::52b
Subject: Re: [Qemu-devel] [PATCH v1 06/23] editorconfig: add settings for
 .s/.S files
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/9/19 9:58 AM, Alex Bennée wrote:
> We are starting to add assembler foe tests/tcg so lets make sure we
> get the mode right.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  .editorconfig | 5 +++++
>  1 file changed, 5 insertions(+)

Yay, thanks!

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

