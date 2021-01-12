Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E43C82F339E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 16:10:10 +0100 (CET)
Received: from localhost ([::1]:35526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzLJC-00059B-00
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 10:10:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kzLD8-0007z8-L0
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 10:03:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:54580)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <pbonzini@redhat.com>)
 id 1kzLD4-0007G8-2U
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 10:03:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1610463827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TT9d+xJeqYtNHTMeMRLIIztU1YCb6DHmBE0pfGFzkuo=;
 b=AXiXIfylLmBZbpIIBschEEgmI82YB3PSQQNZfCSpS7SAWTPhIW/byDgzVprml83hIHtwbH
 SFDUYJu5hhi5MATUNnsvX14mCPxHAsPkO5MtO+X6FaPFO/ePF9SFMih4wXl32CTmHqyWPj
 +qF83LS/1nxHhVqZ+tpkvMIpHiDqBG8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-6kaOjRvoPXyEZpxIdzEQWg-1; Tue, 12 Jan 2021 10:03:39 -0500
X-MC-Unique: 6kaOjRvoPXyEZpxIdzEQWg-1
Received: by mail-ej1-f71.google.com with SMTP id w6so1114627ejo.2
 for <qemu-devel@nongnu.org>; Tue, 12 Jan 2021 07:03:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=TT9d+xJeqYtNHTMeMRLIIztU1YCb6DHmBE0pfGFzkuo=;
 b=PIXOrm8PpXT3n7whtTRGyOYHdmPnuEItjrRsFLIJoxXnRV7pjYviS/ACFObKdtxzZC
 pTqgEVnfkRYP2Z9EDvjHf2CcO0FLKxJGgPFbIwT/DeHICagderKAVNPniMxvUItKXi1s
 Re0jYpUHhoHAK37h2r3iUP90b6UDhas9SZim/yPTq+DcCCiaq6y5Vu4iTwwNBlnD3Nok
 iMUxsjtYsn4RB7dyJAgS9bMnMkI0gaVLIzboIJlls4qNzRdPjbC/j0p1Qj8rec/MilRs
 shqNrlUzjjpWN7c6g0LbFDBOU5wHZpJNRvdGY62baS8bQTvq9Lndj1kPTR2gLULJb/ug
 Jclw==
X-Gm-Message-State: AOAM532DWIU/D+b0WV0CybfDShB/o/ageGe8c+fvrbY79d9saS4NIZ5G
 Kj/e2O/0LSMgh09latwyxEkH1kHkRbm/2EehpuuwSH6rwOMBZ1e2onsWYen3iwvi/0yMs2jp5iT
 m8qpRpAdTqwNlO/g=
X-Received: by 2002:a17:907:c01:: with SMTP id
 ga1mr3450221ejc.488.1610463818119; 
 Tue, 12 Jan 2021 07:03:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz7yCvIK2tCJCTtbhVYU0a365QpQWRzfBRlrHOR5Dyw21aY5yXXI4gSZ93td9io7q/jlFda0g==
X-Received: by 2002:a17:907:c01:: with SMTP id
 ga1mr3450201ejc.488.1610463817922; 
 Tue, 12 Jan 2021 07:03:37 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.gmail.com with ESMTPSA id u2sm1300859ejb.65.2021.01.12.07.03.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 12 Jan 2021 07:03:37 -0800 (PST)
Subject: Re: virtfs-proxy-helper fails due to bogus libattr test
To: Olaf Hering <olaf@aepfle.de>
References: <20210112105110.2f0e4fbb.olaf@aepfle.de>
 <2315616.PpvBb8DKss@silver> <20210112122900.GH1360503@redhat.com>
 <13c2a785-a8a8-6a17-3265-b3597fc5d734@redhat.com>
 <20210112154700.41c1cb87.olaf@aepfle.de>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <27b9d4b1-5873-da03-5757-88fed6d642f7@redhat.com>
Date: Tue, 12 Jan 2021 16:03:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20210112154700.41c1cb87.olaf@aepfle.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=pbonzini@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=63.128.21.124; envelope-from=pbonzini@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org, Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 12/01/21 15:47, Olaf Hering wrote:
>> Olaf, can you expand on that?
> The full log is here:
> https://build.opensuse.org/public/build/home:olh:xen-unstable/openSUSE_15.1/x86_64/qemu/_log
> 
> I browsed configure and meson.build to make a guess which variable is false, so virtfs-proxy-helper is not built anymore.
> 


That was already reported and I'm sending a pull request later today.

Paolo


