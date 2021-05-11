Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E11C37AE18
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 20:10:36 +0200 (CEST)
Received: from localhost ([::1]:44086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgWq3-00026K-1s
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 14:10:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgWoO-0001Pu-JW
 for qemu-devel@nongnu.org; Tue, 11 May 2021 14:08:52 -0400
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331]:52874)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lgWoN-0003V0-3y
 for qemu-devel@nongnu.org; Tue, 11 May 2021 14:08:52 -0400
Received: by mail-wm1-x331.google.com with SMTP id g65so11624119wmg.2
 for <qemu-devel@nongnu.org>; Tue, 11 May 2021 11:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qgW1jSHOhqn4nypYVW5ZeeYO2K0skvXgH+lYSSXf6rU=;
 b=DCdcT7vY1ASUZ5UCdBHPVWNR9Y5L0YeScsrpTsZ2hitbtc4225zteCuvMzT80kRlHr
 J16x20c1FOmqVyUQ35L0efRJ9JiutcsSoOzxbb5rxKCbMmjkmHK3QsP9qN0Df5Th0loM
 6745rsvo0xqIMRyPtif7Ohf1URqrudtHvCkFe8EZzsYmIk/ugYdEflHuK6CjFWrKXhF3
 g1E8wiIhaSkvIik8omWG0y+Jab3H2+sO/gx26909JTUpK9h5kKzVerChuU6akpN1eGu2
 bnBy7gU5RscojVLoBM7sXA+vMnGMjaqD8dJJUwaVDVn1gn/c+hUfWff2ngJ6EBr+Q3zp
 L37A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qgW1jSHOhqn4nypYVW5ZeeYO2K0skvXgH+lYSSXf6rU=;
 b=RtvMjlF7HULRPUdJEnZJ4AkmDjJojUopsm9fwUYvLuUIepTnuWbIxzVUAD9CGCOigW
 32mreFglZL/ilyK1NvfIw6x4PF/w22JmIPEUbWm25zJdO0+ut10ygdoSGwqKJYJzZvUg
 5LH1lf2TKMTevmMKEwxCOq3r3cY17g30C7HHdS5Wst8EZ9vUEcg6IxbDUOcYhI2jYA+y
 4ltjgiI6ai3++j4EN1BQV/yH/UjawerjK5Z4ccdhpwjP6Av6PCbM0xnKE17qDbwBL437
 qj6i6rFvoTslZyVeXcnJjE2xF97c1NLlDjFLHTxGO9CRRimfMZdt03p0qgbqs+zNEH6A
 GwxQ==
X-Gm-Message-State: AOAM5332vYCc+1CMfNGtHdqDSTosooVyptWP8xvEqzfDVMXcTWUFvSjb
 zUlKoxE/of2B5z2gIYR0EOI=
X-Google-Smtp-Source: ABdhPJxkI8m3e7TZnwxTu5Ju40l9jBht8URV6KuLfREwn+m6UHZ6AV93nsKls2u0zZMIsZ1fSME/mA==
X-Received: by 2002:a7b:c016:: with SMTP id c22mr6994101wmb.96.1620756524514; 
 Tue, 11 May 2021 11:08:44 -0700 (PDT)
Received: from [192.168.1.36] (39.red-81-40-121.staticip.rima-tde.net.
 [81.40.121.39])
 by smtp.gmail.com with ESMTPSA id x4sm4032993wmj.17.2021.05.11.11.08.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 11:08:43 -0700 (PDT)
Subject: Re: [PATCH 2/3] bsd-user: Stop building the sparc platforms
To: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org
References: <20210510221511.14205-1-imp@bsdimp.com>
 <20210510221511.14205-3-imp@bsdimp.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bbb73203-0a3e-5b1e-30a7-9d213e75392c@amsat.org>
Date: Tue, 11 May 2021 20:08:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210510221511.14205-3-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x331.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.001,
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
Cc: kevans@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 5/11/21 12:15 AM, Warner Losh wrote:
> The forked bsd-user tree doesn't really support these platforms.  They aren't
> functional at the moment anyway. Remove them from the build so that the major
> reorg patch series can focus on one platform (x86) before adding addition
> platforms once things are shuffled. This should make it easier to review
> and satisfy that all revisions of a patch series are buildable.

I'd s/platform/target/ in subject and description to make it clearer.

> Signed-off-by: Warner Losh <imp@bsdimp.com>
> ---
>  default-configs/targets/sparc-bsd-user.mak   | 3 ---
>  default-configs/targets/sparc64-bsd-user.mak | 4 ----
>  2 files changed, 7 deletions(-)
>  delete mode 100644 default-configs/targets/sparc-bsd-user.mak
>  delete mode 100644 default-configs/targets/sparc64-bsd-user.mak

