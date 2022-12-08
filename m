Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3659C646FD4
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Dec 2022 13:37:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3G88-00044n-Fb; Thu, 08 Dec 2022 07:36:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3G7w-00043z-N2
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 07:35:57 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p3G7v-0006IP-7h
 for qemu-devel@nongnu.org; Thu, 08 Dec 2022 07:35:48 -0500
Received: by mail-wr1-x434.google.com with SMTP id o5so1474311wrm.1
 for <qemu-devel@nongnu.org>; Thu, 08 Dec 2022 04:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=t+Gj82i3btMDRVOi1/TCqG7NKfobAZmayx99BiZaqBE=;
 b=wF0w0VY3BzqHMgzCvdgA1Lo9VL2HxEzL7h4f/yf8HHCpo6zMcyA/uLhwD06e0NOAza
 pwoyBe0xUreFgttjC41V9c6uFWpdW4QNXKDfqQ0uHR6mOKdPWmiprRyOrp4LJco6E7jJ
 XBYm1tFRVOGoDQekH3uGFkxFzHjU1lEEx3ytOf8pMS89IyvJyncRIS+HZwqZedkpZIJL
 EFkDmxwkFgRbApZSHu21nVwfW8enuvH2H01g3qwGM/ylc93vyrcngW7sHAaJUC4+uOTu
 uZ8KnwcB7EZ/CWJ4YQJXPKbCHh62OEjTf0oP9FM1DbJuQVBKX9tGCr+nhNDn1hn8EnGt
 /Rew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=t+Gj82i3btMDRVOi1/TCqG7NKfobAZmayx99BiZaqBE=;
 b=Q5J5vH+PCy69ee/8D/J5BAzpN26f6kr9ojBvKLkUbaseL0AqcqCFs1A9xpnF3pwJgs
 jB5bxTgHvt2wZuq6xdpMiBVPHAhZoKmYtZXBtJS26NVJHgW8UqVQoM7qKDTLVzFHauBB
 GRCHmYOLD1K5mnKAt3LfjMmUXdFY+9jIXgEWUYe1it+iPlhfYPaMuQ4GHVBjFrO6X4Db
 jv3Ozwt/c5AgiM2EoV4HNOg3aIJGUroak7Mymf4JclA2VBKRNZRHdbVm6+4TaQkfPlkS
 Y7mRUX9FdP/3sQN5Gmkn4h93kxOavCf7RN5UfGtGMiij2OfVe5ELWqA7fA2GOuEcm8My
 nzRw==
X-Gm-Message-State: ANoB5pkUlFEeBWTwVv1kAij3SdCVCQ3i37oSp0N/uaTy7/Ca4Lc7VqJ4
 8cxsMSyMPCXkx1Uns0m4PzwI7w==
X-Google-Smtp-Source: AA0mqf5GbtgH2o6O4xWKQgzTYhAB4dPiZ+FkwL/0Lmchf8EWLupc+9n3Y1OM8U29yLy0kT96JFI+pw==
X-Received: by 2002:adf:c64e:0:b0:236:78cd:f3d2 with SMTP id
 u14-20020adfc64e000000b0023678cdf3d2mr17414192wrg.719.1670502945196; 
 Thu, 08 Dec 2022 04:35:45 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 p17-20020a05600c359100b003c6f8d30e40sm4940783wmq.31.2022.12.08.04.35.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Dec 2022 04:35:44 -0800 (PST)
Message-ID: <ab100c9d-3145-9f9c-84f7-ddf9bad13dae@linaro.org>
Date: Thu, 8 Dec 2022 13:35:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v2 1/3] hw/nvme: use QOM accessors
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>, qemu-devel@nongnu.org
Cc: Keith Busch <kbusch@kernel.org>, Jinhao Fan <fanjinhao21s@ict.ac.cn>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>
References: <20221208122642.80574-1-its@irrelevant.dk>
 <20221208122642.80574-2-its@irrelevant.dk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221208122642.80574-2-its@irrelevant.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.266,
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

On 8/12/22 13:26, Klaus Jensen wrote:
> From: Klaus Jensen <k.jensen@samsung.com>
> 
> Replace various ->parent_obj use with the equivalent QOM accessors.
> 
> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
> ---
>   hw/nvme/ctrl.c | 89 +++++++++++++++++++++++++++-----------------------
>   1 file changed, 48 insertions(+), 41 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


