Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6CC49C0C0
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Aug 2019 00:32:19 +0200 (CEST)
Received: from localhost ([::1]:39658 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1i1ea2-0007Vh-G1
	for lists+qemu-devel@lfdr.de; Sat, 24 Aug 2019 18:32:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41362)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i1eYo-00072e-MB
 for qemu-devel@nongnu.org; Sat, 24 Aug 2019 18:31:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i1eYn-0004mj-BP
 for qemu-devel@nongnu.org; Sat, 24 Aug 2019 18:31:02 -0400
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:38807)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i1eYn-0004kt-0y
 for qemu-devel@nongnu.org; Sat, 24 Aug 2019 18:31:01 -0400
Received: by mail-pl1-x641.google.com with SMTP id w11so7335705plp.5
 for <qemu-devel@nongnu.org>; Sat, 24 Aug 2019 15:31:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=RkpF3rk19gGHmpEsN2doZHV8E7vqkWnOFUPK4vmohsg=;
 b=Y7zdhCGPxacCLZ5n0ty9YuZ99AAKez0ZPVyLNKuced5F8sBaeBRT3jz/t+FF5UrtSq
 rE+lOdpi9arBeXij3ck+6hZ12z1zzOlc7p/bZNaXxU49Pkn8VA3MX9DzqbaR/hSW5Rdz
 0P2s/LMLyOUYpOQUxgcTF1ctorOMxVwSw68B8UFIFnqqiHvbjZDg6BnlH533zJXrBnWv
 kOp0HTrIdReuTG9NaE1BclPSQAw91LNi4wM9NkcrUOUu9n7SzsEg5RvUgcS445SYOQdC
 9UyJdgfH1vJ/a4DhUtKfC8ak3R7wzMNzLMF/kBCgMtqWJ6daCPdM9hZFZyS063fDTluz
 5XeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RkpF3rk19gGHmpEsN2doZHV8E7vqkWnOFUPK4vmohsg=;
 b=d+TVN6CnYN8VRwehnxh+7tJvMgZpFVb93tCQHjqpbDvAB5Br6scJcfdyuG49O3HE0g
 abCyFEzKis153ZuoEypHrbEOLtWz0zhX5RGk7oWAYQr6Q2NzZyHkAn/O+XBurahiTKji
 Yaba+OEuKWJkObR8MDVTjUS8+hNhVZs4TYS9dNua4ne3D9F4fvUP6dZeYJd3IGx15OFX
 ToIjG18hjm+HJMcJOZZ2wIzyQVNWc0JFeCp7pZAKCOeoHe5NXDCxc8/plxt91TO0L0JH
 Zu1fqwUTHKQ+aorVBkegw3rn2g/Y7FRSg+ZSB+4HzTxNwGts7u5AT2EcKBooEy289jm2
 suzg==
X-Gm-Message-State: APjAAAWTm1V0FLhO1eWKlTWj1w5ACl6AGZoCNmasH+7z2iWtvvete0es
 hoLCke3DPqGYoflq0tRZOfIkpg==
X-Google-Smtp-Source: APXvYqx6OpGOB1uTkFejQ7jcJhakPat7Y2YsgEmwuH9E/gbaLpdCviACtELi4ag5Kjq9Si10ICz7pw==
X-Received: by 2002:a17:902:100c:: with SMTP id
 b12mr11884109pla.40.1566685859876; 
 Sat, 24 Aug 2019 15:30:59 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id r23sm7672753pfg.10.2019.08.24.15.30.58
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 24 Aug 2019 15:30:58 -0700 (PDT)
To: Tony Nguyen <tony.nguyen@bt.com>, qemu-devel@nongnu.org
References: <cover.1566588033.git.tony.nguyen@bt.com>
 <3bd9a0372fe39837f676ed05b1297ecec894e030.1566588034.git.tony.nguyen@bt.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <c89f6ec7-7d08-bcb5-0e8f-1d0e3327bf3c@linaro.org>
Date: Sat, 24 Aug 2019 15:30:56 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <3bd9a0372fe39837f676ed05b1297ecec894e030.1566588034.git.tony.nguyen@bt.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
Subject: Re: [Qemu-devel] [PATCH 6/9] memory: Delete devend_memop
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
Cc: Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 8/23/19 12:42 PM, Tony Nguyen wrote:
> device_endian has been made redundant by MemOp.
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  include/exec/memory.h |  3 ---
>  memory.c              | 19 +------------------
>  memory_ldst.inc.c     | 18 ++++++------------
>  3 files changed, 7 insertions(+), 33 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

