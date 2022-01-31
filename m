Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 109CA4A4BE4
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 17:25:01 +0100 (CET)
Received: from localhost ([::1]:55992 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEZU3-0000C6-QH
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 11:24:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nEZ6p-00059m-K2; Mon, 31 Jan 2022 11:00:53 -0500
Received: from [2a00:1450:4864:20::42e] (port=44628
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nEZ6m-0004aU-13; Mon, 31 Jan 2022 11:00:50 -0500
Received: by mail-wr1-x42e.google.com with SMTP id k18so26351766wrg.11;
 Mon, 31 Jan 2022 08:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sAxJ1Dca+tNjO9U9DPuhqnvDtvZy2t/n4sgaM6OmYJ0=;
 b=JWQvD15Bk2i41h9etDQyLPPBrAKjdWmLYBMV/x1JUtkWMrOO60iTEid4VVo6NmMdt3
 TJzqwM7KXeaGIoBsdKWmoj5vShzmqo+xgjvaStM91lDMlLFNAsZJMnLTeaJP6y52xi4H
 MCR7ol7cCcaj8Vt8XJ695QpJ1WMBgIny0HVYc4mIA6gQDgvm9ZYeBWGgdrC6lkMa7luR
 +uTLjqLwDhe4YBy/6uAQPd92ghpHHh0Rx4WIBZjJPLpNgECLqL/hBipQmMh3UaRkIL+t
 uVcdUsf1GEmA9EDPp3E2uycgTOYwiLH5u/xxdFGCb+c4xHmKzpTsinRFzQcvQj4OPViB
 FN/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=sAxJ1Dca+tNjO9U9DPuhqnvDtvZy2t/n4sgaM6OmYJ0=;
 b=715VIjo03A16fnUZ0QpcUPjd4D6J5Z8x9gG4BuujG1CerFHA+SDeJ2HBsHPjs3F4MJ
 SvU+egP/qeiy75E68tzbDTdYG6WQHpmDi0EJD79+8+8+0QYwqsDScqbjg3WXEf2qMzna
 IrzRMO6ZIp4dFFwOl7x+PM9XSnl4FVfV78gZrsEoOi/6342l2rP61GbWpM19azf4WKRk
 dY0dhcYiRD7sIicsX9VDA45EdycJCPzqJybJX+VvMx/kopNeXG4MchPPJPkErdSl6dib
 vQKMzVg7mJ4HJwdy0hppk1AD0NtEH/Bej+PKc12iwusI2xjPQQYNoo/qxy3e9zVHtVDP
 O90A==
X-Gm-Message-State: AOAM532tjERkL16pJQLqmQWwfDpUSCgwEZ9nim61cieBj4TGssinkjsd
 +Gc7/ERC0XEBJNTuIvGxrqI=
X-Google-Smtp-Source: ABdhPJzmz6bPYc/3Hwz10REc1oJ4KXtuppdFcYyBYnLOYP5QrjVhbTVzhRqf2dviBgS1OI/neGXUmA==
X-Received: by 2002:a5d:5408:: with SMTP id g8mr18790832wrv.703.1643644845615; 
 Mon, 31 Jan 2022 08:00:45 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 o12sm14569984wry.115.2022.01.31.07.59.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 31 Jan 2022 08:00:45 -0800 (PST)
Message-ID: <dae7ed3d-5e25-7075-96fd-3a059c8e7b2c@redhat.com>
Date: Mon, 31 Jan 2022 16:59:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v6 20/33] block: rename bdrv_invalidate_cache_all,
 blk_invalidate_cache and test_sync_op_invalidate_cache
Content-Language: en-US
To: Emanuele Giuseppe Esposito <eesposit@redhat.com>, quintela@redhat.com
References: <20220121170544.2049944-1-eesposit@redhat.com>
 <20220121170544.2049944-21-eesposit@redhat.com>
 <87r18x5s70.fsf@secure.mitica>
 <8101768a-6f0d-ccb2-7c3d-810118dc7875@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <8101768a-6f0d-ccb2-7c3d-810118dc7875@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
 qemu-block@nongnu.org, John Snow <jsnow@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Greg Kurz <groug@kaod.org>,
 qemu-ppc@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 Kevin Wolf <kwolf@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/27/22 10:18, Emanuele Giuseppe Esposito wrote:
>>>           /* Make sure all file formats flush their mutable metadata.
>>>            * If we get an error here, just don't restart the VM yet. */
>>> -        bdrv_invalidate_cache_all(&local_err);
>>> +        bdrv_activate_all(&local_err);
>> I guess that we can change the comment here, it just looks weird the
>> comment saying flush() and the function nawed _activate()
>>
> Do you think it's enough to replace "flush" with "activate"? I am not
> sure whether "activate their mutable metadata" is meaningful.

"Activation" consists of throwing away mutable metadata.

That's what "flush" means in this case, but it is often interpreted as 
"persisting" the metadata instead.  So perhaps s/flush/throw away/.

Paolo

