Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF1AA30EF2D
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Feb 2021 10:05:35 +0100 (CET)
Received: from localhost ([::1]:38912 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7aZy-0000B3-Oc
	for lists+qemu-devel@lfdr.de; Thu, 04 Feb 2021 04:05:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7aYa-0007cA-7Z
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:04:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:25339)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1l7aYY-0000JU-Jj
 for qemu-devel@nongnu.org; Thu, 04 Feb 2021 04:04:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612429446;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=prFtmxhXSbPVywAIj7CIwTzuuebQN+6fxfjzjL+DO3o=;
 b=SmHbiy9hcgJxRP1iqtNGc9sqsq/foQdiIEtuDWtxKwWYYY0PGgn/plaFdMTZ6+2JkBY/tC
 sjKC1iT6+zyaKJnce+g6ze9VfQOmOlWi2GMAvap0HEckqowJV1Vj5SViO3ykhpQfOPYi0x
 Dj2cfybRRMSAaHMIXh2mlN7UJmeZE7E=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-hpc1WzGXOGuL0wPZXv14hA-1; Thu, 04 Feb 2021 04:04:03 -0500
X-MC-Unique: hpc1WzGXOGuL0wPZXv14hA-1
Received: by mail-ej1-f71.google.com with SMTP id gt18so2112636ejb.18
 for <qemu-devel@nongnu.org>; Thu, 04 Feb 2021 01:04:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=prFtmxhXSbPVywAIj7CIwTzuuebQN+6fxfjzjL+DO3o=;
 b=dKITtAeU41hUl/W4GIl11qY3QbxxHQZnTPgcrLRKFGx79EAjNgZUhnalS/igAYU275
 5g7UzoG0fADnq388StlouR/TAo3vfUBm3LLO2lKdBwUmrrMYbjlaoKGQbVQhJH0kVDx5
 R+zM8aUa8PzZv/Q0g9382li4BK39i0l9pyQI+PkeeJav+1A0EJ+7JkjgmXuTT1/oKp7O
 rxhdIHghUpBmbwBJdVzfNqCk2gzS28otlPu5jk59nl0CA+hXlHjWswY/kxzIGq8SrRMd
 012Dhj72s9Khwbm+HZrHJ/zDsq5PzcOOWXw8+0evpHy5FjG3aL04AYwmPIuwrmKnkUXV
 c8uA==
X-Gm-Message-State: AOAM531GIQz/H30CYnXQA60VzWPK6zD8hUky/bqS0+aqBevwCPqRlQUy
 V0u0S0gNnJUc3nRH1cHIJdZn4o+TQGQi1lZiRTj16G3sQjB4JCWcGoc7ZUdoMU9XYAEqAJpSox6
 zxBU31ePgiQ+h0hQ=
X-Received: by 2002:a17:906:4c90:: with SMTP id
 q16mr7258089eju.49.1612429442728; 
 Thu, 04 Feb 2021 01:04:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwx7339H3V5Ss2UEGl0Q21oSJhYQbO+w25gthsjRm71BqsRCzMM68mdR/bLR0f5WMG2KFl3dQ==
X-Received: by 2002:a17:906:4c90:: with SMTP id
 q16mr7258059eju.49.1612429442401; 
 Thu, 04 Feb 2021 01:04:02 -0800 (PST)
Received: from [192.168.1.36] (107.red-83-59-163.dynamicip.rima-tde.net.
 [83.59.163.107])
 by smtp.gmail.com with ESMTPSA id g16sm2139450ejo.107.2021.02.04.01.04.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Feb 2021 01:04:01 -0800 (PST)
Subject: Re: [PATCH 01/12] ui: Replace the word 'whitelist'
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210202205824.1085853-1-philmd@redhat.com>
 <20210202205824.1085853-2-philmd@redhat.com>
 <20210203100443.GC300990@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <34cafedf-ff4a-e013-3414-62d7efa418e8@redhat.com>
Date: Thu, 4 Feb 2021 10:04:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210203100443.GC300990@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.539,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.178, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Eduardo Otubo <otubo@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Michael Roth <michael.roth@amd.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/21 11:04 AM, Daniel P. Berrangé wrote:
> On Tue, Feb 02, 2021 at 09:58:13PM +0100, Philippe Mathieu-Daudé wrote:
>> Follow the inclusive terminology from the "Conscious Language in your
>> Open Source Projects" guidelines [*] and replace the words "whitelist"
>> appropriately.
>>
>> [*] https://github.com/conscious-lang/conscious-lang-docs/blob/main/faq.md
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  ui/console.c       | 2 +-
>>  ui/vnc-auth-sasl.c | 4 ++--
>>  2 files changed, 3 insertions(+), 3 deletions(-)
>>

>> diff --git a/ui/vnc-auth-sasl.c b/ui/vnc-auth-sasl.c
>> index f67111a3662..dde4b8d4144 100644
>> --- a/ui/vnc-auth-sasl.c
>> +++ b/ui/vnc-auth-sasl.c
>> @@ -288,7 +288,7 @@ static int protocol_client_auth_sasl_step(VncState *vs, uint8_t *data, size_t le
>>              goto authreject;
>>          }
>>  
>> -        /* Check username whitelist ACL */
>> +        /* Check username allowlist ACL */
> 
> ACL expands to "access control list" so this original comment
> was already redundant, and so is the replacement. Using
> acronyms is bad practice, so I'd suggest we go for
> 
>   "Check the username access control list"

OK will do, thanks.


