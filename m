Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D710316CF9
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 18:39:05 +0100 (CET)
Received: from localhost ([::1]:36966 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9tSC-00020t-Bt
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 12:39:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55310)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9tMz-0004oJ-P1
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 12:33:44 -0500
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:40020)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l9tMw-00068H-En
 for qemu-devel@nongnu.org; Wed, 10 Feb 2021 12:33:41 -0500
Received: by mail-ej1-x632.google.com with SMTP id i8so5609588ejc.7
 for <qemu-devel@nongnu.org>; Wed, 10 Feb 2021 09:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KV+IRxm3rPMB8AJKjmL6QV7Tbvmc886OilwpnBShBJ4=;
 b=qB9gZhsBgfakHXJ03UVME2N+CZ5akJeObDuxf4TM9zoJauXx0twIxM2ZeStSUEUpik
 7QRAp1w3mhQz7iFVo9jaZZA/HT57DeJQ4IbekKWsy0J0kTPFeOXT18YdYByYeOg7q8z6
 CrM+M4HidcuTwIoAPMDcC5LsXIEnMl4fPMxm/fGjCbppbGrd30bG0ijjMIRqFbtNUPHG
 uoiZNbeWi9O33m08xo7NrJZ3twEvB0TuN1mWuIgHryrIv1hsvkJzkhrPs6JZQbaZVMTn
 fQZfGFePBLpdkG8EZDGviLYhUzuF8h6AYixPoMSpXZPfKbHk92ER9+fKWuwwmGVKNA/T
 YUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KV+IRxm3rPMB8AJKjmL6QV7Tbvmc886OilwpnBShBJ4=;
 b=M0CX8kdUwwwmZ6AqdcMEzukczo3OTzE9q4ywyIzy02/PLUXKln64vr/qMICFCmePmD
 oXhxN0g0KCV3TYyq49bhIH8S2PNNAjShXrHtaqL103FMqsLQIe72sqJUBh6uzEFfhTMR
 Fq92y3Bh05xrHQ4VUIdStKthUsiQemiUEb23lLo31FtfoT0imnXGY4xEmA5J/ApGL61n
 ChEzydLZ0MOML1PhCFgV7MLXWEoHKLjKa68kH5u8fclqFon4QkM/AXT+g4LnurwwXCP3
 TENG5CFBaRPuEqV4uvG4qBRsWFCf1MJ6UskZ2x9jCeqR4R2niUKruL5bARQcapmQ3o3a
 MdIA==
X-Gm-Message-State: AOAM533TtD6GGXphAxc4ODRrmnmdp5uag4pK9XCZoQq2XYBEPCVMRitl
 3MTz96yYV0J5SKDRYiTc5JvgcjZonxVzM7P9IS72Sw==
X-Google-Smtp-Source: ABdhPJwyMIx3aCUGSbu1H05OYLlJGkJPdWFbbHBoXeBHfgmitoGZWkjs6DWpZLcBr/6EwFGWg1EIWL31BfzqJUr7kio=
X-Received: by 2002:a17:906:3a89:: with SMTP id y9mr4016241ejd.4.1612978416666; 
 Wed, 10 Feb 2021 09:33:36 -0800 (PST)
MIME-Version: 1.0
References: <20210210092628.193785-1-stefanha@redhat.com>
In-Reply-To: <20210210092628.193785-1-stefanha@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 10 Feb 2021 17:33:25 +0000
Message-ID: <CAFEAcA8UtsFrULAcrffWwpKOBGrct258_D2C=+7PAcFHsavY8w@mail.gmail.com>
Subject: Re: [PULL v4 00/27] Block patches
To: Stefan Hajnoczi <stefanha@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x632.google.com
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
Cc: Fam Zheng <fam@euphon.net>, John G Johnson <john.g.johnson@oracle.com>,
 Thomas Huth <thuth@redhat.com>, Jagannathan Raman <jag.raman@oracle.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Qemu-block <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Denis V. Lunev" <den@openvz.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 10 Feb 2021 at 09:26, Stefan Hajnoczi <stefanha@redhat.com> wrote:
>
> The following changes since commit 1214d55d1c41fbab3a9973a05085b8760647e411:
>
>   Merge remote-tracking branch 'remotes/nvme/tags/nvme-next-pull-request' into staging (2021-02-09 13:24:37 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/stefanha/qemu.git tags/block-pull-request
>
> for you to fetch changes up to eb847c42296497978942f738cd41dc29a35a49b2:
>
>   docs: fix Parallels Image "dirty bitmap" section (2021-02-10 09:23:28 +0000)
>
> ----------------------------------------------------------------
> Pull request
>
> v4:
>  * Add PCI_EXPRESS Kconfig dependency to fix s390x in "multi-process: setup PCI
>    host bridge for remote device" [Philippe and Thomas]
>
> ----------------------------------------------------------------
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.0
for any user-visible changes.

-- PMM

