Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E0A01B232C
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Apr 2020 11:48:17 +0200 (CEST)
Received: from localhost ([::1]:54882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQpVo-0004QI-7S
	for lists+qemu-devel@lfdr.de; Tue, 21 Apr 2020 05:48:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37780)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jQpRc-0008Dx-Gq
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 05:43:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1jQpRb-0007DY-GI
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 05:43:55 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:38971
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1jQpRa-0007Aa-K9
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 05:43:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1587462233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mSqYInGpJbvW/mUlZGZlFFf6h09Y8xtolF7wNSACTjc=;
 b=C9MEB7tp0Epo+AzQMDgCoRxG36bvNKU0quEV/S+TrxxoksMoyUzcryCV746Oo2gjx78zVC
 xE0FE7I5d4jYMc5RlvEsmVXoMIgHR7/2Fu4KkCra2YKIm8ZsVh8VLlgvufgQ7moHGCt2Pi
 /ViuSlDC+Rs89tpUrgV73a46KY0zLvo=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-351-ASwET7svPuinlH9LsJbdnA-1; Tue, 21 Apr 2020 05:43:51 -0400
X-MC-Unique: ASwET7svPuinlH9LsJbdnA-1
Received: by mail-wr1-f69.google.com with SMTP id o12so7256417wra.14
 for <qemu-devel@nongnu.org>; Tue, 21 Apr 2020 02:43:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mSqYInGpJbvW/mUlZGZlFFf6h09Y8xtolF7wNSACTjc=;
 b=GLKXGqS7yIIE8Ant9XLMazYy3mpNDAWNa54yDEEH3t9HLGHMk24k45SH+vc+sRv+9Z
 7XXTl1ya94LHaEIz/Ds71Imq0rW/SBvTJY0kmTzV+jmzN/b2egp/I8+y5EMieSOrIWVy
 2PCn3gs4hPUpGa+GyzK4hejZyx1GOMtJ99WLAQmjjYSS4pDpGmqAkUIAZXnOSH9FCvjZ
 CAa4uT3E7WUCVWhLLOGjhtXL732KvNU7NeSXzyaeiTUOnHB3pRqhJBUk1O0ZBizBBVWX
 Pjdo8aq5Bizh/OoZVzd3cd8JJxt2OYIh2mUQdjERD2iCFm+ozFwdEQQ05z0gDtMteolx
 ZZSQ==
X-Gm-Message-State: AGi0PuYnAYeXkZ/8qJirgYMgbPtqXTNK7yHGBzv+wEd13+9tCVi3i+if
 lGQMyMkZ/HX8cZhPpzHXVnh7be7MTpqj2mvGpmEb4BMCtLTcwOUb4jkSAcsAhFARDiGQMxmRjpI
 BVvc2qBVgPzG9qfw=
X-Received: by 2002:a1c:80c3:: with SMTP id b186mr4322717wmd.117.1587462230640; 
 Tue, 21 Apr 2020 02:43:50 -0700 (PDT)
X-Google-Smtp-Source: APiQypKiBZxErgylGBcPSEBsUwVoc9iAtcOO0ay5XfGWu0+o6W6xySWiHLcVN4yeWGKa09J9tItWzw==
X-Received: by 2002:a1c:80c3:: with SMTP id b186mr4322696wmd.117.1587462230386; 
 Tue, 21 Apr 2020 02:43:50 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:d0a0:f143:e9e4:2926?
 ([2001:b07:6468:f312:d0a0:f143:e9e4:2926])
 by smtp.gmail.com with ESMTPSA id 1sm2843322wmi.0.2020.04.21.02.43.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 21 Apr 2020 02:43:49 -0700 (PDT)
Subject: Re: Question on memory commit during MR finalize()
To: Peter Xu <peterx@redhat.com>
References: <20200420210049.GA420399@xz-x1>
 <fe73a74b-2324-68a5-a37f-530a6bb03ebc@redhat.com>
 <20200420233115.GB420399@xz-x1>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <5ed295a3-9e4a-0dca-adc6-5361dc78a83c@redhat.com>
Date: Tue, 21 Apr 2020 11:43:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200420233115.GB420399@xz-x1>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=207.211.31.81; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/21 01:28:51
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: Markus Armbruster <armbru@redhat.com>,
 QEMU Devel Mailing List <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 21/04/20 01:31, Peter Xu wrote:
>>
>> However, instead of memory_region_transaction_commit,
>> memory_region_finalize probably should do something like
>>
>>     --memory_region_transaction_depth;
>>     assert (memory_region_transaction_depth ||
>> 	    (!memory_region_update_pending &&
>>              !ioeventfd_update_pending));
> Ah I see; this makes sense.
> 
> And finally I found the problem, which is indeed the bug in my own tree - I
> forgot to remove the previous changes to flush the dirty ring during mem
> removal (basically that's run_on_cpu() called during a memory commit, that will
> wrongly release the BQL without being noticed).
> 
> Besides above assert, I'm thinking maybe we can also assert on something like:
> 
>   !(memory_region_transaction_depth || memory_region_update_pending ||
>     ioeventfd_update_pending)
> 
> When releasing BQL (unlock, or qemu_cond_wait() on BQL, which should cover
> run_on_cpu()), so that we can identify misuse of BQL easier like this.

Asserting invariants around lock release are an interesting concept, but
I'm not sure where to insert them exactly.  But it would be great if you
would like to introduce an assert_empty_memory_transaction() function
with the assertion I quoted above.

Thanks!

Paolo


