Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 848A72DAEC6
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:20:47 +0100 (CET)
Received: from localhost ([::1]:33206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpBC2-0001jh-Hs
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:20:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34426)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpB5s-0003OX-R7
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:14:24 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:36754)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kpB5r-0007br-5D
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:14:24 -0500
Received: by mail-ot1-x343.google.com with SMTP id d20so1484497otl.3
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 06:14:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mxSP3kFM7PYG2X3Xvc5Q+8/V1v1oyvnId/RXHuZQRWo=;
 b=fV2YmI952lufK9e+eyVRtJZmjiCdyZNvvFXsyOcyQfQD/h/JT49wroGtIZoJp9uD89
 G8Gi32FXD3KByJuQ6qegR6W+NdaRGHXbrVQ9unZoEp5tMeEpV3FwaaoPNhnoO+qTangi
 SJeQkONy7qqGt69XoCWaL2TQkeJaCFkfr3+IW7PKSsrM2ZLC1HMeurFrVB0L+dtlFxWk
 xrBqkN0Xgl2sVw8kdZ/JSpdwC3bEa8iZndymKbfTqXj3ZaafDrV83jxYXMjWrL/j/r8w
 tRwsfm4LeJfX6ktDH7MP8SaOz75CYRJbLGvnEOWP6gAQZH5i2ccp2nlrABwWo9liftQE
 ATRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mxSP3kFM7PYG2X3Xvc5Q+8/V1v1oyvnId/RXHuZQRWo=;
 b=KmC/N6ki4Tpl+yCCdXGWLyaBacPwoaC4R/o8ThFLjFsDegXooWwQdxJtAkfwYN5cZS
 SzQ63IN+9KTnb1HB8jiwggF4TXQHrFUoiPt1Wk4URlSxqY5Ewt+4zvh0He5wSR6+YpX/
 qBaC+Q42l1mg18lFX0ACrVCJ65+d08YRfEIGDu4ftNGC3jxnEKJ5q7gxWU4gooZYNfeX
 arrEiOr2CzK+vl7Ln9Q4nQSWx/nU5qZoKJV6WgMgutmtTTfLzs5c45wbLO/1gcX/ButC
 GdMxuvQ8Eb4v46yXWbF3nO1bRKbjwoL3H1vznETkNDJoFWElHHHV6h0y3f8dIW0Ghgju
 BReQ==
X-Gm-Message-State: AOAM5310pdOEeGIwvN5JSlr76Tj8tVgcwlr2aNFzwVHfn8k0bjFpCUku
 OZFVwlKbzLrbAVJiOSxTFHI+9g==
X-Google-Smtp-Source: ABdhPJxPVdLqgoucY7TCXjLsFxLSkdajXZ5cb1t/Q0TlwVl6oVZI05fXJy+pkozxqeqMRL46/egGqQ==
X-Received: by 2002:a9d:590c:: with SMTP id t12mr22974744oth.308.1608041660340; 
 Tue, 15 Dec 2020 06:14:20 -0800 (PST)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id p4sm5102367oib.24.2020.12.15.06.14.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Dec 2020 06:14:19 -0800 (PST)
Subject: Re: [PATCH v2 15/16] target/mips: Extract FPU specific definitions to
 translate.h
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20201214183739.500368-1-f4bug@amsat.org>
 <20201214183739.500368-16-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <14fc4112-a7da-0665-4009-ae3c6e8dbbe3@linaro.org>
Date: Tue, 15 Dec 2020 08:14:17 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201214183739.500368-16-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x343.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>, kvm@vger.kernel.org,
 Huacai Chen <chenhuacai@kernel.org>, Laurent Vivier <laurent@vivier.eu>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/14/20 12:37 PM, Philippe Mathieu-Daudé wrote:
> Extract FPU specific definitions that can be used by
> ISA / ASE / extensions to translate.h header.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  target/mips/translate.h | 71 +++++++++++++++++++++++++++++++++++++++++
>  target/mips/translate.c | 70 ----------------------------------------
>  2 files changed, 71 insertions(+), 70 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


