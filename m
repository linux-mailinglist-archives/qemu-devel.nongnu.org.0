Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A7FEA4D7590
	for <lists+qemu-devel@lfdr.de>; Sun, 13 Mar 2022 14:53:56 +0100 (CET)
Received: from localhost ([::1]:56338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nTOfT-0001Eq-7y
	for lists+qemu-devel@lfdr.de; Sun, 13 Mar 2022 09:53:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nTOdi-0000Pp-1X
 for qemu-devel@nongnu.org; Sun, 13 Mar 2022 09:52:06 -0400
Received: from [2a00:1450:4864:20::42b] (port=37858
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nTOdg-0007mV-I7
 for qemu-devel@nongnu.org; Sun, 13 Mar 2022 09:52:05 -0400
Received: by mail-wr1-x42b.google.com with SMTP id q14so20013458wrc.4
 for <qemu-devel@nongnu.org>; Sun, 13 Mar 2022 06:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=1Tl/He1pzd+/RWUpL52ieckt1dBNj0T4Pgz9XGeAGnU=;
 b=BKKMIFntubvG04s376l0zii0cMHafIO/snnyAuuHkqQEMrlSm3NZcnlotDA/AbZQBg
 dHBv19oDuQ3pcGMh0bg+5tv5dcImwiMFCdGcvnjgHoFYTF3EXZp/QpLH+zexhsW2WhkS
 qSlqaCHtSGyQXCO+hkNKIhcTfHVfm71zLWqtio/bGVUFnowwmoCSc2B21pfLoVy3HdMr
 4RCLEOYcty5yXR4hG4LlFneekOfPfk3QSfF5cEbjS90nLK3WCh0TWXypXgfmPQNmEdai
 DfLYA4P2/9Z8QaU/5L0c/ybG4vkVgNT5axcEqKCPvPFR4cLBBZZlFqQHn8zmKz49scef
 0jhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=1Tl/He1pzd+/RWUpL52ieckt1dBNj0T4Pgz9XGeAGnU=;
 b=eKug3masPqiSuazEM9V3sdj6aqS0Jul2rKVys/BC80togxKfX5ooUeVEXnseCdY38Q
 KVq/i43O5gouTot1Xejc0fHlhgrb5QvS2JsCAFvEobXFTfcUrlkkcqewyO0Aw6peZSFd
 LOEqVVLzB/blfXemQ+gDeCpxhNG2kJq4YJ7X9nuco4GyzEAstiHAhceyijdAam06UmBv
 VPCHsKOmFVHH1C1ev/ZeY9HnARTnDQcCCumq1G/X5Bf/TIEYlKiKJFtebSB6Lk/RyHHV
 T8Mzw/yiqFHksCPTvC/BDqW0HzYSogE0VdjqKLvYOsXJB93vvzQFyhaH3e/ydb+gIQ+V
 UObg==
X-Gm-Message-State: AOAM531DuqH5rifH0Hl7OIr7H9E8xAdvvila3sJMkKIZXemIwfXn3bjB
 JTxNg/vmXaDnKZ9qMorHe9c=
X-Google-Smtp-Source: ABdhPJzo5GxpLwPCVEyFe3gVvbRqjSffUmSckTTLkt+I1Qr+k0Bz7upJhGJ0eXxop4o2CNzRgkiDHQ==
X-Received: by 2002:a5d:5918:0:b0:1f0:3295:f4ec with SMTP id
 v24-20020a5d5918000000b001f03295f4ecmr13435920wrd.451.1647179522617; 
 Sun, 13 Mar 2022 06:52:02 -0700 (PDT)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a05600c35cd00b00389e8aaad51sm9664318wmq.12.2022.03.13.06.52.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 13 Mar 2022 06:52:02 -0700 (PDT)
Message-ID: <7d1bde36-7d4b-2ebc-68b1-c8adfbdc5473@gmail.com>
Date: Sun, 13 Mar 2022 14:52:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v2 04/11] edk2: .git can be a file
Content-Language: en-US
To: Gerd Hoffmann <kraxel@redhat.com>, qemu-devel@nongnu.org
References: <20220311053759.875785-1-kraxel@redhat.com>
 <20220311053759.875785-5-kraxel@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <20220311053759.875785-5-kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Thomas Huth <thuth@redhat.com>, Beraldo Leal <bleal@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 11/3/22 06:37, Gerd Hoffmann wrote:
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>   roms/Makefile.edk2 | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>


