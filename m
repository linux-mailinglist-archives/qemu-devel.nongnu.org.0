Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01D654A7870
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 20:02:31 +0100 (CET)
Received: from localhost ([::1]:41124 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFKtb-000082-J1
	for lists+qemu-devel@lfdr.de; Wed, 02 Feb 2022 14:02:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFJQ1-0000JX-BL; Wed, 02 Feb 2022 12:27:48 -0500
Received: from [2a00:1450:4864:20::536] (port=43793
 helo=mail-ed1-x536.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nFJPz-0002Vw-Jh; Wed, 02 Feb 2022 12:27:45 -0500
Received: by mail-ed1-x536.google.com with SMTP id w14so112598edd.10;
 Wed, 02 Feb 2022 09:27:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MikMA0d22y+q/AQEIA7ZjbnDwR6XV2zr4rJLRAkfXAc=;
 b=jSL1mVQDyQ7ARXZcAYup9iYgNeCUIiXC3VnDDb5IEy5m/B76tbiBoK8fgKxxbfZ8wS
 P7Dt+PHoYRhsoigQTGiB+n+IhkYqdMgJgOaLuhWBszOws5ktEV6tOu65UYQ1gK0evQg7
 sVkg4b5LK88kwumlMjixquTZaxyllhtBxtac3yFQShqGrXVFiHXSxcNCDbUwfgD2byvA
 eCZOSjs6Uakg6AIVdDE8Slw0yWq26I+pGpQkJhwvcDdsumdn+n9WTgGZL4AwUy8LytRQ
 7UJAi7TdSyCdVzPZx5jeg0NPonxOSY7NCBwFo4O/myhFLEaX4YQ7dhGL8fLe0KwExpJv
 0ueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=MikMA0d22y+q/AQEIA7ZjbnDwR6XV2zr4rJLRAkfXAc=;
 b=NHzIwFXnnArlYKdIEcpLxneBaorSn6aJ/9fTkirKyr7qRQfEU2o9855obHewVHs7EL
 5y6ElxtCTU699T7JFE04lg77P6+QP19wxS8d5vY04/gIt1+f2xSU9h6YraTbUZodVz3Y
 TZZJLjSB6r+0j+hYMlfgeuqYZ4eYmJKfn7kr0cy+NauH05KoBVIh0XnJ72xFfQUORb/5
 OhoAOrw7TY4D6+9c5SeqQbSqpZY4Ohh5Gk0mNXcetlanHwctNH8K00YzoDNpjZDBRoqA
 8Eju1k+9CTLfkrMOTuRviseWJEqWlc0cGmJjX067jYoMrAXt4BQylV5q8nMiCRQTjHI1
 cVaw==
X-Gm-Message-State: AOAM533BfM8i4qO9q1npuy7AqeaNfYBATJHc04B0BlORYNA8otG/KYqJ
 TSFbxDxAAT3GSYb/yyiq+dg=
X-Google-Smtp-Source: ABdhPJwDLS+ZE3FuSzajpq5KkV7i/Nyj4O0Jg+oxaaE01buqrTXSjJxS2cvHBsXA4w2LtkQGfmWjKA==
X-Received: by 2002:a50:eb82:: with SMTP id y2mr30905487edr.133.1643822860740; 
 Wed, 02 Feb 2022 09:27:40 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id a17sm21236149edt.19.2022.02.02.09.27.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Feb 2022 09:27:40 -0800 (PST)
Message-ID: <dbb3943a-ebb7-5979-8199-8808fa6953b7@redhat.com>
Date: Wed, 2 Feb 2022 18:27:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 21/33] block: move BQL logic of
 bdrv_co_invalidate_cache in bdrv_activate
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-22-eesposit@redhat.com> <YfJ79zaea6yFFh4w@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YfJ79zaea6yFFh4w@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::536
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::536;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ed1-x536.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Eduardo Habkost <eduardo@habkost.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-block@nongnu.org, Juan Quintela <quintela@redhat.com>,
 John Snow <jsnow@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/22 12:03, Kevin Wolf wrote:
>> +int coroutine_fn bdrv_co_invalidate_cache(BlockDriverState *bs, Error **errp)
>> +{
>> +    Error *local_err = NULL;
>> +
>> +    if (bs->drv->bdrv_co_invalidate_cache) {
>> +        bs->drv->bdrv_co_invalidate_cache(bs, &local_err);
>> +        if (local_err) {
>> +            bs->open_flags |= BDRV_O_INACTIVE;
> 
> This doesn't feel like the right place. The flag is cleared by the
> caller, so it should also be set again on failure by the caller and not
> by this function.
> 
> What bdrv_co_invalidate_cache() could do is assert that BDRV_O_INACTIVE
> is cleared when it's called.

Do you think this would be handled more easily into its own series?

In general, the work in this series is more incremental than its size 
suggests.  Perhaps it should be flushed out in smaller pieces.

Paolo

