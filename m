Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF8223480AD
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Mar 2021 19:39:28 +0100 (CET)
Received: from localhost ([::1]:36418 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lP8Pf-0005cy-OO
	for lists+qemu-devel@lfdr.de; Wed, 24 Mar 2021 14:39:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP8J1-0001OE-PL
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:32:35 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:37446)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lP8Iz-0002U0-Cx
 for qemu-devel@nongnu.org; Wed, 24 Mar 2021 14:32:34 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 t23-20020a0568301e37b02901b65ab30024so23954583otr.4
 for <qemu-devel@nongnu.org>; Wed, 24 Mar 2021 11:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2uzXI+Kb42kWOqviaHqk8Qh/ykVoxMX14tprDcaddo8=;
 b=RAwTSPPHpAbWYQzR/mLkg4pSu4wfAXcB7ywuc35EUb916ITsTsYJ0ZZfB4QGWdA40i
 io9ZkQPR5IRQXi78T0xF/9mQ+3IfkDW+He5zdlHMWfZ2AIshSHZ3tsWKy2nECYVCC1Cs
 Zv44Rtjeqfr1A9HZFZSZMNw/1h/1kaCZP8FxxAgGU2OGrvxJdxj6HubSR5OJrxZ68cri
 s5Qsvq3m4h4tAf3amdBkod4sJ5T0e4um3Fwds3FZuDwoCgi0QnsDmHl1K0nwwgJWvE4D
 PjwffZYrXA4guvWuYGVn/trHk0RkSsgrccoq55z4hUfjHnssBltw9s6BAeRfas2ayq+m
 XYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2uzXI+Kb42kWOqviaHqk8Qh/ykVoxMX14tprDcaddo8=;
 b=AKiEQeDFjxiGYyJEO8Shx+vJ8sNLxPSjSv7oiTjH6NSOO0jHvtKwHGzevYPzF/Aguc
 15VJMdFpKGhikluO8/S5wa7XMMKXf0N/q6+xOTgqSG0Ws/WU5Ttmgu65lUJnzJ5YGrYL
 es/e+RatWMxrbj1Sk6BRWaxQ2RUTmL+5mdu1FwE9GU0jZ0bhZELX4tBLNsa478UWVS9V
 CqI7Kb3+JiSSvNYwVEEEDUoZqLegRhzdrlTdH8egN98i+cHWpnmBiYOAkr++kHHEQSdO
 wpMR/idHZzNnFK0Zh9osy87ZZkrDRreQDcVC6m6LhPxaXVWKEreA8kP7SpAtjL3LVbHg
 vufw==
X-Gm-Message-State: AOAM5303tzaRByqA/XjvfXQ1jwVPJ/Xm49rK5P4bft8dNwIw5SxN1hQJ
 sawdjik7OTcSz3TVlWzfwETvSw==
X-Google-Smtp-Source: ABdhPJwN00meyzB7a08BA+ZperWX3cYPljBM/ndA9+S99HgtSyfTlEh8IoHQcXYiCXjLJjodtEjd7g==
X-Received: by 2002:a9d:6a91:: with SMTP id l17mr4158587otq.297.1616610752272; 
 Wed, 24 Mar 2021 11:32:32 -0700 (PDT)
Received: from [172.24.51.127] (168.189-204-159.bestelclientes.com.mx.
 [189.204.159.168])
 by smtp.gmail.com with ESMTPSA id a6sm542005oiw.44.2021.03.24.11.32.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Mar 2021 11:32:31 -0700 (PDT)
Subject: Re: [RFC v11 12/55] target/arm: cpu-mmu: fix comment style
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210323151749.21299-1-cfontana@suse.de>
 <20210323154639.23477-5-cfontana@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <5a100091-bfc0-76fd-768d-4edbc65f2f88@linaro.org>
Date: Wed, 24 Mar 2021 12:32:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210323154639.23477-5-cfontana@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x335.google.com
X-Spam_score_int: 12
X-Spam_score: 1.2
X-Spam_bar: +
X-Spam_report: (1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SBL_CSS=3.335, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-devel@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/23/21 9:45 AM, Claudio Fontana wrote:
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> ---
>   target/arm/cpu-mmu.h        |   3 +-
>   target/arm/cpu-mmu-sysemu.c | 149 ++++++++++++++++++++++++------------
>   2 files changed, 101 insertions(+), 51 deletions(-)

Surely this should go before the code movement.  I would think that checkpatch 
will complain about patch 11.


r~

