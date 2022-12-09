Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52B45647E45
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Dec 2022 08:06:45 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3XRm-0000rh-7A; Fri, 09 Dec 2022 02:05:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3XRk-0000rG-Ea
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 02:05:24 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3XRi-0005Mg-M8
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 02:05:23 -0500
Received: by mail-wr1-x42f.google.com with SMTP id y16so4274609wrm.2
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 23:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=66R6v7Y5YhL7LMkZi4OoRhr705SlVFVDiGICgzxYIUQ=;
 b=OPtpy0kVk/aecPgL6O+KzOY6h8/jrHfw6QBhVIibPIEPwePB2fTdi0cbSEjXPngwjc
 EuFshrhkf+mxZneynW8F6IWGHkGmB4yhCjh2vQQ4y5iam69/KBE3V2CINaScoxGpH6rS
 6BRa1QLKo5Uom5Iq+2QIMHT2mw/pU5OWgIxFGxPLiFvxlxK+1OUvmLXZBu+HX4qtZbY3
 HveWWVfHljPYIGoPPCT7c9u0Vq5cC0902uLiV6lzFsnPAan0sg7weZu3/+qzPPIT96Jn
 lh8Yh1GvX5bazjmFiICBLG7nqfb9ndd/9kVYyvhmnWDdJL5NFUq7PKqmYfC8wumSsA4h
 DwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=66R6v7Y5YhL7LMkZi4OoRhr705SlVFVDiGICgzxYIUQ=;
 b=2LHTlPDXZ3GPU7ZyMSQfWvil16fQTGX/6s2FMEVhWfA36FUXO60ev8Wm18lOgIz4ow
 MdEuN3bq/qjF5BjwJLDyX0TVmGrGQGsu4p1nzC3P6165beMX6sYgnHOPY8Icz5I42S6d
 At9uwYP/mAaCP6aQAtm+hPsJnvuxXSW5FlPZO3UnNep8cCuRDC8P7QZaLKXitT6PHVjB
 orjitbAfQc7coo6hikLbAFLP76Sl7t8ujxdS+5s6ZKHwOTxuuODHbn8vS00OvSe54H7+
 uD5VRs7WxnFf2k8Hi4x6hpmQ30Zbh84oDAlqC7lzzkHc51/U2RzR3qmih0E3s2bzTEWm
 Jgqw==
X-Gm-Message-State: ANoB5pn0QztnKTQbjelfvyYgdlTJ34y3wTti+lgeIDYJ6ImisgtHkSv/
 l2QeJ+iPuSCZGaroi2AlGIyrhA==
X-Google-Smtp-Source: AA0mqf5upg3kzYPUBcvT8Eo/1QbMgAp7bEnNHl7dQ//UXjP9JnmSiy49M/b7dpMYTkgHUndX/elK/Q==
X-Received: by 2002:adf:dd92:0:b0:242:4b69:5f8a with SMTP id
 x18-20020adfdd92000000b002424b695f8amr2817614wrl.14.1670569520720; 
 Thu, 08 Dec 2022 23:05:20 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 q22-20020a056000137600b00241dd5de644sm570635wrz.97.2022.12.08.23.05.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 23:05:20 -0800 (PST)
Message-ID: <f7d0caf2-4250-35c1-8996-7e63854bccc1@linaro.org>
Date: Fri, 9 Dec 2022 08:05:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: Target-dependent include path, why?
Content-Language: en-US
To: Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <87edt9gnyz.fsf@pond.sub.org>
 <e797bb33-6f27-d20a-6a35-9372366bd4f5@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <e797bb33-6f27-d20a-6a35-9372366bd4f5@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42f.google.com
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

On 9/12/22 06:24, Richard Henderson wrote:
> On 12/8/22 23:12, Markus Armbruster wrote:
>> I stumbled over this:
>>
>>      ../include/ui/qemu-pixman.h:12:10: fatal error: pixman.h: No such 
>> file or directory
>>         12 | #include <pixman.h>
>>            |          ^~~~~~~~~~
>>
>> Works when included into target-dependent code.
>>
>> Running make -V=1 shows we're passing a number of -I only when compiling
>> target-dependent code, i.e. together with -DNEED_CPU_H:
>>
>>      -I/usr/include/pixman-1 -I/usr/include/capstone 
>> -I/usr/include/spice-server -I/usr/include/spice-1
>>
>>      -I/usr/include/cacard -I/usr/include/nss3 -I/usr/include/nspr4 
>> -I/usr/include/PCSC
>>
>>      -isystem../linux-headers -isystemlinux-headers
>>
>> Why?
> 
> Because of where [pixman] is added as a dependency in meson.build.
> If you want to use it somewhere new, you've got to move the dependency.

Code involving virtio becomes target-specific.


