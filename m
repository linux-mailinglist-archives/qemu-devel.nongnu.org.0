Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45E305661DF
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jul 2022 05:32:03 +0200 (CEST)
Received: from localhost ([::1]:37898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8ZIA-0002aW-Db
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 23:32:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ZGc-0001Zq-IA
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 23:30:28 -0400
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e]:36730)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o8ZGa-0004ZH-Os
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 23:30:25 -0400
Received: by mail-pg1-x52e.google.com with SMTP id s206so10315207pgs.3
 for <qemu-devel@nongnu.org>; Mon, 04 Jul 2022 20:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=Md8LNZoR4D2WEeNV53PRaAMbC7DrT8tsDMf/eYLSS+U=;
 b=mBI8AePlRgTpIYc+MvVuM5OwG4q3KfDIKlfSWd+VTMr3RdLw5bui9LYq/YJ5BKXZS+
 /FmRW1NV6Q1n7lIbQtXlXvgN2AFOSJBmGDZsmyB/nU/4GJBx7zQDXcwBaPPiYne+9Pld
 PArcTCbBfLH2wDgskfT793JM1JWVCka68Q2cBFchRfVTqnS4R0O1lTI19XyaodU2gZZp
 j7s2Tm1DYZUkv7H+q9ajLqYSg6+Oc3muVIAOTk0fWKf7Zt526GY7abJFcq5T8KktebZR
 Cjq7ltxoZ0olluVlkkE2VzeX6zfeccBBskhqr/6xy9BR5nUfU8vVZy+qxnAr6Q1mx9M7
 wBnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=Md8LNZoR4D2WEeNV53PRaAMbC7DrT8tsDMf/eYLSS+U=;
 b=1mZDfx9IXs2u+7WpiwL619hvR/oAIy3KH3TVx/W1133fjKPZt158GBVRFRac72AYVI
 TgyoUbUJv9tNwTN9E8iZ12mnIUi6nWlCuyehUzWNre9pctNZT/SCXH8zMIUNnCt8eDEg
 b0aOHfyH/niQ3RtqZ6CkUQ406h0FKvpUk8muWyqFsd0K7fe5RVLCQ/GB/I0XpXgdat7q
 jENGbaK019FsykL3YAoRoHAeORN7itE3/oiwwqN82xDfiy4oB6TAyCG+KDNvpsY/pxaa
 vvsid4cGkPwdoU/VshTz3qUS14uVj022QgRMbUW6Ce5drfP9WyP15kviAQIO4uOpvzZy
 jpDQ==
X-Gm-Message-State: AJIora+NTtOdB8mvf/70R/8JaY4XzkCqxC/xh/BI6xLDV+F9+iV8hNVe
 09Iov0xZ8uLEbIJ3m0PCx5piBw==
X-Google-Smtp-Source: AGRyM1sqnepSfdBfWYNH+PZqUvBPfnzYB8S838qODzRbfpunAOs5Ha6vExCPqVPa1xSWHxIaXaWQog==
X-Received: by 2002:a63:195d:0:b0:412:50b8:c410 with SMTP id
 29-20020a63195d000000b0041250b8c410mr6015056pgz.520.1656991823280; 
 Mon, 04 Jul 2022 20:30:23 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 g10-20020a170902934a00b0016a11b9aeaasm21900255plp.225.2022.07.04.20.30.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Jul 2022 20:30:22 -0700 (PDT)
Message-ID: <1dcf1ad6-eb4e-5c20-b8f7-254eca7f58df@linaro.org>
Date: Tue, 5 Jul 2022 09:00:18 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v4 37/45] linux-user/aarch64: Do not allow duplicate or
 short sve records
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-38-richard.henderson@linaro.org>
 <CAFEAcA81Xc0kXrYTeq+Ck4b9vwu7jOAMerS0s_L0HaqyvfUcJg@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <CAFEAcA81Xc0kXrYTeq+Ck4b9vwu7jOAMerS0s_L0HaqyvfUcJg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52e.google.com
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

On 7/4/22 17:38, Peter Maydell wrote:
>>           case TARGET_SVE_MAGIC:
>> +            if (sve || size < sizeof(struct target_sve_context)) {
>> +                goto err;
>> +            }
>>               if (cpu_isar_feature(aa64_sve, env_archcpu(env))) {
>>                   vq = sve_vq(env);
>>                   sve_size = QEMU_ALIGN_UP(TARGET_SVE_SIG_CONTEXT_SIZE(vq), 16);
>> -                if (!sve && size == sve_size) {
>> +                if (size == sve_size) {
>>                       sve = (struct target_sve_context *)ctx;
>>                       break;
>>                   }
> 
> On the other hand, the kernel seems to happily allow records
> which are larger than the SVE_SIG_CONTEXT_SIZE, whereas we
> ignore the record unless there's an exact size match.

Yeah, this gets fixed properly in patch 39.
Perhaps I should simply squash this with that?


r~

