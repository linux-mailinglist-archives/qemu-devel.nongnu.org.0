Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C63B93005A2
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Jan 2021 15:39:53 +0100 (CET)
Received: from localhost ([::1]:39560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2xbM-00043v-Tr
	for lists+qemu-devel@lfdr.de; Fri, 22 Jan 2021 09:39:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2xaM-0003bF-Rk
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:38:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41496)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l2xaI-0001oj-54
 for qemu-devel@nongnu.org; Fri, 22 Jan 2021 09:38:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611326325;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8436w1rC1HzNIW0qO4PX8tfLxzapj9eezSdbt86sbdQ=;
 b=gWwWSdO2v/T8KdAqypGb2ph/L1++0AtyGJh2ns8QbBcR219Kib2Xo9/kuLk+uOnuZpwLyY
 o8rf55wqadUpGGXIK1r0lobBIEBlGn6ilqTut9sF7SKWtS3LflR+SyWuSq551UqzP5WuR+
 FQqeOi9sk/PoaHGI9JIxPUIkTKZJtJA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-4u2NVSuoO9m_uQsEkcLqQA-1; Fri, 22 Jan 2021 09:38:43 -0500
X-MC-Unique: 4u2NVSuoO9m_uQsEkcLqQA-1
Received: by mail-ed1-f72.google.com with SMTP id m16so2983568edd.21
 for <qemu-devel@nongnu.org>; Fri, 22 Jan 2021 06:38:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=8436w1rC1HzNIW0qO4PX8tfLxzapj9eezSdbt86sbdQ=;
 b=CqMd3L9+TyFuYXOaX+ZnXsw1BJhzP9QpqReL1Vcx2hmSdXYYK+v7PcMrqV4pAlT0+X
 70EvGJOM1+22gLIgSUBYI5k9Om7XEG3QuCO7CFDXPEnGLkNd0/JDXyyqEGuEtU80DRWw
 aKWqM5osZ9FLt92kXwVXkFJePB6hdzFX0z5s2xTOrSAgH74JH+jj0OqjvMfVETHAjj0A
 PLJi7NqsA5nKGmhcAdVZ8a4x94+qO16Pbn+NbYZbnevmeSUp7txNBDiRh3PD5wgEs5KH
 /o/cu3D5zeRQNWUE93VCf7PMyqlluN7ab/CQ7A2C50ZsAAcTSHo4xamgGH6Id/EgQdYw
 THIQ==
X-Gm-Message-State: AOAM530Ic1IcW4CdrTfZ5ucyc169+aZq8AMo8QMIm7EndKPx4vMQBfdu
 R4oLx/bM4Ewzq238y3VfRa71OGqWA4ZE5VJ29PG0g7V//tTW2u3loZ66XjbftKrH6ZL4so8NQgz
 +0eZEH7ExMv1KGXMlnCVxO7tKi2FUN1r3xgF8htrqeS/VhENlhvBBu5aOuWNRvPBSms0=
X-Received: by 2002:a17:906:f85b:: with SMTP id
 ks27mr3068753ejb.20.1611326322223; 
 Fri, 22 Jan 2021 06:38:42 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxd6rniRtNIA9Cj1B59aPViy/fyXdCJ8Jd0PU06GdCTCEY2fxNbKnPm7+2QGmcECC1XjD76SA==
X-Received: by 2002:a17:906:f85b:: with SMTP id
 ks27mr3068740ejb.20.1611326322027; 
 Fri, 22 Jan 2021 06:38:42 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e?
 ([2001:b07:6468:f312:5e2c:eb9a:a8b6:fd3e])
 by smtp.gmail.com with ESMTPSA id l1sm4478366eje.12.2021.01.22.06.38.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Jan 2021 06:38:41 -0800 (PST)
Subject: Re: [PATCH 06/25] tests: convert check-qom-proplist to keyval
To: Markus Armbruster <armbru@redhat.com>
References: <20210118163113.780171-1-pbonzini@redhat.com>
 <20210118163113.780171-7-pbonzini@redhat.com>
 <87y2gl2h4a.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <c9045f27-27bf-5b93-911c-ddce47ed2a84@redhat.com>
Date: Fri, 22 Jan 2021 15:38:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <87y2gl2h4a.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.182,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.221, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: kwolf@redhat.com, imammedo@redhat.com, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22/01/21 15:14, Markus Armbruster wrote:
> ok 2 /qom/proplist/createv
> Unexpected error in find_list() at ../util/qemu-config.c:24:
> There is no option group 'object'

Hmm, maybe a semantic conflict when I rebased.  I'll take a look.

>> +    qdict = keyval_parse(params, "qom-type", &help, &err);
> 
> Why parse again?

I don't remember why I did it that way, but it does seem cleaner. 
Unlike QemuOpts, which are persistent until qemu_opts_del and can be 
retrieved later, keyval's result only survives as long as you want it to 
survive, and are leaked if you don't unref the qdict.  Parsing every 
time the object is created seems more similar to the way the vl.c code 
works.

>> -     * cmdline-parsing via qemu_opts_parse() results in a QemuOpts entry
>> -     * corresponding to the Object's ID to be added to the QemuOptsList
>> -     * for objects. To avoid having this entry conflict with future
>> -     * Objects using the same ID (which can happen in cases where
>> -     * qemu_opts_parse() is used to parse the object params, such as
>> -     * with hmp_object_add() at the time of this comment), we need to
>> -     * check for this in user_creatable_del() and remove the QemuOpts if
>> -     * it is present.
>> -     *
>> -     * The below check ensures this works as expected.
>> -     */
>> -    g_assert_null(qemu_opts_find(&qemu_object_opts, "dev0"));
>> +    g_assert(user_creatable_add_dict(qdict, true, &err));
> Am I confused, or are you going from two to three creates?  Should this
> be in a separate patch?

It's a different way to test for "you can create another object with the 
same id" you had before.  It used to check for NULL qemu_opts_find, now 
it checks directly that the creation succeeds.  I can put it in the 
commit message.

Paolo

>> +    g_assert(err == NULL);
>> +    qobject_unref(qdict);
>> +
>> +    dobj = DUMMY_OBJECT(object_resolve_path_component(object_get_objects_root(),
>> +                                                      "dev0"));
>> +    g_assert(dobj);
>> +    g_assert_cmpstr(dobj->sv, ==, "Hiss hiss hiss");
>> +    g_assert(dobj->bv == true);
>> +    g_assert(dobj->av == DUMMY_PLATYPUS);
>> +    g_assert(object_resolve_path_component(object_get_objects_root(), "dev0")
>> +             == OBJECT(dobj));
>> +
>> +    object_unparent(OBJECT(dobj));


