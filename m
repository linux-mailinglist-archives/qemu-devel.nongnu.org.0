Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 152E84CE15E
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 01:12:16 +0100 (CET)
Received: from localhost ([::1]:51624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQI1v-0002gA-6q
	for lists+qemu-devel@lfdr.de; Fri, 04 Mar 2022 19:12:15 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQHyO-0006TF-Fz; Fri, 04 Mar 2022 19:08:37 -0500
Received: from [2607:f8b0:4864:20::102c] (port=42698
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQHyL-0004no-RL; Fri, 04 Mar 2022 19:08:36 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 c16-20020a17090aa61000b001befad2bfaaso8858564pjq.1; 
 Fri, 04 Mar 2022 16:08:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Vsa6OzeO3hBgIvsWZZsXcj8LqocNWuxfoQVPy8ol4iM=;
 b=ICYUEnTn21niiC5ehqsq576NsXXjiia835TCv6rPiCxWEPVo916gdvldZ7ydaX5QXd
 yTRrpWvzZwBRXFj4yjXFmKdhLiGJFRNJbIfOzANcHHZcyWmKjnv9AzCwrH+PsJENqRA6
 4rGBAAET4EZyfrKB+tQNrz3RySKXegdag7bEpQ9K9civZV9ByPVLlusogP+a1mqow0XX
 MuAYBNlsVWiNCUd62dy0VxaLxHQsnPivBAAsiD8i1yDVEVBuRmfK7bZHbTvulyjJIjh7
 W78RwVJ85LOhBRFqm71gRgrIbcK8XZ6XMazX078/zdTtVdK8CDSAd5G9WqCGbdkZS3Mu
 FAbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Vsa6OzeO3hBgIvsWZZsXcj8LqocNWuxfoQVPy8ol4iM=;
 b=7za670fV6FwLm6mmpRowklpvjrauSUOyWr7yO2LBk/h+ZahwXE+bG4eoqCJJWKp5je
 j8dj7p3u2jjkKE8QhiBO4AqdhaatenNBRTZuaKvSbuPKMundLRFlMMuOeGBFoAxeNB7a
 GH+v7HOEs8RyC6NyFdmOnRGWrHbU74cVG5GvpxOJT/ARs2dL+Sd/SJp9iId0IOWLcSVT
 NC7p8JJ2SnsWYwRNfWyPtEMh4Mirub9US2kJ/4+3AEZEkZKFZ8Akdb4f8YfvjbmgXkda
 88dAU4Jyw3ygv2XlNe+a/b1EM6QJbdyqtOz9a6aWiE2o1cY01iN8SdL9Oshtt8zP/izS
 u23g==
X-Gm-Message-State: AOAM531jllSoNLDpfJV4HxhveteWPu8O4ZOo5lXipGIh2jb6inJOu76f
 92kntAD47GEFaI9TMc46dmI=
X-Google-Smtp-Source: ABdhPJyjZFS4E5rcTwpyhaym+D1m0H2HFlwBa1NH7pTNQboL3lzttQ1qx0zhFlvqZtTUd7ov5fjsSw==
X-Received: by 2002:a17:90b:4c44:b0:1be:f4be:d69e with SMTP id
 np4-20020a17090b4c4400b001bef4bed69emr1133015pjb.163.1646438902871; 
 Fri, 04 Mar 2022 16:08:22 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 f9-20020a056a00228900b004f3ba7d177csm6849488pfe.54.2022.03.04.16.08.20
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 04 Mar 2022 16:08:22 -0800 (PST)
Message-ID: <8524997d-48a4-9a00-8d94-b6e4d922a82e@gmail.com>
Date: Sat, 5 Mar 2022 01:08:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v3 2/9] hw/i2c: pmbus: guard against out of range accesses
Content-Language: en-US
To: Titus Rwantare <titusr@google.com>, Corey Minyard <minyard@acm.org>
References: <20220302015053.1984165-1-titusr@google.com>
 <20220302015053.1984165-3-titusr@google.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220302015053.1984165-3-titusr@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, venture@google.com, qemu-devel@nongnu.org,
 f4bug@amsat.org, wuhaotsh@google.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/3/22 02:50, Titus Rwantare wrote:
> Signed-off-by: Titus Rwantare <titusr@google.com>
> ---
>   hw/i2c/pmbus_device.c | 41 ++++++++++++++++++++++++++++++++++++++++-
>   1 file changed, 40 insertions(+), 1 deletion(-)

>   static uint8_t pmbus_receive_byte(SMBusDevice *smd)
>   {
>       PMBusDevice *pmdev = PMBUS_DEVICE(smd);
>       PMBusDeviceClass *pmdc = PMBUS_DEVICE_GET_CLASS(pmdev);
>       uint8_t ret = 0xFF;
> -    uint8_t index = pmdev->page;
> +    uint8_t index;
>   
>       if (pmdev->out_buf_len != 0) {
>           ret = pmbus_out_buf_pop(pmdev);
>           return ret;
>       }
>   
> +    /*
> +     * Reading from all pages will return the value from page 0,
> +     * this is unspecified behaviour in general.
> +     */
> +    if (pmdev->page == PB_ALL_PAGES) {
> +        index = 0;
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: tried to read from all pages\n",
> +                      __func__);
> +        pmbus_cml_error(pmdev);
> +    } else if (pmdev->page > pmdev->num_pages - 1) {
> +        qemu_log_mask(LOG_GUEST_ERROR,
> +                      "%s: page %d is out of range\n",
> +                      __func__, pmdev->page);
> +        pmbus_cml_error(pmdev);
> +        return -1;

This file returns a mix of 0xFF/-1 for error. It would be nice
to pick one. Adding a definition (PMBUS_ERR_BYTE?) could help.

Preferably with error unified:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

