Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 332366B3DCE
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Mar 2023 12:31:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paaxr-0008AS-Ko; Fri, 10 Mar 2023 06:31:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1paaxo-000885-UM
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 06:31:09 -0500
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1paaxl-00028S-TM
 for qemu-devel@nongnu.org; Fri, 10 Mar 2023 06:31:08 -0500
Received: by mail-pl1-x62e.google.com with SMTP id ky4so5237226plb.3
 for <qemu-devel@nongnu.org>; Fri, 10 Mar 2023 03:31:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678447864;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=oHiWaNHWbPUQydF5OuQk9Nyspq0Lxc/46BWpvc8m3u8=;
 b=nlKfwxYiDsaDnCwxpb4uz/8w9/Ol7aSu3Vi5N66a/TAOgSWadIgpFxU4BPklWiOxTp
 GHfa/I09gNLQM0DywDfYwiwfL2BDIANTyXiTAulh7kwZxBMHLbFDfXwt4fT07/mV+MHm
 g/KDtbWhXCdXutfhnbIY0viwWqbKIIy8aWSTX5oD5D0TtoIXOCkejj7QIJdr8ZnL/+4D
 9kJrUueNblqe5xZ2p9sSn1tdarmaK3SNXg/cr75fMWaQZpwGafRMLHWVGsbsJ7XJp69O
 8yGXUjZiCJ1fbQUzl03BD4IiAHAqI3ASoisDeHH1CjKbkJyYPS3rjgN0ZBvrTvlONwhv
 6luw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678447864;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oHiWaNHWbPUQydF5OuQk9Nyspq0Lxc/46BWpvc8m3u8=;
 b=Ld4I+YvyoqWSZ86CbswYddqoKJR0PVMVH7wU4+jvLvidwltB7wX7Hh7WTkKcJ+ift5
 f8P15zBcYsXDH7GCGDbDaIi4lDDlOIXsfPiwv0QOHLGDRa2BDiNSCd0Q/ZixnReBpMFC
 k+zwntP8ZNi75/xraorTa3sfl4EEi8yNuyJ3wWyg+wmgyMZvk6ASbK6ct9qmewGd+hgD
 iMbUFgSK/6trTMm/w/x3oPXZ58mqS0JcFpn51Wj+7FJYVo7qxuEVSIRKx6HM+VP+9V2T
 Xd9lKepnh0EsoK2sjLSsaqiPmtIvBf/4rS+ZkJRaWvKb/wOKeXQrFk9SAQa+SLvT70Ud
 i3Iw==
X-Gm-Message-State: AO0yUKVOC01WrV+l/4IJzPmo+rCVyGmgHBWqOtGdT8aRt5nEKE97e6NH
 c4vwLDssmmvDgAmO0FhKTegtRDDyvHr/MEOCzy/cqQ==
X-Google-Smtp-Source: AK7set9uN1uTwCTXSQGN2dnp5Nuilp/Bwp662b6wSeiKs0rHIbPir1d5CfGbPg5DmNXas7U3JN9tnZ95hEqGy138GPY=
X-Received: by 2002:a17:903:2788:b0:19a:9580:7130 with SMTP id
 jw8-20020a170903278800b0019a95807130mr9519255plb.13.1678447864168; Fri, 10
 Mar 2023 03:31:04 -0800 (PST)
MIME-Version: 1.0
References: <20230309115714.906369-1-kraxel@redhat.com>
In-Reply-To: <20230309115714.906369-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Mar 2023 11:30:53 +0000
Message-ID: <CAFEAcA_KwKQjgsx+4C_3an6ujhN=ETYFbaOjgU7Bg4OYt10OgA@mail.gmail.com>
Subject: Re: [PULL 0/3] Edk2 stable202302 20230309 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Thu, 9 Mar 2023 at 11:58, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 9832009d9dd2386664c15cc70f6e6bfe062be8=
bd:
>
>   Merge tag 'pull-riscv-to-apply-20230306' of https://gitlab.com/palmer-d=
abbelt/qemu into staging (2023-03-07 12:53:00 +0000)
>
> are available in the Git repository at:
>
>   https://gitlab.com/kraxel/qemu.git tags/edk2-stable202302-20230309-pull=
-request
>
> for you to fetch changes up to 75bc97ac50634229fa9da45faa1fa64bbe6024c7:
>
>   edk2: update firmware binaries (2023-03-09 12:49:29 +0100)
>
> ----------------------------------------------------------------
> edk2: update to 202302 stable tag
>
> ----------------------------------------------------------------
>
> Gerd Hoffmann (3):
>   edk2: update submodule to edk2-stable202302
>   edk2: replace build scripts
>   edk2: update firmware binaries

The docker-edk2 CI job fails:
https://gitlab.com/qemu-project/qemu/-/jobs/3910666498

Step 1/3 : FROM ubuntu:18.04
18.04: Pulling from library/ubuntu
mediaType in manifest should be
'application/vnd.docker.distribution.manifest.v2+json' not
'application/vnd.oci.image.manifest.v1+json'

This may be fixable with an equivalent of:
https://lore.kernel.org/qemu-devel/20230224212543.20462-2-palmer@rivosinc.c=
om/
for .gitlab-ci.d/edk2.yml

What I still do not understand is why we have both:
(1) binaries of edk2 committed to git
(2) a gitlab CI job that is building edk2

The bios-tables-test also fails:
https://gitlab.com/qemu-project/qemu/-/jobs/3910666555
(but also seen on other configs):

=E2=96=B6 206/206 ERROR:../tests/qtest/acpi-utils.c:158:acpi_find_rsdp_addr=
ess_uefi:
code should not be reached ERROR
206/206 qemu:qtest+qtest-aarch64 / qtest-aarch64/bios-tables-test
ERROR 706.75s killed by signal 6 SIGABRT

(I also tested this with the qga and hexagon pullreqs,
but neither of those should have affected this.)

thanks
-- PMM

