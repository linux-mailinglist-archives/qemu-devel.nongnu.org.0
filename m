Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B964A3D501A
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Jul 2021 23:25:11 +0200 (CEST)
Received: from localhost ([::1]:48580 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m7lcU-0004LH-Bl
	for lists+qemu-devel@lfdr.de; Sun, 25 Jul 2021 17:25:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56518)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m7lbG-0003gf-0o
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 17:23:54 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334]:46074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1m7lbD-0001AV-UI
 for qemu-devel@nongnu.org; Sun, 25 Jul 2021 17:23:53 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 9-20020a05600c26c9b02901e44e9caa2aso4998566wmv.4
 for <qemu-devel@nongnu.org>; Sun, 25 Jul 2021 14:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=oGzkOL2X9eP494rVeSRSJjVLR0tqIzmhliFA8c5wmPo=;
 b=WleQVzOcFYdkFylemvF78ElF3wRXuCXmzGNQyGgCnkZ7Kk4ipbFl0vMuc8xYcYpeoC
 cDU/dWSXU5P3bm07eo9SG8cgZF7xTW10yomeL8opd7n+Df5C2M6t6daZ3sq/20sy/sX4
 HoQZkO77zR/19USj8Zx+1LPMpQMDTQCic2HF/9l8p/d68F4iBXKWsQkfWxXzdWHOpo5S
 BnuPICPQXcQ9zXsPclUxrVaQW3Y4LQS6iQuDBtELPu6XAEw+99LwBFxEgqu92TgdOsub
 UUY/FA+3sCjW5RAdstNUto+gdBMH03QDPkOB4YRbxIeF1qBAWLNAIL+R52TdyZmWMKz1
 pI3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oGzkOL2X9eP494rVeSRSJjVLR0tqIzmhliFA8c5wmPo=;
 b=iH8X6yGqNQLpmjUpKjr9DEdq6ue0iyV0liJvhavQKxeCcbcfnmzYUoPohVR3PkS+ok
 H+pI8TkcJEcZ1RNFA/F9ix6hXba/mMtS4YovhzAGrPwIjKPNe7t04vo/FVABzw2W/y9X
 gpFGUxfNypIaCiljPqMCzZYEwbq4dVDkMn6eXGggRpnUtICo0AvV4Fmbla3Bg457fUeO
 uhElx4/BMKmVKWhXeM+shJEUrMAXNsvRyVUHU5qhDLBvQb0kPN0f16XhRUW+8Xtuqyis
 g5fuXKtLqLDC5bCA1XT210PrJWtT5B/GtKmlRyX/lvcZOxg33pDYB/gd9nO9NTXxZ02r
 St7A==
X-Gm-Message-State: AOAM530RfCAUttfMQw+tZCjvrJfng8w7xOb4mp5GmjiRvT9u0D7Ebxai
 m3lrkc+ltbJp9+FRpHFKXZs=
X-Google-Smtp-Source: ABdhPJzceLFnikELHhqtf5wkZD/1i9l0AYnlK4k1DV3Ud0Ox0uo3/ocpL4hweVKG67NHZeq8q4aNXQ==
X-Received: by 2002:a05:600c:4e92:: with SMTP id
 f18mr23528446wmq.62.1627248230011; 
 Sun, 25 Jul 2021 14:23:50 -0700 (PDT)
Received: from [192.168.1.36] (122.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.122])
 by smtp.gmail.com with ESMTPSA id d18sm39472609wrw.7.2021.07.25.14.23.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jul 2021 14:23:49 -0700 (PDT)
Subject: Re: [PATCH for-6.1?] bitops.h: revert db1ffc32dd ("qemu/bitops.h: add
 bitrev8 implementation")
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, qemu-devel@nongnu.org,
 peter.maydell@linaro.org, richard.henderson@linaro.org, laurent@vivier.eu
References: <20210725110557.3007-1-mark.cave-ayland@ilande.co.uk>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <fada2f8a-6172-f8ae-6af6-6069cbb4d12c@amsat.org>
Date: Sun, 25 Jul 2021 23:23:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210725110557.3007-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x334.google.com
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-1.091,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 7/25/21 1:05 PM, Mark Cave-Ayland wrote:
> Commit db1ffc32dd ("qemu/bitops.h: add bitrev8 implementation") introduced a
> bitrev8() function to reverse the bit ordering required for storing the MAC
> address in the q800 PROM.
> 
> This function is not required since QEMU implements its own revbit8() function
> which does exactly the same thing. Remove the extraneous bitrev8() function and
> switch its only caller in hw/m68k/q800.c to use revbit8() instead.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---
>  hw/m68k/q800.c        |  2 +-
>  include/qemu/bitops.h | 22 ----------------------
>  2 files changed, 1 insertion(+), 23 deletions(-)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

