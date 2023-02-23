Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7251C6A0C3B
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Feb 2023 15:54:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVCx2-0002Uw-9C; Thu, 23 Feb 2023 09:52:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVCwt-0002TI-Hk
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 09:51:56 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pVCwr-0002w5-VG
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 09:51:55 -0500
Received: by mail-wr1-x435.google.com with SMTP id c12so10889777wrw.1
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 06:51:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=G/Sf883dWVSEBJipFQyu9Fv3W3c/y/uap0xiXdGssr8=;
 b=CUjdxRc3k0Rhh121suaO2M568wXCwugzuVvVybCT6iykhXljA7hHHLGL1Y7rGF+eou
 +dlyMBC6fBbfdKhKMeTq9CCL70iQo8Pxge5/qeK9kdrMBJSK8trbjeHP93Oxoujqzhko
 qOGPjSfzeDAtsbBCbpYn2rWG25DqRgZdb0SZZJtgU100ezdt3o0lD9DPeSsWj+fkDVod
 4mLufvAgEYYGYZbX72yeCUXA3mwujxA630qClEDH6cwjmozjnb2qJSdNadau+id3yFWB
 3wqq2Oy6vJwr0rfa+6WuJss/KrkkzngmivfBZDpvEpR2Dk79VjBJkL6wiwsP8wHpYYgB
 y9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G/Sf883dWVSEBJipFQyu9Fv3W3c/y/uap0xiXdGssr8=;
 b=srR2WjzNQIeENN//DQhs7NWxH1OaLTTLg/W6/5gWpFFlUvqz1XMwR3M6wCyu7vb/2s
 /2MkwLvKBcUxzZ0I+zl2SfUZJs4SMFrdcSGckA564IXBevwBip7yq+gWSCTbsJ2XLgaz
 8Xy4VbuVfzyzOvdjHEMrSOx18CwCKC3LFJEcVRZiZJLnatk6oSDKy1TazjV0TGNeUIff
 mq21bQWoBWO64pc6Cuo13sjGPyAk2EDFR22P6DX/JSp5cQ8mXJcbReWKY6GaiEjapxD2
 CkKQqWcNS9t9t4eU5tvNOKET/ajqoZ258s9LxI+2dWq5S99LkbmbHFTxd4Wpwt+DxLEa
 0NzA==
X-Gm-Message-State: AO0yUKURPVT4o65bQ5DfwCoE68DAXAeQvUF3cGEZscR1YwiH1IrrmQaT
 xNcjM7EkiIimYOUIXVN/7bWIpQ==
X-Google-Smtp-Source: AK7set/JwZAiL/XZkRlHrtnkpJhjZNukgpq+bJfx/lYMK4+UdsdUaVywBFYtkJqy4MTHBTrOF9NeSQ==
X-Received: by 2002:a05:6000:98c:b0:2c5:5ee9:6b27 with SMTP id
 by12-20020a056000098c00b002c55ee96b27mr9945878wrb.13.1677163912151; 
 Thu, 23 Feb 2023 06:51:52 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 z3-20020adff1c3000000b002c559def236sm8483439wro.57.2023.02.23.06.51.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 06:51:51 -0800 (PST)
Message-ID: <1936bc67-0d87-14f9-452f-60c9d56dfda4@linaro.org>
Date: Thu, 23 Feb 2023 15:51:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH 2/5] scripts/checkpatch.pl: Do not allow assert(0)
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Eric Blake <eblake@redhat.com>
References: <20230221232520.14480-1-philmd@linaro.org>
 <20230221232520.14480-3-philmd@linaro.org>
 <2352caa0-ae10-1807-d055-6bd7757113e8@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <2352caa0-ae10-1807-d055-6bd7757113e8@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.09,
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

On 22/2/23 04:53, Thomas Huth wrote:
> On 22/02/2023 00.25, Philippe Mathieu-Daudé wrote:
>> Since commit 262a69f428 ("osdep.h: Prohibit disabling assert()
>> in supported builds") we can not build QEMU with NDEBUG (or
>> G_DISABLE_ASSERT) defined, thus 'assert(0)' always aborts QEMU.
>>
>> However some static analyzers / compilers doesn't notice NDEBUG
>> can't be defined and emit warnings if code is used after an
>> 'assert(0)' call. See for example commit c0a6665c3c ("target/i386:
>> Remove compilation errors when -Werror=maybe-uninitialized").
> 
> commit c0a6665c3c only uses g_assert_not_reached(), so that looks like a 
> bad example for your asset(0) case?

Oh right. I'll simply remove [See for example commit xxx ("xxx")].


