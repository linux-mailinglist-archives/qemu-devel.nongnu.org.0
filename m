Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E994465E611
	for <lists+qemu-devel@lfdr.de>; Thu,  5 Jan 2023 08:29:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pDKgO-0007ll-Rl; Thu, 05 Jan 2023 02:29:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDKgJ-0007l1-P8
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 02:28:55 -0500
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pDKgH-0002mv-V4
 for qemu-devel@nongnu.org; Thu, 05 Jan 2023 02:28:55 -0500
Received: by mail-wr1-x42a.google.com with SMTP id h16so35205330wrz.12
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 23:28:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NiVZwavCIG7rSWIfgBTZvkkJ+ayedwt5s8GAXc2bnWE=;
 b=Mrv9Q4JKAJZOJkGfX5lPcrzbg1pXs8D3bVc1DBSJATOW6dA9RsQ1DeC703Fqerjqd8
 xTZylzezVF/+hZ0OwJiyoPOB4OYxLFghdBifBoYF5N+9osH5WGon+JZmMX9MWyX/Xrxu
 NLGCDM1blE6DF7T2jLFeTLeVpx+jnUTmXDuJLHSATiI2e1BYrIdb8vpnLio0LHwgfqFL
 8FSzCWR6baVGVssK7pdfZWoLccRwO8gGh57AXS+wD1CMoqr9KjGDSva5r6qBGtViEfyM
 phgWE+rUOrvV+SuMjnDePn7EBnXQjL6eL1D/+9SK/1+vmqkIzRnZs1MwpXbfG2ZUWcje
 5Wfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=NiVZwavCIG7rSWIfgBTZvkkJ+ayedwt5s8GAXc2bnWE=;
 b=ZQoUZFTg3wwptTuJzqvvGjlp4UOjcIp79Jz4dYdBrU/a7uDxkS7xTo2/b9IopqKbpf
 rkfoqCFW3NsQM9/VS2M797x2y4aLK9yQxlDlBQVk/KsasjzgDyu0JdZeCezAJnr5nxDz
 1Z1m6DrfSTsKSwlzFTer+vHnV7gw8NYWaQayQ79WQDsCUZzbFs9BxmEHUNMRxPEy4U8r
 uQe1JxgPNbUWDF5Vq/xGy4FoOWXUKsNSiaV1OV59aU/m9qe//7zRrtKprEPaXMWwV8RI
 nygOPZpF6xGaMMekWJFtrMZMTS+NZtAHK2MOQliX0aXefaHcpxPiiWmb0J2Zv9EyIet2
 47aQ==
X-Gm-Message-State: AFqh2koKKCvFiJ3zEqgSJ1L5OAuzgaCKqaE0iZFghLbNjPb1BMlDWBNz
 KwbKe0WoMFVr1+isgL6YOnHMYg==
X-Google-Smtp-Source: AMrXdXuFNQrubnK7KmXzS7jShGaabYdzoPIxYM78nhTAkjiu1w7jBe8caVr8JYS/hEIMw9tT1uDExg==
X-Received: by 2002:a5d:42c1:0:b0:25f:8ead:96cc with SMTP id
 t1-20020a5d42c1000000b0025f8ead96ccmr35059264wrr.70.1672903732323; 
 Wed, 04 Jan 2023 23:28:52 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l25-20020adfa399000000b002421ed1d8c8sm36190823wrb.103.2023.01.04.23.28.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 23:28:52 -0800 (PST)
Message-ID: <521f5a40-1268-7286-8597-dca3869a2055@linaro.org>
Date: Thu, 5 Jan 2023 08:28:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v7 5/7] mac_newworld: Deprecate mac99 with G5 CPU
Content-Language: en-US
To: BALATON Zoltan <balaton@eik.bme.hu>, qemu-devel@nongnu.org,
 qemu-ppc@nongnu.org
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
References: <cover.1672868854.git.balaton@eik.bme.hu>
 <a5147317122bb760b1184cf73829fc6fce61e611.1672868854.git.balaton@eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <a5147317122bb760b1184cf73829fc6fce61e611.1672868854.git.balaton@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -37
X-Spam_score: -3.8
X-Spam_bar: ---
X-Spam_report: (-3.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.708,
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
> Besides resolving the confusing behaviour mentioned in previous commit
> this might also allow unifying qemu-system-ppc and qemu-system-ppc64
> in the future.
> 
> Signed-off-by: BALATON Zoltan <balaton@eik.bme.hu>
> ---
>   hw/ppc/mac_newworld.c | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
> index 3f5d1ec097..f07c37328b 100644
> --- a/hw/ppc/mac_newworld.c
> +++ b/hw/ppc/mac_newworld.c
> @@ -165,6 +165,12 @@ static void ppc_core99_init(MachineState *machine)
>           qemu_register_reset(ppc_core99_reset, cpu);
>       }
>   
> +    if (object_property_find(OBJECT(machine), "via")) {
> +        if (PPC_INPUT(env) == PPC_FLAGS_INPUT_970) {
> +            warn_report("mac99 with G5 CPU is deprecated, "
> +                        "use powermac7_3 instead");

"mac99 machine with G5 CPU is deprecated, prefer the powermac7_3 machine 
instead"?

> +        }
> +    }
>       /* allocate RAM */
>       if (machine->ram_size > 2 * GiB) {
>           error_report("RAM size more than 2 GiB is not supported");


