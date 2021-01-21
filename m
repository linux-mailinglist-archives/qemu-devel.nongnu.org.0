Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A5C4C2FE8AE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 12:24:48 +0100 (CET)
Received: from localhost ([::1]:47010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2Y51-0000m7-Oj
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 06:24:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2Xyq-00053I-W8
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 06:18:25 -0500
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529]:43133)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2Xyo-0003ml-OY
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 06:18:24 -0500
Received: by mail-ed1-x529.google.com with SMTP id n6so1963938edt.10
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 03:18:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=pXDFWRBdzfB07IYt4APStL4B4as4SkRURfhI3eRTcjM=;
 b=WxfGzcVSdFbF8NYT2GzKZFdQl07hDKfskz5KK0C4EaHa6zwEJxQDHZXf4Kbderp9tR
 +sJEpE/L7Zkz4U9iptMEga3p25XJPjha2vezaVZ30f6MxMHz8mKYHoa7wM8uaCKLt73+
 8FynOf/rcXg+TBmpc6+/kgoFk23/YtEbnlAzVeh+TqMYu8VtRRXYCa9A40znPHkc+iyp
 PU45JrDc8giyz9e8Xpc95H9DnSLZQyohhiRkkxUz3K3uxg6UhfeZ8M11GHOI1xowUwxW
 YKGYn+FOY9FcQrmiOWV21CyWPMoJxjpl2Em9P1O6TYT/3W5V8Ja4Z3ygFjR++IWyMI6/
 4kTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=pXDFWRBdzfB07IYt4APStL4B4as4SkRURfhI3eRTcjM=;
 b=bGlE/lLe8/1wwAJCPNvHEUMYbSatB84bnJGJKZu1B6YLWeG/YEZykFP1/4eHDC5O+q
 82q2IXi953vT/XiTwuPlgS7wIPNlFKLVqruSuBCf2lVAtU4URZGuZy2CG9ykcw0CcqlC
 28i0jBG5RyxQcRg9geE5nPkOVbQgGnPY9hkU6lXKeq0p2Qh2UaF5eUA2ZHCi2i7sIVMb
 EBnQGGlMfsJ3FxE1ZGm4bXNHfx+JzHz+NwOumak/QGIt7HwOhcawL0B9McN6pyp07/Ee
 rYcfsn1NYCxiZA2NliAbcOWQCz6Wl7oofCRCleGHd4Xx084ZcbYL3CTskVY/j39JbIee
 YWtA==
X-Gm-Message-State: AOAM532a77wuv7MOfAyd5KJgXF1a8Bg6aZ8M4qFKDruM0kP9iqgnh+A6
 Q0Ar09DTDvmYcF2xhpeCdJ4=
X-Google-Smtp-Source: ABdhPJyxZHEoK1cO/KKTjIM9eIsG/PVB67kneZ/TlJ5M1KXnFWsdrsKrbaFX4w2jJriX+X7fIU7rng==
X-Received: by 2002:a05:6402:1005:: with SMTP id
 c5mr11103748edu.379.1611227900546; 
 Thu, 21 Jan 2021 03:18:20 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id g17sm2558322edb.39.2021.01.21.03.18.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 03:18:19 -0800 (PST)
Subject: Re: [RFC PATCH 2/2] gitlab-ci: Add a job building TCI with Clang
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
References: <20210110162739.858087-1-f4bug@amsat.org>
 <20210110162739.858087-3-f4bug@amsat.org>
 <78a9718b-dec0-cc31-7ada-e815d9022e65@redhat.com>
 <20210121103250.GH3125227@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <b1309c5e-69f2-0c4d-eefc-9023e906694d@amsat.org>
Date: Thu, 21 Jan 2021 12:18:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121103250.GH3125227@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x529.google.com
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.248,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248, NICE_REPLY_A=-0.094,
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
Cc: Stefan Weil <sw@weilnetz.de>, qemu-devel@nongnu.org,
 Wataru Ashihara <wataash@wataash.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 11:32 AM, Daniel P. Berrangé wrote:
> On Thu, Jan 21, 2021 at 11:08:29AM +0100, Thomas Huth wrote:
>> On 10/01/2021 17.27, Philippe Mathieu-Daudé wrote:
>>> Split the current GCC build-tci job in 2, and use Clang
>>> compiler in the new job.
>>>
>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>> ---
>>> RFC in case someone have better idea to optimize can respin this patch.
>>>
>>>   .gitlab-ci.yml | 22 ++++++++++++++++++++--
>>>   1 file changed, 20 insertions(+), 2 deletions(-)
>>
>> I'm not quite sure whether we should go down this road ... if we wanted to
>> have full test coverage for clang, we'd need to duplicate *all* jobs to run
>> them once with gcc and once with clang. And that would be just overkill.
>>
>> I think we already catch most clang-related problems with the clang jobs
>> that we already have in our CI, so problems like the ones that you've tried
>> to address here should be very, very rare. So I'd rather vote for not
>> splitting the job here.
> 
> We can't possibly cope with the fully expanded matrix of what are
> theoretically possible combinations. Thus I think we should be guided
> by what is expected real world usage by platforms we target.
> 
> Essentially for any given distro we're testing on, our primary focus
> should be to use the toolchain that distro will build QEMU with.
> 
> IOW, for Windows and Linux distros our primary focus should be GCC,
> while for macOS, and *BSD, our focus should be CLang.

Sounds good.

Do we need a TCI job on macOS then?

Thanks,

Phil.

