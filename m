Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6352B579523
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Jul 2022 10:19:48 +0200 (CEST)
Received: from localhost ([::1]:38240 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDiSJ-0008SD-IJ
	for lists+qemu-devel@lfdr.de; Tue, 19 Jul 2022 04:19:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDiJh-0005Ly-8u
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 04:10:53 -0400
Received: from mail-qt1-x82d.google.com ([2607:f8b0:4864:20::82d]:45649)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oDiJe-0004i1-Do
 for qemu-devel@nongnu.org; Tue, 19 Jul 2022 04:10:52 -0400
Received: by mail-qt1-x82d.google.com with SMTP id b21so7358999qte.12
 for <qemu-devel@nongnu.org>; Tue, 19 Jul 2022 01:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=HXb9URKfwyAkOJBkLWLEGhxAtwPztS58k5o+N+9wn10=;
 b=qtKQ4zcorTvuNq5BPPxEyw5HgWoatfY/3JJWmZ2ITY4ExwG5qsJxhkF8lRgyKOhK3M
 lkyUlqA87wVLi8IzfIb77Xw7vBRxYahERgSBJBqAHwhRcI7SAvrVFeAiRYsqr1Z3nH5q
 jsKipzowE+DQFg58auatkUHfryoQWOLjKsi7lHJqv4a4HXCXyxI78bCZBSshp2229/a6
 zIKDYdXxDwqOScM9pinvjU4ncIeehBATYnWwIj45HzbcDrAYC9SwFZlHWI8fYA9bMMnn
 /XQNQJ4LF999XmyNjolz2CwA2HYEgDB8YcIDsupTKJQFo4KIEE8aXXsjPJRGp8Gy9sYo
 iNkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=HXb9URKfwyAkOJBkLWLEGhxAtwPztS58k5o+N+9wn10=;
 b=K229gIOIAYuwkpNqdpkudE9yeJ8zc0Y0jouhhXECWHT6MeToMk10aDUkkGSX7lt6LN
 eYIFyod8FDxpWfCIposPf4MldeMStp3ZbHN9kYjQ+ZlaZ/RTkHBozj5gMHrO7RqnxY2Y
 iFlRnu7CO0Ku7n585kg+jNI6WngDETEozCMyV628AYVGOang0S+P5jXyRMgTjVlgIWBN
 GkiNzFr9QVWqDvrFhaptX+AwrPn+oFdvTj0FxXevsYvnkUM9HZC3E7uzmfNofwpbJ/i9
 1NdjRLNJhH4RtcgENXIvGUA6ubb64KpuLdBgAPbe5zGbu4iNLItwwo2Sbx6Q8hHK4wax
 twxA==
X-Gm-Message-State: AJIora9Q9sfiDvE+ktBC3M585Xt2XPKKs3S320kzZ9bJrfVssUYdEWyz
 zLsnD1gjcFySb6Cbw9HPWRHBJw==
X-Google-Smtp-Source: AGRyM1tRGm8upHwKU0wKCvjZ9qsqHFN0/88o5jsFkgNNTAOlbss1f8vJPFJvJ6b6jl8lKqZVmLWXiA==
X-Received: by 2002:ac8:5787:0:b0:31e:df6b:653 with SMTP id
 v7-20020ac85787000000b0031edf6b0653mr13162577qta.249.1658218248212; 
 Tue, 19 Jul 2022 01:10:48 -0700 (PDT)
Received: from [192.168.113.227] ([172.58.139.163])
 by smtp.gmail.com with ESMTPSA id
 c26-20020a05620a269a00b006b5ba7b9a6fsm12939353qkp.35.2022.07.19.01.10.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Jul 2022 01:10:47 -0700 (PDT)
Message-ID: <2af20d3e-6f6d-7da9-5b03-76308c2180a3@linaro.org>
Date: Tue, 19 Jul 2022 13:40:31 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v1 0/6] Support booting bios and kernel for LoongArch
Content-Language: en-US
To: Xiaojuan Yang <yangxiaojuan@loongson.cn>, qemu-devel@nongnu.org
Cc: gaosong@loongson.cn, maobibo@loongson.cn, mark.cave-ayland@ilande.co.uk,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca, f4bug@amsat.org,
 peter.maydell@linaro.org
References: <20220712083206.4187715-1-yangxiaojuan@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220712083206.4187715-1-yangxiaojuan@loongson.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/12/22 14:02, Xiaojuan Yang wrote:
> This series add some new funcitons for LoongArch virt machine.
> Support loading uefi bios and linux kernel to boot system, and
> add fw_cfg table, smbios table, acpi table, fdt table to transmit
> information for the system.
> 
> We could get the uefi bios and linux kernel file by this address:
> The kernel file:
>     * https://github.com/loongson/linux/tree/loongarch-next
> The bios file:
>     * https://github.com/loongson/edk2
>     * https://github.com/loongson/edk2-platforms
> 
> Xiaojuan Yang (6):
>    hw/loongarch: Add fw_cfg table support
>    hw/loongarch: Add uefi bios loading support
>    hw/loongarch: Add linux kernel booting support
>    hw/loongarch: Add smbios support
>    hw/loongarch: Add acpi ged support
>    hw/loongarch: Add fdt support

Queued.

If there are bugs in the smbios or acpi patches, they can be fixed before hard freeze, but 
we do want the feature committed before soft freeze.


r~

