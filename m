Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C08994C10D9
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Feb 2022 11:57:53 +0100 (CET)
Received: from localhost ([::1]:50258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMpLE-0007IU-Gr
	for lists+qemu-devel@lfdr.de; Wed, 23 Feb 2022 05:57:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMpHC-0004rp-3T; Wed, 23 Feb 2022 05:53:42 -0500
Received: from [2607:f8b0:4864:20::1034] (port=52992
 helo=mail-pj1-x1034.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nMpH8-0003eL-M7; Wed, 23 Feb 2022 05:53:41 -0500
Received: by mail-pj1-x1034.google.com with SMTP id v4so2272320pjh.2;
 Wed, 23 Feb 2022 02:53:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=lZssqJd+n1XnpkVpUFZXahFNvB8fU1LEeANQDXiRB+E=;
 b=i7nw+XsqWVwlXqWcciWH859tE8P46VSdYVy3GHT08dXdCG8c9XF5E/fDNtF9M4prPB
 +wx7q7ZzQ1jIE09cuXSa+OQSZb3SceEeUydpdm2jLY+/4KmqVKct17/5tx1QZb4vS4uO
 0w+QHGwJMBjer+8U7FWZzdsF2qXl3stl2/KBQPZXpAvJf0FNl3Xp7a2IZSu0TepJPao1
 p8n3pOlZvgBN8BqhDoNkIoDY9zPE8+6gPEVDjzfAS8iu5OupGAco26qHYHIvYZVthzsz
 WKuhyPRsfHveeTPWaSMNd8Oeh7ZocEo4zTBEIhNKRRbLoyVgIfOwtsdZSffamrKoTSw9
 wTvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=lZssqJd+n1XnpkVpUFZXahFNvB8fU1LEeANQDXiRB+E=;
 b=ILgEEhCewipScaefEZ+NEs8xV7xONIvP3AU84twO8icDU5WUgvfng9l7sD7vF96CoU
 ZpeXqk9eXMuAbOll2F8zAGf4M7tfPC/n3FyKMo4Kualx2UV6/MgLZuimQt658fERovuB
 2I0YXvvivW2Y7XttWjB41IgqJ7j116uh7w0ntTsumvlqcEnudqbbiT4zq9fBF0FSgWcF
 8kbnsWQrwl72kqF7t/xxZw8/Iw9uHNBKvq/l21PHOb/zuZPsNUWunoL1Fow3hR0yRr96
 Z3N5zZfUHFm8M0OjuTs4Ldjlci0JcllSxZZP+Dm75rV1nafihJ5vOkWRyN3EXiuZCce0
 gHNw==
X-Gm-Message-State: AOAM5304dSId91RxzKzt9BTzd2To/MFt03GzDxIx3Qlqn19Lt16kVNAZ
 mD6s2XXQ4naUEQI9QjTNFic=
X-Google-Smtp-Source: ABdhPJyeaZ7QfplSr4IwxWXQHitfH4L2DC+WGFLdEfJNAgT3XJjCMsOZ7CLv+BDooOtUc7pC6aRCjg==
X-Received: by 2002:a17:902:ccca:b0:150:406:6236 with SMTP id
 z10-20020a170902ccca00b0015004066236mr640967ple.67.1645613615369; 
 Wed, 23 Feb 2022 02:53:35 -0800 (PST)
Received: from [192.168.1.35] (71.red-83-50-68.dynamicip.rima-tde.net.
 [83.50.68.71])
 by smtp.gmail.com with ESMTPSA id q4sm24425046pgn.42.2022.02.23.02.53.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Feb 2022 02:53:35 -0800 (PST)
Message-ID: <afd92ed6-4392-3181-5875-5e42ad5f41b9@gmail.com>
Date: Wed, 23 Feb 2022 11:53:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: Analysis of slow distro boots in check-avocado
 (BootLinuxAarch64.test_virt_tcg*)
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>
References: <874k4xbqvp.fsf@linaro.org> <878ru2nacq.fsf@linaro.org>
 <YhURfqMvRT4xbiz6@redhat.com>
 <96bafa75-a0c6-f431-a6d8-fe98d438d0f9@gmail.com>
 <CAFEAcA8mNt_-nZoV7RL4_UQUV=nPQsDM8KBTA8qAGmiNtXWx9g@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philippe.mathieu.daude@gmail.com>
In-Reply-To: <CAFEAcA8mNt_-nZoV7RL4_UQUV=nPQsDM8KBTA8qAGmiNtXWx9g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1034
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x1034.google.com
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
Cc: Oleg Vasilev <me@svin.in>, Andrew Jones <drjones@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Cleber Rosa <cleber@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>, Idan Horowitz <idan.horowitz@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Emilio Cota <cota@braap.org>, Gerd Hoffmann <kraxel@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 23/2/22 10:19, Peter Maydell wrote:
> On Tue, 22 Feb 2022 at 17:33, Philippe Mathieu-Daudé
> <philippe.mathieu.daude@gmail.com> wrote:
>> We need the DEBUG profile to ensure the bios-tables-tests work.
>>
>> If you want to boot a guest using EDK2, you should use the images
>> build by your distribution (/usr/share/qemu/edk2-aarch64-code.fd),
>> not these images.
> 
> Do we have any other images in pc-bios that are silently
> "do not use these images, they are only for a very specific
> test case and nothing else" ?

I might try to move that to test/. Gerd, are you OK with that?

> Also, "make install" installs these EDK2 images, which doesn't
> seem like the right thing for "this is only for one test case".

Well I'd prefer we never had them installed. Today I don't remember
why it ended that way. Gerd, similarly, are you OK with not installing
these images (after a 2 release deprecation warning)?

