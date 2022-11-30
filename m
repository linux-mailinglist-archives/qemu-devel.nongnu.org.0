Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB58C63D340
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 11:24:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0KGN-0005Ak-1o; Wed, 30 Nov 2022 05:24:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0KGM-0005Ac-1D
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:24:22 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0KGK-0001U6-9M
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 05:24:21 -0500
Received: by mail-wr1-x432.google.com with SMTP id f18so4251599wrj.5
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 02:24:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+ItxggoMrDrIqklyE82NEBNwge31CSjMxmwg8Xl1+Gs=;
 b=hmoKN2/RbzH0s5t8LrJch8SVBIYt9YdAuc1mCiz4Zh4RcO1T/2Ry9GTIvp18LSRWhJ
 3tGDEjkj3lQiw2P7ZPtE/RZOnGJzkkjB5o+Cym+3OFF3Yx7o0zbxRXg1LliU8po00cGg
 t/9iLCgiexptk/A2WWYYJKQrfHMsk3I+ZSPVTLJKZJFydWjovZTOmT3G6SXVhumj7llI
 DFdQp7ssYuNy7kHJowjlZjJIV40v1+uvaIlL9Oe5W7mQBHlplgg+8DQjtPWPKINMCLUR
 9a5Bp+HWCydV7MbcDvpmvf19pzxSsrWazPMGMUiknquPwKVvRBbcuyPGJxjeqcjAysBR
 FAkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+ItxggoMrDrIqklyE82NEBNwge31CSjMxmwg8Xl1+Gs=;
 b=Y2haOAqR03atgF+/bzoSSSketA9P0h/xiHmgSbIHrBDuiYzKHy8ob/LALnHXhieKaN
 lN4JvbZ4WB6hi3LPkcoNvSD9cSg16qF/JAM8PhaeffbXH9V0qrHRz0dvWstrOV7FIfBg
 /aXWi0cnt78RowIhxmdbPRW6TdHvP+ZLWhobuQeVSHl+wEVQLaYqzxMzN7Fcn3PwP54v
 gSojmxcbTfTlhzJ3Oc7ogaxc79Q0KwFQyXxQsmUO5Eb1EcWAMQ77faRSYMwIK3wWCTHa
 JR8ARp0eBJlSqbp3MVidxJcup1oOcrzKlyVkQK0fFt0rSvj9ME8sqMrDminsz7uJR7m+
 oxGQ==
X-Gm-Message-State: ANoB5plemmRWTfDsvy2aTe6SCU3KQ4j9VR2apL9ZYCy5VItPhq+/540J
 3MI0gER1foqn12T6kP7Ptqm6Kg==
X-Google-Smtp-Source: AA0mqf6wfZmgy3BmJ1mqis4VyVk5hcA8pOv+Lkyn5xgxpShU/zbLCtjLGV58EVhynT1xTLKz4Azhgw==
X-Received: by 2002:adf:e303:0:b0:22e:3c66:bda1 with SMTP id
 b3-20020adfe303000000b0022e3c66bda1mr28806086wrj.139.1669803858714; 
 Wed, 30 Nov 2022 02:24:18 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 16-20020a05600c22d000b003b497138093sm1348401wmg.47.2022.11.30.02.24.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 30 Nov 2022 02:24:18 -0800 (PST)
Message-ID: <82d8200d-0c53-eddd-3d99-03bb68969ec2@linaro.org>
Date: Wed, 30 Nov 2022 11:24:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.0
Subject: Re: [PATCH] docs/devel/reset.rst: Correct function names
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: qemu-devel@nongnu.org, Damien Hedde <damien.hedde@greensocs.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20221125140645.56490-1-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221125140645.56490-1-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.258,
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

On 25/11/22 15:06, Akihiko Odaki wrote:
> resettable_class_set_parent_phases() was mistakenly called
> resettable_class_set_parent_reset_phases() in some places.
> 
> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   docs/devel/reset.rst | 17 ++++++++---------
>   1 file changed, 8 insertions(+), 9 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


