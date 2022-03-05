Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CC6E4CE448
	for <lists+qemu-devel@lfdr.de>; Sat,  5 Mar 2022 11:48:13 +0100 (CET)
Received: from localhost ([::1]:45456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nQRxL-0002DQ-NT
	for lists+qemu-devel@lfdr.de; Sat, 05 Mar 2022 05:48:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQRw1-0001Tr-Ik
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 05:46:49 -0500
Received: from [2607:f8b0:4864:20::1130] (port=37736
 helo=mail-yw1-x1130.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nQRvz-0005EK-WA
 for qemu-devel@nongnu.org; Sat, 05 Mar 2022 05:46:49 -0500
Received: by mail-yw1-x1130.google.com with SMTP id
 00721157ae682-2dc28791ecbso103211427b3.4
 for <qemu-devel@nongnu.org>; Sat, 05 Mar 2022 02:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xXRJbJ2R9XFtRwTfYKTSX1NrVoK5KlEFm0xeRcFdjoY=;
 b=laZQnV4+g8qmeu7xvmFwVzPVm7v1vzrHIXKNr6kstsMi+ncke90nfaG4jdkGVJKPYi
 IyqlcsRykF4fx8N6gRW3MKzY/vjIFcil6T3vsD5Kke6zTEY9zQBoZfaz2ds5RFdafjHq
 LlpiXQDCRAf7jYyXiXE99HsQiHzYEs2I4P1/xXN8KofrhwVaMI/cy/BUcHF+c53OXLbx
 xGDzHR3IXbCUUHvP22YDCN12xJgCkHYqB3p6uypAP3RvQ09KRhhuLkqXbbPXrZhcLa7I
 82cASI9hRpyJgYA+JImnHqgx2OnFlYR4mUXSY8eKSB6Ye76eMo7eDkDX7q+jh0YH7g61
 uIvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xXRJbJ2R9XFtRwTfYKTSX1NrVoK5KlEFm0xeRcFdjoY=;
 b=Jx3q2n7kHs2bRu+7a2Hzyt3dieOSK95kU2gubZdmb4F/ghSAtQ8i3E5+r5AkHKFv2v
 6ds64UX9DuzE8b3ddof8DTzynfkkFdzVmSA1oxNCnNgsS2UHjfZIRXYTPp7Nz0j8nu/5
 IhIL8srmUxLsj8pHkUi8fpVs44XukXPjF3S2lLlzrReXdFu6ZFsG5ANLmtQXL1D3D4H5
 61QgPHrIFQJPe8Y4ArAm/LsOmWZ1oNLNUioVoW+5tJv4RCGQuGk1aCm1knYDkUdmKgR1
 sOjt838JxrosHPpeYeCqM1aXyKVAUmAR7LH28p5ybL+VquI9oSK4Y7a6jxK08Bvjj0VJ
 Pv4w==
X-Gm-Message-State: AOAM5317c0vUNaPmZqouhD97VjLC2n2NMpvL3ZnVnPs/EYPsfDWzEhEh
 ZuAyr1ikhOWC19u5dx9CDHSzzn0fMmE6HI5JSMvFrg==
X-Google-Smtp-Source: ABdhPJx0RD3Zghk8YKTJH64GUr97aH+DaLFT2ON8WTnFdcNK1a+e6pRp4AbI9HhPUvLWUAxj5zx2xh6RG1OBixB9cKU=
X-Received: by 2002:a81:a748:0:b0:2d6:1f8b:23a9 with SMTP id
 e69-20020a81a748000000b002d61f8b23a9mr2024606ywh.329.1646477206899; Sat, 05
 Mar 2022 02:46:46 -0800 (PST)
MIME-Version: 1.0
References: <20220304142123.956171-1-kraxel@redhat.com>
In-Reply-To: <20220304142123.956171-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 5 Mar 2022 10:46:35 +0000
Message-ID: <CAFEAcA9yJJXkLf+CFPjnQbuCZfjw5YFPzjM01hbwJnjE7pL0=Q@mail.gmail.com>
Subject: Re: [PULL 00/35] Kraxel 20220304 patches
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::1130
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::1130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1130.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Thomas Huth <huth@tuxfamily.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>, qemu-devel@nongnu.org,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 4 Mar 2022 at 14:21, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> The following changes since commit 6629bf78aac7e53f83fd0bcbdbe322e2302dfd1f:
>
>   Merge remote-tracking branch 'remotes/pmaydell/tags/pull-target-arm-20220302' into staging (2022-03-03 14:46:48 +0000)
>
> are available in the Git repository at:
>
>   git://git.kraxel.org/qemu tags/kraxel-20220304-pull-request
>
> for you to fetch changes up to 02218aedb1c851340207db89b8eeb96843fed241:
>
>   hw/display/vmware_vga: replace fprintf calls with trace events (2022-03-04 11:38:07 +0100)
>
> ----------------------------------------------------------------
> usb: fixes for ohci, xhci, mtp and redirect
> audio: latency fixes
> ui: opengl and cocoa fixes
> firmware: ovmf tabel aprser fixes
>
> ----------------------------------------------------------------


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/7.0
for any user-visible changes.

-- PMM

