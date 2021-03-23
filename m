Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AEF34667E
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 18:37:17 +0100 (CET)
Received: from localhost ([::1]:44916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOkxw-000212-7D
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 13:37:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lOkYL-00058X-TT; Tue, 23 Mar 2021 13:10:49 -0400
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e]:41588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1lOkY8-0003OQ-BS; Tue, 23 Mar 2021 13:10:49 -0400
Received: by mail-qk1-x72e.google.com with SMTP id v70so15093462qkb.8;
 Tue, 23 Mar 2021 10:10:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=iYuBeDZ+/7JixTxxEQO1pFzxyj+vRjXxTu9U8JeiyuI=;
 b=kFwAcWN8aclSQ7q8P+M3/OKPioEDl/BQQPlHFnmbqLMC1jIH7tuEEi+UAwcEqGNTbl
 E7cJXJQA9zL+/j1OSXrBW+ozr5xnsqgCoH4SDy9HGEHRc5bSnWogsgMNm4FO9DfCXDce
 hoHtW2GuhOrYIzpfbsE5GqzLC8RAxkNqGX7Hel3D8AD7R/YQFNc28C/J1sPxf1nrKJXY
 TYI1Cf+tRuWFhMyZxNd5w0bnzxu6W3s8f8o9V3NuUxiaIFo5iuMcV6uMv8PzBMO4JPuJ
 fHPDT9cPBHi0CwxFhn9BvaWSy/DV4Vp6lhuZgy3ugaO5qbs+kX2Akohm9PLwF2+JtgAd
 qSEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=iYuBeDZ+/7JixTxxEQO1pFzxyj+vRjXxTu9U8JeiyuI=;
 b=nqDgtK/t7Ru5wnRyGhdWayiFtErFFQXrYhQQOf6Yk/1llbU7pfI0V3OgBaCh2InqDB
 zhpQDZSVwof0Ejlr5QLcdrvsSHYPnYajl2+OGvF8Ne3A+2NAuCnnnrheRodKNf2uKUCx
 caF1tbiltKlbTiUvKIZR/FsIn9LRAALChb8/Z1uiuajUz7H/vhRIHoPZh67xoeiFPwRI
 yjq+VQwstBgI/448BxElnzZWQQmq49Vs1UZFV+2UzpfSorGB5R5zRiLEkdv3HyYsKJWj
 oMnRAJxabXeVeThZi/DkmDhnb6NbFZ5ryoQHMhq2yIvDASSVnSFhZ6CpBVBileoqXQ6I
 xpzw==
X-Gm-Message-State: AOAM531BFUsTVKI4gM2d2vPeR4xPwqnNkjVf1dyYVuscu2e0uWtQSj2F
 K5H9KTvF/Mb64D+P23fNej0=
X-Google-Smtp-Source: ABdhPJwtzPbHWV0EyONK/nrR4kTf9dD+gWATpoXTO8FwY6vYoM//HERqrQICIHJYw2Mp5kp9xIu6tQ==
X-Received: by 2002:a37:6491:: with SMTP id y139mr6407830qkb.483.1616519426297; 
 Tue, 23 Mar 2021 10:10:26 -0700 (PDT)
Received: from ?IPv6:2804:431:c7c6:3fd7:65e0:e5c6:f4fc:733c?
 ([2804:431:c7c6:3fd7:65e0:e5c6:f4fc:733c])
 by smtp.gmail.com with ESMTPSA id l6sm13972441qke.34.2021.03.23.10.10.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Mar 2021 10:10:26 -0700 (PDT)
Subject: Re: [PATCH 0/4] DEVICE_NOT_DELETED/DEVICE_UNPLUG_ERROR QAPI events
To: David Gibson <david@gibson.dropbear.id.au>
References: <20210312200740.815014-1-danielhb413@gmail.com>
 <YFlAheldkqCkZytI@yekko.fritz.box>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-ID: <b8d96ab9-61e5-b941-6405-5beff5fe0df5@gmail.com>
Date: Tue, 23 Mar 2021 14:10:22 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFlAheldkqCkZytI@yekko.fritz.box>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72e;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: armbru@redhat.com, qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 3/22/21 10:12 PM, David Gibson wrote:
> On Fri, Mar 12, 2021 at 05:07:36PM -0300, Daniel Henrique Barboza wrote:
>> Hi,
>>
>> This series adds 2 new QAPI events, DEVICE_NOT_DELETED and
>> DEVICE_UNPLUG_ERROR. They were (and are still being) discussed in [1].
>>
>> Patches 1 and 3 are independent of the ppc patches and can be applied
>> separately. Patches 2 and 4 are based on David's ppc-for-6.0 branch and
>> are dependent on the QAPI patches.
> 
> Implementation looks fine, but I think there's a bit more to discuss
> before we can apply.
> 
> I think it would make sense to re-order this and put UNPLUG_ERROR
> first.  Its semantics are clearer, and I think there's a stronger case
> for it.

Alright

> 
> I'm a bit less sold on DEVICE_NOT_DELETED, after consideration.  Does
> it really tell the user/management anything useful beyond what
> receiving neither a DEVICE_DELETED nor a DEVICE_UNPLUG_ERROR does?


It informs that the hotunplug operation exceed the timeout that QEMU
internals considers adequate, but QEMU can't assert that it was caused
by an error or an unexpected delay. The end result is that the device
is not going to be deleted from QMP, so DEVICE_NOT_DELETED.

Perhaps we should just be straightforward and create a DEVICE_UNPLUG_TIMEOUT
event.



Thanks,


DHB


> 

