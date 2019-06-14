Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A26460B1
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jun 2019 16:27:41 +0200 (CEST)
Received: from localhost ([::1]:52056 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hbnB6-0000sC-Hf
	for lists+qemu-devel@lfdr.de; Fri, 14 Jun 2019 10:27:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57656)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alex.bennee@linaro.org>) id 1hbmyT-0005LQ-2A
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 10:14:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alex.bennee@linaro.org>) id 1hbmyQ-0006oW-Hq
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 10:14:36 -0400
Received: from mail-wr1-x441.google.com ([2a00:1450:4864:20::441]:38249)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alex.bennee@linaro.org>)
 id 1hbmyQ-0006mb-8X
 for qemu-devel@nongnu.org; Fri, 14 Jun 2019 10:14:34 -0400
Received: by mail-wr1-x441.google.com with SMTP id d18so2725173wrs.5
 for <qemu-devel@nongnu.org>; Fri, 14 Jun 2019 07:14:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=references:user-agent:from:to:cc:subject:in-reply-to:date
 :message-id:mime-version:content-transfer-encoding;
 bh=V64qY6tESmQvR2uX9MdXVe1+oVF5ood3jaPLYkEVa8g=;
 b=mggxqrBS8xsLZ/aUFSDMUNsPARpM4W0XThB4aOjbRlJnKiGSI7QILe3w5srauvAO/o
 ydgybxMEwJZ9DHdiBoEA9+BrSMBzu5kkHvFe5pFmwiJeqI5rxRVkx6OjM2NvxtHqlZf+
 bNulusnbjQE5tDsHt/ibGwC4gclj+3+GtP1hjf3pbHzIjLmaqTYYqbd/cD06lByPds74
 SGBAxBhz2JT+HII+s6sZZv+Mkiz28IMphh9ogh8Qn48LEH7Wgz7pwULAKECoeAA9JRFT
 4l70wPh1ygMEsfz3UhrO04YJEnlnqiv14AMYcj3Ek5FaRKF+6zlueStmjNNIVwfyg5uL
 FBlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:references:user-agent:from:to:cc:subject
 :in-reply-to:date:message-id:mime-version:content-transfer-encoding;
 bh=V64qY6tESmQvR2uX9MdXVe1+oVF5ood3jaPLYkEVa8g=;
 b=ZjJjvmK6l4EKfXgeWxw5lYYak7UJh4CFJJr5RjloygF9xD8xBz8utWIjCzEn+nBHHk
 DAVsW90kfrUE5vtEjhfpOE9+jD5DUPYN3V8hlO8j9xX0O0kCHaps3fv6EHUsLdLRA/Wz
 vGt3pC5zpKKlN9XwReCij8VAgRTJRelZjBEq7FX0Xd3chhiNrWMlg6UnTlgJ8RVl5p9o
 xsDtMRZTLGIYMtklNmhOtcwp4eSL1OuGoSRF/DegGiQYX0g6rThbuwFM1K4Lk/y7CHXc
 GMUcxsJ2ySvAlKpJso2SjEsbu8KStaG3CFcGkFRH8EfeKDZGJM4cxxuPS7IOBqMZ7PFh
 a0eg==
X-Gm-Message-State: APjAAAUlvf6I4iw45QkLGxUQ+EwGmw+9wFsgKYHoQdfw7Kf02ZwS4jQe
 KGf1u0Lj2V9hImXX7gJqGyJNtA==
X-Google-Smtp-Source: APXvYqx3eGUhjX6tJJejb44VXDqFEj0n99okZXCdtuwn85J7OfFZSIN97hprvmclpGMJrr+lQJzTYw==
X-Received: by 2002:adf:e8d0:: with SMTP id k16mr51799799wrn.31.1560521670740; 
 Fri, 14 Jun 2019 07:14:30 -0700 (PDT)
Received: from zen.linaroharston ([81.128.185.34])
 by smtp.gmail.com with ESMTPSA id h8sm2985143wmf.12.2019.06.14.07.14.30
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 07:14:30 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id C4BB21FF87;
 Fri, 14 Jun 2019 15:14:29 +0100 (BST)
References: <20190607152223.9467-1-crosa@redhat.com>
 <20190607152223.9467-2-crosa@redhat.com>
User-agent: mu4e 1.3.2; emacs 26.1
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Cleber Rosa <crosa@redhat.com>
In-reply-to: <20190607152223.9467-2-crosa@redhat.com>
Date: Fri, 14 Jun 2019 15:14:29 +0100
Message-ID: <87zhmkckze.fsf@zen.linaroharston>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::441
Subject: Re: [Qemu-devel] [PATCH 1/8] Travis: print acceptance tests logs in
 case of job failure
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
Cc: Fam Zheng <fam@euphon.net>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org, Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Cleber Rosa <crosa@redhat.com> writes:

> Because Travis doesn't allow us to keep files produced during tests
> (such as log files), let's print the complete job log to the "console"
> in case of job failures.
>
> This is a debugging aid, and given that there's been some timeouts
> happening on some tests, we absolutely needs the logs to have a proper
> action.
>
> Signed-off-by: Cleber Rosa <crosa@redhat.com>

Acked-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

> ---
>  .travis.yml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/.travis.yml b/.travis.yml
> index b053a836a3..9f8e73f276 100644
> --- a/.travis.yml
> +++ b/.travis.yml
> @@ -226,6 +226,8 @@ matrix:
>      - env:
>          - CONFIG=3D"--python=3D/usr/bin/python3 --target-list=3Dx86_64-s=
oftmmu,mips-softmmu,mips64el-softmmu,aarch64-softmmu,arm-softmmu,s390x-soft=
mmu,alpha-softmmu"
>          - TEST_CMD=3D"make check-acceptance"
> +      after_failure:
> +        - cat tests/results/latest/job.log
>        addons:
>          apt:
>            packages:


--
Alex Benn=C3=A9e

