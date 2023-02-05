Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F143D68AF66
	for <lists+qemu-devel@lfdr.de>; Sun,  5 Feb 2023 11:54:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pOcez-0007P8-G0; Sun, 05 Feb 2023 05:54:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOcev-0007Oi-9s
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 05:54:09 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pOcet-0004Qe-Lx
 for qemu-devel@nongnu.org; Sun, 05 Feb 2023 05:54:09 -0500
Received: by mail-ed1-x52d.google.com with SMTP id z11so9046510ede.1
 for <qemu-devel@nongnu.org>; Sun, 05 Feb 2023 02:54:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=OiblRRCuW+e36b9l0v/WWNUXMxcMpw7xicL8Z0PdfMo=;
 b=w8sgygAZGE3vgHSW5/DhjHZm0RRC51Y4iBF7jJYMrTeW8mXfdpq1N+dQUGRAHDRvE1
 YneMtM+nMlKi61u5YfqSu6vjNNgSkAUCr7OhLBOh1xm0Tb7NPs8Jkd0KL8G2YRkTBIyG
 MhzTgS2DbnXeTTa7WgMfth2LuG7t1tiZh1XWm0hw2sFB+NKVjC6wQawhtbgIqwW2Ff5q
 v4P03/Ps/PLBZZQyL06ndOEZMxe2xuzkMr0YXM40pABOdKevdg7Rx+KFGJriZFcBwQ4T
 8TaS5O2+Ja0D1ZJsDeIto3fRkgQP+5Mc/J96n5xC/h3Ypxb29mgnQXDTJp7PeP12ncG6
 1ViA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OiblRRCuW+e36b9l0v/WWNUXMxcMpw7xicL8Z0PdfMo=;
 b=ter4H5nV/kv/IdhaE2owqxt9j21qGZ1UvSmdNwXszzcqAIn40Go+kw0rxKvbLIrnMx
 F3G5Sm8dUQ9112CRxTOF9jt3auh8U6lE5MDx5zd6X2KtAQDvNkf63ijveR2wY8OieJWJ
 kLU25XeSib6LCYFiw50k/tRiT1WRe0516m7n7bapeSuho1GCkuLanBjW8fvv/ewmqhzU
 xl4vUNb/GHrd7APGPW/4N7gikRpmybYT6HhjmXnuq0IfXSITvVNWKUlqx72PkBnZwWn5
 DOrR9tGZ2f6GffPWAztQajXkN/jZ1/x9HP3DkaHfd+PkIxgxJMo18QYwxFemndE11KS1
 ebAg==
X-Gm-Message-State: AO0yUKWYGCTRKAjvJ3LtVgQQj65y3fKIpXkbTOAb1o4TpBcp2j24djH9
 JSTjgUyr7HC9jjehYX4Ic0JPEQ==
X-Google-Smtp-Source: AK7set9tbC0QAzpWiFFDrxCu1K3Uw+cHrzlK2NPMBZshf3DeKIr87rOISDQHRiOVI+iordHYZYruLg==
X-Received: by 2002:a50:8718:0:b0:4aa:a390:bf4a with SMTP id
 i24-20020a508718000000b004aaa390bf4amr3539997edb.20.1675594446114; 
 Sun, 05 Feb 2023 02:54:06 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g20-20020aa7c854000000b004a24b8b58cbsm3594517edt.16.2023.02.05.02.54.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 05 Feb 2023 02:54:05 -0800 (PST)
Message-ID: <e26454d0-148b-01ef-91de-33fbe143809b@linaro.org>
Date: Sun, 5 Feb 2023 11:54:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH 1/4] pcie: pcie_cap_slot_write_config(): use correct macro
Content-Language: en-US
To: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>,
 qemu-devel@nongnu.org
Cc: mst@redhat.com, marcel.apfelbaum@gmail.com
References: <20230204174758.234951-1-vsementsov@yandex-team.ru>
 <20230204174758.234951-2-vsementsov@yandex-team.ru>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230204174758.234951-2-vsementsov@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52d.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 4/2/23 18:47, Vladimir Sementsov-Ogievskiy wrote:
> PCI_EXP_SLTCTL_PIC_OFF is a value, and PCI_EXP_SLTCTL_PIC is a mask.
> Happily PCI_EXP_SLTCTL_PIC_OFF is a maximum value for this mask and is
> equal to the mask itself. Still the code looks like a bug. Let's make
> it more reader-friendly.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
> ---
>   hw/pci/pcie.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


