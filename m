Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE2BF4E3AAB
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 09:34:34 +0100 (CET)
Received: from localhost ([::1]:41720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWZyL-0000YZ-UY
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 04:34:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:60484)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWZvE-0007Hw-Pd
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 04:31:20 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:26107)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWZvB-0003Qq-AG
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 04:31:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647937876;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RdpGkJdzOnCznGD81Zk6LPOPSZnanGnGJPi8z4h9O1A=;
 b=F2w7OYTlc4MkO3qxsj11gvxdWuw91W7trirrDMzfS+DZxMnm8YX+vR2PA0tOK0lLXM9sma
 Xgh2GE8Sq+uHK79rcgpCQLTb2ivA5glr1YzhJc7Yw0lNnNkw3a4zOo5hbyLA8U7KlM2R8C
 tqqEEti+GqRHq1WUJjh+DXom9GDL54o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-649-FI7STuaSOLuKL4nnbvPIFw-1; Tue, 22 Mar 2022 04:31:15 -0400
X-MC-Unique: FI7STuaSOLuKL4nnbvPIFw-1
Received: by mail-wm1-f70.google.com with SMTP id
 q6-20020a1cf306000000b0038c5726365aso529415wmq.3
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 01:31:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:organization:in-reply-to
 :content-transfer-encoding;
 bh=RdpGkJdzOnCznGD81Zk6LPOPSZnanGnGJPi8z4h9O1A=;
 b=Zv6ujeyew4VfmTMji+usp0z7IX59VDZ7YJEPGizpAHLtWVMp8diGdsCEzLFMW03NmF
 M+4dkbOYlxhsg+PreJEeTJxGRrp/OL0cJZ/w+ZoqEJa0FStDmgJmzSeEMSWrIxlP33Nw
 Wy86HGFwtI98xdOTkuiVZX7CPEeJ2GPOf4Ij55v5N0NPf3VH5l+eAFLB0X3LLXuE66HR
 zspc6RTOA9TS5f4/i7ZmLNnyMv5saR7cQhgdzzAhLz1f5PCvArDKJzp+vhWAx99Oxem+
 o/5HPb33de6twdG7vJRiR9i6TrvyIZ2XocWOH0YsSEBkjDpKm40Eoeyo5RGNROr26mI/
 BbkQ==
X-Gm-Message-State: AOAM530+Khs0BobvIPQe4Ds3IpK4u4jrAip2YViXTYwMPsxi+boYVPF/
 3VB5NJQQSd6Ad3fQxXSy7PJhIXUUYc86CbrHtgpSUtfnzlwNiqICuFWbwTaoECdiNsFAIkev8fz
 ULZRKrMeZQhbdRKM=
X-Received: by 2002:a05:6000:3cb:b0:205:7b9d:cade with SMTP id
 b11-20020a05600003cb00b002057b9dcademr887755wrg.239.1647937873890; 
 Tue, 22 Mar 2022 01:31:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzuTtvPMfrTkrQCGl6dJE/sQErrIxqY1iIp2ygGC87BQgOyevDtT95AHcMSphqe00ToNmq/Qw==
X-Received: by 2002:a05:6000:3cb:b0:205:7b9d:cade with SMTP id
 b11-20020a05600003cb00b002057b9dcademr887731wrg.239.1647937873588; 
 Tue, 22 Mar 2022 01:31:13 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:de00:549e:e4e4:98df:ff72?
 (p200300cbc708de00549ee4e498dfff72.dip0.t-ipconnect.de.
 [2003:cb:c708:de00:549e:e4e4:98df:ff72])
 by smtp.gmail.com with ESMTPSA id
 z5-20020a05600c0a0500b0037bb8df81a2sm1528903wmp.13.2022.03.22.01.31.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 01:31:13 -0700 (PDT)
Message-ID: <8f86ef34-94d3-0300-5f48-d56a6ddd53de@redhat.com>
Date: Tue, 22 Mar 2022 09:31:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
Subject: Re: [PATCH v4 03/11] target/s390x: vxeh2: vector string search
To: David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org
References: <20220322000441.26495-1-dmiller423@gmail.com>
 <20220322000441.26495-4-dmiller423@gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
In-Reply-To: <20220322000441.26495-4-dmiller423@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, cohuck@redhat.com, richard.henderson@linaro.org,
 farman@linux.ibm.com, pasic@linux.ibm.com, borntraeger@linux.ibm.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.03.22 01:04, David Miller wrote:
> Signed-off-by: David Miller <dmiller423@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb


