Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E4794C7793
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Feb 2022 19:24:05 +0100 (CET)
Received: from localhost ([::1]:51508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nOkgm-0004ur-Lf
	for lists+qemu-devel@lfdr.de; Mon, 28 Feb 2022 13:24:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48472)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOkWi-00047C-Fg; Mon, 28 Feb 2022 13:13:40 -0500
Received: from [2607:f8b0:4864:20::534] (port=33736
 helo=mail-pg1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nOkWh-0006lY-0W; Mon, 28 Feb 2022 13:13:40 -0500
Received: by mail-pg1-x534.google.com with SMTP id 12so12276457pgd.0;
 Mon, 28 Feb 2022 10:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=rw5147ORwxXGRACCFyL08N7frWJP++/ZzM2vVxllktU=;
 b=RzNnwPAVFE7Ets/2EVBMBjr1rtiB+XaV01IjKrHEAhz/hL1zhfONncZ3IDMMCIMco8
 OfWKWhZImJawrirq4P9duVIqzM/HG+CXNouy40fX1oYKvdFmubcgWa7dBOMowxu6i219
 wrc7VUnQMCOZ/j9MNd1x8UV47mG1dqSFZUqWdleYE4qZgMncudnxNS0s8Yo5eY3hqRh4
 Rcg6EN7YbNz6YWL6Q+QFNoouJUQntfFX4T+fDLpsAQT+hjr488py0tZ0kXE53Da973CO
 LPDhHTpod5dypWHEGZq1IcxE0njLl72Y2mopH8COQ6IDjZmfJxipYVoe7Z0A4Hsb5zft
 6yRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=rw5147ORwxXGRACCFyL08N7frWJP++/ZzM2vVxllktU=;
 b=ptMh0Yl1zXldCneN135ZkkY6x/1zpIU7jFrFsFOcXhdgK7ptcaRvT6RFF6V59ZmMDx
 KvEhOqa4/zOsQLVvBj25n0jVzk1aLjzkrvpi5nj9nx8GoPMV8+6cv9jnFWeE0/Peufds
 TSns0TbMK4oij3ZskOkH3q7C2An4hbvf9keOcB5N5SjQq6sbobQpQobk9vr6EJagUILF
 9O6c4u4ZtDtRLRDHUyIfGrPbeRiJy4MQVfT60zluxr5Bv1g93+I58CJFAdjzX5/J2H9c
 y+ixRcvbqL8xYno25S8NpZc+5xn7Z5J7ex8CKoOD+F51XX4eU3+VlGVgD4rkLCt3Zr2H
 qgFw==
X-Gm-Message-State: AOAM530yny5U9W8U8Ww1KYTnFWtrfkvxTmhCn1uxp1iDVDhgHiU8Bplg
 FFYvh6MZ6k3/thG0jqOBsVnYcrTeMDI=
X-Google-Smtp-Source: ABdhPJyIgUWxKZCJvFiI0wR7gtN3jkO25tEiUoqM6mmblSu70aBGKDasqGzVkNhQCIfhEDSPit0p4w==
X-Received: by 2002:a63:2a43:0:b0:376:4b9:f7e0 with SMTP id
 q64-20020a632a43000000b0037604b9f7e0mr16022239pgq.437.1646072017239; 
 Mon, 28 Feb 2022 10:13:37 -0800 (PST)
Received: from [192.168.74.175] (133.red-95-127-186.staticip.rima-tde.net.
 [95.127.186.133]) by smtp.gmail.com with ESMTPSA id
 m6-20020a62f206000000b004e152bc0527sm14102142pfh.153.2022.02.28.10.13.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 28 Feb 2022 10:13:36 -0800 (PST)
Message-ID: <6493275b-4d4a-e825-d8df-4b758e9b33ec@gmail.com>
Date: Mon, 28 Feb 2022 19:13:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH 00/14] simple cleanups in spapr files
Content-Language: en-US
To: Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-devel@nongnu.org
References: <20220228175004.8862-1-danielhb413@gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220228175004.8862-1-danielhb413@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::534
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 28/2/22 18:49, Daniel Henrique Barboza wrote:
> Hi,
> 
> These are some cleanups in spapr files I decided to make after seeing
> Greg adding g_auto* in virtio-9p files.
> 
> I also took the opportunity to simplify the logic in some places where I
> found it to be more complex than needed.
> 
> Aside from patch 02, no functional change was made in this series.
> 
> Daniel Henrique Barboza (14):
>    hw/ppc/spapr.c: use g_autofree in spapr_dt_chosen()
>    hw/ppc/spapr.c: fail early if no firmware found in machine_init()
>    hw/ppc/spapr_caps.c: use g_autofree in spapr_cap_set_string()
>    hw/ppc/spapr_caps.c: use g_autofree in spapr_cap_get_string()
>    hw/ppc/spapr_caps.c: use g_autofree in spapr_caps_add_properties()
>    hw/ppc/spapr_drc.c: use g_auto in spapr_dt_drc()
>    hw/ppc/spapr_drc.c: use g_autofree in drc_realize()
>    hw/ppc/spapr_drc.c: use g_autofree in drc_unrealize()
>    hw/ppc/spapr_drc.c: use g_autofree in spapr_dr_connector_new()
>    hw/ppc/spapr_drc.c: use g_autofree in spapr_drc_by_index()
>    hw/ppc/spapr_numa.c: simplify spapr_numa_write_assoc_lookup_arrays()
>    spapr_pci_nvlink2.c: use g_autofree in
>      spapr_phb_nvgpu_ram_populate_dt()
>    hw/ppc/spapr_rtas.c: use g_autofree in rtas_ibm_get_system_parameter()
>    hw/ppc/spapr_vio.c: use g_autofree in spapr_dt_vdevice()

Series:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


