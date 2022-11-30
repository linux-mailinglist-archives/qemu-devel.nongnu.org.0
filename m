Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D0DE363D3B9
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 11:47:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0Kav-0001FI-Dx; Wed, 30 Nov 2022 05:45:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0Kar-0001Di-T5
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:45:33 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0Kaq-0005se-2a
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:45:33 -0500
Received: by mail-wr1-x429.google.com with SMTP id x17so26389182wrn.6
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 02:45:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yyvC5lieLTl51yh7KYMbBIef791ku+sG0JLTDdVAZjs=;
 b=K/Bf6yOX3g1PJagdqe+gvszB7lM+jUUfC7KmjHA6f0CVwPtHYc+vU1ucTtc+D49J24
 K0njPRe96QKtN7q4zIA8BRhUDZ4relN62/uN58DhTPFnYuG3gUR7zQ+IVa23Qc4DkMN4
 bZa+QhUcJIM71bcOirYIpMDDiNlPi2RLWqobZP4e71BSzCFPJ4zyqbIfphaDIZP1fREB
 kuhUyROZuN2iSxnc5NFJIRAMr9UZa93Yf8bYwHnl34n/7J9Yh9KAux1jE0A00/aYYdfd
 Z1+ShSPyDivZTBJqjfIJ3ZuuBtI9ECedi7yK1h3qLqB3zg3iPp3j/Nnp/y1kzWtAiWxD
 07og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=yyvC5lieLTl51yh7KYMbBIef791ku+sG0JLTDdVAZjs=;
 b=mZ2GPCbR6b5Udbjh6mNod5roTMFlRun0aLRrvRSvF5kylLWIlqzFW8HtsektMHE/Nz
 WDIAXnMYot5BVAyE3l4Q2eZX4GjKhCOlPbJ9XPjvytqRo04kgfoul9JUtoK49yO+ePqm
 kI3nRU3jxDaBOSoZz+hwKk7hwgPDhafmwzTEINQSQjnbL0CfYoPPRmJngQKGE1yPX5/U
 OJYSelNCMnR716zur815XyeEd5g3YJCnJFLC68LDGWTTuambbED8xRxJ7fQvbBHeUpTs
 zJNTY4X+GNSgp7L3Fq6NtL+qDwUqMCk6xc5y/0xy5AX0czFsP3FFPjePM13/57CQzO13
 dNgw==
X-Gm-Message-State: ANoB5pkzprFBD+ed6WVlDB0L6oA5ntNIMe8aSSeKX+1rdoB92mvBe7BA
 uNC2F0crq64PsFjXt3krBy7Xtg==
X-Google-Smtp-Source: AA0mqf6DUyl1QKr/XhcrVNSMtquH71yj0hj0nTKy+4LlsP4720xCqGuUCxfG2k9B2PBlUxvmCjJfug==
X-Received: by 2002:a5d:6807:0:b0:242:15e0:902b with SMTP id
 w7-20020a5d6807000000b0024215e0902bmr9652123wru.694.1669805130311; 
 Wed, 30 Nov 2022 02:45:30 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 h6-20020a05600016c600b0023655e51c33sm1230772wrf.4.2022.11.30.02.45.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 02:45:29 -0800 (PST)
Message-ID: <99de75db-cba1-9b6b-40db-750979914c3b@linaro.org>
Date: Wed, 30 Nov 2022 11:45:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH for-8.0 4/7] pci: Convert child classes of
 TYPE_PCIE_ROOT_PORT to 3-phase reset
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org
Cc: Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, Greg Kurz
 <groug@kaod.org>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 qemu-ppc@nongnu.org
References: <20221125115240.3005559-1-peter.maydell@linaro.org>
 <20221125115240.3005559-5-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221125115240.3005559-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
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

On 25/11/22 12:52, Peter Maydell wrote:
> Convert the TYPE_CXL_ROOT_PORT and TYPE_PNV_PHB_ROOT_PORT classes to
> 3-phase reset, so they don't need to use the deprecated
> device_class_set_parent_reset() function any more.
> 
> We have to do both in the same commit, because they keep the
> parent_reset field in their common parent class's class struct.
> 
> Note that pnv_phb_root_port_class_init() was pointlessly setting
> dc->reset twice, once by calling device_class_set_parent_reset()
> and once directly.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   include/hw/pci/pcie_port.h    |  2 +-
>   hw/pci-bridge/cxl_root_port.c | 14 +++++++++-----
>   hw/pci-host/pnv_phb.c         | 18 ++++++++++--------
>   3 files changed, 20 insertions(+), 14 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


