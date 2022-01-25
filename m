Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F8149B0C3
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 10:54:59 +0100 (CET)
Received: from localhost ([::1]:36240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCIXS-0001Vj-HB
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 04:54:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCINw-0001jg-7W
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 04:45:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:26055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1nCINt-000750-E8
 for qemu-devel@nongnu.org; Tue, 25 Jan 2022 04:45:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643103903;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=N7FRYgPwCJLt8YEqOoB6l4irwqyYqWQnJ8XIhGYqPns=;
 b=Y2SPuv1fzvXXUEWAYB3XG6ioBHjjnqVzhLG70W7tMDEUZA4f2WKummdz/ai0OfWIfGerFk
 REVjvPl9KXv+76nMSzBmVfL2IrJ5twqwPQrYd1DZcSDZRojSs7iHGHKS0V8rtw8T4CU4LI
 sHVqnINpEeQBUHhyyA9qm4ufpHV2R0U=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-634-gZ5x3sUpObe5oC7x_PiKiA-1; Tue, 25 Jan 2022 04:45:02 -0500
X-MC-Unique: gZ5x3sUpObe5oC7x_PiKiA-1
Received: by mail-wm1-f70.google.com with SMTP id
 o3-20020a1ca503000000b0035056b042deso1199183wme.0
 for <qemu-devel@nongnu.org>; Tue, 25 Jan 2022 01:45:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=N7FRYgPwCJLt8YEqOoB6l4irwqyYqWQnJ8XIhGYqPns=;
 b=B/7fBOsnkYHAVEeyq6hHuUR97EqxPXYrQ8op18rNkHlxbycwWZegYsYDHCg+FNcAAE
 niPKHjZsZzhFY0nON7WgG/Pt0CSpN3QLiwU4URoVubm4rEBQXDfEMYRpVosopQES4qEt
 JmeDBurCDy/klEFAi3K3Vz0X33CwKJyC4Kn7xsSWcwn96vISIwCSMRN5C5IoqGx/nwqv
 QoiQ6YCK4uqkZLad0rgrkADEgOuI3Nya3R7D1sxc8ftjsR917iC18miQ8lvsg6uQQi2m
 B5kAJtB/0u+gkzQMP6MYcWiWlUIrBGpRgQTx/Vmyl6eccXScVC/V+86I3ZfPIXdz5FxQ
 I/LQ==
X-Gm-Message-State: AOAM5338uOij9QDwP2FB49xUfVm31uSHGSn45YgjIBJNSxNiUzj/lnuq
 eVsTW8hbzN3B2ySQ2NfExJ+1DtoHULpqogFBPakvHZjn+FP8RomEInAE4N/M1bSzwJd9N9DCmK4
 MAanvvkE75KDtdL0=
X-Received: by 2002:a05:600c:4c09:: with SMTP id
 d9mr2042914wmp.159.1643103901391; 
 Tue, 25 Jan 2022 01:45:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxt/7V4/48QqIlBDHeRlJYgcqJmPwW2v8KkZfNG15b4FluRvcMRoO6dj8+Xl6Km3sFeX/bCyw==
X-Received: by 2002:a05:600c:4c09:: with SMTP id
 d9mr2042896wmp.159.1643103901215; 
 Tue, 25 Jan 2022 01:45:01 -0800 (PST)
Received: from localhost ([47.61.17.76])
 by smtp.gmail.com with ESMTPSA id b2sm9189771wrd.64.2022.01.25.01.45.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 01:45:00 -0800 (PST)
From: Juan Quintela <quintela@redhat.com>
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Subject: Re: [PATCH v4 22/23] migration: Use multifd before we check for the
 zero page
In-Reply-To: <YeccpUQWfgU1sF7e@work-vm> (David Alan Gilbert's message of "Tue, 
 18 Jan 2022 20:01:41 +0000")
References: <20220111130024.5392-1-quintela@redhat.com>
 <20220111130024.5392-23-quintela@redhat.com>
 <YeccpUQWfgU1sF7e@work-vm>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.2 (gnu/linux)
Date: Tue, 25 Jan 2022 10:45:00 +0100
Message-ID: <87czkgrvxf.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
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
>> So we use multifd to transmit zero pages.
>> 
>> Signed-off-by: Juan Quintela <quintela@redhat.com>
>> ---
>>  migration/ram.c | 32 +++++++++++++++++++++++++++++++-
>>  1 file changed, 31 insertions(+), 1 deletion(-)
>> 
>> diff --git a/migration/ram.c b/migration/ram.c
>> index 3536778e19..bdc7cec4cd 100644
>> --- a/migration/ram.c
>> +++ b/migration/ram.c
>> @@ -2168,6 +2168,32 @@ static int ram_save_target_page_legacy(RAMState *rs, PageSearchStatus *pss)
>>      return ram_save_page(rs, pss);
>>  }
>>  
>> +/**
>> + * ram_save_target_page_multifd: save one target page
>> + *
>> + * Returns the number of pages written
>> + *
>> + * @rs: current RAM state
>> + * @pss: data about the page we want to send
>> + */
>> +static int ram_save_target_page_multifd(RAMState *rs, PageSearchStatus *pss)
>> +{
>> +    RAMBlock *block = pss->block;
>> +    ram_addr_t offset = ((ram_addr_t)pss->page) << TARGET_PAGE_BITS;
>> +    int res;
>> +
>> +    if (!migration_in_postcopy()) {
>> +        return ram_save_multifd_page(rs, block, offset);
>> +    }
>> +
>> +    res = save_zero_page(rs, block, offset);
>
> I'm confused; I think I was expecting to see in this patch, the one that
> would check the parameter you added and do something different - where
> did that go?
>
> Note I think this is quite subtle that the difference here is really
> just the ordering rather than adding a zero page test.

Hi dave

you are right.  Too much rebasing.


>> +    if (res > 0) {
>> +        return res;
>> +    }
>> +
>> +    return ram_save_page(rs, pss);
>> +}
>> +
>>  /**
>>   * ram_save_host_page: save a whole host page
>>   *
>> @@ -3011,7 +3037,11 @@ static int ram_save_setup(QEMUFile *f, void *opaque)
>>      ram_control_before_iterate(f, RAM_CONTROL_SETUP);
>>      ram_control_after_iterate(f, RAM_CONTROL_SETUP);
>>  
>> -    (*rsp)->ram_save_target_page = ram_save_target_page_legacy;
>> +    if (migrate_use_multifd()) {
>> +        (*rsp)->ram_save_target_page = ram_save_target_page_multifd;
>> +    } else {
>> +        (*rsp)->ram_save_target_page = ram_save_target_page_legacy;
>> +    }

I need to add the check here.

Good catch, Juan.

>>      multifd_send_sync_main(f);
>>      qemu_put_be64(f, RAM_SAVE_FLAG_EOS);
>>      qemu_fflush(f);
>> -- 
>> 2.34.1
>> 


