Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AE835E6EDE
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Sep 2022 23:52:50 +0200 (CEST)
Received: from localhost ([::1]:40026 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obU7l-0004Ds-62
	for lists+qemu-devel@lfdr.de; Thu, 22 Sep 2022 17:52:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47158)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obU6D-000292-8Y
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 17:51:13 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:42706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1obU6B-00074T-KE
 for qemu-devel@nongnu.org; Thu, 22 Sep 2022 17:51:12 -0400
Received: by mail-pg1-x52a.google.com with SMTP id t190so10472029pgd.9
 for <qemu-devel@nongnu.org>; Thu, 22 Sep 2022 14:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=iremm5+GR7vMaxyC6J6p602GyNU3K6bidlSrtGzKDis=;
 b=QhtHQW4CXRoDZSDi35r9Wz5aA0HdmVTrwmVBJ8hsuEq1mZ/Gat8Y+hlIOdNCpGG38s
 ao+gWU2W4jRBvEIg0wxt+OzOpyNe3ux31FI6Q8BfRfXT6vDjS0xkxqqTXLFCfKGPpOPD
 +ALyWiWp7QYweCbdq8F7hCjeBtxHLItG0GTvDcZtBeqaEaasbX8CSOOt48zLBRxkecs+
 PuJy7qg1OJIlTfQC6hHHvV0UsibR1EaG4hEgh6KiOuOrhoQud6d+MyveCwdkFREe57nY
 cz+8Gi7xch/LIX1+6RDaqgUE/ROfhIPxUlNC5TksnjQCGkOpjK6ECgoAJ6py0mBDM5Kg
 3fgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=iremm5+GR7vMaxyC6J6p602GyNU3K6bidlSrtGzKDis=;
 b=tpqVPXQHVNnqHP9jfIRe+X7ru1iVqMnWvFZi/Z04w+m9S0WfpBkw7gkd7rkCkP0UyH
 rmIuwuAym2Iro05wAXUo1Jyx2/boksw5R8r9h3oM8cSz8scBwLBfqGMwXI8s5fFl6yB2
 iLx9T2SJ7IyHM+TXAAN8cDHcbWJfgfe1rzyCRuX7J+YDwiE1cO6WEgXYdRg6KrHM7F0w
 KcBVLkZms9XaVQ8DrqsSyFbT1jbOxsXLqsdzEkuHiNv036wOBmJ6Ve0YV24xs9RUN1oP
 DH9HzrvGYBwWlslf0vtwNq/5S/LylrS0gimFfe/iElwZ2Dne9BaOTsUSYTmRgBi/xnXw
 gOcQ==
X-Gm-Message-State: ACrzQf2VVRCe5vcprTexmeCvbSMsYcvcQFXwlegpuGUtlez2Woe3Gih8
 In/R3iimzaW5cKZo++cxSEg=
X-Google-Smtp-Source: AMsMyM5XFfEuYs8Nbw6H60koTskGA7B7IXH6EGem1q/oLl3sioGoLJHHbFCy/0Y0HzU9pjnfccHQHg==
X-Received: by 2002:a65:60cd:0:b0:43c:403:9863 with SMTP id
 r13-20020a6560cd000000b0043c04039863mr4841884pgv.106.1663883470248; 
 Thu, 22 Sep 2022 14:51:10 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b67-20020a621b46000000b0053e22c7f135sm4916512pfb.141.2022.09.22.14.51.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 14:51:09 -0700 (PDT)
Message-ID: <726982bc-3c26-2679-76ec-a51daf6f5b3d@amsat.org>
Date: Thu, 22 Sep 2022 23:51:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v1 9/9] gdbstub: move guest debug support check to ops
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: mads@ynddal.dk, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "open list:Overall KVM CPUs" <kvm@vger.kernel.org>
References: <20220922145832.1934429-1-alex.bennee@linaro.org>
 <20220922145832.1934429-10-alex.bennee@linaro.org>
In-Reply-To: <20220922145832.1934429-10-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.893,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 22/9/22 16:58, Alex Bennée wrote:
> This removes the final hard coding of kvm_enabled() in gdbstub and
> moves the check to an AccelOps.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Cc: Mads Ynddal <mads@ynddal.dk>
> ---
>   accel/kvm/kvm-cpus.h       | 1 +
>   gdbstub/internals.h        | 1 +
>   include/sysemu/accel-ops.h | 1 +
>   include/sysemu/kvm.h       | 7 -------
>   accel/kvm/kvm-accel-ops.c  | 1 +
>   accel/kvm/kvm-all.c        | 6 ++++++
>   accel/tcg/tcg-accel-ops.c  | 6 ++++++
>   gdbstub/gdbstub.c          | 5 ++---
>   gdbstub/softmmu.c          | 9 +++++++++
>   gdbstub/user.c             | 6 ++++++
>   10 files changed, 33 insertions(+), 10 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

