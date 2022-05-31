Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AB0B538C94
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 10:14:30 +0200 (CEST)
Received: from localhost ([::1]:49508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nvx1J-0002Sn-7X
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 04:14:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33342)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvwr0-0003QY-Sb; Tue, 31 May 2022 04:03:50 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:39683)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nvwqw-00037r-2l; Tue, 31 May 2022 04:03:50 -0400
Received: by mail-pg1-x529.google.com with SMTP id q123so7097936pgq.6;
 Tue, 31 May 2022 01:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yPc1DdTfwamyc5u1QhZDcoLME/Z/P0zS91wOIaFHVPI=;
 b=CCAVc2oS/N/P5BrOLIncLLJ6SnsIClruWUpJ0CiW895hHq0r+fzWhwrpJRZK73dJ2w
 vG4C/AE+DH4EQaxYLU00Ny7ITUixxGdHdfVvrxVCFIU7clwLmFdHeRanw6xCFswtQFYw
 uasTbVBYfHU0oVDrw8D9BS4UiVppV6iZr5FzmsJHITAxICxcFFcAaE+LmKcL7/IWLxlk
 s/bcFcUUbinX24lsKCp7MHRCnBf/8IwXPyGDntBjdyvuwgKU1X+bF+wQhsTFkSazNMQW
 1YNDiw0+3ij6fpGgwYF7GAK+uYGLnMb9pkEukhV6QX00H8uguB+enT1oX7cl5/iEynyt
 jCUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:message-id:date:mime-version:user-agent
 :subject:content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=yPc1DdTfwamyc5u1QhZDcoLME/Z/P0zS91wOIaFHVPI=;
 b=bs94d1btfGqRIpAxJDbaX1LGTaAey0qLl9XprI5T7D0PeB5y8wH67wINPrB60Dn7lJ
 Ci/L6c7p7equ2sFUxZAVpxtw4fz1scFw/JdI1k01lIdiNmdJWe4fMDRILKEByGWvtMCl
 9dBERUNF/qNR8DWMR+vU/FnH9gcKliHe/G9mFBrXsRY+VPxUMbFiI5AvCtc+1KteqZmV
 WvwU31eNyWtRYtUhxfwDWPSYauF7BHVrO/rHFAYjp3aNFEZ4wA0tB6o5vbPEUu/9m3Wk
 S6IFbwCcQc/ZEJkVd8eZsRN3k5AdvRvTJ7hoqCDZwoPL7f2wOsZf3bvo+lQ1SaTWMDyy
 77cw==
X-Gm-Message-State: AOAM533w67LoR4BLr8tGCqiWgOtg7QFvu7fvFEHgnXiPo/vIWXyo59Bw
 25oYb5yC7Ejf8ftb1FzHWyo=
X-Google-Smtp-Source: ABdhPJxwpcw60ZsWPr1Uf24AvL8BOA7yq3bTFRtdJCvmuAksnRwPm2LMzx7V8jjFANcfpMqfYhgFtw==
X-Received: by 2002:a05:6a00:3003:b0:51b:54dc:4112 with SMTP id
 ay3-20020a056a00300300b0051b54dc4112mr7605608pfb.36.1653984224120; 
 Tue, 31 May 2022 01:03:44 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 n9-20020a170902e54900b001634d581adfsm10550397plf.157.2022.05.31.01.03.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 31 May 2022 01:03:43 -0700 (PDT)
Message-ID: <13fcad78-c10c-a85c-25e9-607bcc35fdc4@amsat.org>
Date: Tue, 31 May 2022 10:03:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.9.1
Subject: Re: [RFC PATCH 11/17] hw/sd: Add eMMC support
Content-Language: en-US
To: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Cc: Vincent Palatin <vpalatin@chromium.org>, qemu-block@nongnu.org,
 Bin Meng <bin.meng@windriver.com>, qemu-devel@nongnu.org,
 Joel Stanley <joel@jms.id.au>
References: <20220318132824.1134400-1-clg@kaod.org>
 <20220318132824.1134400-12-clg@kaod.org>
 <bd3df6e1-62f9-04b6-f288-b12e6860ddaa@amsat.org>
 <c3201b35-1679-d14e-01c4-64573d790762@kaod.org>
In-Reply-To: <c3201b35-1679-d14e-01c4-64573d790762@kaod.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pg1-x529.google.com
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

On 31/5/22 07:58, Cédric Le Goater wrote:
> On 5/30/22 19:40, Philippe Mathieu-Daudé wrote:
>> On 18/3/22 14:28, Cédric Le Goater wrote:
>>> The initial eMMC support from Vincent Palatin was largely reworked to
>>> match the current SD framework. The parameters mimick a real 4GB eMMC,
>>> but it can be set to various sizes.
>>>
>>> This adds a new QOM object class for EMMC devices.
>>>
>>> Signed-off-by: Vincent Palatin <vpalatin@chromium.org>
>>> Link: 
>>> https://lore.kernel.org/r/1311635951-11047-5-git-send-email-vpalatin@chromium.org 
>>>
>>> [ jms: - Forward ported to QEMU 5.2 ]
>>> Signed-off-by: Joel Stanley <joel@jms.id.au>
>>> [ clg: - ported on aspeed-7.0 patchset
>>>         - HPI activation ]
>>> Signed-off-by: Cédric Le Goater <clg@kaod.org>
>>> ---
>>>   hw/sd/sdmmc-internal.h |  97 +++++++++++++++++++
>>>   include/hw/sd/sd.h     |   9 ++
>>>   hw/sd/sd.c             | 205 ++++++++++++++++++++++++++++++++++++++++-
>>>   hw/sd/sdmmc-internal.c |   2 +-
>>>   4 files changed, 311 insertions(+), 2 deletions(-)
>>
>>
>>> +static void emmc_class_init(ObjectClass *klass, void *data)
>>> +{
>>> +    DeviceClass *dc = DEVICE_CLASS(klass);
>>> +    SDCardClass *sc = SD_CARD_CLASS(klass);
>>> +
>>> +    dc->desc = "eMMC";
>>> +    sc->proto = &sd_proto_emmc;
>>> +    sc->spec_version = SD_PHY_SPECv3_01_VERS; /* eMMC requirement */
>>> +    sc->set_csd = sd_emmc_set_csd;
>>> +}
>>> +
>>> +static const TypeInfo emmc_info = {
>>> +    .name = TYPE_EMMC,
>>> +    .parent = TYPE_SD_CARD,
>>
>> Hmm this is odd to have the model inheriting features from SD_CARD but 
>> then behaving differently (one could enumerate QDEV objects implementing
>> TYPE_SD_CARD then use them expecting they match the SD card protocol).
>>
>> Why do you need to have TYPE_SD_CARD as parent?
> 
> Simply for the initialization.
>> Could we simply duplicate sd_class_init() assignations instead? That
>> would likely make it easier to modify eMMC handlers.
> 
> May be we lack a base abstract class ?

I've been thinking about it but maybe not enough. I'll revisit.

> It would clean up this section in the realize routine :
> 
>     sd->proto = sd->spi ? &sd_proto_spi : &sd_proto_sd;
> 
>      if (sc->proto) {
>          sd->proto = sc->proto;
>      }

In v2 I moved the 'proto' field from instance to class, so we don't need
this hack anymore.

