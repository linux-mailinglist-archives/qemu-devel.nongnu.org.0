Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D98F333C1BD
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 17:28:25 +0100 (CET)
Received: from localhost ([::1]:41208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLq4u-0001PY-U0
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 12:28:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59634)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLq3q-0000nf-Cv
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:27:18 -0400
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32]:43657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lLq3o-00063d-M4
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 12:27:18 -0400
Received: by mail-qv1-xf32.google.com with SMTP id cx5so8038665qvb.10
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 09:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sVwD0Lwc4SXZHg439i0Jw1C5dvhFR6L8ZHqSpvoFdVA=;
 b=Iv7ZNKtny7GkCPYCZY+sp3qRK3VwVX2BgeizB5d2C5FWegt8tFtoCCEXqXq0p7kf5+
 bsnrkcsio5n0eUywAu7vDQdkB3AXhyK4R/wJQdSGosQ37JMjylDHZNQDADxvS1+uR6na
 uJqewA73GMIJ0YNvtm0BcFu4ZEJ/lodYAbwyABBhqKug/snwQ2mCswFA40jb11zeal7s
 CWNCD1Kp/9dPDcQVNmUU7UMa4x22cyffzpJNjgK2JWcScosFAaifjtf460hGqVzNTTka
 00t5gh62ePr4oOrYqyzx0G49XMe2YvDJr52+z0GNpGYeHGzXghexuxylvth1QeBltJLT
 N0qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sVwD0Lwc4SXZHg439i0Jw1C5dvhFR6L8ZHqSpvoFdVA=;
 b=ZKWn81f2MaFP2XdIP6KAQkmby9qT7QhECqof1HOlLKlbwznubVMogL0WDL1Fu6jIzT
 fIU9IgBdp4wFlXgE1OpZqRvFxJ139FtN5i/riLP2JF8SfGfFN5uBu3Ki4eAGl/9wpF1t
 dgfY6ytJiDwx4ujtYFYriO5aQuXnSosAL2hrHYYC2BZdbqZBt4gM53RYTck75/sXC1qj
 Ode+ykx+FODN8XLy3BBVeqrNKlKZZZzxPa8y5p6A0BhjOrZHz2RcJU8UpepaKMkKR/wK
 AEsDbVfs1N8HUYSkhKtjnNl2+xoj+Nl4FhLsEt2LdL9b5Nb2kitLzUtVf3wNXoHSDfmB
 TgHw==
X-Gm-Message-State: AOAM531TImhx7BtsVzO5mHluPemrDiqUclk4MqjunCr2R6PJ4WtwoEHJ
 mhh4xf16yMLREZjHbblx5tq7nQ==
X-Google-Smtp-Source: ABdhPJwkLIBTvcmy9WSKf4802Af/zLwfQWTu6ghQAWyvDagvCJTe8uotmL900zuvSCjY+/+axLNIkQ==
X-Received: by 2002:a05:6214:88:: with SMTP id
 n8mr11887015qvr.22.1615825635665; 
 Mon, 15 Mar 2021 09:27:15 -0700 (PDT)
Received: from [10.10.121.52] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id z5sm12625038qkz.2.2021.03.15.09.27.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Mar 2021 09:27:15 -0700 (PDT)
Subject: Re: compile warning in i8259.c
To: Thomas Huth <thuth@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-devel@nongnu.org,
 qemu-s390x <qemu-s390x@nongnu.org>
References: <cc283705-a0ee-5ee4-4f9a-b69afce65d8c@de.ibm.com>
 <21da022d-7349-ceca-ca88-b7987ac2eb0d@de.ibm.com>
 <8ba68f46-3bd8-b8ee-b45d-4f3235b38583@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <91094e63-a7e9-7513-f42f-deba1556b58a@linaro.org>
Date: Mon, 15 Mar 2021 10:27:12 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <8ba68f46-3bd8-b8ee-b45d-4f3235b38583@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/15/21 10:20 AM, Thomas Huth wrote:
> +    if (irq == 2) {
> +        irq2 = pic_get_irq(slave_pic);

This looks better.  You should also be able to pull in the declaration to

   int irq2 = pic_get_irq(slave_pic);

here.


r~

