Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2E7D4D76F8
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Mar 2022 17:48:39 +0100 (CET)
Received: from localhost ([::1]:43824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTROY-0002WP-C0
	for lists+qemu-devel@lfdr.de; Sun, 13 Mar 2022 12:48:38 -0400
Received: from eggs.gnu.org ([209.51.188.92]:48644)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTRNH-0001pq-Al
 for qemu-devel@nongnu.org; Sun, 13 Mar 2022 12:47:19 -0400
Received: from [2607:f8b0:4864:20::52b] (port=42685
 helo=mail-pg1-x52b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nTRNF-0006M2-QR
 for qemu-devel@nongnu.org; Sun, 13 Mar 2022 12:47:18 -0400
Received: by mail-pg1-x52b.google.com with SMTP id o8so11780409pgf.9
 for <qemu-devel@nongnu.org>; Sun, 13 Mar 2022 09:47:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=JDJmDE3VU/AxiuLUUK4eUdYyjGz+Jh8F19D1ZDHn0PQ=;
 b=b1cf8Kjk7Zx8SDXNey1jffnoFYUWsMDxzKnl3Mhjng295uicspY17DQGXTKlKEZslT
 sQb8o/QM+wEKr9jMN3qWNRkGORuFlOco3gWkWQAiCNsvjEQKLKh78BrRlUYCR9Qm9GUD
 V0bv7pWI63TE0Rjbk26tPXHYLzmr7+nkicjCD/mXnhjZdymi8WHJKjU4bC+7X4wS0M7p
 z30DLjUSgHexVlJwgkhGwziiWco8yBYcVHqrVETTZo3FOL/hs4mtT/JuIb+isq2rFyfa
 +YVfKJNYq/jZCGlYCuLMlleZzVaCLbYgZt54CsBU91r4+Im773ckIHqJ7rP42jPzIosL
 84eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=JDJmDE3VU/AxiuLUUK4eUdYyjGz+Jh8F19D1ZDHn0PQ=;
 b=iEWsEz+jFgVPzG26DlwSLMTFV/oIzLQ7kg1sgBDhPDvf0nWaxCfJjCQIGsKrG5ux9H
 yWmH44mj3BPe/zYoWTI+zFo8Lb4ZdUzb/rIFO1/EBMdVm3qAvY+tAsnNnTpckX2kJgI7
 OJhNND1Qqwocn8IOb5W2dNT3Zz03ne1mtFegavsBpf8jYXpf18SyGtnSuZkDKdEyktTJ
 RKWC/wZpnS8SV0zd6dDFxokFzg9dCAer4xf/dCtt7/ESzy5AAKAzX6gezuFsGg+DFxaH
 MxutszMn3tsjFX2KqwKyCnbSN+MuDxjNZy+Oick5Dxha3rCIKCJETCSQG/vmukZIsOxM
 4Z+w==
X-Gm-Message-State: AOAM5316o24HoiLcSyIp1SBoMQ7tt9WzNxY9XFYLPk/VB3MP/amxSh5v
 LybauoUyQ/JIbDXYRf5zla3v/g==
X-Google-Smtp-Source: ABdhPJzxuwfhMFgz64ZhZnCJQAFFusaWM/XdcY6nUroMJS2TFa4uFQDsTZJ11rZKyeY3p0OpyAreqw==
X-Received: by 2002:a63:1d6:0:b0:380:a063:660c with SMTP id
 205-20020a6301d6000000b00380a063660cmr16963509pgb.149.1647190035808; 
 Sun, 13 Mar 2022 09:47:15 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 q13-20020a056a00084d00b004f79504ef9csm8702059pfk.3.2022.03.13.09.47.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Mar 2022 09:47:15 -0700 (PDT)
Message-ID: <da134ea5-ffe9-d544-62b4-1914aad15ab5@linaro.org>
Date: Sun, 13 Mar 2022 09:47:12 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: Question about atomics
Content-Language: en-US
To: Warner Losh <imp@bsdimp.com>, Paolo Bonzini <pbonzini@redhat.com>
References: <CANCZdfpJVWFjrQDiYJy8xiw-THF8_3GNcu=0Pmbvp_6zAJbfHA@mail.gmail.com>
 <5bb620d4-96f0-cf7f-5530-af529a32c78d@linaro.org>
 <CANCZdfqwA8HbxYhud8pKxF_f=BMoMtrO+R=zg7GiKesz8_YZvg@mail.gmail.com>
 <e60a4298-17f3-d3e7-bf94-bf2dbbe83141@redhat.com>
 <CANCZdfqDSNhQYnb1PWi-753cJ4FvO-JBFmTW_mAAdezOQSDF1g@mail.gmail.com>
 <CANCZdfp61n8M8Qc9szvfqYcHnqnUADpkPmL9QHW0uDKDffJ2NA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CANCZdfp61n8M8Qc9szvfqYcHnqnUADpkPmL9QHW0uDKDffJ2NA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::52b
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::52b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/12/22 20:59, Warner Losh wrote:
> FreeBSD's pthread_mutex is shared between the kernel and user land.
> So it does a compare and set to take the lock. Uncontested and unheld
> locks will mean we've taken the lock and return. Contested locks
> are kicked to the kernel to wait. When userland releases the lock
> it signals the kernel to wakeup via a system call. The kernel then
> does a cas to try to acquire the lock. It either returns with the lock
> held, or goes back to sleep. This we have atomics operating both in
> the kernel (via standard host atomics) and userland atomics done
> via start/end_exclusive.

You need to use standard host atomics for this case.

r~

