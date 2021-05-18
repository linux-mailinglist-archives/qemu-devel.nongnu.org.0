Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BBD053876CB
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:42:19 +0200 (CEST)
Received: from localhost ([::1]:43014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lixB4-0005Oh-Qk
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:42:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lix2m-0005lm-JC
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:33:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1lix2c-0005SB-8G
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:33:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621334013;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lSI2UBFIdCO7xntwsByY6qJtIZfLx3POgd3lVAyLRDY=;
 b=X/194+kI72uhRwITD1fmzmzH9X17nHbt1WIgy+HZOedaPTkmXa039LpANx3w00m53a7Q9j
 x/k97qW+fgt8sG/oIrz0WuZ+gN1wHyEgshkgLSN0SPdsyve3Rfj6Hdie0+vPIShUwmovFW
 3C6Gm7ryIa2ihKziNlnQ/uKQS+qQMvA=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-414-rCh8PZOtPiaXUqOe7lUdOw-1; Tue, 18 May 2021 06:33:32 -0400
X-MC-Unique: rCh8PZOtPiaXUqOe7lUdOw-1
Received: by mail-ej1-f70.google.com with SMTP id
 m18-20020a1709062352b02903d2d831f9baso2185124eja.20
 for <qemu-devel@nongnu.org>; Tue, 18 May 2021 03:33:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=lSI2UBFIdCO7xntwsByY6qJtIZfLx3POgd3lVAyLRDY=;
 b=nZosheQLfjNWNFgI39NBpcVmawr637xZZcbiDBmPHnoMiMYG5JdrukF8SNAq2p+Wdl
 CI40z/5pADE/BPkoQB4ME85KDhDTcwyaH6shy8EWxyLdI+eFjm346M400ZDHL7qnIEGT
 OXlVRtwDm/VPi20rDIHU0RClhxwjiUG+z16svIg1ZKPax768OYsgRdmH3NMZVWKahtdO
 c9XHE4cJTR6LI6MM27eoLZ2bNtg9P8M5q1AIkEYuGEdziKWUH1/qRyQFwTx8PNCN9UoO
 BgrXQIWA6v2a5Z68mGXaWT52k3Uq5kv0z57Ns3UGKA/XJGKPdoITa5/qRUknviBqDm1M
 4Z2A==
X-Gm-Message-State: AOAM5338+TkIQYwOMMO7POzth+j96K+a/GO8d0DpYHIVJzkCeaC/V3SN
 v09vCsH23oGDULnUPm4SHEn0zYr/oVXVDyn0HM/tlXZQKRJyb9XiY458D1Re9cVp1M7VWPzT45L
 ivjw0OVlGifEkT7lat/WSxrmJDNRG5s8gLYpbIF4uSiAUgn6CyjWsj8+qce3ShOAHOaQ=
X-Received: by 2002:a17:907:3f1c:: with SMTP id
 hq28mr5270667ejc.349.1621334010769; 
 Tue, 18 May 2021 03:33:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwC9C61kRPW7ILeZ6vK0DlD/67hq+9n01RUjgq8zzheb7A7qAIygrMtrkQ6m5Mx0iSTYJnriA==
X-Received: by 2002:a17:907:3f1c:: with SMTP id
 hq28mr5270636ejc.349.1621334010262; 
 Tue, 18 May 2021 03:33:30 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id y10sm10030669ejh.105.2021.05.18.03.33.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 May 2021 03:33:29 -0700 (PDT)
Subject: Re: [PATCH] remove qemu-options* from root directory
To: Markus Armbruster <armbru@redhat.com>
References: <20210517121908.2624991-1-pbonzini@redhat.com>
 <875yzg776s.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <ccfae3ab-e05a-7860-a841-f2aac0169c89@redhat.com>
Date: Tue, 18 May 2021 12:33:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <875yzg776s.fsf@dusky.pond.sub.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/05/21 10:54, Markus Armbruster wrote:
> Paolo Bonzini <pbonzini@redhat.com> writes:
> 
>> These headers are also included from softmmu/vl.c, so they should be
>> in include/.  Removing qemu-options-wrapper.h, since elsewhere
>> we include "template" headers directly and #define the parameters in
>> the including file, and move qemu-options.h to include/.
>>
>> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
>> ---
>>   qemu-options.h => include/qemu/qemu-options.h |  9 ++++-
>>   os-posix.c                                    |  2 +-
>>   os-win32.c                                    |  1 -
>>   qemu-options-wrapper.h                        | 40 -------------------
>>   qemu-options.hx                               |  4 ++
>>   softmmu/vl.c                                  | 24 ++++++++---
>>   6 files changed, 31 insertions(+), 49 deletions(-)
>>   rename qemu-options.h => include/qemu/qemu-options.h (88%)
>>   delete mode 100644 qemu-options-wrapper.h
> 
> Much nicer without qemu-options-wrapper.h.
> 
> I'd be tempted to rename qemu-options.def while there (what's .def?),
> but that's up to you.
> 
> Reviewed-by: Markus Armbruster <armbru@redhat.com>

I was tempted too, but qemu-options.h is already taken (well, 
qemu/qemu-options.h) and I didn't have any good ideas about the name.

Paolo


