Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 683F245C403
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 14:43:25 +0100 (CET)
Received: from localhost ([::1]:57372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpsYV-0007pT-Hr
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 08:43:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40836)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mps2B-0003Xj-8B; Wed, 24 Nov 2021 08:09:59 -0500
Received: from [2607:f8b0:4864:20::929] (port=41975
 helo=mail-ua1-x929.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mps27-0007yi-GT; Wed, 24 Nov 2021 08:09:56 -0500
Received: by mail-ua1-x929.google.com with SMTP id p37so4940454uae.8;
 Wed, 24 Nov 2021 05:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=zRVsjmQa6gV8sHyGVx4OooHBV+LFb06gDpK50XnMUjE=;
 b=XQTQKtFzhaDsKa9M68TjdsOjcmztIQ7tTJtrAASH3uEVVM6l1LUMLaYwA0QHGZpIkK
 uorqnuGRGeFtIWf63hFDbFngDhvejVjjg4tc44Y/dX821g8Bol1+M9a1KDy4RYzUGZB5
 y81nPF18ghuGJBEjwrW9Sopr9wEWOHHw0ojF8XbVN0LLACAj7pkwbWfJgEcvhAh4QH8g
 unj3B4my2gXDcRMJhpr8+fwuVPKm07mJXnhVJpfzYGv3NTG9aFHNgNphTZs3u3LsERg+
 A1zT1wGq1CCrOLp5hQHDyDdmTChrs2gZjTONoYcv8lA1VNvJcl/UWFFBBComgb7myB+S
 oJpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=zRVsjmQa6gV8sHyGVx4OooHBV+LFb06gDpK50XnMUjE=;
 b=TX2FjGUX+SLnm1BlCRaBVczuL8V7NMPweqYfTp8Li6bLj1xpHbTVT0ettuUCdqMBW1
 7YqwAp7xLyMUHyeyRex5er3PoLF5LXbl8q98864loAEABenH2RuEZ6xGlo3CUEeRyL39
 EYgAy8aX2Z4k/j7drDAK+WUZ+56K25Nrdbien6THb+wJ96FiNNOlfpUvrmfB6hlMzwqY
 ex2bYys4FeBwvqGj/2pVZk4qTL6YlY5LvsPzrbBdMGKtD9QLvGmDnzJZVCF69hD2DT4K
 JKhE5ggYdmAjrCpdMDwFLEvyFSAxK+QI/rMjuH2Mb++3NP3P+4loM3dorWjzcdGzRrFy
 /wjg==
X-Gm-Message-State: AOAM532Df4rpZbkgdjQSI2nb/SyN2WqygmWa5i61YovRzv3kFNbIfe/Y
 2q2PytHdMzTE5UrYK35Taio=
X-Google-Smtp-Source: ABdhPJwhkoD+pVoqDP8LeJHqxJWWqKSG0IqAp/Z0HV1qLEfnKaqzdhN+BhI5yVzBdGvs+jWlDBamzg==
X-Received: by 2002:a05:6102:3a6d:: with SMTP id
 bf13mr23097067vsb.3.1637759394189; 
 Wed, 24 Nov 2021 05:09:54 -0800 (PST)
Received: from [192.168.10.222] ([191.19.215.188])
 by smtp.gmail.com with ESMTPSA id u14sm7785052vkk.12.2021.11.24.05.09.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Nov 2021 05:09:53 -0800 (PST)
Message-ID: <7f5efc59-f097-9752-c4a0-3b7724e6f215@gmail.com>
Date: Wed, 24 Nov 2021 10:09:51 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH for-7.0 v2 1/2] ivshmem.c: change endianness to
 LITTLE_ENDIAN
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
References: <20211124092948.335389-1-danielhb413@gmail.com>
 <20211124092948.335389-2-danielhb413@gmail.com>
 <7d312ca5-82d1-ba63-535d-8024f2033215@redhat.com>
 <87lf1dyaqa.fsf@dusky.pond.sub.org>
From: Daniel Henrique Barboza <danielhb413@gmail.com>
In-Reply-To: <87lf1dyaqa.fsf@dusky.pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::929
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::929;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x929.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, NICE_REPLY_A=-4.1,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: thuth@redhat.com, qemu-devel@nongnu.org, clg@kaod.org, qemu-ppc@nongnu.org,
 Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



On 11/24/21 09:55, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
>> On 11/24/21 10:29, Daniel Henrique Barboza wrote:
>>> The ivshmem device, as with most PCI devices, uses little endian byte
>>> order. However, the endianness of its mmio_ops is marked as
>>> DEVICE_NATIVE_ENDIAN. This presents not only the usual problems with big
>>> endian hosts but also with PowerPC little endian hosts as well, since
>>> the Power architecture in QEMU uses big endian hardware (XIVE controller,
>>> PCI Host Bridges, etc) even if the host is in little endian byte order.
>>
>> Maybe mention commit f7a199b2b44 ("ivshmem: use little-endian
>> int64_t for the protocol")?
> 
> "The protocol" is the interface between ivshmem-doorbell device (client)
> and ivshmem server.  This commit is about the interface between
> ivshmem-* device and the guest.  The two interfaces are about as related
> as SSH and DNS: software exists that uses both.
> 

Yeah, I was about to reply asking what's the relevance of how client-server
communicates and the problem I'm trying to fix. It really seems a problem
with the commit I mentioned in the "Fixes" tag that introduced the memory API
with native endian instead of little endian.

Let's keep the commit msg as is. Thanks,


Daniel


> Mentioning f7a199b2b44 feels superfluous to me.
> 
> [...]
> 

