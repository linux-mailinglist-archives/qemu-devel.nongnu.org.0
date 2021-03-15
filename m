Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6050333C3C2
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 18:13:24 +0100 (CET)
Received: from localhost ([::1]:46576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLqmQ-0006ye-Ov
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 13:13:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42344)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lLqdr-0000wn-HP
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:04:32 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:33628)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lLqdk-0001Bq-2g
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 13:04:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615827861;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C6BnTicX3shKAD1S3WXlgvS0GO9KfJKX+30P+He8BGc=;
 b=WVENnsrjM2cmaS59O5u4vZ6E5UWfSTBfY/OqYOVN9YELH8z26UgtDjZPGIsjfwzQGmCoeL
 wZ7V6tCei7BPkAaeMkqzSYuAXmVEogxELpBoMsw6QQBU8WDIlor4/DuVrHYw2jOtB9CdIK
 78g2DB+oZiQLbhKc4+UOi9TZSRXtYf0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-265-8aXJYMGUMGCyvm9QgRniGQ-1; Mon, 15 Mar 2021 13:04:16 -0400
X-MC-Unique: 8aXJYMGUMGCyvm9QgRniGQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9975EEC1A0;
 Mon, 15 Mar 2021 17:04:15 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-72.ams2.redhat.com [10.36.112.72])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5253E59461;
 Mon, 15 Mar 2021 17:04:10 +0000 (UTC)
Subject: Re: [RFC PATCH] docs/devel: expand style section of memory management
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210315165312.22453-1-alex.bennee@linaro.org>
 <CAFEAcA8gnFdOprY=yj+voN+DJ44zx3+9ABM3yMPdWJSQ3X6QrQ@mail.gmail.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <b5db40d9-1a51-3690-a1ac-0ac345619376@redhat.com>
Date: Mon, 15 Mar 2021 18:04:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8gnFdOprY=yj+voN+DJ44zx3+9ABM3yMPdWJSQ3X6QrQ@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Stefan Hajnoczi <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 15/03/2021 17.57, Peter Maydell wrote:
> On Mon, 15 Mar 2021 at 16:53, Alex Bennée <alex.bennee@linaro.org> wrote:
>> -Prefer g_new(T, n) instead of g_malloc(sizeof(T) ``*`` n) for the following
>> +Care should be taken to avoid introducing places where the guest could
>> +trigger an exit. For example using ``g_malloc`` on start-up is fine
>> +if the result of a failure is going to be a fatal exit anyway. There
>> +may be some start-up cases where failing is unreasonable (for example
>> +speculatively loading debug symbols).
>> +
>> +However if we are doing an allocation because of something the guest
>> +has done we should never trigger an exit. The code may deal with this
>> +by trying to allocate less memory and continue or re-designed to allocate
>> +buffers on start-up.
> 
> I think this is overly strong. We want to avoid malloc-or-die for
> cases where the guest gets to decide how big the allocation is;
> but if we're doing a single small fixed-size allocation that happens
> to be triggered by a guest action we should be OK to g_malloc() that
> I think.

I agree with Peter. If the host is so much out-of-memory that we even can't 
allocate some few bytes anymore (let's say less than 4k), the system is 
pretty much dead anyway and it might be better to terminate the program 
immediately instead of continuing with the out-of-memory situation.

  Thomas


