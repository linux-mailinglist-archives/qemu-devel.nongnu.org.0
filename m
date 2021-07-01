Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD58B3B98C7
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 00:59:38 +0200 (CEST)
Received: from localhost ([::1]:43898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lz5ej-0005yx-F6
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 18:59:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36602)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lz5dL-0005IL-W9
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 18:58:12 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42761)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lz5dK-0002k7-8C
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 18:58:11 -0400
Received: by mail-wr1-x42c.google.com with SMTP id t6so262476wrm.9
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 15:58:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=z+BUpxudABKCHU7RoRje/gyUv8PzT7UfvHNnCYCWFSY=;
 b=GPVIiEtsYtoYJPwlPweVbw4lDGDq4ycDrkbP5MUZD4pLDbxHzA6qcUAk1AKtpJZeig
 eKlmzKXOW36Mwd6XXhIQMz0DfNmHVmkhZrkx4SZfMDXuFU2M38DF9ihpRM8pYn3GDB1z
 CRWLMLb66uDHkjSHIHkYvi4rukj1ST19Zn3fFvbEN0+0nZhI/lJ0bg0uER9cjNh5CWCG
 +la5vlrV+lRSlFniw5jYqAfcE0LPdVl8okz57Vm09BnuXezZJeb5D3WPEdZb9irhnL3k
 CR/IDdsPaHlCzsVvBNO8qmMG15POgB9+MsR6dtG4l9i19Zl7rQ01Kx3L+BLEKlgFgFIJ
 VPaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=z+BUpxudABKCHU7RoRje/gyUv8PzT7UfvHNnCYCWFSY=;
 b=isZqndaLokXsgVNZfM9g8LVmF8URHK6ZyhLjWp4i1kZMpfVINGAVbyqPEsiYh6kTOB
 eOO/Soaq4lPCAM8mX6hJ78j0rShm3SLPsmcKVdYm9TR3iIjuYTc987ourzsWjZ3QVOTo
 RaEgKYoBcSQh0oFp8a5NIoKg+FSFRovnXPaJu8wp2cNmPuWJBg/PzWuyza5VGKBxvkvV
 ZXYdUnyMdhvhTDey+ZZdOZ9yLVNpNjCvfEi4H1VeMpsFgDZ9yRcZqlKetSOpmzRAjuH8
 GS4vW4qbKgtX3ONbI+X+D9QbzELM7x5dR+S2cY85w5gjr8pCIygGypTalq6JVJWn02pN
 lOTA==
X-Gm-Message-State: AOAM5317FCWMieAc5svkP+vCalKIvWl2K+5blPkff64M+okYzfSKsfll
 JJZiEn3FXE6PEeTKddpp1xUxtg==
X-Google-Smtp-Source: ABdhPJwAEoIV6kB7wSjZCTnp9tDt0iN/3W6wvKoW2YWlK7Sn4AJLavxXVIed4fqfCriMxKRTSNV/2g==
X-Received: by 2002:a05:6000:1b07:: with SMTP id
 f7mr2248303wrz.305.1625180288056; 
 Thu, 01 Jul 2021 15:58:08 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id n19sm1199886wms.4.2021.07.01.15.58.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 15:58:07 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2C8E61FF7E;
 Thu,  1 Jul 2021 23:58:06 +0100 (BST)
References: <20210618091101.2802534-1-erdnaxe@crans.org>
 <87bl7lq361.fsf@linaro.org>
 <fb9922d6-5003-7a16-286b-022e78d72672@crans.org>
User-agent: mu4e 1.5.13; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alexandre IOOSS <erdnaxe@crans.org>
Subject: Re: [PATCH v2 0/2] execlog TCG plugin to log instructions
Date: Thu, 01 Jul 2021 23:57:51 +0100
In-reply-to: <fb9922d6-5003-7a16-286b-022e78d72672@crans.org>
Message-ID: <878s2pprpd.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42c.google.com
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
Cc: Mahmoud Mandour <ma.mandourr@gmail.com>,
 "open list : All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Alexandre IOOSS <erdnaxe@crans.org> writes:

> [[PGP Signed Part:Undecided]]
>
>
> On 7/1/21 8:49 PM, Alex Benn=C3=A9e wrote:
>> Alexandre Iooss <erdnaxe@crans.org> writes:
>>=20
>>> execlog is a plugin that logs executed instructions with some useful
>>> metadata including memory access.
>>>
>>> The output of the plugin is designed to be usable with other tools. For
>>> example it could be used with a side-channel leakage model to create
>>> side-channel traces from QEMU for security evaluation.
>>>
>>> Changes since v1:
>>>   - The output is now easier to parse.
>>>   - Use QEMU logging API rather than FILE* to write output.
>>>   - Don't reject memory information in user mode.
>>>   - Merge memory information with instruction execution. Now one line
>>>     means one instruction.
>>>   - Add documentation.
>> Where you planning on posting v3? I'm just seeing if we can get this
>> merged before code freeze in a weeks time.
>>=20
>
> I had a deadline next week but I managed to move it later, so I can
> try to make the important changes tomorrow and send v3.

Cool.

> I think I will contribute the support for triggering the beginning and
> end of tracing in another patch as I believe that's something we don't
> want to rush.

That's fine ;-)

--=20
Alex Benn=C3=A9e

