Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 096CD4443E9
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Nov 2021 15:52:54 +0100 (CET)
Received: from localhost ([::1]:41582 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miHdE-00084K-OO
	for lists+qemu-devel@lfdr.de; Wed, 03 Nov 2021 10:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1miHaA-0004jf-QR
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:49:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43698)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1miHa8-0003Yx-W1
 for qemu-devel@nongnu.org; Wed, 03 Nov 2021 10:49:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635950976;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Lnxn5dssxY/H4xG67XL8umzoSn39S0UIflCGd7gmloY=;
 b=VN0JN8JbL0EZHJxU+upP0HFRzMHEtz/KKgxCvmPdwiwnjLagOCLFuTzm4hh9Fh64Kgvtii
 Rx93g43H7p+LkkwSGtX7BlM3t4mXIfeLTTJurJnH4pkjPphT44sV7ShVlyyeWUhBssX5IL
 hV92w7/RBykkoQDJi1PfMXVJ3Souprc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-373-nXtO96EzMVOvp11o66pcYA-1; Wed, 03 Nov 2021 10:49:35 -0400
X-MC-Unique: nXtO96EzMVOvp11o66pcYA-1
Received: by mail-wm1-f71.google.com with SMTP id
 k5-20020a7bc3050000b02901e081f69d80so1151411wmj.8
 for <qemu-devel@nongnu.org>; Wed, 03 Nov 2021 07:49:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Lnxn5dssxY/H4xG67XL8umzoSn39S0UIflCGd7gmloY=;
 b=XH5n4jWB3yE4ToUFM+38ZV1DyH2eQfjCDNuzij7Z8+gZdOTqEl1Y7BakCo1CMbOoo3
 UzbEN1/OxZ955nbSRuXaFe0r4eqSMq7MxbeaHkARvxTVYTJCDnTTi7Tp3KKdiezr2xBo
 PH6LrhetyPrSw6qbDg/eKEe/sjcUUZwyHeXktSFxoQvZixffNayhe2drvTIpcvh74R6H
 hn0viNlTHFgfpijZg2UTKCzjKmtmcl4+wBLQCsUwqmFWXWtdwRhxuu6/sjfnwPV23t7F
 lQGF+op2gBJQc+HViGdOE2XF+tR2YSkBYze9uQtkkxwpQeYXhg2iMpZW6SEUolHFTZEa
 VH4w==
X-Gm-Message-State: AOAM530KoMprYZ4vY7ky9jANcW8N+VKj3rocFAaUnwrd6qsE4u5PrM+/
 Z+iIUxj6CY/5dtg14jm8PnVwFFdvRoQmdbVsx4rFPj8nvFApn25Cg5gj7y/rte5c3x5u0hIHpwd
 wMy22aJDnYvLrQqU=
X-Received: by 2002:a5d:6e8c:: with SMTP id k12mr55390594wrz.401.1635950974492; 
 Wed, 03 Nov 2021 07:49:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+xUzB+s3uyEXMm6AvRm0JxSls8+eR4v8QYOb5CPVvjtsPOu2EHDBYIiiJvLdbDJ+ZRyPAow==
X-Received: by 2002:a5d:6e8c:: with SMTP id k12mr55390571wrz.401.1635950974327; 
 Wed, 03 Nov 2021 07:49:34 -0700 (PDT)
Received: from [192.168.1.36] (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id m20sm6226821wmq.5.2021.11.03.07.49.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Nov 2021 07:49:33 -0700 (PDT)
Message-ID: <e6bc661b-b7cb-8873-9fb8-887f94fcd8b3@redhat.com>
Date: Wed, 3 Nov 2021 15:49:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 3/3] sev/i386: Perform padding calculations at compile-time
To: Dov Murik <dovmurik@linux.ibm.com>, qemu-devel@nongnu.org
References: <20211101102136.1706421-1-dovmurik@linux.ibm.com>
 <20211101102136.1706421-4-dovmurik@linux.ibm.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20211101102136.1706421-4-dovmurik@linux.ibm.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.717,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.528, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Ashish Kalra <ashish.kalra@amd.com>,
 Brijesh Singh <brijesh.singh@amd.com>, Eduardo Habkost <ehabkost@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Tobin Feldman-Fitzthum <tobin@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/1/21 11:21, Dov Murik wrote:
> In sev_add_kernel_loader_hashes, the sizes of structs are known at
> compile-time, so calculate needed padding at compile-time.
> 
> No functional change intended.
> 
> Signed-off-by: Dov Murik <dovmurik@linux.ibm.com>
> ---
>  target/i386/sev.c | 28 ++++++++++++++++++----------
>  1 file changed, 18 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>


