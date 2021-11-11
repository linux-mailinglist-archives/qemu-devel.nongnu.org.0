Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 230B844D831
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 15:24:14 +0100 (CET)
Received: from localhost ([::1]:33260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlAzt-0005TJ-7D
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 09:24:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlAua-0005Y6-MA
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:18:45 -0500
Received: from [2a00:1450:4864:20::42e] (port=41551
 helo=mail-wr1-x42e.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mlAuZ-00073f-84
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 09:18:44 -0500
Received: by mail-wr1-x42e.google.com with SMTP id d3so10062465wrh.8
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 06:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=rR+as4B02cSG8PAM14uaiyuoGrHj1v1dYcwDv0GrCrA=;
 b=R2mN2lrmkZlC2YJqP20wzLJOBd1PwSjmRiUytSsDh/7Jtnf0mMiucwBligD4xATdPi
 7OlN6uXIin0a2gwuTRh1RoF4PAsh98c2t4omXFkanRp4oKVfIquIbiWqnGxMbbZDRPhp
 rKb/RBvMZ6PAext8X5lYKiB65N38rj7Ab8VQbmKCehzgYFNNfwOxi+w7nTenvUoTL3hf
 SvS+LxGO6lC9AG7mMm8Svsd9ZXZ/Ah4KmFMIgZpx/Q/GCIngyOyl3kaJPgUth8b4SceZ
 iEe1YaFaC9ZHoKhwoMImEUjx5PUgV1By8rkaLGo77BhIBL/AHkF0t/UVjjiWOBBPUhVm
 VYPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=rR+as4B02cSG8PAM14uaiyuoGrHj1v1dYcwDv0GrCrA=;
 b=J58lUqwkDA/4eUuG/F7ZPNmFOW9UFnjaISY9EE+zsvcx8iicFLxheE/gDd0GjFRblE
 bdIcj2P1NkvSbayM5tHo6dQdCxeuNQQ/x0BOagOgKO5ROrmOwS0acSqkKuZV6RAP5dbE
 /R1AZaAaSRO9yM6RwgR+ASIVdjMAAgdPxqPV/WmpTQrVjNGm/2PVSG9oKmTKHh4+SsZx
 mSQrIdeeTjCEYK8DLqOJmtTcbqREBd1SW4Z67q+EwWv9gTOyCrSLY9NBXYgXsaVcoKIM
 8G2lV0ufppinrf1Ff6OA4G8SJuL27IEWfCNP74Q+rQOQwHG1jEKsWnMijVqe03bT94Dq
 iFGA==
X-Gm-Message-State: AOAM533Alz7W8sc6HFCWf2MADuQ8wEG+Ld9QrE4/ZD+WfF7IYKfTOKqK
 LEINxkm+CRFI97yEAit/t7uAjA==
X-Google-Smtp-Source: ABdhPJy7GB/BHVo/It8agXuqynUMYeu81mW+VmvW36Xbma/pxzPHdkhi9tlRBxqjsyrACElrMlCVNA==
X-Received: by 2002:a5d:6d07:: with SMTP id e7mr8907566wrq.311.1636640318080; 
 Thu, 11 Nov 2021 06:18:38 -0800 (PST)
Received: from [192.168.8.106] (10.red-95-125-227.dynamicip.rima-tde.net.
 [95.125.227.10])
 by smtp.gmail.com with ESMTPSA id j134sm3068639wmj.3.2021.11.11.06.18.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 11 Nov 2021 06:18:37 -0800 (PST)
Subject: Re: [PATCH-for-6.2 v3 3/6] tests/unit/test-smp-parse: Explicit
 MachineClass name
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211111100351.2153662-1-philmd@redhat.com>
 <20211111100351.2153662-4-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1998737b-dc37-11bb-746f-26f55c5cc2f7@linaro.org>
Date: Thu, 11 Nov 2021 15:18:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211111100351.2153662-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42e
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -52
X-Spam_score: -5.3
X-Spam_bar: -----
X-Spam_report: (-5.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-3.999,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Yanan Wang <wangyanan55@huawei.com>, Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Andrew Jones <drjones@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/11/21 11:03 AM, Philippe Mathieu-Daudé wrote:
> If the MachineClass::name pointer is not explicitly set, it is NULL.
> Per the C standard, passing a NULL pointer to printf "%s" format is
> undefined. Some implementations display it as 'NULL', other as 'null'.
> Since we are comparing the formatted output, we need a stable value.
> The easiest is to explicit a machine name string.
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@redhat.com>
> ---
>   tests/unit/test-smp-parse.c | 8 ++++++--
>   1 file changed, 6 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

