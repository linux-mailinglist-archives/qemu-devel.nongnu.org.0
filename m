Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E1A3495DEC
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 11:47:38 +0100 (CET)
Received: from localhost ([::1]:38918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nArSD-0005L8-5G
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 05:47:37 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48452)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAr44-0002vy-UX
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 05:22:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nAr3x-0004WQ-CK
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 05:22:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642760543;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uwrJRSUiJ5O3HV6D+Q3PRC/MBy33u+EPEvzo620SRew=;
 b=DPZe4TdSx45AKAxJEu6+tGFVQPIRUCGVrGkE3oadBfx14FzD6nW/rRDugfRWdMClmAqWz7
 NVuqTN8p9ifsUcCOrH94VVjWlkjEX9VWy0hpK444Ub7bLNYq8Kn+OCU1Db6m00qSFHQ0CC
 +7ofFS2VFedWawXTOCZlzZ57XdPuSOc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-631-dzY12VyLNPK92T03MqIh0w-1; Fri, 21 Jan 2022 05:22:22 -0500
X-MC-Unique: dzY12VyLNPK92T03MqIh0w-1
Received: by mail-ed1-f70.google.com with SMTP id
 o25-20020a056402039900b0040631c2a67dso2462214edv.19
 for <qemu-devel@nongnu.org>; Fri, 21 Jan 2022 02:22:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uwrJRSUiJ5O3HV6D+Q3PRC/MBy33u+EPEvzo620SRew=;
 b=5vP7ogt+li+wfvhX0FCSySLU8BfpCMG6av3Z1pfh1noxwklLapmngqcW6RbmEm2jox
 D8PnMZgVySS5UrcWKwwH4pEb4F/anVFv7jgBvb94e+na9E+bt2LDxuWxQ2Dz11f6/53X
 d39NcTjNZwHb2uKNW0TwsPOPjic1wLQShUkYecNSI7g9wxFr4Y5LIdDRLwedueb9sfVA
 SZhRTtwbsk64SW1xxxstEDubRWCmQFsjRgCojR0GqFETKfWNKS+gAdxBTdgPLhCSS+gk
 plNi0KWV6k0TA+kHxPZeKUGvLoU/SL/2wYjyZegBYIpxGgOQNwiLQZwTDg4qL94ntJd3
 Ag7A==
X-Gm-Message-State: AOAM530zqEt/bF6Tgsw0Ln1uNWCxznqZ1rKX7YnurmlaaXtaQqEUC6Pu
 35Y22Qnl5CgLkNgOe3MKSlHIYzZXKpx+/BHE0kDRWPMErE0rghCPbafQQbn66gIrfVRhx2zvNBI
 dNvp1ZosvVAFXQxI=
X-Received: by 2002:a05:6402:13c6:: with SMTP id
 a6mr3629813edx.222.1642760541159; 
 Fri, 21 Jan 2022 02:22:21 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy1n8A+v+TcUY6IvbZPIAnjLEoqs4oPmcNBgvPqM47kqvgJlEXRkhkCquWXZE0OCtPYNFDDew==
X-Received: by 2002:a05:6402:13c6:: with SMTP id
 a6mr3629785edx.222.1642760540879; 
 Fri, 21 Jan 2022 02:22:20 -0800 (PST)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id i3sm2415598edb.13.2022.01.21.02.22.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Jan 2022 02:22:20 -0800 (PST)
Message-ID: <827ae9c0-054b-7929-c683-b5e3159d4f83@redhat.com>
Date: Fri, 21 Jan 2022 11:22:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v5 28/31] block.c: assert BQL lock held in
 bdrv_co_invalidate_cache
To: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
References: <20211124064418.3120601-1-eesposit@redhat.com>
 <20211124064418.3120601-29-eesposit@redhat.com>
 <56deaef1-6a4e-c544-9916-42a20cc20c7a@redhat.com>
 <9ca5c434-ddf6-2ed3-08ae-92da5fc98013@redhat.com>
 <b1e190b3-7466-0d4e-554b-bd9d4ce5a43e@redhat.com>
 <YehZwkGVPK6phrc2@redhat.com>
 <a32d2d69-7af4-3748-6de1-4367b51e4985@redhat.com>
 <YeloRLeycEFvekFc@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <YeloRLeycEFvekFc@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 John Snow <jsnow@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 20/01/2022 14:48, Kevin Wolf wrote:
> Am 20.01.2022 um 14:22 hat Paolo Bonzini geschrieben:
>> On 1/19/22 19:34, Kevin Wolf wrote:
>>> So if we go back to a bdrv_invalidate_cache() that does all the graph
>>> manipulations (and asserts that we're in the main loop) and then have a
>>> much smaller bdrv_co_invalidate_cache() that basically just calls into
>>> the driver, would that solve the problem?
>>
>> I was going to suggest something similar, and even name the former
>> bdrv_activate().  Then bdrv_activate() is a graph manipulation function,
>> while bdrv_co_invalidate_cache() is an I/O function.
> 
> I like this. The naming inconsistency between inactivate and
> invalidate_cache has always bothered me.
> 

Ok, I am going to apply this. Thank you for the suggestion!

> Did look further, couldn’t find anything else interesting.
> So I think(TM) that this blk_exp_add() is the only thing that needs fixing.

When splitting the logic between bdrv_activate and 
bdrv_co_invalidate_cache, there is no need anymore to fix blk_exp_add :)

I am going to send v6 by the end of today.

Thank you,
Emanuele


