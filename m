Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4EC359094C
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Aug 2022 01:48:08 +0200 (CEST)
Received: from localhost ([::1]:39022 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oMHuJ-0001zF-Vz
	for lists+qemu-devel@lfdr.de; Thu, 11 Aug 2022 19:48:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oMHqz-0007qg-VN
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 19:44:41 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:46781)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1oMHqy-0005nG-IJ
 for qemu-devel@nongnu.org; Thu, 11 Aug 2022 19:44:41 -0400
Received: by mail-pl1-x629.google.com with SMTP id p8so18195345plq.13
 for <qemu-devel@nongnu.org>; Thu, 11 Aug 2022 16:44:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc;
 bh=Cf+BokJt+NjCEjtrx46oW5kT2TVHEmvp7hQ4RTU0ATs=;
 b=lMSyahLpV7R3XqazDt/J2B6m5yrG5kwjnqOyDnBXBmUFDWCGDuARr6mDYJj0cilYeo
 3jRB5B+rNkBnyfU4MYrdhM8PJ/bbTYAynO2+uz75Ji+4TVTqMLdGS/+Oa80FsNcKRVMn
 he/WoUjLRKA4dkkliSFhVezHf/33sUquWSAZNolthaHiyET/5COYLQe9oy3aVQ+5lwNT
 kxKXAW6JEOPr6bPvfEGt0eE9rtJ6l4iCixkdx4RdKJI1qjg+jHBzuwFrH53QV7pKrPhF
 zi1ZFxXuRV1fiod41CChZaAL+kJUUFcqD3I4b9jehFNTS5WFf7zsj1Q16kBaUeEdc4bS
 xmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc;
 bh=Cf+BokJt+NjCEjtrx46oW5kT2TVHEmvp7hQ4RTU0ATs=;
 b=qxsTWPeulYZNvCOjICe2wi8aU0s59pSim0cdbDj/+qzaETGsuOEZ5kJcWpes9oZSal
 gP/mFzIGfXPSQp1YSCJrDNK6GdDI0rEn+m9PIWfoo/t5+kiG1s1HEonOyvY3RcEpWm8s
 HSBJO6TrBZtXieFOIbWDetb2axbT0rqC5dpCSk4aB5UxCJKZ76OSag2DU5nZDWaGryir
 ro4am9HzLDi+PxitzcKhTZneJBaQ4IJXgMXNytzeWYQPSnFyFyj/C+lL+8u0Pi9qILfN
 eu8yNq02r4oElhJYlneV+8f8UBLcUJDT/Sx50bkxubwGnhtbh8wudmEspN6VsxJB75zH
 Warw==
X-Gm-Message-State: ACgBeo2g6jY0aEiRJ0QlmRVDYSkOhJ3qkt2x4k/lcjduDdB294VdAb/k
 TILwQo7rzOV57o/hjB51AKg=
X-Google-Smtp-Source: AA6agR7o6kwyYvZGPbqpiyFNpQdTmi6jbKXllM+Lvfihwaf9AHH4vS7WoNeRhthrMpfCKSMEcr2KVQ==
X-Received: by 2002:a17:902:c943:b0:16f:15a0:d497 with SMTP id
 i3-20020a170902c94300b0016f15a0d497mr1503392pla.80.1660261479213; 
 Thu, 11 Aug 2022 16:44:39 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 c18-20020a170902d49200b0016dc78d0153sm212206plg.296.2022.08.11.16.44.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Aug 2022 16:44:38 -0700 (PDT)
Message-ID: <5a225fbc-e087-a5d1-a62d-3886cdfe3652@amsat.org>
Date: Fri, 12 Aug 2022 01:44:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.12.0
Subject: Re: [PATCH v1 6/8] tests/avocado: add timeout to the aspeed tests
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220811151413.3350684-1-alex.bennee@linaro.org>
 <20220811151413.3350684-7-alex.bennee@linaro.org>
In-Reply-To: <20220811151413.3350684-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x629.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 11/8/22 17:14, Alex Bennée wrote:
> On some systems the test can hang. At least defining a timeout stops
> it from hanging forever.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   tests/avocado/machine_aspeed.py | 2 ++
>   1 file changed, 2 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

