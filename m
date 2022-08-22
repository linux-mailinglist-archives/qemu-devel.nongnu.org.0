Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1564A59CA67
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Aug 2022 22:55:01 +0200 (CEST)
Received: from localhost ([::1]:39290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQERn-0005CE-Hr
	for lists+qemu-devel@lfdr.de; Mon, 22 Aug 2022 16:54:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35848)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQEO2-0002da-N0
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 16:51:10 -0400
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629]:42787)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oQENx-0007W3-DE
 for qemu-devel@nongnu.org; Mon, 22 Aug 2022 16:51:06 -0400
Received: by mail-pl1-x629.google.com with SMTP id v23so5726305plo.9
 for <qemu-devel@nongnu.org>; Mon, 22 Aug 2022 13:51:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc; bh=Bm5tfyV84cHYhu2DBBV8ZWjNjFrQlmAFYnytFPqYNFQ=;
 b=CqNClTWIKb4dx66W0NEqaFJtMlbIQmUIyQtaCPWe1Xdr3tngOualukj9KXv/PD4IqT
 B6f1omqJc1Cy5Tw6sQ05lSWMmFZImSbd6HaeBth354B70h+J1kcs5eMtmPYlW+Rtuw0R
 +/IjKL4ZJZyMviEipDqUKk6hICHDjgLOCh/bEXqSOtb7tMEGbyC/G71y2XO4OXtq8MfQ
 0JLF6WwKbKGuY3JLanfJwXnXa+9d8lbeT0vbhErqyZ0KpgG+/8vh44QqNKsNPP7G7pwY
 ZXy86Nd3Vfn5D419vYBENMd3a2VaoWAkNDINfgixObdwtO0pub/H1HCbFEIMwTpGmTOe
 bw3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc;
 bh=Bm5tfyV84cHYhu2DBBV8ZWjNjFrQlmAFYnytFPqYNFQ=;
 b=LT0BLWtG1gAf3SeTW1+kApVWSghyDRgswocDCoix4q64VuGobl+VTLNI5MVwicDxTj
 jjg9RFl/qQOoqsrHDnFZ2MKI0C5Dbbuxx4omETaAYcPVo+bsRnybWxRjPZ6RoGJrKalD
 o6MTzoLU1tsDWNQE90c/GPSjuijg+OGjjCpg6uwF/UgIb7v7n93+hqoozX0646LkTDOd
 1Rx5BpQjohzg9GSokrJe3Lc1SDfXFqpqN3Nu0EvBoCkj+DEmTe8w3sb2pLp45w3Y2+7B
 ni27PwUZRcgOknynRssuDplaPaTVkAo8sKBFk+XATdgylPAxyTzMsUFwjLCEBm0dSwXn
 HLGg==
X-Gm-Message-State: ACgBeo3vdJ+CoqEq5/EuFzEZF4gki3ACjgk4/TQzgjLg0jN8OXhGKSAs
 AS9EdYAWeRUfjsoHbF/CihZwYw==
X-Google-Smtp-Source: AA6agR65MWJpnXPfooifptulioIkZbx9xEoOK+tnJHxNkQ3lN9YhB4mP8O2LAFT33VYvOKFooEMZxw==
X-Received: by 2002:a17:90b:4a4d:b0:1fb:1a80:4d18 with SMTP id
 lb13-20020a17090b4a4d00b001fb1a804d18mr129587pjb.205.1661201460168; 
 Mon, 22 Aug 2022 13:51:00 -0700 (PDT)
Received: from [192.168.0.4] ([71.212.157.236])
 by smtp.gmail.com with ESMTPSA id
 s6-20020a170902b18600b0016d763967f8sm8794450plr.107.2022.08.22.13.50.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Aug 2022 13:50:59 -0700 (PDT)
Message-ID: <b2d0a37e-0db3-586d-1050-4862375f6748@linaro.org>
Date: Mon, 22 Aug 2022 13:50:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v1 1/6] tests/avocado: push default timeout to QemuBaseTest
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Cleber Rosa <crosa@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Beraldo Leal <bleal@redhat.com>
References: <20220822165608.2980552-1-alex.bennee@linaro.org>
 <20220822165608.2980552-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220822165608.2980552-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::629;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x629.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 8/22/22 09:56, Alex Bennée wrote:
> All of the QEMU tests eventually end up derrived from this class. Move
> the default timeout from LinuxTest to ensure we catch them all. As 15
> minutes is fairly excessive we drop the default down to 2 minutes
> which is a more reasonable target for tests to aim for.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20220816133831.2166761-1-alex.bennee@linaro.org>
> 
> ---
> v2
>    - lower timeout to 2 minutes/120 seconds

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~

