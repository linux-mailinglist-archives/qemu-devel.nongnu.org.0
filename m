Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F18D32BA0E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 19:56:12 +0100 (CET)
Received: from localhost ([::1]:47660 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHWfL-0002D2-7c
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 13:56:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHWdU-0000UP-Rm
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:54:16 -0500
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f]:38376)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lHWdS-0001Xg-Vi
 for qemu-devel@nongnu.org; Wed, 03 Mar 2021 13:54:16 -0500
Received: by mail-pj1-x102f.google.com with SMTP id l18so4932661pji.3
 for <qemu-devel@nongnu.org>; Wed, 03 Mar 2021 10:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=GJjdykjgWP5Z0N3zU5sSqtR9hgI1ZKnP21fDPf7Z0Xs=;
 b=Z+8rDj4y8Xsz7Ybg1cmPW/jJZH7rp/rrn9QBaGLMCI9/uK3dXIIFhKYoIYYJL7Aguw
 SMy3MPwnT50UUPQnP/xfyenQ8mIcn8U+ZSsJ676vaHzDpGy0VHMH0W+SnO5kNCZ6ZDB7
 rIR47aF2ZA23T8IqwTH86zPQMYRQc2LX0Fl8PC4ArnTRw8Pr35z6LuH2VSxeslot/9HZ
 KT4wi8LsA4WIDBuoiK43AkeU0otXbEK4dddxCKUlG7OcJIEvqZYSp3fwwScuheKiEttn
 yQRyAUR9JsCvKzPK1gOIbE3taaW2U7gqKGPONRypfdl1JX8H86ulkEI4Wt0Ru99aE6D7
 xyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GJjdykjgWP5Z0N3zU5sSqtR9hgI1ZKnP21fDPf7Z0Xs=;
 b=UsAX9SL7LfcQL6Nd2nspPyWatn89bNX77HoT1ySG0CVpTjLelqJTf4R12P4vcqA9//
 71gXby8ftYVPNzTKt2bYHohFK8jtzCH//UkgTmT74fdst8KQU9bZX17K3nGglUpgBDJ7
 y7YnhXoIqY8pWqOjHqPk0EtM2AGcA96KGxHgQjhTzYoPe94O98a8CxzJ1KdrqNw1EPN8
 VdhKEgCyEgiTDRPIuOoIkV0jgAcbOXhD04c6fponjOT5w6m+Ueaxcc1+ErZUzYiPgWmR
 NIC1IrI1DYCJUr7m1mgPICX24Rk7fXVDDZIMtro9AI9Uj8uvH1zq7RZNJJTbClHzBLHL
 NrHA==
X-Gm-Message-State: AOAM533ymcHvosryzXLqgeg/9PI5emhOMaG66IjvEtpYcPs5Jg8ySfo9
 xg6dSG1P+T+9eMEAcwrX05yUMg==
X-Google-Smtp-Source: ABdhPJySebXVXZwHr+dzJkEa2D1HH7lKSU51Q6MEj0LuzFDSpOkNIJK5y35xVaixe8SK8x3vxn1ASg==
X-Received: by 2002:a17:90a:4104:: with SMTP id u4mr477158pjf.81.1614797653409; 
 Wed, 03 Mar 2021 10:54:13 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id na8sm6786318pjb.2.2021.03.03.10.54.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 03 Mar 2021 10:54:13 -0800 (PST)
Subject: Re: [RFC v1 00/38] arm cleanup experiment for kvm-only build
To: Claudio Fontana <cfontana@suse.de>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210221092449.7545-1-cfontana@suse.de>
 <875z2k53mn.fsf@linaro.org> <a3ed4064-6dec-24c6-8138-ce8301f01e1e@redhat.com>
 <63847c79-93c2-5ee3-d568-9091fedf325c@suse.de> <87a6rmkffo.fsf@linaro.org>
 <8d4a427a-94dd-7472-e8ae-98c4efa44ce0@suse.de>
 <CAFEAcA_eWrgo9CcLF3ZpAPeK08_PmKNLjqKAzuBPcSGh+1SFCA@mail.gmail.com>
 <5fb3cf49-fc09-7e7c-d34e-299f04e9842a@suse.de>
 <335966c3-9f31-5868-54e5-edb28a37c50c@suse.de>
 <a9190376-ba0b-02d5-124d-a336c586ad5d@linaro.org>
 <dabd15eb-109a-802a-6abc-3831d7b1c203@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1b92cbea-8abf-40b9-337a-15f34ef40f61@linaro.org>
Date: Wed, 3 Mar 2021 10:54:11 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <dabd15eb-109a-802a-6abc-3831d7b1c203@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102f;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 3/3/21 10:45 AM, Claudio Fontana wrote:
> It is a bit weird that qemu-system-aarch64 runs with a cortex-a15 model tbh, as cortex-a15 is not capable of aarch64.

No, but qemu-system-aarch64 is capable of 32-bit emulation (because most 64-bit 
cpus retain 32-bit mode).  It takes no extra effort to run cortex-a15 than it 
does a cortex-a57.

I have wondered if we should have just one qemu-system-arm that does it all and 
drop the separate qemu-system-aarch64 -- or vice versa.  But we've had the 
separation around so long I'm sure someone would be confused.


r~

