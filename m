Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D08472FE93D
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 12:49:36 +0100 (CET)
Received: from localhost ([::1]:60024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2YT1-0008KV-VS
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 06:49:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2YRx-0007Wg-0A
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 06:48:29 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:44819)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1l2YRv-0000Yt-Ez
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 06:48:28 -0500
Received: by mail-ed1-x532.google.com with SMTP id c2so1831641edr.11
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 03:48:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=p6ZavglQpsPtkR0XUndM5ZpL4fawchWmBjHiXmwQMgc=;
 b=Mf59UBt9OTMV8aMrCQk16QVUdgx9oQ2FTJNkYg+lh5Ck8WSuutblFVoSHX53fUqRjR
 4HMwFS52BlF2S25r9vvzjJSHkOZqjGpR+duGzJHBw9d/p8NNLIQ5ri8brGhIJa3lYhmx
 5GNtM/g0s4f7bvhsVzcUdYi6zXnRJw4RHC5ruP9wB4DpjzYLmTqdn4FQxokaVqpGbXPd
 MAupporNtHvwHXCubRKmesf4z0+NQ5B+FW65lX9eBi5gb6DFOHcPb6MvnVqpT13knp+V
 dFrE+dhE5hv1kZey73Al4DPWefqRcMl2eGUWB6het47xy66PF/quUWnXFLoQOxjvD2o+
 BDeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p6ZavglQpsPtkR0XUndM5ZpL4fawchWmBjHiXmwQMgc=;
 b=HydFL1PJe59Zi6YGaGhVC5nuiAQFfcWMMk5G3SJhqad+plZundUQ8XpjhUOVbd7fo/
 scmhAN0rjVuIIGvjjRNLnjp7KUbN+621GzNHqbz53ymww7rfRFFavXVesPl8vasCMWj1
 CrfecIyTe9t8n3TcgkYgdPQjYEXs4+zPgNTa6k6NDk2YS7LxPNSLHBGkn6C7Z+w70fG1
 O45Xjmo7S9TFDVhJuyrPH37DaA/I1Z+KTDeGAF3g/ebKRKiDiQeODZDoFb4mgLzXX+cS
 DZM06nKEcwj3HIPk21C5oOike6frk4r7qVzI451bGdNUzMRGszjOlIwIwyyri5rX9qSn
 LMRA==
X-Gm-Message-State: AOAM5310XfivWu0dKkjkRdXBTD1xIkaRm4C5Cf6CxQfg3jfqH5O5wHbv
 bdgUhiivgpakbAOAu6rP3Ak=
X-Google-Smtp-Source: ABdhPJwCcnEMdHvzL1JKI/Eac3na/4SoUcXmigmeP0oHE5hiBspVYg8Zq9aDQnlPsIFDpHT/B4U3NQ==
X-Received: by 2002:a50:ed97:: with SMTP id h23mr2325812edr.278.1611229702916; 
 Thu, 21 Jan 2021 03:48:22 -0800 (PST)
Received: from [192.168.1.36] (13.red-83-57-169.dynamicip.rima-tde.net.
 [83.57.169.13])
 by smtp.gmail.com with ESMTPSA id qk1sm2128689ejb.86.2021.01.21.03.48.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 21 Jan 2021 03:48:22 -0800 (PST)
Subject: Re: [RFC PATCH 2/2] gitlab-ci: Add a job building TCI with Clang
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <20210110162739.858087-1-f4bug@amsat.org>
 <20210110162739.858087-3-f4bug@amsat.org>
 <78a9718b-dec0-cc31-7ada-e815d9022e65@redhat.com>
 <20210121103250.GH3125227@redhat.com>
 <b1309c5e-69f2-0c4d-eefc-9023e906694d@amsat.org>
 <20210121112154.GJ3125227@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e46b9117-59ed-cfb8-303b-1a5a013c4cc8@amsat.org>
Date: Thu, 21 Jan 2021 12:48:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210121112154.GJ3125227@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-ed1-x532.google.com
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
Cc: Thomas Huth <thuth@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 Wataru Ashihara <wataash@wataash.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 1/21/21 12:21 PM, Daniel P. Berrangé wrote:
> On Thu, Jan 21, 2021 at 12:18:18PM +0100, Philippe Mathieu-Daudé wrote:
>> On 1/21/21 11:32 AM, Daniel P. Berrangé wrote:
>>> On Thu, Jan 21, 2021 at 11:08:29AM +0100, Thomas Huth wrote:
>>>> On 10/01/2021 17.27, Philippe Mathieu-Daudé wrote:
>>>>> Split the current GCC build-tci job in 2, and use Clang
>>>>> compiler in the new job.
>>>>>
>>>>> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
>>>>> ---
>>>>> RFC in case someone have better idea to optimize can respin this patch.
>>>>>
>>>>>   .gitlab-ci.yml | 22 ++++++++++++++++++++--
>>>>>   1 file changed, 20 insertions(+), 2 deletions(-)
>>>>
>>>> I'm not quite sure whether we should go down this road ... if we wanted to
>>>> have full test coverage for clang, we'd need to duplicate *all* jobs to run
>>>> them once with gcc and once with clang. And that would be just overkill.
>>>>
>>>> I think we already catch most clang-related problems with the clang jobs
>>>> that we already have in our CI, so problems like the ones that you've tried
>>>> to address here should be very, very rare. So I'd rather vote for not
>>>> splitting the job here.
>>>
>>> We can't possibly cope with the fully expanded matrix of what are
>>> theoretically possible combinations. Thus I think we should be guided
>>> by what is expected real world usage by platforms we target.
>>>
>>> Essentially for any given distro we're testing on, our primary focus
>>> should be to use the toolchain that distro will build QEMU with.
>>>
>>> IOW, for Windows and Linux distros our primary focus should be GCC,
>>> while for macOS, and *BSD, our focus should be CLang.
>>
>> Sounds good.
>>
>> Do we need a TCI job on macOS then?
> 
> TCI is only relevant if there is no native TCG host impl.
> 
> macOS only targets aarch64 and x86_64, both of which have TCG, so there
> is no reason to use TCI on macOS  AFAICT

Yes, fine by me, but Wataru Ashihara reported the bug... ¯\_(ツ)_/¯

