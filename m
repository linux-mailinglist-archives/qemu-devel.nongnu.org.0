Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA56F5B3175
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Sep 2022 10:16:41 +0200 (CEST)
Received: from localhost ([::1]:32804 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWZBo-0002XY-Eo
	for lists+qemu-devel@lfdr.de; Fri, 09 Sep 2022 04:16:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oWYy0-0002oZ-8v
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 04:02:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1oWYxx-00020d-Gi
 for qemu-devel@nongnu.org; Fri, 09 Sep 2022 04:02:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662710540;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L4aiCv3DQffhho4nhLvtJMFC0s173+oyNkH3+TzK2R0=;
 b=TmYiMivkm6IGUzem1pfChbdtTOGLM2gC0N5ys2EvUAyiKgsAMh8mnioL2LgEv5bmQdg566
 E2fk3idEk6Il+zxVq45MRNGQtvWcqKTCVB/Coo+etxdFZ6PvuybbtNOkTGrhBcHExAQF10
 mGUpLasVhVRSVMonrxBIMFqCqJ1F4PQ=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-297-3dmIZHoiM76K10iXeSTh8g-1; Fri, 09 Sep 2022 04:02:19 -0400
X-MC-Unique: 3dmIZHoiM76K10iXeSTh8g-1
Received: by mail-qt1-f197.google.com with SMTP id
 y12-20020ac8708c000000b00342f1bb8428so917353qto.5
 for <qemu-devel@nongnu.org>; Fri, 09 Sep 2022 01:02:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=L4aiCv3DQffhho4nhLvtJMFC0s173+oyNkH3+TzK2R0=;
 b=tgNCq6oYSGBkjVx7eHXESwD8cJyTPv0duljdyrAKCWmxl14YsoQU4tm2DR0btmKGFp
 PK6JQYvfsNarhBjuFLWfWAkXf3M/tdheN7ngJewV0x5FAIepEpcBrk/vlW3T7kWkXQOb
 T5UO7F8+ymWYajGny6xPj/dfbgyDRZdHqMABJToAVdJu6uq+mYq6W3YkFeH30DqZQ5n/
 eW72wW4rmF0nVQhPqNIayAkA48kte8AjEm3XSfVSnrPS1ZUTj02ayW5EKN/rJrRCgRK8
 f9yz0FNJO1iId/lPbTuAeZhhNsRnQQ02qSk2NdHZT88utwyTvVOMaLZ8Dqr3/BG0nVLu
 pcZw==
X-Gm-Message-State: ACgBeo1CKjMuzZ9qAJQJ4TRfw9o9iFLbbkVTq/kG5Xa6g5CWo7RVht+y
 nsQOQEMbhkyS4XUBqSUrNKfyZfkDV1netwYaGiEK4t5ywQmCaLkU4Ce2Awmtkz1TFGXNhCIlbwG
 s8By6Ztecm1wDUkk=
X-Received: by 2002:ac8:5e4f:0:b0:345:391:cee6 with SMTP id
 i15-20020ac85e4f000000b003450391cee6mr11144037qtx.255.1662710538668; 
 Fri, 09 Sep 2022 01:02:18 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6PUhWbboaAJvfMcvsjnLKVPMEpnYD1kR0kHKKQKLGf3kZn/jivKqv+dqTnrFEu/OG/msZC1w==
X-Received: by 2002:ac8:5e4f:0:b0:345:391:cee6 with SMTP id
 i15-20020ac85e4f000000b003450391cee6mr11144022qtx.255.1662710538485; 
 Fri, 09 Sep 2022 01:02:18 -0700 (PDT)
Received: from ?IPV6:2a04:ee41:4:31cb:e591:1e1e:abde:a8f1?
 ([2a04:ee41:4:31cb:e591:1e1e:abde:a8f1])
 by smtp.gmail.com with ESMTPSA id
 fw12-20020a05622a4a8c00b00344b807bb95sm1032388qtb.74.2022.09.09.01.02.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 09 Sep 2022 01:02:17 -0700 (PDT)
Message-ID: <66ed2e5b-b6a8-d9f7-3fe4-43c974dc0ecd@redhat.com>
Date: Fri, 9 Sep 2022 10:02:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [RFC PATCH 2/2] kvm/kvm-all.c: listener should delay kvm_vm_ioctl
 to the commit phase
Content-Language: en-US
To: David Hildenbrand <david@redhat.com>, Peter Xu <peterx@redhat.com>
Cc: Leonardo Bras Soares Passos <lsoaresp@redhat.com>,
 qemu-devel <qemu-devel@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Maxim Levitsky <mlevitsk@redhat.com>, kvm@vger.kernel.org
References: <20220816101250.1715523-1-eesposit@redhat.com>
 <20220816101250.1715523-3-eesposit@redhat.com> <Yv6baJoNikyuZ38R@xz-m1.local>
 <CAJ6HWG6maoPjbP8T5qo=iXCbNeHu4dq3wHLKtRLahYKuJmMY-g@mail.gmail.com>
 <YwOOcC72KKABKgU+@xz-m1.local>
 <d4601180-4c95-a952-2b40-d40fa8e55005@redhat.com>
 <YwqFfyZ1fMA9knnK@xz-m1.local>
 <d02d6a6e-637e-48f9-9acc-811344712cd3@redhat.com>
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
In-Reply-To: <d02d6a6e-637e-48f9-9acc-811344712cd3@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.142, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


>> One thing I forgot to ask: iirc we used to have a workaround to kick all
>> vcpus out, update memory slots, then continue all vcpus.  Would that work
>> for us too for the problem you're working on?
> 
> As reference, here is one such approach for region resizes only:
> 
> https://lore.kernel.org/qemu-devel/20200312161217.3590-1-david@redhat.com/
> 
> which notes:
> 
> "Instead of inhibiting during the region_resize(), we could inhibit for
> the hole memory transaction (from begin() to commit()). This could be
> nice, because also splitting of memory regions would be atomic (I
> remember there was a BUG report regarding that), however, I am not sure
> if that might impact any RT users."
> 
> 
I read:

"Using pause_all_vcpus()/resume_all_vcpus() is not possible, as it will
temporarily drop the BQL - something most callers can't handle (esp.
when called from vcpu context e.g., in virtio code)."

Thank you,
Emanuele


