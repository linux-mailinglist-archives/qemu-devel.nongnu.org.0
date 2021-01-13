Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 926DB2F4B3A
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Jan 2021 13:27:50 +0100 (CET)
Received: from localhost ([::1]:55398 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzfFd-0000uC-4u
	for lists+qemu-devel@lfdr.de; Wed, 13 Jan 2021 07:27:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kzfEb-0000Kg-Jm
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 07:26:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:20747)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kzfEZ-0001qB-0T
 for qemu-devel@nongnu.org; Wed, 13 Jan 2021 07:26:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610540800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JZhHWfDQdMFbk/gNjwiRE/D2FZxMUYorlbUKzXcPMvM=;
 b=Fwvs2EZ+bDUe/RttxUGS0bESp/H6zaDcoqySQ7ErHsMrXQkI7P8gAhdxylkp5OmZksi/KG
 jJkfEydXZ8uLDQ1HWMWQ30EekUfgMFY3QxkeZcaej2Ofu8u1f/FdSvOH9M34M+j1UBuGz/
 KlR5QDtCmJKTUf4HEWMW6SJlfBDW4uo=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-570-vJXavx8pNOuJlsgL4-eCUg-1; Wed, 13 Jan 2021 07:26:38 -0500
X-MC-Unique: vJXavx8pNOuJlsgL4-eCUg-1
Received: by mail-ej1-f72.google.com with SMTP id f26so810304ejy.9
 for <qemu-devel@nongnu.org>; Wed, 13 Jan 2021 04:26:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=JZhHWfDQdMFbk/gNjwiRE/D2FZxMUYorlbUKzXcPMvM=;
 b=a+5D9v/NxtzgTaFDjZugNM/UH4tsGbIpUdSJH1xRpgQ6q/AzOS+dE2uDUGSHd/HUlj
 RiZqO+X1TMz4tj2Jk+3veOQXfW6EwM9P7rRsJvdLYzqDpjwIN1wXHlfDzVOqV2IggECz
 m7J8DGLWYF3a0oFRinXPHt8Cp6Yfd35ZRwDcyrTp9hIsZ5xSltuFOv6MxNQTiNjtgNRT
 iT0y5EjcTlfzkDra/CIg6J7tOdzq5n0+PfDUYCEi1eTuzxKRaGhc2KYi1xxOU62T+y0y
 j/CIG/YM43DMT0TOst3Suckuee1oaF9e1uvFqWzR8YJCkbhvm1brwFN/5QfOVJ2Kbffi
 zjYg==
X-Gm-Message-State: AOAM532ljNItpCoz9qtFUTuNKx0BWVl7YoX89EOd1jiS21ATeivHursW
 FFcFNruI2ysXxp1Z8ns9KwK6VEDdT8pad7itYddMd431DmtTIQYC2A3u1wNV/dj6hYlGZ3+kUu8
 eAuIFGgmHNh4S13k=
X-Received: by 2002:a17:906:5958:: with SMTP id
 g24mr503029ejr.217.1610540797405; 
 Wed, 13 Jan 2021 04:26:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzC1u8A4dlViR2cRtAh9m9t3o1Rl6qTzKmMjz5TMd0LU/JWQW6f3MbZDk0Mg0QkgMjyEEmjVw==
X-Received: by 2002:a17:906:5958:: with SMTP id
 g24mr503004ejr.217.1610540797077; 
 Wed, 13 Jan 2021 04:26:37 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id l14sm777478edq.35.2021.01.13.04.26.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Jan 2021 04:26:36 -0800 (PST)
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210107140039.467969-1-pbonzini@redhat.com>
 <20210107140039.467969-9-pbonzini@redhat.com>
 <20210113103143.GA1568240@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH 8/8] configure: automatically parse command line for meson
 -D options
Message-ID: <4acc194b-04cd-3276-3cb9-44b133095bee@redhat.com>
Date: Wed, 13 Jan 2021 13:26:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210113103143.GA1568240@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: marcandre.lureau@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org,
 stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/01/21 11:31, Daniel P. Berrangé wrote:
>>
>> - because we need to run the script to generate the full help, we
>>    cannot rely on the user supplying the path to a Python interpreter
>>    with --python.  For this reason, the script is written in Perl.
>>    Perl 5 is universally available as "/usr/bin/env perl", while
>>    (even ignoring the Python 2/3 difference) some systems do not
>>    have a "python" or "python3" binary on the path.
> 
> Can't we just use  "/usr/bin/env python3", and if that doesn't
> exist in $PATH, simply show truncated --help output, with a
> message requesting that they pass --python to see full help.

We can and it's what the RFC did, but I found it to be ugly for the 
user.  For example the rest of the build defaults not to "/usr/bin/env 
python3" but to whatever Python interpreter /usr/bin/meson uses.

Not that Perl is pretty, :) but developer ugliness ranks a notch lower 
than user-visible ugliness.  I cannot think of anything else that is 
already required to build QEMU and can parse JSON.

I don't expect this script to see any change ever, except for 
occasionally updating SKIP_OPTIONS.  Meson introspection data is 
backwards-compatible.

Paolo


