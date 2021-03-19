Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80D3534210A
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 16:35:12 +0100 (CET)
Received: from localhost ([::1]:60584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNH9Z-0000gO-NA
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 11:35:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38692)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lNH8i-0000B3-Vn
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 11:34:17 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:45792)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1lNH8h-0004Qy-B7
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 11:34:16 -0400
Received: by mail-ej1-x62b.google.com with SMTP id kt15so928198ejb.12
 for <qemu-devel@nongnu.org>; Fri, 19 Mar 2021 08:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:date:in-reply-to
 :message-id:mime-version:content-transfer-encoding;
 bh=2knq2NNkmmCkjHVHYqftbAFNI7uv67IWwN/pYuSW2Xo=;
 b=TD46rMdl64dxVIsaEgIvfUTAa8E+z1z6vtwM7wBBpV/gMlQT1S7TPy8gmJpnSbx/OW
 PA90dGYqxPKw0YCi4vYBsMXkFeNgJ/rFBUoSPvuok6DJPabCrunvFaOF44sjJxzaNqZE
 B5DZXU4T+AK2fqm9z0vMZztWxgUdBC+49CmKshzEwJBEw8LrCpi7DLEPNZSt10fdRWni
 C+rTwxk/jx3BpqpEtoTUta8QUkf9EqH9Dgx+AWlaPVuIJNm7VM9Zv00H0XkcPHPJIllx
 nAVDDQTJwAOgEOqHYEMbB8DG3TjYuoOMeVrU1/icviUCWU37YR0JVJ6Mpz+N2Xw/AqIL
 zQ8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject:date
 :in-reply-to:message-id:mime-version:content-transfer-encoding;
 bh=2knq2NNkmmCkjHVHYqftbAFNI7uv67IWwN/pYuSW2Xo=;
 b=nXvHqjcDC0DvK9SDLqLe0j3xXOPcHZb05ZPcuExtLAkcD9TFBlJp3Nn68OcFK/Dd7t
 dwOXKt7DNYP3od188AGdsJIgR/SHGyPH6mjT40PigSbfXnRyHzc1JfSLbZTuPntOfkeG
 tOH7vKaN6/DP5T0FzykJf1ay/PluGphOywMgMrZwrqLSBPNxzsjyAQd2TX6zAf1YqBwu
 f/ov6Ro/Kz8sTpCwF+G/aucLu06pWsap7LM/9FoLHtOOTENJIPGVpmCJdS8S27YR9v0Q
 D6tnLiDcL3LpEp6UesiCVO6PCnLhq+OELWobzmhFeApio/QZKnRccUkQqpjFpGeYEQas
 l2bA==
X-Gm-Message-State: AOAM530gnaFL6EBtXtXfyU6O064/hgQH65c3Bp5ggn7dp679Vb9hm61N
 6FLACwrpqNiw8XxhrZcZPjQ30A==
X-Google-Smtp-Source: ABdhPJyS8Sv0xy1ps9vFVNlVw28NEWaiCyGs5QVxMGeW6rfNT4tHmfaD7CvlJ4acL0lXx8QCMkTadg==
X-Received: by 2002:a17:907:3d8d:: with SMTP id
 he13mr5112051ejc.530.1616168053231; 
 Fri, 19 Mar 2021 08:34:13 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id z17sm3873257eju.27.2021.03.19.08.34.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 08:34:12 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id ABADA1FF7E;
 Fri, 19 Mar 2021 15:34:11 +0000 (GMT)
References: <20210317110512.583747-1-thuth@redhat.com>
User-agent: mu4e 1.5.11; emacs 28.0.50
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH 0/2] Fix atomic test in "configure" + bump FreeBSD CI to
 12.2
Date: Fri, 19 Mar 2021 15:33:51 +0000
In-reply-to: <20210317110512.583747-1-thuth@redhat.com>
Message-ID: <87h7l79mz0.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=alex.bennee@linaro.org; helo=mail-ej1-x62b.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Ed Maste <emaste@freebsd.org>,
 qemu-devel@nongnu.org, Li-Wen Hsu <lwhsu@freebsd.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Thomas Huth <thuth@redhat.com> writes:

> FreeBSD 12.1 is out of service now, so the Cirrus-CI task is failing due
> to using some packages from 12.2 on the 12.1 image. We have to update
> it to 12.2. However, there are two obstacles:
>
> First, the check for the 128-bit atomic functions in the configure
> script does not work right with the version of Clang in FreeBSD 12.2
> anymore. Looks like the __atomic_*_16() functions do not have valid
> prototypes anymore. First patch fixes this issue.
>
> Second, there is a problem with libtasn1 and the latest version of
> Clang that also triggers on FreeBSD 12.2. We have to disable gnutls
> in this task until libtasn1 got fixed in FreeBSD.
>
> Thomas Huth (2):
>   configure: Don't use the __atomic_*_16 functions for testing 128-bit
>     support
>   cirrus.yml: Update the FreeBSD task to version 12.2

Queued to for-6.0/fixes-for-rc1, thanks. b4 did manage to pick up v2 of
2/2 which confused me a little.


--=20
Alex Benn=C3=A9e

