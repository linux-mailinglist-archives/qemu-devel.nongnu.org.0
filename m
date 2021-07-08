Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF9DA3BF947
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 13:43:55 +0200 (CEST)
Received: from localhost ([::1]:39084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1SRe-0006Vk-IR
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 07:43:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m1SOZ-0003fA-Pv
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 07:40:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:20055)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1m1SOX-00006V-7n
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 07:40:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625744439;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9DXrOn4u74k8hJ7GN7TVh3OWyKdgSMct7PIr1JG9JU0=;
 b=Lkq2ZeLRVJHoJ+0ZvvV3PODiHKV1Nl0W6fc/ggC6vDpLkz3WXZLePc9UZAEIBBCSrpHf+e
 d0bMaSlSUsRhCHX+8EFQmozDEDpsR9O2eZEgPZyCxwx/yy/6GsWTxLuamS4/FOmAkK6Nde
 33444Rfg/50gmqepYrlmFCBhDdZti00=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-16-DH6l3WDjPGOWAygarSuVwQ-1; Thu, 08 Jul 2021 07:40:38 -0400
X-MC-Unique: DH6l3WDjPGOWAygarSuVwQ-1
Received: by mail-ed1-f71.google.com with SMTP id
 i19-20020a05640200d3b02903948b71f25cso3148458edu.4
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 04:40:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=9DXrOn4u74k8hJ7GN7TVh3OWyKdgSMct7PIr1JG9JU0=;
 b=oHrdZZIey2dvcUTOGFPqPGViXdV+oifKra9StjIB6ZhWj0ozYEvErFH1veNEZSKuZJ
 +G3bL8YPOUiykZdzriWFlWVjwgkqM7QblasEJI5+sOAAvwLOq2q6FeuCfuASWd3OmV0v
 dn4By97ZE/Ex0Izqsv1ohS7gR+3qSP92U50yDc3w1GMr1D/1/G6gzGxzFaSu4PKunCWZ
 +fGB8/MpgjOrbYWWNlRihDEvv7JzH9k4Bz83GT8fzoiX7VD2+QHzvPG/3Ysm8D2AHARR
 WvKTBoB2C0VL9OVBIJv+fuv+FzRH9kVzM40YgCm5bRfj/WAE5pVo2piHA7pwAbyq+dg4
 RIKQ==
X-Gm-Message-State: AOAM533xGsfr3zJG4H5ZmidF6FVb0oNXNFmyeSTZvTfJd1r2P6xxfpD0
 eY3pHGdUE7G4FEYUexoJD85cvGuslE7JY95fWNkVqseGMFtzgxHWfcMl2kzI7kAEPmAFIXCXd2D
 38pOufa9L+geQYsymLO43uSr40pZygE/0FGccPzC3RZuKd2FkF0jZlvRy9G3B0TdvQiA=
X-Received: by 2002:a17:906:d92:: with SMTP id
 m18mr29423788eji.309.1625744437195; 
 Thu, 08 Jul 2021 04:40:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxg9KfknK3O1QxYhG0FQ249V+Vt90iblU3nJYplv7VFH4lXxDH9gJwJCuT5Cu/eg/kndQWOpg==
X-Received: by 2002:a17:906:d92:: with SMTP id
 m18mr29423772eji.309.1625744436923; 
 Thu, 08 Jul 2021 04:40:36 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id e21sm842238ejy.54.2021.07.08.04.40.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 04:40:36 -0700 (PDT)
Subject: Re: [PATCH] qemu-config: never call the callback after an error, fix
 leak
To: Markus Armbruster <armbru@redhat.com>
References: <20210707121545.361829-2-pbonzini@redhat.com>
 <87eec99mzk.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <58b1152f-edd9-c533-b991-b873947a388c@redhat.com>
Date: Thu, 8 Jul 2021 13:40:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87eec99mzk.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.45,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 08/07/21 11:24, Markus Armbruster wrote:
> Looks like the patch fixes two separate issues:
> 
> 1. Memory leak on ferror()
>     Fixes: f7544edcd32e602af1aae86714dc7c32350d5d7c
> 
> 2. Callback can run on error.
>     Fixes: 37701411397c7b7d709ae92abd347cc593940ee5
> 
>     I*think*  this happens when the cb() further up fails, and when a
>     line following the [...] section header cannot be parsed.
> 
> Worth fixing the separate bugs in separate patches?

Yes, good idea.

Paolo


