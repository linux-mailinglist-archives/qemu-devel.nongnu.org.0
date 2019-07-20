Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0F46F0EB
	for <lists+qemu-devel@lfdr.de>; Sun, 21 Jul 2019 00:28:54 +0200 (CEST)
Received: from localhost ([::1]:53804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hoxqX-0007CX-Nj
	for lists+qemu-devel@lfdr.de; Sat, 20 Jul 2019 18:28:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47847)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hoxqM-0006oF-Fg
 for qemu-devel@nongnu.org; Sat, 20 Jul 2019 18:28:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hoxqL-0001XP-Lv
 for qemu-devel@nongnu.org; Sat, 20 Jul 2019 18:28:42 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:42576)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hoxqL-0001WP-G0
 for qemu-devel@nongnu.org; Sat, 20 Jul 2019 18:28:41 -0400
Received: by mail-pf1-x442.google.com with SMTP id q10so15648171pff.9
 for <qemu-devel@nongnu.org>; Sat, 20 Jul 2019 15:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=soViRtvN32XYNnSuRyUeCMTewVCAyV6XP2kJURpciGs=;
 b=Y87tjjn2TRy3E8jLSAoEXN1VOooP+8Z/jwoi5crjGazhOyRLY4ckoA0/DPEd6vZcj7
 SL7luHpyM81Qug/fAfVu3Wy8zc9ohlsM2dGUL6KYGYI0mxNiQXy7ZMBlnfQhTgG3sly1
 /MKXG+Ix5xRAd0Vk/pmEB42T3VhXas08C6gau5IgLyqHqZcAa1nvUk/n3auki23Tm3pN
 wWR+vSsBbxPZJ+FLVL3cZsdpOVRGlq1GXqoY1PRE1iu5FCmWbBJ2Rmq3Gbnb0xFajlTW
 5fYjCRCjzkOoc9QPBUq5lGp44Nh5tgwznq17aUCbt502DeIfAWpFrcMsBCk26hTcFNiB
 fdRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=soViRtvN32XYNnSuRyUeCMTewVCAyV6XP2kJURpciGs=;
 b=XF79yOQjGK89eyp0fKeS/18SN5v8FczDou/C4bqlEwH3BciTax8eKFsRtgEyfh3A9P
 o39XysjGPN56dT0qxRa2hlhrSbJfI/0EcGfIr7MJLSvyIPghrJfjJRvtRoUouMaUZPkD
 ya/2kl+QkN45cxYyX+WZvrffzkAMqEbCA+kz8w1kzGaEmfz7YLJM3E7ZbZ0U5MxNUFbH
 73fQWNkjAMNSOK5YwpgCBymuiUxnYqyeH3t46vjmu8nWW9hWKrvobsXVf4Rux3RZEEDm
 ndpytFzZpJ7Xn+t3Dkh471QpEWPdjJiKhl41xBILTnVCuD5vw8uzUqsAmDeJilJP5It7
 HASg==
X-Gm-Message-State: APjAAAXVSFF2eORj5qXkWXbk7cTTJFd1vJdwQ0rIlBJF0Xjmnf5iSZHP
 cNikM7BDKDC4uQPRagPOiaWNJQ==
X-Google-Smtp-Source: APXvYqwFCMuFmlmqkulxMxRCqmoEJIMvCddKtzOgk6b0JpSxqmuqapHjWej2Ha6KxOH4wJW5Gu7pTQ==
X-Received: by 2002:a17:90a:db08:: with SMTP id
 g8mr64638280pjv.39.1563661719991; 
 Sat, 20 Jul 2019 15:28:39 -0700 (PDT)
Received: from [192.168.1.11] (97-126-117-207.tukw.qwest.net. [97.126.117.207])
 by smtp.gmail.com with ESMTPSA id v138sm39587078pfc.15.2019.07.20.15.28.38
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 20 Jul 2019 15:28:39 -0700 (PDT)
To: Jan Bobek <jan.bobek@gmail.com>, qemu-devel@nongnu.org
References: <20190711223300.6061-1-jan.bobek@gmail.com>
 <20190711223300.6061-16-jan.bobek@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <620559a4-6124-a3bf-6c10-a0790f8c450f@linaro.org>
Date: Sat, 20 Jul 2019 15:28:37 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190711223300.6061-16-jan.bobek@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: Re: [Qemu-devel] [RISU PATCH v3 15/18] x86.risu: add SSE4.1 and
 SSE4.2 instructions
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/11/19 3:32 PM, Jan Bobek wrote:
> Add SSE4.1 and SSE4.2 instructions to the x86 configuration file.
> 
> Signed-off-by: Jan Bobek <jan.bobek@gmail.com>
> ---
>  x86.risu | 270 +++++++++++++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 270 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

