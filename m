Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28D46DEEA0
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 16:01:13 +0200 (CEST)
Received: from localhost ([::1]:42606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMYFC-0006VQ-HE
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 10:01:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43874)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <laurent@vivier.eu>) id 1iMYAs-00036T-89
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 09:56:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <laurent@vivier.eu>) id 1iMYAq-0005y0-M9
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 09:56:42 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:46649)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <laurent@vivier.eu>)
 id 1iMYAo-0005xC-E3; Mon, 21 Oct 2019 09:56:38 -0400
Received: from [192.168.100.1] ([78.238.229.36]) by mrelayeu.kundenserver.de
 (mreue009 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MK3eI-1ibSxh25gU-00LZhb; Mon, 21 Oct 2019 15:56:35 +0200
Subject: Re: [Qemu-devel] [PATCH v1 3/4] elf: move elf_ops.h into include/elf/
 and rename
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
References: <20190910193408.28917-1-alex.bennee@linaro.org>
 <20190910193408.28917-4-alex.bennee@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Autocrypt: addr=laurent@vivier.eu; prefer-encrypt=mutual; keydata=
 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
Message-ID: <504e63b8-da0a-ff2b-d768-e268f016afb4@vivier.eu>
Date: Mon, 21 Oct 2019 15:56:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190910193408.28917-4-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PLOCpTZlJ8SG9/8bc+7OMb0pwx3IndN2+fy5xyPNIBDU76AN0QF
 UkHyC6+tReFR0ZhHrtB3E/nCqq6boAczrJKWERmCM2iPhd5kLIMiypPJgj3+4xrY+bkTh+5
 F+X2+c3IqMCc+3dB/FFJJ+EkUOwqsVn8NKEYkY2yoRFRKYbzgrFfFI4guN1LUYeuzGpLLdQ
 hKNP3k7nMh2ZhW7x8UJyQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:ggnkFmVbEsU=:FwoRN64t7Lfc3CwTdvfPpW
 xQJYHVQTCBeLnugp3QiXnhy8HP+99PC7uoLE4BxQU5njNbmUjkPjynHGPAPX1ISClcjpyUJGo
 YbFb2V22VTDLrPQn23ejDkRZ3P8p4llETAR+eCxuLYJeLPztHgE2qSCOoMsUVU2OkIvedhDeO
 zIHCztnhfVuUmACfTKMMQFfty2KMGYkASjbTJE57+OKr7ELpQCPh2vMAHnfjuzOROibqfhCl4
 l3kAy+dnrb3D/s5FJYWMypb7j/TRzOttO0Eq0XkP1mEHjFQDg9OJW0FbQg5NDifWsQflEU1/8
 aqXIaMdefriyjMRtbcvKyYzcOeDlxxiSHgGwTNwkJXXGWLcHsb+Y6muDXL13Jm0+xpz1/2Tlm
 2AXLR3y+mLtSZqCu5h9PpKSGmlIJzANDG/ZcSchB26G/B/b6/o+WTcmRYBnvZAuG2xzqL7O6P
 QEz9Z6+0nM5Vht09qIqfax0ynIAyXoDtvOc/yD5jAIHphyczGf9HGmMAJKQBDQEfkJ8nfc0Xz
 G2Pq/x0JUaGoQ2bwHLPeuF4PUE5HJqscME3CiQ1nwNVJASIVI5WKjAxlaYrf2KHv7UBoIaHQi
 GwBYH8Lv5AVnmg7/xQ8qaZQO/3yqAsMo0cOj1rSjVgNFNPBJkYU6X4+df2/492Tz22t5yOYQG
 qjLESzmUpFGl6s8CUA/HIZuwZBzDtzBjSLw/XumO7uLr66XQ1uK5mM06+1HS9XInuo6uRFJMG
 UKYG05iN57LLpMeX4ZrV8cHa9vnkkjAllTXDqPHM3/nu0zsjZoYOEN2RjKU40p94ZHbM69mPT
 F1JTCEyq3Ob4vMnmRpOReWy0Y/nPLrneJ8wSOB89hvzZpOgQ3/6AYIoRt4W+e07A7STUw5LaT
 Tf14jbjv+oHuGp2/Uc2MRy5+nJfU5rRWd2j71gPaM=
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.227.126.187
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
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 10/09/2019 à 21:34, Alex Bennée a écrit :
> Lets keep all the Elf manipulation bits together. Also rename the file
> to better reflect how it is used and add a little header to the file.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  hw/core/loader.c                            | 4 ++--
>  include/{hw/elf_ops.h => elf/elf_ops.inc.h} | 9 +++++++++
>  2 files changed, 11 insertions(+), 2 deletions(-)
>  rename include/{hw/elf_ops.h => elf/elf_ops.inc.h} (98%)

So the question is: what the ".inc" reflects for a ".h" file?

Thanks,
Laurent


