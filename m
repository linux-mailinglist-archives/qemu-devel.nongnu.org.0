Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 65EA049F04A
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 02:02:07 +0100 (CET)
Received: from localhost ([::1]:57440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDFeQ-0006ak-FZ
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 20:02:06 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDFPo-00080m-IF
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 19:47:06 -0500
Received: from [2607:f8b0:4864:20::533] (port=35607
 helo=mail-pg1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nDFPh-0004CM-6S
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 19:46:55 -0500
Received: by mail-pg1-x533.google.com with SMTP id p125so3833992pga.2
 for <qemu-devel@nongnu.org>; Thu, 27 Jan 2022 16:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=FJk2qIvCnh66UWjkm/4eRF8SYpxnHiPsjDPhsCZjxbk=;
 b=vpAxpmbPExLoyHIoDEKlLGSLNUfE/VXCLmS1V4JVUYJwotupyGCLvLn813KFvCl2rE
 gCadEVezu0L4TV4DhuWwK4rLe3hllRj+UlV+KPIx6r2txMF+jtuAU/qCsLgeyya8Hq1I
 TCpGWR1wlxQBP3hToNAm51/7/KAvefFHSaJ3NwrmRwXrmO1F2ad3fCnjEw6WhhRfGa/j
 f35e2SJj4KOecCDpmZ8t0aihlzQkqj2V+BlprBRnlHNsW+Id8cO1X+0WsfjTkVgeiW/P
 tocCr3afwpQUPnCFUnHyODhF1htpcqptICFX0kJ13mycCC2sKMZRMNDQ59I3Twrg9bwR
 lOGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=FJk2qIvCnh66UWjkm/4eRF8SYpxnHiPsjDPhsCZjxbk=;
 b=M2wNoiJ5D0gbO82tAYJUVShchW375c13ShMnstLLqJJLfIOJmHuTjQmvoosFld5QIb
 TjMYdYJy7GH4sdwTg0EMMgvfZITkkedBIvfAmTkkoqzcGGcUlJqtIHzVHyiZTqkko5bh
 0C7w1d/ShfxlqhRhmgD+pFOeBSVIgVV/PmcGaToxJvXM/zpPEbDlSM2AVPlHihKDs5fQ
 Efglk9+fwHwxqkeHFowH88RnHqAi/ivsORVoUcTCWpnMMB2heEjNOVONOHTeg6ip9UHF
 tj/4zBhGkdQW97dJl0oegj+lpJNaKdg5K3EufwzMMjOmff2ESVk4WEmbYdynjtDTGYmP
 8Oxg==
X-Gm-Message-State: AOAM532OmNxG43cOV80Lb3m2aIsSh2NcI0e/1wS6zUj1RfQsT1DTR6aA
 CQAUhoo2rSuYvmobsz+mILinPQ==
X-Google-Smtp-Source: ABdhPJykTs9lxvGDakCwmwGc0VcNj+pkDIk4d5plNcz72bfAJ7t191B+E7NVQhLauDremStCFDBaOw==
X-Received: by 2002:a63:474a:: with SMTP id w10mr4659804pgk.251.1643330811931; 
 Thu, 27 Jan 2022 16:46:51 -0800 (PST)
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
 by smtp.gmail.com with ESMTPSA id s37sm1583762pfg.144.2022.01.27.16.46.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 27 Jan 2022 16:46:51 -0800 (PST)
Message-ID: <8c26026f-26b4-08c0-0e77-ca9970dca279@linaro.org>
Date: Fri, 28 Jan 2022 11:46:44 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 02/10] hw/nvram: Restrict fw_cfg QOM interface to
 sysemu and tools
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20220111184309.28637-1-f4bug@amsat.org>
 <20220111184309.28637-3-f4bug@amsat.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220111184309.28637-3-f4bug@amsat.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::533
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-block@nongnu.org, David Hildenbrand <david@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/12/22 05:43, Philippe Mathieu-Daudé wrote:
> From: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> fw_cfg QOM interface is required by system emulation and
> qemu-storage-daemon. User-mode emulation doesn't need it.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>   hw/nvram/meson.build | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/nvram/meson.build b/hw/nvram/meson.build
> index 202a5466e63..f5ee9f6b88c 100644
> --- a/hw/nvram/meson.build
> +++ b/hw/nvram/meson.build
> @@ -1,5 +1,7 @@
> -# QOM interfaces must be available anytime QOM is used.
> -qom_ss.add(files('fw_cfg-interface.c'))
> +if have_system or have_tools
> +  # QOM interfaces must be available anytime QOM is used.
> +  qom_ss.add(files('fw_cfg-interface.c'))
> +endif

Is this intended to save the compilation of one file, if and only if this is a completely 
user-only build?  Because if this is a normal "all targets" build, this will still be 
included in the user-only binaries, afaics (libqom -> qom -> common_ss).


r~

