Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC0937A2A4
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:51:45 +0200 (CEST)
Received: from localhost ([::1]:57892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgO7E-0005Lu-BV
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lgNeK-0000xP-Cp
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:21:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:52568)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lgNeH-0005Mx-2c
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:21:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620721308;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Oah+1wKLKRnLN76Ut3MusRL+wU9R98jALgGf3e45N0A=;
 b=f/Xr7UduBvmIwsCl2WjkmO7SeDKdkTkDv/GM0xcEFlZLYdeuNrMjSyOQiRvAR50bmFtRyw
 hfJKHYeCk1FUz5h9rCkAwk1OiC/P/LKDjEX+MjEWNjXiKaVDAG05VSVEZTdeFK7K/JSRUL
 4JW/j5pdRgR0Sjzd7TZ9lSUCnBQkhdU=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-LsZvjvbzPxC_Rfq9qYLT8A-1; Tue, 11 May 2021 04:21:46 -0400
X-MC-Unique: LsZvjvbzPxC_Rfq9qYLT8A-1
Received: by mail-wr1-f71.google.com with SMTP id
 65-20020adf82c70000b0290107593a42c3so8469660wrc.5
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 01:21:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:organization:subject
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=Oah+1wKLKRnLN76Ut3MusRL+wU9R98jALgGf3e45N0A=;
 b=nI9sHbzYQUSmY2x8WvStW/hSDItC4Dc3WPYqBDFswX5Xl00akd0KbSio9yw08vAAn+
 MCsxJnkIqdtT+/U5gPz3zIKrvA3U0+qPm9LShxI9wXKHc/3mzOtNUqZc8Ixu13tMJsKG
 45K/2k1WSP7CaW+xSFdeNxY0SRaeV98S5YMFEe992W96K2AjjbfWWqxfMsv7plREmyFY
 dqd9/saj0zTlxpW2UwHxF16Vm67sBiwgfGUdxs8D9cWMSJoUMYF4633f9bvl5WgM2WmU
 i5DYW0Ov00x8aUNUmXqur5THJho3WvdXzWrPKF0ZVVlpVi22pD5187JAMUvE3WYlFNxP
 9UkQ==
X-Gm-Message-State: AOAM530KEDoJesD2xGQYVF+cK6nIjlYr4V2uL0WttWNsUOo8SfoHC2eT
 1ebrJZtn7wn4A/jXWcvRWb0DuWCAHEjE6fWQOQoXKTMMqeO+f4JFjRZNnsMpXmLcdjQaG7NRxaQ
 EjrUEjUdJYFr5b8M=
X-Received: by 2002:a05:600c:230f:: with SMTP id
 15mr29753016wmo.19.1620721305723; 
 Tue, 11 May 2021 01:21:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw/WL61nN1W7mfcXzf1EuL3YKeqLMS6NVzUSoo30vvNfIb7TETjA3MLoxgCxjyzBJMhkPmMrQ==
X-Received: by 2002:a05:600c:230f:: with SMTP id
 15mr29752992wmo.19.1620721305397; 
 Tue, 11 May 2021 01:21:45 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c6329.dip0.t-ipconnect.de. [91.12.99.41])
 by smtp.gmail.com with ESMTPSA id
 f25sm26931493wrd.67.2021.05.11.01.21.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 01:21:45 -0700 (PDT)
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210216105039.40680-1-david@redhat.com>
 <YJmCR2N0KzZ9wvVx@work-vm>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH RFC] migrate/ram: remove "ram_bulk_stage" and "fpo_enabled"
Message-ID: <4d077bc3-9408-84c6-e753-e37f049ec34a@redhat.com>
Date: Tue, 11 May 2021 10:21:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YJmCR2N0KzZ9wvVx@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Juan Quintela <quintela@redhat.com>,
 Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10.05.21 20:58, Dr. David Alan Gilbert wrote:
> * David Hildenbrand (david@redhat.com) wrote:
>> The bulk stage is kind of weird: migration_bitmap_find_dirty() will
>> indicate a dirty page, however, ram_save_host_page() will never save it, as
>> migration_bitmap_clear_dirty() detects that it is not dirty.
>>
>> We already fill the bitmap in ram_list_init_bitmaps() with ones, marking
>> everything dirty - it didn't used to be that way, which is why we needed
>> an explicit first bulk stage.
>>
>> Let's simplify: make the bitmap the single source of thuth. Explicitly
>> handle the "xbzrle_enabled after first round" case.
> 
> I think you're right here, so (at long last) queued.

Thanks!

> I did read the comments on 6eeb63f which added the FPO flag, and I still
> think you're right.
> 
>> Regarding XBZRLE (implicitly handled via "ram_bulk_stage = false" right
>> now), there is now a slight change in behavior:
>> - Colo: When starting, it will be disabled (was implicitly enabled)
>>    until the first round actually finishes.
> 
> Was it or did they see a bulk stage again?

  static void colo_init_ram_state(void)
  {
      ram_state_init(&ram_state);
-    ram_state->ram_bulk_stage = false;
  }

suggests that they wanted to things out of order (or at least onsider 
the bitmap with eventual holes) right away, which implicitly unlocked 
xbzrle. Not sure if that behavior was really intended (don't think so).

> I can imagine that XBZRLE might be useful for COLO if subsequent rounds
> of synchornisation finds pages that change but not much.

Right, I assume in the first round they don't really care.

> 
>> - Free page hinting: When starting, XBZRLE will be disabled (was implicitly
>>    enabled) until the first round actually finished.
> 
> But the XBZRLE cache would be empty anyway on that first round?

Yes; it's less of a concern just something that changed (most probably 
to the good :) ).

> 
>> - Snapshots: When starting, XBZRLE will be disabled. We essentially only
>>    do a single run, so I guess it will never actually get disabled.
>>
>> Postcopy seems to indirectly disable it in ram_save_page(), so there
>> shouldn't be really any change.
>>
>> Cc: "Michael S. Tsirkin" <mst@redhat.com>
>> Cc: Juan Quintela <quintela@redhat.com>
>> Cc: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
>> Cc: Andrey Gruzdev <andrey.gruzdev@virtuozzo.com>
>> Cc: Peter Xu <peterx@redhat.com>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>
>> Our dirty bitmap handling is right now a little confusing due to the bulk
>> stage. Am i missing something important? Can someone comment on the
>> expected XBZRLE handling? It all is a little bit too intertwined for my
>> taste.
> 
> I think it's mostly due to there being no benefit (and a lot of cost) in
> doing xbzrle during the first round.

That makes sense, thanks!


-- 
Thanks,

David / dhildenb


