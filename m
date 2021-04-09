Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DE4235A791
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 22:05:57 +0200 (CEST)
Received: from localhost ([::1]:43624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUxO8-00044H-3f
	for lists+qemu-devel@lfdr.de; Fri, 09 Apr 2021 16:05:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lUxMH-0003dk-LI
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 16:04:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31330)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1lUxME-0002am-P7
 for qemu-devel@nongnu.org; Fri, 09 Apr 2021 16:04:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617998637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2kJa9Vuhe2kkCif28VgoIxNkRVQMLZiImTsqnstPWGs=;
 b=acRow46MsdRU/Jf5y5cJ8MWMFF94JdvfK4exgSFm6jmHoHD6Twac9oYzG9zeXbvR68YEJ+
 7CBSV0xi5sGdIRl46cOZi4QtrRGbJTBiIsSA9zxELxLCMRPFAdkBC1qVoAuoslhiZiYhei
 Ihsg2OlrU2jXaNwnYaDjTdmd6BWxf2Q=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-337-7aUbpk7SMNi110RbpTLj3Q-1; Fri, 09 Apr 2021 16:03:54 -0400
X-MC-Unique: 7aUbpk7SMNi110RbpTLj3Q-1
Received: by mail-ej1-f69.google.com with SMTP id d25so2147979ejb.14
 for <qemu-devel@nongnu.org>; Fri, 09 Apr 2021 13:03:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2kJa9Vuhe2kkCif28VgoIxNkRVQMLZiImTsqnstPWGs=;
 b=r1MFDWf4wZ+KsUWJsCh+XekidBZmMSsFtkY7qCsMCxwmIcj1MkK8dv6U048BkemTcT
 Ky0iyAstUlR/+tX1bBhSHDGiaowHOfUZEQPi7ekhA/snYVKYJIp6p84/SZQqpRGKiTJC
 2nr/V8h+ZPW9fQwpnaEYWBZ5mbwnaunb8B6B0aB7AR9VhDoFseSFLZHMjD/+qVmxjVLW
 ERIdDdXmr4X05jSjUXbfGztnP+hWLiGiHnZGMTrUarbp0MB+sjZydFX7X1mYsgN8XDf4
 1bAeQB3ymQcvDsF1VW4wzom1JuBpIvZKErp8JM0S+48zrIDBe19a+SioMr4YhL1hqVrl
 d7eA==
X-Gm-Message-State: AOAM530k+OUMP3CR1ByovIA4/Qv2YcZEPDaY3X216b7imtT0EZY+60pH
 s57zgpSQ0xIH4tlfThBMOy4bhbjcYiJPdKy6IJT2ZppSnFeFR2XR8Pq9K+hX67UDAQHp5XGe6if
 fYUjxIj8i76tL4Sg=
X-Received: by 2002:a05:6402:42c8:: with SMTP id
 i8mr19155437edc.386.1617998633287; 
 Fri, 09 Apr 2021 13:03:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOSsuTEKINqEkM9k6y+zQO9l4e6DYHneIuhY9ry8Rw5dsyK9z/Texf7YFOpyvU9MDpF+YSvg==
X-Received: by 2002:a05:6402:42c8:: with SMTP id
 i8mr19155411edc.386.1617998633055; 
 Fri, 09 Apr 2021 13:03:53 -0700 (PDT)
Received: from [192.168.1.36] (17.red-88-21-201.staticip.rima-tde.net.
 [88.21.201.17])
 by smtp.gmail.com with ESMTPSA id ml13sm1242352ejb.7.2021.04.09.13.03.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Apr 2021 13:03:52 -0700 (PDT)
Subject: Re: [PATCH 1/2] libqos/qgraph: fix "UNAVAILBLE" typo
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20210409190109.476167-1-stefanha@redhat.com>
 <20210409190109.476167-2-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <0effacbb-19b6-cd95-cfe7-1dbb037ba508@redhat.com>
Date: Fri, 9 Apr 2021 22:03:50 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210409190109.476167-2-stefanha@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/9/21 9:01 PM, Stefan Hajnoczi wrote:
> Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>
> Cc: Paolo Bonzini <pbonzini@redhat.com>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  tests/qtest/libqos/qgraph.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>



