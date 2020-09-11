Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 21353266153
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Sep 2020 16:38:03 +0200 (CEST)
Received: from localhost ([::1]:50538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kGkBe-0004BW-6r
	for lists+qemu-devel@lfdr.de; Fri, 11 Sep 2020 10:38:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55726)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kGk9A-0001mI-7Y; Fri, 11 Sep 2020 10:35:28 -0400
Received: from mail-wr1-x442.google.com ([2a00:1450:4864:20::442]:40679)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1kGk97-000584-W3; Fri, 11 Sep 2020 10:35:27 -0400
Received: by mail-wr1-x442.google.com with SMTP id j2so11718795wrx.7;
 Fri, 11 Sep 2020 07:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=2eYQpOd3x0Q9Yh5498CMZbfDCFLE5K2oSaR634+ivvQ=;
 b=o0Wk/Sd1KbBD6my2VYfb4zpOqSpUuE2UpBJjTZV8duqHxS+NrMK3g08dRpClc1dJAv
 dsg0ahhQEVSCmsSL2fr+qvKeNdyzESaic1OMHTndsvRi/iVEv1vFAqfB2LCPT79pkdsn
 OllGLb1+WJvH/esDnMK4lYsc07ybLSnHvIj5b5vgplLfZHohHjJQ2xA7w++lUIH+l6fa
 udf6WGawEAasjkOCH+UmGCKanRp22jCkpEEKgscUJehqtXVg2ypZHWibOs9G3SV5a1lC
 IpwEgBHcwq7UkwiLgSqceiqXRUAeozm9A+NddrEkWtA/zyQiG9514Tmd2eJJOsJM/oDy
 5oiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2eYQpOd3x0Q9Yh5498CMZbfDCFLE5K2oSaR634+ivvQ=;
 b=UxEVlH60BZEGxvRl52FDSKwZ699wUmv5HlEQJiRY/n1NbeL8xoyf+pkRi3bY9p2Z5W
 1JUKD9ObsvKI6Hi4om/U77WIay5nQT4Hi+EWb//Y4wsnbOb1MVFzDtq/VZno0bGPCOcu
 q0EMdaZxYr8wKlGeF2jW6OZxWf2h5rTO7O71o/9pesQ0O0mst5BU43KjUKVa/v4MkZz0
 Dbp338vNHgQ515EzkbHuAm3dLVuygMUJRzfVi/+7Vqg4SB+MddTpOozLjgBKKCJo8lFQ
 WBvgI9ctWlUEsbE/hcdsNL2TWNjN2c3nZkDNa6W8+Teybf8V3ru2Qsr5tmBkUVRHxe8s
 pP6w==
X-Gm-Message-State: AOAM532e/LIocMSkOBKLiJ1t5dspnSKoccnukXyH4J9y/uh2r7FhDBIf
 P4B8Bb8SByAtsT4u7H2F27WBdiOVrP8=
X-Google-Smtp-Source: ABdhPJzMymzRQHHRl63zYm7DXt1iuKdCryomoKs5M9jniAjIHt7LPvNqxdWtvOLlHZPOxKivX05Lpg==
X-Received: by 2002:adf:f24f:: with SMTP id b15mr2544132wrp.301.1599834921121; 
 Fri, 11 Sep 2020 07:35:21 -0700 (PDT)
Received: from [192.168.1.36] (65.red-83-57-170.dynamicip.rima-tde.net.
 [83.57.170.65])
 by smtp.gmail.com with ESMTPSA id p9sm4537370wma.42.2020.09.11.07.35.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 11 Sep 2020 07:35:20 -0700 (PDT)
Subject: Re: [PATCH v2 0/2] util/hexdump: Cleanup qemu_hexdump()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org, qemu-trivial@nongnu.org
References: <20200822180950.1343963-1-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <d91cbe5f-9a24-dbc7-c726-2e3eda8e980a@amsat.org>
Date: Fri, 11 Sep 2020 16:35:19 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200822180950.1343963-1-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::442;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x442.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -39
X-Spam_score: -4.0
X-Spam_bar: ----
X-Spam_report: (-4.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.25,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-2.469,
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-block@nongnu.org,
 Li Zhijian <lizhijian@cn.fujitsu.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Zhang Chen <chen.zhang@intel.com>,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Laurent,

On 8/22/20 8:09 PM, Philippe Mathieu-Daudé wrote:
> - Pass const void* buffer
> - Reorder arguments
> 
> Supersedes: <20200822150457.1322519-1-f4bug@amsat.org>
> 
> Philippe Mathieu-Daudé (2):
>   util/hexdump: Convert to take a void pointer argument
>   util/hexdump: Reorder qemu_hexdump() arguments

This series is fully reviewed, can it go via
your qemu-trivial tree?

Thanks,

Phil.

