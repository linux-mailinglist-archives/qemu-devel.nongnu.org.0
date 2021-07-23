Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17D133D34CA
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 08:44:38 +0200 (CEST)
Received: from localhost ([::1]:40192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6ovF-0003S3-0l
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 02:44:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47378)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6oto-0002BT-Nk
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 02:43:08 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:44598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m6otn-0004nY-BK
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 02:43:08 -0400
Received: by mail-pl1-x635.google.com with SMTP id c11so2007551plg.11
 for <qemu-devel@nongnu.org>; Thu, 22 Jul 2021 23:43:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=4EzngzqHEngh+EHPfDE1XgtTBba+7xpJ07Hh2W/ftBw=;
 b=gWDcE+yfXh7k4wIz/zJ9tOrQf2d7yJTXddHo0lyATuQ5dorRrS7/cuN666VUyUxTW4
 lg5mW6WJDUsiDWK3I5Vlrt9Wx2q/Vj+o1j6w19mxue7XXXunYcph1ZE2m63hD/k6KRso
 DXBo8U0T2ISFs0aVSxs+EOWQrrLsFlutNQuZEQgPtWiEC4kzpKaoN13wcWENX+iQroaI
 sLGNArzjm7lm5NN9qFUjElkP5kT9tWv7g/nGj/c+2W9Pama4W1ZI7akW7F5j1CL0zmTV
 sPN1xSP1/cdwNv3NNCkLmSVdvT8LbYZeam/rP6/pgKxK8wdMKWAaBjerKU2gDfIgeaaZ
 S3Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4EzngzqHEngh+EHPfDE1XgtTBba+7xpJ07Hh2W/ftBw=;
 b=fsXXDqgjEYN1LHHsBILID48cWl/Yq2EJawusWWHyK+9miigAOWsPdwSFsgTtXGN6xe
 4I3aLZGkEMkbLTXSDy7s2ozf1USoR2xz/Of/LbRNpq50870b3Z5KPVH18hgPNhesPG8J
 lGkbsNdOPic/6fZbOAHiEOOuEuuHACCNVmN/vv5XYfw3OH9NJENzUn6n3ssFQflTz+2b
 5C8w1YdrOxy2qNwbgBqPHfgb50+uoNW1QoJPaJS5hYujdPlwnyag8dKVFCEh0dBfuFSh
 Ua6QlZcdKXDwAuw2n35ZNGSHxucVFfWZIMOUr5t8bBB92P+LS4nDNLr+/mJxZVpknIq6
 mAGA==
X-Gm-Message-State: AOAM5334KIJBESg03X/zUmYwXXZBhm5mtxPJZ9wC+8sinPdeX/Ut1l0S
 8dr+I+UR5r6jLz5nr3fEsgZzZg==
X-Google-Smtp-Source: ABdhPJx9kUvuqPJVeDgP8tYkEytB9r6hP1Dtsttw1DG5djr+jxtieMYmv2LnmE20ZLltNZAzdGUQsQ==
X-Received: by 2002:a17:90b:1d84:: with SMTP id
 pf4mr3273356pjb.166.1627022585772; 
 Thu, 22 Jul 2021 23:43:05 -0700 (PDT)
Received: from [192.168.3.43] (204-210-126-223.res.spectrum.com.
 [204.210.126.223])
 by smtp.gmail.com with ESMTPSA id w145sm21837235pfc.39.2021.07.22.23.43.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Jul 2021 23:43:05 -0700 (PDT)
Subject: Re: [PATCH v2 21/22] configs: Add loongarch linux-user config
To: Song Gao <gaosong@loongson.cn>, qemu-devel@nongnu.org
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
 <1626861198-6133-22-git-send-email-gaosong@loongson.cn>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <34da9ea2-e57a-ad73-f75a-98061ebf49f5@linaro.org>
Date: Thu, 22 Jul 2021 20:43:01 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1626861198-6133-22-git-send-email-gaosong@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.203,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 philmd@redhat.com, yangxiaojuan@loongson.cn, laurent@vivier.eu,
 maobibo@loongson.cn, alistair.francis@wdc.com, pbonzini@redhat.com,
 alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/20/21 11:53 PM, Song Gao wrote:
> Add loongarch64 linux-user default configs file.
> 
> Signed-off-by: Song Gao<gaosong@loongson.cn>
> ---
>   configs/targets/loongarch64-linux-user.mak | 3 +++
>   1 file changed, 3 insertions(+)
>   create mode 100644 configs/targets/loongarch64-linux-user.mak

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

