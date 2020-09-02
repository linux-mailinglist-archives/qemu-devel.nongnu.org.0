Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02FF625B436
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Sep 2020 21:03:59 +0200 (CEST)
Received: from localhost ([::1]:34876 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDY34-0000PR-3a
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 15:03:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kDY2N-0008Ma-0z
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 15:03:15 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:39743)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kDY2L-0007k9-73
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 15:03:14 -0400
Received: by mail-ej1-x62c.google.com with SMTP id p9so212404ejf.6
 for <qemu-devel@nongnu.org>; Wed, 02 Sep 2020 12:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=akehDGdq1N7BS9E6vyqR9oYlcHmGnUnZBaLV3xFOXwo=;
 b=N4u70hfZO66FLUk+exqFtRG7ufLxcpX+5pO8zxhlZI9BQmqFhZ/TqTKAHlVims/bbL
 pdij8Zdjvdw3NumBLhTML749nG4gek8S6XVW6e/2zb7Owk0yXyVotnSnOid080anSblq
 BMEAvbnodiEd7hTVdllMtDGCejyiJmU1bk0ABA2xipEJEmLEAJ9W8H7IwmeMAj1t9wZj
 QptACoIxOgAl/PJ66sT3hu+vdrpabj/8GElSI1Uj3k8eSiFWftpDg0NF0N7j7kiPyDRW
 qd5E3tvCEX+kiG6ppOXsmulI5vYgAaIxMvzX36sFWABYDOje9b4P2t3RC980PMPQJeNE
 D7nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=akehDGdq1N7BS9E6vyqR9oYlcHmGnUnZBaLV3xFOXwo=;
 b=tASgOwbfiilyRCR2ILuq7s/JgtRx+eewAmB7RUnT2oJzBwt0EbP3diOylvMTaZxtHW
 +YPfv4aeDOzwYRib4pcHYy+Xi/PSqKkIf7dv4Yk3dXgzE7NNQ7Sj4Y51AzUySSyBW+YJ
 hiRQaJISEmREmkmtwZc5WTkHsBWSlQ1tZ16qbJzo8f2mxnEGoBUa8A2cCAXx005bvyFp
 T1qzgCyEPPKZo5H7l1I08Prkxsj0/hK9uJjbyqxItVTieUnA43oHypbv6CwLwM6onL/y
 ZTGrQGHczVNDNVNnMcwGLYwN5TQd+3ipqyMflsrZAOzzFVRrK+5LzsUj+xMB6UPTw1uO
 4csA==
X-Gm-Message-State: AOAM5304nGjHyyih1ze8Ys9Vj/tjwaqipc8jp8B9dX+M+ADwvbvNxMx/
 1ddcVNZHUa/lmLFPMtiuk4TsKdsBcQyRLyoIMnjYCQ==
X-Google-Smtp-Source: ABdhPJxDbOUce4A1xHTsmB+X4dgwJkkxQSnQsdb44Ldz3OKhH5MpZyZ8BQtriYZKIi54TyLs8ybcnSGaqIvrATDLDv4=
X-Received: by 2002:a17:906:f28b:: with SMTP id
 gu11mr1408368ejb.407.1599073391315; 
 Wed, 02 Sep 2020 12:03:11 -0700 (PDT)
MIME-Version: 1.0
References: <20200902115323.850385-1-ehabkost@redhat.com>
In-Reply-To: <20200902115323.850385-1-ehabkost@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 2 Sep 2020 20:03:00 +0100
Message-ID: <CAFEAcA-SVODR0bdK4smEsWsu_dvOeDMthtDK3g7YTfKedNukdw@mail.gmail.com>
Subject: Re: [PULL 00/20] x86 and machine queue, 2020-09-02
To: Eduardo Habkost <ehabkost@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 2 Sep 2020 at 12:53, Eduardo Habkost <ehabkost@redhat.com> wrote:
>
> The following changes since commit 8d90bfc5c31ad60f6049dd39be636b06bc00b652:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20200901' into staging (2020-09-01 16:51:37 +0100)
>
> are available in the Git repository at:
>
>   git://github.com/ehabkost/qemu.git tags/machine-next-pull-request
>
> for you to fetch changes up to efacd5b89643ea98c9377630f9054de8b380008b:
>
>   target/i386/sev: Plug memleak in sev_read_file_base64 (2020-09-02 07:30:26 -0400)
>
> ----------------------------------------------------------------
> x86 and machine queue, 2020-09-02
>
> Bug fixes:
> * Revert EPYC topology patches that caused regressions
>   (Babu Moger)
> * Memory leak fixes (Pan Nengyuan)
>
> QOM Cleanups:
> * Fix typo in AARCH64_CPU_GET_CLASS
> * Rename QOM macros for consistency and/or to avoid
>   conflicts with other symbols
> * Move typedefs to header files
> * Correct instance/class sizes


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

