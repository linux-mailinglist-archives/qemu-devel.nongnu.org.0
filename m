Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E8E65CFCE
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 10:38:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD0E6-00029h-BX; Wed, 04 Jan 2023 04:38:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD0E5-00029Z-7Y
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 04:38:25 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD0E3-0004wm-Hd
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 04:38:24 -0500
Received: by mail-wm1-x32a.google.com with SMTP id o15so25110970wmr.4
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 01:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/Ar07lRRvTrf6lAM6NBHSIbVXsEVj/Za1Wqr+OL9e2I=;
 b=OqO7xx8oSgg7iqoQ98pIW/9AKMVWZ1eU/R43A/Eka4cXjGLGx7KTCUEgiLF+am1hUK
 7X9WGOLEEHjc2Dm5sQ68wxPIgs5L1ivmxGKhGlu/3OIq87NrliiBgLvfkr1VAkl5N6oS
 s/6bb1f/WlTG2yH44NAq2bcAxDLr+3x+L7eZ/5eZoP+9/m9L4Ysu2LfrrJprve3qmn0r
 4J8cRODafo90qroFnbb1/4e5OMHafDNMeSBpDZ3qnC5CL/WiP7urFzVlpkiw21MN8F7i
 NhDzzsqEC2fSs6C6SDeeVoAYYPcASZtIei2zZsR5d+O2rkhFoY4D99Xl6RBPb23nEjy2
 76XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/Ar07lRRvTrf6lAM6NBHSIbVXsEVj/Za1Wqr+OL9e2I=;
 b=APcR8E/VDSk/+dZDrK7lz4Erm/t3IffGSseLTvzphF2T9oiedLPyaQG4Z9//cLssFv
 fzYw1G7bHaHidyUkwJ51BWb0PbkWekCEzHwNwJyBHSBibm/Y678p4pmY2jkEJlwua4xd
 qZcRXfZ25JhA3YxTe75k41+eSDHbx24Xq2EgKQW36qn2fodS4fPEqHcLsO03Kml5qIrv
 YHn3Tx2G6LoeS/DuJBOsAUzAWl4FQMFcazzHTGu5UgbXPay9XQTHR5n02Weor25+9MOp
 bPA1i9EsmK3riDa8CMga6eHs2SkvKr/d8JP9CObd8iipwgjCIJyHuDpI2PwbaIUTuRHh
 iJ8w==
X-Gm-Message-State: AFqh2krJTBwr8BN7tjTvnway4JRefQTXYWHY5J6vstyDzt8o17VTFDar
 2Z9Nz+QOjg6fxbzddKgAFsdngA==
X-Google-Smtp-Source: AMrXdXtBRtvDcdYnuGBXgBCPpVavRZT+t/IBjpaTjLl6JMNpz9qgfHP0L4bMi2vE/vPc2MdYt+G9Ag==
X-Received: by 2002:a05:600c:16c7:b0:3d3:51a9:dba1 with SMTP id
 l7-20020a05600c16c700b003d351a9dba1mr33531587wmn.20.1672825101547; 
 Wed, 04 Jan 2023 01:38:21 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 n14-20020a5d484e000000b00242814c2cf0sm33642744wrs.4.2023.01.04.01.38.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 01:38:21 -0800 (PST)
Message-ID: <de4bfd3f-ed66-15e3-5be7-410baf4875ab@linaro.org>
Date: Wed, 4 Jan 2023 10:38:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PULL v2 03/45] hw/ssi/ibex_spi: implement `FIELD32_1CLEAR` macro
Content-Language: en-US
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org
Cc: alistair23@gmail.com, Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 Alistair Francis <alistair.francis@wdc.com>
References: <20221221224022.425831-1-alistair.francis@opensource.wdc.com>
 <20221221224022.425831-4-alistair.francis@opensource.wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221221224022.425831-4-alistair.francis@opensource.wdc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.103,
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

Hi Alistair,

On 21/12/22 23:39, Alistair Francis wrote:
> From: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> 
> use the `FIELD32_1CLEAR` macro to implement register
> `rw1c` functionality to `ibex_spi`.
> 
> This change was tested by running the `SPI_HOST` from TockOS.
> 
> Signed-off-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Message-Id: <20221017054950.317584-3-wilfred.mallawa@opensource.wdc.com>
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>   hw/ssi/ibex_spi_host.c | 21 +++++++++------------
>   1 file changed, 9 insertions(+), 12 deletions(-)

If a v3 is required, please s/implement/Use/ in subject.

