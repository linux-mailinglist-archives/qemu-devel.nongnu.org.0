Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CE1559996F
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 12:08:00 +0200 (CEST)
Received: from localhost ([::1]:56562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOyuz-0006mC-AI
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 06:07:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58708)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oOyqR-00031r-6v
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 06:03:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oOyqN-0000sR-FF
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 06:03:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660903389;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FLP+qkhPI1uaFYm1cgvTPNiBFjzFkFK4mMJbgAXNj9g=;
 b=Rs0iuYvLEcmbbUt9E7JiWcxbzA3yuOA3MkWUYKkPXl1npG0QTQePnvdzCYB+H2JR+uTldd
 kbJ4cmY2egOFsEdFB9YPljUkXwBkD6JVp2tmNQyl54AYf4LGYvkCe4+Yiq94u+SVNdYo7L
 01S8fVKMTg1YmJPCipp3V+zd+3G3hBw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-383-zkht0HssN76r3JtLScNT2w-1; Fri, 19 Aug 2022 06:03:08 -0400
X-MC-Unique: zkht0HssN76r3JtLScNT2w-1
Received: by mail-wr1-f70.google.com with SMTP id
 r8-20020adfbb08000000b00225239ce4deso618587wrg.1
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 03:03:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc;
 bh=FLP+qkhPI1uaFYm1cgvTPNiBFjzFkFK4mMJbgAXNj9g=;
 b=mvFyzZVi/BOlWqbZV4kuAk0Za8BF/pPH8vtarAdpJtUg9H3gy5Fwxywg8BERcfzcXK
 lMLm6HYiGs0MEEokABIOz8qAZWM7srR4WhxBmG7g6iHNI22nzkDMN1D2vLFjbHBUZrGP
 x7ILotDIwSvuEIPEA1/4i9LqOZT3lU7ZEca4z/MnbBt+0pD7ebu8j++QrXQSpGf1I9/7
 u6KRCFmVop5XHwG3dVWBIGDMQZp7Y3oldZ7jaXI82I3ocjQu1tpYTlXtKdRH8319w8Xr
 dhXvfJ45af+8sqsQOFIeaLfd0QKR6Zi4QG86laYAxh6bG8zhHv89GIcAvqHFz2KYs30l
 M2ow==
X-Gm-Message-State: ACgBeo0gmR3XbSFrkwBV2Xc0AfxvMmexvv/PNQhQV8pNCPMzmsslPTT6
 AB0pDjkp0WYpkKSm6Zqb+C0uXgJDMDtXRG5cnw5l3seGCPJi6ATw/llM6tMVMhU+iJJP+mPfAcg
 927YfUO7Hb6wGqj0=
X-Received: by 2002:a1c:a383:0:b0:3a5:af21:1ef0 with SMTP id
 m125-20020a1ca383000000b003a5af211ef0mr4192904wme.123.1660903387413; 
 Fri, 19 Aug 2022 03:03:07 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7aaZN3+gDwoui1kcYzDTfuaseoJIjdxXsWRj6tyJ2lq0Fs5ypedyvSa31Y2BZ50ZvCmxdfbg==
X-Received: by 2002:a1c:a383:0:b0:3a5:af21:1ef0 with SMTP id
 m125-20020a1ca383000000b003a5af211ef0mr4192866wme.123.1660903387116; 
 Fri, 19 Aug 2022 03:03:07 -0700 (PDT)
Received: from localhost (static-205-204-7-89.ipcom.comunitel.net.
 [89.7.204.205]) by smtp.gmail.com with ESMTPSA id
 h11-20020a05600c350b00b003a63a3b55c3sm1423794wmq.14.2022.08.19.03.03.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 03:03:06 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo =?utf-8?Q?Br=C3=A1s?= <leobras@redhat.com>
Cc: qemu-devel@nongnu.org,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  Peter Xu
 <peterx@redhat.com>,  Eric Blake <eblake@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,  Yanan Wang
 <wangyanan55@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,  Eduardo Habkost
 <eduardo@habkost.net>
