Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37D54537E5D
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 16:02:09 +0200 (CEST)
Received: from localhost ([::1]:56894 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvfyC-00029T-2N
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 10:02:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvfgt-00068I-Ur
 for qemu-devel@nongnu.org; Mon, 30 May 2022 09:44:20 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:45902)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvfgr-00086J-7X
 for qemu-devel@nongnu.org; Mon, 30 May 2022 09:44:15 -0400
Received: by mail-pl1-x636.google.com with SMTP id q18so10354771pln.12
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 06:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3b6EMPsr1IKzfI5YQRokggkI+409xt4xv+LnX/mLFKg=;
 b=O/B7PQifY+DGEVJnNbrzvy3wfTB0ARH1peinXq8XxWsl2qCNwBwWRONgz7Suajp/p6
 yLjksZc+wgVk975TCEDlNe3pSRKp9JtX/RUO5ZnLLtIrTa3OMvonpOk4xIYE/s8YBt0j
 50e/pcE/U88adPDFNISS2dulvgxXQMgwky7W+pHQoclBbXfWCkvSWpUC/wjTPpz3Dkbx
 keZJrLtOGkKwn4X86mSr2DPEeE1Ucf1TxI+angOt6QWBBr+kAmrgXDXUY8Tki5HkMxks
 mQhw1r6RlkGBFv1TIgrYnZiFmHGapifiOtujT9u1j4ZsXIPkWjEPiX2pB8Kcy44csAqy
 361Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=3b6EMPsr1IKzfI5YQRokggkI+409xt4xv+LnX/mLFKg=;
 b=p5X1zULGBSgK5Sn5OFAg3yk9rdSNS3ST+AX1E2fFxt6ESHad4PZoYrvs4dXJrL/Ogf
 +O+gTMhGZ4ktQ2gx4eO+jbeaRfhyDGCHs4Az4ctlViX67ifdRyfVBgP4YAj7P0Mr0JJw
 4LcRXvD3ukjf3/bpBMQLy+8lCiiv5xFIP6xf/9bmAC6Kk+KFHDjbklh0tuFb99ox2Tae
 wmNli0/TEps+DTDfUDr8BTOyWVfOTcEGq7TWS1SimXXq9g7vwkGRJzacoGUkHOWwzbGl
 C0PMRVPWBIXxAi0sJJqv/4L48IkWf2IQBpTsIK+ivUPabtjawEknynTYP7H1kmnGbTaI
 G4Tw==
X-Gm-Message-State: AOAM533LgL9+32Yo0Rxfdc2hc/cyUbCLMeavB698YskQQxpXp3wWMwfj
 odUEWabg2PCt/rEnkf4if5A=
X-Google-Smtp-Source: ABdhPJxlVL+mbKKh3ukctf3HUkxrb1qZeqBlYncLIvINDMXty1fSjcyI5+YbkgZoQlfUf4m70cV3JA==
X-Received: by 2002:a17:90a:ec03:b0:1e0:d890:f74 with SMTP id
 l3-20020a17090aec0300b001e0d8900f74mr22959607pjy.136.1653918251878; 
 Mon, 30 May 2022 06:44:11 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h4-20020a056a00000400b005182fd977e4sm8859689pfk.108.2022.05.30.06.44.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 06:44:11 -0700 (PDT)
Message-ID: <8f3a094c-defa-c97e-acba-7a58dcd3e5e6@amsat.org>
Date: Mon, 30 May 2022 15:44:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH v2 3/3] hppa: Fix serial port assignments and pass-through
Content-Language: en-US
To: Helge Deller <deller@gmx.de>, qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Sven Schnelle <svens@stackframe.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <20220528094134.16513-1-deller@gmx.de>
 <20220528094134.16513-4-deller@gmx.de>
In-Reply-To: <20220528094134.16513-4-deller@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pl1-x636.google.com
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

On 28/5/22 11:41, Helge Deller wrote:
> This fixes the serial ports in the emulation to behave as on original
> hardware.
> 
> On the real hardware, the LASI UART is serial port #0 and the DINO UART
> is serial port #1. This is fixed in SeaBIOS-hppa firmware v6, which is
> why at least this firmware version is required.
> 
> The serial port addresses in hppa/hppa_hardware.h have to be swapped,
> and when creating the virtual serial ports the correct port addresses
> are used.
> 
> This patch now for example allows to specify on the qemu command line:
>       -serial mon:stdio -serial /dev/ttyS4
> to use the emulated ttyS0 in the guest for console output, and pass
> ttyS4 from the host to ttyS1 in the guest.
> 
> Signed-off-by: Helge Deller <deller@gmx.de>
> ---
>   hw/hppa/hppa_hardware.h |  4 ++--
>   hw/hppa/machine.c       | 22 ++++++++--------------
>   2 files changed, 10 insertions(+), 16 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>



