Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9F56652C7
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Jul 2019 10:05:49 +0200 (CEST)
Received: from localhost ([::1]:39344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hlU5M-0001f8-AJ
	for lists+qemu-devel@lfdr.de; Thu, 11 Jul 2019 04:05:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47890)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hlU4U-00015R-Nr
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 04:04:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hlU4T-0001Bb-CC
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 04:04:54 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37494)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hlU4T-00019G-5M
 for qemu-devel@nongnu.org; Thu, 11 Jul 2019 04:04:53 -0400
Received: by mail-wr1-f65.google.com with SMTP id n9so5191683wrr.4
 for <qemu-devel@nongnu.org>; Thu, 11 Jul 2019 01:04:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fpUQW4vD0J3fWp8KYrYIcHzZ3zwZWHcKjRBxyjf7bh8=;
 b=Hukl2329gvn+JhLcWGtMeAHMW57A02A8XZTZnFZNwHtxwIoWI4isOwmtvIlVAIKtgd
 ndw1mHaRN7e5cf8mfp7aYY65e9eT6UsgpCYZOZCgyV6EtchvHRR5z0lCm38QXMsmuPFR
 e7AmfF4XIrF9qM2VfjsCoWASdW6YMqMkHzTjYuQgDspTEy9tsrd1KdYTPStVaimnC2je
 njm5UBdIegaumX/1L04hdQGjBjq88Iy6mzikT86aYeA2z8nBKCR2sAgRUQs5J/Mfam2Q
 W0iO1BmZz/3KOirZH239HPynTaPs8ZYi8DuMR76aaKkUn0kvS0RJianrsrkKvxF0gRlS
 KyLA==
X-Gm-Message-State: APjAAAWcpSs82PMK++oFrOO59eNqIuu/MuRLopUrUrEujXwQIGZWe+TR
 uuc7gP8Oud2FsAB6EsFLTZPv+yB3jQY=
X-Google-Smtp-Source: APXvYqxM8Ta4rTo1M2mfQUqyUg4sMT4I6oEpnheoYfSPQk72KdypmRqnUHUf4sf75SUW6h2kgsoLuA==
X-Received: by 2002:adf:de8e:: with SMTP id w14mr3259479wrl.79.1562832290552; 
 Thu, 11 Jul 2019 01:04:50 -0700 (PDT)
Received: from ?IPv6:2001:b07:6468:f312:c1b9:e491:30e8:c02?
 ([2001:b07:6468:f312:c1b9:e491:30e8:c02])
 by smtp.gmail.com with ESMTPSA id x83sm4106611wmb.42.2019.07.11.01.04.49
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Jul 2019 01:04:50 -0700 (PDT)
To: Dmitry Fomichev <Dmitry.Fomichev@wdc.com>,
 "kwolf@redhat.com" <kwolf@redhat.com>
References: <20190709203806.17550-1-dmitry.fomichev@wdc.com>
 <f790cb77-fa6a-c304-bc7f-62bbede78751@redhat.com>
 <20190710110241.GB6501@localhost.localdomain>
 <eea2bb4e-813e-456b-8aa9-514f63c5057e@redhat.com>
 <20190710210914.GC6501@localhost.localdomain>
 <de7bea2d02f53845bcaa41b4bb7c10f42676755f.camel@wdc.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <d3f87083-8ed7-8f2e-bb75-1278f9500347@redhat.com>
Date: Thu, 11 Jul 2019 10:04:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <de7bea2d02f53845bcaa41b4bb7c10f42676755f.camel@wdc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-devel] [PATCH 0/4] virtio: handle zoned backing devices
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
Cc: "fam@euphon.net" <fam@euphon.net>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "mst@redhat.com" <mst@redhat.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "stefanha@redhat.com" <stefanha@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/07/19 02:52, Dmitry Fomichev wrote:
> Paolo,
> WRT to Host Aware drives, these MAY work, but we don't have any of these
> available for testing and are not able to verify which drivers do work
> with them and which do not. This is the reason for not letting them pass
> thru. If you prefer, I can enable passing HA drives in V2.

In theory host aware should work the same as drive managed if the host
is oblivious of zones, so I prefer enabling them indeed.

Thanks,

Paolo

