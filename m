Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E6A3A0546
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 22:48:20 +0200 (CEST)
Received: from localhost ([::1]:54816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqie3-0006Zz-F4
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 16:48:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lqicm-0005fD-3y
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 16:47:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51061)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ckuehl@redhat.com>) id 1lqici-0003B3-9T
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 16:46:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623185215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7iFIsv8weNI7pBKb9Cr9P4VVovWcGTbIzKRjEhsQWCs=;
 b=ZBcvNKeNzM4NP2cHmTmp4JF4nuni5dxfYTClGZbblCChmhP3xRYczXa2cfDP2/nV3gPtQC
 NVYrKpHoimJEDlN+XhX5+yW6nrglKtigp8JxwzIH83BprH7EU+nPMJmIOm6QyOzYFkoXRp
 zKn09vWb5+zB4yZCktdKUk5N0p56XKo=
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-48-K2FmEh9SMiuepRatmiAO0g-1; Tue, 08 Jun 2021 16:46:54 -0400
X-MC-Unique: K2FmEh9SMiuepRatmiAO0g-1
Received: by mail-ot1-f69.google.com with SMTP id
 19-20020a9d04130000b02903cb28b38d0aso13306126otc.19
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 13:46:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7iFIsv8weNI7pBKb9Cr9P4VVovWcGTbIzKRjEhsQWCs=;
 b=Z2B2io4xbkgA/5eRYe6306CKfdfSq5bc7P9r55SW9qum+zwmFZkcR6EXY+CySlx5p0
 6ynuV5aRJhMt6uMp7TLUd1T64sbsL/e37+A8mCL2cHJw2NRDTF1sleu6WAPGIXiDD9hX
 7ruUpmXcVMUafLo2B/ryh6fFgWlBzd9kms43OpUE77tLcQk+HV/MXFzW0rY93LNVVia6
 aavefRHjmu/jC/0juYu0PK1d8JUftrXCrKyDm4bCBHIlU8tjX0kf2sxmQ0L4jac2FbDz
 HPabEWOszQxL3R1tn5qSa8eKrgdIpW4+ynmufDTuvmNCzwDycfEZlXQp8CAKV/c9mMAE
 JLrQ==
X-Gm-Message-State: AOAM533dLPwIG9AyCK8hbb8CY3eGnd/BmKSt+NQDPYWOzbwCEInvNgzO
 c+vHAQUj9pW/N+boOUIvwlZxG274TwPoPLF8aTJfvkZtZmjZTe4iS74xPXte0+QiNvs8pB+5oaO
 jX32Xzbotb9Vi+ak=
X-Received: by 2002:a9d:7497:: with SMTP id t23mr11245207otk.124.1623185213664; 
 Tue, 08 Jun 2021 13:46:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzkVohRvikEzk2q34jxBQCsrGZE9jeidvhKjaI7Tg4o5/7n6rfIoTkWF/vB1GPpHfV6uluxxg==
X-Received: by 2002:a9d:7497:: with SMTP id t23mr11245199otk.124.1623185213518; 
 Tue, 08 Jun 2021 13:46:53 -0700 (PDT)
Received: from [192.168.0.173] (ip68-102-25-99.ks.ok.cox.net. [68.102.25.99])
 by smtp.gmail.com with ESMTPSA id
 y16sm1981195oto.60.2021.06.08.13.46.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 13:46:53 -0700 (PDT)
Subject: Re: [PATCH] Add Connor Kuehl as reviewer for AMD SEV
To: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
References: <20210608192537.103584-1-ckuehl@redhat.com>
 <YL/GNQUr4g3dyOQC@work-vm>
From: Connor Kuehl <ckuehl@redhat.com>
Message-ID: <4a9a1fb2-0be2-a8df-c3cd-7db6619ff729@redhat.com>
Date: Tue, 8 Jun 2021 15:46:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <YL/GNQUr4g3dyOQC@work-vm>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=ckuehl@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ckuehl@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.197,
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
Cc: Tom Lendacky <thomas.lendacky@amd.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Brijesh Singh <brijesh.singh@amd.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 6/8/21 2:34 PM, Dr. David Alan Gilbert wrote:
>> Note: because there's no maintainer entry, when running
>> ./scripts/get_maintainers.pl on target/i386/sev.c, my name and the qemu
>> mailing list is the only thing that shows up... it doesn't even show
>> previous committers (as it would before applying this patch). Which is
>> probably not great considering I do not make pull requests to QEMU.
>>
>> Is the way forward to get someone to sign up as a maintainer before
>> applying a patch like this?
> 
> If you wanted to do a submaintainer for it and send it to one of the x86
> maintainers rather than having to do full pulls?

I'm not opposed to this. I think I have a few of the right people on CC,
so let's see if they weigh in on this. Unless it means I have to manage
a GPG key again... (just kidding, kind of...)

Connor


