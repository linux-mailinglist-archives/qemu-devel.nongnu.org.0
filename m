Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE35A5998CE
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 11:37:30 +0200 (CEST)
Received: from localhost ([::1]:38790 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOyRV-000672-Aj
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 05:37:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oOyPZ-0004Ss-Ol
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 05:35:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:42904)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oOyPV-0005DC-Cs
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 05:35:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660901717;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YgQoqBRWJsHqO3FBUnzqjLjtWJAIbfC/szNkVlYcNmc=;
 b=hq2YUK8K6frKKOtdsKwgbiAZqu3dGXOMhOW6wKd9olDhAwJ9k334upkNEGJ3W29tZRYPV6
 0y8P1LVMw1crcwHS7qKPnV+eiYde3hR4Mv5ta9XbAPfsofY+u/77XCDQetxnu3y5eNyFJz
 zxKm9uohyqkPwlXKFHuz7zFaDo3chVk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-447-O6TxNZIUPh-byptXOzl2_g-1; Fri, 19 Aug 2022 05:35:14 -0400
X-MC-Unique: O6TxNZIUPh-byptXOzl2_g-1
Received: by mail-wm1-f71.google.com with SMTP id
 r10-20020a1c440a000000b003a538a648a9so2193212wma.5
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 02:35:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc;
 bh=YgQoqBRWJsHqO3FBUnzqjLjtWJAIbfC/szNkVlYcNmc=;
 b=iWBrkg2D9q0tcIYW8Tm5Xn8vyi/iZdMHXt5V9ouWVUvLMcRVbb53oz3Hzo/uVVRsWn
 99v7ZfrpZ+f0DSdY5hHPa+vH9z2eR95Zjyj/u7TaejaW1YM9e49yDWLXH0R3+RWSnbiL
 vjGXVBtj5XLKuXtC3V+hKUVqRw3vu6ou+jkuhlFIa6njeWmUzc2uB+bqQajTn2IRYkE2
 vRKt2vHSywQ1qi/RQPw/OFvKvwOTgGAc+f4YXDQ+g8P+7f+RCBY9KqunniaPmpyrXqT5
 4Dw4RlyJJxqFzqMu0+Q3ymZK46/6ZnMiyIm5Y4SL/fLHDxQ8rY4WWq+aXRkcik+tBZmv
 V8ww==
X-Gm-Message-State: ACgBeo3zjWJ3i8m84w2pWy/lW3bBGHZpNAciJHWDDW62qUDo3EDLHtGD
 f2udJfegyH2PJsXb7bRkgMdiaKcs2aIC967POlG87aFnwAmDb/xmFjvlnQotcXOU6hoHguvvpkj
 q5EcRXavp3T4AvJ8=
X-Received: by 2002:adf:fb0e:0:b0:21a:34a2:5ca9 with SMTP id
 c14-20020adffb0e000000b0021a34a25ca9mr3745484wrr.472.1660901713298; 
 Fri, 19 Aug 2022 02:35:13 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6SZK07PRim2m2y8PHr7o4oTMsx7rrl8c+JzNHnBNg5EMjKGtP/cwk35TJtYVq9De4AKemP3w==
X-Received: by 2002:adf:fb0e:0:b0:21a:34a2:5ca9 with SMTP id
 c14-20020adffb0e000000b0021a34a25ca9mr3745465wrr.472.1660901713022; 
 Fri, 19 Aug 2022 02:35:13 -0700 (PDT)
Received: from localhost (static-205-204-7-89.ipcom.comunitel.net.
 [89.7.204.205]) by smtp.gmail.com with ESMTPSA id
 y3-20020adfee03000000b0021efc75914esm3404241wrn.79.2022.08.19.02.35.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 02:35:12 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo =?utf-8?Q?Br=C3=A1s?= <leobras@redhat.com>
Cc: qemu-devel@nongnu.org,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  Peter Xu
 <peterx@redhat.com>,  Eric Blake <eblake@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,  Yanan Wang
 <wangyanan55@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,  Eduardo Habkost
 <eduardo@habkost.net>
