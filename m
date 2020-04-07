Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6ACA41A0BE6
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Apr 2020 12:30:07 +0200 (CEST)
Received: from localhost ([::1]:44758 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jLlUc-00036R-Fc
	for lists+qemu-devel@lfdr.de; Tue, 07 Apr 2020 06:30:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43643)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jLlTt-0002fu-Q3
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 06:29:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1jLlTs-0003kd-W5
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 06:29:21 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:51607
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1jLlTs-0003jl-Sn
 for qemu-devel@nongnu.org; Tue, 07 Apr 2020 06:29:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586255360;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WJp0280yF9l0dGoTNFo8zBmWwdX6oq1XXG343yVWwmA=;
 b=ALHEVywkKLb3ycF8vG/xnnxJB62KLagEp8S9JmG7K2JVJbjzsILQa1DbXkdH+6o7BGzoR4
 0HiTb681FHEYORDw98K0M/IIH8HbgJGPYg80PWxiaXlUzMPWtK5FHZayov5jRdZMtaUKAT
 1CkN/1WkLhs1gemVdrZ1o/2ijllRGzY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-234-y38Mvlp6Pwmn2kcBtdvSOA-1; Tue, 07 Apr 2020 06:29:18 -0400
X-MC-Unique: y38Mvlp6Pwmn2kcBtdvSOA-1
Received: by mail-wm1-f70.google.com with SMTP id o26so533568wmh.1
 for <qemu-devel@nongnu.org>; Tue, 07 Apr 2020 03:29:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/og9Z4BGLrlINjpHb76kyziyEiLodh99QoGtJiIEo3k=;
 b=hW50nYEPprZN2DJ01+kXg8Qbx/PXb1GB5NOpEXAGnlxvukCi+eAIgrj+6hrBRF5l6C
 9eCOp8f+zGOj5gdFVbpR2jBJoxm+8m9ArHbc5NE1OjBsLXnkX4R0kpCU+tV5mPv5H+mZ
 3vvbEUXGkLulBoSsR5GTE7gfPyBpzcgmYIHPdmamB21aMJ9UAN0FFHxZD0nAfaS/x/Fn
 Lqq50tIXoJu+31PczN4kZd96MYo7eyATqEjBOYc7lnpybNuz+wcSQEqH6LJmo0lpI+Sr
 03kiiZxrcVLvpAzAMN0rdVxRf5QutZZ77CNLZnkwrAa8rSGT4foFdXTiBd09iSCCsecy
 eDsw==
X-Gm-Message-State: AGi0PuYsc1nMudgSdYu5HvxvYGtKu2uCaRth5XCF75q3GxsJAiSCcAdY
 5HQxCyGrrh+HhhF/iU04HWhxucEueaO6RdN62RJR5egEABPVVVHj/A3/ASovf1PaWIUTxA8DD6a
 +mLCk3FkpXHln+lg=
X-Received: by 2002:a05:600c:2c4d:: with SMTP id
 r13mr1591470wmg.146.1586255357262; 
 Tue, 07 Apr 2020 03:29:17 -0700 (PDT)
X-Google-Smtp-Source: APiQypLx4FvmCfExRzoJUQWZwqN8c2uQxGFrYgCxAgAI05eI2cpn+vAnmT2tE8mzAEueqqd4a+tDGg==
X-Received: by 2002:a05:600c:2c4d:: with SMTP id
 r13mr1591451wmg.146.1586255357014; 
 Tue, 07 Apr 2020 03:29:17 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:bd61:914:5c2f:2580?
 ([2001:b07:6468:f312:bd61:914:5c2f:2580])
 by smtp.gmail.com with ESMTPSA id 25sm1702057wmf.13.2020.04.07.03.29.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Apr 2020 03:29:16 -0700 (PDT)
Subject: Re: [PATCH 1/4] atomics: convert to reStructuredText
To: Eric Blake <eblake@redhat.com>, qemu-devel@nongnu.org
References: <20200406191320.13371-1-pbonzini@redhat.com>
 <20200406191320.13371-2-pbonzini@redhat.com>
 <d0585240-030b-00c3-cece-bec1d2fa2870@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e0ec9f4b-b6e2-0183-1662-3dce8f052cca@redhat.com>
Date: Tue, 7 Apr 2020 12:29:15 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <d0585240-030b-00c3-cece-bec1d2fa2870@redhat.com>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: Ying Fang <fangying1@huawei.com>, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 06/04/20 21:58, Eric Blake wrote:
>>
>> +For the purposes of pairing, ``smp_read_barrier_depends()`` and
>> ``smp_rmb()``
>> +both count as read barriers.=C2=A0 A read barrier shall pair with a wri=
te
>> +barrier or a full barrier; a write barrier shall pair with a read
>=20
> 'shall' is awkward (if this is not a formal RFC-style requirement),
> better for colloquial English is 'must' or 'should' (twice)

Yes, it is a formal requirement.  If you don't pair barriers, you don't
get any synchronization between the threads.

Thanks for the edits!  I have included them, except when the text is
going to be removed by the next patch.

Paolo


