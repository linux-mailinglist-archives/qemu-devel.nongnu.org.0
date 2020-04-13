Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4EF1A6371
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Apr 2020 09:14:59 +0200 (CEST)
Received: from localhost ([::1]:41074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jNtJ4-0008Gm-9A
	for lists+qemu-devel@lfdr.de; Mon, 13 Apr 2020 03:14:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36375)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jNtHv-0007qj-KX
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 03:13:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1jNtHu-0002OO-Jn
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 03:13:47 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:31186
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1jNtHu-0002OC-GM
 for qemu-devel@nongnu.org; Mon, 13 Apr 2020 03:13:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1586762025;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=i8v6iWYUxruV0FiQDfZ8Sb9lr2g6nJHeQ7fHb3n5J/A=;
 b=fDdgMAJgM0W1NpoC7g5h4iR7oqYmOcU4apqaKOjPFtF6jLrkGF5VnaURO34k7kGZCXbDqB
 EpliaairAzozIcnqIxDHhTWR75I1kIkKcWPB55ChFFK6ZnG8lv8/RYy/jdQDxrZIzGVQgh
 kluPfnibtMS0VVFZ+NryqZhlHAHoZyw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-vV57QdQDO7O05CJyEawAgg-1; Mon, 13 Apr 2020 03:13:43 -0400
X-MC-Unique: vV57QdQDO7O05CJyEawAgg-1
Received: by mail-wr1-f70.google.com with SMTP id h14so6276705wrr.12
 for <qemu-devel@nongnu.org>; Mon, 13 Apr 2020 00:13:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=i8v6iWYUxruV0FiQDfZ8Sb9lr2g6nJHeQ7fHb3n5J/A=;
 b=M4hUI9TsfCHmBt+AzkgX09bxY1HMHnxKSE+0Hrn728WvfCdgXrvIGYyHNSfmkFmYJx
 PKJ065aafK/d8EEnXAy4QgMYaXKvQsGakA5+fHERJ+Q8v8cKIfOG1YS3ROsYmUYsXaUx
 gdlabGu1zV9HuWkwSGHb5Ky7w1Qyjv52huXB2Vk0rdlsV+FN2Al5Ei3JhZ4PxtfxD7IN
 /el4HwUsNa7V/LfmWe175LWqwHcaT7zcBwfezf7OnXnvW3tMTsN31knYP/0VheMxMrpd
 M8YxEAl5Ws544iIZfdpC5Aun+/AZ6UQ4mujWm+GjuEnPtEzREryrVdN/dk6LaXVPzx5V
 axZg==
X-Gm-Message-State: AGi0PubRIdbkPadG3FjlKlzP3Dz/f7qHi0B0rWbSM3n2ko3elMLNQ0L8
 Q9snXJovfx7VhFv+iKLA3mlo8ooop8PnGiWWlKPnMGECCt+1hJLiYbON9bTKZvWmT/1M+KQs43l
 2cJZMAXEz7UJ9JNg=
X-Received: by 2002:a5d:4746:: with SMTP id o6mr17294740wrs.304.1586762022235; 
 Mon, 13 Apr 2020 00:13:42 -0700 (PDT)
X-Google-Smtp-Source: APiQypJJnDMTS/FPPnJtMdRQG/zdQzMHCbSc0ZpJgL0s5JH4e81aOWpf+GAkj8GPLHjRYUp4UBgC1Q==
X-Received: by 2002:a5d:4746:: with SMTP id o6mr17294722wrs.304.1586762021952; 
 Mon, 13 Apr 2020 00:13:41 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:f95d:5f37:e378:f48d?
 ([2001:b07:6468:f312:f95d:5f37:e378:f48d])
 by smtp.gmail.com with ESMTPSA id c11sm13947940wrt.24.2020.04.13.00.13.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 13 Apr 2020 00:13:41 -0700 (PDT)
Subject: Re: [PATCH for-5.0? 0/3] Make docs build work with Sphinx 3
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
References: <20200411182934.28678-1-peter.maydell@linaro.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <8bc506e7-e0de-9e12-cc47-a2d86291b876@redhat.com>
Date: Mon, 13 Apr 2020 09:13:40 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200411182934.28678-1-peter.maydell@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/04/20 20:29, Peter Maydell wrote:
> 
> I've marked this up as 'for-5.0?' because I think it would be
> nice if at least patch 1 went in. Patch 2 seems uncontroversial
> (though I guess we should forward it up to the kernel folks
> since kernel-doc is from them originally). Patch 3 is the
> expedient change, but you could argue about whether this is
> the best way to tell kernel-doc what to do.

I agree---I would say this is ok for 5.0 as long as the last two patches
are forwarded to the kernel and any changes integrated back.

Patch 1 is clever. :)

Paolo

> 
> thanks
> -- PMM
> 
> Peter Maydell (3):
>   configure: Honour --disable-werror for Sphinx
>   scripts/kernel-doc: Add missing close-paren in c:function directives
>   kernel-doc: Use c:struct for Sphinx 3.0 and later


