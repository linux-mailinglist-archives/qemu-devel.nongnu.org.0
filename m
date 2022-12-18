Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB12665042A
	for <lists+qemu-devel@lfdr.de>; Sun, 18 Dec 2022 18:21:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p6xLN-00050b-4i; Sun, 18 Dec 2022 12:20:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6xLH-0004zC-3b
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:20:54 -0500
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p6xLB-0003Wy-VT
 for qemu-devel@nongnu.org; Sun, 18 Dec 2022 12:20:49 -0500
Received: by mail-ej1-x635.google.com with SMTP id vv4so16821758ejc.2
 for <qemu-devel@nongnu.org>; Sun, 18 Dec 2022 09:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=RxDLc1xSr9upLUvybwMQsSeoCnU82N4EK0XGmIaascA=;
 b=qCLFg6jFqTgQxxFI8YLGbxN4OZA0N3wG+BbcAoiYnOk8yLKrB67qOcN4yJQr566XmS
 h9pWoS01AgR/z0/xCIxVQmD7AXFWe8iqaBX1Cg2VOFlGR1rN92nudeL2TdGhQNZwOnDc
 kkNZy93njWFv12RlUs4++jbGQP3OL3c6a0fVnStOBm9azZb8CFfpHdj4S5gZEdbWDsM3
 4hRTBeNnZNt/Ht/uWjZ/E4truukWL2tT3ZvUZG0lPfLrLIZ8Hge58iZ4f0WhYI6EGYGJ
 2gOOW234tDR8tCx5qB+tqtHDw3FttxEitO2lMK1HX/jtfmoACiPEkAB/SUHrqYTR9GVZ
 MnSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RxDLc1xSr9upLUvybwMQsSeoCnU82N4EK0XGmIaascA=;
 b=cvGJaosXREZkJTF5Z2mJ9SKzUSzWqqFSfHzcj2zbcOMmCGOyzO5uZudhJj97AfCh1V
 NrFeyFoPaEjYP4ZsbyDRKNhXgV3NkgwY01cYcDzOa+Kb3hjiRKar4pGaG+aQurCBHBDp
 tFXRelAgRWVDJIUQUZ41giDIApNYnw58TQlyFC2aA5tP8t2fXqtOy2U6OPKHfx/5HqKK
 Hjq0ZB9AVy27TPYovbILcAWJrF2PAAYuI0a0T2gsKS0x1Uu8b74juOyJ5Nnr//pyUo7p
 B0uWfXP1D8kon6hvq01Dbd03ZgmOL+vxWxGUS+7jTnZVAaL8MxuDSYI1/k/n3U8+1rTA
 L01A==
X-Gm-Message-State: AFqh2kqmZCfTSlmrTlWuIXyFFx+LJSfhsCuukaxFq5e49B/AbjHh4B/H
 5AnVKQqvC/1uktV5e/h/uFiN7w==
X-Google-Smtp-Source: AMrXdXtXGULBJr6OzJ8/lOCmY6jKru2JaNuqMHiwhmxUwsYqLRz4DG3cz+SGs/e8pMsxv/dTqjpeYg==
X-Received: by 2002:a17:906:5210:b0:812:d53e:1087 with SMTP id
 g16-20020a170906521000b00812d53e1087mr2486227ejm.53.1671384043389; 
 Sun, 18 Dec 2022 09:20:43 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 ku10-20020a170907788a00b007c0d4d3a0c1sm3325737ejc.32.2022.12.18.09.20.42
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 18 Dec 2022 09:20:43 -0800 (PST)
Message-ID: <c268829a-8937-6efc-5a48-a1322a3c1690@linaro.org>
Date: Sun, 18 Dec 2022 18:20:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH 02/11] audio: don't show unnecessary error messages
Content-Language: en-US
To: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>,
 Gerd Hoffmann <kraxel@redhat.com>
Cc: Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 qemu-devel@nongnu.org
References: <3b1404eb-a7c5-f64c-3e47-1397c54c45bb@t-online.de>
 <20221218171539.11193-2-vr_qemu@t-online.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221218171539.11193-2-vr_qemu@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=philmd@linaro.org; helo=mail-ej1-x635.google.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.148,
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

On 18/12/22 18:15, Volker Rümelin wrote:
> Let the audio_pcm_create_voice_pair_* functions handle error
> reporting. This avoids an additional error message in case
> the guest selected an unimplemented sample rate.
> 
> Signed-off-by: Volker Rümelin <vr_qemu@t-online.de>
> ---
>   audio/audio_template.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>



