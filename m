Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F1765D28E
	for <lists+qemu-devel@lfdr.de>; Wed,  4 Jan 2023 13:26:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pD2p3-0005Op-MH; Wed, 04 Jan 2023 07:24:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD2oz-0005Nm-Jy
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 07:24:42 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pD2oy-000259-2y
 for qemu-devel@nongnu.org; Wed, 04 Jan 2023 07:24:41 -0500
Received: by mail-wm1-x330.google.com with SMTP id g10so11625338wmo.1
 for <qemu-devel@nongnu.org>; Wed, 04 Jan 2023 04:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uHfx+GXmeRUIKhAG08iEYyhmQgwCl0Wnn8v8ItYHnfg=;
 b=Y/tVOag/abCmjFlggtiqQck98Sy86dfnMaToJKOgPtlHEOQFDKeeWWfrK8nKXuJx9l
 YuBtt4vy3SAIbJq2EHaCBzhT8aF88z9QKg3FISpKuJ9x7ZTDzskPouUva6INO92pujBd
 2xyXQOm0PdlqeP6ffLqnGQ2Gj3RzlKG94YXvgEs58kRkZ4fUrF/O6PBrkk49XqwApewX
 OKkLmSOSy9ve+cfvbxRZmp5Vq8dDqEZomN8c4JlDlcVsJHpeKA0GufCLgKvi5b09vJXh
 kah+EE86ZW5dUBz0536PptM8QS1mJZcEDszdkLtZzUknlDB/tzISWH3wBbOaCWNOPCf6
 gGig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uHfx+GXmeRUIKhAG08iEYyhmQgwCl0Wnn8v8ItYHnfg=;
 b=QcnIScoZCEG/PQZeLJmaMMYvcXTYUwCgxa16qJHj63QEbkpXzPlymNrwlH1GUUu95b
 QaSuFiEPy4jCZDBbABO7lrd8AipoXL6z4sVz+b9OQP3qRKAcsFsxtttseZRDT5qc1gBK
 shZeDbApYEF9XREJoWPZvd8CYH1pIPC8/LeXMWLfjpSNS66LTXEEHSpuMl79DHILtX2g
 24PWeaeNa2EgAN/8h9m2oGZmrn3vkU95JGGY/7FEybtWae6FnsbPNxZUDOO7oOwDaHjW
 KHbtna7oE5rcQIHqCGcVY1driVktEOV88rv6+0Y6Ftz/zycDj1Qx93NfFOaMZixroQmQ
 P7Ug==
X-Gm-Message-State: AFqh2kqIWNKXxIpQYB8QXUX53JFFj3C3lA5yIpI/9nDsX4VU57gIqdTB
 8hi03i6f1X748rnYd2V6PpOXEQ==
X-Google-Smtp-Source: AMrXdXv7exSnH45WMowWJ2bBUoewApU/VcY3idFHN8a3/Otz6Iv2Z9S3L0jCyTxwJC0XMHTynWPieQ==
X-Received: by 2002:a05:600c:42d4:b0:3d0:6d39:c62e with SMTP id
 j20-20020a05600c42d400b003d06d39c62emr34150575wme.12.1672835078310; 
 Wed, 04 Jan 2023 04:24:38 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 l27-20020a05600c1d1b00b003cfd4e6400csm49485803wms.19.2023.01.04.04.24.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 04 Jan 2023 04:24:37 -0800 (PST)
Message-ID: <6b317ca1-7f74-d140-b744-89e37c253483@linaro.org>
Date: Wed, 4 Jan 2023 13:24:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH] tests/qemu-iotests/312: Mark "quorum" as required driver
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>
Cc: qemu-devel@nongnu.org, Alberto Garcia <berto@igalia.com>
References: <20230104114601.269351-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230104114601.269351-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x330.google.com
X-Spam_score_int: -51
X-Spam_score: -5.2
X-Spam_bar: -----
X-Spam_report: (-5.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.103,
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

On 4/1/23 12:46, Thomas Huth wrote:
> "quorum" is required by iotest 312 - if it is not compiled into the
> QEMU binary, the test fails. Thus list "quorum" as required driver
> so that the test gets skipped in case it is not available.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>   tests/qemu-iotests/312 | 1 +
>   1 file changed, 1 insertion(+)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


