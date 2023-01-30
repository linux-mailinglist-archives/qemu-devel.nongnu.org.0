Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41C8B681B10
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:04:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMaN2-0006KX-Le; Mon, 30 Jan 2023 15:03:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pMaN0-0006JK-EL
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:03:14 -0500
Received: from esa2.hc2706-39.iphmx.com ([216.71.152.49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alxndr@bu.edu>) id 1pMaMy-00046D-Dc
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:03:14 -0500
X-IronPort-RemoteIP: 209.85.219.70
X-IronPort-MID: 255262966
X-IronPort-Reputation: None
X-IronPort-Listener: OutgoingMail
X-IronPort-SenderGroup: RELAY_GSUITE
X-IronPort-MailFlowPolicy: $RELAYED
IronPort-Data: A9a23:IKEOGKpIsjgJBKYXoL54ukf5QbxeBmKlZxIvgKrLsJaIsI4StFCzt
 garIBmDP6uMNzCgKYh+bIzloBgGsZDUzIRhT1Fprio8EHkVp5acVYWSI3mrAy7DdceroGCLT
 ik9hnssCOhuExcwcz/0auCJQUFUjP3OHfykTbaeYUidfCc8IA85kxVvhuUltYBhhNm9Emult
 Mj75sbSIzdJ4RYtWo4vw//F+UwHUMja4mtC5QRnPqgT5zcyqlFOZH4hDfDpR5fHatQMdgKKb
 76r5K20+Grf4yAsBruN+losWhRXKlJ6FVHmZkt+AsBOsDAbzsAB+v9T2M4nVKtio27hc+ada
 Tl6ncfYpQ8BZsUgkQmGOvVSO3gW0aZuodcrLZUj2CA6IoKvn3bEmp1T4E8K0YIw9th2BHtR0
 9YjFylTQjmojuW62pSXVbw57igjBJGD0II3v3hhyXTAE69jT8+bBarN4tBc0XE7gcUm8fT2P
 ZJIL2oyKk6ZMlsQYj/7C7pn9AusrnD7YztUsnqfuOw673W7IAlZiuWwaoSPK4LULSlTtnagq
 mPJ4Tr5ODoDZISgkRWI90yhv+CayEsXX6pXTtVU7MVCmVCW2ykfBQMbUXO9pv+2jFP4XMhQQ
 3H44QIrpKk2sVW1F5zzAEX+r3mDsRoRHdFXFoXW9T2w90Yd2C7BbkBsc9KLQIdOWBMeLdDy6
 mK0og==
IronPort-HdrOrdr: A9a23:gtL1E6E4RiKW+/FLpLqEwMeALOsnbusQ8zAXPiFKOGVom6mj/P
 xG885w6faKskd2ZJhNo7+90dC7LU80lqQU3WByB9qftWDd0QOVxedZnOjfKlbbehEWmNQy6U
 4ZSdkdNDWhZmIK6foTHWGDYrMd6ejC7qazmO/E0h5WPGZXV50=
Received: from mail-qv1-f70.google.com ([209.85.219.70])
 by ob1.hc2706-39.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 30 Jan 2023 15:03:07 -0500
Received: by mail-qv1-f70.google.com with SMTP id
 q17-20020a056214019100b004b1d3c9f3acso7071833qvr.0
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:03:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bu.edu; s=s1gsbu;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=MVx2Hj/j2ZOAJnusEKyNPvbd51icWpE2vJegjTseZY8=;
 b=XTAsDiK8wxsVvUBUvSfXWq05lYEERYw6RLe1soMmDrp5B3XH6l333ogkYRNwK7BNkl
 jW1UzWS5cwleGE+ZQtjZwCVonfcI0l/Y1iBcU8kIlNb5mJrkNPGUeEM1cuHiI2zhnCnh
 u9+xArnHyAaNJqFMeYwvsYFcrJdSLFWRCFLGPBm4Zvok0enItDn/QFufdf9pGPQJZd/K
 MvTa0aRS/8I0HK0Kw5k0f+ePlvUslifnkrU1elaTAvvbEwUkSRUCl8C+YnX23knQNwcT
 XEAGr8WZgrDFc/ysy7+SG8IWy5EGyHCQEl+o9d4MCKfE2cZhcT7O3bLR5kM+x6ghtI2w
 Ko/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MVx2Hj/j2ZOAJnusEKyNPvbd51icWpE2vJegjTseZY8=;
 b=VafTiZTVrN3oZ4wGjvkvwm3v+77sctq57xBKG/POlUkrm05KaapD+rUHf2W65Orzk8
 4H1WN31+20BVKk9m+9acuLFTNlqaD6vwlL6k/mswVtYLFG4pXvIn8DyjvXJ10TodBaW5
 HHYG+wc68CklV5yIcEdOhFRRcGP6qnFWP5r0/wMhJOId7Luoc0xPX6AOPDihEbF5kpgR
 xzxg7fpU/ZMocFG9juTwSDpgtdxwKg56f3KXHxmsbFVlH+bR1/iVSvxsAl20mu26xY+/
 9Go9WiKrNxWNxl+0UoLjy+G6BcM/cx+5Ryz+pLO8mUhlgI4dnd9qE0is2v9/oHauocbW
 hNlw==
X-Gm-Message-State: AO0yUKVINnE7anYwJnwEJ4CtarKJU2VFPQk9imF3tOazUp+tRIANF/aX
 nx52FE4nPzz4qE75vnjdjPFQdO2cN0l3/UoD2gtb2uT6HOrIoR+BjnHNMuMiXhPwVEW7xjR8WfN
 5TkSAz2I0wjBdATH9jB+EY68gnhL1gw==
X-Received: by 2002:a05:622a:c:b0:3b6:9418:ad6f with SMTP id
 x12-20020a05622a000c00b003b69418ad6fmr16907297qtw.67.1675108986632; 
 Mon, 30 Jan 2023 12:03:06 -0800 (PST)
X-Google-Smtp-Source: AK7set+wCeMw/+rsdz1aNNp6uMuLC4hax0UjyH0qqaZ8KdZ5hFUAhATOCNPWS+MUTetXJHAL9ZcJXQ==
X-Received: by 2002:a05:622a:c:b0:3b6:9418:ad6f with SMTP id
 x12-20020a05622a000c00b003b69418ad6fmr16907263qtw.67.1675108986338; 
 Mon, 30 Jan 2023 12:03:06 -0800 (PST)
Received: from mozz.bu.edu (mozz.bu.edu. [128.197.127.33])
 by smtp.gmail.com with ESMTPSA id
 i1-20020a37b801000000b00702d1c6e7bbsm8461911qkf.130.2023.01.30.12.03.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:03:05 -0800 (PST)
Date: Mon, 30 Jan 2023 15:03:00 -0500
From: Alexander Bulekov <alxndr@bu.edu>
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH] softmmu: Use memmove in flatview_write_continue
Message-ID: <20230130200300.be736j6ya5srnphb@mozz.bu.edu>
References: <20230130135152.76882-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130135152.76882-1-akihiko.odaki@daynix.com>
X-CES-GSUITE_AUTH: bf3aNvsZpxl8
Received-SPF: pass client-ip=216.71.152.49; envelope-from=alxndr@bu.edu;
 helo=esa2.hc2706-39.iphmx.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HK_RANDOM_ENVFROM=0.001, HK_RANDOM_FROM=0.999, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 230130 2251, Akihiko Odaki wrote:
