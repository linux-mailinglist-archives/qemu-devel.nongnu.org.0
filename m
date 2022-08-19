Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F048B59990C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Aug 2022 11:54:55 +0200 (CEST)
Received: from localhost ([::1]:56308 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oOyiN-0006fs-3E
	for lists+qemu-devel@lfdr.de; Fri, 19 Aug 2022 05:54:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oOyfb-0002Z5-Kt
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 05:52:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58715)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1oOyfY-0007QN-E4
 for qemu-devel@nongnu.org; Fri, 19 Aug 2022 05:52:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660902719;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GYfrT8L6H29/f41Jw6z9P0KrKh6MXIXJkjHiFCDWO54=;
 b=YTOjlH1gCKuhBd5N8Fn7cWh4OarE9o1LBkYip8EJW+21QF9W5dYGIjXQHTRXFllgkoXHox
 3No/XYLFiuEKKDFqGRyOquIvEMZf84SiuRjwF0tb0sn49me2ZvgLKyS/47HkYl487/ivQw
 Yy36fketJKOnVF4Kb02zcWnTCTcxraQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-412-sL_gHaGhMn6UZtwlvNrbwQ-1; Fri, 19 Aug 2022 05:51:57 -0400
X-MC-Unique: sL_gHaGhMn6UZtwlvNrbwQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 n7-20020a1c2707000000b003a638356355so22940wmn.2
 for <qemu-devel@nongnu.org>; Fri, 19 Aug 2022 02:51:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:reply-to
 :user-agent:references:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc;
 bh=GYfrT8L6H29/f41Jw6z9P0KrKh6MXIXJkjHiFCDWO54=;
 b=37UvjG7efNx2WlXcic2g5KCF+dwAK2Gv0r8DyEWTdqVukNbIFRjbpZ8Vx7WKAct8MX
 sqI8nloxIGeimcshHncW4lq6Ta8+Q4IlcfVfyV67gC9l9vxi9JC7OKw61wnNL6J7sp3R
 y5L8IlaXD1k2tGQ3IJ3o61PierI090ByA6es7k6AC+IC2/nQySMUnPlaxjc1O1gFkXnG
 q/H70HPha9D66t02777LgAWfYqUVx0lDsz46IJEJMjZpA3f2IMIX04IfBgnU16OrbJF4
 rajTHUTl9QkqZ7zK6qP2e4dnHWrjLR8GsB7wglcC1ZH6se6VFXx1dC0n3zprVS8hzjY2
 4apA==
X-Gm-Message-State: ACgBeo19X50SK1BwHEp57oBa82qTpqUSXOf5OKYp+nuWmzgTWt6CWjOH
 KafkaV+pxQyn0Eb01PAWnNxifwm9br2kfd2FOXEN4nFtjOzOeCYGfTAuRrbYt1JZS74YrrBoklB
 LTmyXw+yrJvFotgI=
X-Received: by 2002:a05:6000:1ac9:b0:220:7f40:49e3 with SMTP id
 i9-20020a0560001ac900b002207f4049e3mr3667853wry.40.1660902716399; 
 Fri, 19 Aug 2022 02:51:56 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4YTQOXoiyyEKSSDQHEflFWssmWFgA5ETr/nhVUm19P1Hz9YePHT+bOYqqgR4U0AorGPgQ3YA==
X-Received: by 2002:a05:6000:1ac9:b0:220:7f40:49e3 with SMTP id
 i9-20020a0560001ac900b002207f4049e3mr3667838wry.40.1660902716124; 
 Fri, 19 Aug 2022 02:51:56 -0700 (PDT)
Received: from localhost (static-205-204-7-89.ipcom.comunitel.net.
 [89.7.204.205]) by smtp.gmail.com with ESMTPSA id
 m16-20020a5d56d0000000b0021e9fafa601sm3423762wrw.22.2022.08.19.02.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Aug 2022 02:51:55 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Leonardo =?utf-8?Q?Br=C3=A1s?= <leobras@redhat.com>
Cc: qemu-devel@nongnu.org,  Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,  Peter Xu
 <peterx@redhat.com>,  Eric Blake <eblake@redhat.com>,  Philippe
 =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,  Yanan Wang
 <wangyanan55@huawei.com>,
 Markus Armbruster <armbru@redhat.com>,  Eduardo Habkost
 <eduardo@habkost.net>
