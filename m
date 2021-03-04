Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 603E932D7F7
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 17:42:11 +0100 (CET)
Received: from localhost ([::1]:39976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHr3C-0007Cq-Ef
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 11:42:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36284)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHr12-0006Lk-Ch
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 11:39:56 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:35367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1lHr10-00017a-46
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 11:39:55 -0500
Received: by mail-wr1-x434.google.com with SMTP id l12so28360052wry.2
 for <qemu-devel@nongnu.org>; Thu, 04 Mar 2021 08:39:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=6++V345q8e3idnkcKndXor5nJEwzYiTvDMED7MqAe5o=;
 b=ZbbaLXnI7elWXwHoUS2UGzqI26grk+OuY58XHS77w6IuQ5Uj/gNKWms1BEQaexsm1w
 yzg54sDg9Si9qgUya8LeAgtkcA7vGCpMDkHdzuwv9Jk0JMi8hOvjf4KXgNgI/Yf9dZYa
 uUGTekJO6+e/OHzO/TNJcN12q5zHPj1GhpAzoVksuOShmaNaUmeOrknjqJzOUtWyUXTh
 GRjQ/7QafyVDAp+6QggY2jiYW+wp7gBGoc99SiDb8rHTxOYeZY/Riqe9mmDP0zoL5cha
 cwVkQ4bj3UKSxnJJ/OKvHVHietFWlU7bzkUaCYi80pwgJMPuqj8l03wrt92ws6MR61UJ
 3d+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=6++V345q8e3idnkcKndXor5nJEwzYiTvDMED7MqAe5o=;
 b=Sp0Ibagnymfeib+UzaA81x0w5VRE7g/cFwGivfeKorYpOe7z4RQUB35YsacRFxrIYQ
 5flzWKkSt80Ob4N/NdN6trac8D6zWpwwsmAx5w0hWMaX8e8brWGBy6f7aTtoDaQP4OwT
 gY91dQx/xyUW5MDTtC+xsLCo9BECVATg4KaLr/nP2Vzb9YMdrJXpKX0F107StfxhnTdz
 f0eaX5DNvgqQAEm8XYkYEQzs0iQLpHaU07uQzQy75S2WbSgOeXrqf3TcfZ/F4IZprpE6
 hUtph/eYNbfi/wMVF18VGrMkJQ6/2XIJVi2oLeVk05uxpF0LHFFxN1CNuYnQ7VHF2JPH
 EJGA==
X-Gm-Message-State: AOAM530cMLyh90/AzNQuKgV6oqw0afZhq8MNc5eElzBjcKenfWRXtSa8
 JyCkaqj4Z2m0HTxPUnPf2z4=
X-Google-Smtp-Source: ABdhPJxb1zTSPI27m3DymToqlZzlOoCEl1+/LB0BMnMMpF8uactP4C+wm3RE/PI00kbZg63GM9931Q==
X-Received: by 2002:adf:fec5:: with SMTP id q5mr4720653wrs.43.1614875992644;
 Thu, 04 Mar 2021 08:39:52 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id j12sm27934391wrt.27.2021.03.04.08.39.51
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Mar 2021 08:39:51 -0800 (PST)
Subject: Re: [RFC v1 00/38] arm cleanup experiment for kvm-only build
To: Richard Henderson <richard.henderson@linaro.org>,
 Claudio Fontana <cfontana@suse.de>, Peter Maydell <peter.maydell@linaro.org>
References: <20210221092449.7545-1-cfontana@suse.de>
 <875z2k53mn.fsf@linaro.org> <a3ed4064-6dec-24c6-8138-ce8301f01e1e@redhat.com>
 <63847c79-93c2-5ee3-d568-9091fedf325c@suse.de> <87a6rmkffo.fsf@linaro.org>
 <8d4a427a-94dd-7472-e8ae-98c4efa44ce0@suse.de>
 <CAFEAcA_eWrgo9CcLF3ZpAPeK08_PmKNLjqKAzuBPcSGh+1SFCA@mail.gmail.com>
 <5fb3cf49-fc09-7e7c-d34e-299f04e9842a@suse.de>
 <335966c3-9f31-5868-54e5-edb28a37c50c@suse.de>
 <a9190376-ba0b-02d5-124d-a336c586ad5d@linaro.org>
 <dabd15eb-109a-802a-6abc-3831d7b1c203@suse.de>
 <1b92cbea-8abf-40b9-337a-15f34ef40f61@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <38f0a65d-b5e4-3795-03a3-d6b1b3346816@amsat.org>
Date: Thu, 4 Mar 2021 17:39:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <1b92cbea-8abf-40b9-337a-15f34ef40f61@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x434.google.com
X-Spam_score_int: -14
X-Spam_score: -1.5
X-Spam_bar: -
X-Spam_report: (-1.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/21 7:54 PM, Richard Henderson wrote:
> On 3/3/21 10:45 AM, Claudio Fontana wrote:
>> It is a bit weird that qemu-system-aarch64 runs with a cortex-a15
>> model tbh, as cortex-a15 is not capable of aarch64.
> 
> No, but qemu-system-aarch64 is capable of 32-bit emulation (because most
> 64-bit cpus retain 32-bit mode).  It takes no extra effort to run
> cortex-a15 than it does a cortex-a57.

IIRC qemu-system-arm starts the aa64 cores in 32-bit mode, while
qemu-system-aarch64 in 64-bit (this gave me trouble because the
kernels for the raspi 64-bit SoCs are in 32-bit mode -- because
the GPU starts them in this mode).

> I have wondered if we should have just one qemu-system-arm that does it
> all and drop the separate qemu-system-aarch64 -- or vice versa.  But
> we've had the separation around so long I'm sure someone would be confused.

That would be great cleanup IMHO.

