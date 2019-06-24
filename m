Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CC9150C20
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Jun 2019 15:38:41 +0200 (CEST)
Received: from localhost ([::1]:51274 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hfPBA-0003pQ-DR
	for lists+qemu-devel@lfdr.de; Mon, 24 Jun 2019 09:38:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39815)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hfPA3-0003Cq-P4
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 09:37:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hfPA2-00081H-Ex
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 09:37:31 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39266)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hfPA2-0007yq-8k
 for qemu-devel@nongnu.org; Mon, 24 Jun 2019 09:37:30 -0400
Received: by mail-wr1-f66.google.com with SMTP id x4so13948795wrt.6
 for <qemu-devel@nongnu.org>; Mon, 24 Jun 2019 06:37:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CnJSmYXRNYTaiFEUECAPy7ZStbOVoTEJkKEJXpEnYM8=;
 b=HegqDf9OL4qTFPdlablV4PYMn+bDRhaqswQu5lKbywfAJlxSvH1M0E+d12+kJ4XVSj
 fLv7hG2dgM22aWsC3Y5fPmKCUSMdGW4GY3tDXQOoSFJm6oxSgr4zWz8jVR7EPbj3xFI4
 DRVIBKnY3qnpCYIf3CeIludi8j267WyZjze0nZPx7UC+PMnXlWt46kYVMrlfPdlGm5hc
 0CVonqB/P2Qisc3DIJUt6b5DDJ/K+I8kjWCHebLt7jygJlJOyCAdE1OxnjG3UHRkRFOj
 juMkO2+9SfGdtURxoJS1oQY0WBHYogPuRtXkTrGlAdJ5Z5WF2PzogO0sr2Iv7N38qD3N
 GSXA==
X-Gm-Message-State: APjAAAX7eZrqNcqqaRNhzFF5UxIGWgrbYJFy43NJjq3MWULOwDz9mkbQ
 UMo3hJ5lqsKsa7EORtxi3d2KVg==
X-Google-Smtp-Source: APXvYqysbyuUrS5Hh8Px3BSpWbEIjP6bCv8DNy/as68QAemzr8z4vI5SawDg3z4rcOosauQdMjojqA==
X-Received: by 2002:a05:6000:42:: with SMTP id
 k2mr62352507wrx.80.1561383447053; 
 Mon, 24 Jun 2019 06:37:27 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:7822:aa18:a9d8:39ab?
 ([2001:b07:6468:f312:7822:aa18:a9d8:39ab])
 by smtp.gmail.com with ESMTPSA id b9sm7573622wrm.11.2019.06.24.06.37.25
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 24 Jun 2019 06:37:26 -0700 (PDT)
From: Paolo Bonzini <pbonzini@redhat.com>
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
References: <20190624123835.28869-1-alex.bennee@linaro.org>
 <c191c41f-a9a5-48de-2700-ed2065a9ee24@redhat.com>
Message-ID: <f2e9a94e-eac6-597b-31db-feef014355ea@redhat.com>
Date: Mon, 24 Jun 2019 15:37:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <c191c41f-a9a5-48de-2700-ed2065a9ee24@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-devel] [PATCH] target/i386: fix feature check in
 hyperv-stub.c
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
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>, Richard Henderson <rth@twiddle.net>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Roman Kagan <rkagan@virtuozzo.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 24/06/19 15:22, Paolo Bonzini wrote:
> On 24/06/19 14:38, Alex Bennée wrote:
>> Commit 2d384d7c8 broken the build when built with:
>>
>>   configure --without-default-devices --disable-user
>>
>> The reason was the conversion of cpu->hyperv_synic to
>> cpu->hyperv_synic_kvm_only although the rest of the patch introduces a
>> feature checking mechanism. So I've fixed the KVM_EXIT_HYPERV_SYNIC in
>> hyperv-stub to do the same feature check as in the real hyperv.c
>>
>> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
>> Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
>> Cc: Paolo Bonzini <pbonzini@redhat.com>
>> Cc: Roman Kagan <rkagan@virtuozzo.com>
>> ---
>>  target/i386/hyperv-stub.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/target/i386/hyperv-stub.c b/target/i386/hyperv-stub.c
>> index fe548cbae2..0028527e79 100644
>> --- a/target/i386/hyperv-stub.c
>> +++ b/target/i386/hyperv-stub.c
>> @@ -15,7 +15,7 @@ int kvm_hv_handle_exit(X86CPU *cpu, struct kvm_hyperv_exit *exit)
>>  {
>>      switch (exit->type) {
>>      case KVM_EXIT_HYPERV_SYNIC:
>> -        if (!cpu->hyperv_synic) {
>> +        if (!hyperv_feat_enabled(cpu, HYPERV_FEAT_SYNIC)) {
>>              return -1;
>>          }
>>  
>>
> 
> Queued, thanks.

Alex will queue it instead, so

Acked-by: Paolo Bonzini <pbonzini@redhat.com>

Paolo


