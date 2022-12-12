Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA79764AA08
	for <lists+qemu-devel@lfdr.de>; Mon, 12 Dec 2022 23:14:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p4r3j-0007h9-Vk; Mon, 12 Dec 2022 17:14:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4r3f-0007gl-Rb
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 17:13:59 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p4r3e-0004HF-1O
 for qemu-devel@nongnu.org; Mon, 12 Dec 2022 17:13:59 -0500
Received: by mail-ed1-x52a.google.com with SMTP id i9so2283702edj.4
 for <qemu-devel@nongnu.org>; Mon, 12 Dec 2022 14:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TPOdECEBEoHUp9E+G9o30seFE/JcNzhO9zTOX6xc0pE=;
 b=TkTkIMlwOeLqhoaovCKm9hpKEGef6kxMkVq+W158H5JYHnNdeZ9w74rWlDstOXzwi4
 X23NIISZnOezZjFs6JpTDKBRENdyxZjMFIvvG69FpmqFYDozT+Etd/c3hPgLN+pZNlRY
 S4DskYQLRD//B40aT5p/Ryfemq40YQw0LaNh00B+KgK+NchSLCJomw5nz7m57OBbfs3t
 2TiyTd/5sN0GmTye+rZRcvWa04NSHG+ykH09cwDC+Uh39oiOpWr/I4HdNQocU7n5cuvn
 d/3CTdVx0Hv9UC1p3LVs9eDcQTCzaWzzhMdQ4wZ155YwJSZwz4ubMyk+nx/k9gjHS9Rv
 ys9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TPOdECEBEoHUp9E+G9o30seFE/JcNzhO9zTOX6xc0pE=;
 b=s2xbEgvFykSmugNNBpuQCBjBg4bmd/fntgPZ5cKcqtBizLTcSAaUQG/pLxSonUch4N
 p57ES2lo3u9kINzekRuopUmZk+EzmBecg8kNZhlgaSBotZgxqIs1E9UGkpz5uH71S3vv
 3QJiYcubUmlStYmm3sXfSiEgpMp0lxzInIbt+szQNvH0JT1YPpzMDkBcAs354iO9QkFH
 dEXl3VIZZBormGI4Af/iewMw0vmrSY3J1QTpJyJCdadAwcvPKWxyRrD7BDnZ+bOk43zZ
 bR8HIx7vuL9oqviKyyJ24hrektOtMr+pQ0MTEiBZcq8XlIE8oeQDE9dOnoO6BMKXpL+m
 zlSA==
X-Gm-Message-State: ANoB5pl4UjmbOuLlmKZZrfIQ2xqL8+vM2Ox9/LSsqF48Bn9pinTRE8FM
 DOksIuA6Es/FO7jb3wZLEUKS9Q==
X-Google-Smtp-Source: AA0mqf4AAgNG3jKncQVfKXCJZcPQc8fLxByEjSf+cUo8XCVzceW0BwOysyIRg9QHcKPpA4GJG0sujA==
X-Received: by 2002:aa7:cc97:0:b0:46f:fb60:8bd0 with SMTP id
 p23-20020aa7cc97000000b0046ffb608bd0mr3618553edt.5.1670883235400; 
 Mon, 12 Dec 2022 14:13:55 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 e22-20020a056402089600b0046c64b0efdbsm4283736edy.33.2022.12.12.14.13.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Dec 2022 14:13:54 -0800 (PST)
Message-ID: <69fe2e18-a3c1-95ca-cb10-99447115d47c@linaro.org>
Date: Mon, 12 Dec 2022 23:13:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v3 0/2] hw/usb: add configuration flags for emulated and
 passthru usb smartcard
Content-Language: en-US
To: Jon Maloy <jmaloy@redhat.com>, qemu-devel@nongnu.org
Cc: marcandre.lureau@gmail.com, pbonzini@redhat.com, jasowang@redhat.com,
 philmd@linaro.com, stefanha@redhat.com
References: <20221212220949.1278269-1-jmaloy@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221212220949.1278269-1-jmaloy@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x52a.google.com
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

On 12/12/22 23:09, Jon Maloy wrote:
> We add three new configuration flags, LIBCACARD, USB_SMARTCARD_PASSTHRU
> and USB_SMARTCARD_EMULATED in order to improve configurability of these
> functionalities.

> Jon Maloy (2):
>    hw/usb: add configuration flags for emulated and passthru usb
>      smartcard
>    hw/usb: add configuration flag for Common Access Card library code

Series:
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>


