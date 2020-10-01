Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A7D280167
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Oct 2020 16:37:03 +0200 (CEST)
Received: from localhost ([::1]:36820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kNzhf-0004Gx-2P
	for lists+qemu-devel@lfdr.de; Thu, 01 Oct 2020 10:37:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37212)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kNzZq-0000bi-D3
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 10:28:58 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f]:45575)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kNzZo-0000Rb-I0
 for qemu-devel@nongnu.org; Thu, 01 Oct 2020 10:28:58 -0400
Received: by mail-ej1-x62f.google.com with SMTP id i26so8357817ejb.12
 for <qemu-devel@nongnu.org>; Thu, 01 Oct 2020 07:28:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1idsRdf4LkGPm+ZOyFL1E4VR+ShWnfBN1bmc6IRwGcs=;
 b=KGWayp7UD/I5io1DXrOPZ6zQ7EZfaB1REYLJIgZsu9dY2Df9NOUrWJXth4KUgzwbzf
 HzCPO30JKJCN8WtBGIpVegv47EZKQFsD9bEfXnwFoRoCMSL1s6yaQshhSZaNBkYuNFNs
 JcgO48Vz1ExQjf3JRkkJhxmSCXq/OshQGgTgKw/TyIXOcTpPpbtZh1Maz2LWsIAsIMXc
 9H9RoyKVlnm+Pjqlx8KxRyMsu4q8ndMztaCXQTC0oMvZwG1y4RqI4U0BLCFlWZ3K8RVl
 haxYXSMXamMpX3fwxixQwd9oorjFl1KG4Cz8FL8+YJFAxOcUt10NMvllvzKkM967dWx8
 PCFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1idsRdf4LkGPm+ZOyFL1E4VR+ShWnfBN1bmc6IRwGcs=;
 b=p46fjSvoJl83mMTt0CWkvO5YA+lo5FXz3ERoM92cjHsAY/AHzMr1Mm0FWPFmd4uIbC
 WhfI4hfB+y5om9f7iz5pJlsZtCsXTKXra9SDPIYX+oZku75gSPemvAfA1WEC2VML+H9f
 dfsiSygxxh8GrIxXOI2nQC0ZzQ9O5UmtKG+/Nx7jlmQik6MDUGqKelOt3El54i1N0Zvk
 bb7RAlRQ1kbsToIKSQGoyuPVXWsshtV1re+KvL6iY8oK/LkwRxZLlm1DW31uZqOefJ/6
 qYio5Q7t2Vwq8HFfrqjc5+eKidUoONijnYxE/quO4NN1cPcqWM//6IYdpFYDSHLRlIhS
 e9SA==
X-Gm-Message-State: AOAM5326ZBpyB2rlBnGHD6rf9I9yKjzghLHUB0pCpL6ICDQLy3ga5NCc
 aoDrve+sZYd8175WyMbFOH0H53JsQmCmRGLRxhtRWQ==
X-Google-Smtp-Source: ABdhPJx7+gNEDqQSuHslu0m7wX8NrYRpg6yBtkHdj+3J9WmKS9sSR50AtlFjwxr4ySnUt1uYZPhrq1b9VRUfwbVqG7E=
X-Received: by 2002:a17:906:60d6:: with SMTP id
 f22mr1641131ejk.250.1601562534960; 
 Thu, 01 Oct 2020 07:28:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200930195850.278104-1-pbonzini@redhat.com>
In-Reply-To: <20200930195850.278104-1-pbonzini@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 1 Oct 2020 15:28:43 +0100
Message-ID: <CAFEAcA_8zHiTGZQBzun=aSAD-kX7wp4S7RVwPGK2SmR4HuO0Tg@mail.gmail.com>
Subject: Re: [PULL v8 00/86] Misc QEMU patches for 2020-09-24
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, 30 Sep 2020 at 21:04, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> The following changes since commit cbba3dc6ea3fc9aa66e9f9eb41051536e3ad7c=
d0:
>
>   Merge remote-tracking branch 'remotes/mst/tags/for_upstream' into stagi=
ng (2020-09-30 11:40:38 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/bonzini/qemu.git tags/for-upstream
>
> for you to fetch changes up to 37aeb7a28ddbf52dd25dd53ae1b8391bc2287858:
>
>   hw/net/can: Correct Kconfig dependencies (2020-09-30 19:11:37 +0200)
>
> ----------------------------------------------------------------
> * SCSI fix (Dmitry, Li Feng, Li Qiang)
> * memory API fixes (Eduardo)
> * removal of deprecated '-numa node', 'cpu-add', '-smp' (Igor)
> * ACPI fix for VMBus (Jon)
> * relocatable install (myself)
> * always remove docker containers (myself)
> * serial cleanups (Philippe)
> * vmware cpuid leaf for tsc and apic frequency (Sunil)
> * KVM_FEATURE_ASYNC_PF_INT support (Vitaly)
> * i386 XSAVE bugfix (Xiaoyao)
> * QOM developer documentation in docs/devel (Eduardo)
> * new checkpatch tests (Dov)
> * x86_64 syscall fix (Douglas)
> * interrupt-based APF fix (Vitaly)
> * always create kvmclock (Vitaly)
> * fix bios-tables-test (Eduardo)
> * KVM PV features cleanup (myself)
> * CAN FD (Pavel)
>
> meson:
> * fixes (Marc-Andr=C3=A9, Max, Stefan, Alexander, myself)
> * moved libmpathpersist, cocoa, malloc tests (myself)
> * support for 0.56 introspected test dependencies (myself)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/5.2
for any user-visible changes.

-- PMM

