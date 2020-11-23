Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 021DC2C0A78
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Nov 2020 14:40:21 +0100 (CET)
Received: from localhost ([::1]:41116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1khC4q-0002S9-Hh
	for lists+qemu-devel@lfdr.de; Mon, 23 Nov 2020 08:40:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khC31-0001Yc-Vy
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 08:38:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:42049)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1khC2z-0002yp-B6
 for qemu-devel@nongnu.org; Mon, 23 Nov 2020 08:38:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1606138703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yovDzNi3IVDZA9fS1Nrk0+BM3bexT+roUZv44d3yrUI=;
 b=Mmkw9hW1DhKEvwohAFg8vE7d+85xFzQpQ43JTMrBV3Y3GG8qRd92rxiAS/223B4zGyQGRv
 5tNhGmr4vnlFhqaDrAAhxY5Auy+Eq5o2znJOnOvRxU4oV8aYEbndWQO7YRi+Qvhzm6wrOP
 JNmmDcjo3KlApnqbHDAbKgzwKjjngXg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-225-kUJ_--EeMmawBRHu0k2uHg-1; Mon, 23 Nov 2020 08:38:19 -0500
X-MC-Unique: kUJ_--EeMmawBRHu0k2uHg-1
Received: by mail-ed1-f72.google.com with SMTP id b68so6604671edf.9
 for <qemu-devel@nongnu.org>; Mon, 23 Nov 2020 05:38:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yovDzNi3IVDZA9fS1Nrk0+BM3bexT+roUZv44d3yrUI=;
 b=OG+wTPUZT/YtdgQMZfdzrheBnU0dS875siSv3kFK3Ra7kDgbL4vOnYKdKLkomW8FpV
 hA3COtJqhl5wpzT6yYL8YqBdIXvWZ04u4NUFkSjyvmlPbMT+mG+4i0GkPs1dVuMyNMDA
 WuptTZNrDfxHSyBDF5BLlqdHMRrBrBb4Y0/TpkbTxZzWvfrOmdDSnDwnLcO5fvS1kCu2
 DF1oEUl/hE/qe+4H3QjnCtN/EPpMRz6otANYe+8ZXMlKS5p3C+MGS1Nk5yEaTdbYR8pc
 3q5WS/EgVLiFISYlxvzTWwV7O7L0uemiqmLPxBJ26rUX7w+m1ONim9dlP/Wq0tPPoVki
 v7Mg==
X-Gm-Message-State: AOAM530YVsis3ooXHy6JMSgtT/UbRowOnV9hxw2LiZ7Q19BBYcuRMe5B
 dvRRmcHloPwQ5qkmTVVM5BjpbpTQskcCYK08g2+JkL/IH6rV1wNcjJF/ytXl2meMB7odR4o9g/2
 9gMAcwicZEcRI7ek=
X-Received: by 2002:a17:906:7f95:: with SMTP id
 f21mr42462494ejr.340.1606138697765; 
 Mon, 23 Nov 2020 05:38:17 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyYRH9ooRMOLZl7b5DRJC3WwE9qLNRjPextTGdNmR5GFuwpUtceDkdKGKYhlTw6d3vExuneXQ==
X-Received: by 2002:a17:906:7f95:: with SMTP id
 f21mr42462478ejr.340.1606138697551; 
 Mon, 23 Nov 2020 05:38:17 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id w3sm5058801edt.84.2020.11.23.05.38.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Nov 2020 05:38:16 -0800 (PST)
Subject: Re: physmem: Is 0644 OK for new created file?
To: Peng Liang <liangpeng10@huawei.com>,
 QEMU Developers <qemu-devel@nongnu.org>
References: <7122bd8e-19e0-b010-9404-446d08013ab1@huawei.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <e4b80d21-7743-6e88-2cb7-4e1af1342242@redhat.com>
Date: Mon, 23 Nov 2020 14:38:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <7122bd8e-19e0-b010-9404-446d08013ab1@huawei.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
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
Cc: yebiaoxiang 00470486 <yebiaoxiang@huawei.com>,
 zhangbo 00443348 <oscar.zhangbo@huawei.com>,
 xiexiangyou 00584000 <xiexiangyou@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/11/20 12:41, Peng Liang wrote:
> Hi,
> 
> Recently, I tried to use ivshmem-plain devices to share some information
> between guests.  I found that if the file of the shmem doesn't exist,
> then QEMU will create one and the mode of it is 0644.  Maybe it is risky
> because everyone can read the content of the file?  Do we need to change
> it to 0640 or 0600?

You can control that with the directory permissions or the umask as 
well, so it shouldn't be a problem.

Paolo


