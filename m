Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBA542505D
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Oct 2021 11:51:20 +0200 (CEST)
Received: from localhost ([::1]:60532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYQ3b-0003vH-Mi
	for lists+qemu-devel@lfdr.de; Thu, 07 Oct 2021 05:51:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYQ0x-0008AN-01
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 05:48:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30973)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mYQ0v-0007it-FB
 for qemu-devel@nongnu.org; Thu, 07 Oct 2021 05:48:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633600112;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cunxVlt1Iz78RvNACgdXp2hdZjh6Rnqc8OiDeqi0Afw=;
 b=bFsb46AWFwkqAVQTOJDLQD0lOtdy+Ph9N4KxNjV1XXsybTH0pBhXEn67Ca/w3VjnyVdcgP
 sc8dY1SuYBi7NsZnGgd9U70GSPQCdBlFYsMCwC1Y6rnk9fG2oNHbSRjuthGW9vtDV30/zj
 zMiQwJ6X9IGooXoLfGdbZv22kso1vYY=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-476-LHhMmJ5FPmW9Y7F7L8j3Jg-1; Thu, 07 Oct 2021 05:48:31 -0400
X-MC-Unique: LHhMmJ5FPmW9Y7F7L8j3Jg-1
Received: by mail-wr1-f70.google.com with SMTP id
 h11-20020adfa4cb000000b00160c791a550so4051432wrb.6
 for <qemu-devel@nongnu.org>; Thu, 07 Oct 2021 02:48:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=cunxVlt1Iz78RvNACgdXp2hdZjh6Rnqc8OiDeqi0Afw=;
 b=C+jrNUJTPWM09R/SR/agSEeIqWPghHvYsxg6LuNDTYNmKmVbu0aXULYBS0l7lt7rzI
 jo7DbaHaioQ9NvXWjwmEqkh5TTv2zUCTCXjg5kYSYhN7Wm4fxec4UqSdMh3G+5EMAYko
 Bt6fBIHmkswBvf8FaJy3S0PDDYVWq03+VnEqcnJdhz1SxnZ9OgHW7nS3xVgskqHYh8dm
 H8TK1DRHA6W5ByQBCZJ26clfaSBa7Z7nRQ1NvMYuXWHuVaO+PuPYLBstRFHMXvk8b2Ij
 85bP2ctLZ2SrnNWTroa6lWZmTranGqHbuzOj+Iss2zM7eBqVZ8vhxyviNdD8qNNFZffF
 UmOw==
X-Gm-Message-State: AOAM5339n0JOOChRuFIHtJpFuiBMMXgvndMkXI2z0jLH4iFJ8PO49B0D
 JAV6oeAuci8N41G97Z9tpW2Uu11hKn5yGu/I1BA+Wv20QyqKzABfXTeDhhYc0pG0r5+5Ls2Ed7s
 q1heQplpspkc7WcI=
X-Received: by 2002:a1c:4444:: with SMTP id r65mr3526110wma.174.1633600110128; 
 Thu, 07 Oct 2021 02:48:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzwsVfvrhysFLOExPEjTS7BRJA24jJc7VIGiVRn1DmleziljtHhswe3AgPTDfsV2RczVf9BdQ==
X-Received: by 2002:a1c:4444:: with SMTP id r65mr3526088wma.174.1633600109941; 
 Thu, 07 Oct 2021 02:48:29 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id y15sm17040052wrp.44.2021.10.07.02.48.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Oct 2021 02:48:29 -0700 (PDT)
Message-ID: <6cbbe28f-29a6-7e7d-a2df-334a47752470@redhat.com>
Date: Thu, 7 Oct 2021 11:48:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v3 14/22] target/i386/sev: Move
 qmp_query_sev_attestation_report() to sev.c
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20211002125317.3418648-1-philmd@redhat.com>
 <20211002125317.3418648-15-philmd@redhat.com> <YVrP9sGcUNuRuXm6@work-vm>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <YVrP9sGcUNuRuXm6@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -47
X-Spam_score: -4.8
X-Spam_bar: ----
X-Spam_report: (-4.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.05,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-1.964, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
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
Cc: Brijesh Singh <brijesh.singh@amd.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>, qemu-devel@nongnu.org,
 Dov Murik <dovmurik@linux.ibm.com>,
 "Daniel P . Berrange" <berrange@redhat.com>, kvm@vger.kernel.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/4/21 11:57, Dr. David Alan Gilbert wrote:
> * Philippe Mathieu-Daudé (philmd@redhat.com) wrote:
>> Move qmp_query_sev_attestation_report() from monitor.c to sev.c
>> and make sev_get_attestation_report() static. We don't need the
>> stub anymore, remove it.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  target/i386/sev_i386.h        |  2 --
>>  target/i386/monitor.c         |  6 ------
>>  target/i386/sev-sysemu-stub.c |  7 ++++---
>>  target/i386/sev.c             | 12 ++++++++++--
>>  4 files changed, 14 insertions(+), 13 deletions(-)

>> -SevAttestationReport *sev_get_attestation_report(const char *mnonce,
>> -                                                 Error **errp)
>> +SevAttestationReport *qmp_query_sev_attestation_report(const char *mnonce,
>> +                                                       Error **errp)
>>  {
>> -    error_setg(errp, "SEV is not available in this QEMU");
>> +    error_setg(errp, QERR_UNSUPPORTED);
> 
> I did like that message making it clear the reason it was unsupported
> was this build, rather than lack of host support or not enabling it.

Yep, no reason to change it, besides, QERR_UNSUPPORTED is deprecated
since 2015! (commit 4629ed1e989):

/*
 * These macros will go away, please don't use in new code, and do not
 * add new ones!
 */

I suppose this is a rebase mistake, thanks for catching it!

Phil.


