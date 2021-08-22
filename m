Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2803F3F73
	for <lists+qemu-devel@lfdr.de>; Sun, 22 Aug 2021 15:20:29 +0200 (CEST)
Received: from localhost ([::1]:51114 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mHnOm-0006Gs-1p
	for lists+qemu-devel@lfdr.de; Sun, 22 Aug 2021 09:20:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mHnNP-0005cU-A2
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 09:19:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1mHnNL-0001uf-VP
 for qemu-devel@nongnu.org; Sun, 22 Aug 2021 09:19:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1629638337;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7SKl59EOt2Mn1S4iNkOv/aBCGs+uNHlZJ2/OviiUUgg=;
 b=HaovVnUBDYbgIbhjjmzwA+LxrU8J8XpxFVb5KXdh59gZJVzK5CKZHOPjBqssFejqCH5ZXS
 lIZFvksIAIXkkKLQIzucilWQd6HuuPhCRld4FIj3f0RcxRjh7Jm12xuHSrWM8iOrtnzFrD
 dirgiMHGGeifAwxGukziBSSRlr6PYZI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-59DRtXSAN8-cApciOWTjAQ-1; Sun, 22 Aug 2021 09:18:56 -0400
X-MC-Unique: 59DRtXSAN8-cApciOWTjAQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 a201-20020a1c7fd2000000b002e748bf0544so683263wmd.2
 for <qemu-devel@nongnu.org>; Sun, 22 Aug 2021 06:18:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7SKl59EOt2Mn1S4iNkOv/aBCGs+uNHlZJ2/OviiUUgg=;
 b=djV30rkT1uzX6O6lpCJa5qCnwSzwGtG23qYROcNES1w8aCjfC1PRHHA+VwbBfiCCJG
 Pnk2raOY5WvSZuSLxhX72Y7kO97PKTc2a9ywt5m6Eo6TuTmxSgCIioz9gqli30p4agbd
 2D5iucClSa4rejqyuBxmejXsl5SMn7FjCeiKMjo4opsOEs5D2HvcgE3zG7xHh6KaahqH
 baws9Jl/UbMmVEaHwFc/x2gFbE+3/GqyKJLGa9G/ruU/oODq1kCpEalbs2pJfAc7/eb+
 ymJd2IQ/24m9OWK8S7K3SQ2OgRjTdtetjLH5DCgD+3wXnBVL1KIpNoP+F0eBITIYHM9I
 gCMQ==
X-Gm-Message-State: AOAM532hwa4KbJ74tJEyhGDPIW3I6/OAy8pdtq/MGS45BPFjKfilSErF
 PJPYAG3uwZqO1cU0bzfucakRcPQ3vVE6OdhUPGjHUrYX77Bp0h4PDWN3RvHLg1x2Qk0Ys+xyt4v
 Av/IZ9KJBMpDABwc=
X-Received: by 2002:adf:f044:: with SMTP id t4mr9008928wro.352.1629638334957; 
 Sun, 22 Aug 2021 06:18:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwE0HIfAYgA2E3MN4MQh3kuJSrX8tk3Wf2tVY1VNT0mtZEb29EmEo517fNOWV4horEQMuqY7w==
X-Received: by 2002:adf:f044:: with SMTP id t4mr9008914wro.352.1629638334720; 
 Sun, 22 Aug 2021 06:18:54 -0700 (PDT)
Received: from thuth.remote.csb (p5791d4fd.dip0.t-ipconnect.de.
 [87.145.212.253])
 by smtp.gmail.com with ESMTPSA id b10sm8227776wrt.43.2021.08.22.06.18.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 22 Aug 2021 06:18:54 -0700 (PDT)
Subject: Re: [qemu-web PATCH] Add a blog post about FUSE block exports
To: Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>
References: <20210819102501.69638-1-hreitz@redhat.com>
 <YR6FauCbECxehubc@stefanha-x1.localdomain>
 <46a68d5c-cfc1-e521-8c6b-90eb74c85ede@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <541f1df5-47b4-bff7-f326-a087512c95ba@redhat.com>
Date: Sun, 22 Aug 2021 15:18:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <46a68d5c-cfc1-e521-8c6b-90eb74c85ede@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.746,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.959, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 20/08/2021 09.56, Hanna Reitz wrote:
> On 19.08.21 18:23, Stefan Hajnoczi wrote:
>> On Thu, Aug 19, 2021 at 12:25:01PM +0200, Hanna Reitz wrote:
>>> This post explains when FUSE block exports are useful, how they work,
>>> and that it is fun to export an image file on its own path so it looks
>>> like your image file (in whatever format it was) is a raw image now.
[...]
>> This is a long blog post. One idea is to show a quickstart
>> qemu-storage-daemon FUSE export command-line in the beginning before
>> explaining all the details. That way people who just want to see what
>> this is about can get an idea without learning all the background first.
> 
> Sounds good, will do.  Thanks!

Oops, sorry, I just already pushed your patch to the repository since I did 
not notice this conversation in time. Next time, please make sure to put 
myself (and Paolo) on CC: when sending updates for qemu-web, otherwise I 
might not notice the updates :-/

  Thomas


