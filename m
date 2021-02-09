Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 957F0315167
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 15:19:39 +0100 (CET)
Received: from localhost ([::1]:56246 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Tre-0003G7-DL
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 09:19:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:45894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9Tkr-0005DG-Si
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:12:37 -0500
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a]:36552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l9Tko-0005KS-VY
 for qemu-devel@nongnu.org; Tue, 09 Feb 2021 09:12:37 -0500
Received: by mail-ed1-x52a.google.com with SMTP id l12so23821838edt.3
 for <qemu-devel@nongnu.org>; Tue, 09 Feb 2021 06:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=M2YLU1p3qUsY2p4IfyfgtuMn3AYjNz3yJ/ic5TMW9zs=;
 b=HyVap2+OwL67fC/upWOpU27sPraJfKhYtdcjyvPA31i7iWy93ooMkoh22YsWm5n7Kg
 p9j96NHCeS2ali1w2EyfoM2kb364zXdqJt9SRqwyLknU8Ao732TdSiiPAXFFwRW+tLyl
 I7r0IJe/6AXtj1AjOhdu+ki76tySr2yUoXzlbDCUEFwZ/PObP4hkaVaCIk3dCyidRXNg
 0ePgJPWwFkuCc+UoYhiifSJzL4Y+4WWo5jfWl+rJ3iloEeDkTxvl6twG1QH4GvgtBo1I
 sXww+9eCXGBsD/BTrXnNU1i4838njSvMJvYnfrG02ivM8DpaSfF1Ez8ouX0Owlfz5IQ0
 Ajfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=M2YLU1p3qUsY2p4IfyfgtuMn3AYjNz3yJ/ic5TMW9zs=;
 b=K6wYFR1Ef5oSozxnacHEUDgTn+5nmNfqGnlKIUpUlu4yibiqkneO+q5FdazTaC/vEm
 aQIv3X+uZiVYsvzKusVLRImv7vj5djVEahHEJypd4zGskV81ezikO9aYM8ODgDkgafmE
 4hi9Dh2xQBrpEC6cPdVFNNd0odtehDu8Nt/a0OPH2iUopJ58TNrYD5BiGbgzxmRVzT1g
 24d4gOzgRzCc7gg15diRciSZ0MNfYQAeS24qmjoxlj2tsR6DHHIA24tFMTgSJ0399/5n
 3ovZWGboCLjvBsUmwZmdthgtXKRRMVWg9dTFobhq0bwgY7vcpwmU920JFZv2Q0FHhmd6
 tcTg==
X-Gm-Message-State: AOAM532Ka8+m8qamTNDyTM2ibZp2En4PCkdZ2ipGljRSMwFB9Ocf/fS0
 RGAE4XJVPYwA76hxW7yth5yokBpq204=
X-Google-Smtp-Source: ABdhPJxyTE2tqAHHGuZ4p/lt3RTBLQvDoBPCSgEm8kKqfmuBUXZfu/1bIrPlmuLjCZC7Uk+UKXgSnA==
X-Received: by 2002:a05:6402:4252:: with SMTP id
 g18mr23401952edb.231.1612879952856; 
 Tue, 09 Feb 2021 06:12:32 -0800 (PST)
Received: from [192.168.1.36] (68.red-83-57-175.dynamicip.rima-tde.net.
 [83.57.175.68])
 by smtp.gmail.com with ESMTPSA id hr3sm10332461ejc.41.2021.02.09.06.12.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Feb 2021 06:12:32 -0800 (PST)
Subject: Re: [PATCH v3] travis-ci: Disable C++ optional objects on AArch64
 container
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>
References: <20210207121239.2288530-1-f4bug@amsat.org>
 <ebdddd92-cb51-e8b9-dfc0-fbce35015eb3@redhat.com>
 <CAAdtpL5YO=A-V06+7Wyhn5XnavGCUAqqcD8XpU2cVpE4AV-W3w@mail.gmail.com>
 <CAFEAcA-m0MKhMr05mX7HyJZ8DuK7D2YzCFnTyG4B32=-r-5mpA@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <622e8281-eeda-2620-d388-69d9d6853788@amsat.org>
Date: Tue, 9 Feb 2021 15:12:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-m0MKhMr05mX7HyJZ8DuK7D2YzCFnTyG4B32=-r-5mpA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.249, NICE_REPLY_A=-0.265,
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
Cc: Fam Zheng <fam@euphon.net>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 2/9/21 2:41 PM, Peter Maydell wrote:
> On Tue, 9 Feb 2021 at 13:32, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Migration of this job is pending of Cleber's possibility to add an AArch64
>> runner to Gitlab-CI, right? Then we need someone to support and maintain
>> the hardware... I don't think anybody volunteered.
> 
> We have the hardware already. Effectively Alex is maintaining it...

I missed to read if Alex volunteered for this task but am certainly
happy if he is :) Although this should be documented somewhere (who
to contact if the AArch64 runner starts to fail?).

Assuming Cleber's runner script is merged and working on the AArch64
runner, then we need to figure how contributors can use it.
Assuming this runner will be registered under the QEMU organization
namespace in Gitlab, then contributors would have to open a Merge
Request to trigger the CI jobs (similarly to when you push to the
/staging branch). Then we would cancel the MR. We can ask contributors
to cancel their MR once testing done.

Midway could be having maintainers opening such MR?

I have no idea, just asking questions to see if other have ideas or
see the big picture here.

Regards,

Phil.

