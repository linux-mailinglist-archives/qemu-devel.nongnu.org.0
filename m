Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88AD94CEDE7
	for <lists+qemu-devel@lfdr.de>; Sun,  6 Mar 2022 22:15:03 +0100 (CET)
Received: from localhost ([::1]:51690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQyDW-0000RM-2N
	for lists+qemu-devel@lfdr.de; Sun, 06 Mar 2022 16:15:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQyCT-0007eC-2i
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 16:13:57 -0500
Received: from [2a00:1450:4864:20::332] (port=44590
 helo=mail-wm1-x332.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nQyCR-0006DS-Ij
 for qemu-devel@nongnu.org; Sun, 06 Mar 2022 16:13:56 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 bg31-20020a05600c3c9f00b00381590dbb33so8181996wmb.3
 for <qemu-devel@nongnu.org>; Sun, 06 Mar 2022 13:13:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=gS43pXPX+JiZYs3T3V0khYqgSQAQnZPTdsFT/VCuQ/E=;
 b=Iu6ThcwlOU91kgE8JHE0mDpFMNXXrwWaG6UzEGyEovHs7we3rRbU44XU5E1Q1depUh
 yQf9lB2REalnEGNfssCoYGfvnsmxBhC3FMLX8kz0JYBvUrBcBxi0J5OTIkTc4lYZFg2A
 nHYxt6NrKQ6cQuIKkN5YUkOUylG42l6wbqV71mC8kLW8ZS8+2H/b3OfmJ7GRzpLmJp3m
 VC56B2Pl+vrFUqxCJVylazKQhG9TXO++y6PG8mMW+hFAeVThsrz1YCXEyRxQnOML3rU6
 6VZ8IjP+x3uSqdS0zFkjR86NTu8kj/5EaEqD/l2H2RE4RJacN5yguw2GcPF5uJsbtBoL
 wLHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=gS43pXPX+JiZYs3T3V0khYqgSQAQnZPTdsFT/VCuQ/E=;
 b=mQQMY2h50WP36NgUYHicM4piqwqNDw1s4f9C2ZkCeGOcGIk6P/Js+V4qF2yE05MFW1
 IEwL97mWNhVUd86XbfPw/oPwASm3DlKLp63tenGHSRoVvkGkdz1cTGg2JXnXo1f9Vt9k
 i+7YOLA4hE6FENpAiEBPrrJH2XV54mvOJgW57FSAuGBNolMfwc36JgfYreOWnX2kVZgP
 8bbf1aoViFWM7xMRVb3IxFYwoEizlU4imjYZV2QdwvIWo9TwDolduvpXyFQ/cCE6HsCk
 ury1j6eYEmyeMe1vZqxAap9vI04JvF59YOOQsF5bCQPgUv0p3/k6Q/UeeDz7KOK9Lg69
 hmmw==
X-Gm-Message-State: AOAM5324EB58BRwqWmLr62dXUqH/LhXY5ow/93O4dQjHAjnTgTWvUjaC
 y6wPxGS/gjBAc31VuGmvAds=
X-Google-Smtp-Source: ABdhPJyyfvxYRd8rPAqyB9Lc0CK8wciVREVE51NtBst2MDBxO55i20JRPLy7qcMqMsy/AvZsT5RQkg==
X-Received: by 2002:a05:600c:3c98:b0:37f:2f14:7be7 with SMTP id
 bg24-20020a05600c3c9800b0037f2f147be7mr15925047wmb.180.1646601233717; 
 Sun, 06 Mar 2022 13:13:53 -0800 (PST)
Received: from [192.168.1.115] ([185.126.107.38])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a05600c348e00b00389ab74c033sm157146wmq.4.2022.03.06.13.13.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 06 Mar 2022 13:13:53 -0800 (PST)
Message-ID: <ec456ba2-71ed-7cbd-ae3a-595131962918@gmail.com>
Date: Sun, 6 Mar 2022 22:13:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PULL 00/33] Abstract ArchCPU
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20220306130000.8104-1-philippe.mathieu.daude@gmail.com>
 <CAFEAcA_Gedun4yL_DcfK9Pk7e5j5gYpHuue139gq3rYH3zbETQ@mail.gmail.com>
 <ad3118f9-0079-16cc-8a9d-51b8e32e7b2c@gmail.com>
 <CAFEAcA_rLaphLoyZNUGOPoj5n2z7X+RJNSpnJGqhu9ujAMduEQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <CAFEAcA_rLaphLoyZNUGOPoj5n2z7X+RJNSpnJGqhu9ujAMduEQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::332
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wm1-x332.google.com
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
Cc: Eduardo Habkost <eduardo@habkost.net>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

+Daniel/Alex

On 6/3/22 20:56, Peter Maydell wrote:
> On Sun, 6 Mar 2022 at 19:06, Philippe Mathieu-Daudé
> <philippe.mathieu.daude@gmail.com> wrote:
>> I see. I only have access to aarch64 Darwin, not x86_64; I was relying
>> on our CI for that (my GitLab CI is green). I'll work a fix, thanks.
> 
> This was on my ad-hoc stuff -- I guess our gitlab CI for macos
> doesn't build hvf ?

No, it does:

https://gitlab.com/philmd/qemu/-/jobs/2167582776#L6444

   Targets and accelerators
     KVM support                  : NO
     HAX support                  : YES
     HVF support                  : YES
     WHPX support                 : NO
     NVMM support                 : NO
     Xen support                  : NO
     TCG support                  : YES

But the Cirrus job are allowed to fail:

   .cirrus_build_job:
     stage: build
     image: registry.gitlab.com/libvirt/libvirt-ci/cirrus-run:master
     needs: []
     allow_failure: true

So I've been missing this error since 2 months...

   In file included from ../target/i386/hvf/x86_task.c:22:
   ../target/i386/hvf/x86_emu.h:27:30: error: declaration of 'struct 
CPUX86State' will not be visible outside of this function 
[-Werror,-Wvisibility]
   bool exec_instruction(struct CPUX86State *env, struct x86_decode *ins);
                                ^

