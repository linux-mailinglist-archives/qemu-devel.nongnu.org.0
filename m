Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 012813891D8
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 16:48:00 +0200 (CEST)
Received: from localhost ([::1]:40304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljNUN-0002rC-3l
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 10:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ljNS3-0000xr-MB
 for qemu-devel@nongnu.org; Wed, 19 May 2021 10:45:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:59504)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1ljNS1-0001NR-EQ
 for qemu-devel@nongnu.org; Wed, 19 May 2021 10:45:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621435532;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Ffut/mwT0skBaBHfa0WOn3fo4Z7Y5/8YJd6XXkw9TpU=;
 b=PPgDj8Hh9bnsWPpMoKiUez6lDSQpR9Gz93yhw4W+sdI+3Q48E5NoT1P8mkxE84pgYLfe+M
 iN50b7batUHbIRieY7jZr0wW5hvE+tlcLE5R0Ms27HBzGz8vRBeZwQMkhCewn+NjqA0qmf
 lsJsMuQ+XUdZlr5rhdjIyLBnk7FlPLQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-522-l4b8T1B5PWq63ahv4Va9Rg-1; Wed, 19 May 2021 10:45:30 -0400
X-MC-Unique: l4b8T1B5PWq63ahv4Va9Rg-1
Received: by mail-wm1-f70.google.com with SMTP id
 w7-20020a1cdf070000b02901698cfc1c04so1670976wmg.6
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 07:45:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ffut/mwT0skBaBHfa0WOn3fo4Z7Y5/8YJd6XXkw9TpU=;
 b=HB3KYY5xDb4Ikau1YYxX6n+SsKmRVsRDW6K/GK//5hx0C8jP795eaF2PyUGTsl7xS4
 h+bGNtIn6C94eBWM4dhZuw83zotiNI87fsDGcPeH6uQNXHFVNIJV/VD7QrSynbQXiDkx
 KSl+flmbXBctIoUBzUQ8SLVnGGPjcYCGVjP3AuhFjH5CqT3/Hmm4jH552fAN7mVrVgiA
 3DhHUfKjEkJ8HzxhY7086R8CQUBZ/KyI8uNpPuzP4hB6oSlYNtdafjhbIjTOkfrI9tGj
 vCrO4LA+RzC+Uxnqk10UxtmROTNMkWKfa42GCGva4ObkLxAwL4UUnmdQCMrhhVTCcrNy
 tyEQ==
X-Gm-Message-State: AOAM533A9qzeFm9D1/VbFWGXAq4+BgJwLedqgIAtyJHR1lG4x5WipjWN
 c0zaokrMTWNvhBiebOp3Otz/kOrY/j+QX6FCUb+2YP2xbpmH8dhqEP05FgEgp87nxbdUdsN5ykl
 1RU81OR3v2KXZwTU=
X-Received: by 2002:adf:f788:: with SMTP id q8mr14935233wrp.205.1621435529488; 
 Wed, 19 May 2021 07:45:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0ffvm1B2j5x6rjRzifV51UAXsepm+E6BEUX54tLjpRXJi2j1xm6LbryYwXzDBZJCZJZ+T7Q==
X-Received: by 2002:adf:f788:: with SMTP id q8mr14935210wrp.205.1621435529316; 
 Wed, 19 May 2021 07:45:29 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id r2sm27461657wrv.39.2021.05.19.07.45.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 May 2021 07:45:27 -0700 (PDT)
Subject: Re: [PATCH v2] configure: Avoid error messages about missing
 *-config-*.h files
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20210519113840.298174-1-thuth@redhat.com>
 <8ee40976-4f27-0189-7e7a-0e62d022aa6b@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <b2b2db19-8ef7-50f5-d715-b24c17b99a5a@redhat.com>
Date: Wed, 19 May 2021 16:45:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <8ee40976-4f27-0189-7e7a-0e62d022aa6b@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.39,
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
Cc: qemu-trivial@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 19/05/21 14:35, Philippe Mathieu-Daudé wrote:
> On 5/19/21 1:38 PM, Thomas Huth wrote:
>> When compiling with --disable-system there is a harmless yet still
>> annoying error message at the end of the "configure" step:
>>
>>   sed: can't read *-config-devices.h: No such file or directory
>>
>> When only building the tools or docs, without any emulator at all,
>> there is even an additional message about missing *-config-target.h
>> files.
>>
>> Fix it by checking whether any of these files are available before
>> using them.
>>
>> Fixes: e0447a834d ("configure: Poison all current target-specific #defines")
>> Reported-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   v2: Use ":>" instead of "touch" as suggested by Philippe
>>
>>   configure | 12 ++++++++----
>>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 

Queued, thanks.

Paolo


