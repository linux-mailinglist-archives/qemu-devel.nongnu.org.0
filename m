Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C524505A44
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Apr 2022 16:47:26 +0200 (CEST)
Received: from localhost ([::1]:37104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ngSey-0006zK-Me
	for lists+qemu-devel@lfdr.de; Mon, 18 Apr 2022 10:47:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngSbv-0005Km-R9
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 10:44:15 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:36723)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ngSbu-0006mc-5k
 for qemu-devel@nongnu.org; Mon, 18 Apr 2022 10:44:15 -0400
Received: by mail-pg1-x534.google.com with SMTP id 203so214919pgb.3
 for <qemu-devel@nongnu.org>; Mon, 18 Apr 2022 07:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=afYAsylkrYeDatDZwgBRHX11NkBj1VepzlscpjVo5uc=;
 b=jw5fH/mja2phgIP+2risuleL6aInm8GQuFxetJrpK8tOG7fy6N0h204cmKX/SpUX5/
 3/yr77/2dcAd+62EF7yDAuVWF8VUFJmClxe30OB1krBY+2BqNglwpKvMmFxtIQznBkgh
 rJ8deY1uj3IUifZBF73FC0sxuKUjgl8MOlUHz+Q1I4zaYyPDOSI+Juf4eqZlD7dtj3Yi
 OInAkRKBD1VlItqkMb01l7m9r9ew4COdRDjKE9D7SgdQU39Wx75RAV+m/6Tzi68CGQah
 olvN4+7ojBxArwtfhdyuXhVeH9/ZCeWwu7U5v2S3V+SzmhzPtcbMkUU8AeLdwDOfWsDZ
 RCBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=afYAsylkrYeDatDZwgBRHX11NkBj1VepzlscpjVo5uc=;
 b=b2eZiUXNWTKzUhlvk3aCH45Wvk9XqX9r4XYGcE/MapWBV2frb18BP4jfbp0Lwmt65S
 T9mJ4nvU0bJQBIizGggmr5IA0TBNR7Gg1QuXrQgYWDXjmkZYfMW9AJJEw7FbpJz8lZeb
 KZrQPDnPN+rqsJ9ls4iHRgWc1Gip2pHYTKTSzPa7fx2KTu5W2NxGIrJKhuAY7zBwWG5v
 I6sV2XQM8fb5biPUpXkx8MaMa9CWxpYyu/+VtkMeNw6eWdmDySOf5HUw21U0WZ8r59gB
 qd1+Kfc5Wsq+0gjVlmHdKyryuwlckbJgw0z3ascczDMjnEpE24ZDdPbsj963hpSmLdMR
 xGCA==
X-Gm-Message-State: AOAM531Mul4TGcXU6HhwqVGms4Hk8fGez84mU0B/wwu2+DV/z3D3n6Eq
 x+JTmnROsNZe9fSB8chV0K0vUnedzgkvuQ==
X-Google-Smtp-Source: ABdhPJymSQc3wgXgqQ4xxm+zJLSKoDC8DSorUJkatN+sSL9pavtClOmv0NUpx4C84LUkWEZv0gMHEg==
X-Received: by 2002:a05:6a00:1505:b0:50a:8a96:2994 with SMTP id
 q5-20020a056a00150500b0050a8a962994mr1564215pfu.2.1650293052637; 
 Mon, 18 Apr 2022 07:44:12 -0700 (PDT)
Received: from [192.168.1.6] (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a63380e000000b0038253c4d5casm13096021pga.36.2022.04.18.07.44.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 18 Apr 2022 07:44:12 -0700 (PDT)
Message-ID: <d1107317-2b1c-1fbf-b018-0b5e3e6a446f@linaro.org>
Date: Mon, 18 Apr 2022 07:44:10 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v1 36/43] hw/loongarch: Add irq hierarchy for the system
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
 <20220415094058.3584233-37-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220415094058.3584233-37-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/15/22 02:40, Xiaojuan Yang wrote:
> This patch add the irq hierarchy for the virt board.
> 
> Signed-off-by: Xiaojuan Yang<yangxiaojuan@loongson.cn>
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   hw/loongarch/loongson3.c | 106 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 106 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


