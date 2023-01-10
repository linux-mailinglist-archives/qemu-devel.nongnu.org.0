Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C499663C9B
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 10:18:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFA9r-0001Ai-Rt; Tue, 10 Jan 2023 03:38:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFA9b-00014W-9W
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:38:45 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pFA9Z-0000bs-H7
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:38:43 -0500
Received: by mail-wm1-x333.google.com with SMTP id m3so8217162wmq.0
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 00:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ErLF4azLZLDGkLQxN7Hk+qlWB+Ke8yOtE1So2cdnFTs=;
 b=m8e0n0YLa8qgER5Ur2I9DQ42cRhoqUMpDm7HL/CN+15HMDen4jN4tRzr8CwgQa+5Lz
 fCWgLIfqTykzyvAnzEQtU9qIHAtIBpvfhpK2QDcNITAs3CdvgQfp7gzuzv+RVqK1BRVf
 JkRmw6CtFr2bwj4vQzx3sZm+yy1ZQUb73dOBSkV2M1pdKtsbXFk8vhL9j00B+VjeQFlV
 dJ4aKzLcj4T5OqitRrfe8FDpLvE5xSZIJRBwLgD6VlihKWxqvwhUSx3RkMPi5pIvWtOu
 8qBHRXZ8Kwa0olTxUjUqkUMiQOZa3yymB67l7VeklKqrf6kXZjmdpJ1DqQJbb5dNvuny
 v7cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ErLF4azLZLDGkLQxN7Hk+qlWB+Ke8yOtE1So2cdnFTs=;
 b=NkdW/LOZ11SXA53T8ebY4xjobhr6AM9ApzbeCfr6exo45vZ4rmeqDygP22xti0SMig
 ivA8AD6R3zoec0PxcagTePwdzD8SstPkvMpNJvaSLwW5/neUP1C/X5+cIvuij1jhA/8u
 9z0OXdOmErLstsz/d5HySsI8xv6ddFX7DwZ1/VTvsE2KmowIDWB+d7H2QnvzCNL8S/PO
 u3tEsCrXNpjQnjM/fMIfec3ipgbIRBPhuP9P1MRPTdrcWCxyq0Jh4507Zi0yprUrka4+
 kcT+zW8yjxMu+byFE5s6W6kHCkkRo6o8uc5NcR7o0KZ+qljUmPeOk/k1UG2wWqWgO29j
 u/gw==
X-Gm-Message-State: AFqh2kr1eI8IpIBB9/e5VYzaqU66g00nvDmcnwx7sIZUZwLjMgVkrrlf
 wziVmqSMIkSjmcxyQNR/yd+LHA==
X-Google-Smtp-Source: AMrXdXsqEooXFlaAXmuBi+j2odKy+Q4qLtuO0ovn5MNfiBrvVi6KvqoixF6LNyEehZy8+gpSOcgx5A==
X-Received: by 2002:a05:600c:358e:b0:3d9:9755:d659 with SMTP id
 p14-20020a05600c358e00b003d99755d659mr30970986wmq.22.1673339919916; 
 Tue, 10 Jan 2023 00:38:39 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 2-20020a05600c020200b003d9ef8ad6b2sm6122840wmi.13.2023.01.10.00.38.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 10 Jan 2023 00:38:39 -0800 (PST)
Message-ID: <68661c26-3292-3c34-58ef-44e61e912b21@linaro.org>
Date: Tue, 10 Jan 2023 09:38:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v5 0/1] python/machine: Fix AF_UNIX path too long
Content-Language: en-US
To: Peter Delevoryas <peter@pjd.dev>
Cc: jsnow@redhat.com, crosa@redhat.com, bleal@redhat.com,
 wainersm@redhat.com, qemu-devel@nongnu.org
References: <20230110082930.42129-1-peter@pjd.dev>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230110082930.42129-1-peter@pjd.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 10/1/23 09:29, Peter Delevoryas wrote:

> $ make check-avocado

> Avocado crashed: TypeError: cannot pickle '_thread.RLock' object

Yeah... you have to pick Cleber's patches from
https://gitlab.com/cleber.gnu/qemu/-/commits/WIP/tests_fixes
and run as:

$ TMPDIR=/tmp avocado run --test-runner=nrunner ...

This is tracked on the avocado project:
https://github.com/avocado-framework/avocado/issues/5138#issuecomment-1314551148


