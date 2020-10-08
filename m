Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 14FBA287297
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Oct 2020 12:34:07 +0200 (CEST)
Received: from localhost ([::1]:44666 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kQTFO-0008UA-6L
	for lists+qemu-devel@lfdr.de; Thu, 08 Oct 2020 06:34:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQTEH-00082w-VC
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 06:32:57 -0400
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633]:44533)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kQTEF-0005fq-Jj
 for qemu-devel@nongnu.org; Thu, 08 Oct 2020 06:32:57 -0400
Received: by mail-ej1-x633.google.com with SMTP id a3so7321539ejy.11
 for <qemu-devel@nongnu.org>; Thu, 08 Oct 2020 03:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=rPKiUURP0F/rtRI5WttTQVPMrnfczj11BVdLeMNAiO4=;
 b=wLMNM5fnvOelr4plxRTbbDzADatpZj5Lt4GZc5X0Kk41Zg45KQyTBOczrT9KYoqOi/
 aA3gOFnXjm+E8beG+oXIALSJC8yO5Q/0qrSWqS9L56e+Ee/zyKRUbqdluXwV2nXPPbH8
 WfgH98KKW/U8VDWHFguEetgQPTvZbV1Cpcpjk7PiN00T3mqErxnSX5Kjk6QzPwffZEQM
 CbNahlH6/v/uz03v6oTuLCSvjLYNIBWWuz9VbWngDDyllL9FtIQIE675KVaCtcItKLiD
 iDJ22bHVSxDdqfmapkt+kgDsFH8tFqGV3w64rjgeHDybvlabRMv7l46QZbkf4z3pf3L2
 RIMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=rPKiUURP0F/rtRI5WttTQVPMrnfczj11BVdLeMNAiO4=;
 b=Ixu/qG1fju8UIvqNQky5LQiY8p1+9GLiFJ1e+NJe3otcWe5d9SeZgH4rp3SE1CdfhQ
 QLpck28mEshWIdP9WcqrCM3eXvln7nnvI0BwoTU2WVK7iMvnSj+5EjL+Ea2jWEI5xI70
 AcxpbzICkxWd2GBk+EZ91jKXe0ckhEiL15EIwbH3DSKYJjg6agM3ynCVTz/FptWjQXsN
 nOPb2C8JjJodaaSSsaOhb2iJRn1d6Qq7TkLy7Jqrkpob2JDr2aFK6Vs4ebhaYjeDBhDq
 8f8bkCkcqLWIM2wCqtfAn5BUlTfy8KtPUE/4/YgFcho+MnmbJf3VkZ7evXOhzruk085b
 41Xg==
X-Gm-Message-State: AOAM532LWlrSzogDanEnGwP9WffgcKrlpNLYb0cZbnV/5Tr3FStl3yky
 m7HWR5nTAidLkCNTHtzFtOJHm1buZAiCF94YvkIOyg==
X-Google-Smtp-Source: ABdhPJxpI2TDyfVg6G+2OS5EatXrMObboB8oFhp6lcIk/sFxiz/L6z8Tnz8/mOkU2h1KhnfeQLxT0cyqCE0QfJuFdFY=
X-Received: by 2002:a17:906:60d6:: with SMTP id
 f22mr8054761ejk.250.1602153173768; 
 Thu, 08 Oct 2020 03:32:53 -0700 (PDT)
MIME-Version: 1.0
References: <20201006183122.155609-1-thuth@redhat.com>
In-Reply-To: <20201006183122.155609-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Oct 2020 11:32:42 +0100
Message-ID: <CAFEAcA-zUU=kVjGWDKKQU9EowyzyqpL7C3M7M8WLkeg6NoQTcQ@mail.gmail.com>
Subject: Re: [PULL 00/16] s390-ccw bios update
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::633;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x633.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Janosch Frank <frankja@linux.ibm.com>, Cornelia Huck <cohuck@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 qemu-s390x <qemu-s390x@nongnu.org>, Marc Hartmayer <mhartmay@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, 6 Oct 2020 at 19:31, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter,
>
> the following changes since commit d7c5b788295426c1ef48a9ffc3432c51220f69ba:
>
>   Merge remote-tracking branch 'remotes/stefanha-gitlab/tags/block-pull-request' into staging (2020-10-06 12:15:59 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/huth/qemu.git tags/pull-request-2020-10-06
>
> for you to fetch changes up to eb32abd8d931994d10327bd965a4fb12d765a0fb:
>
>   tests/qtest/cdrom: Add more s390x-related boot tests (2020-10-06 20:14:48 +0200)
>
> ----------------------------------------------------------------
> * Don't stop at the first unbootable device, continue scanning
> * Fix corner cases in booting from ECKD
> * s390x-ccw bios cleanup part 2
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

