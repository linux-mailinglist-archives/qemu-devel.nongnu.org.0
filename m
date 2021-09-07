Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED324029F7
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Sep 2021 15:42:33 +0200 (CEST)
Received: from localhost ([::1]:48448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mNbMu-0003X1-4y
	for lists+qemu-devel@lfdr.de; Tue, 07 Sep 2021 09:42:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNbL3-00087Q-GS
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:40:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mNbL0-0001gc-8l
 for qemu-devel@nongnu.org; Tue, 07 Sep 2021 09:40:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1631022033;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6bnm2h7OKv5gCIFYlzJNq4NnVH1mUbIuArDqOCNyKeQ=;
 b=fcphxu0Z9jPVPR5DAtwoAcQq0FRZRFCs+p+gkjEO6/KVW/ZwxdbNU+ohlAONQz9fZo6dm4
 p8uPhOUiwbZxrvH1PxJAgRGNNmmyf9HNm9mRtDp6cD0soWlvSF7LKVmoqCwISNVP3Aa7xx
 wWOwKfwWZFgpDH15MtpgOdGOKLQf60s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-29-lXmWfkiFNM2JuIo2LhXr7Q-1; Tue, 07 Sep 2021 09:40:30 -0400
X-MC-Unique: lXmWfkiFNM2JuIo2LhXr7Q-1
Received: by mail-wr1-f70.google.com with SMTP id
 r11-20020a5d4e4b000000b001575c5ed4b4so2129669wrt.4
 for <qemu-devel@nongnu.org>; Tue, 07 Sep 2021 06:40:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6bnm2h7OKv5gCIFYlzJNq4NnVH1mUbIuArDqOCNyKeQ=;
 b=jXV/E9OsbUzdCQWssq4dAqL8tQ007VC0IqTQPJ2EyI0nR4KlbZHmoEqHVK+dJ2f54s
 gX0O15zrDP5DPHdOrfYj2/YsObbub2hydMOPSqyMh7i509Qz8rloXJcXH6K6Qe5PYIFI
 MZjZtO/ILnjDk4FjuOirr7bUTe7KDnG4lctEwW3xmjmo004fQgNWMetcZqlvIOqugZYN
 C2PNIKBzFii3lstj0CI4MxkhLiKNefDnH3/QMOEeZ5jIBPqSCK272+7R03qCmaUKpXw+
 UEQ30L3Xi6aFsi1lwsu42cMB+XIdrwXtaNQivbyEJ6bykIkv+VZS+disAHZLvjbragc3
 VUzw==
X-Gm-Message-State: AOAM533S0F4yGDeO+XQvX5L7n//2nQvMF0AYJieXOlkcobf6iMYHXmSu
 iY8MI8NZ9WRYex9ktQWddD0OvFDS9+X8WdxS7Ngigrguu2Qk+ALQhtYtNrABV1j9shB1NzQPt9z
 Cx74hkUYVItyQnhHIr/1UbVF0LLj/hPRxX9X5VsuYLnLbtkNF3F+YRR5upp5Tv1Q=
X-Received: by 2002:a05:6000:1287:: with SMTP id
 f7mr4393126wrx.221.1631022029191; 
 Tue, 07 Sep 2021 06:40:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwr6Z4m0k3pBUTOVDCXp4bpNuXJ/jHeTNC0C+N/lmkSnX93AGSFsZ64+9RIr/ua7rIxR3swoA==
X-Received: by 2002:a05:6000:1287:: with SMTP id
 f7mr4393088wrx.221.1631022028903; 
 Tue, 07 Sep 2021 06:40:28 -0700 (PDT)
Received: from thuth.remote.csb (pd9e8396c.dip0.t-ipconnect.de.
 [217.232.57.108])
 by smtp.gmail.com with ESMTPSA id k18sm2414057wmi.25.2021.09.07.06.40.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Sep 2021 06:40:28 -0700 (PDT)
Subject: Re: [qemu-web RFC] CONTRIBUTING.md: Mention maintainers
To: Paolo Bonzini <pbonzini@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 qemu-devel@nongnu.org
References: <20210906170038.26602-1-hreitz@redhat.com>
 <63441b5c-2262-3b7a-e0bd-e6f41401a64a@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <2e3bd021-c4be-0ada-7965-f921c462b3bb@redhat.com>
Date: Tue, 7 Sep 2021 15:40:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <63441b5c-2262-3b7a-e0bd-e6f41401a64a@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -54
X-Spam_score: -5.5
X-Spam_bar: -----
X-Spam_report: (-5.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.391,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-2.332, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 07/09/2021 14.57, Paolo Bonzini wrote:
> On 06/09/21 19:00, Hanna Reitz wrote:
>> This is an RFC first because I feel bad about sending a patch that
>> gives people responsibilities who aren't me.  But Thomas seemed to agree
>> with me that making this requirement explicit would be nice, so I guess
>> someone has to send a patch for it...
> 
> Don't feel bad, I'll make sure you'll have to send a v2.  Actually I'm 
> kidding, this looks good to me and I've merged it.

Yes, that was a good idea. Ack from my side, too.

> But we should make a decision on accepting qemu-web merge requests on 
> GitLab.  For that, apart from touching the CONTRIBUTING.md file, we should 
> also edit https://www.qemu.org/2017/02/04/the-new-qemu-website-is-up/ which 
> suggests using "git send-email".

Not sure whether that old blog post is the right place for this information 
... we should maybe have a pointer to the information on 
https://www.qemu.org/contribute/ instead?

  Thomas


