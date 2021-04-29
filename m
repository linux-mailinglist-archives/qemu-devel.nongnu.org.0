Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C5FE36ECFF
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Apr 2021 17:06:47 +0200 (CEST)
Received: from localhost ([::1]:60578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lc8Fa-0001D4-53
	for lists+qemu-devel@lfdr.de; Thu, 29 Apr 2021 11:06:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56220)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lc8EY-00006f-De
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 11:05:42 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:40799)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lc8EW-0002H1-LS
 for qemu-devel@nongnu.org; Thu, 29 Apr 2021 11:05:42 -0400
Received: by mail-wr1-x434.google.com with SMTP id e5so38635484wrg.7
 for <qemu-devel@nongnu.org>; Thu, 29 Apr 2021 08:05:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=EYhlmfXvj2ehmhYhTHmVrEzBYH9XcJWGUNpRkjlx2AE=;
 b=T5i4CzWmHR19yJbUWul6oSWIxjPMixj63A9eAawvAxkT8ct66WFPQQZVPrOPnwdNpZ
 XavtSn81jKg1zLM7r6Q9NaeMTLozXFpnOuPQU54oSUY1XXnIpHOya9FfntHFnGjt+QHb
 mSs/zexiKIEZXsQVYSZBep0b8cy9DtMXQhShERKfTFPRTf55NWDQZXQYWuyQ3G9GHQAd
 LOyq5yCI60uwAlmRK6/PC0PwDWa5VitInuPKLt8u4g7NvlSVWi1pZmP1A5XVJ/ZfqOzx
 Q9f/GhBCquzve3Q0aPEQMzWghhiPZf8GzU0F67iMPqLlIjuZnyaON/zZbNQVERx0Vcq0
 fcKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EYhlmfXvj2ehmhYhTHmVrEzBYH9XcJWGUNpRkjlx2AE=;
 b=JCQtwOaS4ySuhaxiQdfBQ812aY+V+zmUiINqVoDxNlkXKg6V4dMNkdK+IsKC8MippE
 tF3th46rALK/9YxVI91U6px0yxA860Ob91n+8Bd4tziYhlzE2AjERFTEvLZAIk4W1TIn
 +uZSj/RXqryaRuNUKSabjLvjymOY5q/YTOZyu1CArzCfb11Sl9nISI8cjbZ0LQS6yhwu
 hOXZfPuDrQFJr8kQTMH7F8pjuBAJuHFPZ6Dyg1IQVm1ZI7GVGO9JiDuLaBE4BGtganU+
 xp4uFO3Z6FAq4DipQdtDqyNooEeJFjpel1dVfQs+Ry03oLzXlhbxwNk151O9PR6EXtYJ
 tvAw==
X-Gm-Message-State: AOAM530RFLe2RxAE10lbByU1nx5w9dY08fY2urv3CkXT53hjrr4l4q/+
 Fh8+znBsNDzZouPRIfwhK0I=
X-Google-Smtp-Source: ABdhPJwQX4Gnbmlga84WXMQeC4ikex4Hcz6pmrECkx17F5vk8sY+xerce5NhLVM91JlNcHUDmQOfGg==
X-Received: by 2002:adf:f212:: with SMTP id p18mr296782wro.120.1619708738570; 
 Thu, 29 Apr 2021 08:05:38 -0700 (PDT)
Received: from [192.168.1.19] (anancy-651-1-208-144.w109-217.abo.wanadoo.fr.
 [109.217.237.144])
 by smtp.gmail.com with ESMTPSA id y19sm10647978wmj.28.2021.04.29.08.05.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Apr 2021 08:05:37 -0700 (PDT)
Subject: Re: Let's remove some deprecated stuff
To: Gerd Hoffmann <kraxel@redhat.com>, Kevin Wolf <kwolf@redhat.com>
References: <87y2d1csxe.fsf@dusky.pond.sub.org>
 <bd90409c-14d0-2732-0056-9fec8383479a@redhat.com>
 <20210429124049.z7qtkufk2wgvvd5i@sirius.home.kraxel.org>
 <YIqwsUAGEvfazbvZ@merkur.fritz.box>
 <20210429134612.rtnoy5yo3v36h4l7@sirius.home.kraxel.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <bbaac55c-4877-82f8-1a70-bd62ff79a25f@amsat.org>
Date: Thu, 29 Apr 2021 17:05:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210429134612.rtnoy5yo3v36h4l7@sirius.home.kraxel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
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
Cc: Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, dirty.ice.hu@gmail.com,
 Paolo Bonzini <pbonzini@redhat.com>, Robert Hoo <robert.hu@linux.intel.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 4/29/21 3:46 PM, Gerd Hoffmann wrote:

> Hmm.  Not so easy I suspect.  While most sound cards map to a single
> device there are exceptions.  pcspk is build-in and hda is two devices.

What do you mean by "pcspk is build-in"?

Do you mean "the 'pcspk' audiodev is build in the 8254 PIT device"?
(see pcspk_audio_init).

FWIW I'm using this device as example to work on the PWM API,
and I see the AUD API as a generic DSP processing one.
And in my TODO I have "split pcspk audiodev backend from 8254".

