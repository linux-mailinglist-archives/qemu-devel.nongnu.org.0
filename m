Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 724C06AB9B7
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 10:24:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZ74K-0008P6-7v; Mon, 06 Mar 2023 04:23:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZ74G-0008OF-PJ
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 04:23:40 -0500
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pZ74F-00078s-AG
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 04:23:40 -0500
Received: by mail-wm1-x334.google.com with SMTP id
 j19-20020a05600c191300b003eb3e1eb0caso7684822wmq.1
 for <qemu-devel@nongnu.org>; Mon, 06 Mar 2023 01:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678094618;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=aM8yQzb6WKbL4bzQLxP0iSUvbhpnXZWifDlyLE6JbHY=;
 b=ZxBUzWA1U7RyUWDqxC8pGR7cVnnCrSZXVCvfwxorachb08lbZyZrYAjYalqafHALrT
 B3eNncZcnTZMDiL9RjkbXDMZOhxLRLuVt7x4iiw4UZ85K4wYAtion+vHicS1CdEu+Yag
 MYJtH98F6kQEsgRu8DtzdPCd6twm4WdaUsXoFw+2EOOt6lmj+2qvRYC6XjpBIDKwlK59
 lSnRayLtoFSZZHIHKQ2Vs0u8a06YQ1YFp+LDxIrjWDdkCZEf4jbvfePO4KKAMuuLaLs5
 a0X7dDGDc99KcilueL9vQmMnOEnUNI+HsybZrZQY4m/f0KcKhNiaDMbWeiJXutOEDU8S
 9hsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678094618;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=aM8yQzb6WKbL4bzQLxP0iSUvbhpnXZWifDlyLE6JbHY=;
 b=PWalwbG1vYHU2z6FkmHU92JWsnjO4YGY0BjNdgT3TVKItpqTY3IfbNJ4zHWTxp7qnZ
 QaNuHWApBv0/TS8W2BFk3M3wuNipPbCkZuxhXkmQDVPoe2AOH788JAoIEYS5AWwKd4sY
 C9DBrg0HZJsiSiaSWpSK8+2ac8/db/tvaLtQEqItzQfwc+7rvc7wCI807P2Co57S0cpD
 ByFolUD6TGdrtNZ4NKOZkXD/ja9XRWyurZmMw5kvy3mSoli7Nl0DDpH7IEpsfgtKY2zr
 Mu8ZBu/lChJhECoHtOYR8Awt+Jnsok+lBefVCIX3zjo63U4lwCXsmjIlR0W6atmRaUcZ
 XYXQ==
X-Gm-Message-State: AO0yUKW/j95ytDP7RkBBslJ3nfpNAsSR0P/Czpyv9YKob0Trekrhf3r5
 eumxYdKgmpbxOiqiINkrlh0AXg==
X-Google-Smtp-Source: AK7set/YyrDokolJUA9eTExju2L4Xl1IwIifBnQdVPnxauD6XSY0IMli53ULjRHCUm4ngW3ahZKDIQ==
X-Received: by 2002:a05:600c:3c85:b0:3ea:f05b:50cc with SMTP id
 bg5-20020a05600c3c8500b003eaf05b50ccmr9296892wmb.8.1678094617810; 
 Mon, 06 Mar 2023 01:23:37 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 ip21-20020a05600ca69500b003eb596cbc54sm9757477wmb.0.2023.03.06.01.23.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 01:23:37 -0800 (PST)
Message-ID: <bd6266de-59c0-65c0-6e4a-04312f590dd1@linaro.org>
Date: Mon, 6 Mar 2023 10:23:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH v4 4/5] docs/about/deprecated: Deprecate 32-bit arm hosts
 for system emulation
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Daniel Berrange <berrange@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20230306084658.29709-1-thuth@redhat.com>
 <20230306084658.29709-5-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230306084658.29709-5-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x334.google.com
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

On 6/3/23 09:46, Thomas Huth wrote:
> For running QEMU in system emulation mode, the user needs a rather
> strong host system, i.e. not only an embedded low-frequency controller.
> All recent beefy arm host machines should support 64-bit now, it's
> unlikely that anybody is still seriously using QEMU on a 32-bit arm
> CPU, so we deprecate the 32-bit arm hosts here to finally save use
> some time and precious CI minutes.
> 
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   docs/about/deprecated.rst | 9 +++++++++
>   1 file changed, 9 insertions(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


