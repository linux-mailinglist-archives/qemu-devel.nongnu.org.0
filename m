Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10AB33F06B6
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 16:30:24 +0200 (CEST)
Received: from localhost ([::1]:37214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGMaF-0007PU-3c
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 10:30:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGMYG-0005fr-Ex
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 10:28:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:60260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mGMYE-0006JF-Rv
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 10:28:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629296898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dSXUCoyCKzIPP6ljFNUFRGnS0EvH2cMhAXmcIjKh+ko=;
 b=S3Fj+HE+kWpIF+VZ/nW5PUuLbrjjIoM7qChBWXwQy+75A/thgtDtfM/Wou6aIGcIBnpWBB
 3kXr6KINAVg8z4eNg0VZT1RK6H+Bsw1grCnubqH/dfZhQKV90pBOVKxCZt9R1HiedasuSc
 DAg8J2tHhEw5aLGCvvst1o7w5nK3B0Q=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-vzHustfRNr6n3KovKyItHg-1; Wed, 18 Aug 2021 10:28:16 -0400
X-MC-Unique: vzHustfRNr6n3KovKyItHg-1
Received: by mail-wr1-f70.google.com with SMTP id
 z2-20020adff1c20000b0290154f60e3d2aso641097wro.23
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 07:28:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=dSXUCoyCKzIPP6ljFNUFRGnS0EvH2cMhAXmcIjKh+ko=;
 b=aVVfSxWFbQWUAIVrzBlzCPL+lLhfdC6QYSjwZMcMn/DHWqfAjT0bqWGxTClMIOdx2C
 JtiTc9aWeG4OF9+MDQ9/OyXYieDihjtlMpvDkjHUrfvUj78fg80nVcHThUbamS/BeJah
 XOut1DhypDSocDiKPWFvUyn1w3y10+fo1/j86EEjqYBaMiQsPgycm+V3iCYJC1OLVQJF
 YzQR0gUDEOQN76kyHEBxv0hWq5yD65owIB1bV5Rnegf492RKUd5hjWUd/zojhbjVYrPn
 80kSsFeYa1voFUCnjmZTDPYv63MX6w7iAuS5vGgNRa/G5G9gXZei7dx7hByFhqAhtGn+
 nKCQ==
X-Gm-Message-State: AOAM530UmRPnE7gaFxZktxsLehTzsHM/kxnD1SErl2zK6LTOwyThJwTj
 WFKob4hDM5jyOlukiNHw0AJYMztem2j9sAMQV/+nfGFf6wWHdE/XhUA31a8ToxLIj1tyno0V+mC
 PB9pTZyG7KwjCndQ=
X-Received: by 2002:adf:f282:: with SMTP id k2mr10974770wro.255.1629296895104; 
 Wed, 18 Aug 2021 07:28:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwRv8Bt+bAZyvlP2N4p0f+6mOMoLMR439hsg5HQbwoGZNTt+C+T6XI4P2VrtoPLNNyz4zXj9A==
X-Received: by 2002:adf:f282:: with SMTP id k2mr10974763wro.255.1629296895008; 
 Wed, 18 Aug 2021 07:28:15 -0700 (PDT)
Received: from [192.168.1.36] (163.red-83-52-55.dynamicip.rima-tde.net.
 [83.52.55.163])
 by smtp.gmail.com with ESMTPSA id a3sm6165682wrx.38.2021.08.18.07.28.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Aug 2021 07:28:14 -0700 (PDT)
Subject: Re: [PATCH, trivial, for-6.1] spelling: sytem => system
To: Michael Tokarev <mjt@tls.msk.ru>, qemu-devel@nongnu.org
References: <fefb5f5c-82bc-05e2-b4c1-665e9d6896ff@msgid.tls.msk.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <931a2977-58ea-5e70-abf7-781ed75f80e3@redhat.com>
Date: Wed, 18 Aug 2021 16:28:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <fefb5f5c-82bc-05e2-b4c1-665e9d6896ff@msgid.tls.msk.ru>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.961, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 8/18/21 4:06 PM, Michael Tokarev wrote:
> Signed-off-By: Michael Tokarev <mjt@tls.msk.ru>
> ---
> It is safe for 6.1

But too late ;)

> 
>  block/file-posix.c              | 2 +-
>  tools/virtiofsd/fuse_lowlevel.h | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