Subject: Re: [PATCH v7 05/12] migration: Make ram_save_target_page() a pointer
In-Reply-To: <01fcdde9f6246836b4058efc8c298a82e86d1458.camel@redhat.com>
 ("Leonardo =?utf-8?Q?Br=C3=A1s=22's?= message of "Thu, 11 Aug 2022 05:11:25
 -0300")
References: <20220802063907.18882-1-quintela@redhat.com>
 <20220802063907.18882-6-quintela@redhat.com>
 <01fcdde9f6246836b4058efc8c298a82e86d1458.camel@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.1 (gnu/linux)
Date: Fri, 19 Aug 2022 11:51:55 +0200
Message-ID: <87h7281ryc.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
>> We are going to create a new function for multifd latest in the series.
>>=20
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>
> Double Signed-off-by again.
>
>> ---
>>  migration/ram.c | 13 +++++++++----
>>  1 file changed, 9 insertions(+), 4 deletions(-)
>>=20
>> diff --git a/migration/ram.c b/migration/ram.c
>> index 85d89d61ac..499d9b2a90 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -310,6 +310,9 @@ typedef struct {
>>      bool preempted;
>>  } PostcopyPreemptState;
>>=20=20
>> +typedef struct RAMState RAMState;
>> +typedef struct PageSearchStatus PageSearchStatus;
>> +
>>  /* State of RAM for migration */
>>  struct RAMState {
>>      /* QEMUFile used for this migration */
>> @@ -372,8 +375,9 @@ struct RAMState {
>>       * is enabled.
>>       */
>>      unsigned int postcopy_channel;
>> +
>> +    int (*ram_save_target_page)(RAMState *rs, PageSearchStatus *pss);
>>  };
>> -typedef struct RAMState RAMState;
>>=20=20
>>  static RAMState *ram_state;
>>=20=20
>> @@ -2255,14 +2259,14 @@ static bool save_compress_page(RAMState *rs, RAM=
Block *block, ram_addr_t offset)
>>  }
>>=20=20
>>  /**
>> - * ram_save_target_page: save one target page
>> + * ram_save_target_page_legacy: save one target page
>>   *
>>   * Returns the number of pages written
>>   *
>>   * @rs: current RAM state
>>   * @pss: data about the page we want to send
>>   */
>> -static int ram_save_target_page(RAMState *rs, PageSearchStatus *pss)
>> +static int ram_save_target_page_legacy(RAMState *rs, PageSearchStatus *=
pss)
>>  {
>>      RAMBlock *block =3D pss->block;
>>      ram_addr_t offset =3D ((ram_addr_t)pss->page) << TARGET_PAGE_BITS;
>> @@ -2469,7 +2473,7 @@ static int ram_save_host_page(RAMState *rs, PageSe=
archStatus *pss)
>>=20=20
>>          /* Check the pages is dirty and if it is send it */
>>          if (migration_bitmap_clear_dirty(rs, pss->block, pss->page)) {
>> -            tmppages =3D ram_save_target_page(rs, pss);
>> +            tmppages =3D rs->ram_save_target_page(rs, pss);
>>              if (tmppages < 0) {
>>                  return tmppages;
>>              }
>> @@ -3223,6 +3227,7 @@ static int ram_save_setup(QEMUFile *f, void *opaqu=
e)
>>      ram_control_before_iterate(f, RAM_CONTROL_SETUP);
>>      ram_control_after_iterate(f, RAM_CONTROL_SETUP);
>>=20=20
>> +    (*rsp)->ram_save_target_page =3D ram_save_target_page_legacy;
>>      ret =3D  multifd_send_sync_main(f);
>>      if (ret < 0) {
>>          return ret;
>
>
> So, IIUC:
> - Rename ram_save_target_page -> ram_save_target_page_legacy
> - Add a function pointer to RAMState (or a callback)
> - Assign function pointer =3D ram_save_target_page_legacy at setup
> - Replace ram_save_target_page() by indirect function call using above po=
inter.
>
> I could see no issue in this, so I belive it works fine.
>
> The only thing that concerns me is the name RAMState.

Every device state is setup in RAMState.

> IMHO, a struct named RAMState is supposed to just reflect the state of ra=
m (or
> according to this struct's comments, the state of RAM for migration. Havi=
ng a
> function pointer here that saves a page seems counterintuitive, since it =
does
> not reflect the state of RAM.

The big problem for adding another struct is that we would have to
change all the callers, or yet another global variable.  Both are bad
idea in my humble opinion.

> Maybe we could rename the struct, or even better, create another struct t=
hat
> could look something like this:
>
> struct RAMMigration {
>     RAMState state;
>     int (*ram_save_target_page)(RAMState *rs, PageSearchStatus *pss);
>     /* Other callbacks or further info.*/
> }
>
> What do you think about it?

Really this depends on configuration.  What is setup for qemu
migration.  I think this is the easiest way to do it, we can add a new
struct, but it gets everything much more complicated:

- the value that we receive in ram_save_setup() is a RAMState
- We would have to change all the callers form
  * ram_save_iterate()
  * ram_find_and_save_block()
  * ram_save_host_page()

So I think it is quite a bit of churn for not a lot of gain.

Later, Juan.


