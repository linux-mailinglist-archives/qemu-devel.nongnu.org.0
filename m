Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A71553AE87
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 23:40:05 +0200 (CEST)
Received: from localhost ([::1]:41766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwW4R-0007Zp-DR
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 17:40:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nwW1C-0005zc-GO; Wed, 01 Jun 2022 17:36:42 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:43800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1nwW19-0001ZB-EZ; Wed, 01 Jun 2022 17:36:42 -0400
Received: by mail-wr1-x433.google.com with SMTP id s24so4003603wrb.10;
 Wed, 01 Jun 2022 14:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:in-reply-to:references:message-id
 :mime-version:content-transfer-encoding;
 bh=yA5LYLYuqsK5sdjTVR5MZWJXBf5tIuKIqjWjNsEkE7k=;
 b=lgeLL15NjOKJeMTvPI2z1xfE6Zl7aOrQdCxB8Y20DzbZK8rXolhK0AgykHmmxcVqir
 30sqbjmJkDBMw6e9D8QcSiLVcavOYQs0O9FwsVL7HcYUWwBv1dz2vEic/N3z2UDGj4PW
 HuuQQhOfgBjauevGoCnH1DYyc3/63/kTOrVIo4HyGYildwrJn9EBB7dUTrCTN/fIVPXf
 LjXamJAiRu4MWzr9srnziZXIxl816a05NybnSMnq6vaU50/Y+H1yz8cNQl3oF//zjNaT
 EVvaXkPWBRg3WnrpKjSXtZVe31ie/RmHgXoiq4kOKn/imYIpX6hJTQ3ax67zgKcIbNS1
 h4yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:in-reply-to:references
 :message-id:mime-version:content-transfer-encoding;
 bh=yA5LYLYuqsK5sdjTVR5MZWJXBf5tIuKIqjWjNsEkE7k=;
 b=XYg0QICvsQjwKHo3Pxj0q+UvHroVJpE6QbtLBHbKSjNZ7beKdsD8EsjNm4Zmn1j48L
 YEyaNwC5X4XMJzCWq8WdDjNF1HkdcN4p3I2yYCcUlswjoWNlF5C56kiyUSu+R6VgtaBs
 EBV9/rpwnp4D+ERlNJEy46ku8R/hGCZh3OIfMkxuOHLaQEIx4QJRO4pWFk7W+Qq+8Cro
 63tXR4nG+gQcGyJ3mmCxD5WGM+9j2AX39a8E+FOabP9tt57m7X9vWBo31/HlYlloLEOr
 kAuw24y5ob/uDGP1f7+Z0Z2LgKBSYM+JCqX8nCtQ/zAGPpivQT8VfMcSVL5y5oyTpkay
 7a/A==
X-Gm-Message-State: AOAM531wpxtSlwbcJ8kh1l7y2RtCJa/gEYb+mwfi3SeuF6Ew8XgheH0j
 i0WrdQpSgy8hn9TR4BFZ3nw=
X-Google-Smtp-Source: ABdhPJzPOvh8pjjaJ4D7eivGG1HdxJztTwIedYo98zTwAlNwo8gHKUT6rRIyRK0p5Ncipx5qTrwY/Q==
X-Received: by 2002:a5d:650f:0:b0:20d:77b:702b with SMTP id
 x15-20020a5d650f000000b0020d077b702bmr1103882wru.78.1654119397620; 
 Wed, 01 Jun 2022 14:36:37 -0700 (PDT)
Received: from ?IPv6:::1?
 (p200300faaf303d009176c769e13c486f.dip0.t-ipconnect.de.
 [2003:fa:af30:3d00:9176:c769:e13c:486f])
 by smtp.gmail.com with ESMTPSA id
 u10-20020adfdd4a000000b002102cc4d63asm2990870wrm.81.2022.06.01.14.36.37
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 01 Jun 2022 14:36:37 -0700 (PDT)
Date: Wed, 01 Jun 2022 21:36:34 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?Philippe_Mathieu-Daud=E9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
CC: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?ISO-8859-1?Q?Herv=E9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v3_2/7=5D_hw/isa/piix4=3A_Use_obje?=
 =?US-ASCII?Q?ct=5Finitialize=5Fchild=28=29_for_embedded_struct?=
In-Reply-To: <80574d02-8434-db8f-ab1b-61c530cb12ea@amsat.org>
References: <20220528192057.30910-1-shentey@gmail.com>
 <20220528192057.30910-3-shentey@gmail.com>
 <80574d02-8434-db8f-ab1b-61c530cb12ea@amsat.org>
Message-ID: <F6CF74D6-C01D-4598-A842-EF83917F4B92@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

Am 30=2E Mai 2022 11:38:30 UTC schrieb "Philippe Mathieu-Daud=C3=A9" <f4bug=
@amsat=2Eorg>:
>On 28/5/22 21:20, Bernhard Beschow wrote:
>> Found-by: Peter Maydell <peter=2Emaydell@linaro=2Eorg>
>
>I suppose you refer to this thread:
>https://lore=2Ekernel=2Eorg/qemu-devel/CAFEAcA_y69=3DiXMH75dHeNkxMa038Z7X=
k63GW9fdcAFHJSWS=3DsA@mail=2Egmail=2Ecom/

Yes, correct=2E

>I'm going to change the tag to "Reported-by"=2E

I'll take care of this in v4=2E

>Reviewed-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat=2Eorg>
>
>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>> ---
>>   hw/isa/piix4=2Ec | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/hw/isa/piix4=2Ec b/hw/isa/piix4=2Ec
>> index 9a6d981037=2E=2E1d04fb6a55 100644
>> --- a/hw/isa/piix4=2Ec
>> +++ b/hw/isa/piix4=2Ec
>> @@ -224,7 +224,7 @@ static void piix4_init(Object *obj)
>>   {
>>       PIIX4State *s =3D PIIX4_PCI_DEVICE(obj);
>>   -    object_initialize(&s->rtc, sizeof(s->rtc), TYPE_MC146818_RTC);
>> +    object_initialize_child(obj, "rtc", &s->rtc, TYPE_MC146818_RTC);
>>   }
>>     static void piix4_class_init(ObjectClass *klass, void *data)


