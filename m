Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FF593215E1
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 13:14:17 +0100 (CET)
Received: from localhost ([::1]:52238 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEA6S-0005Og-AK
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 07:14:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41632)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lE9sP-0000IQ-Ij; Mon, 22 Feb 2021 06:59:45 -0500
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:40762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lE9sN-0001mx-W4; Mon, 22 Feb 2021 06:59:45 -0500
Received: by mail-ej1-x633.google.com with SMTP id u20so28175541ejb.7;
 Mon, 22 Feb 2021 03:59:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=D10oiACM2komBsN84imp7nqMEot4crO5/u+2IXth9lw=;
 b=Pc6+3ndGxy7QQjVaM8fgkMJA4ZvisnaNwmq1Rpmqv9hZGhNsginF3mdoingsGmT8xX
 YKydek0Mhr6z2j8m1+OXi4HLMpaRO3L9qb7d1KN3j4P2g6Sq0D0pvS7eZGDb2t2wxO90
 cs+LH4mQ4rji6iudZL7taLFQPCj30rgGrXK2mgLIS019rk4zp2x3VMoGlWf10JVLx7cQ
 azZHP1DaASk/WWooIbOkAy1q9+wjpQ09l4orRVoamkXRFXSBODgHb2GvSWCmJzispZkc
 Fila0qaSbq/oqYeBl8zAdf2ov75uYXgGxU/jP31vxAsWXmNxxZC+mQ91OoKSiD1+8uVG
 Mgsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=D10oiACM2komBsN84imp7nqMEot4crO5/u+2IXth9lw=;
 b=q7unJPq79DylfZAEymk/ZR/3lWijhSfrNk6eXhfmd/z99rK4s5phpc1XDecfKDyNzW
 ED/eYnLNJBLHn3D302NpjGmtbETQpseMiX27dedTrXoelxaqoxeo/YHpF3D7g1n5aJfc
 758uUTp50sOvx9UYV280Tud5C4aKN16Rb9xOT+1EonO6B1J56O7Mau7zvuW2Si7L9IEj
 /IzLXT1iS4QWKfr9bcMG+9zUPPuA8XfCL50EN+SzgbBSWwZeuTj6rfqKVYv0GaXXPzIf
 PDmiAOtouSMquf8kRBIeJTIlLaSqLU07UYVGixAXmdFh3IzMRe3AbDAx2Mw0uwGR8osw
 y9jg==
X-Gm-Message-State: AOAM532kyb30zTJ8oA0zE2F0MprbabeReMx8AyvD3DFY+BySPzFz8sY9
 YbE6oFHpAUAbWNSnDAvrxmAJ5+OSSPE=
X-Google-Smtp-Source: ABdhPJy/LIMe5+fd/ao/b27ipRpP3H8tgWkY6l9/M86+x2rkjEtSZGZADi+NLCkS9XTg9xCPxgRgtQ==
X-Received: by 2002:a17:906:fa01:: with SMTP id
 lo1mr16794179ejb.268.1613995181500; 
 Mon, 22 Feb 2021 03:59:41 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id r23sm11393834edp.34.2021.02.22.03.59.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Feb 2021 03:59:40 -0800 (PST)
Subject: Re: [PATCH v2 04/22] sd: emmc: update OCR fields for eMMC
To: Sai Pavan Boddu <saipava@xilinx.com>, =?UTF-8?Q?C=c3=a9dric_Le_Goater?=
 <clg@kaod.org>, Markus Armbruster <armbru@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Max Reitz <mreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Eric Blake <eblake@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Vincent Palatin <vpalatin@chromium.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Edgar Iglesias <edgari@xilinx.com>, Luc Michel <luc.michel@greensocs.com>,
 Paolo Bonzini <pbonzini@redhat.com>
References: <1613982039-13861-1-git-send-email-sai.pavan.boddu@xilinx.com>
 <1613982039-13861-5-git-send-email-sai.pavan.boddu@xilinx.com>
 <ccaf04a2-0eb7-69fa-5431-3c5401d267a4@kaod.org>
 <BY5PR02MB6772C9D63BF057B28E981EEDCA819@BY5PR02MB6772.namprd02.prod.outlook.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <f1386fca-7f12-b5af-a699-2ed5f13f9d84@amsat.org>
Date: Mon, 22 Feb 2021 12:59:38 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <BY5PR02MB6772C9D63BF057B28E981EEDCA819@BY5PR02MB6772.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ej1-x633.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/22/21 10:55 AM, Sai Pavan Boddu wrote:
> Hi Cedric
> 
>> -----Original Message-----
>> From: Cédric Le Goater <clg@kaod.org>
>> Sent: Monday, February 22, 2021 3:22 PM
>> To: Sai Pavan Boddu <saipava@xilinx.com>; Markus Armbruster
>> <armbru@redhat.com>; Kevin Wolf <kwolf@redhat.com>; Max Reitz
>> <mreitz@redhat.com>; Vladimir Sementsov-Ogievskiy
>> <vsementsov@virtuozzo.com>; Eric Blake <eblake@redhat.com>; Joel Stanley
>> <joel@jms.id.au>; Vincent Palatin <vpalatin@chromium.org>; Dr. David Alan
>> Gilbert <dgilbert@redhat.com>; Thomas Huth <thuth@redhat.com>; Stefan
>> Hajnoczi <stefanha@redhat.com>; Peter Maydell <peter.maydell@linaro.org>;
>> Alistair Francis <alistair.francis@wdc.com>; Edgar Iglesias <edgari@xilinx.com>;
>> Luc Michel <luc.michel@greensocs.com>; Paolo Bonzini
>> <pbonzini@redhat.com>
>> Cc: qemu-block@nongnu.org; qemu-devel@nongnu.org; Sai Pavan Boddu
>> <saipava@xilinx.com>
>> Subject: Re: [PATCH v2 04/22] sd: emmc: update OCR fields for eMMC
>>
>> On 2/22/21 9:20 AM, Sai Pavan Boddu wrote:
>>> From: Vincent Palatin <vpalatin@chromium.org>
>>>
>>> eMMC OCR register doesn't has UHS-II field and voltage fields are
>>> different.
>>
>> Can a patch be "From" a person without a "Signed-off-by" of the same person ?
> [Sai Pavan Boddu] No I should not be like this. My mistake, I would respin the series with corrections. Few other patches may have this after the split I did.

Please wait for more review before respining for this detail.

