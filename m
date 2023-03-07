Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7846A6AE71C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 17:47:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZaRg-0004Qh-3s; Tue, 07 Mar 2023 11:45:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZaRb-0004Ny-Ss
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:45:45 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xadimgnik@gmail.com>)
 id 1pZaRZ-0006eE-6F
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:45:42 -0500
Received: by mail-wr1-x42c.google.com with SMTP id g3so12785140wri.6
 for <qemu-devel@nongnu.org>; Tue, 07 Mar 2023 08:45:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678207539;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PUCJfRpYrXa3hmennCAGY+YEYiHIHFS8VjWjYrfABl8=;
 b=qnaUa/I/dBMAkJF5FD9r6rk+SMtRb6wgzitTv5oWBCrsribwdMR7kGxVbuy01FEfIw
 zWps1z5lp9KqGPQysCltLKEHPfOuXl/r5zfcV3Z5BAgjHI5DFudIo9xKQWnaKWKUTyq1
 7U8XvriFUuToj9oiYBqK2GldleGu91Lgo+FLPwtASmsFvu+HsVxnIIB1Z0XmkGEM4oN1
 2UvZlalsLxpDwQ8S9JCsthCJlaKfWhrM8p42y+wd1epfM07dErMu+5R9Si2Rhq/jo7Ub
 RTNyl4FlXRWpi3UwAZUfwz2WxgjCABptazkjcI9/5FqO5LXYjTnZRM+5OLrb1kIG+xLx
 98XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678207539;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PUCJfRpYrXa3hmennCAGY+YEYiHIHFS8VjWjYrfABl8=;
 b=ptPXna5udTmXVjW8DFRO1NLY+gsK6kEPo+Zopv4PnZIl+aqqdrqf4+cLLhj9l/xV7Q
 KqTwFoSvYlNkzs/Sv8jFyz7MksxPkUmzFAE43frpWuM1Tkz8hTiITZRD2Na+yVSIIUqR
 rctehXvaz9i459rag9pfFJq2DrxrvdTUT5Y2VlK7OeAbR4fjKPeXJbuve7XWEYnr2LlJ
 pqi5XOCBwvnLjsjmA0WRsdrpawtkbtFv7ZU0Y7OGYCRoOxzI6nXCM4eV3AKWBeCTZneL
 SQUgHRWu5hoXESFTeaPkwn6JoIf+Nn01HOkNdeFTxXEt781jaB4HBGRsACxxWFTeeCJb
 I1Pw==
X-Gm-Message-State: AO0yUKXYo2OrqlXzQd0b4CC3LyWKYSg0BGDdzeltAaDI0D1skp/Oiy7I
 ikVfKajrAXy/HJKC96UempA=
X-Google-Smtp-Source: AK7set+Ulo8gRwDEUDvXMRkcCF1ujJVtm0HZBUCFKEzw+2d7ysEPC8zYBkw1bLIGRVeh5T6KX5n0iQ==
X-Received: by 2002:a5d:650d:0:b0:2c5:48bd:d494 with SMTP id
 x13-20020a5d650d000000b002c548bdd494mr11405626wru.29.1678207539667; 
 Tue, 07 Mar 2023 08:45:39 -0800 (PST)
Received: from [192.168.25.218] (54-240-197-238.amazon.com. [54.240.197.238])
 by smtp.gmail.com with ESMTPSA id
 bi25-20020a05600c3d9900b003e89e3284fasm17238951wmb.36.2023.03.07.08.45.38
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 07 Mar 2023 08:45:39 -0800 (PST)
From: Paul Durrant <xadimgnik@gmail.com>
X-Google-Original-From: Paul Durrant <paul@xen.org>
Message-ID: <b9cd15c7-99d1-ff8b-03e5-e77241b13346@xen.org>
Date: Tue, 7 Mar 2023 16:45:38 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [RFC PATCH v1 07/25] hw/xen: Implement core serialize/deserialize
 methods for xenstore_impl
Content-Language: en-US
To: David Woodhouse <dwmw2@infradead.org>, qemu-devel@nongnu.org,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Joao Martins <joao.m.martins@oracle.com>,
 Ankur Arora <ankur.a.arora@oracle.com>,
 Stefano Stabellini <sstabellini@kernel.org>, vikram.garhwal@amd.com,
 Anthony Perard <anthony.perard@citrix.com>, xen-devel@lists.xenproject.org
References: <20230302153435.1170111-1-dwmw2@infradead.org>
 <20230302153435.1170111-8-dwmw2@infradead.org>
 <5f03307a80c33b62380128bf3f638d47eca74357.camel@infradead.org>
 <e1e4f027-25bc-2e1c-4451-b4d304493f16@xen.org>
Organization: Xen Project
In-Reply-To: <e1e4f027-25bc-2e1c-4451-b4d304493f16@xen.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=xadimgnik@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-To: paul@xen.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 07/03/2023 16:39, Paul Durrant wrote:
> On 07/03/2023 16:33, David Woodhouse wrote:
>> On Thu, 2023-03-02 at 15:34 +0000, David Woodhouse wrote:
>>> From: David Woodhouse <dwmw@amazon.co.uk>
>>>
>>> In fact I think we want to only serialize the contents of the domain's
>>> path in /local/domain/${domid} and leave the rest to be recreated? Will
>>> defer to Paul for that.
>>>
>>> Signed-off-by: David Woodhouse <dwmw@amazon.co.uk>
>>
>> Paul, your Reviewed-by: on this one is conspicuous in its absence. I
>> mentioned migration in the cover letter — this much is working fine,
>> but it's the PV back ends that don't yet work.
>>
>> I'd quite like to merge the basic serialization/deserialization of
>> XenStore itself, with the unit tests.
> 
> The patch is basically ok, I just think the serialization should be 
> limited to the guest nodes... filtering out those not owned by xen_domid 
> would probably work for that.
> 
>>
>> Perhaps we can also set TYPE_XEN_DEVICE or TYPE_XEN_BLOCK_DEVICE to be
>> unmigratable? Ideally I think we want TYPE_XEN_DEVICE to be
>> unmigratable by default *unless* the specific device class (including
>> net and other as we port them from XenLegacyDevice) says otherwise.
>>
> 
> Yes, that sounds like a good idea.
> 
>> Is there a way to do that?
> 
> Not something I've looked into. I'll go look now.
> 

Maybe calling migrate_add_blocker() in the realize method is the right 
way to achieve this?

   Paul


