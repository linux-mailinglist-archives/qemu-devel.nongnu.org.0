Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C4266B4141
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 14:51:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pad7l-0007MT-Ng; Fri, 10 Mar 2023 08:49:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pad7f-0007LZ-M0
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 08:49:27 -0500
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pad7e-0006DM-6L
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 08:49:27 -0500
Received: by mail-wr1-x429.google.com with SMTP id bx12so5074187wrb.11
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 05:49:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678456164;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=fQZxLeU2AgcDB0IDPEfOA7SNluIrT7soVxXB6fe/XvE=;
 b=CT8c1jbZyWJ2dqMNoAV0KvNBG5Sc08UmY24z43Sh8P+FeVOQZ6iZ6muBoCbxzgRktw
 obV7AJ54hrvc0qDTiy0C+bPQt3Sn3/RECnEj6vSuX+0ORTuDHd1L+r8JRVVWZkSUm/I8
 dvaKBX/L50JvmgA+zXE3/f4j70vsm8DtNJIYbSmbfEia9MlFRXdLHJpDqM+aBMdQi8MB
 VXu0KQ5kxiJWTeojsWi0/CXHak26HQ3aLj5JiFLgoXblxutK6FRIkwG087R1GutrtcaH
 6bT7ZsCGoGSt771H6kIwcms6dlPB7LTL/yxWHkJutuO8+2FhOKIinWWzKDoU8gOKGflP
 sE1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678456164;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=fQZxLeU2AgcDB0IDPEfOA7SNluIrT7soVxXB6fe/XvE=;
 b=2NfU/10YFkKqxB5ktUZM7OqrBSGJqvHz0bXbA9hQwFNgC8BqfGxaHv2af3GUttssw7
 VPZmP5Wz9vtNrkfl9wAkXPrYQGbrE/2OwdPNeZ+7FfQRRrBbwU2rdmYCZ3mYL6ogQiSf
 Nh7jFekbQKAuzaPH+Oe/elGfTcWVBTcp6Ab+fpotN7/kYB+SRCeiPHV4bB9zNVrVJZGh
 A/MdEEwJeye/iLqszRA7j6vw4KUe8KiEW9TgW3PulLTh5LDlpwKxD6G4kk6SbVcz7dxY
 NJmtNOQzNSlFJV9yfbYv1s3CqvielmESLzAZCJXqtuEFl1hCb/hJBKnJmSDizQJuoTEF
 CEeQ==
X-Gm-Message-State: AO0yUKVUP+wnmJ5vC/F9ZYGky8CMfDCFf5ZtwwJkrtXLXpib5b4WvQig
 SFoANlLxfLaOmGFbqn+EIfLjLQ==
X-Google-Smtp-Source: AK7set8FUN9ozHWDdG4rBaUNfnTQAJi+wObFH3t+E4BglDFoU2WwjbDkWNEp0+GRijp0ERLAa0jvGg==
X-Received: by 2002:adf:ecc9:0:b0:2ce:3d1d:808a with SMTP id
 s9-20020adfecc9000000b002ce3d1d808amr17123571wro.62.1678456164139; 
 Fri, 10 Mar 2023 05:49:24 -0800 (PST)
Received: from [192.168.1.115] (4.red-95-127-40.staticip.rima-tde.net.
 [95.127.40.4]) by smtp.gmail.com with ESMTPSA id
 c16-20020a056000105000b002c8ed82c56csm2209408wrx.116.2023.03.10.05.49.22
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 10 Mar 2023 05:49:23 -0800 (PST)
Message-ID: <03a66cae-4822-7cd2-8dd3-106e8b3f4334@linaro.org>
Date: Fri, 10 Mar 2023 14:49:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.8.0
Subject: Re: [PATCH-for-8.0] gitlab-ci: Remove job building EDK2 firmware
 binaries
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, Bin Meng <bin.meng@windriver.com>
Cc: qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>, 
 Simon Glass <sjg@chromium.org>, Thomas Huth <thuth@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Pawe=c5=82_Po=c5=82awski?= <ppolawsk@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@rivosinc.com>
References: <20230310133247.39268-1-philmd@linaro.org>
 <CAFEAcA8hDiWBXPhKmo=AsS5wfu8wKf2YbxwF4p7xRSWrCW4xEg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <CAFEAcA8hDiWBXPhKmo=AsS5wfu8wKf2YbxwF4p7xRSWrCW4xEg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
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

On 10/3/23 14:38, Peter Maydell wrote:
> On Fri, 10 Mar 2023 at 13:33, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
>>
>> When we introduced this Gitlab-CI job in commit 71920809ce
>> ("gitlab-ci.yml: Add jobs to build EDK2 firmware binaries"),
>> the naive plan was to have reproducible binaries by downloading
>> what this job would build, testing it and eventually committing
>> it. With retrospective, nothing happened 3 years later and this
>> job is just bitrotting:
>>
>>    Step 1/3 : FROM ubuntu:18.04
>>    18.04: Pulling from library/ubuntu
>>    mediaType in manifest should be
>>    'application/vnd.docker.distribution.manifest.v2+json' not
>>    'application/vnd.oci.image.manifest.v1+json'
>>
>> Remove this job to avoid wasting maintenance and CI ressources.
> 
> Does the same thing hold for the opensbi job ?

Cc'ing Bin, I have no idea.

