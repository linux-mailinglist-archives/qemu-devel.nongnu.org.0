Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FD9940CC5C
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Sep 2021 20:10:46 +0200 (CEST)
Received: from localhost ([::1]:33554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQZMr-0003jo-HO
	for lists+qemu-devel@lfdr.de; Wed, 15 Sep 2021 14:10:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQZ6j-0006k4-B7
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:54:05 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:38550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mQZ6h-0006wS-Mg
 for qemu-devel@nongnu.org; Wed, 15 Sep 2021 13:54:05 -0400
Received: by mail-pg1-x534.google.com with SMTP id w8so3486320pgf.5
 for <qemu-devel@nongnu.org>; Wed, 15 Sep 2021 10:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=j4LzCKf2qciHMIf6YajDcwOV+AgUzeArWF1YUXfnlQE=;
 b=CQLZ/lGliIporcAUuObTficL5nP+8cluhI4z464figX07jhA9qmEnyt3YhP+lJg1eP
 iAi2Nw/PDPKauOjS/1WttrgTk42y0zJ2UcFF+YXRRQWc325cB3pvnfUtNOmFMhBpORSx
 KZRnAaOBHF8Hao727FuB5pnzjJxPVqQjoq0PlKfX0k9AUw7DgD7M6Ug/M2FRHB0HcumL
 a4hwS/p/t29g+A1lJxsduqDgXBoswLJDcqj63QIZ+ZeUv/g1EUr3AxGahGOxGxOVl4gN
 UjO0pwRqFTZf4K5OY6NQpMR/ap2cdHjtG98zZwbDHA8rAXc/nDAFxYA+fEVpRuDejGzI
 7fNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=j4LzCKf2qciHMIf6YajDcwOV+AgUzeArWF1YUXfnlQE=;
 b=y73H+NVMNgtr70J2PZXPlcJCuXzbQF5RaOlEUqbTUYAjybi0OU940YCHyrVsDXxTUb
 lYhHOiJm3BmHpga54ZumeVufavf/7+IYXNbUDYYzgFHBRqylawXliy73u6z+PHAtJFX8
 mGb6GZXknUrL+etzWLa1wMfPR/lzP4QJpMeEmiv2Wkmqx1RZyAKVYWSvDcNd129hMhKf
 mn5Uja9LYz11TAH+4vW2msS8y3tYG1HhlaG5ziyCPaJlgC4+w2mrB7x05QZTpz5UT435
 t2jLxD9GcJ99toYnkAiDbHav0PQ1kPNe2nS+RHVBHhz903PFzRQ4wGuDYGDSlXX7zBcD
 YSNQ==
X-Gm-Message-State: AOAM532dE8yHx1gke+yNPACBycUu5WQR4JXWsis3yTWVi67hMrwb+HNu
 r7BRmtj7215TZ0dOvta348zQtA==
X-Google-Smtp-Source: ABdhPJxQVHxcYFWqpzj5UdLSPCqKj2l5GNNOG+6qgI8M5R6UvxOff2u29SBI+Lk+QhAePm2yPczJsg==
X-Received: by 2002:a63:79c7:: with SMTP id u190mr932135pgc.378.1631728442175; 
 Wed, 15 Sep 2021 10:54:02 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id z17sm526095pfj.185.2021.09.15.10.54.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 10:54:01 -0700 (PDT)
Subject: Re: [PATCH 0/2] linux-user/nios2: trap and kuser fixes
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210915174951.1852266-1-richard.henderson@linaro.org>
Message-ID: <2a014319-18ac-2224-982f-19973eb89d6a@linaro.org>
Date: Wed, 15 Sep 2021 10:54:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210915174951.1852266-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.698,
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
Cc: marex@denx.de, crwulff@gmail.com, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/15/21 10:49 AM, Richard Henderson wrote:
> Based-on: 20210813131809.28655-1-peter.maydell@linaro.org
> ("linux-user: Clean up siginfo_t handling for arm, aarch64")
> ... for force_sig_fault().

Laurent, while I posted a follow-up to Peter's patch set, I'd prefer to go ahead and merge 
his first.  Just about everything I'm poking about with currently requires force_sig_fault().


r~

