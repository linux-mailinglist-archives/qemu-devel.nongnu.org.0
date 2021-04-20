Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F95D3659C3
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 15:18:55 +0200 (CEST)
Received: from localhost ([::1]:49394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYqHG-00054P-9l
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 09:18:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54606)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lYqFT-0004AI-Ae
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 09:17:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1lYqFQ-0003tf-RU
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 09:17:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618924620;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AXWIydmpmSmodxWNFWwWt2tmIWstRixG4IyS5N2i+3U=;
 b=MEqhBgKs4OBAJVnCNjpO6veur6XhztBmDRCwl2aSNe3MUgU1zJG39jcfwSbLFH/atk43Jy
 GaODpgsERA0U1cb87rh0E0LLwKUn1OFYcXEJruVMo2WIhWw2gh/WVlJqpD4Yw4SMoJs9As
 xv+aV5bIFgQSEVbrs/Dn+vx5xVfFmiA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-50-a2RDX8WvNcCU86xxyO6Gww-1; Tue, 20 Apr 2021 09:16:58 -0400
X-MC-Unique: a2RDX8WvNcCU86xxyO6Gww-1
Received: by mail-wm1-f70.google.com with SMTP id
 o18-20020a05600c3792b0290128219cbc7bso5013394wmr.4
 for <qemu-devel@nongnu.org>; Tue, 20 Apr 2021 06:16:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=AXWIydmpmSmodxWNFWwWt2tmIWstRixG4IyS5N2i+3U=;
 b=TcB+9EtvgsTckITfTSfcc3h1nvXGorTpuBLnQcrkaM8I+I0WXOiWBQ8edcht8hm0dB
 ZKbYMJulOq6qKSHpYNvkUJANKvgUttkpmg3Kwmdg1j1qMwgF6cvsElh8zXb1q6NZOU56
 OOf60TpWnwc/4IcGBxCRLRvdXvAa6AcUOCSZQzpLXc8CXVrSAZDuU+TV1DmP5hC+tC4f
 qQEfCTRYX4cVr/YlmaGNhej1lFm5DTqx5Zx2XY2I7DrnJbEPJHzVLH96qiEO0SZg03gp
 iPtOu6qIwPeVLTBTia4bhLeDX4RQ8OEUi8cYJMhGnPIkoI0GpuPZcPPKYU4mISg67hyn
 uKNA==
X-Gm-Message-State: AOAM530rsVSsl24iOWZAQZanBQ/ZBOTIcsALdx6WQVq/wNXalhZ7M0fO
 ZAVem5iVjCfU9CqfNHIgimOF6YQrBeGCvvgyNoFTSIKR40ohu5foD5A2bLt0HWJC5Zu9zlU0PGw
 P7EgnlQ4fkWmgjuM=
X-Received: by 2002:a1c:1d0d:: with SMTP id d13mr4331024wmd.90.1618924617334; 
 Tue, 20 Apr 2021 06:16:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhKqy+W9kBm1tMsS8UV/6SLbR3tZQ0Dbzo/tLAJD9AUg9GdN/9NVx7PwEUF+vW8mOgjH6wSQ==
X-Received: by 2002:a1c:1d0d:: with SMTP id d13mr4330995wmd.90.1618924617019; 
 Tue, 20 Apr 2021 06:16:57 -0700 (PDT)
Received: from [192.168.3.132] (p4ff2390a.dip0.t-ipconnect.de. [79.242.57.10])
 by smtp.gmail.com with ESMTPSA id
 i133sm3317900wmi.40.2021.04.20.06.16.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Apr 2021 06:16:56 -0700 (PDT)
Subject: Re: [RFC v2 05/13] target/s390x: start moving TCG-only code to tcg/
To: Claudio Fontana <cfontana@suse.de>, Cornelia Huck <cohuck@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210420103616.32731-1-cfontana@suse.de>
 <20210420103616.32731-6-cfontana@suse.de>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <c1f21ce1-84a1-abb9-0564-28f90f4a756a@redhat.com>
Date: Tue, 20 Apr 2021 15:16:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210420103616.32731-6-cfontana@suse.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20.04.21 12:36, Claudio Fontana wrote:
> move everything related to translate, as well as HELPER code in tcg/
> 
> mmu_helper.c stays put for now, as it contains both TCG and KVM code.
> 

How hard would it be to split that up as well?

> The internal.h file is renamed to s390x-internal.h, because of the
> risk of collision with other files with the same name.

Can we move that change into a separate patch, so all we're left with 
are effective renames?


-- 
Thanks,

David / dhildenb


