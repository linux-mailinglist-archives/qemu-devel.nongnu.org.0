Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B436537B61
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 15:24:42 +0200 (CEST)
Received: from localhost ([::1]:48534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvfNx-00067a-Ah
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 09:24:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvfGt-0000J7-Bt; Mon, 30 May 2022 09:17:23 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535]:44961)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvfGp-0001k1-1i; Mon, 30 May 2022 09:17:20 -0400
Received: by mail-pg1-x535.google.com with SMTP id v15so10125519pgk.11;
 Mon, 30 May 2022 06:17:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nhXEHZPfLqymltQZF4KpmxUD2H0WPVW45Y0FhAxPSdA=;
 b=JQfoH6f3zBwNnJBSDaRpObaVpRftnFzYonSTIEWbU4HevjAduax/8TnLd46epEbTuW
 7zHH1hUo//9FBur8NL7kn5J8kNZQ5usfCwNxuRavqvQ2IKv1EoiOcEldzGyO0nS1E6J9
 imbmM4bFU9UFqRdUBE2EoxUV4sa6ruMC01urjiw54aY7AmY9HvR6Ax7z1ox3i5ixHxVu
 fPy9suqgQzMor3tuSh/Dtkoqt0D7ZWQbHUAJ7zsjEkgDLfpRwbnGAr+PISy+SGKdn5P9
 J/Q6U/glUAf2F5iGAbUoyX8YPrWRyjFLuC6+p4drxbOjaXk0J7WUk5gKiZ2bcP0AohfZ
 L5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=nhXEHZPfLqymltQZF4KpmxUD2H0WPVW45Y0FhAxPSdA=;
 b=Y6JxTZ7m+H3ZSOaFsqDA0Ti+CrqKk03SpgLhqyi69z+JcpV93isyrERvdVsqHi7zbX
 sxQJezh3S0LzM03QUb2s/pyrGKv5/DuQujwQc+ksNqlJPjBkuLzsBIQwAIUZwtc8xonk
 VCJ2WpXcwNgVrXZhUs7o8WaQUN7lXfRZt5kf8E3c6c0e/7E+Ij+m5Ra7QowftRsCyKPC
 vwrr9eixJ50iLzuu1GMo3fTAJFOTqKfdV1wfiPuZNMTkEKWswtJ4LiHoVwC4jBE3Q7q5
 +r32Im76WYNC5GHGTs7xA7LgGBfIM06ux77ZZnGa4UbnrluD5ROc3wUT0nLVtK6JbbAw
 FmWw==
X-Gm-Message-State: AOAM532ObuHQK58Z5Qm3tDH7l9FI2R2Z5u4El4E4xInH0sXxiAPHYuoZ
 Y0zOzglH3ZcfPdnSuAN1mfo=
X-Google-Smtp-Source: ABdhPJwbAEYcoCcNFiwOu77HjRf/D/tWooIBiGLtBGNQkeYm8/DdUtjL+WpuayGFHLU8uZYno9mI0Q==
X-Received: by 2002:aa7:8081:0:b0:518:26c4:ea42 with SMTP id
 v1-20020aa78081000000b0051826c4ea42mr50523504pff.7.1653916637191; 
 Mon, 30 May 2022 06:17:17 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a23-20020a170902b59700b001616c3bd5c2sm9132190pls.162.2022.05.30.06.17.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 06:17:16 -0700 (PDT)
Message-ID: <8a1584fe-68a5-9176-f8d5-c4ed2d9f745c@amsat.org>
Date: Mon, 30 May 2022 15:17:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH v3 4/7] hw/isa/piix{3, 4}: QOM'ify PCI device creation and
 wiring
Content-Language: en-US
To: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org
Cc: qemu-trivial@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Aurelien Jarno <aurelien@aurel32.net>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>
References: <20220528192057.30910-1-shentey@gmail.com>
 <20220528192057.30910-5-shentey@gmail.com>
In-Reply-To: <20220528192057.30910-5-shentey@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x535.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

Hi Bernhard,

On 28/5/22 21:20, Bernhard Beschow wrote:
> PCI interrupt wiring and device creation (piix4 only) were performed
> in create() functions which are obsolete. Move these tasks into QOM
> functions to modernize the code.
> 
> In order to avoid duplicate checking for xen_enabled() the piix3 realize
> methods are now split.
> 
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---
>   hw/isa/piix3.c | 67 +++++++++++++++++++++++++++++++++-----------------
>   hw/isa/piix4.c | 30 ++++++++++++++++------
>   2 files changed, 67 insertions(+), 30 deletions(-)

While this is the same chipset family, these models are maintained by
different people... Do you mind splitting?

For PIIX4 part:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


