Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B404E602C03
	for <lists+qemu-devel@lfdr.de>; Tue, 18 Oct 2022 14:45:20 +0200 (CEST)
Received: from localhost ([::1]:35514 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oklyB-0006E6-M0
	for lists+qemu-devel@lfdr.de; Tue, 18 Oct 2022 08:45:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oklVo-0004NP-NB
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 08:16:06 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:46669)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1oklVm-0007UO-M7
 for qemu-devel@nongnu.org; Tue, 18 Oct 2022 08:16:00 -0400
Received: by mail-wr1-x42c.google.com with SMTP id bk15so23105949wrb.13
 for <qemu-devel@nongnu.org>; Tue, 18 Oct 2022 05:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KqO3et4KTD7WJ43qHbwiBbZOyVPFdEVMWRR6o/sFvAU=;
 b=iypjuzQoMRvzjsxzj+25QSUdk8Sswmqf8Sxlf6WlQafnRmnPQEkyKJj1afyNELn+6L
 EmNAnEf9YcOsFlgMxkR4v8dtqZljnV/W0P+cpAveD+IG9yZe8pN407Ofo0hlSP5CIPHE
 By6nJxOxAklaCGwS1h5lGLXFqW5JpKyzbC40D4nRmfZdsLEZGW8FfrqPtWESPMUSz5jp
 N9CNzGdIMhb/gYkNOGz/ZKgStW0r8hvLtBAeWW2w1gZud9bmgtHltpDupNIGd22eFOri
 NQ+Sfp16XfCj1hisTqfNYXhCQQdRfOr/XDNqwja/H1RUTS0b3RHd1k3f//Ay4TE8It62
 yQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KqO3et4KTD7WJ43qHbwiBbZOyVPFdEVMWRR6o/sFvAU=;
 b=eUw10KNleVF9D/2oYl/uIfaDAmODSfZtIAGLZTcRMBrH1YSCcUveXQMm5LTOf3r1IH
 QdRZdCCIBoGrGfKx51vBRs3SrJOg5UAylxo31PPqJb7tB5g5IqAOpPwAuo/qEKKggqwL
 2/WYliwVC6F2d9ZqhOwPZ4p8AVTWDg2+4vmp9Eke0Kp90+yT0yf8AWw2tiaZcB+6kicr
 JseDf8jvMuIEl5z+DPGdor2JclRWFbWGIUAGtBnl4+bdDGST5jWBQEWvxuqPPSR9q29m
 w41vdI6e/nekx0x1eOkObqMyAcOFaDobPpgfUeZfQ8T61GLVLkoEtdPNwIoO3UlClb3r
 hiJg==
X-Gm-Message-State: ACrzQf1O8ba5LK2fRLif93E4NzNmbKbUZyWwt1rEJaJXQdP6kgmNolRP
 iH/8/Acslysg8BExWawZrD5LgQ==
X-Google-Smtp-Source: AMsMyM4OVLJmW20O9F1TIg+r0mxGwyHpNLQA1+PQipK8xrQxp9RB1ESmIliXDeT1AhcsBeHgJZaMmw==
X-Received: by 2002:a5d:408e:0:b0:22e:650a:ec4b with SMTP id
 o14-20020a5d408e000000b0022e650aec4bmr1779827wrp.212.1666095356049; 
 Tue, 18 Oct 2022 05:15:56 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 g24-20020a7bc4d8000000b003b4935f04a4sm15628505wmk.5.2022.10.18.05.15.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Oct 2022 05:15:55 -0700 (PDT)
Message-ID: <fcd4be5f-4ef5-7ec6-bbf7-1682ce7b8359@linaro.org>
Date: Tue, 18 Oct 2022 14:15:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH v2 07/28] qapi audio: Elide redundant has_FOO in generated
 C
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org
Cc: michael.roth@amd.com, jsnow@redhat.com, eblake@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?=
 <berrange@redhat.com>
References: <20221018062849.3420573-1-armbru@redhat.com>
 <20221018062849.3420573-8-armbru@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20221018062849.3420573-8-armbru@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18/10/22 08:28, Markus Armbruster wrote:
> The has_FOO for pointer-valued FOO are redundant, except for arrays.
> They are also a nuisance to work with.  Recent commit "qapi: Start to
> elide redundant has_FOO in generated C" provided the means to elide
> them step by step.  This is the step for qapi/audio.json.
> 
> Said commit explains the transformation in more detail.  The invariant
> violations mentioned there do not occur here.
> 
> Additionally, helper get_str() loses its @has_dst parameter.
> 
> Cc: Gerd Hoffmann <kraxel@redhat.com>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   audio/alsaaudio.c      |  2 +-
>   audio/audio.c          |  6 ++----
>   audio/audio_legacy.c   | 17 +++++++----------
>   audio/ossaudio.c       |  8 +++-----
>   audio/paaudio.c        | 12 ++++++------
>   audio/wavaudio.c       |  2 +-
>   scripts/qapi/schema.py |  1 -
>   7 files changed, 20 insertions(+), 28 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

