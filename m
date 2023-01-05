Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 174A165EEBE
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 15:29:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDREp-0001gl-1H; Thu, 05 Jan 2023 09:28:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDREn-0001gB-GH
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 09:28:57 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDREl-0004hg-SQ
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 09:28:57 -0500
Received: by mail-wm1-x330.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so1445461wms.2
 for <qemu-devel@nongnu.org>; Thu, 05 Jan 2023 06:28:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=MCxLzDtLl8WI43o6MBC9N9QhlxJ8qzHD6gDhZ7fiHFM=;
 b=hNkkSmoa1GPqAX4g3JN356yJgnCfCFLQCKBQcCBXTzzpdffMUbUMSgwuopWKF23RTT
 KWbeI66h9cJVbJXl0fj1Viv3AZxMinAxgGImOvVCA4yiiGzPSDF+9UFi2yiQV8/BF54M
 z98rHhRAYp2wBeDm7dbrSYsvUy10HgSHF0MrbampqWBiJP5VIOfiwd1lJLf81EH4JDA+
 yV0HIaBtcu/Id8xFGRCmA1I1Ux+Syw7gWG7w2nO/0kdzBBX2wOtRXlZv61BgkSL1CC4q
 2sx315iCVte4hDrFOTL0ZSm9rkRA7T6DApsnUjJ2vV7GVxwbcBSuvNXW/wB6khNRsFNb
 SoXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=MCxLzDtLl8WI43o6MBC9N9QhlxJ8qzHD6gDhZ7fiHFM=;
 b=ZgwXfuDxRLAZNjMJHW4qC4VISUhHz4t3mUXkOIwHf5Srz+z3vKT+7a9MRwqmT4nRSv
 Pn1vYaT39kU+TVP3crKtk90JdeyH9Cw00GCcf70kyYPvSrdOopsSv8mjiqB+/4/YphHw
 7hHFhpUT5qCW3BfxgweQcMBVROb+RUPPTwb2wyxolY1fMWAFs8VMWDpij3wO7vjeckGo
 whsJtU+EAvfHJnIpwlHScO5iblxNDcwZhL6ZfoccgrcHm4jt1tuvbz00X5vKobK+cZ0r
 yzXS/S47GS+QJEdwPQrA2T+P6CZJS2qIPmve5axgr/Ui+PiYVk+NDsoYNgR4aQGVckou
 C9JQ==
X-Gm-Message-State: AFqh2korP3OveevPRhO1LEoeLMdcCPgQk97oOyg/gOEaXNEqeRpYwBLk
 rU0yw2mx4zn11i8Y4F2R6H+HDg==
X-Google-Smtp-Source: AMrXdXvW2AwlwNA43UmQX5VtZDHDsVOnvlCFb8vSwrKzsNbyKVSxAEDpeGjCT0JhgGDBZiUC9DTtdg==
X-Received: by 2002:a05:600c:47d1:b0:3d3:496b:de9d with SMTP id
 l17-20020a05600c47d100b003d3496bde9dmr36839141wmo.34.1672928934310; 
 Thu, 05 Jan 2023 06:28:54 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 bg24-20020a05600c3c9800b003cfa3a12660sm8265793wmb.1.2023.01.05.06.28.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Jan 2023 06:28:53 -0800 (PST)
Message-ID: <7aa2d81c-6d9f-b681-b93f-6d997c86dd00@linaro.org>
Date: Thu, 5 Jan 2023 15:28:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v7 6/7] mac_newworld: Deprecate mac99 "via" option
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <4162db13bd1da9c6ddd77f185cef738e44790467.1672868854.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <4162db13bd1da9c6ddd77f185cef738e44790467.1672868854.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -49
X-Spam_score: -5.0
X-Spam_bar: -----
X-Spam_report: (-5.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-2.939,
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

On 4/1/23 22:59, BALATON Zoltan wrote:
> Setting emulated machine type with a property called "via" is
> confusing users so deprecate the "via" option in favour of newly added
> explicit machine types. The default via=cuda option is not a valid
> config (no real Mac has this combination of hardware) so no machine
> type could be defined for that therefore it is kept for backwards
> compatibility with older QEMU versions for now but other options
> resembling real machines are deprecated.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/mac_newworld.c | 9 +++++++++
>   1 file changed, 9 insertions(+)

Don't we need to document in the 'System emulator machines'
section of docs/about/deprecated.rst? (maybe within a
"machine options" subsection)