Subject: Re: [PATCH v7 04/12] multifd: Count the number of bytes sent correctly
In-Reply-To: <1b8e97cdafc2f50924cedd79f484ab9640c38229.camel@redhat.com>
 ("Leonardo =?utf-8?Q?Br=C3=A1s=22's?= message of "Thu, 11 Aug 2022 05:11:17
 -0300")
References: <20220802063907.18882-1-quintela@redhat.com>
 <20220802063907.18882-5-quintela@redhat.com>
 <1b8e97cdafc2f50924cedd79f484ab9640c38229.camel@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Fri, 19 Aug 2022 11:35:11 +0200
Message-ID: <87lerk1sq8.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Leonardo Br=C3=A1s <leobras@redhat.com> wrote:
> On Tue, 2022-08-02 at 08:38 +0200, Juan Quintela wrote:
>> Current code asumes that all pages are whole.  That is not true for
>> example for compression already.  Fix it for creating a new field
>> ->sent_bytes that includes it.
>>=20
>> All ram_counters are used only from the migration thread, so we have
>> two options:
>> - put a mutex and fill everything when we sent it (not only
>> ram_counters, also qemu_file->xfer_bytes).
>> - Create a local variable that implements how much has been sent
>> through each channel.  And when we push another packet, we "add" the
>> previous stats.
>>=20
>> I choose two due to less changes overall.  On the previous code we
>> increase transferred and then we sent.  Current code goes the other
>> way around.  It sents the data, and after the fact, it updates the
>> counters.  Notice that each channel can have a maximum of half a
>> megabyte of data without counting, so it is not very important.
>>=20
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>  migration/multifd.h |  2 ++
>>  migration/multifd.c | 14 ++++++--------
>>  2 files changed, 8 insertions(+), 8 deletions(-)
>>=20
>> diff --git a/migration/multifd.h b/migration/multifd.h
>> index e2802a9ce2..36f899c56f 100644
>> --- a/migration/multifd.h
>> +++ b/migration/multifd.h
>> @@ -102,6 +102,8 @@ typedef struct {
>>      uint32_t flags;
>>      /* global number of generated multifd packets */
>>      uint64_t packet_num;
>> +    /* How many bytes have we sent on the last packet */
>> +    uint64_t sent_bytes;
>>      /* thread has work to do */
>>      int pending_job;
>>      /* array of pages to sent.
>> diff --git a/migration/multifd.c b/migration/multifd.c
>> index aa3808a6f4..e25b529235 100644
>> --- a/migration/multifd.c
>> +++ b/migration/multifd.c
>> @@ -394,7 +394,6 @@ static int multifd_send_pages(QEMUFile *f)
>>      static int next_channel;
>>      MultiFDSendParams *p =3D NULL; /* make happy gcc */
>>      MultiFDPages_t *pages =3D multifd_send_state->pages;
>> -    uint64_t transferred;
>>=20=20
>>      if (qatomic_read(&multifd_send_state->exiting)) {
>>          return -1;
>> @@ -429,10 +428,10 @@ static int multifd_send_pages(QEMUFile *f)
>>      p->packet_num =3D multifd_send_state->packet_num++;
>>      multifd_send_state->pages =3D p->pages;
>>      p->pages =3D pages;
>> -    transferred =3D ((uint64_t) pages->num) * p->page_size + p->packet_=
len;
>> -    qemu_file_acct_rate_limit(f, transferred);
>> -    ram_counters.multifd_bytes +=3D transferred;
>> -    ram_counters.transferred +=3D transferred;
>> +    ram_transferred_add(p->sent_bytes);
>> +    ram_counters.multifd_bytes +=3D p->sent_bytes;
>
> I'm worndering if we could avoid having this last line by having
> ram_transferred_add() to include:
>
> if (migrate_use_multifd()) {
>     ram_counters.multifd_bytes +=3D bytes;
> }
>
> But I am not sure if other usages from ram_transferred_add() could interf=
ere.

I preffer not to, because ram_addr_ram() is also used for non multifd code.

> Double semicolon.

Fixed, thanks.

>> +            p->sent_bytes +=3D p->next_packet_size;
>>              p->pending_job--;
>>              qemu_mutex_unlock(&p->mutex);
>>=20=20
>
> IIUC, it changes how rate-limiting and ram counters perceive how many byt=
es have
> been sent, by counting actual bytes instead of page multiples. This should
> reflect what have been actually sent (in terms of rate limiting).
>
> I'm wondering if having the ram_counters.transferred to reflect acutal by=
tes,
> instead of the number of pages * pagesize will cause any user (or managem=
ent
> code) to be confuse in any way.

It shouldn't, because we already have things that don't sent that data
as multiples:
- any compression code
- xbzrle

so I think we are right here.

> Other than that:
> Reviewed-by: Leonardo Bras <leobras@redhat.com>

Thanks, Juan.


