Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F209D38B406
	for <lists+qemu-devel@lfdr.de>; Thu, 20 May 2021 18:07:11 +0200 (CEST)
Received: from localhost ([::1]:45792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljlCS-0008Jq-4X
	for lists+qemu-devel@lfdr.de; Thu, 20 May 2021 12:07:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ljlAZ-0006SZ-M0
 for qemu-devel@nongnu.org; Thu, 20 May 2021 12:05:11 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:35810)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ljlAS-0008If-Pv
 for qemu-devel@nongnu.org; Thu, 20 May 2021 12:05:07 -0400
Received: by mail-wr1-x431.google.com with SMTP id a4so18265521wrr.2
 for <qemu-devel@nongnu.org>; Thu, 20 May 2021 09:04:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=pIgUFuK4GjatAeUaxzKXkqtZnvCBfiJ3fSAhuCayS54=;
 b=ry2V26QjkqB5KU5gqHnAQOiDk7MO58XUbWjoFOCQ3gfECDFWen03oa7hBxJwZ+6A8d
 mo9P588LF+EafXanZErCxXQeiyWMW5T9PZ/sMQoIwWeqGFP6GXEsvp9UWb14C5HXjrDa
 i0lpOPLsaEMqLJE5Wq99geccbPTcm4C6aZUH8j5eu/PahbZ+8NfNghLHMDQKmnpkmOdk
 CDzNBz2DcxLmjRdJLMg1L15k2vWB2VeAptlRfgQyrBkqS3xuaAVw4PbopjI5FLtJ9qFn
 ISvltrxrLPEXgSSClm/sn9/XQS/pzfcu1sdmkXBLBp5noE8xKxpMFrur175SI3xR79J7
 KyxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=pIgUFuK4GjatAeUaxzKXkqtZnvCBfiJ3fSAhuCayS54=;
 b=WpplCfI9O0aKO3scWGM25+fVsPsFr0XXefkV+WyuNdlDaZur9iQEVwevk/Ob1gB7mj
 VYHSKx1jEZ2xQNZ42ENNgMKtuTNc08QXiOzmW1Qf1lze/xnDSX5otkgqfvZAcd7cGbt/
 ncLqTOxQwLTQJTibVOZsRDh0TMDIGOT5utmMbp3/MZpPACCDmpiym34n6vsTCuxBq5Dj
 jCW6a06bFalJD/BcfcaTtEC5x86Q5eg4OUxREgG51F1bb4FNa/7tT8FUZvW+ItIeDDH9
 LfpJiFf6OxvN63Wwfh+fMFBlQ1sh70VcM3caVFhLENxcjdB6rSXauWghA1DQr/Dctlnr
 N30g==
X-Gm-Message-State: AOAM530axS6+USefrIA4r4eiZaL3ut5xaSRYTmnCZaavFOATLA1ibrFg
 eXqgRKyaxWjxZNTag/ITNtcvBQ==
X-Google-Smtp-Source: ABdhPJxZ5furVucIpLUHSwt93mGG+1Sur/dkGAoZjtza/utWoLIkymcf52UKA24mCKkPQp2PFqi5vg==
X-Received: by 2002:a05:6000:1849:: with SMTP id
 c9mr4954830wri.282.1621526697689; 
 Thu, 20 May 2021 09:04:57 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s11sm7220960wmf.14.2021.05.20.09.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 09:04:56 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 6D4F91FF7E;
 Thu, 20 May 2021 17:04:55 +0100 (BST)
References: <466cf154-cabf-2e8f-021f-a82cf7b88b31@suse.de>
 <20be5f7e-f475-4f3c-0fca-fff1750c08fe@suse.de> <87tun0cf3d.fsf@linaro.org>
 <198d8ef3-cc15-6f9d-6455-286748a705a8@suse.de>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Claudio Fontana <cfontana@suse.de>
Subject: Re: latest GOOD state of series i386 cleanup, arm cleanup, s390
 cleanup
Date: Thu, 20 May 2021 17:02:45 +0100
In-reply-to: <198d8ef3-cc15-6f9d-6455-286748a705a8@suse.de>
Message-ID: <871ra1crx4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Liang Yan <lyan@suse.com>, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Philippe =?utf-8?Q?M?= =?utf-8?Q?athieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Al Cho <ACho@suse.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Claudio Fontana <cfontana@suse.de> writes:

> On 5/18/21 4:02 PM, Alex Benn=C3=A9e wrote:
>>=20
>> Claudio Fontana <cfontana@suse.de> writes:
>>=20
>>> On 5/17/21 11:53 AM, Claudio Fontana wrote:
>>>> Hello all,
>>>>
>>>> due to my inactivity for a few weeks coupled likely with the upstream =
processes around qemu-6.0 now the series:
>>>>
>>>> 1) i386 cleanup
>>>> 2) arm cleanup and experimental kvm-only build
>>>> 3) s390 cleanup
>>>>
>>>> have become stale and hard to rebase on latest master.
>>>> This effect is compounded by the fact that lots of broken tests in
>>>> master have been added.
>>=20
>> Which tests are these? I know master suffers a bit from occasional
>> falling red but to my knowledge everything should be green (at least
>> from my last PR anyway ;-).
>>=20
>>>>
>>>> In the interest of not losing work,
>>>> I provide here the latest known good state of these series:
>>>>
>>>> For the i386 cleanup:
>>>> https://gitlab.com/hw-claudio/qemu/-/pipelines/293603386
>>>>
>>>> Tests started breaking horribly since about 1/2 weeks.
>>=20
>> The pipeline only shows one failed test (checkpatch) which is an
>> allowfail I believe. /me is confused.
>
> Hi Alex, yes, I pointed to the last pipeline that works :-)
>
>>=20
>>>> The latest version of the cleanup is reachable here:
>>>>
>>>> https://github.com/qemu/qemu.git branch "i386_cleanup_9"
>>>>
>>>> In my understanding, Paolo has now picked up this one.
>>>>
>>>> For the ARM cleanup and experimental kvm-only build:
>>>>
>>>> https://gitlab.com/hw-claudio/qemu/-/pipelines/293603376
>>>>
>>>> https://github.com/qemu/qemu.git branch "arm_cleanup_v15"
>>>>
>>>> Again here tests started misbehaving in the same timeframe.
>>>>
>>>> The state of ARM cleanup is still experimental, maybe Liang or
>>>> Philippe you can adopt this one?

I've done a re-base onto the current master (and my testing/next):

  https://github.com/stsquad/qemu/tree/review/arm_cleanup_v15

which is currently working it's way through my CI:

  https://gitlab.com/stsquad/qemu/-/pipelines/306727076

As I've got patches waiting for this re-factor I'm happy to take the
series on if you've run out of time/patience ;-)

--=20
Alex Benn=C3=A9e

