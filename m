Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 286B427947
	for <lists+qemu-devel@lfdr.de>; Thu, 23 May 2019 11:32:36 +0200 (CEST)
Received: from localhost ([127.0.0.1]:60538 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hTk5T-0000Cd-B7
	for lists+qemu-devel@lfdr.de; Thu, 23 May 2019 05:32:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:36649)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hTk39-0007Tb-OS
	for qemu-devel@nongnu.org; Thu, 23 May 2019 05:30:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hTk38-0006Zi-Gn
	for qemu-devel@nongnu.org; Thu, 23 May 2019 05:30:11 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:37757)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hTk38-0006ZN-AC
	for qemu-devel@nongnu.org; Thu, 23 May 2019 05:30:10 -0400
Received: by mail-ot1-x331.google.com with SMTP id r10so4813860otd.4
	for <qemu-devel@nongnu.org>; Thu, 23 May 2019 02:30:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9f8jBWdzfHZ/m1QIVPpppB4fkIOceN0i3Ak6ZmNr/YY=;
	b=YU4kZ4cPfEvlOr/CFV0py/a/5QXNvuefagiiemaD/lSrzYfFgCHvWl5SYSfSwy/L1t
	BRkbhBYAetsUU1wNL+EALej+vtyhyiaV7hBCEbmYWE4dEfqzz4QYIjapz6ojYfrlJPDV
	IcqCYSVOVgzveM1GTiiKoBJBj0LTHpsV0dmz+t1AFUgwkWZzTVWTjpg4ALVQm4O6mdLO
	2D2G3hcERQ2jg4FwJZ+z+zxnWWvljQZ486ge5IpYazNOu8e62H1OxvRTI4J1C2eF2Jho
	n3RqkKpsjzk3UeWWLURSGGrR1UcJwXbjCddnU1ZKpadmr46HGa3MjmY7OrNOuwV/0QLY
	JWFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9f8jBWdzfHZ/m1QIVPpppB4fkIOceN0i3Ak6ZmNr/YY=;
	b=OZGm3swQe5NEEMKtirdPRViwn4/HCmenFADQqhAvU14beximxLu8+vbN0JmJnb8S4t
	N9AlVzOAwAtRWgTxhYs1iiJlq2F28wKOw7R4Z2tuUXOTgpUmCMNFDwgU4fMB597uP8Im
	TTGaEf+hq1wAUu5ArHWDcy1PkAcb4D5RRqNjClvNwa3DCU6OlOC/HGQDDjI14V66djCo
	3O3iqgvoO3r6e+8/71I4cYkpsv4ZVLvOM8jBnnpe4r/GUx7mxAH7YDB2E6VMxFZLYCES
	c3XqDEjo6fqPgIwvsShQ7NOXnOkYlrS2eKe3UzjcxiImECpAVfb/r+p4bhmW72dZnH2v
	ArAQ==
X-Gm-Message-State: APjAAAUJZezWOpULHWGmgdqNTe2bDpeqGH/UoL94qWfYjpqlaWmJiOWS
	wHZ6aoy6JDQV9H1xMsSVZCZ5VJoELHjEO6A7W3vvpQ==
X-Google-Smtp-Source: APXvYqz/qNkK2UGYtmCYUo4+MwpExTrRp5fqjYaE9ogstRHIHKjWYg5At8ROMlQKYO2ZjLFJvmx9wpA0vIQL/n+2V60=
X-Received: by 2002:a9d:77d5:: with SMTP id w21mr106945otl.97.1558603809298;
	Thu, 23 May 2019 02:30:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190522044600.16534-1-david@gibson.dropbear.id.au>
In-Reply-To: <20190522044600.16534-1-david@gibson.dropbear.id.au>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 May 2019 10:29:57 +0100
Message-ID: <CAFEAcA_-O7AS-qBmj_Ba6N69WW5DBenPmxUATs3vQcdBW5Hj5w@mail.gmail.com>
To: David Gibson <david@gibson.dropbear.id.au>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::331
Subject: Re: [Qemu-devel] [PULL 00/38] ppc-for-4.1 queue 20190522
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Laurent Vivier <lvivier@redhat.com>,
	=?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>,
	qemu-ppc <qemu-ppc@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 22 May 2019 at 05:46, David Gibson <david@gibson.dropbear.id.au> wrote:
>
> The following changes since commit a4f667b6714916683408b983cfe0a615a725775f:
>
>   Merge remote-tracking branch 'remotes/cohuck/tags/s390x-20190521-3' into staging (2019-05-21 16:30:13 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/dgibson/qemu.git tags/ppc-for-4.1-20190522
>
> for you to fetch changes up to 885659103ad9e1b0460e89c548e9fb823b007b7e:
>
>   docs: provide documentation on the POWER9 XIVE interrupt controller (2019-05-22 10:38:22 +1000)
>
> ----------------------------------------------------------------
> ppc patch queue 2019-05-22
>
> Next pull request against qemu-4.1.  Highlights:
>   * KVM accelerated support for the XIVE interrupt controller in PAPR
>     guests
>   * A number of TCG vector fixes
>   * Fixes for the PReP / 40p machine
>
> Other than that it's just a bunch of assorted fixes, cleanups and
> minor improvements.
>
> This supersedes the pull request dated 2019-05-21.  I've dropped the
> headers update, since it had a mistake, but is now made redundant by a
> similar update in Cornelia's applied PR.  I've also added a patch with
> extra documentation for the XIVE interrupt controller, and fixed a
> couple of minor style errors in the previous PR.
>
> ----------------------------------------------------------------

Hi -- this failed 'make check-tcg' for the linux-static build
(x86-64 host):

  TEST    linux-test on ppc64abi32
qemu-ppc64abi32:
/home/petmay01/linaro/qemu-for-merges/accel/tcg/cpu-exec.c:700:
cpu_exec: Assertion `!have_mmap_lock()' failed.
qemu-ppc64abi32:
/home/petmay01/linaro/qemu-for-merges/accel/tcg/cpu-exec.c:700:
cpu_exec: Assertion `!have_mmap_lock()' failed.
/home/petmay01/linaro/qemu-for-merges/tests/tcg/Makefile:122: recipe
for target 'run-linux-test' failed

thanks
-- PMM

