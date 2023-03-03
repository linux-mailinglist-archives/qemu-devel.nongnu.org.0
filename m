Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A61336A9A90
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 16:26:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pY7Gx-0005n9-Ds; Fri, 03 Mar 2023 10:24:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pY7Gu-0005mA-IG
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 10:24:36 -0500
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcin.juszkiewicz@linaro.org>)
 id 1pY7Gr-0000DW-Oq
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 10:24:35 -0500
Received: by mail-lf1-x131.google.com with SMTP id n2so4023104lfb.12
 for <qemu-devel@nongnu.org>; Fri, 03 Mar 2023 07:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677857071;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=2a7WGZA17VeRHV/hH2GwqOFfIXJQZ4/1f7SkZ7plGbY=;
 b=bc5ftC/265GQxVBpS+RiceCA7ThV1monicS4J0h8wOxFUn71NzzTn3ldR2Ge4xIf90
 5QM96xrzWGsvgn8Gw0gKGl7Mkl4rIvUHO9S1OWCGJviIlw44GfrDWt5F6weszz58AMIF
 4d5lllywnwo56U64yyN0zlAUIcRQ0bPCOfTCCVassDV9LF3iS36CiNUtGphyycRYUewX
 52AmgRGB2s2pb916ZqHjr2i76LtXA6R8P/RIaM9juXi1aWT52yhAdaso76IcelzEiUqQ
 B9i/k3nNPOJs4XRaEDkJzwWMb3gJiXz59eX2PuQ1FWPgYHJayxb113je/zE/nE8apvsK
 jtzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677857071;
 h=content-transfer-encoding:in-reply-to:organization:from
 :content-language:references:cc:to:subject:user-agent:mime-version
 :date:message-id:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2a7WGZA17VeRHV/hH2GwqOFfIXJQZ4/1f7SkZ7plGbY=;
 b=OfyLdW6IK3Tvrdl6xj0MU4I+tLIjzMwHlahtTn5yt4Js1WN/F/jdtjZl0tn6WbxsH+
 VHgCo5KSSLXB1dJjGc/ffNDzkiN2ZtM36xR11t2BHDCqNqf4Xyq9gL3OaL3JWYYfpCly
 tfYdEdIRC6iZKtchwHwHaFdq2XXKQyGetSqYDudmnT71svJWhlq2RDeHWBIfwbDGrdam
 5VOULMn9B1FkXpVmAvChX7cUTHzt+gYGSn2KYZACo3u8OAEWbGNrJ3CeP2D5ztMcyeLZ
 5KfQivPGPSrkfApzTSEzhifMcXBwGHQ9fesIECX8hoNfrXjlLEjunB4F9xkdmOuRxKYn
 Ol0g==
X-Gm-Message-State: AO0yUKW/8/r+NShmPN7ShRcjIxFWz1xbBfiUEYOD+sFUDJYcXbckLxPe
 4y7T8YXFtXbbQ3aU7nWHWT2LFw==
X-Google-Smtp-Source: AK7set8eqOnlHzDaMBjUb06FBMYIgEiwkZe/oRPCY99cJECc5IkkzN/3jsVW3StbbWGja4o9UlcvDw==
X-Received: by 2002:ac2:5dfa:0:b0:4b6:e405:1027 with SMTP id
 z26-20020ac25dfa000000b004b6e4051027mr620945lfq.14.1677857071562; 
 Fri, 03 Mar 2023 07:24:31 -0800 (PST)
Received: from [192.168.200.206] (83.11.36.13.ipv4.supernova.orange.pl.
 [83.11.36.13]) by smtp.gmail.com with ESMTPSA id
 f3-20020ac251a3000000b004d51b590772sm424578lfk.255.2023.03.03.07.24.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Mar 2023 07:24:31 -0800 (PST)
Message-ID: <2c067312-0c8b-730c-f7b7-5a3925e2b15e@linaro.org>
Date: Fri, 3 Mar 2023 16:24:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 2/3] tests/avocado: Add set of boot tests on SBSA-ref
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Cc: Radoslaw Biernacki <rad@semihalf.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Leif Lindholm <quic_llindhol@quicinc.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>
References: <20230302191146.1790560-1-marcin.juszkiewicz@linaro.org>
 <20230302191146.1790560-2-marcin.juszkiewicz@linaro.org>
 <87fsam9ifb.fsf@linaro.org>
Content-Language: pl-PL, en-GB, en-HK
From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
Organization: Linaro
In-Reply-To: <87fsam9ifb.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=marcin.juszkiewicz@linaro.org; helo=mail-lf1-x131.google.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.089,
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

W dniu 3.03.2023 o 12:27, Alex Bennée pisze:
>> +    def test_sbsaref_linux_max(self):
>> +        """
>> +        :avocado: tags=cpu:max
>> +        """
>> +        self.boot_linux('max')
> You probably want to encode the pauth-impef here so we don't spend all
> our time on the cryptography. e.g.
> 
>       self.boot_linux('max,pauth-impdef=on')

Thanks! Moved from 33s to 20s here:

from:

  (3/4) tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_linux_max: PASS (33.75 s)

to:

  (3/4) tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_linux_max: PASS (20.34 s)
  
> but even with that it seems to be timing out for me:

JOB ID     : 030a40bf6c2523b25bed4ca7a630b380d4dba39d
JOB LOG    : /home/marcin/devel/linaro/sbsa-qemu/code/qemu/build/tests/results/job-2023-03-03T16.04-030a40b/job.log
  (1/4) tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_tfa_v2_8: PASS (3.00 s)
  (2/4) tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_linux_a57: PASS (19.37 s)
  (3/4) tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_sbsaref_linux_max: PASS (20.34 s)
  (4/4) tests/avocado/machine_aarch64_sbsaref.py:Aarch64SbsarefMachine.test_alpine_sbsaref_max: PASS (71.96 s)
RESULTS    : PASS 4 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 | CANCEL 0
JOB TIME   : 115.00 s

