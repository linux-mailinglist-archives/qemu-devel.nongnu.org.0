Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70936647D37
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 06:24:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3Vrn-0000VK-E3; Fri, 09 Dec 2022 00:24:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Vrl-0000S1-66
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 00:24:09 -0500
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1p3Vrj-0003Vy-I8
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 00:24:08 -0500
Received: by mail-oi1-x231.google.com with SMTP id v82so3598646oib.4
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 21:24:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0NZ59nSDVuo5JY1Vkkj6I5m+3OlHK5BWyT/K81RYUJ4=;
 b=mS0UBGVNzyggol5bMMxRjHhGyIbBKij9O2r6SOcn8p6Wfe46N/1D1oaDGynTrlvbzD
 t+OB6G59cVUUCRu2fjTlrOGq1khvY68NOQc/vvvvR7mrpKHKCC54ceExhKqR8I6bCqGR
 ahEgCEkdDXMRyJpUyAOIIvckAwKYe6S+5LheNg3jxU+EVJ+wEI4a93kkaMntXk+YlISN
 wa0RT/+F2qgietnAdSUmVfMBSHK5z/PSdALcxjN+GhphcihSqwe2BcTroqN/wYrIjtBY
 0FDA0VFBNP/Pe+KbCwxUeCgwrRgBkDdtbAy24qCjaruVfutSmXspQChT772nIM2+nzvq
 Vg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0NZ59nSDVuo5JY1Vkkj6I5m+3OlHK5BWyT/K81RYUJ4=;
 b=tgLJdtv5WDyf5+oHbo99HA/rbFFyjjwXoU2+IbAUNhMtUEnIXUOsy7MvEyrpDhZC0f
 n3P/jgaVrpqCk7CqFXsF9+d8MfOl2RVFizHaNW9SaBMl7moJdbF8CASgKH3XVFVPM3oE
 5Bc4Fok6kVNHfE7lajp7OMm9bvrQp0CtTgloOMSm5HEAl0QNo8KqGZZAno86ky1w8H6o
 TMep9yc3GzvE7OSzqVgowpUjrF6lwuPtDPNwsTw8dKliO5lee0hujAAKPqLNButEqL71
 LZemAYm/lOWoceSyZvRj28rXYrAPsi9xT3dGto819940HLu27XwjoYlPmSEDoN0K9HzE
 ouRQ==
X-Gm-Message-State: ANoB5pnYFx7y3NzLvNDH41hPgOHPsxfdvEmU3IIYheXGvMDFT96Cqvea
 9tFLE7oIkdV37PiljZ2LpK7GSA==
X-Google-Smtp-Source: AA0mqf6zleFGheAKl2Vz5xgGib6nRKHERe1gqRX4mbQ6AANeElO0tp4A9Qi8jFR/hmwKGYHdof0LtA==
X-Received: by 2002:a05:6808:1806:b0:35a:585d:bc6f with SMTP id
 bh6-20020a056808180600b0035a585dbc6fmr2407140oib.10.1670563446161; 
 Thu, 08 Dec 2022 21:24:06 -0800 (PST)
Received: from ?IPV6:2806:102e:18:2efc:95e5:48b1:fe60:b74c?
 ([2806:102e:18:2efc:95e5:48b1:fe60:b74c])
 by smtp.gmail.com with ESMTPSA id
 e84-20020aca3757000000b0035b7002af8csm201180oia.56.2022.12.08.21.24.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 21:24:05 -0800 (PST)
Message-ID: <e797bb33-6f27-d20a-6a35-9372366bd4f5@linaro.org>
Date: Thu, 8 Dec 2022 23:24:01 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: Target-dependent include path, why?
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
References: <87edt9gnyz.fsf@pond.sub.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <87edt9gnyz.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::231;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x231.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.266,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 12/8/22 23:12, Markus Armbruster wrote:
> I stumbled over this:
> 
>      ../include/ui/qemu-pixman.h:12:10: fatal error: pixman.h: No such file or directory
>         12 | #include <pixman.h>
>            |          ^~~~~~~~~~
> 
> Works when included into target-dependent code.
> 
> Running make -V=1 shows we're passing a number of -I only when compiling
> target-dependent code, i.e. together with -DNEED_CPU_H:
> 
>      -I/usr/include/pixman-1 -I/usr/include/capstone -I/usr/include/spice-server -I/usr/include/spice-1
> 
>      -I/usr/include/cacard -I/usr/include/nss3 -I/usr/include/nspr4 -I/usr/include/PCSC
> 
>      -isystem../linux-headers -isystemlinux-headers
> 
> Why?

Because of where [pixman] is added as a dependency in meson.build.
If you want to use it somewhere new, you've got to move the dependency.


r~


