Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D68F3A8763
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 19:17:23 +0200 (CEST)
Received: from localhost ([::1]:52744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltCgj-0006lh-Rv
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 13:17:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltCfp-0005vk-3l
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:16:25 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57276)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltCfl-00046z-Vs
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 13:16:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623777381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZTwio8F9M7Ls9KwQ6uCkhT38NlOrzNaNWlQ5byeei3c=;
 b=cv28HwtuAUawZi90BQi97h1tmvEEEDFSPBasN7YVFI/YDbcTEDDZoEmQ1mB0VO0UZiAWd3
 RF8LcsbMi49erpJXYUqn471UnoKK2lPX+rBiaKHSPkBktEBeY2H71bw8vzgctNtvKR2Ije
 fQKFuxKhFfdxN9WJgazj2jeArXhm9k8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-57-ycFlOWwkMbKlG97xymOJzQ-1; Tue, 15 Jun 2021 13:16:20 -0400
X-MC-Unique: ycFlOWwkMbKlG97xymOJzQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 w186-20020a1cdfc30000b02901ced88b501dso716104wmg.2
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 10:16:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ZTwio8F9M7Ls9KwQ6uCkhT38NlOrzNaNWlQ5byeei3c=;
 b=Mu9GCFmU1528qpW1+3oZcos3guf89qtqK2X7OPyBcI3eKj6+zMw9HWbn1+578yG8iQ
 3/KVs95VJYmg5JpjkzPqUv1aAarqPbZKwhdKXPcQwR0ae6ZihwXbsWwFogOZulLmJwS+
 XQHmnYV2NxGZ2U3TCuzXMuOkp1SmfEvB8aOFHhTPseXO5W/ffHPWj/ALnAIv4SRq0mgn
 M9Visj/KHhDh46WuItco8L8eJM85fDLRWVrfpPv8tvljMPRmh7NXNhQLWdoFOyjmZFZ5
 4MErhXzWSqYG9n48WniCgay1n3+fxG32r9cKdL5VBQ41/Mn9MYFLeinSclYr1raBa6da
 HeAg==
X-Gm-Message-State: AOAM530tNeTUYCDVKjnGzHs1mWrMOWG7EabZoCfgfnu0TPYlezD/1ZDA
 MMy46WOVa766YgVfHnqe8RWGRygpeZW/LcOg/6ICL7OpNyiQtXSi/CVzg+H+L0kOxhrbU4MwJ/1
 pjXKGMfbDLzWwC6A=
X-Received: by 2002:a1c:f70b:: with SMTP id v11mr364936wmh.186.1623777378858; 
 Tue, 15 Jun 2021 10:16:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx+4WfDEbIThno7IfyS4col72roTlk9gHm/VUbYID+8XiGTq5euWGum2CCpMbI65yezeNJNpA==
X-Received: by 2002:a1c:f70b:: with SMTP id v11mr364918wmh.186.1623777378680; 
 Tue, 15 Jun 2021 10:16:18 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id n42sm2678256wms.29.2021.06.15.10.16.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 15 Jun 2021 10:16:18 -0700 (PDT)
Subject: Re: [PATCH v2 7/7] crypto: Make QCryptoTLSCreds* structures private
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210615164751.2192807-1-philmd@redhat.com>
 <20210615164751.2192807-8-philmd@redhat.com> <YMja0SjeV06aUA7F@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <33a34588-a878-74c4-6d84-833ceeb45c52@redhat.com>
Date: Tue, 15 Jun 2021 19:16:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YMja0SjeV06aUA7F@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.095, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Leonardo Bras <leobras.c@gmail.com>, Lukas Straub <lukasstraub2@web.de>,
 qemu-block@nongnu.org, Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/15/21 6:52 PM, Daniel P. Berrangé wrote:
> On Tue, Jun 15, 2021 at 06:47:51PM +0200, Philippe Mathieu-Daudé wrote:
>> Code consuming the "crypto/tlscreds*.h" APIs doesn't need
>> to access its internals. Move the structure definitions to
>> the implementations in crypto/. The headers still forward
>> declare the structures typedef.
>>
>> This solves a bug introduced by commit 7de2e856533 which made
>> migration/qemu-file-channel.c include "io/channel-tls.h",
>> itself sometime depends on GNUTLS, leading to build failure
>> on OSX:
>>
>>   [2/35] Compiling C object libmigration.fa.p/migration_qemu-file-channel.c.o
>>   FAILED: libmigration.fa.p/migration_qemu-file-channel.c.o
>>   cc -Ilibmigration.fa.p -I. -I.. -Iqapi [ ... ] -o libmigration.fa.p/migration_qemu-file-channel.c.o -c ../migration/qemu-file-channel.c
>>   In file included from ../migration/qemu-file-channel.c:29:
>>   In file included from include/io/channel-tls.h:26:
>>   In file included from include/crypto/tlssession.h:24:
>>   include/crypto/tlscreds.h:28:10: fatal error: 'gnutls/gnutls.h' file not found
>>   #include <gnutls/gnutls.h>
>>            ^~~~~~~~~~~~~~~~~
>>   1 error generated.
>>
>> Reported-by: Stefan Weil <sw@weilnetz.de>
>> Suggested-by: Daniel P. Berrangé <berrange@redhat.com>
>> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/407
>> Fixes: 7de2e856533 ("yank: Unregister function when using TLS migration")
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  crypto/tlscredspriv.h         | 15 +++++++++++++++
>>  include/crypto/tlscreds.h     | 16 ----------------
>>  include/crypto/tlscredsanon.h | 12 ------------
>>  include/crypto/tlscredspsk.h  | 12 ------------
>>  include/crypto/tlscredsx509.h | 10 ----------
>>  crypto/tlscredsanon.c         | 13 +++++++++++++
>>  crypto/tlscredspsk.c          | 14 ++++++++++++++
>>  crypto/tlscredsx509.c         | 16 +++++++++++++---
>>  8 files changed, 55 insertions(+), 53 deletions(-)
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

Thanks, however I missed something:

crypto/tlssession.c: In function ‘qcrypto_tls_session_new’:
crypto/tlssession.c:163:48: error: invalid use of incomplete typedef
‘QCryptoTLSCredsAnon’
  163 |                                          acreds->data.server);
      |                                                ^~
crypto/tlssession.c:167:48: error: invalid use of incomplete typedef
‘QCryptoTLSCredsAnon’
  167 |                                          acreds->data.client);
      |                                                ^~
crypto/tlssession.c:201:48: error: invalid use of incomplete typedef
‘QCryptoTLSCredsPSK’
  201 |                                          pcreds->data.server);
      |                                                ^~
crypto/tlssession.c:205:48: error: invalid use of incomplete typedef
‘QCryptoTLSCredsPSK’
  205 |                                          pcreds->data.client);
      |                                                ^~
crypto/tlssession.c:228:44: error: invalid use of incomplete typedef
‘QCryptoTLSCredsX509’
  228 |                                      tcreds->data);
      |                                            ^~


