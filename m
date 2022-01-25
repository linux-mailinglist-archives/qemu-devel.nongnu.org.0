Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 108EA49AFD0
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Jan 2022 10:28:12 +0100 (CET)
Received: from localhost ([::1]:41656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nCI7X-0001qc-7C
	for lists+qemu-devel@lfdr.de; Tue, 25 Jan 2022 04:28:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58174)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nCI4D-0007it-Bc; Tue, 25 Jan 2022 04:24:45 -0500
Received: from [2a00:1450:4864:20::62d] (port=45771
 helo=mail-ej1-x62d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <paolo.bonzini@gmail.com>)
 id 1nCI4B-0003qu-A2; Tue, 25 Jan 2022 04:24:45 -0500
Received: by mail-ej1-x62d.google.com with SMTP id me13so29225212ejb.12;
 Tue, 25 Jan 2022 01:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OesiMrOkA9dMWMjDNrVF2Kn5NLhpLupdY5htYwc+j3g=;
 b=q1aGJVEfOvumsEA3ZbPy/TR0XTX7mYE4usDOdPXlZGzuifY0tnyiBitRlQn84Z5ms4
 NLVi4lhO+57TARiOXwOiX4pYLxme5RoaYwFJcVydIwRN2oek6rlgRmG7ZhcbGaMOVZJ6
 rSShM9czrffzfBkjqre0U+nRP03cXiT7DjQDnZUbH/k2QWj/2IAcHmK4d69S2X+ZgLc1
 y69u9AdptU3J0oSZmznR4JOXPWdsf+FK67jRnXPlLi8CFy2XGKj9DfDS5EpisXUCz51/
 zo8yZVek9iD2TLb3Up+Y6MHuRStbEoC1GdvThxiPVS8gN6qv0EaAc47SsmI+p8x2axat
 /v7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=OesiMrOkA9dMWMjDNrVF2Kn5NLhpLupdY5htYwc+j3g=;
 b=dSQ6tmFui5OpyiZgssm9ltW45bylgyCYJC6sfCj3zuwKVwwe4U2Pej6CC5X4MhsgjJ
 lV7NVUD/xy4HcOYh//DZIbQdrLPoa79x4GoFOLerN7hL/2Hjz+JzfjAD4zvBGK3j4eIS
 ByJUjHSkw6mL+0IlvfHv5OxeAuq3T3FQY4DfUkUUgW49zuitjp2eU5BOdSJgUZ8Nxe3J
 IacZfB+FJ3HPRlaNZM+Cjtii+n9E1VVou+9t9RtRjJ5HHZSw6iRmRwpXEo0jC+KpGMNl
 kDcAtYd4l37V3TU1o943pyjCU/u0fy55iiTtZGNIHKPArAQSdCssVkXUM6ZMxQvBfGuU
 10fw==
X-Gm-Message-State: AOAM530O9Td1rdUR9zcPkveGNjZZo3Sk9G2ApvcODjBShTYYz+dSt4z6
 bLRNtBA52aIjKX0i9/Zj8+0=
X-Google-Smtp-Source: ABdhPJzNyNul2w04fil/JpizB4zR1vh5MM01UTSEgT2S0tzL4k85C+ayLy4M8rhStR9NhOQA4Osxyw==
X-Received: by 2002:a17:907:16a0:: with SMTP id
 hc32mr13409812ejc.314.1643102681370; 
 Tue, 25 Jan 2022 01:24:41 -0800 (PST)
Received: from ?IPV6:2001:b07:6468:f312:c8dd:75d4:99ab:290a?
 ([2001:b07:6468:f312:c8dd:75d4:99ab:290a])
 by smtp.googlemail.com with ESMTPSA id
 gr24sm5833621ejb.185.2022.01.25.01.24.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Jan 2022 01:24:41 -0800 (PST)
Message-ID: <8689ce30-7021-5d5d-861f-1d759e8acf46@redhat.com>
Date: Tue, 25 Jan 2022 10:24:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] block: bdrv_set_backing_hd(): use drained section
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-block@nongnu.org
References: <20220124173741.2984056-1-vsementsov@virtuozzo.com>
From: Paolo Bonzini <pbonzini@redhat.com>
In-Reply-To: <20220124173741.2984056-1-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::62d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=paolo.bonzini@gmail.com; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: kwolf@redhat.com, den@openvz.org, hreitz@redhat.com,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/24/22 18:37, Vladimir Sementsov-Ogievskiy wrote:
> Graph modifications should be done in drained section. stream_prepare()
> handler of block stream job call bdrv_set_backing_hd() without using
> drained section and it's theoretically possible that some IO request
> will interleave with graph modification and will use outdated pointers
> to removed block nodes.
> 
> Some other callers use bdrv_set_backing_hd() not caring about drained
> sections too. So it seems good to make a drained section exactly in
> bdrv_set_backing_hd().

Emanuele has a similar patch in his series to protect all graph
modifications with drains:

@@ -3456,6 +3478,11 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
  
      assert(qemu_in_main_thread());
  
+    bdrv_subtree_drained_begin_unlocked(bs);
+    if (backing_hd) {
+        bdrv_subtree_drained_begin_unlocked(backing_hd);
+    }
+
      ret = bdrv_set_backing_noperm(bs, backing_hd, tran, errp);
      if (ret < 0) {
          goto out;
@@ -3464,6 +3491,10 @@ int bdrv_set_backing_hd(BlockDriverState *bs, BlockDriverState *backing_hd,
      ret = bdrv_refresh_perms(bs, errp);
  out:
      tran_finalize(tran, ret);
+    if (backing_hd) {
+        bdrv_subtree_drained_end_unlocked(backing_hd);
+    }
+    bdrv_subtree_drained_end_unlocked(bs);
  
      return ret;
  }

so the idea at least is correct.

I don't object to fixing this independently, but please check
1) if a subtree drain would be more appropriate, 2) whether
backing_hd should be drained as well, 3) whether we're guaranteed
to be holding the AioContext lock as required for
bdrv_drained_begin/end.

Paolo

