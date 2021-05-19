Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CA8388FBF
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 16:03:09 +0200 (CEST)
Received: from localhost ([::1]:53890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljMmy-0002Mn-CE
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 10:03:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <liliang324@gmail.com>)
 id 1ljMkX-0008Om-F2
 for qemu-devel@nongnu.org; Wed, 19 May 2021 10:00:37 -0400
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a]:42623)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <liliang324@gmail.com>)
 id 1ljMkV-0007Hv-IU
 for qemu-devel@nongnu.org; Wed, 19 May 2021 10:00:37 -0400
Received: by mail-lj1-x22a.google.com with SMTP id w4so15759386ljw.9
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 07:00:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=cH5U9Az7eYofu3eA4ftQUffWK1rQQwjbWurlsdJWGcs=;
 b=PsWmCiUmc0h6jhfs8n0zs3WyblSVZ2kUwHfBnc2GdYbUF8tQ/EAduwiPqpCBvvWuAV
 7EBu6Di5txh7+u0aguiGdClwNmaz4jJmdsAPd5jkwP/ynfSUqEmpdorkx0uXGEliS0HL
 V4gvbj4hLt0shXfOLVUVx4u6jYkqiFJNktSpgbI/rNy4Z/6+Vh8HXBTAA5d5m7MP0C9T
 bc1cbB8SNyiS9coO2Yy7SqhmCa1y/rpQmJMZ1h48CrC/7tzF6K118RVnOuTM0JaW0i8w
 57W7aksfsjkAzQ7C0mpUOtbLcHw0FtCEdK5DKFQu2GCYHE5cMoB0VZ4vLuYr3BsKj70T
 e9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=cH5U9Az7eYofu3eA4ftQUffWK1rQQwjbWurlsdJWGcs=;
 b=YcxUh7GUxj0wGzEi09EYWdZL0AB89qjdz38NLWXPwikTtyJYEhTAVVL1glGVggAp2Z
 Zs0541ZDKT8tbcUhLBAZksX0ibGQm7Qz/74mMF82CxEqhhUJN47u35xYJy2K/fDtirDd
 7k5WQTTtUNQgXFgOY/uEz8bjVTNhLZ6tumJA/4kWGTARie9R23Yl3Ynbw8oYWmzRMf4Q
 vWlyRktupurzfUp1TFqr/Kp/lMXqXRORVLxTtY+RN08ExIqAwY+vLsfa4pMiklXywPAd
 Ab8egwlSsovYdpO4SY8DU8DKgXNLNyNXC4AIE4HzBO65vpZcPjnYR8dHCnMDPxfpB7ep
 JyRw==
X-Gm-Message-State: AOAM531jic40gYq5pdvZErFKge+dHIL6SSLsGcKOx2+HwWBC4lwjGGeR
 LXe23mcy1SqjfuuUMagGweF7zWF5eLxYSnyv+Ko=
X-Google-Smtp-Source: ABdhPJyt1aYpq0/SyLXL0dDpoeoKQD/5+WHAgE9KRT3tffH8yD1OazmgdUfzxGyYtnxIbTs1l9olrGfYGX8yIUMEGYw=
X-Received: by 2002:a2e:8e26:: with SMTP id r6mr5780477ljk.472.1621432832689; 
 Wed, 19 May 2021 07:00:32 -0700 (PDT)
MIME-Version: 1.0
From: Liang Li <liliang324@gmail.com>
Date: Wed, 19 May 2021 22:00:20 +0800
Message-ID: <CA+2MQi-_06J1cmLhKAmV1vkPEnvDx6+bOnK06OciYmdymaNruw@mail.gmail.com>
Subject: About the performance of hyper-v
To: vkuznets@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=liliang324@gmail.com; helo=mail-lj1-x22a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: Tianyu.Lan@microsoft.com, qemu-devel@nongnu.org, kvm@vger.kernel.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

[resend for missing cc]

Hi Vitaly,

I found a case that the virtualization overhead was almost doubled
when turning on Hper-v related features compared to that without any
no hyper-v feature.  It happens when running a 3D game in windows
guest in qemu kvm environment.

By investigation, I found there are a lot of IPIs triggered by guest,
when turning on the hyer-v related features including stimer, for the
apicv is turned off, at least two vm exits are needed for processing a
single IPI.


perf stat will show something like below [recorded for 5 seconds]

---------

Analyze events for all VMs, all VCPUs:
             VM-EXIT    Samples  Samples%     Time%    Min Time    Max
Time         Avg time
  EXTERNAL_INTERRUPT     471831    59.89%    68.58%      0.64us
65.42us      2.34us ( +-   0.11% )
           MSR_WRITE     238932    30.33%    23.07%      0.48us
41.05us      1.56us ( +-   0.14% )

Total Samples:787803, Total events handled time:1611193.84us.

I tried turning off hyper-v for the same workload and repeat the test,
the overall virtualization overhead reduced by about of 50%:

-------

Analyze events for all VMs, all VCPUs:

             VM-EXIT    Samples  Samples%     Time%    Min Time    Max
Time         Avg time
          APIC_WRITE     255152    74.43%    50.72%      0.49us
50.01us      1.42us ( +-   0.14% )
       EPT_MISCONFIG      39967    11.66%    40.58%      1.55us
686.05us      7.27us ( +-   0.43% )
           DR_ACCESS      35003    10.21%     4.64%      0.32us
40.03us      0.95us ( +-   0.32% )
  EXTERNAL_INTERRUPT       6622     1.93%     2.08%      0.70us
57.38us      2.25us ( +-   1.42% )

Total Samples:342788, Total events handled time:715695.62us.

For this scenario,  hyper-v works really bad.  stimer works better
than hpet, but on the other hand, it relies on SynIC which has
negative effects for IPI intensive workloads.
Do you have any plans for improvement?


Thanks!
Liang

