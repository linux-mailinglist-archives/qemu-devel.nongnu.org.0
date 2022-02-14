Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7D74B4F26
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 12:48:05 +0100 (CET)
Received: from localhost ([::1]:56668 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJZps-0007TT-U3
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 06:48:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35282)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJZl1-0006NS-7u; Mon, 14 Feb 2022 06:43:04 -0500
Received: from [2a00:1450:4864:20::62b] (port=36551
 helo=mail-ej1-x62b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nJZkz-00033D-Hs; Mon, 14 Feb 2022 06:43:02 -0500
Received: by mail-ej1-x62b.google.com with SMTP id jg20so11866139ejc.3;
 Mon, 14 Feb 2022 03:42:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IXD0x/H06a8pgpN9KeTj2LGU8oMsaApqIvsXoxV18ig=;
 b=HTmMfeZ8clctkkhLfcs8bK31UVwPFMTS2jTRtaS5aOIAaf0eAenN+3wSesKF0n3B6i
 TCxrIFFVH9G1PWfID/LJQF2cMZBOdtgGi9IGuqhBVkRGJIZ+QI3460E2DsOS5V0oMFVn
 loJWaIzAJcuTmeTqLHxMJUaUm7uoDeDzFkrjYvpyxF69RXoA2CEwyzlKZZT7y5PEuaaf
 POxIYzI2cZSa/Dnfkw2zzv/bT1U76oQ9jQRfmHgAQVnlmKoiedr01TYKNDXoNDlwajvc
 hC/CK4bteLBfF9Xo8sVY2YW/XRSQAJfmrFU/DTtkLndQ6QkqXFj1s3KD55rAEuVSZMXB
 T1oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=IXD0x/H06a8pgpN9KeTj2LGU8oMsaApqIvsXoxV18ig=;
 b=DFNkWrLo7iE3eIDVT55SpR33cafL4LHH8Jz8kfCqI6vD34f/JcqfApWTqC+d+lNZZP
 5+S9oLYQ20jBs18FqXAoCvCVJwkZa6J6DcDhZvAAzMJweF+2WtUobUz8OO0m1aZDhbNq
 xtoJanTWX3PkgjZ/uzmlwwI+MyY1E1W2IGIrZ1ynq04OwO3Mn39u6FASPLkxe+M6s32I
 fnbglnSpRJg+cjqEUZANhfcut2AD4cUU7wfdC1lCv71m6YKudRHI3ucLwA1bit4kGt3c
 N/FT/aPucdlMeJpjXmlBDzXorilLC9PC+cr1vwx0i9LBiNGh82sXHnezl27s/Ke8ey0j
 NAww==
X-Gm-Message-State: AOAM533wrqaVOlGfwYDDg7AQHp+cYKpSzGHxB6X5YaA7bz9Trb6Q3c92
 84KufAitXBWXSn5Uuy/briM=
X-Google-Smtp-Source: ABdhPJxhzaAY1NZGnZjk9JB+2EXGPm+hrSenog35U5osaJOzeiprc0tBY+QODXuxxpK4U85AGnarxw==
X-Received: by 2002:a17:907:7f94:: with SMTP id
 qk20mr11437556ejc.328.1644838977201; 
 Mon, 14 Feb 2022 03:42:57 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id m7sm14144187edb.16.2022.02.14.03.42.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Feb 2022 03:42:56 -0800 (PST)
Message-ID: <db25869b-fbf2-f5ca-b2f8-4fe4f3c0a040@redhat.com>
Date: Mon, 14 Feb 2022 12:42:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 5/6] test-bdrv-drain.c: remove test_detach_by_parent_cb()
Content-Language: en-US
To: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
References: <20220208153655.1251658-1-eesposit@redhat.com>
 <20220208153655.1251658-6-eesposit@redhat.com> <YgaDBkblIA6wu82p@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <YgaDBkblIA6wu82p@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62b.google.com
X-Spam_score_int: 1
X-Spam_score: 0.1
X-Spam_bar: /
X-Spam_report: (0.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.785, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 qemu-devel@nongnu.org, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/11/22 16:38, Kevin Wolf wrote:
> The callback of an I/O function isn't I/O, though. It is code_after_
> the I/O has completed. If this doesn't work any more, it feels like this
> is a bug.

The issue is that the I/O has *not* completed yet.  blk_aio_preadv(..., 
cb, opaque) is not equivalent to

	ret = blk_co_preadv(...);
	cb(ret, opaque);

but rather to

	blk_inc_in_flight(blk);
	ret = blk_co_preadv(...);
	cb(ret, opaque);
	blk_dec_in_flight(blk);

Your own commit message (yeah I know we've all been through that :)) 
explains why, and notes that it is now invalid to drain in a callback:

     commit 46aaf2a566e364a62315219255099cbf1c9b990d
     Author: Kevin Wolf <kwolf@redhat.com>
     Date:   Thu Sep 6 17:47:22 2018 +0200

     block-backend: Decrease in_flight only after callback

     Request callbacks can do pretty much anything, including operations
     that will yield from the coroutine (such as draining the backend).
     In that case, a decreased in_flight would be visible to other code
     and could lead to a drain completing while the callback hasn't
     actually completed yet.

     Note that reordering these operations forbids calling drain directly
     inside an AIO callback.

So the questions are:

1) is the above commit wrong though well-intentioned?

2) is it unexpected that bdrv_replace_child_noperm() drains (thus 
becoming invalid from the callback, albeit valid through a bottom half)?


My answer is respectively 1) it's correct, many coroutines do 
inc_in_flight before creation and dec_in_flight at the end, we're just 
saying that it's _always_ the case for callback-based operations; 2) no, 
it's not unexpected and therefore the test is the incorrect one.

Paolo

