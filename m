Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2F02C5716
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 15:28:45 +0100 (CET)
Received: from localhost ([::1]:48690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiIGK-0002qK-GG
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 09:28:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiIDP-0000da-Jm
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 09:25:43 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:52300)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kiIDM-00076N-IU
 for qemu-devel@nongnu.org; Thu, 26 Nov 2020 09:25:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606400739;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tsc4NmWuEixG7AgZvaz7cc5hyCUybYGoGj2+PRlKko0=;
 b=LP3BxqV/3H2I69gMPHKBtDtwZ+eSXoZIctFxVKzehXr+/6WHSmwttLDwfIya1V8g6KiuLb
 Va83ZBbJg62PvUTvRtqMpCxIykkFJ0+28V+NFYRuQB1s4YOw9EoziwRQjIZqUOPHSXPdgV
 fsOJ05Qv3Uqb6ozwVUhJ3W38e8Cs0xc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-N8gwnxVHMnaHpNO63YDtgQ-1; Thu, 26 Nov 2020 09:25:38 -0500
X-MC-Unique: N8gwnxVHMnaHpNO63YDtgQ-1
Received: by mail-ed1-f71.google.com with SMTP id b13so1165161edy.8
 for <qemu-devel@nongnu.org>; Thu, 26 Nov 2020 06:25:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=tsc4NmWuEixG7AgZvaz7cc5hyCUybYGoGj2+PRlKko0=;
 b=CzMtEvD9ifKWXIlS7N1707TrqpDF/vld6sQbyJNl99/ZzB6InBFuQmJVI4NTrQZ3jT
 MwwqOXWLi0f4B7XOqbSHDobVZQjapfhwXgtDENm0KFLRFWJ8G3/Rzdk7G4rZNVfB8RC1
 wsEZysIjKNOf52FKthvQ9zL+nlNoamJdRmySJgZBqJw2boEbLNQ2uhgEKM+hw9+jzFiP
 9qYHetldUoa5LLcCKsIMPIjsYe8O5aL1uxRvbvg3n8VRSKDFtYHbcgsjLt3FajmZF4cR
 Sij8CMEjL8OiT/qXXUBin5z8uhjy/4YhT+LeBVHW+oVNvSvBNwVabVI/GULBtc/9JQ1p
 WdZw==
X-Gm-Message-State: AOAM530XCG24hbXMbxJeJikpBny8K1eHEqSU8GecyyB7zONqLfD8RW0r
 UDVzh6q4SEvmsLyREiLuy/3WPM5bgPcJGqkSV6oUqd/kG1NzazxWBgZ4MpCjU4iRDde5rFCK+8/
 Jjhgu+ihj1P7aUShKBbKaMD4fO6238GA/ZC+qw4RBM346mDXglMhetcXGqHsl6AFr10Q=
X-Received: by 2002:a05:6402:b8e:: with SMTP id
 cf14mr2833022edb.86.1606400736824; 
 Thu, 26 Nov 2020 06:25:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxeSXYIg7f8aXjbpP2YOLXfRnnValspWMg1BgJ5mSv5PnSKggXRCWiHZB3P62Mg6KU81SLNrw==
X-Received: by 2002:a05:6402:b8e:: with SMTP id
 cf14mr2833000edb.86.1606400736599; 
 Thu, 26 Nov 2020 06:25:36 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id dh12sm3215502edb.58.2020.11.26.06.25.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Nov 2020 06:25:35 -0800 (PST)
Subject: Re: [PATCH] tests/docker, tests/vm: remove setuptools from images
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20201125175051.3051129-1-pbonzini@redhat.com>
 <363ec9b8-b8dc-b54f-10f8-75309a9baf3f@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ab58f972-3cef-2537-95a9-64ecb9181d0c@redhat.com>
Date: Thu, 26 Nov 2020 15:25:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <363ec9b8-b8dc-b54f-10f8-75309a9baf3f@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 25/11/20 19:20, Thomas Huth wrote:
> On 25/11/2020 18.50, Paolo Bonzini wrote:
>> Setuptools is not needed anymore by the bundled copy of meson,
>> remove it.
>>
>> Suggested-by: Thomas Huth <thuth@redhat.com>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   .cirrus.yml                                        | 1 -
>>   tests/docker/dockerfiles/debian10.docker           | 1 -
>>   tests/docker/dockerfiles/fedora-win32-cross.docker | 1 -
>>   tests/docker/dockerfiles/fedora-win64-cross.docker | 1 -
>>   tests/vm/freebsd                                   | 1 -
>>   tests/vm/haiku.x86_64                              | 1 -
>>   tests/vm/netbsd                                    | 1 -
>>   tests/vm/openbsd                                   | 1 -
>>   8 files changed, 8 deletions(-)
> 
> Needs to go in after the patch that removes the check in the configure
> script. Then:
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>

Queued both for pull request, thanks.

Paolo


