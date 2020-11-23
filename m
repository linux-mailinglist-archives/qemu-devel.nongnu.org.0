Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C0932C07FA
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 13:57:08 +0100 (CET)
Received: from localhost ([::1]:52768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khBP1-000758-3U
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 07:57:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44622)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1khBNh-0006Ez-Be
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 07:55:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24582)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1khBNe-0004HR-TZ
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 07:55:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606136142;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FIgMARHh65d7vastz6z3wvlKkBr9dL8K0WJkVXjIrks=;
 b=BFFTK0PiKzqo+tSOUkaOzX2v505nuB7BWCvxlx5br3bzTgQhu9aSZ3k1RyMdA86FaRE1D5
 BKZAWLdYRbejanumV8Qlz6Wt+HfXOxcJhQ1uSqlu5g9jNJlBFLRs+dg2KTAuhgZ/sIZRK6
 WlYEEGCEvrz3LuMXqZvBXxR8dpE3Ri8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-363-hEVKUqfBO72gKH6gJKqTCQ-1; Mon, 23 Nov 2020 07:55:38 -0500
X-MC-Unique: hEVKUqfBO72gKH6gJKqTCQ-1
Received: by mail-wm1-f69.google.com with SMTP id e15so5023212wme.4
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 04:55:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=FIgMARHh65d7vastz6z3wvlKkBr9dL8K0WJkVXjIrks=;
 b=C0VRJ5SdhAghSWPtVzwFi5qGcSDZgRnz69NpV7E8u/Z0d9CxtoqaIV7tGKCe4u83NJ
 IIs4iFlz/PTL+xJePl6jZCZnQA6pasE0TVRPw+Mh9c7jonq+N5riz4Op9KTZgdxYwuWF
 vGqnRoyR8/DipxiHZDLiUlw5CHUqDGXAQVZhzWkrNYk6BM826YJf7kxpIgRQ4Gf67svI
 mkoYa1EyHcTj6LQr0NKAVPK/oyqe3PKBAunGYNDByTwDZRqmfm++3KCr1cH0EdQwZ7zK
 SLYNFLAsOCxR2dPtWn/7YrBTu5aWz2uik+dcW89P6E/O+sg2oLkJchS+5xBg+q/snTlw
 iPDA==
X-Gm-Message-State: AOAM532FF4bkBx8GGnhxjsLKvKJsvqOxAGtC9GZRPigkBiID/a00r9GC
 JoKie1fUO2BchgLS9ZHqMX2XLIkdyV9qtQrER9qVSn1nTGVxkLS3c8DdCKy/YcYv+8f5r5S9Ia6
 1aJz9Jn3PnOlBVOg=
X-Received: by 2002:a1c:bac1:: with SMTP id k184mr22709775wmf.76.1606136137208; 
 Mon, 23 Nov 2020 04:55:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwD3soA/YD1GS6KsWtMF7U7PIn4x93ioUOOj813SwZ/DStZr8boOM5xZW7n1byt0bBxPp2B9Q==
X-Received: by 2002:a1c:bac1:: with SMTP id k184mr22709749wmf.76.1606136136977; 
 Mon, 23 Nov 2020 04:55:36 -0800 (PST)
Received: from [192.168.1.36] (111.red-88-21-205.staticip.rima-tde.net.
 [88.21.205.111])
 by smtp.gmail.com with ESMTPSA id e1sm16184060wmd.16.2020.11.23.04.55.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 04:55:36 -0800 (PST)
Subject: Re: [PULL 00/33] Block patches
To: Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>
References: <20201104151828.405824-1-stefanha@redhat.com>
 <CAFEAcA_fer-r6tJLRgQwQ+X1bAe0ODSA5UNWxZbSCtS1VHDO9A@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <753aef6b-128d-e1af-b959-e83481749120@redhat.com>
Date: Mon, 23 Nov 2020 13:55:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA_fer-r6tJLRgQwQ+X1bAe0ODSA5UNWxZbSCtS1VHDO9A@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Coiby Xu <Coiby.Xu@gmail.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Keith Busch <kbusch@kernel.org>,
 kvm-devel <kvm@vger.kernel.org>, Klaus Jensen <its@irrelevant.dk>,
 Paolo Bonzini <pbonzini@redhat.com>, Max Reitz <mreitz@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/4/20 9:59 PM, Peter Maydell wrote:
> On Wed, 4 Nov 2020 at 15:18, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>>
>> The following changes since commit 8507c9d5c9a62de2a0e281b640f995e26eac46af:
>>
>>   Merge remote-tracking branch 'remotes/kevin/tags/for-upstream' into staging (2020-11-03 15:59:44 +0000)
>>
>> are available in the Git repository at:
>>
>>   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
>>
>> for you to fetch changes up to fc107d86840b3364e922c26cf7631b7fd38ce523:
>>
>>   util/vfio-helpers: Assert offset is aligned to page size (2020-11-03 19:06:23 +0000)
>>
>> ----------------------------------------------------------------
>> Pull request for 5.2
>>
>> NVMe fixes to solve IOMMU issues on non-x86 and error message/tracing
>> improvements. Elena Afanasova's ioeventfd fixes are also included.

There is a problem with this pull request, the fix hasn't
been merged...

> Applied, thanks.
> 
> Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
> for any user-visible changes.
> 
> -- PMM
> 


