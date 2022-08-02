Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77640587F05
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Aug 2022 17:36:34 +0200 (CEST)
Received: from localhost ([::1]:53022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oItwf-0004Wt-3x
	for lists+qemu-devel@lfdr.de; Tue, 02 Aug 2022 11:36:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oItso-0000hc-7S
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 11:32:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:57092)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1oItsl-0001cR-8O
 for qemu-devel@nongnu.org; Tue, 02 Aug 2022 11:32:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1659454350;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=p4mHG0bA9jLcdudep0OxFOc/jYwfxBzvYCD/Jt/AvMg=;
 b=a6ll0LVJZATC60dnUqP/2kPxevYAb6dD91myHkvV5Mt1qId2aSru6UYHUhpiY0yWbJiVxB
 +z16fcwzPosv6yypbpaeE+Sur8gO8xCApHUjsDzO+Ez9YAL4BjDED9v9wiAyGWibcbWQFG
 On4CnTIGFZn4kzCp8GZbzrGGYnaIkm4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-67-pTDvuZz9OoWWwP5KkE_Uwg-1; Tue, 02 Aug 2022 11:32:28 -0400
X-MC-Unique: pTDvuZz9OoWWwP5KkE_Uwg-1
Received: by mail-wm1-f70.google.com with SMTP id
 h189-20020a1c21c6000000b003a2fdf9bd2aso6255613wmh.8
 for <qemu-devel@nongnu.org>; Tue, 02 Aug 2022 08:32:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=p4mHG0bA9jLcdudep0OxFOc/jYwfxBzvYCD/Jt/AvMg=;
 b=sLe6oafgL7CF0MOHdOB4QvqhO4IQgsoydcbjDH06O/nAALRBzDF5+RfGOMj7clxmFJ
 wz372zOLINYfXqO5B2uBqyrkArzh6wxETUJfotCaXy50Ah1oI3JdWx6p6+5s3nJFub7C
 Qtsx68lukZVn5cZ4Rrhcrg3u2UdV8ecCVIHik+EahWs/UfNKvO3e99txNZXKk5X/Qg5Z
 tdhXr0X1H8jYSTJXkQEB2kGg+lsh4RopQxTkN4TRFJFboOztqT+tP5bfS09gYyWpjVpt
 HAUEgdKFEwlC0p7YAs3lSb+uJhxuKcFJrtYbYNOy2og1ovbfgdM3rR9y975gulOH5MG+
 cCvg==
X-Gm-Message-State: ACgBeo2FNhJatmhkwL7jzwqtU5CbjJ1Q29iOAYxB9yKL97dwtFF9sW/8
 lEJJKv1G/Q2yHiT6vCVLcq3SY/koNaTSpvBxoauq2/1wElIu1KyzGqR4mfP4R0gd2v3cvZ2Jtx1
 r1ZhnXkr7bl2L/JQ=
X-Received: by 2002:a7b:ce8f:0:b0:3a3:150c:d8ff with SMTP id
 q15-20020a7bce8f000000b003a3150cd8ffmr30258wmj.152.1659454347717; 
 Tue, 02 Aug 2022 08:32:27 -0700 (PDT)
X-Google-Smtp-Source: AA6agR521nD/JSRNUJ/H6JyLhLd04jByVgakPCr5/rD3phzURgWVrn5facUqTbl2UzBLV8kDyHvuYw==
X-Received: by 2002:a7b:ce8f:0:b0:3a3:150c:d8ff with SMTP id
 q15-20020a7bce8f000000b003a3150cd8ffmr30236wmj.152.1659454347398; 
 Tue, 02 Aug 2022 08:32:27 -0700 (PDT)
Received: from ?IPV6:2003:cb:c707:3800:8435:659e:f80:9b3d?
 (p200300cbc70738008435659e0f809b3d.dip0.t-ipconnect.de.
 [2003:cb:c707:3800:8435:659e:f80:9b3d])
 by smtp.gmail.com with ESMTPSA id
 j7-20020adfe507000000b0021d65675583sm15733120wrm.52.2022.08.02.08.32.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Aug 2022 08:32:27 -0700 (PDT)
Message-ID: <b35530a5-cf84-eead-38a6-5aa80363702d@redhat.com>
Date: Tue, 2 Aug 2022 17:32:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3] target/s390x: support PRNO_TRNG instruction
Content-Language: en-US
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Christian Borntraeger <borntraeger@linux.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Holger Dengler <dengler@linux.ibm.com>
References: <Ytft08S2eGaYVwC3@zx2c4.com>
 <20220720120859.339788-1-Jason@zx2c4.com>
 <ef161533-0123-28f0-db1f-5257e82f6340@linux.ibm.com>
 <1afd34c3-0aa6-541c-07e9-b0eef7e0f0d7@redhat.com>
 <71d173c2-21eb-5966-8458-91de9bc48620@linux.ibm.com>
 <71b1b0f6-95b9-0249-e996-b8348470693f@redhat.com>
 <834c1a76-d972-a1b2-2c28-d0482335d3ba@linux.ibm.com>
 <5835cfa9-841f-ab6c-6684-2ae3bddeacf3@redhat.com>
 <CAHmME9pT+ifm4SbKMCxdXLDOtmEn99ssf54Bz8SWsiRLWfOvGA@mail.gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <CAHmME9pT+ifm4SbKMCxdXLDOtmEn99ssf54Bz8SWsiRLWfOvGA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 02.08.22 17:28, Jason A. Donenfeld wrote:
> Hi David, Christian,
> 
> While this thread has your attention, I thought I'd reiterate my offer in:
> https://lore.kernel.org/qemu-devel/YuEoUwzDzBqFFpxe@zx2c4.com/
> 
> Do either of you want to "take ownership" of this patch to bring it
> past the finish line, and I can provide whatever additional crypto
> code you need for that?

For me the patch is good enough. But sure, having a SHA512
implementation would be nice ...

Long story short, I'll wire up whatever crypto stuff you can come up with ;)

-- 
Thanks,

David / dhildenb


