Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CAB8437A333
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 11:13:44 +0200 (CEST)
Received: from localhost ([::1]:33086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgOSV-0004LA-TR
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 05:13:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46498)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lgONV-00065f-Lc
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:08:33 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:57206)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lgONT-0005kM-8U
 for qemu-devel@nongnu.org; Tue, 11 May 2021 05:08:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620724110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=I39c1FOWp9tmdFlrhL+G0jhJXQPMSB5t5BY3X0naQgo=;
 b=Ys9jsv0+LhRU4mKqXyBjkCuq9j5+hcRVHMgjfUPSAQ/+uBLNfGCrJlNWiBoOKAFVp46HA8
 AbBNH3Uvxv1GAfREldFAmnnSaUkAVfdBESQMIFjI9qTv582EGAFt/RIKAXrRGWemIn1VNO
 M/p2YRToSxZh435P9WEfryanLSaObcQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-181-plILD1DeOwe320bTu8xHEA-1; Tue, 11 May 2021 05:08:28 -0400
X-MC-Unique: plILD1DeOwe320bTu8xHEA-1
Received: by mail-ej1-f71.google.com with SMTP id
 z13-20020a1709067e4db02903a28208c9bdso5699310ejr.0
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 02:08:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=I39c1FOWp9tmdFlrhL+G0jhJXQPMSB5t5BY3X0naQgo=;
 b=blUO78eBwXziBi1Ar7mwxYlTImyL8b0H4MkxxzYgAfiJ73yr0qyJ6xgoCDRVk4d3Ru
 qvmSrXsBx/ehc0KoPPiufhV/EEJgaAdBE4VCtQ5It+Wy2GrW6UckmWmzJ8X26BXCB9Ag
 49opcUBtpEUXR4qEwQqwcijFXBCydKeB4Ko+KBUK+7hBNNdk0+5WUj5adjZW6MbL2zg2
 D7kbnRtkgKnmOWK7uywnh7/0Tfmk3yX5F+puPJ1VjOWYdqNBp0MGgayvhQ4SAY9eP1F3
 f+KEqxrEvzcqRhPx1mLuNzL66AhJVJFfxdmI9yfdOgKKrlcwIw4Wq/4cb3dARWC/jhVi
 Z/QA==
X-Gm-Message-State: AOAM531R9VMESy6Ton7CnKvavrOkskw2JUP/jY7ZamtM+m/2bfTgjtsk
 bcR8vjVNWZ+7d4OheQwejLZGxrTcUCzL+W1Yaeo6Cs91gzTgUqNz4dbL4LuGu/c9v+6phgzwun4
 ir2FvdHuSQp3tIjE=
X-Received: by 2002:a17:906:7f97:: with SMTP id
 f23mr31681589ejr.74.1620724107379; 
 Tue, 11 May 2021 02:08:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjea3XfgIQhwEn85im1NyNyiCMDDSeKQKD5NW3EpYFxsrWPbLTP8yW+dcfVaubEYkUJbv+6A==
X-Received: by 2002:a17:906:7f97:: with SMTP id
 f23mr31681573ejr.74.1620724107213; 
 Tue, 11 May 2021 02:08:27 -0700 (PDT)
Received: from localhost.localdomain ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 b19sm13472991edd.66.2021.05.11.02.08.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 02:08:26 -0700 (PDT)
Subject: Re: [PATCH v2 5/5] blkdebug: protect rules and suspended_reqs with a
 lock
To: Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 qemu-block@nongnu.org
References: <20210507151203.39643-1-eesposit@redhat.com>
 <20210507151203.39643-6-eesposit@redhat.com>
 <55310f7a-583c-3001-141c-4eac4afd185c@redhat.com>
 <b53155c7-a332-79f3-0798-abf128a06f3c@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Message-ID: <e67113cd-cad8-5f42-0c58-848ffaba9ec7@redhat.com>
Date: Tue, 11 May 2021 11:08:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <b53155c7-a332-79f3-0798-abf128a06f3c@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/05/2021 10:37, Paolo Bonzini wrote:
> On 07/05/21 17:29, Eric Blake wrote:
>>> +    qemu_mutex_lock(&s->lock);
>>>       QLIST_FOREACH(r, &s->suspended_reqs, next) {
>>>           if (!strcmp(r->tag, tag)) {
>>> +            qemu_mutex_unlock(&s->lock);
>>>               return true;
>>>           }
>>>       }
>>> +    qemu_mutex_unlock(&s->lock);
>>>       return false;
>> Would code like this be easier to write by using QEMU_LOCK_GUARD from
>> lockable.h?
> 
> Yes, this one would.  In other cases (rule_check) it's not so clear cut. 
>   It depends whether you prefer to have the simplest code, or rather to 
> have homogeneous use of either guards or lock/unlock.

Makes sense. I will use the lock guard and fix the "yield" typos in the 
other patches.

Thank you,
Emanuele


