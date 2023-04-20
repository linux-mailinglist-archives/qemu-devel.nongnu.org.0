Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B01906E969F
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Apr 2023 16:06:23 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppUuW-00042M-2u; Thu, 20 Apr 2023 10:05:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppUuN-0003xe-Bm
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 10:05:11 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1ppUuC-0008GJ-2Y
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 10:05:10 -0400
Received: by mail-wm1-x32c.google.com with SMTP id bg5so424866wmb.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 07:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681999498; x=1684591498;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C2CjPRHkLUv2mO2rErEVE2Gbtn21rLXuFnuWGGa5JK8=;
 b=Kjli8loLfkaQ7y4nSTFKO5f98bPcO7EGZ/GXqgujx33wTwYFiJp0BUXY9Cxx/7uR7/
 HzHLa58/aeTuOBmlSrQ39nWGRM+QH1PWbEfSY1Sova9KQtxh/WvaoNt0+fQwBD+HFkxe
 FZud1umk7JyhYGbDTqbHot+/4rDMTt8kPfXOzEaEU+PmiMo2uz7N+NOAJqlFCyQ36wx1
 1I/E8IyHU/qgcjApMrlNa3TLjdT9luNMkhVrDvi8vE1Y0//l9AlZOaaJJTWYw7T0fyec
 zcV4Gxe4GJES7wribG8f1cNLFuvjx07EDM5mxo+uzg9hpKMOPzRaggEaaxTzKQoTET0H
 riKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681999498; x=1684591498;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C2CjPRHkLUv2mO2rErEVE2Gbtn21rLXuFnuWGGa5JK8=;
 b=YOaDOKR5EHMq3jeqSWuiVCLz+XKndUgsiutmjAhb+sG6z0Q+IlLhDhggDNeVPh7JZM
 79q3SWn+YxsT9dApu7z+xPFKVNp55jt2ntVOpPbpDNpEgl7GKZxPFZ/QtTSgxfPqLDjz
 Fip/0wg40mA88XaI0m4p9usZicC/Ai/7QyZ1OLU5sLPxBTBz2ZD1GrzPZOcw+jNHy2rV
 1WqtkQFTmk9RLbCW1ynBcbkgrtXYcqFOMF1O25L53GPKQ/WmL+eOsXXefMSmyButOECW
 xZV8N7ReRBMmgqLw8u2Bgkt/DCgUSEOt/fK4DpoItb8sLx8dmZ9LFIftqHGJgnIMj8vp
 qM1g==
X-Gm-Message-State: AAQBX9dAnTlh/kjK2muy5IN9TxsfJdMWvL6MwRUrBFsSiXvrLva8IFNo
 +jZaCmko4iKIeluy0KqEO+FxhQ==
X-Google-Smtp-Source: AKy350bhU+Lz4bBpy05fI8aXVni/UY0hGmPQkbtwVS56rCznOAN5H14t19DpdnnbaGlhUsLCrIogjg==
X-Received: by 2002:a05:600c:20c:b0:3f1:6ef6:c9d1 with SMTP id
 12-20020a05600c020c00b003f16ef6c9d1mr1355882wmi.39.1681999497834; 
 Thu, 20 Apr 2023 07:04:57 -0700 (PDT)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 m18-20020a7bcb92000000b003f182973377sm2094531wmi.32.2023.04.20.07.04.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 20 Apr 2023 07:04:57 -0700 (PDT)
Message-ID: <158d8b35-cd5e-0a47-cfa8-d1889d3a696b@linaro.org>
Date: Thu, 20 Apr 2023 16:04:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v2 RESEND 3/7] gdbstub: add support for the qRegisterInfo
 query
Content-Language: en-US
To: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>,
 qemu-devel@nongnu.org
Cc: alex.bennee@linaro.org, bcain@quicinc.com, f4bug@amsat.org,
 peter.maydell@linaro.org, tsimpson@quicinc.com,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
References: <cover.1681993775.git.quic_mathbern@quicinc.com>
 <6414ff4730fb53bd210cce947c201ca011135831.1681993775.git.quic_mathbern@quicinc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <6414ff4730fb53bd210cce947c201ca011135831.1681993775.git.quic_mathbern@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32c.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.669,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On 20/4/23 14:31, Matheus Tavares Bernardino wrote:
> From: Brian Cain <bcain@quicinc.com>
> 
> Signed-off-by: Brian Cain <bcain@quicinc.com>
> Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> ---
>   include/hw/core/cpu.h |  4 ++++
>   gdbstub/gdbstub.c     | 27 +++++++++++++++++++++++++++
>   2 files changed, 31 insertions(+)


> @@ -159,6 +161,8 @@ struct CPUClass {
>       vaddr (*gdb_adjust_breakpoint)(CPUState *cpu, vaddr addr);
>   
>       const char *gdb_core_xml_file;
> +    const char **gdb_qreg_info_lines;

Shouldn't this be 'const char *const *gdb_qreg_info_lines;'?

> +    int gdb_qreg_info_line_count;
>       gchar * (*gdb_arch_name)(CPUState *cpu);
>       const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlname);

