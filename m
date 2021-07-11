Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AAE33C3D54
	for <lists+qemu-devel@lfdr.de>; Sun, 11 Jul 2021 16:29:03 +0200 (CEST)
Received: from localhost ([::1]:41202 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2aS6-0008Av-Hr
	for lists+qemu-devel@lfdr.de; Sun, 11 Jul 2021 10:29:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2aQo-00071u-DR
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 10:27:42 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:38487)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2aQm-0003Ir-Ie
 for qemu-devel@nongnu.org; Sun, 11 Jul 2021 10:27:42 -0400
Received: by mail-pg1-x534.google.com with SMTP id h4so15326883pgp.5
 for <qemu-devel@nongnu.org>; Sun, 11 Jul 2021 07:27:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=yRQ/d3+oC+cleP63Ul3TOjcWK2U3IazfC75RKMmc1WE=;
 b=TtNidgaSoLU8RR/K+wTIVeXhnm7VC/dsWD2rvliJL++cR3LuCHhpDdNQAdbxWncJjv
 Z1PpzL+zM1bZbsl/OuiSo048o1KX2k7366unAHfzIgt3cGeel9EDfAlbarY+WxxCgPeg
 3Txzoi+kmD4Cu67y9U1zVY0VfBKOzjIqb7GODf7H0H2QyhbeYeUhjEkNjHysxW8M/Obk
 NfpYeBg7I2VGsBEaD9ioEx3gd2vfVanUgf7EloBIdggNijWLa3XcGTuMwf4ioYfXXppD
 v+LMXZgMWKH+vv+9efrw3YXr7D4Kryv5JWgF7rM6OGuy4q+0rY/CkAoDjhAl5z/SrhO6
 HTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=yRQ/d3+oC+cleP63Ul3TOjcWK2U3IazfC75RKMmc1WE=;
 b=lPP7l1xuxRqJ53CpyrsSVP3QDxKPMyTk0U8MjB5bewOzUOHXdv4z5EWH6cUU9Ycmwu
 05C5+tjv0L0hFegR70L53OYxlHZT7xRP4cTge2dFwMdkiEiHoVtjEdBXLxqH115qzIQX
 pGQbyb+Q/zCtXbpKjsktEagtaiAT6VoYbHiWtVJhaziPypMoOlfTi1F2BfYHJgS85+83
 Bh3YaPzEbpmhRHJBGnxMLgY4gg6JnSN/6hbWkwTXNwPkxLqWH41h8rpe9uId+GWUu9UE
 51zUwADTDMt0sZpkHIC6cs9SSq9uCJFFv4aARZCM3+A9p12ygy1+rmgZwtS0ZtIQqvvZ
 amMw==
X-Gm-Message-State: AOAM532QJeMabQp4ptHMiZUJAzA+nyp/4ACpiF5BP9AMSrBPbVUElkL6
 /KjQijmw7myc244JOSBMmEkT8g==
X-Google-Smtp-Source: ABdhPJw3zNLbSLs/6f6ilCIV3VDDqEQH0boizO0DaY3FN0PO/wdQ9PtNq5DO/rDbrw1kvt6kDvLU9A==
X-Received: by 2002:a63:ce14:: with SMTP id y20mr47252452pgf.432.1626013658229; 
 Sun, 11 Jul 2021 07:27:38 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id b2sm10545629pgh.9.2021.07.11.07.27.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Jul 2021 07:27:37 -0700 (PDT)
Subject: Re: intermittent hang in qos-test for qemu-system-i386 on 32-bit arm
 host
To: Peter Maydell <peter.maydell@linaro.org>
References: <CAFEAcA-L5kztvCiS-Y+_LDiaFgWzuCpPYN1-cHNY9Q8qpi538Q@mail.gmail.com>
 <20210711120854.andcppzuxo6ztykd@Rk>
 <CAFEAcA9tF7pU1uEC06tppkKCL7m+5OYWm8T5MO_qF4P2P_UuOQ@mail.gmail.com>
 <d21e1a9e-1df4-4fce-d6de-e7a15131b684@linaro.org>
 <CAFEAcA92V5rkyHr8Bjtd1VHM2QYLumMrUtQRZK5h2iWB7N-wAw@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7539ea85-bc6c-53ef-94a7-20fd68d2306e@linaro.org>
Date: Sun, 11 Jul 2021 07:27:36 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA92V5rkyHr8Bjtd1VHM2QYLumMrUtQRZK5h2iWB7N-wAw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -26
X-Spam_score: -2.7
X-Spam_bar: --
X-Spam_report: (-2.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.631,
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
Cc: Kevin Wolf <kwolf@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 Coiby Xu <coiby.xu@gmail.com>, Raphael Norwitz <raphael.norwitz@nutanix.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/11/21 7:21 AM, Peter Maydell wrote:
> On Sun, 11 Jul 2021 at 14:23, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>> I believe that I had to perform the install under tcg because I couldn't find the right
>> magic to boot off the debian cdrom with kvm.
> 
> Weird, it ought not in theory to care...

Looking back at the install script I used, I had u-boot boot off the cdrom, and I'm 
booting the kernel directly for kvm.  I guess there's something about the specific u-boot 
image I had that didn't work with kvm.  It has been long enough that I don't recall any 
further details.


r~

