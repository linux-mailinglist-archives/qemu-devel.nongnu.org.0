Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06FDA5379E4
	for <lists+qemu-devel@lfdr.de>; Mon, 30 May 2022 13:29:34 +0200 (CEST)
Received: from localhost ([::1]:42756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvdaX-00089k-2j
	for lists+qemu-devel@lfdr.de; Mon, 30 May 2022 07:29:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvdUD-0005Ov-UY
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:23:02 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:46976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvdU8-0000Hi-RM
 for qemu-devel@nongnu.org; Mon, 30 May 2022 07:23:01 -0400
Received: by mail-pg1-x534.google.com with SMTP id j21so9869514pga.13
 for <qemu-devel@nongnu.org>; Mon, 30 May 2022 04:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/ekH1fZagaJRritgIlx/jkmzW+6VtEa3VJAzR6pTXcY=;
 b=LVJUKSsdMocuPbV/oOpzenJp5jTyb4N72K+JuUiZU9pFNRqTFqXaiwGdvsBO2CdwhY
 tWv+nv/v8ovqnK37R7ft+RbHiJ58Hwf6RVL3l/FYgHHwgCnksHTIpzxvMGda0zK4adg3
 GhPqyxvcLUFFzFEqUkhXO0qRhLcYoZat5ZiYVuK75WrlBLw61iQtok7m0c8Q4PRJMTBR
 UTAXleqnpwtjdUfYI48bHxYY0GJO/EURpLfcy+slpwVayOf5cMeHAymQkQzRs5nn66L+
 x1i2njFjP2/cCFAUyhRqaZcdzJapvb2jAMj3LN91xJpwoReGCqhJUVLYXE3aEVsIEmTE
 bTeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=/ekH1fZagaJRritgIlx/jkmzW+6VtEa3VJAzR6pTXcY=;
 b=jHp1qU6cCNmE0gps75XNTtaxlE3XIreaKc9xvQaLoP9oWddyPmD094f4Y6tF94FLiB
 JChuhXzs9G2qcYbeBEfnpn9FzYSh2xt+5rMeKiGhFCAEnzMVe506+4OHOOer8ZPIZAfQ
 8ywrZ3CHLrCNgE40Z3cJImqcnRf0EJYW2MFfMIFgXjVnBVufwXNZmIQXCcY0j0/CA3mO
 Vo92MjA/oFWsg/ED4JLEIQlfodIJ9CL9NYrPqT7cayR0IGysAy5OjHcXKAzPnN0aiSoJ
 ZVnlyYAM9VN3DMPza0+qOsW7MGeeyrRdVwmi+3lCXTUjwTEvw1JRbL4T17K3ruZmBL1w
 LOig==
X-Gm-Message-State: AOAM530/t2rXDnabCwA65Q/0Obt+/tJnEuNkI/7jbX0YZ4WKGTJXKxF9
 G3Z++6ImPbhvWaLFxGPNWag=
X-Google-Smtp-Source: ABdhPJzkVqdaAro/eOVesCMvV1x+gMs5CKVS5sPDGnPYSIHUCn8XmKmtT6yEIt2V50jWKLsIUM+QhA==
X-Received: by 2002:a63:fb50:0:b0:3db:a519:1f84 with SMTP id
 w16-20020a63fb50000000b003dba5191f84mr47901101pgj.61.1653909774686; 
 Mon, 30 May 2022 04:22:54 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 b67-20020a633446000000b003fb098151c9sm8283005pga.64.2022.05.30.04.22.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 30 May 2022 04:22:53 -0700 (PDT)
Message-ID: <08b94e23-cba2-2f15-9cb9-5990a13487af@amsat.org>
Date: Mon, 30 May 2022 13:22:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [PATCH 02/12] hw/acpi/piix4: change smm_enabled from int to bool
Content-Language: en-US
To: Ani Sinha <ani@anisinha.ca>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: shentey@gmail.com, mst@redhat.com, marcel.apfelbaum@gmail.com,
 imammedo@redhat.com, aurelien@aurel32.net, pbonzini@redhat.com,
 richard.henderson@linaro.org, eduardo@habkost.net, hpoussin@reactos.org,
 qemu-devel@nongnu.org
References: <20220528091934.15520-1-mark.cave-ayland@ilande.co.uk>
 <20220528091934.15520-3-mark.cave-ayland@ilande.co.uk>
 <CAARzgwwkUqvjOLHfkLUAweM5Q+pf_tijogxp_Z88N02NPQbO=A@mail.gmail.com>
In-Reply-To: <CAARzgwwkUqvjOLHfkLUAweM5Q+pf_tijogxp_Z88N02NPQbO=A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x534.google.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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

On 30/5/22 06:56, Ani Sinha wrote:
> On Sat, May 28, 2022 at 2:49 PM Mark Cave-Ayland
> <mark.cave-ayland@ilande.co.uk> wrote:
>>
>> This is in preparation for conversion to a qdev property.
>>
>> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> other than the comment below,
> Reviewed-by: Ani Sinha <ani@anisinha.ca>
> 
>> ---
>>   hw/acpi/piix4.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
>> index bf20fa139b..fcfaafc175 100644
>> --- a/hw/acpi/piix4.c
>> +++ b/hw/acpi/piix4.c
>> @@ -74,7 +74,7 @@ struct PIIX4PMState {
>>
>>       qemu_irq irq;
>>       qemu_irq smi_irq;
>> -    int smm_enabled;
>> +    bool smm_enabled;
> 
> For the sake of consistency, I would also change the signature of
> piix4_pm_init(), that is, change simm_enabled from int to bool.
> We are good in pc_init1 since x86_machine_is_smm_enabled() returns
> bool. In piix4_create() in isa, we pass integer 0 which we might want
> to make boolean.

This function ends up removed... But OK.

