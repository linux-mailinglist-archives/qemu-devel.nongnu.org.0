Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDDE13B0F03
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Jun 2021 22:52:14 +0200 (CEST)
Received: from localhost ([::1]:59532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvnNV-000742-G7
	for lists+qemu-devel@lfdr.de; Tue, 22 Jun 2021 16:52:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvnMP-0005xm-Ax; Tue, 22 Jun 2021 16:51:05 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:54234)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lvnMN-0006pq-OA; Tue, 22 Jun 2021 16:51:05 -0400
Received: by mail-wm1-x334.google.com with SMTP id w13so175734wmc.3;
 Tue, 22 Jun 2021 13:51:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=CQ6k4GjePlIpwayM63Iv86DI6geideQwgarPnAVJRkA=;
 b=THiRM1EnU9MA8fYn83bh9HfSXidb8m+5FnHkGiDp88BKEqTCYHh6UnOUCj+jlxcb/R
 fEfo8Ddqgwf4rmqi7deQtfy0OQtODGRn3GCaTJNSPLS6V7tMDfL7QhU89tmyUBjQNfxW
 +dcbU92PiIkq4Adt+9k4gdp/QCTG9qkbl2w7QrL4BsRoHXlvG4/B21bQHwKJI7aXvl3b
 43nNmj41Lwf8qKwPLLCz+OGdhFhvO7LDv7HbR7CXiw8SoxO/eb+9lks+B7k0/JDeR2DN
 m/XkeDV5azQOUVYsI8d672rwm3GhnxKqbKw6zAtPV9qlA9nfS7HT+28Q3UFxGHbf5PlA
 3fSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=CQ6k4GjePlIpwayM63Iv86DI6geideQwgarPnAVJRkA=;
 b=RssMRF0gLYEiMTXP0iksoYEGxlW4PehXzLojep/hL6WEx7qjeScDewFvs5CwXM1/uq
 RZoajnTZacNk/lZEpxch2V8eEIurIjx1tPNyiJb8YnmUr3ZzcOLuT+7TUn2KQYl154bY
 4h7w56SyCh5GgmunZCe3uOReZ+EIxteQ7rlAMwQ36Yb81p+vC4ThdzCMboo9koStq044
 bvNjL4fb6GVTi4wjEvKAt9EUJ12XXGXVysrp3NR9JgXfmBE+obiINWSWzaXNqvh/QurK
 dEpvhCl9uR4k7KdDBB6g2NUN5KM0fqrj+YgpkFIJxFqXWPUerx18meykHo4bS1Mm/DDa
 z3PA==
X-Gm-Message-State: AOAM531bPbQZx1iFudCVvOlXNFvfNz5Cnrw9xLt/8f33IiFyMwjQhFgp
 9Dvk+on0EZiN60LTZMEzCInXEgjr/n5AFQ==
X-Google-Smtp-Source: ABdhPJwPZna9KZl4rXUsfQe2O/d+TXcD01kbVLNF4FbwgOCps5l9MZCKWT5ejVdg2dlXoV7lPF6pYQ==
X-Received: by 2002:a05:600c:2318:: with SMTP id
 24mr6945188wmo.36.1624395061288; 
 Tue, 22 Jun 2021 13:51:01 -0700 (PDT)
Received: from [192.168.1.36] (93.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.93])
 by smtp.gmail.com with ESMTPSA id v22sm3321309wmh.40.2021.06.22.13.50.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Jun 2021 13:51:00 -0700 (PDT)
Subject: Re: SD/MMC host controller + 64-bit system bus
To: Joanne Koong <joannekoong@gmail.com>
References: <CAFAxGOcxET9j7VkDmcmUXmx3t9eSAM2a5RWSpCVmDfkOQPPfgA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <774c11e6-401f-d7ac-a021-44857ea6c620@amsat.org>
Date: Tue, 22 Jun 2021 22:50:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAFAxGOcxET9j7VkDmcmUXmx3t9eSAM2a5RWSpCVmDfkOQPPfgA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Joanne,

On 6/22/21 8:07 PM, Joanne Koong wrote:
> Hello! I noticed that the default SD/MMC host controller only supports a
> 32-bit system bus. Is there a reason 64-bit system buses aren't
> supported by default?

We aim to support the spec v2.00, so this is a bug in the model, 64-bit
system bus should be supported. Do you mind sending a patch?

Thanks,

Phil.

