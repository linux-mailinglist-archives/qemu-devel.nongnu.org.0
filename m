Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0EC818817
	for <lists+qemu-devel@lfdr.de>; Thu,  9 May 2019 12:01:14 +0200 (CEST)
Received: from localhost ([127.0.0.1]:51673 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hOfrV-0006Bf-VA
	for lists+qemu-devel@lfdr.de; Thu, 09 May 2019 06:01:13 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37877)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hOfpg-0005BH-6M
	for qemu-devel@nongnu.org; Thu, 09 May 2019 05:59:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hOfpf-0003sG-6E
	for qemu-devel@nongnu.org; Thu, 09 May 2019 05:59:20 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:38156)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hOfpf-0003rs-1l
	for qemu-devel@nongnu.org; Thu, 09 May 2019 05:59:19 -0400
Received: by mail-ot1-x342.google.com with SMTP id s19so1738422otq.5
	for <qemu-devel@nongnu.org>; Thu, 09 May 2019 02:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ZVG8GeKU28IN+eLMx8Z4GGT6uRSXOhHTe17Jgf8LPeE=;
	b=ETgI8eGSDLmT6Xeobh/MwUDDjfGVsfF5DYDdOfqGUHrlTv8CnPgkbrfkESepPq79po
	lMhciPSveugp3dv1S+z1nCkENhdkuxiACKKiojYabeB0RhqBGWVwMigtRatURZd4SkdS
	z1Thym06YXlK8Tq1YsQrqNtiwj/gXotWQ1rioNrNtBeXv8QY6jxJQ2TJSR2RHtAI4gvz
	03in7f8gNKxljYF5rfwMzJUTC/PD8D2g7C+JuPrhLRDgnldOv2QpvofSaJMmIdF61Pgx
	xrEnkWoTrcYeU2yz89EOYiLRyPMFulhYZeVUipae9Yao+pCPx5cjXuQPHrmst2B0EYWy
	ltCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ZVG8GeKU28IN+eLMx8Z4GGT6uRSXOhHTe17Jgf8LPeE=;
	b=gLoY0xzn5otCcC4vt97qBbWNK79IbuW7Efi9OIytY+epXbPL31bucaYNaTQimuCBUq
	jFSS2c2fc3iZMeouK48TQq2HDRza/K8eZGAnDET500dfRCkl6Tcu2X3w0yGcGN5RQkHv
	UULPK2pAOxUk/ueFJCI2SqdXMnDzEZfXDBwIvSpYICYaterH8B2QwKYN7xmivBEbkEf6
	HlWJnWJV76Oy2F1MDTjLLDdgxgs+KJq+PDo2B+bAlGTzzwlH7iFk9F7Tn4zbL+fyLNs5
	WSB66GIEmd5c5V5rKkqWViWRcp+yhNTesEEntdSrAtSmf2LBJ5O3sFxLFoQPkQOU2KvQ
	VMLQ==
X-Gm-Message-State: APjAAAVLITCufRaS3jD1W3EFNWULVA4ZCZQmA+jMVhhzctRhp4QB5CWt
	9riK4/OK2MHeU204Hs/amEb8fo4/SgdOf9JB2ePtXA==
X-Google-Smtp-Source: APXvYqxg6fqxcGgJBqIAa8MPIZbr1pmC2K7JvtNLbywtEdon09v3+syS+UTbOlOASbATM2soeAVDry/oeurcJb2cgxU=
X-Received: by 2002:a9d:404:: with SMTP id 4mr1798565otc.352.1557395958151;
	Thu, 09 May 2019 02:59:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190509060246.4031-1-richard.henderson@linaro.org>
	<20190509060246.4031-10-richard.henderson@linaro.org>
In-Reply-To: <20190509060246.4031-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 May 2019 10:59:06 +0100
Message-ID: <CAFEAcA90r34yxk0J9=no_WVU=mzJLM8FbXt5t=9uS+e-98ybmQ@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH v2 09/27] target/microblaze: Convert to
 CPUClass::tlb_fill
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, 9 May 2019 at 07:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Cc: Edgar E. Iglesias <edgar.iglesias@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Keep user-only and system tlb_fill separate.
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM

