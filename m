Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 19580675313
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Jan 2023 12:10:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pIpH3-0005Oz-6c; Fri, 20 Jan 2023 06:09:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIpH2-0005Or-64
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 06:09:32 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pIpGz-0008Pg-Qg
 for qemu-devel@nongnu.org; Fri, 20 Jan 2023 06:09:31 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 l41-20020a05600c1d2900b003daf986faaeso3388801wms.3
 for <qemu-devel@nongnu.org>; Fri, 20 Jan 2023 03:09:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=J7qrh+MTjg+/6klvkgjKOlKDXDmPUsBT3HamtGENk+E=;
 b=igrhX27MNlt6NEW9v37GQIi9egpmTM53Upmaxy3u+3If+CwjVF2FRs3WDJLXhPebiv
 kJ4aPlv6y3xkAsJHN8r8mhRzK6tuVH9HkkzJwvWb2S0DauO2Fewf0kNNFQSopyI+RMFg
 ETH45VTCuseNYfkd/6xXqcfK09FAiHBCmJw9Wp1NuvkpMODeagUA9dMpI69YCQ/hysId
 Nw1PvooeBCXwr4Je9Yq9NzghvaIV0nLChMkbhVzerRvLXj+AXiqGNdBCrtII03VvejH6
 AB5VLoaLxKJGgcSTh6UoaGgN2QveaN4OGOFqdsT0+V8fc+W+U3wpKja+etrXT6/Aib55
 SfFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=J7qrh+MTjg+/6klvkgjKOlKDXDmPUsBT3HamtGENk+E=;
 b=V+0ciyBwmKbq+031OBH8FQBh1js5C5ie4OIKeZqqcuWJJVJ4PgZLd6XTStiMbMPwI4
 rnoahe93+gNst+WcL3tA+LJIZvUDO300t+upsl8qIi23wqy8Ncwr1rAzqAes6ctkFcFA
 In8sAPPFMEeHSBOCa3mfE6ab5XfT98YeUNJ+Fbej6BsI+0GYQJtau9pbtrTtvbKsTsG3
 n2hpg2wzOmO1LZMyk+HNTUg9RSFmnGfN+Dv8vnBzaunT19VRXw/yO+Z4peHVars0Vc3w
 yk83ySFWPq1gd8mtsx0y2AGT6N/QT2bceudRsgcGd2rOv9bmsppCRFvhEN7RtCWPsm69
 1fuA==
X-Gm-Message-State: AFqh2kqchkYyybgXjFxztjyl14pTwv62V6CJel2ZMY/vlWM3FYq7SkgI
 XIvdmbV6+Xw4N/jSeBvkoRIbcg==
X-Google-Smtp-Source: AMrXdXtLeJyCpicPVg8SHlKoxse+fXyf5pkRTRDY71/5qdJo+ndlRjMK5TroOHzhfxOMMmMUS2wjtQ==
X-Received: by 2002:a05:600c:5386:b0:3cf:9844:7b11 with SMTP id
 hg6-20020a05600c538600b003cf98447b11mr14436513wmb.23.1674212967729; 
 Fri, 20 Jan 2023 03:09:27 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 j25-20020a05600c1c1900b003c71358a42dsm2678938wms.18.2023.01.20.03.09.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 20 Jan 2023 03:09:27 -0800 (PST)
Message-ID: <f876042f-6b6c-4c5f-7f90-3bd76ad7b6e9@linaro.org>
Date: Fri, 20 Jan 2023 12:09:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.1
Subject: Re: [PATCH v3 00/11] tests/qtest: Allow running boot-serial /
 migration with TCG disabled
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Fabiano Rosas <farosas@suse.de>, Juan Quintela <quintela@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, qemu-arm@nongnu.org
References: <20230120082341.59913-1-philmd@linaro.org>
 <718784c3-43c5-b621-d5a0-a8aafa492a6e@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <718784c3-43c5-b621-d5a0-a8aafa492a6e@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.094,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

On 20/1/23 10:18, Thomas Huth wrote:
> On 20/01/2023 09.23, Philippe Mathieu-Daudé wrote:
>> Missing review: #7
>>
>> Two test were failing on Darwin when testing Fabiano's series
>> which allows building ARM targets without TCG accelerator:
>> https://lore.kernel.org/qemu-devel/20230118193518.26433-1-farosas@suse.de/
>>
>> These patches allow boot-serial / migration tests to run without
>> TCG / KVM.
> 
> I just started reviewing while you were sending v3 ... please see my 
> mails in reply to v2 for some comments.

Sure.

> Also, I don't quite understand why this is necessary. If you specify 
> both, "-accel kvm -accel tcg" on the command line, QEMU should simply 
> fall back to the second accelerator if the first one is not available? 
> What's exactly the problem you are trying to solve here?

When testing Fabiano's series two tests hang, i.e. [*]:

  18/20 qemu:qtest+qtest-aarch64 / qtest-aarch64/boot-serial-test
  qemu-system-aarch64: -accel tcg: invalid accelerator tcg

Maybe it is just a matter of adding HVF to the test? I'll see
when I switch back to that. Anyhow the "invalid accelerator"
warning is annoying noise when looking for real problems in the
output.

[*] 
https://lore.kernel.org/qemu-devel/ab32e4db-2a6d-69f8-4b69-62a1f1c0f6ba@linaro.org/



