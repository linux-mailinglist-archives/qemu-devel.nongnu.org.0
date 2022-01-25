Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DCF049AFDC
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 10:34:09 +0100 (CET)
Received: from localhost ([::1]:44756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCIDI-00045j-3j
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 04:34:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCIAe-0003O8-Ny
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 04:31:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:30627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCIAb-0004zy-AJ
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 04:31:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643103065;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=tsJ/5nSB8CKaNID3vhzknScHbRvZFaNZZGT7y05R6oU=;
 b=GiNhvN5SiDOZCNfqnuZUoVjY0q3OIy4XwpGAepG8FiGDtG6TACiFNWiWY99FUwusdaJmWy
 BzIqQ3jZYfoeRV9gmmIGsRD5EIS9P0/KLFvk3bhduOqhKmzJmEBbUd/M3Y5rdXPN0Ohlra
 xr2h6Jo3FYQXOVIL60JWj4IhpSCdDL8=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-101-N-dgmqH9NG-8xPz_UPt3Ng-1; Tue, 25 Jan 2022 04:31:04 -0500
X-MC-Unique: N-dgmqH9NG-8xPz_UPt3Ng-1
Received: by mail-wr1-f70.google.com with SMTP id
 j21-20020adfa555000000b001db55dd5a1dso1258085wrb.15
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 01:31:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=tsJ/5nSB8CKaNID3vhzknScHbRvZFaNZZGT7y05R6oU=;
 b=wRPYX2CF6UdC4p0gHtH+Yk4T1N11DZ9odzmxXrc747Mz/kX0iXPFBZPxSUFiKrPEIR
 pfc7xkFkuSGkez/zVh2bEie08sGL3N86704ThNJ1vr9qChYNyieHz1e6Pw7hVI1DUTkT
 Iq5j/F7i9N5uTzt/jwRfmGgAHtMOVWBYUdzn0VuEd6T8bl1UW2kFlcU59MUTjeOYnLYd
 mOAhdalmm/LWTSWVOC0s4Q0sML5eFtO9/UwBty8YcnH6WaHG2ZpfxS0VZ3dbCTbCpDvL
 lvhCpH1z87YwhQWCWKegMMD6VDezhnIW4r3kqITaGgi/wvCOkMNumMsSS/+qvL8fqnPJ
 m2yQ==
X-Gm-Message-State: AOAM531B+p0za/bGXzkV4WjjYENfEKnvg5vHI4pKK7qjh+gg6FEZ/+Y3
 A65huP1Rs/XC3le2FQ8fl47ihbaO9t0/8sbT0FHhWYDJn/05Bj3jeOb/6oazEpCJ2tsG4vB2JTA
 3h3sd17nTAD2Fzm0=
X-Received: by 2002:a05:600c:1e8e:: with SMTP id
 be14mr2126561wmb.30.1643103063167; 
 Tue, 25 Jan 2022 01:31:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7w0Sqqx37+RLsIiO8DxN+bU7prWN6bLKaqm3pluz0tArXjF5QsiJY2IIPd3WVKQQzfoSwhA==
X-Received: by 2002:a05:600c:1e8e:: with SMTP id
 be14mr2126539wmb.30.1643103062971; 
 Tue, 25 Jan 2022 01:31:02 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id m5sm5324690wrs.22.2022.01.25.01.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 01:31:02 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v4 08/23] multifd: Move iov from pages to params
In-Reply-To: <Yeb/aaVGA+gphb/q@work-vm> (David Alan Gilbert's message of "Tue, 
 18 Jan 2022 17:56:57 +0000")
References: <20220111130024.5392-1-quintela@redhat.com>
 <20220111130024.5392-9-quintela@redhat.com> <Yeb/aaVGA+gphb/q@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 25 Jan 2022 10:31:01 +0100
Message-ID: <87lez4rwkq.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.158,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: quintela@redhat.com
Cc: Eduardo Habkost <eduardo@habkost.net>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Leonardo Bras <leobras@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

"Dr. David Alan Gilbert" <dgilbert@redhat.com> wrote:
> * Juan Quintela (quintela@redhat.com) wrote:
>> This will allow us to reduce the number of system calls on the next patch.
>> 
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>  migration/multifd.h |  8 ++++++--
>>  migration/multifd.c | 34 ++++++++++++++++++++++++----------
>>  2 files changed, 30 insertions(+), 12 deletions(-)
>> 
>> diff --git a/migration/multifd.h b/migration/multifd.h
>> index e57adc783b..c3f18af364 100644
>> --- a/migration/multifd.h
>> +++ b/migration/multifd.h
>> @@ -62,8 +62,6 @@ typedef struct {
>>      uint64_t packet_num;
>>      /* offset of each page */
>>      ram_addr_t *offset;
>> -    /* pointer to each page */
>> -    struct iovec *iov;
>>      RAMBlock *block;
>>  } MultiFDPages_t;
>>  
>> @@ -110,6 +108,10 @@ typedef struct {
>>      uint64_t num_pages;
>>      /* syncs main thread and channels */
>>      QemuSemaphore sem_sync;
>> +    /* buffers to send */
>> +    struct iovec *iov;
>> +    /* number of iovs used */
>> +    uint32_t iovs_num;
>>      /* used for compression methods */
>>      void *data;
>>  }  MultiFDSendParams;
>> @@ -149,6 +151,8 @@ typedef struct {
>>      uint64_t num_pages;
>>      /* syncs main thread and channels */
>>      QemuSemaphore sem_sync;
>> +    /* buffers to recv */
>> +    struct iovec *iov;
>
> Why is there the asymmetry between send and recv, where the send
> has the iovs_num and the recv doesn't?

When we are sending data, we have the normal page and the iov, so it is
normal_pages + 1.  On reception side, we have to read first the header,
because that is where normal_pages is stored.

I can drop iovs_num on the send side and add a comment, but I think that
the new variable is more descriptive.

Or I can add iovs_num to the recv_side and just do a iovs_num =
normal_pages, but it seems a bit pointless, no?

Later, Juan.


