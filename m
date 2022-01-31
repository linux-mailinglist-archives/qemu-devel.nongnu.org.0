Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 686AF4A3E5A
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 08:50:18 +0100 (CET)
Received: from localhost ([::1]:40972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nERS4-0002xI-Sl
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 02:50:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nEQmA-0003VV-CP
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 02:06:58 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:54608)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1nEQm6-00049s-Au
 for qemu-devel@nongnu.org; Mon, 31 Jan 2022 02:06:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1643612809;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TEhxUEz/R3JCNXm2vbGzYZ73rOrlFjOzct9okqtc21w=;
 b=W6Q5p/NAawfiaVSlMw+Keliwctrt5hO55+XX7m5sAycX/C8vdhGnMLzqTM9gq80ULxH3ea
 R2M5Ny8AcYrq9rDywqHi3pQimqux0er+Rl+QQCNR5AYD8OEoIfABGfZwOrzjjmVk7UeFUr
 Ed6NUhfwvrzaht4jaOSrm9CjMIaAeVg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-482-Zi-vAz-xN-KpJVvtJNvRvg-1; Mon, 31 Jan 2022 02:06:48 -0500
X-MC-Unique: Zi-vAz-xN-KpJVvtJNvRvg-1
Received: by mail-wr1-f69.google.com with SMTP id
 b3-20020a5d4b83000000b001d676462248so4427126wrt.17
 for <qemu-devel@nongnu.org>; Sun, 30 Jan 2022 23:06:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=TEhxUEz/R3JCNXm2vbGzYZ73rOrlFjOzct9okqtc21w=;
 b=zHjpDf60Hx9P2+inbwNLM5u0/2Kik1UmIkX0LQA8O/wqERJcAP3PCgYIjQ+mMfyYgK
 VusYz7WX+RUN7kYizjKrAyXGAlzE1MMAZ+iY5vqPLbNxCgmh2SRN2LWQS4Hr932JzqIR
 eV8Q89RWXklgh0scDA1gkdfeHp8etEumqOz0mmldQnXNcaSpBKtDYWWLFUX5IlbyPhKt
 qdyxujiGBtLKchqikTBGL+Gt0x6EzIq/riCirTi28niEv7+EzlPj7Y4X+2AqDxxmN93a
 RFvijdg/BhgwG4QxQgn8c3BTD4T3Et/SpOMfacwaOIjKbRAYJd/THmXGTaCVcTDqd1ei
 1WlA==
X-Gm-Message-State: AOAM533e3SsiYHCFp9vsjTgV/fXFqIbdN/sjD0vJ7plp+8SXZKQxtT5M
 7W2km7bsSLjg8UWFoVxAm4TVuxST8Cdr6dEF8XBHHy0FTToc11K8t+uGJTH7fbkmYTK5NAs2xbC
 PJYX09M9LAtuafjQ=
X-Received: by 2002:a05:600c:1d14:: with SMTP id
 l20mr16713005wms.182.1643612807536; 
 Sun, 30 Jan 2022 23:06:47 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwC8cLKm5/m77HSTFVz/Am33Uq3TMNr6p2wKBZ4/9DzicVq4BWJpSu7zMEYaQYAq1nLnZOpqA==
X-Received: by 2002:a05:600c:1d14:: with SMTP id
 l20mr16712961wms.182.1643612806885; 
 Sun, 30 Jan 2022 23:06:46 -0800 (PST)
Received: from [192.168.8.100] (tmo-096-196.customers.d1-online.com.
 [80.187.96.196])
 by smtp.gmail.com with ESMTPSA id 16sm7976897wmj.12.2022.01.30.23.06.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 30 Jan 2022 23:06:46 -0800 (PST)
Message-ID: <ba4b4c1e-3328-4375-b877-9eec06f04ff1@redhat.com>
Date: Mon, 31 Jan 2022 08:06:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: build-oss-fuzz CI job often times out
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Alexander Bulekov <alxndr@bu.edu>
References: <CAFEAcA8V0jAjv1HS8QRa9AQHCxg=BVVH_jYVMYUVSP-Szstq-Q@mail.gmail.com>
 <7a56fef0-0ac0-f4d5-eae7-23028e49d2bb@amsat.org>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <7a56fef0-0ac0-f4d5-eae7-23028e49d2bb@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.088,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Darren Kenny <darren.kenny@oracle.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> On 29/1/22 14:34, Peter Maydell wrote:
>> Hi; the build-oss-fuzz gitlab CI job seems to intermittently
>> but quite commonly hit the 1 hour timeout mark and get killed.
>> Examples from the last couple of days:
>>
>> https://gitlab.com/qemu-project/qemu/-/jobs/2030815488
>> https://gitlab.com/qemu-project/qemu/-/jobs/2029246068
>> https://gitlab.com/qemu-project/qemu/-/jobs/2029013479
>> https://gitlab.com/qemu-project/qemu/-/jobs/2024871970
>> https://gitlab.com/qemu-project/qemu/-/jobs/2022584981
>>
>> Can we do anything to cut down on the runtime of this job
>> and make it reliably complete inside the time limit?

All the jobs that you've listed hang in the very same test 
(qtest-i386/boot-serial-test), so I assume it's rather a test that now hangs 
occasionally, and not a generic slowness (otherwise the jobs would fail 
sometimes earlier, sometimes later).

Thus we likely have a regression in the code that only shows up occasionally 
in these builds... Can you mark a point in time when these issues first 
happened?

  Thomas


