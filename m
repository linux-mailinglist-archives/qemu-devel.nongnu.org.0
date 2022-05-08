Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78E2951EB39
	for <lists+qemu-devel@lfdr.de>; Sun,  8 May 2022 05:16:04 +0200 (CEST)
Received: from localhost ([::1]:44710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nnXOt-0004XO-4p
	for lists+qemu-devel@lfdr.de; Sat, 07 May 2022 23:16:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38410)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnXNQ-0002vC-28
 for qemu-devel@nongnu.org; Sat, 07 May 2022 23:14:32 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032]:33867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nnXNO-0007se-EE
 for qemu-devel@nongnu.org; Sat, 07 May 2022 23:14:31 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 qe3-20020a17090b4f8300b001dc24e4da73so10021392pjb.1
 for <qemu-devel@nongnu.org>; Sat, 07 May 2022 20:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :references:from:in-reply-to:content-transfer-encoding;
 bh=uWt7K++61JrvMCl6lBDctsh1b0Q/B1EyW92eeqSPim0=;
 b=kd0t3nO3G+hG6+3fCbezRZyhl9iuOpbJ6yniEdnPQyIsylS/2d+2czXeIhRYOhU0za
 LxnCXT4wV1Ex0mQuJs8fvE8e0WllE+bsOKUAxBCPWpjmDjVSlAkvNfDJwal9/jj23sGq
 Lpu4KdqJ/EQN+ODxc0rzzx6obwb/MbRD+4yiCKAV6RhXWpk8Z8hjXPnPMVF2F7S+Mc6s
 Z8xuaP09NgV4YYlfci6L7WrnEet5jrDjrElGKImIoV/cyopkiZFggNX/rZoK2XD4ftPA
 ItKpPAMSaxJEp33D5oHOckamlYYmukfTW9DrA8Kwr4xmvQzqc/fimPVt7oo8AdVBuGU5
 dotg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:references:from:in-reply-to
 :content-transfer-encoding;
 bh=uWt7K++61JrvMCl6lBDctsh1b0Q/B1EyW92eeqSPim0=;
 b=vstDvoe+IfbywjKBknAsbJXQJbmzSekwc6VTiccnossLwM50kr4Hr9y5NknGyRAH8F
 FUWY4BjsjfqZ+goim3iA7HGizXNLcBzhVANZB9zIQnuCcLF8ryRFmm90rvhaA1DXMrzn
 4L6FtGCn93gVm9fLk4IU188ZiaecQHMyL4aF9yMXXPJTgx37VVG6K/6XnNXU8mtQLU6s
 LGo/avkC91woDJtIGFFvWNay+YBCeUEnO1IV05C80bGeg817REOf/jYvYZzzlCjvmckS
 7mxfAVngUiybJQb4VOh5xr9HzuRsgbVX4LM2AIkcf3C8HgMbSqu9/+otoFWSTKulybY/
 FkXw==
X-Gm-Message-State: AOAM533O9oxIdAciX11ecZaRZcPvJLgSf5P3mz5tg5JVXY5pg7gpXDVf
 NZhIiv9RqARG9JlyAoQgv20uaQ==
X-Google-Smtp-Source: ABdhPJx1jfjOi4lxPk3VR0UJmYHMLsz+8saH5013YXEwWjrdMgz4jfIyY0fTxNL2mzNYUFTPZ3z4Ww==
X-Received: by 2002:a17:903:244b:b0:15e:8844:1578 with SMTP id
 l11-20020a170903244b00b0015e88441578mr10552043pls.13.1651979669126; 
 Sat, 07 May 2022 20:14:29 -0700 (PDT)
Received: from [192.168.4.112] (50-233-235-3-static.hfc.comcastbusiness.net.
 [50.233.235.3]) by smtp.gmail.com with ESMTPSA id
 z11-20020a170902d54b00b0015e8d4eb29csm4222492plf.230.2022.05.07.20.14.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 07 May 2022 20:14:28 -0700 (PDT)
Message-ID: <2c22ca4a-2228-6657-7a02-84b2377daf81@linaro.org>
Date: Sat, 7 May 2022 22:14:26 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v2 44/50] hppa: remove hw/hppa/pci.c
Content-Language: en-US
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, deller@gmx.de,
 qemu-devel@nongnu.org
References: <20220504092600.10048-1-mark.cave-ayland@ilande.co.uk>
 <20220504092600.10048-45-mark.cave-ayland@ilande.co.uk>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220504092600.10048-45-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1032.google.com
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

On 5/4/22 04:25, Mark Cave-Ayland wrote:
> The functions and definitions in this file are not used anywhere within the
> generic hppa machine.
> 
> Signed-off-by: Mark Cave-Ayland<mark.cave-ayland@ilande.co.uk>
> Acked-by: Helge Deller<deller@gmx.de>
> ---
>   hw/hppa/hppa_sys.h   |  6 ----
>   hw/hppa/meson.build  |  2 +-
>   hw/hppa/pci.c        | 65 --------------------------------------------
>   hw/hppa/trace-events |  3 --
>   4 files changed, 1 insertion(+), 75 deletions(-)
>   delete mode 100644 hw/hppa/pci.c

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

