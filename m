Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFA43514583
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 11:38:45 +0200 (CEST)
Received: from localhost ([::1]:33638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkN5I-0003wf-SX
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 05:38:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52474)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nkN2O-0002uq-Ra
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 05:35:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:21994)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1nkN2K-0006cv-LI
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 05:35:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651224939;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=W/G4RiRzZI/dUaK0pFVOMPhwxmB/ZsZu/5zzUovK6Ig=;
 b=FA/+Z6s6w+wAqwwiu4od+bHXb1dqNYzEzMPgsLZKZWsXvcXSXFHMF8yMQUeJpu+9VEuCFB
 HeWf35hHMnIRZ0RSIPiKWSj6Wt/pk0h1zDx71Z1N2TwTnYftuTLFwnAARh652CrgCKXXtY
 TATOX2SEfuClX7GP7tnC60t80dwiux4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-324-F_PBwsxrMZeLKrBRseD1Jg-1; Fri, 29 Apr 2022 05:35:38 -0400
X-MC-Unique: F_PBwsxrMZeLKrBRseD1Jg-1
Received: by mail-wm1-f72.google.com with SMTP id
 y11-20020a7bc18b000000b0038eac019fc0so2265607wmi.9
 for <qemu-devel@nongnu.org>; Fri, 29 Apr 2022 02:35:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=W/G4RiRzZI/dUaK0pFVOMPhwxmB/ZsZu/5zzUovK6Ig=;
 b=T0BbEAs/eZSkY6d7WIETJ+n9X0/KLxh7VAzrxRMzWGBDWurJK/V/db6CrbeV6rdZ5B
 jX37SPDpn8WYTNv0waAMjm2t55PtGzAJaEdkN0Zv1m5/NRXDRUTjGTNk8ANJUrE/OZ5l
 7fWgsDzlwLmzAeK82NidVx77Mp48TWt2kZL9wbCzqlbKlSW+lDzOJidy3LnHv62l+Cgi
 tSI9VzUeI7KXtnakJlYflu6erTICfGLYDE0AqVFE7ko2bfX/+fJAw7T+cgofA9hyktpm
 zuUOaTEKeHbr26L6LEonmIVyi+ReyhPhRJV+RA+Y5YdW1TwHE/pLSGwOoqK2uIqiz1VP
 4YiA==
X-Gm-Message-State: AOAM53303BLRsnHrkEu19f4q7csCVKRaToXW0mqJt/wlSQG1K3084rcS
 qPtl3N621wsVVQPhCzcjVJTP3Z1bkvzAF6ERI4ZyiILe+1jb/rHOEyJ7s1Juzn1xaYmub/Pt/aK
 1HsWYTqyP0rpCRPI=
X-Received: by 2002:a05:600c:418a:b0:394:11cd:4e8e with SMTP id
 p10-20020a05600c418a00b0039411cd4e8emr2326675wmh.46.1651224936912; 
 Fri, 29 Apr 2022 02:35:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxktlhxXshKyKbRpHHAFqsEOTtxuIslVzDOoR4d/X/pRt0lgeU+pbGkrr4l+eR/Fh7f9nN+fw==
X-Received: by 2002:a05:600c:418a:b0:394:11cd:4e8e with SMTP id
 p10-20020a05600c418a00b0039411cd4e8emr2326643wmh.46.1651224936581; 
 Fri, 29 Apr 2022 02:35:36 -0700 (PDT)
Received: from ?IPV6:2a02:1206:4552:34c0:71ab:1dfe:eb3b:43f9?
 ([2a02:1206:4552:34c0:71ab:1dfe:eb3b:43f9])
 by smtp.gmail.com with ESMTPSA id
 q1-20020a1c4301000000b00394145534bbsm2258629wma.9.2022.04.29.02.35.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Apr 2022 02:35:36 -0700 (PDT)
Message-ID: <19502784-99a5-69a4-d8c8-3e5de6d5137a@redhat.com>
Date: Fri, 29 Apr 2022 11:35:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH v2 2/8] coroutine-lock: release lock when restarting
 all coroutines
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20220426085114.199647-1-eesposit@redhat.com>
 <20220426085114.199647-3-eesposit@redhat.com>
 <Ymp4vs+oMc7pipe7@stefanha-x1.localdomain>
 <299ad2eb-e0a1-d3e3-8214-c54e299de99c@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <299ad2eb-e0a1-d3e3-8214-c54e299de99c@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



Am 29/04/2022 um 00:14 schrieb Paolo Bonzini:
> On 4/28/22 13:21, Stefan Hajnoczi wrote:
>> It's unclear whether this patch fixes a bug or introduces a new API that
>> will be used in later patches.
>>
>> The commit message is a bit misleading: existing functions are not
>> changed to release the lock when restarting all coroutines.
>>
>> I think what this commit is actually doing is adding a new API that will
>> be used in later patches?
> 
> I think this patch overlaps and can be replaced by these
> (https://lore.kernel.org/qemu-devel/20220427130830.150180-1-pbonzini@redhat.com/T/#t).
>  I wrote them after a discussion with Emanuele, and it looks like the
> same discussion begot this patch on his side.
> 
> Paolo
> 
Makes sense, I will rebase on top of your serie.

Emanuele


