Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B55FF3555F6
	for <lists+qemu-devel@lfdr.de>; Tue,  6 Apr 2021 16:03:12 +0200 (CEST)
Received: from localhost ([::1]:35268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lTmIR-0005gy-3o
	for lists+qemu-devel@lfdr.de; Tue, 06 Apr 2021 10:03:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTmFq-0004d8-Op
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 10:00:31 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:38907)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lTmFp-0003Ke-3U
 for qemu-devel@nongnu.org; Tue, 06 Apr 2021 10:00:30 -0400
Received: by mail-wr1-x42e.google.com with SMTP id i18so10905700wrm.5
 for <qemu-devel@nongnu.org>; Tue, 06 Apr 2021 07:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=6Pkm13u/lxNR3hUEmGNyaUYLO3opyuBoiBzLR8mW6PY=;
 b=YwwXkD9afsfV2wEBcM7uyWEiRvPro9xO6gTMs9aW9JKEmzqKhlJ1iJH0N3bREwGXZ/
 pY9kUbixSBdzrFr24Xt904iHhZdpR2CIzL3bh+F2zslK+qZNT06j1ie9Di2dR1mcZ6fT
 Q8n8W/FkkmWIbw4BJdpmLi7PknR0qcM153VpZ0Dqksnknp2f6t90ShLO2ujpRHmnS8UM
 qw/vPVzSuPNX7v7sLLCFZVqBRWQAw5W8aEzz2r/X0z+kF7AEJrSTX3Ut1nzk1onxC3aa
 J7485pROHjpQZNk1gPxkjbIh9QbEnL3JfTw78sSh7q65/UP0O9LSgft+V7By8aqBvaJ3
 eMWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=6Pkm13u/lxNR3hUEmGNyaUYLO3opyuBoiBzLR8mW6PY=;
 b=eKW8vsZbeFCQViQfhlUcLrsx1BwckWci0eyih2MiWt6eV1zrK18Bh3YESR35ygvVd3
 4A2qf1nVHk0dPfLJURtK2XUCi+SqUGbDf7ojBC2DmIg9GgEjmVcL7OI+NfgG+xNkOm77
 12s2kSYv+oHtkGwyvQUJNFzmiUyutlURTQO9ciQG3+O1a2+hQJ+N8WS+VeJsRhDpJjOY
 eRK2cNkSFFu0StZOOokP4d2cKLH2UXIjfnHNJcyHfXvWozuYJx2NahYfz8AflipPLc6G
 lHeOAtdTm/LzdMuQtQwOu7E0UKFKyEGVKsONq5UsD9hNXnu4um7vrqsMMLiQ84Hq/3RD
 9Eog==
X-Gm-Message-State: AOAM531Gpo0EbSrolUGhwkVrKmLgnpanUbFAuy6RTjlzp2vazbFJIMze
 liRsC2m+fLpl5Xe5lk4U1SGR1g==
X-Google-Smtp-Source: ABdhPJwBUPN5NGVspb4UM3fvsnXyd6x8GaEoMe+p4vbWuUnd8mspHgbIm9MHG5GImYLM76KpcMl+Ng==
X-Received: by 2002:a5d:6c6f:: with SMTP id r15mr35627605wrz.77.1617717626691; 
 Tue, 06 Apr 2021 07:00:26 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id g16sm34888641wrs.76.2021.04.06.07.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 07:00:25 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id F2F2D1FF7E;
 Tue,  6 Apr 2021 15:00:24 +0100 (BST)
References: <20210401102530.12030-1-alex.bennee@linaro.org>
 <20210401102530.12030-7-alex.bennee@linaro.org>
 <d6c69484-4b56-e349-ed34-3211072b33fc@linaro.org>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH v2 06/11] tests/tcg/i386: force -fno-pie for test-i386
Date: Tue, 06 Apr 2021 14:59:59 +0100
In-reply-to: <d6c69484-4b56-e349-ed34-3211072b33fc@linaro.org>
Message-ID: <87k0pfwm13.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x42e.google.com
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
Cc: fam@euphon.net, berrange@redhat.com, Eduardo Habkost <ehabkost@redhat.com>,
 qemu-devel@nongnu.org, f4bug@amsat.org, stefanha@redhat.com, crosa@redhat.com,
 pbonzini@redhat.com, aurelien@aurel32.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Richard Henderson <richard.henderson@linaro.org> writes:

> On 4/1/21 3:25 AM, Alex Benn=C3=A9e wrote:
>> +                -Werror -fno-pie -no-pie -o $TMPE $TMPC; then
>
> What is -no-pie?  That isn't a compiler option, afaik.

No it's a c&p error from the main test in configure:

  # Check we support --no-pie first; we will need this for building ROMs.
  if compile_prog "-Werror -fno-pie" "-no-pie"; then
    CFLAGS_NOPIE=3D"-fno-pie"
  fi

dropping it now.

>
> r~


--=20
Alex Benn=C3=A9e

