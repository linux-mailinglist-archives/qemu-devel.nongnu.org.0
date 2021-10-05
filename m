Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF1B4421C76
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Oct 2021 04:13:09 +0200 (CEST)
Received: from localhost ([::1]:52586 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mXZx6-0003db-Dr
	for lists+qemu-devel@lfdr.de; Mon, 04 Oct 2021 22:13:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mXZvt-0002n6-Tt
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 22:11:53 -0400
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531]:35418)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mXZvs-00017j-F9
 for qemu-devel@nongnu.org; Mon, 04 Oct 2021 22:11:53 -0400
Received: by mail-pg1-x531.google.com with SMTP id e7so18364210pgk.2
 for <qemu-devel@nongnu.org>; Mon, 04 Oct 2021 19:11:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=WxKHVOeYBjd/aLonSickU5PG46ru71Q4oFUJ5fIQa+k=;
 b=RdUcWq5tX9859OMYPRyW+7G2x68xanQ2tKedkyKBOcuIpY6aj3XIK8yitnLanymXgG
 Ax5BtmOEkesTsM2kPOU4IuImwAcGvwW44Xbj7CkAE9s6/XU4c7OXlHNYlNOvMpQD5P/Z
 pnshaQwzwuFQgjpUGZwcgrOyNuEReMwRP1ZrNFseeyeHEQjB51+cZQGJyT08HRrRHJ/L
 /rSTXjA3jlgG48s8uxixXe7foCGu9E5L9IQN8spaKXlDbvaeCHKikGgAXd4UKWUHjFg0
 OI2l8Bcf3bWkDnCeVpgfzksSFqhWfT6yBwUTQtZBFjFAFHmlKqo/JCaFSd2/rpOEZTei
 6adA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WxKHVOeYBjd/aLonSickU5PG46ru71Q4oFUJ5fIQa+k=;
 b=IZ8y6b1x1LiQs1mlIKHCY/2eZjsRnW6ymciFQyGMmGh02oXT1VuWz1qY/fhtmcHUaW
 JHRTF6PPj5PrLJ4d841XZQUMszphEb9HDjpmG5ilj3q6GLKZCbSHw/YaH5QSnVSlWVbF
 7tkKYuoNDTPiBbo6cGmHU/kXICCTKJyjcM4r3EjLKAtwukZr7YLDiWM/pRs6kB3GOZxc
 bY9Q5/ttcokp772NvzbgOGJ5hD74i4DvfbAM5Vg0dYuelBJiENv/ZrTc3/5iuHRKAhjj
 Ga8dptblXPp1Tiw8Ykvc32nW9qDYrSypX0on+ESMaZeK1PHvJTRTBVNklQBTYRgypqOO
 1nTw==
X-Gm-Message-State: AOAM533iPRj62siojwW3iJycPx0XulTObt6N83sYSZgatmObYroh3dmt
 HEnEftPyIrE4r7cFsRE264WaKC2Dv6wR4g==
X-Google-Smtp-Source: ABdhPJwR14Lm3JkquuIzi0F5o4QAehntjLcBboiEI4StevfZ9Qw5OHNYdK1dicpvjZOncAkFToMY7A==
X-Received: by 2002:a63:e64a:: with SMTP id p10mr13825537pgj.263.1633399910057; 
 Mon, 04 Oct 2021 19:11:50 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id n185sm16282557pfn.171.2021.10.04.19.11.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 04 Oct 2021 19:11:49 -0700 (PDT)
Subject: Re: [PATCH 0/2] tests/docker: Fix fedora-i386-cross
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
References: <20210930163636.721311-1-richard.henderson@linaro.org>
Message-ID: <5f5f5fd2-102e-1f35-e610-fa94c175053d@linaro.org>
Date: Mon, 4 Oct 2021 19:11:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210930163636.721311-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::531;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x531.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 9/30/21 9:36 AM, Richard Henderson wrote:
> Richard Henderson (2):
>    tests/docker: Remove fedora-i386-cross from DOCKER_PARTIAL_IMAGES
>    tests/docker: Fix fedora-i386-cross

Queuing to tcg-next, just because I'm preparing a PR.


r~

