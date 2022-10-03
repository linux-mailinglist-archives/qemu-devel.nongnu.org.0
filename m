Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD0B5F3197
	for <lists+qemu-devel@lfdr.de>; Mon,  3 Oct 2022 15:59:53 +0200 (CEST)
Received: from localhost ([::1]:32844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ofLz5-0006Zy-W0
	for lists+qemu-devel@lfdr.de; Mon, 03 Oct 2022 09:59:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54124)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofLuu-0000dA-BE
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 09:55:35 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:46711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1ofLus-0003vc-Qu
 for qemu-devel@nongnu.org; Mon, 03 Oct 2022 09:55:32 -0400
Received: by mail-wr1-x429.google.com with SMTP id bk15so16849512wrb.13
 for <qemu-devel@nongnu.org>; Mon, 03 Oct 2022 06:55:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:from:to:cc:subject:date;
 bh=aAI5S5SxPMv6ZZagGXWT327avLA/q8tqDJgag2Wshyk=;
 b=mjfnOTfmJMvxCQEP3GrhAeBz3OU3e16UXiU+1FkALybNGwqJL8Nm3npNpAxYIzI+8A
 1NwhMhDWyjTOm8XBn7jU/9iB9y0sIJgRLkgjqrGcKOkMlbNNvoDpQk95Ea5kOiG8WnFx
 6eX+uy6ciU9N/Ny3WxyKnQNLrlsSWYandIBT5ibFl+8bxAVL0pnf9IhN5u9WPQkF3gUt
 GR2Saxok6nx6VN9YcqSrxitkz1ZErPj26ELOIt91FhJ7oPkHspDrfM1oLPc24SKXglWG
 8dHqHPUq/9C0UBNxsVARZoK4KTrEV1svlieS1NfbPXDWKqqf/Q0C8+Ejhp7g9eabI8aV
 MQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :sender:x-gm-message-state:from:to:cc:subject:date;
 bh=aAI5S5SxPMv6ZZagGXWT327avLA/q8tqDJgag2Wshyk=;
 b=6z0BENgGz0ylA7VRynhEDQtBcaQcDUALijF5QDFhVkSgW36RHz8roYEeqQTv8nT1P7
 ff/Ir4Pl4ACjBDJh/omdAiVe6SBXk/Qn0RXEo8lm0Z2cmy2ET8JQrNT8NfxOoxQ/rOeb
 TZQ2EWmj8lONMKmGE/w+b79qN0zVGY+RJZJ6Sojf7FYukUCnHg1o1aL76xgmc+EI+Ja6
 VCiNLfZmyazS3CtIs5ouhSxVwLeap3MIOJWn+VdwU/Jtthsg8D7vdZ0XDdIB5KTXwV2C
 bbqa9JDVPLM0Knp86CeBlLlmH0C9V0b0zNq4HGQ+8dCywfPm9b4LFkpm0QdIOz1lzDVW
 ivUQ==
X-Gm-Message-State: ACrzQf2TgyybSP+dhKW/j10k7uj70AKa+ZzORIgqHFKRwUFBCZQ1j5bp
 EV6r6JjcuZbwUC7FUbdAP5I=
X-Google-Smtp-Source: AMsMyM6XDx0z1l4U69Qp69kUzt9iWvGo6jHa9OhxP5OIcXK2cONKaFtrSeUFnAuf1LAck0riRe9nxA==
X-Received: by 2002:a5d:6c6b:0:b0:225:dde:ab40 with SMTP id
 r11-20020a5d6c6b000000b002250ddeab40mr13236354wrz.690.1664805329281; 
 Mon, 03 Oct 2022 06:55:29 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 h6-20020adfe986000000b0022cd6e852a2sm12170127wrm.45.2022.10.03.06.55.27
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 03 Oct 2022 06:55:28 -0700 (PDT)
Message-ID: <03e6e9f9-3a71-533d-074e-44064e5ad286@amsat.org>
Date: Mon, 3 Oct 2022 15:55:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.13.1
Subject: Re: [PATCH 2/2] tests: avoid DOS line endings in PSK file
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
Cc: Bin Meng <bmeng.cn@gmail.com>
References: <20221003102718.600058-1-berrange@redhat.com>
 <20221003102718.600058-3-berrange@redhat.com>
In-Reply-To: <20221003102718.600058-3-berrange@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x429.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.467,
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
Reply-to:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
From:  =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= via <qemu-devel@nongnu.org>

On 3/10/22 12:27, Daniel P. Berrangé wrote:
> Using FILE * APIs for writing the PSK file results in translation from
> UNIX to DOS line endings on Windows. When the crypto PSK code later
> loads the credentials the stray \r will result in failure to load the
> PSK credentials into GNUTLS.
> 
> Rather than switching the FILE* APIs to open in binary format, just
> switch to the more concise g_file_set_contents API.
> 
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>   tests/unit/crypto-tls-psk-helpers.c | 11 +++++------
>   1 file changed, 5 insertions(+), 6 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


