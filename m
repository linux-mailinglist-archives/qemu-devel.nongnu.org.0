Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEDA625AC8
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Nov 2022 13:58:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1otTaj-0001VR-RU; Fri, 11 Nov 2022 07:57:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1otTah-0001Uw-Mm
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 07:57:03 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1otTaf-0005D9-TJ
 for qemu-devel@nongnu.org; Fri, 11 Nov 2022 07:57:03 -0500
Received: by mail-wr1-x430.google.com with SMTP id bs21so6385830wrb.4
 for <qemu-devel@nongnu.org>; Fri, 11 Nov 2022 04:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=sz9LtfUlstji8RZ9zKsTjAK6k0o25bxkzLvFDI1uF+Y=;
 b=Syf1Y4mp3vJdjw3tHL1oz3OtOw7/cm06jRF7MGpmPSXxbjul3uy1LWSAy1XS50Oq7f
 AHsge7E/mehY6MMXovuKPP4ZFUmKXEbx9z+rO6X89Q6+OgQDKGTP+NXYB3sVY+bjj6HO
 9tN3EERYm+hvnrGtkD64ZvGliTG0Kg2fvtDslreLiWGg0ADIg+eEg/5dK46bwAsk4wZA
 QF/iZy5DZRziHNq/8FyHWpLhcuifIaN6FhmCJ/N1mpOSiwfSgTK51O6aHAMhk3uEm7j5
 4hhQ3G4uItEy/6IBfpMin+Ap/FA3bsL3iu+tgTfr9b8r9JRzaWO9KiWOB8zN0JFxtYsj
 ANgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sz9LtfUlstji8RZ9zKsTjAK6k0o25bxkzLvFDI1uF+Y=;
 b=gx1ylYvri+4vqAetvMdhOsVJB7PO7Thuy5XLoQVxpz/MVRUKinszuuejvjjepZ92iM
 FbQ/Tv0amQI16VleFmuesgneLiPIpvUX8VndOqnc776jlvuYF/S3GDKhLwnh3Rr5YabF
 vkgODxmmy6tABb1EZZIOCfFFmH82RSDj7UnEyW0iSesCSahHqr24tpwFMVYYPH/SuMvE
 ToqXxUpm0pXlxN3Bl0V5PobCDUFCf12KbksIgUwQu35Sddlqs43YCVbm0wPqlVXBk3bz
 +3hLQs1/LEgMlqVa1D8ydTdb+JxzgkMoKAP0kFfM3cBsS/4SwOE7YKVrPpix1xV4f/So
 pnLA==
X-Gm-Message-State: ANoB5pmsHY8cy5odjehy/EpVud8ewkWYlHdBDr3Qc+4lWPvueGJIPcNt
 3ispPBCqyuNqFYKfMt82tAbV/g==
X-Google-Smtp-Source: AA0mqf6386KppT2YbzQ/KRS3Bt0JLsVmLwhtVZmGc/N1rTaVoygqj826MgAsfyNPT/4cDklQFWGWNA==
X-Received: by 2002:a5d:4b4e:0:b0:236:6deb:4498 with SMTP id
 w14-20020a5d4b4e000000b002366deb4498mr1208979wrs.52.1668171420328; 
 Fri, 11 Nov 2022 04:57:00 -0800 (PST)
Received: from [10.50.0.10]
 (ec2-54-194-108-71.eu-west-1.compute.amazonaws.com. [54.194.108.71])
 by smtp.gmail.com with ESMTPSA id
 n41-20020a05600c502900b003c65c9a36dfsm2783160wmr.48.2022.11.11.04.56.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Nov 2022 04:56:59 -0800 (PST)
Message-ID: <47bfb5ee-c825-8e04-430f-68e2f0819732@linaro.org>
Date: Fri, 11 Nov 2022 13:56:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.4.2
Subject: Re: [PATCH v3 2/2] hw/nvme: cleanup error reporting in nvme_init_pci()
Content-Language: en-US
To: Klaus Jensen <its@irrelevant.dk>
Cc: qemu-devel@nongnu.org, Keith Busch <kbusch@kernel.org>,
 Markus Armbruster <armbru@redhat.com>, qemu-block@nongnu.org,
 Klaus Jensen <k.jensen@samsung.com>
References: <20221110220805.26816-1-its@irrelevant.dk>
 <20221110220805.26816-3-its@irrelevant.dk>
 <bfc67412-09ce-793e-49ac-b0af0cf05fbd@linaro.org>
 <Y25A0Qx95NtrPmA3@cormorant.local>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <Y25A0Qx95NtrPmA3@cormorant.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 11/11/22 13:32, Klaus Jensen wrote:
> On Nov 11 12:40, Philippe Mathieu-Daudé wrote:
>> On 10/11/22 23:08, Klaus Jensen wrote:
>>> From: Klaus Jensen <k.jensen@samsung.com>
>>>
>>> Replace the local Error variable with errp and ERRP_GUARD() and change
>>> the return value to bool.
>>>
>>> Signed-off-by: Klaus Jensen <k.jensen@samsung.com>
>>> ---
>>>    hw/nvme/ctrl.c | 23 ++++++++++-------------
>>>    1 file changed, 10 insertions(+), 13 deletions(-)
>>
>>
>>> @@ -7388,14 +7387,12 @@ static int nvme_init_pci(NvmeCtrl *n, PCIDevice *pci_dev, Error **errp)
>>>        }
>>>        ret = msix_init(pci_dev, n->params.msix_qsize,
>>>                        &n->bar0, 0, msix_table_offset,
>>> -                    &n->bar0, 0, msix_pba_offset, 0, &err);
>>> -    if (ret < 0) {
>>> -        if (ret == -ENOTSUP) {
>>> -            warn_report_err(err);
>>> -        } else {
>>> -            error_propagate(errp, err);
>>> -            return ret;
>>> -        }
>>> +                    &n->bar0, 0, msix_pba_offset, 0, errp);
>>> +    if (ret == -ENOTSUP) {
>>> +        warn_report_err(*errp);
>>
>> Why only report ENOTSUP in particular?
>>
> 
> Because the error is beneign (it's just a notice that MSI-X isnt
> available on the platform).
> 
>>> +        *errp = NULL;
>>> +    } else if (ret < 0) {
>>> +        return false;
>>
>> Is that normal to ignore:
>>
>> -   error_setg(errp, "The number of MSI-X vectors is invalid");
>>      return -EINVAL;
>>
>> -   error_setg(errp, "table & pba overlap, or they don't fit in BARs,"
>>                       " or don't align");
>>      return -EINVAL;
>>
>> Or possible future error added in msix_init()?
> 
> It is not ignored, it is passed up to the caller. On any other error,
> returning false will cause device realization to fail and the error
> (i.e. invalid vectors or overlap) be reported.

Indeed, I didn't review carefully enough.

Maybe in the first case explicit with /* Convert the error as a simple 
warning */ and in the second /* Propagate to caller */.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


