Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B982630C177
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Feb 2021 15:26:11 +0100 (CET)
Received: from localhost ([::1]:48856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6wd7-0004Qg-46
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 09:26:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:42976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6waH-0002ot-1y
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:23:13 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:34453)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l6waF-00010J-1m
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 09:23:12 -0500
Received: by mail-wr1-x42f.google.com with SMTP id g10so20671035wrx.1
 for <qemu-devel@nongnu.org>; Tue, 02 Feb 2021 06:23:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=ORFFKapUs2A3GKthcQYvFg5S87VWZ68MMEOnf6qtLsg=;
 b=Mg4RZBv3kdj8U0NXuucVTAThQUQhGxUYXnLiHRpuFU7/94QXIeJ/esnArWUIkuCS/+
 7ReFjoB3+0NVx8cDsxl1nc7VoMWUS7K83uzP+VsXWL2roH/Y2oElVeyNgcEe/0A6W/ES
 aOtJ+jA+PxGYTIwkeyhzvGJ12rNhR8es4LbwO1AirQCPWqxq62g5+qIEFwcTB4inPFOO
 UxIL8Vm6+t5rdbVbMGzfYN6SDvXr8hzClrYHeTXLq+DOlaJNGuyAi50HnezKmzTI+6jr
 QGBt7UHujqr/MAr/1efy+b3+hCQtT/m4fMw8QHzjXavSUkZDFllSnwQrwGjYqCNt8s7k
 ZaXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ORFFKapUs2A3GKthcQYvFg5S87VWZ68MMEOnf6qtLsg=;
 b=i1ljfUQOqNUWeXh0F5JJ6okne/ZXXhOFb2NwlV+fOnoBUISvUGPPMqqChZwPIt9Ygp
 9lfmJDk4NsDjHXXQj8D20Qc5MAn/+xrV/jH32Z4G94f4zQB0b0Nn6E35Si6YxjnTUaU8
 SRFArkfwWWN0atbY/3H3qIKWT16o5u385HRepa8Xig1RBsIwtV1XVhBX62n7W8TjKVJc
 039snVbv+TfZJB1M8BhtLrpDTh2kywNgCG5rwiQ81qILklGYwx14vDAiAbZb6tRsw2TV
 1OO+7CfFsUs4nacP33l6ri2FOSOSxtDNY7ECPFx27eHoYMmSOuEzrRsIUXDhKST5i4Rt
 Uqrw==
X-Gm-Message-State: AOAM533+6nN0+GLo1peKp7fGMEGjcc7t5le9UzuHt1DonllvC5OPslD3
 LUvsdb00zjdM3BJpOAOd2NeIu8imNiU=
X-Google-Smtp-Source: ABdhPJzK4tQ8okfEE9N/0XYdOeudAs9KqZgNVb+62A2l9tLeoEbMnXsTbRf02IsOy8EU8BDQr2+K0w==
X-Received: by 2002:adf:ab10:: with SMTP id q16mr23736113wrc.297.1612275789399; 
 Tue, 02 Feb 2021 06:23:09 -0800 (PST)
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net.
 [83.57.171.7])
 by smtp.gmail.com with ESMTPSA id i6sm32918747wrs.71.2021.02.02.06.23.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Feb 2021 06:23:08 -0800 (PST)
Subject: Re: [PATCH v1 11/15] tests/tcg: Replace /bin/true by true (required
 on macOS)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210202134001.25738-1-alex.bennee@linaro.org>
 <20210202134001.25738-12-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <15438de7-ad2a-b0c3-3d35-1e78c6b1ce13@amsat.org>
Date: Tue, 2 Feb 2021 15:23:07 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210202134001.25738-12-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.155,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Stefan Weil <sw@weilnetz.de>, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/2/21 2:39 PM, Alex Bennée wrote:
> From: Stefan Weil <sw@weilnetz.de>
> 
> /bin/true is missing on macOS, but simply "true" is available as a shell builtin.
> 
> Signed-off-by: Stefan Weil <sw@weilnetz.de>

Reviewed ... :
https://www.mail-archive.com/qemu-devel@nongnu.org/msg777004.html
... before Peter:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg777010.html

> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

His tag is and mine isn't... Is it possible this is a b4 bug when
names use UTF-8 encoding?

Again:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20210128135627.2067003-1-sw@weilnetz.de>
> ---
>  tests/tcg/Makefile.qemu | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/tests/tcg/Makefile.qemu b/tests/tcg/Makefile.qemu
> index c096c611a2..a56564660c 100644
> --- a/tests/tcg/Makefile.qemu
> +++ b/tests/tcg/Makefile.qemu
> @@ -90,11 +90,11 @@ run-guest-tests: guest-tests
>  
>  else
>  guest-tests:
> -	$(call quiet-command, /bin/true, "BUILD", \
> +	$(call quiet-command, true, "BUILD", \
>  		"$(TARGET) guest-tests SKIPPED")
>  
>  run-guest-tests:
> -	$(call quiet-command, /bin/true, "RUN", \
> +	$(call quiet-command, true, "RUN", \
>  		"tests for $(TARGET) SKIPPED")
>  endif
>  
> 

