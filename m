Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 968053A9E98
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Jun 2021 17:07:22 +0200 (CEST)
Received: from localhost ([::1]:53380 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltX8T-0002JM-MW
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 11:07:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltX75-0000qH-ML
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 11:05:55 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:36686)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1ltX74-00030y-36
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 11:05:55 -0400
Received: by mail-wr1-x432.google.com with SMTP id n7so3100368wri.3
 for <qemu-devel@nongnu.org>; Wed, 16 Jun 2021 08:05:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:references:date:in-reply-to:message-id
 :user-agent:mime-version:content-transfer-encoding;
 bh=x2EdqcA4tFgI/UympGUQVkraBAzm2A8DQM9XMiH0DUk=;
 b=bIkPNaTIDWv6srF0jthYpRSfruJ+h6b4gpJpu7LI+ULpB4dPKXDrTP9GX29SQIm9Di
 eAqEvuggIogoe7ws9D8sBVHoouMUZnSaSce2UgaRUuSbMz1i+ge+1Oj0TGy3jQPUypxI
 EVUgVmz7/3Kqn8XeS1DVVv0vNT/Mq3ohYgBu9TPCe/vUq6Z6iQKngDO9x3U1xLaoNJ7/
 GZWCCp7q/dQUtzPcJSfRBaSTpaOGIenSQN7SC8mBBiKurqemuLoR14IVBVM5FsGVzLBA
 k5QKxYP2dwdK8rA71p9jYhTHL/k21SWsM91LLMPOgo0nyhfaantljqeDnfIW/HdWjzWk
 mQAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:references:date:in-reply-to
 :message-id:user-agent:mime-version:content-transfer-encoding;
 bh=x2EdqcA4tFgI/UympGUQVkraBAzm2A8DQM9XMiH0DUk=;
 b=A7pluTPbfRR2qtuU5q8uZP+eDPJn+/dSzRB1nd565ERgL3jTEXRb6vTsF3QrpmI7OH
 bai7gztc3hRgLXt/hGSrIyXw+AOe6qQCmgLYLMDRk7xGCTyn7Lo7kbG0T8qqKx2fhj20
 bqGqgetLbWLv0QZ8DvgSMkY397B2c+2gH3RZjPfUzemkIe+jewvQriXirc69rpqZV9CL
 je92Pj/xhTF4cpFQ1nhh2wqpBuW3IhnSoN+Zh/sQGC/CQh4X1SphJnuzm/iYnb//x+Ht
 T39ZLQ730BkcQLNxdHaqTwJrOx0ebg1KiiVXmJx5K9IhiUlu2sIPqt3ET5WhF5gC37dd
 7E2w==
X-Gm-Message-State: AOAM531UJBkw3RIjfDctU7DmFPb3vo9kEb+ZN2bWc/bmy4EUPUxVTy6q
 BG2Gb5WC+kK6O5KvQ25DAMRpkw==
X-Google-Smtp-Source: ABdhPJyLntlTSxXUZzakk02Fm2gY5VoOxdRiJP+jkMwgW34k3RrLIkfPmHw5F0QG2KeOxeUTMqCdkQ==
X-Received: by 2002:adf:ec43:: with SMTP id w3mr5854833wrn.270.1623855952401; 
 Wed, 16 Jun 2021 08:05:52 -0700 (PDT)
Received: from zen.linaroharston ([51.148.130.216])
 by smtp.gmail.com with ESMTPSA id s21sm3045736wmh.9.2021.06.16.08.05.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Jun 2021 08:05:49 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 733D91FF7E;
 Wed, 16 Jun 2021 16:05:48 +0100 (BST)
From: =?utf-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Subject: Re: [PATCH 00/21] linux-user: Move signal trampolines to new page
References: <20210616011209.1446045-1-richard.henderson@linaro.org>
Date: Wed, 16 Jun 2021 16:05:48 +0100
In-Reply-To: <20210616011209.1446045-1-richard.henderson@linaro.org> (Richard
 Henderson's message of "Tue, 15 Jun 2021 18:11:48 -0700")
Message-ID: <87pmwlg88j.fsf@linaro.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.0.50 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=alex.bennee@linaro.org; helo=mail-wr1-x432.google.com
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
Cc: qemu-devel@nongnu.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Richard Henderson <richard.henderson@linaro.org> writes:

> It is my guess that the majority of the flakiness with the
> linux-user signals.c test is due to a race condition between
> translation and page writes.  I vaguely recall a bug report
> about this, but I cannot find it now.
>
> Since the vast majority of "self-modifying code" is due to
> signal delivery, work around this by allocating a new page,
> into which we write the signal handlers.
>
> A better workaround would be to implement the vdso that is
> required by many guests.  However, that is a much larger
> problem, and some guests do not define a vdso in upstream
> linux.  This serves as a decent fallback.
>
> Neither bit of work, I will note, solves the posited race
> condition described above.

Well this certainly solves the failures I was seeing with
s390x-on-s390x:

  retry.py -n 500 -c -- ./qemu-s390x ./tests/tcg/s390x-linux-user/signals
  Results summary:
  0: 500 times (100.00%), avg time 2.253 (0.00 varience/0.00 deviation)
  Ran command 500 times, 500 passes

However qemu-hppa (on x86_64 host) still has the stuborn 1% failure rate
(-static build):

  Results summary:
  0: 198 times (99.00%), avg time 2.255 (0.00 varience/0.00 deviation)
  -4: 2 times (1.00%), avg time 0.252 (0.00 varience/0.00 deviation)
  Ran command 200 times, 198 passes

So have a:

Tested-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
(for s390x at least)

--=20
Alex Benn=C3=A9e

