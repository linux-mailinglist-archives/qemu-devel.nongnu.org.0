Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 521DA64755B
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 19:08:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3LIG-0005mF-FW; Thu, 08 Dec 2022 13:06:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3LIE-0005lz-GM
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 13:06:46 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3LIC-0007tU-RL
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 13:06:46 -0500
Received: by mail-wr1-x430.google.com with SMTP id d1so2560491wrs.12
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 10:06:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FkWCgw8KTDMYyTsT29MpQ8HXAmZnFjVvrLN4fandSsk=;
 b=ymDgQgPsnLl1aYhs2nOIr7JRtkjwymVYYtKhiw91ODtGhpfMSIQ1v2MfbLaQUpGEe5
 c5TEnQxju67PxLC4RET5qxrdxu5E1myQ5v5x6A5EwIb8BfQQ3UjWLwFzaGpcpmHtmiRY
 PHo4tfQyGvY6986p3nwh/SFnrj/JSgKpNBX7KJLDJplkNNremJioaIb2H1ZenGO2L86c
 EKpJd9s8BXaLwypTYyPTc06gSgsza72AUkGCfOsyjiCyYtIcHsgoSHbSHtvK//XdcwKq
 3+RGEh+v/7Y/40IRFWb6mHmnmYySfwSa0krEjKJN+J0HR987vAecqrsNi7a+hm7c2TDb
 Rukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FkWCgw8KTDMYyTsT29MpQ8HXAmZnFjVvrLN4fandSsk=;
 b=vI5SiwjvtzSAsWCZBNqMT80nlUM/4PNumqQC9XMde8LIYbQoUaAUFVYJpTv5fshncL
 J1A6VT3CiG+LGiONZI6K+NsWImvAA4Q0a1NWbjTjEOL5cK45xkbamkqY0bAYWAQEz6Oe
 6KEDy3H+6l/H5QhEmEeCLvCDCZTKdKukbeKfc7T9wT018jWHEhYhRIwnTxIgkopNjO3y
 PEp8jgeaggC6FqU1EjD1SL0Enozmcsu/uOuUdSO/esRpTBqx80ya75HeYS8qKdOstRDZ
 a+bJKRPdTwqyk/ojD8EqGI00nFvxfWKPBao+3T23QhjjlKlcVukKQbXrI/3+ISaJ76ej
 V/UQ==
X-Gm-Message-State: ANoB5pkNo1V2/4t+Ll32wDbAaHlUYJ9+F3WpMwJZfKhSbb2QyNOpcnpq
 u7a2PstX/ieCQbEQSFBT6mfyAw==
X-Google-Smtp-Source: AA0mqf67xNrXijtGgM7kcfbH+hKNohgR1Yj31hi7DbW/U/C8H4JY8+B7VIbYMdeRvTt2KvQQsI4fjg==
X-Received: by 2002:a5d:4b0b:0:b0:241:fd7c:4ce4 with SMTP id
 v11-20020a5d4b0b000000b00241fd7c4ce4mr2082582wrq.21.1670522803181; 
 Thu, 08 Dec 2022 10:06:43 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 i2-20020adff302000000b002421a8f4fa6sm22582790wro.92.2022.12.08.10.06.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 10:06:42 -0800 (PST)
Message-ID: <03745f02-d6e4-aba6-3ad9-e1443934a85f@linaro.org>
Date: Thu, 8 Dec 2022 19:06:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] scripts/archive-source: Use more portable argument with
 tar command
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 qemu-trivial@nongnu.org, Thomas Huth <thuth@redhat.com>,
 Eric Blake <eblake@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Beraldo Leal <bleal@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
References: <20221208162051.29509-1-philmd@linaro.org>
 <Y5IbuSk3Pnf4cdHy@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y5IbuSk3Pnf4cdHy@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
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

On 8/12/22 18:15, Daniel P. Berrangé wrote:
> On Thu, Dec 08, 2022 at 05:20:51PM +0100, Philippe Mathieu-Daudé wrote:
>> When using the archive-source.sh script on Darwin we get:
>>
>>    tar: Option --concatenate is not supported
>>    Usage:
>>      List:    tar -tf <archive-filename>
>>      Extract: tar -xf <archive-filename>
>>      Create:  tar -cf <archive-filename> [filenames...]
>>      Help:    tar --help
>>
>> Replace the long argument added by commit 8fc76176f6 ("scripts: use
>> git-archive in archive-source") by their short form to keep this
>> script functional.
> 
> Or install a better tar implementation from brew ?
> 
>    https://formulae.brew.sh/formula/gnu-tar

Good idea, this works for me:

-- >8 --
diff --git a/scripts/archive-source.sh b/scripts/archive-source.sh
index 23e042dacd..150bdf5536 100755
--- a/scripts/archive-source.sh
+++ b/scripts/archive-source.sh
@@ -20,2 +20,3 @@ fi

+tar=$(command -v gtar || command -v tar)
  tar_file=$(realpath "$1")
@@ -69,3 +70,3 @@ for sm in $submodules; do
      test $? -ne 0 && error "failed to archive submodule $sm ($smhash)"
-    tar --concatenate --file "$tar_file" "$sub_file"
+    $tar --concatenate --file "$tar_file" "$sub_file"
      test $? -ne 0 && error "failed append submodule $sm to $tar_file"
---

