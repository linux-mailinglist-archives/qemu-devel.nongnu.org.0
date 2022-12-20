Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87C7965205F
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 13:31:08 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7bkg-0002F5-Ik; Tue, 20 Dec 2022 07:29:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7bke-0002Ex-T3
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 07:29:44 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p7bkd-0001yO-CD
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 07:29:44 -0500
Received: by mail-wr1-x429.google.com with SMTP id z10so1005441wrh.10
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 04:29:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=eErY1wD4r0F7N3v4G4BfBZp1BLq6uAoutCTIi1eZjfc=;
 b=d9TClU6jcluGCNTVcQ1caTK5L/b+aNiwHRcf/YRgcYo0+m1g+uj1L2k4Sq4K3uekka
 Il0WyIEdHFrnp5coXUw9druYd3j5u4AuCc5+COFprqYOhfOoRikLLueZ826w7ZfF77DG
 lCt2+4hT7WVmn8wcGBxLJRkjpfF0dqfo2nYAVwGZ8YO3mka4LEU2t+RRfyttGmXrOpvW
 6E06uBHIrLU0IWUMvnEF1aXEuhPnrQaVsUXAc7+HaiEg7174MIWorPo3wdZgy+gEY7kZ
 +r/R1VeZPXDCnB51LXJWJMftPgyzGa+Q2eYMcxaPb3lIoAddvExZctnXoTsAv66iHx4T
 KAyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=eErY1wD4r0F7N3v4G4BfBZp1BLq6uAoutCTIi1eZjfc=;
 b=BbFsRFYxYGxW2D+PANPEH4clc40EuJ6XDGw10FrY/l+tOq1s1hm1yZqZEP7VQugC9r
 /DSt2C/UZsBp3q5aaA7UsRJW4JMKruf2uRrgIWxRGl2aU88zQI/GqbsbAO6vIS7JDREM
 Ymo/s/9k0b7eVM6e4a80Zq7HXb7QxBQLO/+eEUIGHLNYVfgMs7JUfPDl8ro4kCroM6f4
 wG4fRpATF+2jBTVVxaygO96ETPvD+XiIq+eiGmozS5f5A8t0/N8bWNdgK8dt9SfCGpk4
 HMQcLe/n9trltxabgf8pybtwpiZYm/Lipj2grazqAs60/HTBgX2G5ubaUCuZknjADvs7
 rsXg==
X-Gm-Message-State: ANoB5pmmAKDQJD9ErwWcYILplly25mfUgqNUPJPkxLuHKKZPHLqpd7G7
 RYHPMzjRD9TP4bbfeaKDb4DWMQ==
X-Google-Smtp-Source: AA0mqf6Wi89cRpnU83MI0VJ5A7DsEmcLfujrvtreZxjOasf2YtJE1ht08DI05NWjESqmjXee5vfp1Q==
X-Received: by 2002:a5d:574f:0:b0:242:5b60:e23c with SMTP id
 q15-20020a5d574f000000b002425b60e23cmr25962859wrw.19.1671539381556; 
 Tue, 20 Dec 2022 04:29:41 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76]) by smtp.gmail.com with ESMTPSA id
 f4-20020a5d58e4000000b002425be3c9e2sm12571661wrd.60.2022.12.20.04.29.40
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 20 Dec 2022 04:29:40 -0800 (PST)
Message-ID: <0d5454ae-290e-b767-d633-f6dc7ff6d438@linaro.org>
Date: Tue, 20 Dec 2022 13:29:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.6.0
Subject: Re: [PATCH v3 12/18] ui: Move more HMP commands from monitor to ui/
Content-Language: en-US
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, kraxel@redhat.com, dgilbert@redhat.com,
 berrange@redhat.com
References: <20221220090645.2844881-1-armbru@redhat.com>
 <20221220090645.2844881-13-armbru@redhat.com>
 <cd8d91b0-b639-b7e5-ba62-f9b11fe5567b@linaro.org>
 <87v8m68fcr.fsf@pond.sub.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <87v8m68fcr.fsf@pond.sub.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -32
X-Spam_score: -3.3
X-Spam_bar: ---
X-Spam_report: (-3.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-1.161,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On 20/12/22 12:49, Markus Armbruster wrote:
> Philippe Mathieu-Daudé <philmd@linaro.org> writes:
> 
>> On 20/12/22 10:06, Markus Armbruster wrote:
>>> This moves these commands from MAINTAINERS section "Human
>>> Monitor (HMP)" to "Graphics".
>>> Signed-off-by: Markus Armbruster <armbru@redhat.com>
>>> ---
>>>    include/monitor/hmp.h |  2 ++
>>>    monitor/misc.c        | 66 -------------------------------------------
>>>    ui/ui-hmp-cmds.c      | 66 +++++++++++++++++++++++++++++++++++++++++++
>>>    3 files changed, 68 insertions(+), 66 deletions(-)
>>
>> You forgot to move hmp_sendkey() along.
> 
> Moved in the previous patch.

Oops :)

> If I get your R-by, I'll squash the two patches together.

Hmm not needed, the previous patch is already big enough.

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Thanks!

