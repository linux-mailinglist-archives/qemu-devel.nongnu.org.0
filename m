Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A12369D1A
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Apr 2021 01:05:32 +0200 (CEST)
Received: from localhost ([::1]:48928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1la4rb-0001Ox-QJ
	for lists+qemu-devel@lfdr.de; Fri, 23 Apr 2021 19:05:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50176)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la4pm-0008Tr-CQ
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:03:38 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:36521)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1la4pi-0004I2-Sr
 for qemu-devel@nongnu.org; Fri, 23 Apr 2021 19:03:37 -0400
Received: by mail-pf1-x42c.google.com with SMTP id c3so16212322pfo.3
 for <qemu-devel@nongnu.org>; Fri, 23 Apr 2021 16:03:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=l6YygAOC/kEaTmYxNf60SOxoea/FdMjwoiZVNL+c72g=;
 b=rk99IQyECOT7rpu9HIkwrgBgdpt1FQA6l5fwBqyjDWBsOSfIpzhtkOtTsqVO7/Wf8r
 0NHzxFhwQL3OuYA9lM0tVwiaN0goZnravwUecO5gATShaqAuYOsZY4hleaWv0OVMMxQr
 S7R1rk7wAADRSgP0iR17yqaNhqQMKrpp8kK/fJTOL0eQuUIUek64to7TAIZI8ZMjn1NS
 0qtgd3zjjdS17EJuL0WHTj4bx8QhhdRahLOhRTVueajxLAhegX8ihIQP++q5u4uODZxI
 wpC0cDp2TLb9qUUL7BgYoez+L6TVxNv+hLxdcqbEkP4lyWzkM5f6ecxBVb7MomJIHDzf
 MOWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=l6YygAOC/kEaTmYxNf60SOxoea/FdMjwoiZVNL+c72g=;
 b=kGukeAEhqhdAEp0PTZXZ570Mv3+t/Rplr9qHXEN485AYrDCpF2T0ma7KlbKk+Iwo2v
 Puz8SCeq6n5gKOLOWPJ9J22QYq42tYPQke1BrUZbOe7Kfsy7GoQmNsVNNdQ+eOSzjB7l
 LimrCtPwju9wnbPZ9TodMigJ17wK8+pAaji/xPsrRS4hcRMrlM3aH+T9AvpkMNyyqcm6
 p/tSHDBe848SR4Io0qm08lM24I4IDWd8Z21MzME/S+/wZJwTP4i3h83md6Nk4kREjjzo
 5z9m4lw1Bo78cHcFQOhNi8mF6oJk1IiPs+WE6Ljgm0q7OynBq+7oTOHNCVG+ihnbhmOg
 YlaA==
X-Gm-Message-State: AOAM530bxWl90u0kWNHTYCKaUnt3svVNE+NOunDh4FGDQNHNS6mUv6yI
 rhjhvN8oGAixJtg6Ac8KffxUfA==
X-Google-Smtp-Source: ABdhPJyaZRSS6ouKgBvBDt9O7Wd8g8fPCqXlPErUmlha8I7I5l8a+3SW3UVIsBRqoe12+WtC+aCtWw==
X-Received: by 2002:a62:3892:0:b029:250:4fac:7e30 with SMTP id
 f140-20020a6238920000b02902504fac7e30mr6076305pfa.81.1619219013546; 
 Fri, 23 Apr 2021 16:03:33 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.144.24])
 by smtp.gmail.com with ESMTPSA id z188sm5658304pgb.89.2021.04.23.16.03.33
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Apr 2021 16:03:33 -0700 (PDT)
Subject: Re: [PULL 05/24] bsd-user: style tweak: keyword space (
To: imp@bsdimp.com, qemu-devel@nongnu.org
References: <20210423203935.78225-1-imp@bsdimp.com>
 <20210423203935.78225-5-imp@bsdimp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ba4d4f6d-7844-4eaf-e5e6-1b8c1c13f5fa@linaro.org>
Date: Fri, 23 Apr 2021 16:03:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210423203935.78225-5-imp@bsdimp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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
Cc: kevans@freebsd.org, arichardson@freebsd.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/23/21 1:39 PM, imp@bsdimp.com wrote:
> From: Warner Losh<imp@bsdimp.com>
> 
> Signed-off-by: Warner Losh<imp@bsdimp.com>
> ---
>   bsd-user/qemu.h | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~


