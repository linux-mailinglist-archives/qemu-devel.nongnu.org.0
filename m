Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AE0341C0A6
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 10:27:45 +0200 (CEST)
Received: from localhost ([::1]:46646 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVUwJ-0000iB-Qq
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 04:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mVUv6-0008Lq-TR; Wed, 29 Sep 2021 04:26:28 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:51756)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mVUv3-0003Yg-Sf; Wed, 29 Sep 2021 04:26:28 -0400
Received: by mail-wm1-x335.google.com with SMTP id o19so1186945wms.1;
 Wed, 29 Sep 2021 01:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bU8l847DhjBMLUDfhdHZZzeEk7jd00n+/WAc+BC05lU=;
 b=aFsLuFZ0mso0VbBJuLHlMe26jWKtWTEWrAP53LlEbqH4eawAM1oe6zjEuWzPdUR/44
 TrIqbgcbDbX1EScQrlwBZezsRFeJlwJ6MvCXAlhmKxop3GKgmv6P0ZUn4/YH3y+rB+KB
 50lXKsL1z9S4xUPytIPx6GN74ogORk4zfGAaZnOw4kOH9Qu872bUahT/zZTZpl2B9df4
 UFWKBgFUuOA072JKRq6vV9aNMccP/14IZ8JBUQ8pHlYn6MI0rgn3aIh7v8xAO1pGlLiJ
 258w4IFtUVPkfPPVdDNlLOVU4FLKijca8MDA20zqlJgkaDms0KO+Wx47mRaBg2s0CflR
 10dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=bU8l847DhjBMLUDfhdHZZzeEk7jd00n+/WAc+BC05lU=;
 b=FYmw741MlXZIBvTetkrfW6VSu8JcfsBLwCeb9ThGnhmgsV5hJgDfqIfPKSOCJso3bB
 LbY8ORyafRZIcyxNOclllMzkbsZxZnaZdRqilsOqiLU+oPtRehOj2sNcZzM+8iY9k2VD
 g4nXyubSl1z/zn+uM0/ga9Pdz1YeM1naWZezwguZWxgjXtYipETJpYlw6OEiCU37kAO2
 87D0/Jgs2GrEHM8uIudCO9FN/+8qS5nuuWKG8XD1FoklKRNn2d20mzq93cdWqkk1HaPl
 WINYgcdksTi4O/l1EHD1z6NNw7E+uquRbdiatvrkzVJuA6BhHpd7QVLPyBd3TySJdlul
 mu8A==
X-Gm-Message-State: AOAM530F9tAx6/Jo0kLOc64CzH4iDWUMK1GVs0xOP/bt3sQMdCendYXY
 lJWUzWteOeE7huLSnDdPD4o=
X-Google-Smtp-Source: ABdhPJyVtyMPTlevKoRf+IemJ81fhPi2/ixu4PetR2R+kr4gN1sIi+x+Kj47gQZX4ix4PcX4/qy9ag==
X-Received: by 2002:a1c:f402:: with SMTP id z2mr9002360wma.53.1632903984063;
 Wed, 29 Sep 2021 01:26:24 -0700 (PDT)
Received: from [192.168.1.36] (118.red-83-35-24.dynamicip.rima-tde.net.
 [83.35.24.118])
 by smtp.gmail.com with ESMTPSA id z5sm1035798wmp.26.2021.09.29.01.26.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Sep 2021 01:26:23 -0700 (PDT)
Message-ID: <29496f5b-0241-cfe3-acf8-3d76e040e397@amsat.org>
Date: Wed, 29 Sep 2021 10:26:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v2 1/1] hw/riscv: shakti_c: Mark as not user creatable
Content-Language: en-US
To: Alistair Francis <alistair.francis@opensource.wdc.com>,
 qemu-devel@nongnu.org, qemu-riscv@nongnu.org
References: <c617a04d4e3dd041a3427b47a1b1d5ab475a2edd.1632871759.git.alistair.francis@wdc.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
In-Reply-To: <c617a04d4e3dd041a3427b47a1b1d5ab475a2edd.1632871759.git.alistair.francis@wdc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x335.google.com
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-2.562,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: alistair.francis@wdc.com, bmeng.cn@gmail.com, palmer@dabbelt.com,
 alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/29/21 01:29, Alistair Francis wrote:
> From: Alistair Francis <alistair.francis@wdc.com>
> 
> Mark the shakti_c machine as not user creatable.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/639
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  hw/riscv/shakti_c.c | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/hw/riscv/shakti_c.c b/hw/riscv/shakti_c.c
> index 2f084d3c8d..e7cd3bdfb4 100644
> --- a/hw/riscv/shakti_c.c
> +++ b/hw/riscv/shakti_c.c
> @@ -150,6 +150,12 @@ static void shakti_c_soc_class_init(ObjectClass *klass, void *data)
>  {
>      DeviceClass *dc = DEVICE_CLASS(klass);
>      dc->realize = shakti_c_soc_state_realize;
> +    /* Reasons:
> +     *     - Creates CPUS in riscv_hart_realize(), and can create unintended
> +     *       CPUs

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +     *     - Uses serial_hds in realize function, thus can't be used twice
> +     */
> +    dc->user_creatable = false;
>  }

