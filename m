Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D93B23C1A90
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 22:34:36 +0200 (CEST)
Received: from localhost ([::1]:56032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1ajD-00030A-KY
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 16:34:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40760)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1agZ-0000ks-Lu
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 16:31:52 -0400
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a]:43742)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m1agW-0004j4-En
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 16:31:51 -0400
Received: by mail-pg1-x52a.google.com with SMTP id y4so5049063pgl.10
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 13:31:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=7PyV8Cz4mnwhkXxQgr1gICfkPYK8UZO8vTv2t3X4G5o=;
 b=oGEXVnVMyFRzoOK/WUGBvfyLIwvFL6NuI97+HSQJNKAWrjFNFN5+fm4OgR59OVF2lI
 5Sfb6VOhqpp4qevli1/6wzGG06X8bAuOj2yy6ZBvAm+zEh6k0GMSSeffoVJQcZ2W2hSN
 LsCUCA/JXdB4OLB2fM+mmVi1CaDDPDovgfxbyiHPTWRv15ybyNCSEsdNmlvj3K82csn6
 oo3zfhIlPVm2Qse2rxVaUMwKMkl9XPvlWHqaYuLrxJEd/MixKspH0LqS3mVhEkTxkVTl
 sEcR0u2d3C51K7uceVfmYhVmyAwA/Ih4BfzTYvrfqhetBNVnJP6X+zA8F5FHUeB5vVrO
 vOZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7PyV8Cz4mnwhkXxQgr1gICfkPYK8UZO8vTv2t3X4G5o=;
 b=RYwLUxOx1A2L7RZ6E2y2fFDk7XBBiiyFzh43WeYdOR4TPRbxRIlPOShyS7nEV/M5fI
 dzhSt8PD0zM/sj+dvkG+ydXIr9oh6DmYEcvqWJ5dmhQ8cMiI24ncK30EkjliRaghRJ6v
 kueQF7DQPzY9LQFz30ZYpGIk6PAd7wOTzomfoya9QC8SW3VShQ2fC9NcsnIYTfr3GzuS
 yU3f/yTZOsdrzu5kZ8WckJq+4fUs+IDs6wR4fWl6Le40E/PpDz8gYi4AQk4bsBjU8cRi
 71Q08KTccKNslrLSMff/w0pvuL9hygWYSJNeyu0gDUH1HGu0RscvEpNYbzqThY2Xg4nm
 vWxg==
X-Gm-Message-State: AOAM531uYjBIznjG7yFv67ziuVfXUbau5V6RkiKZc4cbLWpx7JzJShIe
 R7eNhA4d4p3i35EbwokqacS3zA==
X-Google-Smtp-Source: ABdhPJwdOM2RUVmYN8v54cof5V2Wwb1sMNk+RWVKO08AeTBjQG0XGf5wJiCtnhrwfI4qIxeP+ny0pw==
X-Received: by 2002:a65:64cf:: with SMTP id t15mr30676742pgv.131.1625776306962; 
 Thu, 08 Jul 2021 13:31:46 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id q18sm3733188pfj.178.2021.07.08.13.31.46
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 08 Jul 2021 13:31:46 -0700 (PDT)
Subject: Re: [PATCH v2 28/39] meson.build: move TCG plugin summary output
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
References: <20210708190941.16980-1-alex.bennee@linaro.org>
 <20210708190941.16980-29-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7f650692-de85-cd00-fe02-79c2e5f660d8@linaro.org>
Date: Thu, 8 Jul 2021 13:31:45 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210708190941.16980-29-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: fam@euphon.net, berrange@redhat.com, pbonzini@redhat.com, f4bug@amsat.org,
 robhenry@microsoft.com, aaron@os.amperecomputing.com,
 mahmoudabdalghany@outlook.com, minyihh@uci.edu, cota@braap.org,
 stefanha@redhat.com, crosa@redhat.com, kuhn.chenqun@huawei.com,
 ma.mandourr@gmail.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/8/21 12:09 PM, Alex Bennée wrote:
> Let's put it with the rest of the TCG related output with the
> accelerator.
> 
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   meson.build | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~