> We found a case where the source passed to flatview_write_continue() may
> overlap with the destination when fuzzing igb, a new proposed network
> device with sanitizers.
> 
> igb uses pci_dma_map() to get Tx packet, and pci_dma_write() to write Rx
> buffer. While pci_dma_write() is usually used to write data from
> memory not mapped to the guest, if igb is configured to perform
> loopback, the data will be sourced from the guest memory. The source and
> destination can overlap and the usage of memcpy() will be invalid in
> such a case.
> 
> While we do not really have to deal with such an invalid request for
> igb, detecting the overlap in igb code beforehand requires complex code,
> and only covers this specific case. Instead, just replace memcpy() with
> memmove() to torelate overlaps. Using memmove() will slightly damage the
> performance as it will need to check overlaps before using SIMD
> instructions for copying, but the cost should be negiligble, considering
> the inherent complexity of flatview_write_continue().
> 
> The test cases generated by the fuzzer is available at:
> https://patchew.org/QEMU/20230129053316.1071513-1-alxndr@bu.edu/
> 
> The fixed test case is:
> fuzz/crash_47dfe62d9f911bf523ff48cd441b61c0013ed805
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Since this is called fairly often, I went down a rabit hole looking at
memmove vs memcpy perf, but It looks like this should not be much of a
problem.

Acked-by: Akihiko Odaki <akihiko.odaki@daynix.com>

Thank you

> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>  softmmu/physmem.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/softmmu/physmem.c b/softmmu/physmem.c
> index cb998cdf23..3cd27b1c9d 100644
> --- a/softmmu/physmem.c
> +++ b/softmmu/physmem.c
> @@ -2828,7 +2828,7 @@ static MemTxResult flatview_write_continue(FlatView *fv, hwaddr addr,
>          } else {
>              /* RAM case */
>              ram_ptr = qemu_ram_ptr_length(mr->ram_block, addr1, &l, false);
> -            memcpy(ram_ptr, buf, l);
> +            memmove(ram_ptr, buf, l);
>              invalidate_and_set_dirty(mr, addr1, l);
>          }
>  
> -- 
> 2.39.1
> 

