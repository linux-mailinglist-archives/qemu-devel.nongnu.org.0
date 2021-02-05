Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B903109A7
	for <lists+qemu-devel@lfdr.de>; Fri,  5 Feb 2021 11:58:28 +0100 (CET)
Received: from localhost ([::1]:38280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l7yol-0006Ea-GB
	for lists+qemu-devel@lfdr.de; Fri, 05 Feb 2021 05:58:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54104)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l7yml-0005KQ-Jh
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 05:56:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1l7ymh-0000wY-Lr
 for qemu-devel@nongnu.org; Fri, 05 Feb 2021 05:56:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612522577;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DUAefeF6fs9WmWdSKCa8nVgeKA/mqUIu6vol8vY7BFc=;
 b=TxZVbbi+SsQdZGfAGwbbFwAz4o4QGuOzwvEMeWE7t611wG2q7lqjxHHwpdxNCxyX/rqo1l
 43qWZpecL76+pykG5tffqtE9M6Qd1BSjQ82hb8spCv1C9MCDhf4xG0zizhx3z6bOxkAal1
 8adQR3ZkAt22FnUlASNeE7elqDfTnGM=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-369-rc2g0uwXP4-2zsOmMdKR8g-1; Fri, 05 Feb 2021 05:56:16 -0500
X-MC-Unique: rc2g0uwXP4-2zsOmMdKR8g-1
Received: by mail-wr1-f69.google.com with SMTP id u3so5101752wri.19
 for <qemu-devel@nongnu.org>; Fri, 05 Feb 2021 02:56:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=DUAefeF6fs9WmWdSKCa8nVgeKA/mqUIu6vol8vY7BFc=;
 b=M7p7DZu617qc409Yjxg0Prlv7IH7KdprET+P+wKnWWkSQdaH5gI4kl21hiWGbGknSe
 JA9M/Hyqe4UPHZFBw97CY9oFQAPZq+FDV+4tXfQm8MI1LshdD1rqsDlEiqRQF6vmdA8u
 lrEMns1U71JDNXRJwJ940jYc0xXOaeoyo9AgGGGOxLdlgJT6JMhfWOvxw6YQX5E1qCOU
 tDn4WdwMLzjNbFiFmfr0SC0XiMBKskThnPIVv0GHwLL0IQOnjf0SNFZAa9Aj70o7D9S9
 wijMrza5PHfaNMZDkQJZ0uDlrS2+UtPE2WaKlUKy08RNCdfdSe0Wwd9jQaZ5HZRKK+UZ
 FK/g==
X-Gm-Message-State: AOAM530fi01v0RwZiae0P6qGEoPsbW+84CKeNwedDDYJaBuu7PcFLwLo
 G8LQ/J6U7fmY2hb+Gs3XfM0h5EIp9wtM4CviCZt5+/n9sijgH8su5Csf7nfFUaRXnHnmjkPwpWr
 DgiYe+LFaYZjpqkC8V3IW0AKFyaqBAUKay4J41rHuLct0ZUBEOu7S1nKAfSu9S9aih7k=
X-Received: by 2002:a5d:4f86:: with SMTP id d6mr4435034wru.246.1612522574884; 
 Fri, 05 Feb 2021 02:56:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwtBs4CgurTZXzEb0ZP3Qn/cL1YcpAHgyepQh/MYmM1lN4kU2l+RSavfk+hHkk7PaPwcEXKAA==
X-Received: by 2002:a5d:4f86:: with SMTP id d6mr4435012wru.246.1612522574667; 
 Fri, 05 Feb 2021 02:56:14 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id x82sm3260875wmg.31.2021.02.05.02.56.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Feb 2021 02:56:13 -0800 (PST)
Subject: Re: [PATCH 0/2] Remaining work for PKS Implementation
To: Chenyi Qiang <chenyi.qiang@intel.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Xiaoyao Li <xiaoyao.li@intel.com>
References: <20210205083325.13880-1-chenyi.qiang@intel.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <6fa5d5db-4916-a220-abee-e85bf0b174db@redhat.com>
Date: Fri, 5 Feb 2021 11:56:12 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210205083325.13880-1-chenyi.qiang@intel.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.351,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.182, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001,
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

On 05/02/21 09:33, Chenyi Qiang wrote:
> Protection Keys for Supervisor Pages (PKS) is a feature that extends the
> Protection Keys architecture to support thread-specific permission
> restrictions on superviosr pages, which works similar to an existing
> feature named PKU (protecting user-mode pages).
> 
> Thanks Paolo to send out the PKS QEMU implemention at:
> https://lore.kernel.org/qemu-devel/20210127093540.472624-1-pbonzini@redhat.com/
> 
> This patch series is just to add the remaining part, i.e. the support
> for save/load PKRS and expose the vmx entry/exit load controls to guest.
> 
> Chenyi Qiang (2):
>    target/i386: Add support for save/load IA32_PKRS MSR
>    target/i386: Expose VMX entry/exit load pkrs control bits
> 
>   target/i386/cpu.c     |  4 ++--
>   target/i386/cpu.h     |  2 ++
>   target/i386/kvm/kvm.c | 13 +++++++++++++
>   3 files changed, 17 insertions(+), 2 deletions(-)
> 

Queued, thanks.

Paolo