Subject: Re: [PATCH v7 06/12] multifd: Make flags field thread local
In-Reply-To: <ef7bff6220e3759c7acb5382ae211de1623cdf5e.camel@redhat.com>
 ("Leonardo =?utf-8?Q?Br=C3=A1s=22's?= message of "Thu, 11 Aug 2022 06:04:11
 -0300")
References: <20220802063907.18882-1-quintela@redhat.com>
 <20220802063907.18882-7-quintela@redhat.com>
 <ef7bff6220e3759c7acb5382ae211de1623cdf5e.camel@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Fri, 19 Aug 2022 12:03:06 +0200
Message-ID: <87czcw1rfp.fsf@secure.mitica>
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
> On Tue, 2022-08-02 at 08:39 +0200, Juan Quintela wrote:
>> Use of flags with respect to locking was incensistant.  For the
>> sending side:
>> - it was set to 0 with mutex held on the multifd channel.
>> - MULTIFD_FLAG_SYNC was set with mutex held on the migration thread.
>> - Everything else was done without the mutex held on the multifd channel.
>>=20
>> On the reception side, it is not used on the migration thread, only on
>> the multifd channels threads.
>>=20
>> So we move it to the multifd channels thread only variables, and we
>> introduce a new bool sync_needed on the send side to pass that informati=
on.
>>=20
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>  migration/multifd.h | 10 ++++++----
>>  migration/multifd.c | 23 +++++++++++++----------
>>  2 files changed, 19 insertions(+), 14 deletions(-)
>>=20
>> diff --git a/migration/multifd.h b/migration/multifd.h
>> index 36f899c56f..a67cefc0a2 100644
>> --- a/migration/multifd.h
>> +++ b/migration/multifd.h
>> @@ -98,12 +98,12 @@ typedef struct {
>
> Just noticed having no name in 'typedef struct' line makes it harder to
> understand what is going on.=20

It is common idiom in QEMU.  The principal reason is that if you don't
want anyone to use "struct MultiFDSendParams" but MultiFDSendParams, the
best way to achieve that is to do it this way.

>> @@ -172,6 +172,8 @@ typedef struct {
>>=20=20
>>      /* pointer to the packet */
>>      MultiFDPacket_t *packet;
>> +    /* multifd flags for each packet */
>> +    uint32_t flags;
>>      /* size of the next packet that contains pages */
>>      uint32_t next_packet_size;
>>      /* packets sent through this channel */
>
> So, IIUC, the struct member flags got moved down (same struct) to an area
> described as thread-local, meaning it does not need locking.=20
>
> Interesting, I haven't noticed this different areas in the same struct.

It has changed in the last two weeks or so in upstream (it has been on
this patchset for several months.)


>
>> diff --git a/migration/multifd.c b/migration/multifd.c
>> index e25b529235..09a40a9135 100644
>> --- a/migration/multifd.c
>> +++ b/migration/multifd.c
>> @@ -602,7 +602,7 @@ int multifd_send_sync_main(QEMUFile *f)
>>          }
>>=20=20
>>          p->packet_num =3D multifd_send_state->packet_num++;
>> -        p->flags |=3D MULTIFD_FLAG_SYNC;
>> +        p->sync_needed =3D true;
>>          p->pending_job++;
>>          qemu_mutex_unlock(&p->mutex);
>>          qemu_sem_post(&p->sem);
>> @@ -658,7 +658,11 @@ static void *multifd_send_thread(void *opaque)
>>=20=20
>>          if (p->pending_job) {
>>              uint64_t packet_num =3D p->packet_num;
>> -            uint32_t flags =3D p->flags;
>> +            p->flags =3D 0;
>> +            if (p->sync_needed) {
>> +                p->flags |=3D MULTIFD_FLAG_SYNC;
>> +                p->sync_needed =3D false;
>> +            }
>
> Any particular reason why doing p->flags =3D 0, then p->flags |=3D MULTIF=
D_FLAG_SYNC
> ?

It is a bitmap field, and if there is anything on the future, we need to
set it.  I agree that when there is only one flag, it seems "weird".

> [1] Couldn't it be done without the |=3D , since it's already being set t=
o zero
> before?=C2=A0(becoming "p->flags =3D MULTIFD_FLAG_SYNC" )

As said, easier to modify later, and also easier if we want to setup a
flag by default.

I agree that it is a matter of style/taste.

>>              p->normal_num =3D 0;
>>=20=20
>>              if (use_zero_copy_send) {
>> @@ -680,14 +684,13 @@ static void *multifd_send_thread(void *opaque)
>>                  }
>>              }
>>              multifd_send_fill_packet(p);
>> -            p->flags =3D 0;
>>              p->num_packets++;
>>              p->total_normal_pages +=3D p->normal_num;
>>              p->pages->num =3D 0;
>>              p->pages->block =3D NULL;
>>              qemu_mutex_unlock(&p->mutex);
>>=20=20
>> -            trace_multifd_send(p->id, packet_num, p->normal_num, flags,
>> +            trace_multifd_send(p->id, packet_num, p->normal_num, p->fla=
gs,
>>                                 p->next_packet_size);
>>=20=20
>>              if (use_zero_copy_send) {
>> @@ -715,7 +718,7 @@ static void *multifd_send_thread(void *opaque)
>>              p->pending_job--;
>>              qemu_mutex_unlock(&p->mutex);
>>=20=20
>> -            if (flags & MULTIFD_FLAG_SYNC) {
>> +            if (p->flags & MULTIFD_FLAG_SYNC) {
>>                  qemu_sem_post(&p->sem_sync);
>>              }
>>              qemu_sem_post(&multifd_send_state->channels_ready);
>
> IIUC it uses p->sync_needed to keep the sync info, instead of the previou=
s flags
> local var, and thus it can set p->flags =3D 0 earlier. Seems to not chang=
e any
> behavior AFAICS.

The protection of the global flags was being wrong.  That is the reason
that I decided to change it to the sync_needed.

The problem was that at some point we were still sending a packet (that
shouldn't have the SYNC flag enabled), but we received a
multifd_main_sync() and it got enabled anyways.  The easier way that I
found te fix it was this way.

Problem was difficult to detect, that is the reason that I change it
this way.

>> -        if (flags & MULTIFD_FLAG_SYNC) {
>> +        if (sync_needed) {
>>              qemu_sem_post(&multifd_recv_state->sem_sync);
>>              qemu_sem_wait(&p->sem_sync);
>>          }
>
> Ok, IIUC this part should have the same behavior as before, but using a b=
ool
> instead of an u32.

I changed it to make sure that we only checked the flags at the
beggining of the function, with the lock taken.

>
> FWIW:
> Reviewed-by: Leonardo Bras <leobras@redhat.com>

Thanks, Juan.


