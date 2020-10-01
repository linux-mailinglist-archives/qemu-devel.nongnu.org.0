Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3745280484
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Oct 2020 19:03:23 +0200 (CEST)
Received: from localhost ([::1]:51130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kO1zG-0004D7-Ns
	for lists+qemu-devel@lfdr.de; Thu, 01 Oct 2020 13:03:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kO1ol-0000Oo-S2
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 12:52:31 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:33094)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kO1oi-0007WP-I1
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 12:52:31 -0400
Received: by mail-ot1-x341.google.com with SMTP id m12so6154719otr.0
 for <qemu-devel@nongnu.org>; Thu, 01 Oct 2020 09:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WllKs0I3my9cYwDSsc3EIK49l0UtkmJgmgiKej2O+cQ=;
 b=qjST6zQEB4RwFoJaooQq/Z+VIkW3wUz3zvlMYefzm5agfwj2cWpV7qSXlIjqzcJQ+j
 kbFszTZJ0GBraBDzWj6aDWRDB+ovqzz8uyrM9mlgHmo3pvijLmLVL7QP6e82DUOXNPKm
 70IGj2JLLbZTPXI557pG6AtHVHwA11Ty2WjP03sWUoHi6OdVUrM7SH7s03hdtb+pSg0k
 x/Qx8exSIYr8FyUHZDtLGSkSi4uXkvH97y5DrepxVitMk0Xz8Qf/KbE+vPjXF+g63TX2
 91ecVa6+YQ5RIq30n6F45T+MpTXOcw15cshmfePAZxzsopXy0jWltRKl7Jmaxg90AJBx
 NyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WllKs0I3my9cYwDSsc3EIK49l0UtkmJgmgiKej2O+cQ=;
 b=VPbvAkgDMs+VG0n7zom5AvDF8VpUybxj2Wc5gsMZUGNRXH9qycJfBeSlQvjE+1pJF3
 Q03L4aPY0GGM6mosyL5We2g3EEdrXeNZ6kVP9s+Xz/3DRGZ4rQfuG8LXZ/GlWHnrPt4R
 /NH+7TNY1GSp5L6X5BqKDBY8QakMRoGPn9eFkX4Zca4dWcGFn0ILjY66jcj9AY6kOy04
 pe8nBoqSnbJ2Y7hMZJf7hLf57NGsRcMusTTqovl8OdZKp1T1WvU2OkPFX6aeHxBfSLLH
 7yx4080NbcD0+Jkm+pFUUo7KA8CTPns3G1tKBfX+0enuIbrcNNB2JYIhO28yiHjClWWA
 LvVA==
X-Gm-Message-State: AOAM5306Y5RbSkkoEmt4twBoaWMuWMWKYVTsRGg1LeSRVsHPspNlROHw
 0jc+AxQW8YgiRgRZ6JFHuj4E6A==
X-Google-Smtp-Source: ABdhPJzlJ09kVIg7jRIeiKCsG9IiflWxNQUOYXQhxy6J+ptBYLf2Pb9m7z8lYgPKHWth0SR+3xkbng==
X-Received: by 2002:a05:6830:101:: with SMTP id
 i1mr5734769otp.300.1601571147317; 
 Thu, 01 Oct 2020 09:52:27 -0700 (PDT)
Received: from [10.10.73.179] (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id g18sm1315361otg.58.2020.10.01.09.52.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 01 Oct 2020 09:52:26 -0700 (PDT)
Subject: Re: [PATCH v1 20/20] s390x/cpumodel: Bump up QEMU model to a
 stripped-down IBM z14 GA2
To: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org
References: <20200930145523.71087-1-david@redhat.com>
 <20200930145523.71087-21-david@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <8e4265c9-ce4e-05e2-14e4-57623b0ca1ec@linaro.org>
Date: Thu, 1 Oct 2020 11:52:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200930145523.71087-21-david@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.26,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/30/20 9:55 AM, David Hildenbrand wrote:
> TCG implements everything we need to run basic z14 OS+software.
> 
> Cc: Christian Borntraeger <borntraeger@de.ibm.com>
> Signed-off-by: David Hildenbrand <david@redhat.com>
> ---
>  hw/s390x/s390-virtio-ccw.c  |  2 ++
>  target/s390x/cpu_models.c   |  4 ++--
>  target/s390x/gen-features.c | 15 +++++++++------
>  3 files changed, 13 insertions(+), 8 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~


