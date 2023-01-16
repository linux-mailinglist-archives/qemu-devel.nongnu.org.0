Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A4666B917
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 09:32:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHKuS-00077b-Cd; Mon, 16 Jan 2023 03:32:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHKuP-00073q-LB
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 03:32:01 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pHKuO-00021c-7p
 for qemu-devel@nongnu.org; Mon, 16 Jan 2023 03:32:01 -0500
Received: by mail-wm1-x336.google.com with SMTP id l8so2270249wms.3
 for <qemu-devel@nongnu.org>; Mon, 16 Jan 2023 00:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YvhgfjWJ9JY7kY8qVfhX+43YjXSG+rG6Zyi6y1j58Rs=;
 b=GpcdJjDSaMPX35Dclcv9THYgJAtZ+ArWwuJ6q9cMy/0WTSoDnwE+FYP4uvJnRflAui
 t5qaMJXTvYy2HHTeDOtQ8yQv+5XQcse1ylVs4UUiuZGNM9bbamPPlyTX6X0GsdVsKuAE
 tTNtFmjkd9/QjTUnJhoTQJK+4OkVh1Cf5pl6rIfi+I1yQUWCVot23dbvwwjPicS9HGI9
 JbawLPaXdVJ9wgr1ao635jO8nB8uX/l8oaJ97EHFwDf70xStAKx6KehmIm7vzxyvGY4R
 9BED4GgOTPJxYt7iuwmASVr/TRPBGnDAmN4Ls9lE/bBw6bum2ogOduib/JHOa3AFefaA
 Tbdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YvhgfjWJ9JY7kY8qVfhX+43YjXSG+rG6Zyi6y1j58Rs=;
 b=KlQ8Srj8q6BV73LhvvLwAgqpr+caY+lN5QOxWY/mUJ2e9qC+agVOeX5yjkNJGdLA5I
 y3XTR2a6eXbbD69W1gxK2rdvixyvGGOwhg/6WsM1VnUz0EVeRDcJqTG+k76eFdHtfX+B
 kL1syUlZaNM9Flk4RG7sDYrnHbfytcllC+D8doK+wxk1sT8bi0Tk5TGbuMtrOhwsm/um
 exO9IglHavreD1QcH50Kf3dUut9cQo88+JB1NqPwOZRPq8GiM18PDOI5YX1t47yicRs2
 QRwbwEjSNKPpNfjyTnsZJPhopqmADRbyfRYOqGxn4pkLD8DbA/he4O8zo+fBLjJvCFRG
 EJnQ==
X-Gm-Message-State: AFqh2kq4ICFymxaAxb9eD+FIrYog3xDj2Fjswd/Ga5maBE1SMvT95a2q
 /sr/fDNwJNPlqn61Cj3TYEJhGxU/y200lGtB
X-Google-Smtp-Source: AMrXdXtWePewG51WLlCFYBxuVdtc9oy2MaT6OP6CcyfmZZ3agUkszchdAHPjuF5a7vfV4g/xW0A+pA==
X-Received: by 2002:a05:600c:4f55:b0:3d3:5166:2da4 with SMTP id
 m21-20020a05600c4f5500b003d351662da4mr66437082wmq.8.1673857918943; 
 Mon, 16 Jan 2023 00:31:58 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 i2-20020adfdec2000000b002b9b9445149sm30699243wrn.54.2023.01.16.00.31.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 00:31:58 -0800 (PST)
Message-ID: <b9170dab-0e48-55c0-2314-013e5f65b9e3@linaro.org>
Date: Mon, 16 Jan 2023 09:31:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: Call qemu_socketpair() instead of socketpair() when possible
Content-Language: en-US
To: Guoyi Tu <tugy@chinatelecom.cn>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 marcandre.lureau@gmail.com
Cc: qemu-devel@nongnu.org
References: <cd28916a-f1f3-b54e-6ade-8a3647c3a9a5@chinatelecom.cn>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <cd28916a-f1f3-b54e-6ade-8a3647c3a9a5@chinatelecom.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 16/1/23 05:56, Guoyi Tu wrote:
> As qemu_socketpair() was introduced in commit 3c63b4e9
> ("oslib-posix: Introduce qemu_socketpair()"), it's time
> to replace the other existing socketpair() calls with
> qemu_socketpair() if possible
> 
> Signed-off-by: Guoyi Tu <tugy@chinatelecom.cn>
> ---
>   backends/tpm/tpm_emulator.c         | 2 +-
>   tests/qtest/dbus-display-test.c     | 5 +++--
>   tests/qtest/migration-test.c        | 2 +-
>   tests/unit/test-crypto-tlssession.c | 4 ++--
>   tests/unit/test-io-channel-tls.c    | 2 +-
>   5 files changed, 8 insertions(+), 7 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

