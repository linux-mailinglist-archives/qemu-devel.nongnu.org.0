Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A2553AB34E
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 14:09:59 +0200 (CEST)
Received: from localhost ([::1]:48366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltqqM-0003k4-Eh
	for lists+qemu-devel@lfdr.de; Thu, 17 Jun 2021 08:09:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58356)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltqos-00024C-EG
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:08:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:29113)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1ltqop-0003Fp-9o
 for qemu-devel@nongnu.org; Thu, 17 Jun 2021 08:08:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623931702;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m5gjOcQ3Fu03OBDyJNQeLBgT7bOJgaZDmgVFK3M92HM=;
 b=Ut03/lu7LVwVWxklnzkQyNiHSK7NlM2mnmvXiPEBm0/ePFtqcX6fj7fMRuqmoQtnuY9W3Y
 /73oeJn8DUKXfcIdhQzPfXgKq4h/fx854MZUZo3Ey1txC9bMcYllS5L6GfJrwu7o4vRJR2
 /8WXsciCOs66d1kbL4ypCjDf+jltvnw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-502-DYdU52TXND-ulBd3IJFJTw-1; Thu, 17 Jun 2021 08:08:20 -0400
X-MC-Unique: DYdU52TXND-ulBd3IJFJTw-1
Received: by mail-wm1-f69.google.com with SMTP id
 n21-20020a7bcbd50000b02901a2ee0826aeso2112396wmi.7
 for <qemu-devel@nongnu.org>; Thu, 17 Jun 2021 05:08:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=m5gjOcQ3Fu03OBDyJNQeLBgT7bOJgaZDmgVFK3M92HM=;
 b=jepK7WtEDjICmTUYiqAYt8inTrNj9y31vDljlp5RoSaBhAJCNkwHn9QWIhazakUwnG
 13hz8CFa6UOeaAu1fB7BtjO6HHql3QeC3iCre87HT2AQ0FktPjsnMAhQW17XOFsqLJ0L
 +PWZS9T7QqbZ0KzjLczdYGoksq26V0W9BM9hgdPVdIJ4geiGXIdG4Yqk8sebq4nzXaCz
 OMF+2e+QFAo2lPNw+/fLty78Lc6h0fecLitCEE4YZ0h4Qmf/TTmFfjgrqb52uFSB24wN
 lI6ybeSBoVLqmS6mzYGZ0P6EMQ8SkB6/gynvwW8nv7VCl8B21bPS1osKSO27EnXHQm+W
 tZaw==
X-Gm-Message-State: AOAM531P/EzC8MzYbwG9VdNO0o9Lwzi7ykgwEF0us3RmZp3rDAIwDLFN
 syT/JBTzJJzuE20q9f93V2QvxHDvvhI9+bB4CEt2X+QrbiAjJ9Upk5tIU5oJzu4RbTmzmsJ8Thh
 KvclS6NLnTvG1jWg=
X-Received: by 2002:adf:df87:: with SMTP id z7mr5314252wrl.56.1623931699569;
 Thu, 17 Jun 2021 05:08:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwlb+9mInBZ0PuzJzns0Z6XmDOLYXDB6SX1OGyjopPMvld01bTTUVq99Af/2gKSuiP3IpKylw==
X-Received: by 2002:adf:df87:: with SMTP id z7mr5314226wrl.56.1623931699333;
 Thu, 17 Jun 2021 05:08:19 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id j12sm5277634wrt.69.2021.06.17.05.08.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 17 Jun 2021 05:08:18 -0700 (PDT)
Subject: Re: [PATCH v4 7/7] crypto: Make QCryptoTLSCreds* structures private
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210616162225.2517463-1-philmd@redhat.com>
 <20210616162225.2517463-8-philmd@redhat.com> <YMsXfo+XQepqjXoQ@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <56903fa4-0382-b54c-f939-baf91d9969c3@redhat.com>
Date: Thu, 17 Jun 2021 14:08:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YMsXfo+XQepqjXoQ@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.254, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/17/21 11:35 AM, Daniel P. Berrangé wrote:
> On Wed, Jun 16, 2021 at 06:22:25PM +0200, Philippe Mathieu-Daudé wrote:
>> Code consuming the "crypto/tlscreds*.h" APIs doesn't need
>> to access its internals. Move the structure definitions to
>> the "tlscredspriv.h" private header (only accessible by
>> implementations). The public headers (in include/) still
>> forward-declare the structures typedef.
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
>>  crypto/tlscredspriv.h              | 45 ++++++++++++++++++++++++++++++
>>  include/crypto/tls-cipher-suites.h |  6 ----
>>  include/crypto/tlscreds.h          | 16 -----------
>>  include/crypto/tlscredsanon.h      | 12 --------
>>  include/crypto/tlscredspsk.h       | 12 --------
>>  include/crypto/tlscredsx509.h      | 10 -------
>>  crypto/tls-cipher-suites.c         |  7 +++++
>>  crypto/tlscredsanon.c              |  2 ++
>>  crypto/tlscredspsk.c               |  2 ++
>>  crypto/tlscredsx509.c              |  1 +
>>  crypto/tlssession.c                |  1 +
>>  11 files changed, 58 insertions(+), 56 deletions(-)

> I was expecting all these files, and tlscreds.c to include
> tlscredspriv.h, otherwise how do they see the struct
> definition they need ?

They already include it:

$ git grep tlscredspriv.h origin/master
origin/master:crypto/tlscreds.c:24:#include "tlscredspriv.h"
origin/master:crypto/tlscredsanon.c:23:#include "tlscredspriv.h"
origin/master:crypto/tlscredspsk.c:23:#include "tlscredspriv.h"
origin/master:crypto/tlscredsx509.c:23:#include "tlscredspriv.h"

This is why in this patch I only added it to tls-cipher-suites.c
and tlssession.c.

I'll add a comment about it.

Regards,

Phil.


