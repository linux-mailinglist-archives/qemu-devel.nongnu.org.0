Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8085B355050
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 11:46:40 +0200 (CEST)
Received: from localhost ([::1]:52870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTiIB-00018b-H2
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 05:46:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTiGx-0000dq-Uq
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 05:45:23 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:34497)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTiGs-0007AL-NF
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 05:45:23 -0400
Received: by mail-wr1-x436.google.com with SMTP id b9so5595418wrs.1
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 02:45:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=+XKO3oY9mBdmq9QChfcjoxlkMvBL8lSpM9uI+GOkEZ4=;
 b=PgtUdM2UMsd8S3Yq8OWrBbZ4rvq2uFAtztqUjQXpUnOMSEmYMm7c6EBV2vfNX205uo
 lvGagy0oJMNSIrQOsujoYN6KEZm9l0FEPe+jH/tpvQa64xzxQWp3mi/d3B51dfp0lmQG
 6rvBKG7gJyc82DRSOiWMr5Jo7z8TwxzUqzDmi9uheps96NcLlPO/UM9m9tTmCsESzDa0
 eBR13G+oMW1h5dAYIQiNVSzOQ+h8ylBneGjzmRTFju+yJ7bS+SYEUraKdY4MwX9+88m7
 GE8cMNeY8mYCruVwCtPBOc4qwRcs9YiGgM7dS96ZkUX5KLonmZPd1cxo49buKBH0Gmq5
 JEAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=+XKO3oY9mBdmq9QChfcjoxlkMvBL8lSpM9uI+GOkEZ4=;
 b=WkBYgaeTjvC2pmb8xpxqqVIhbh9VdeU6ENtp+to5X1GyBwKm9MxnpWzUTAD6HkrKCV
 SL/nATadmuddi0NF9np+xdp9XOdaj3H8adRt4NTCy9Qc6s9oHu4IJrYZWt86hYcs9XPA
 KyYXS2VIL/tALApxd4SenLKPbfM5PCpehQM55RKvkFRrX7UpUUZ0LgTw+8w/lK2zE31L
 VYy9Eodik+KX0bEYAHjhKZ0QrOk8/PiHn8d5sro2LGuC1y+1hCLInVUJ8UPxRbibopKg
 JbjMmNtR878CM7ZRMoOBsJwHSONdt0J8Ncc57mu3wo4BllkWtmBlyxPTbGIiMbdkt0a9
 dw6w==
X-Gm-Message-State: AOAM530cxEjtIgdrF+k0YBlrnPHYrGzdou9Jlya7sVJ+O8eKW3yg4VC4
 PPu/CCYKqxHcZuE9D2OanTQDQA==
X-Google-Smtp-Source: ABdhPJztB4j/ocIZj1yq/quuEYjOO0qMb9varv92O4Sm8lTiZAeBL6cgN//1izGMu1OvQPrp5K46Qg==
X-Received: by 2002:adf:f742:: with SMTP id z2mr33014068wrp.130.1617702316247; 
 Tue, 06 Apr 2021 02:45:16 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id a65sm2232482wme.17.2021.04.06.02.45.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 02:45:14 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2D8451FF7E;
 Tue,  6 Apr 2021 10:45:14 +0100 (BST)
References: <20210401102530.12030-1-alex.bennee@linaro.org>
 <20210401102530.12030-8-alex.bennee@linaro.org>
 <de4fa9a0-8951-14fa-d2c4-fa0df2fbf8f8@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 07/11] tests/tcg: relax the next step precision of
 the gdb sha1 test
Date: Tue, 06 Apr 2021 10:43:47 +0100
In-reply-to: <de4fa9a0-8951-14fa-d2c4-fa0df2fbf8f8@linaro.org>
Message-ID: <87v98zwxud.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, qemu-devel@nongnu.org, f4bug@amsat.org,
 stefanha@redhat.com, crosa@redhat.com, pbonzini@redhat.com,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 4/1/21 3:25 AM, Alex Benn=C3=A9e wrote:
>>       check_break("SHA1Init")
>>   -    # check step and inspect values
>> +    # Check step and inspect values. We do a double next after the
>> +    # breakpoint as depending on the version of gdb we may step the
>> +    # preamble and not the first actual line of source.
>> +    gdb.execute("next")
>>       gdb.execute("next")
>>       val_ctx =3D gdb.parse_and_eval("context->state[0]")
>>       exp_ctx =3D 0x67452301
>
> This double next seems just as fragile.  Why don't you just set the
> breakpoint where you want, which appears to be sha1.c:138?

Ideally I'd want an unambiguous label that gdb would understand lest it
got broken by someone tweaking the sha1.c code. I thought a function
header would be better but it appears only marginally so.=20

>
>
> r~


--=20
Alex Benn=C3=A9e

