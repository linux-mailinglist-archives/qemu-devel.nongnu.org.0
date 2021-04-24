Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCCBD36A270
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 19:51:25 +0200 (CEST)
Received: from localhost ([::1]:41830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1laMRA-0000EM-SL
	for lists+qemu-devel@lfdr.de; Sat, 24 Apr 2021 13:51:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38716)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMMf-0005X7-Tr
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 13:46:45 -0400
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:44009)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1laMMc-0007SD-5G
 for qemu-devel@nongnu.org; Sat, 24 Apr 2021 13:46:45 -0400
Received: by mail-pl1-x634.google.com with SMTP id u15so18223564plf.10
 for <qemu-devel@nongnu.org>; Sat, 24 Apr 2021 10:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WwewsH6EAYvPLxY89gNVseYSHsWkq/ciX1yWuvm9Zvk=;
 b=ccC6OYryzPwgts3G1BqdHTP8XrfvB6n+cYPQOmD1qEwaRjNrW3mUK+aoMfadx4+9n+
 7L2PDciPKk2+c9KhTyad2O9HVyji3fRycwrLog73SI/H5eqD3RhvaUFDJezMg8bgoO9F
 MO+tu5z1TPJD3pLZ0QnN92frgWqwSnzzRkQP/ycNEXbfRelPr8hSUcQa9ybKsgBjY/Qe
 1pU14+eLXikmIdUnfTi/WjHAQKQGA3/Irz/4uv06F5i3/EDKMNOOCLXihb7M19ro88fJ
 52zyYdaBarK5TrYv/PfjnhZTRGhPVWdAEwiIvyeV8+Jj0qrDthBAg0ZvniVA+HM1MKHH
 sUqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WwewsH6EAYvPLxY89gNVseYSHsWkq/ciX1yWuvm9Zvk=;
 b=Ebp+oDknGNpw4QCDXy/nJNMDak/GoxBz23GN1BD+O3dAyfd9Je+dztMwhfsd5bgIam
 REltZNhU+zS3n7YLVxc/WxybZfhHdXl5Sklzp64yZBwcgodYX2spUhRJbi/Vu0ln70u4
 rYS9OHgmHIconuF8z2siugLfgGW9WKEuzkvLkko+CVht+euPjZhd9mzRchRue8pdav7+
 c7A02gNeygZk8smcI70Svwx+JZma3psrT8/Y6MsgDIzyVI0tlRQqBf/oV9vRGYj/YJ/B
 NpBcGge3cYjnMk9U/fKmsHVfb+lit28xUI8W5CbvvQCKDcrlzWvcb50uN9KaCbgQMtzb
 sg9A==
X-Gm-Message-State: AOAM530WH6xc24dn1Aj95CvN1Jnw61cxQP8qjSNPPsR6JQCb5sx/EG4W
 dgIC7xrR6znLdjrvGjElzg3dPA==
X-Google-Smtp-Source: ABdhPJw5l2n3Zs5VY29ljC+laskOw9/452DQb1R2GEwiCef43JoVWNjNa1Egcz8herng/uqkR6WtFg==
X-Received: by 2002:a17:902:7c0f:b029:ec:f5e2:4442 with SMTP id
 x15-20020a1709027c0fb02900ecf5e24442mr3149220pll.81.1619286400742; 
 Sat, 24 Apr 2021 10:46:40 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id 63sm7307372pfx.202.2021.04.24.10.46.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Apr 2021 10:46:40 -0700 (PDT)
Subject: Re: [PATCH v2 27/48] bsd-user: style tweak: space pedantry
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210424160016.15200-1-imp@bsdimp.com>
 <20210424160016.15200-28-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <323eda22-89f8-501b-5820-4cd49253e4d9@linaro.org>
Date: Sat, 24 Apr 2021 10:46:39 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210424160016.15200-28-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/24/21 8:59 AM, imp@bsdimp.com wrote:
> -    start_data = 0;
> +    start_data =n 0;

Typo.  Is this inside an ifdef or such?

Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

