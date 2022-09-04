Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDAE5AC48A
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Sep 2022 15:44:54 +0200 (CEST)
Received: from localhost ([::1]:35014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oUpvg-0004Ff-42
	for lists+qemu-devel@lfdr.de; Sun, 04 Sep 2022 09:44:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60584)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oUpui-0002vI-Oc
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 09:43:53 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:38783)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oUpug-0007cF-VI
 for qemu-devel@nongnu.org; Sun, 04 Sep 2022 09:43:52 -0400
Received: by mail-wr1-x434.google.com with SMTP id b5so8146033wrr.5
 for <qemu-devel@nongnu.org>; Sun, 04 Sep 2022 06:43:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=qDoEVP4DaIc65GKP+Zby8XfxbVCOA+CwD4l9ClCWwC0=;
 b=QDIW9yVzCDfOZLNTTCbUikebHCUQwgZlP/sCfr94tcoMcLMN7+no44x+GPlchRi8ZR
 OWvJxRLsoBvKP0RYolt5K/600fiXugC8w9Xt7zdTh9YPrLrBvHgKoHOQi5wq23PYrsSk
 /hsMHrPC9GNwAb4Q7fOl88ffHqWYnMItcbG8pbcX61gcpq6194pCR7hTtOJeS7uEbJhF
 lemHwBCib2uke7rI6ExUgA/PjcYuCcC1csvmTU/f09PaKdGn2G/O1NljmD+NG8S0kBaV
 LUBUp13o6gWnCNdfPGXrzJWCgvNAo/QYzYWfrBlXwP9jd8avkYisYOPhMZonrev75v36
 SuSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=qDoEVP4DaIc65GKP+Zby8XfxbVCOA+CwD4l9ClCWwC0=;
 b=a9gqhN9JouJ6SWDldxxMn09dHkhLqOERavqdTEE3oeZaVjnDrgtZ/B+sbUJulL5Wja
 IVAsS09Kny0MLwFYKLBh5UGzv4445yVcSg2SE1XL/f5pcLzTnlM6iWLCyffWGAkiWi8Z
 IbGxdHLT5zrWJK2EtakLOL1eCXXnEs7Mr3VkONVVoWA8gYlB8p8TdIkp/UDORHvDDQvF
 YWmEZ5kx+Pkg+/+IzIHdv+jg0j34vq4nyEFBd8oUDoKHBGrEUaablo6Qvs3w3pSY5SB7
 qm8N7bJUnONjf55UmwKCIMnB6RdB7RJi5koSCFSZan78YtcOqM9KM4lBG2Q50DBxM6XZ
 W+6A==
X-Gm-Message-State: ACgBeo26H8bDIreds0Ye6aXufA/IApvlTLyrP9YlWNPSBvdbG8yCOV4s
 wwomr22wMubzMrzxMl5lbksi+K6gK/o=
X-Google-Smtp-Source: AA6agR6TGCM95CrWzfOw+3Hdnz1Ke0TaU7YDe/FVuvHX5aKUSdtAsQ0eANt2HoW4djWLya9vLmHr3A==
X-Received: by 2002:a05:6000:178b:b0:222:c6c4:b42e with SMTP id
 e11-20020a056000178b00b00222c6c4b42emr24044822wrg.275.1662299029212; 
 Sun, 04 Sep 2022 06:43:49 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a05600c4f4900b003a84375d0d1sm15778194wmq.44.2022.09.04.06.43.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 04 Sep 2022 06:43:48 -0700 (PDT)
Message-ID: <6cec2766-f3e7-4401-e37c-0f15cefc8ddd@amsat.org>
Date: Sun, 4 Sep 2022 15:43:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.0
Subject: Re: [PATCH] KVM: use store-release to mark dirty pages as harvested
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
Cc: Gavin Shan <gshan@redhat.com>, Peter Xu <peterx@redhat.com>
References: <20220902001936.108645-1-pbonzini@redhat.com>
In-Reply-To: <20220902001936.108645-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.978,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 2/9/22 02:19, Paolo Bonzini wrote:
> The following scenario can happen if QEMU sets more RESET flags while
> the KVM_RESET_DIRTY_RINGS ioctl is ongoing on another host CPU:
> 
>      CPU0                     CPU1               CPU2
>      ------------------------ ------------------ ------------------------
>                                                  fill gfn0
>                                                  store-rel flags for gfn0
>                                                  fill gfn1
>                                                  store-rel flags for gfn1
>      load-acq flags for gfn0
>      set RESET for gfn0
>      load-acq flags for gfn1
>      set RESET for gfn1
>      do ioctl! ----------->
>                               ioctl(RESET_RINGS)
>                                                  fill gfn2
>                                                  store-rel flags for gfn2
>      load-acq flags for gfn2
>      set RESET for gfn2
>                               process gfn0
>                               process gfn1
>                               process gfn2
>      do ioctl!
>      etc.
> 
> The three load-acquire in CPU0 synchronize with the three store-release
> in CPU2, but CPU0 and CPU1 are only synchronized up to gfn1 and CPU1
> may miss gfn2's fields other than flags.
> 
> The kernel must be able to cope with invalid values of the fields, and
> userspace *will* invoke the ioctl once more.  However, once the RESET flag
> is cleared on gfn2, it is lost forever, therefore in the above scenario
> CPU1 must read the correct value of gfn2's fields.
> 
> Therefore RESET must be set with a store-release, that will synchronize
> with KVM's load-acquire in CPU1.
> 
> Cc: Gavin Shan <gshan@redhat.com>
> Cc: Peter Xu <peterx@redhat.com>
> Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
> ---
>   accel/kvm/kvm-all.c | 18 +++++++++++++++++-
>   1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/accel/kvm/kvm-all.c b/accel/kvm/kvm-all.c
> index 136c8eaed3..7c8ce18bdd 100644
> --- a/accel/kvm/kvm-all.c
> +++ b/accel/kvm/kvm-all.c
> @@ -728,7 +728,23 @@ static bool dirty_gfn_is_dirtied(struct kvm_dirty_gfn *gfn)
>   
>   static void dirty_gfn_set_collected(struct kvm_dirty_gfn *gfn)
>   {
> -    gfn->flags = KVM_DIRTY_GFN_F_RESET;
> +    /*
> +     * Use a store-release so that the CPU that executes KVM_RESET_DIRTY_RINGS
> +     * sees the full content of the ring:
> +     *
> +     * CPU0                     CPU1                         CPU2
> +     * ------------------------------------------------------------------------------
> +     *                                                       fill gfn0
> +     *                                                       store-rel flags for gfn0
> +     * load-acq flags for gfn0
> +     * store-rel RESET for gfn0
> +     *                          ioctl(RESET_RINGS)
> +     *                            load-acq flags for gfn0
> +     *                            check if flags have RESET
> +     *
> +     * The synchronization goes from CPU2 to CPU0 to CPU1.
> +     */
> +    qatomic_store_release(&gfn->flags, KVM_DIRTY_GFN_F_RESET);
>   }

Thanks for the detailed explanation, very much appreciated.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

