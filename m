Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C4B7A48CDB5
	for <lists+qemu-devel@lfdr.de>; Wed, 12 Jan 2022 22:22:35 +0100 (CET)
Received: from localhost ([::1]:44522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7l4k-0007XS-Um
	for lists+qemu-devel@lfdr.de; Wed, 12 Jan 2022 16:22:34 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7l3O-0006qn-S7
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 16:21:10 -0500
Received: from [2a00:1450:4864:20::434] (port=45581
 helo=mail-wr1-x434.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1n7l3N-0002Zg-6G
 for qemu-devel@nongnu.org; Wed, 12 Jan 2022 16:21:10 -0500
Received: by mail-wr1-x434.google.com with SMTP id q8so6491220wra.12
 for <qemu-devel@nongnu.org>; Wed, 12 Jan 2022 13:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=2yfvXuYC+pB9ynDwUGI7achzn93hF1V+ymTs2h3CFNU=;
 b=eilhK9uXuJOLAD5Q9nFzlkp6Y+lzGHlgWajPezpzKNTfFd6pFsJC0eg8aVRQ4MhX3r
 HvY1TcojK02zWIjmuThJA8KFxU5P/rAxDzUNaJpPeWjEkL8f7t7fu7xAJLbrdk2BdNlq
 RQyfjbHAEbq/D9GtjoOJtXauqHuLTBO6mPB9FMBw+LCV+rwtJ5Nug5WlN+ZytjEYrZ1P
 JTgrYouXDU/vybdvV+G/Dg+y7jQijSfQ2TfDInwcCUpKNXSwNc8INeOOPEyiZzg1UecB
 8DghvTJR39kcVUUiM9y6AoSb7A1uefavW/NrRKOI9BjqNrkoRLmlvD6DeXWyqSjdNUQu
 wJvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=2yfvXuYC+pB9ynDwUGI7achzn93hF1V+ymTs2h3CFNU=;
 b=UiIBg6eYLZja6qsauDZeav30j4wG8toPPCqzWz8L8ONjlgKOFNGctIUxRy/6hq1UEn
 hN82M+m5VGeE0tmB+Pjk3195ShMQTLElGJvQi4nWVEU2mfwZAbxR/qPS2rVpjd+diE5e
 45roFpWptgp+qDoZRttGYQRNKWkk+8ksR/N1jC9u8cljpExlZK+f2qERLTEokNGB1u4U
 LBRIOjrq/O8WTTuj8ueG6yjYQ6KXDCtfynf22g/EpFAUaI7HawxmTG6IvfswtfM/Q/yC
 Gnp7zlc5+t6Az2rITp2Q2CH4KcAXJIedolv4G1FZ3aOBFMAOLdOCbDcS5GZH0BQ38Ant
 470Q==
X-Gm-Message-State: AOAM532AZOQ/IcTLSARRLd54l+Rydi66C959FJqBG8UkVvLYeFLGa9Gu
 lm4Ufyo43NCh19Mchs3SNP+iQMExchGWV85yulTgPw==
X-Google-Smtp-Source: ABdhPJz/0hwprJZoSTkfm5SE9OaP2pPGhF2RyGQjmpU/HN026Bkk6iVbXNrMJWzCWo8jjw8vrKpoOkdwwi1+u6hDdRs=
X-Received: by 2002:adf:e907:: with SMTP id f7mr1312029wrm.319.1642022467333; 
 Wed, 12 Jan 2022 13:21:07 -0800 (PST)
MIME-Version: 1.0
References: <20220112112722.3641051-1-alex.bennee@linaro.org>
In-Reply-To: <20220112112722.3641051-1-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Jan 2022 21:20:56 +0000
Message-ID: <CAFEAcA--rEZ0+JxFzeSFD1j6FM65_x3CXcn_oTnaNkNVU1hW0Q@mail.gmail.com>
Subject: Re: [PULL 00/31] testing/next and other misc fixes
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::434
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 12 Jan 2022 at 11:27, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> The following changes since commit bf99e0ec9a51976868d7a8334620716df15fe7=
fe:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into stagi=
ng (2022-01-11 10:12:29 +0000)
>
> are available in the Git repository at:
>
>   https://github.com/stsquad/qemu.git tags/pull-for-7.0-110122-1
>
> for you to fetch changes up to dbd30b7abee963f4fb08892a7d7f920bb76ece58:
>
>   linux-user: Remove the deprecated ppc64abi32 target (2022-01-11 13:00:5=
3 +0000)
>
> ----------------------------------------------------------------
> Various testing and other misc updates:
>
>   - fix compiler warnings with ui and sdl
>   - update QXL/spice dependancy
>   - skip I/O tests on Alpine
>   - update fedora image to latest version
>   - integrate lcitool and regenerate docker images
>   - favour CONFIG_LINUX_USER over CONFIG_LINUX
>   - add libfuse3 dependencies to docker images
>   - add dtb-kaslr-seed control knob to virt machine
>   - fix build breakage from HMP update
>   - update docs for C standard and suffix usage
>   - add more logging for debugging user hole finding
>   - fix bug with linux-user hold calculation
>   - avoid affecting flags when printing results in float tests
>   - add float reference files for ppc64
>   - update FreeBSD to 12.3
>   - add bison dependancy to tricore images
>   - remove deprecated ppc64abi32 target

This seems to fail the ubuntu-18.04-s390x-all-linux-static job
with segfaults running linux-user binaries (not always the same
binary), eg:
https://gitlab.com/qemu-project/qemu/-/jobs/1968789446
https://gitlab.com/qemu-project/qemu/-/jobs/1968080419


thanks
-- PMM

