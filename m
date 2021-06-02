Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C5779398835
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Jun 2021 13:25:10 +0200 (CEST)
Received: from localhost ([::1]:45836 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loOzl-0007KB-ED
	for lists+qemu-devel@lfdr.de; Wed, 02 Jun 2021 07:25:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loOym-0006XN-VD
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 07:24:09 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28235)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1loOyi-0002pj-La
 for qemu-devel@nongnu.org; Wed, 02 Jun 2021 07:24:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622633043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=CAdK2/kvM+SeiOCkkWSllpyf1ssmTx0OdOroXfhissQ=;
 b=eabgotP6Mwj0NZ32qH8128rsPO924wQ0J0yrfFBruxt/4AATWVBG5TzodzqkO7pTu4Bu0s
 px2e7kQArGnhTBNVZm8MOhjiYNFUCiTk32j5K29rlR/T2pBi1RMm7CcZLgvbme6zZVYEYG
 cUJburz2GMusR0iPIBZqq511A3HLe0k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-398-Vc5BNO1SO72rCsLRiHS9Lg-1; Wed, 02 Jun 2021 07:24:01 -0400
X-MC-Unique: Vc5BNO1SO72rCsLRiHS9Lg-1
Received: by mail-wm1-f69.google.com with SMTP id
 19-20020a05600c2313b0290193637766d9so2060398wmo.7
 for <qemu-devel@nongnu.org>; Wed, 02 Jun 2021 04:24:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CAdK2/kvM+SeiOCkkWSllpyf1ssmTx0OdOroXfhissQ=;
 b=RtkeCsUZlm2Tb/bSG5ZD57tKdkPRE8PL5Y7iuI7VRU5NgrFR9KCqmrJf6wK3H7e+PR
 N/AN9fIv3RqYXj55B3B4UKPB4YJaV6x1W8xw2ElwkeV2tlNzhR7NpgejYElubu+mCC51
 THK2dkNgljt21nwnleR3yIxgXWZ0b/1GBwEkTQ4ECnQnWbhNFvHhk2ckcyLFssYC+Qjb
 4oCCYskUsgJBxjJ7wR7ink/XVEkdHArpwUjNDTv1nDM2XN85ojQsUtHaJdIz+UUnnIQH
 NJ/MwO50tmxmaYo/f9lvcRwF0hONoPfXfg2xDTLUiEWkILX6TlVOav5rASC0/VHXTEeK
 NYMg==
X-Gm-Message-State: AOAM531iGTnxd1ETSjPn5Xsl2rk5/xXt1zdWtRqQwBfbLE/rKgKBVIL+
 fL/kVJHV5zTVRWvZB+GuqXSOmMl+/AuJP3vE9+fUnC2gXxlQk1hz5HzeOmbyl+yXVR/TZQty6+d
 +0zNSJJ1MJYSQGq4=
X-Received: by 2002:adf:f043:: with SMTP id t3mr4503191wro.422.1622633040550; 
 Wed, 02 Jun 2021 04:24:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz7vyaUAfVev4S/EuR5tZ3p2Y/ZAqKacmC58le5IzwsLA9yBGUzE9wxGlgUWL8ACfu5o75qWw==
X-Received: by 2002:adf:f043:: with SMTP id t3mr4503167wro.422.1622633040193; 
 Wed, 02 Jun 2021 04:24:00 -0700 (PDT)
Received: from thuth.remote.csb (p5791de31.dip0.t-ipconnect.de.
 [87.145.222.49])
 by smtp.gmail.com with ESMTPSA id u18sm2411783wmj.15.2021.06.02.04.23.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 02 Jun 2021 04:23:59 -0700 (PDT)
Subject: Re: [RFC v4 11/14] target/s390x: remove kvm-stub.c
To: Cornelia Huck <cohuck@redhat.com>, "Cho, Yu-Chen" <acho@suse.com>,
 qemu-devel@nongnu.org, qemu-s390x@nongnu.org
References: <20210524025256.22252-1-acho@suse.com>
 <20210524025256.22252-11-acho@suse.com> <87sg20pmva.fsf@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <ca53df2d-6633-6cf8-f0a8-76d5373b7e85@redhat.com>
Date: Wed, 2 Jun 2021 13:23:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <87sg20pmva.fsf@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.371,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.613, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
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
Cc: david@redhat.com, richard.henderson@linaro.org, pasic@linux.ibm.com,
 borntraeger@de.ibm.com, cfontana@suse.de, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02/06/2021 12.44, Cornelia Huck wrote:
> On Mon, May 24 2021, "Cho, Yu-Chen" <acho@suse.com> wrote:
> 
>> all function calls are protected by kvm_enabled(),
>> so we should not need the stubs.
>>
>> Signed-off-by: Claudio Fontana <cfontana@suse.de>
>> Signed-off-by: Cho, Yu-Chen <acho@suse.com>
>> ---
>>   target/s390x/kvm-stub.c  | 126 ---------------------------------------
>>   target/s390x/meson.build |   2 +-
>>   2 files changed, 1 insertion(+), 127 deletions(-)
>>   delete mode 100644 target/s390x/kvm-stub.c
> 
> (...)
> 
>> -int kvm_s390_get_gs(void)
>> -{
>> -    return 0;
>> -}
> 
> Unrelated to this patch: Nobody seems to call kvm_s390_get_gs()
> (anymore?); are we missing something, or can that function be removed?

The last user has likely been removed with 0280b3eb7c0519b43452 ("s390x/kvm: 
use cpu model for gscb on compat machines"). I think this could be removed now.

  Thomas


