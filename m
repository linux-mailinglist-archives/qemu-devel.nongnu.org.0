Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E903C3B7FC5
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Jun 2021 11:15:21 +0200 (CEST)
Received: from localhost ([::1]:48992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyWJU-0008J5-FN
	for lists+qemu-devel@lfdr.de; Wed, 30 Jun 2021 05:15:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60724)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1lyWII-0007cy-TU
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 05:14:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:59524)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1lyWID-00058B-M8
 for qemu-devel@nongnu.org; Wed, 30 Jun 2021 05:14:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625044439;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:in-reply-to:in-reply-to:  references:references;
 bh=dwzk/clXDUOcHNyMY7ujxxrb0wmN39YuEmvjwE6N6dI=;
 b=IFVphjwuJic71quHxFvciZ0+zPZiXbTfnZBgbRUV4Rn76pmCXhkX/bkaMPRSrFAnEshMtf
 aDx+UxsAvgogZthrVczt39uQjOcFSHwWJH4tDDB3yIiKCGK4nzjghnG+SZXbzh4rvdtqLx
 Xz8RDrr5HEMFhORmMvCd5f6S7Lky8DA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-299-RpMFZUdiPOaBxK0nB2W9AQ-1; Wed, 30 Jun 2021 05:13:58 -0400
X-MC-Unique: RpMFZUdiPOaBxK0nB2W9AQ-1
Received: by mail-wm1-f70.google.com with SMTP id
 l9-20020a05600c1d09b02901dc060832e2so417324wms.1
 for <qemu-devel@nongnu.org>; Wed, 30 Jun 2021 02:13:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
 :user-agent:reply-to:date:message-id:mime-version;
 bh=dwzk/clXDUOcHNyMY7ujxxrb0wmN39YuEmvjwE6N6dI=;
 b=ja0Xcki6A0uw2PPvuuG0KS+/hPGKRVRmkRJUh/rQ3hexpmimzc3AYC4J3XoxiGjetP
 IxefKPwydJTE84KenRt9difzC+buFjP11LOrS/XWRPi9IzZzX6XmLMu9BzLAbtLvgMcv
 YI9Dsf/TQDAVmLJUvyUMobXnfJv5bI6jk3zsrQO4amksEDUg5Z9bn03IvAvKN65xyLVG
 3PMBUY1aqZK7+Zt0urf7863eI2ePYvIqaJQ5U46+je+6bIF2MnNu6A4myL3IUohduxoc
 wLTDoOYM5/ZeuLIm63lyseWsEXDsDAxu5/DXut29Mw2tuRW/CsMgWLZeHP0I4YGnpBkN
 Cg7g==
X-Gm-Message-State: AOAM532mezmlVeKKoRyhC7uJKxQHb0GHiVqnDa9qkks3PDeHa6MjTHNw
 s7ZEJJHwNTQes2ZE4yEj0I7q4v8zNGjPTiTDNtrHx+U6m6bF7WhQrCO7MRq6YR11D1arh3EkwsV
 GLJcrz5kU8lsauP4=
X-Received: by 2002:a5d:5307:: with SMTP id e7mr15822552wrv.353.1625044437367; 
 Wed, 30 Jun 2021 02:13:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoSHWVmTW5XLJyEIoMeDV/5cFoIt6tuNv6B2nWwGvSdZWG3Msh9ulS/NE5p6E/csA49veE7Q==
X-Received: by 2002:a5d:5307:: with SMTP id e7mr15822523wrv.353.1625044437132; 
 Wed, 30 Jun 2021 02:13:57 -0700 (PDT)
Received: from localhost (62.83.194.64.dyn.user.ono.com. [62.83.194.64])
 by smtp.gmail.com with ESMTPSA id a9sm20699251wrv.37.2021.06.30.02.13.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Jun 2021 02:13:56 -0700 (PDT)
From: Juan Quintela <quintela@redhat.com>
To: Laurent Vivier <lvivier@redhat.com>
Subject: Re: [PATCH 2/2] migration: failover: continue to wait card unplug
 on error
In-Reply-To: <c7ec3af8-5649-4e53-ef5c-39f7adc54e2b@redhat.com> (Laurent
 Vivier's message of "Wed, 30 Jun 2021 11:04:38 +0200")
References: <20210629155007.629086-1-lvivier@redhat.com>
 <20210629155007.629086-3-lvivier@redhat.com>
 <87im1wk1ap.fsf@secure.mitica>
 <c7ec3af8-5649-4e53-ef5c-39f7adc54e2b@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/27.1 (gnu/linux)
Date: Wed, 30 Jun 2021 11:13:55 +0200
Message-ID: <871r8jzpd8.fsf@secure.mitica>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
Received-SPF: pass client-ip=216.205.24.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.435,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Reply-To: quintela@redhat.com
Cc: Jens Freimann <jfreimann@redhat.com>, qemu-devel@nongnu.org,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Laurent Vivier <lvivier@redhat.com> wrote:
> On 29/06/2021 19:50, Juan Quintela wrote:
>> Laurent Vivier <lvivier@redhat.com> wrote:
>>> If the user cancels the migration in the unplug-wait state,
>>> QEMU will try to plug back the card and this fails because the card
>>> is partially unplugged.
>>> To avoid the problem, continue to wait the card unplug, but to
>>> allow the migration to be canceled if the card never finishes to unplug
>>> use a timeout.
>>>
>>> Bug: https://bugzilla.redhat.com/show_bug.cgi?id=1976852
>>> Signed-off-by: Laurent Vivier <lvivier@redhat.com>
>>> ---
>>>  migration/migration.c | 11 +++++++++++
>>>  1 file changed, 11 insertions(+)
>>>
>>> diff --git a/migration/migration.c b/migration/migration.c
>>> index 3e92c405a2b6..3b06d43a7f42 100644
>>> --- a/migration/migration.c
>>> +++ b/migration/migration.c
>>> @@ -3679,6 +3679,17 @@ static void qemu_savevm_wait_unplug(MigrationState *s, int old_state,
>>>                 qemu_savevm_state_guest_unplug_pending()) {
>>>              qemu_sem_timedwait(&s->wait_unplug_sem, 250);
>>>          }
>>> +        if (s->state != MIGRATION_STATUS_WAIT_UNPLUG) {
>>> +            int timeout = 120; /* 30 seconds */
>>> +            /*
>>> +             * migration has been canceled
>>> +             * but as we have started an unplug we must wait the end
>>> +             * to be able to plug back the card
>>> +             */
>>> +            while (timeout-- && qemu_savevm_state_guest_unplug_pending()) {
>>> +                qemu_sem_timedwait(&s->wait_unplug_sem, 250);
>>> +            }
>>> +        }
>>>  
>>>          migrate_set_state(&s->state, MIGRATION_STATUS_WAIT_UNPLUG, new_state);
>>>      } else {
>> I agree with the idea.  But if we are getting out due to timeout == 0,
>> shouldn't we return some error, warning, whatever?
>
> In that case, we keep the current behaviour: guest kernel will report
> an error when it
> will try to plug back the card that has not been unplugged. This is a
> corner case: if it
> happens we have something really wrong with the machine. Perhaps we can remove the
> timeout, but I don't like to block the user, or increase it to be sure.

Oh, I whole agree that it is a corner case, and that it shouldn't
happen.

But if it happens, we don't log it anywhere.  That was my complaint.

Later, Juan.


