Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B943C7F72
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Jul 2021 09:37:14 +0200 (CEST)
Received: from localhost ([::1]:55728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m3ZSD-0002ye-Sw
	for lists+qemu-devel@lfdr.de; Wed, 14 Jul 2021 03:37:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m3ZQT-0002C4-17
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 03:35:27 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:24008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1m3ZQQ-00061Z-9D
 for qemu-devel@nongnu.org; Wed, 14 Jul 2021 03:35:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626248121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UCwCKgHj6gjgk6gj8AjsQENXq6cM90mRiA3eCcNfDTg=;
 b=R3WD+rQD5Y+qCP254QhQi4N9AyFW6GNkh2OlJh61e4yYLPG9/YWxEtzpCQ2Q+r6VhykROd
 sCgsicN/SW+YGwEUsqxKX1oEf8uI5PuY9kkxMP4wUfpcHHJ9m2h3i5BQaJxYPOqqn/7DKd
 eM/+oA5JgCanD5gO6B0BLBt74obGDjU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-Qq8imlFJPQ2klISeapy54w-1; Wed, 14 Jul 2021 03:35:19 -0400
X-MC-Unique: Qq8imlFJPQ2klISeapy54w-1
Received: by mail-wr1-f72.google.com with SMTP id
 t8-20020a05600001c8b029013e2027cf9aso1010614wrx.9
 for <qemu-devel@nongnu.org>; Wed, 14 Jul 2021 00:35:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=UCwCKgHj6gjgk6gj8AjsQENXq6cM90mRiA3eCcNfDTg=;
 b=PPvT93/iIv0q46rgMAb/kgvEs67sNaiOTV1aEJ1UXtEZdJHAAPl4llUjBpw9ppAtWJ
 xJw4wKIiE+4DA3LAS2n/lA6zp3Dn1QIBGwaX4NmbRoYdgNV0zUQ7xSQ7wX7iJM9ZYe9q
 MKsEgsNNfnB4fMF1cblBKVCHb/GEUJAtziTggTfUvkKpWdce757FyO4GLAo9ZAcnkDiG
 Hu8hFzchb6xbd+4VfVywyjE703wzDs7pvuH+9Vb29qyJRnA34MTLZDXvCoOOXzjfR7EJ
 5zktLrooGBXOXoMtFfFcbjAQLxngJXJUoVv/Nx903DFcz3riz/dPvH4YPxNBKM4X7w0e
 0n0A==
X-Gm-Message-State: AOAM531puYayJYKn2+pjOrwPvP85/cY+145+ykUzi/UlTP1hLihoANo6
 e+rbGIA3EEIMBVFCYsk62g3YN5pkMfEuihF7HPjaVUuk9/cOLM/MMJuzXbVwjgG9RYy7LEME/sf
 js357XliqxwY9788=
X-Received: by 2002:a05:6000:2a1:: with SMTP id
 l1mr10813296wry.128.1626248118134; 
 Wed, 14 Jul 2021 00:35:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9Sxtt4cUKsMEjkI/1Zf8NBVcSpENb45ofKXeyKnTHdYW2ovGJrla7dSN0WZkU6qZBxWx1Xg==
X-Received: by 2002:a05:6000:2a1:: with SMTP id
 l1mr10813269wry.128.1626248117857; 
 Wed, 14 Jul 2021 00:35:17 -0700 (PDT)
Received: from thuth.remote.csb (pd9e83a2f.dip0.t-ipconnect.de.
 [217.232.58.47])
 by smtp.gmail.com with ESMTPSA id y16sm1511546wrw.42.2021.07.14.00.35.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 14 Jul 2021 00:35:17 -0700 (PDT)
Subject: Re: [PATCH 1/4] configure: Fix --without-default-features propagation
 to meson
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
References: <20210713093155.677589-1-thuth@redhat.com>
 <20210713093155.677589-2-thuth@redhat.com>
 <0ea4b6c5-c0f9-9ce2-a291-9cc1171ed93a@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <08771faf-4294-74ff-020f-7827aac3ead7@redhat.com>
Date: Wed, 14 Jul 2021 09:35:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <0ea4b6c5-c0f9-9ce2-a291-9cc1171ed93a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.368, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Cole Robinson <crobinso@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 13/07/2021 18.42, Philippe Mathieu-Daudé wrote:
> +Alex
> 
> On 7/13/21 11:31 AM, Thomas Huth wrote:
>> A typo prevents that many features get disabled when the user
>> runs "configure" with the --without-default-features switch.
>>
>> Reported-by: Cole Robinson <crobinso@redhat.com>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   configure | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/configure b/configure
>> index 85db248ac1..229ea52516 100755
>> --- a/configure
>> +++ b/configure
>> @@ -5205,7 +5205,7 @@ if test "$skip_meson" = no; then
>>           -Ddocs=$docs -Dsphinx_build=$sphinx_build -Dinstall_blobs=$blobs \
>>           -Dvhost_user_blk_server=$vhost_user_blk_server -Dmultiprocess=$multiprocess \
>>           -Dfuse=$fuse -Dfuse_lseek=$fuse_lseek -Dguest_agent_msi=$guest_agent_msi -Dbpf=$bpf\
>> -        $(if test "$default_features" = no; then echo "-Dauto_features=disabled"; fi) \
>> +        $(if test "$default_feature" = no; then echo "-Dauto_features=disabled"; fi) \
> 
> The option should be name plural (default_features)...

I agree with Markus - the way it is used in the configure script, it's 
rather meant as singular.

> What is 'auto_features' used for?

https://mesonbuild.com/Build-options.html#features

  HTH,
   Thomas


