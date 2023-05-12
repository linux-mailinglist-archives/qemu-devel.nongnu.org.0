Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FDFB70086B
	for <lists+qemu-devel@lfdr.de>; Fri, 12 May 2023 14:50:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pxSDf-0007n3-6s; Fri, 12 May 2023 08:49:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pxSDd-0007mj-Jg
 for qemu-devel@nongnu.org; Fri, 12 May 2023 08:49:57 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <andrew@daynix.com>) id 1pxSDb-0000fD-Up
 for qemu-devel@nongnu.org; Fri, 12 May 2023 08:49:57 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-55a44a2637bso145454927b3.2
 for <qemu-devel@nongnu.org>; Fri, 12 May 2023 05:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=daynix-com.20221208.gappssmtp.com; s=20221208; t=1683895795; x=1686487795;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0t9SxAL60HDgbGFCf7CVa/x85Pz3rSUuACZTNnolz+c=;
 b=ELod8YTkiCloZeSskXFQke3oLzhPHHAnkkxzvu6R4MMymHQW59dYqM2/OHOzJ/FgVx
 NM7Lihk1M+zQG3Wk2sp83ncemhIyYGnArE+TnGNQAKBvjOajJc9vVl8lKMK+CSR+BMNA
 07UqD0sIQtnYkazgSlthBDDANKqijbumf9pnd8VqNo8uqM6fINInPRYCfKFwKxkM4Fpq
 0Gu8RtjeTBjpfUMR79X5H9XJVAO7JcyuTopmGNcrZQ8mwKD4iNxpqPGD5+Z3ZR+KV6pO
 nEorgYO3+ZBS3g1TnY4ueLrT4od1pPc5noBb+tVeAH4SDxFposfr4wdXNja0d0QYdnYa
 e/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683895795; x=1686487795;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0t9SxAL60HDgbGFCf7CVa/x85Pz3rSUuACZTNnolz+c=;
 b=d3zjQuU+j7f0JpfnC2s5f4sB2aH8x38zKUOpHnskUf9FtFabgzznclKy2IBMZVY4LP
 K8TLarjRMo93N/bkTsun5xiBdxG7vPaetugoDqwbqg84TzLE5uPJQplF8whDkV9WARXF
 1v5YXpflwEOStvNE5GlpeL6VyWnCf1oAqw2PNY3ohItJQJxF+Qk0bwoMJ7EcZSZqB01g
 dpsCYP2zN3F0YkFTPC5+VhrVPZlwPNfTWXSvs/UAvn7uYXh1iKhDfvO3MUaeWP7RD5wR
 I+00V9xU9um0/dCwNhmUleHPtX/+Gn5osDGPAeQlcQP+mIgC91zt/oBp9z+tN7K6gZmX
 Nfag==
X-Gm-Message-State: AC+VfDzTWiuosSVOXLusoNzrgDF5y6eTX22w8Ztep6211Yxjj37y9EsF
 tHigS6C12weJcvqcderuXLJlg4cQm7hYxvkjLMHcMA==
X-Google-Smtp-Source: ACHHUZ6LYsH+557CeHr8NUDL+fm5O+f834+LhHIqBuFUnhh2EMbO7odEB3qYQb2d6fa3RFiX0K6LLTImoNSOXotrQsg=
X-Received: by 2002:a81:6008:0:b0:54f:8b56:bb3 with SMTP id
 u8-20020a816008000000b0054f8b560bb3mr24370463ywb.5.1683895794929; Fri, 12 May
 2023 05:49:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230512122902.34345-1-andrew@daynix.com>
In-Reply-To: <20230512122902.34345-1-andrew@daynix.com>
From: Andrew Melnichenko <andrew@daynix.com>
Date: Fri, 12 May 2023 15:31:10 +0300
Message-ID: <CABcq3pFr7Fa9SkFmF4dVvmuvjr76QnYmDffSxN0M1dARoHuy_w@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] eBPF RSS through QMP support.
To: jasowang@redhat.com, mst@redhat.com, armbru@redhat.com, eblake@redhat.com, 
 qemu-devel@nongnu.org, berrange@redhat.com
Cc: yuri.benditovich@daynix.com, yan@daynix.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: none client-ip=2607:f8b0:4864:20::112d;
 envelope-from=andrew@daynix.com; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi all,
Also, a possible solution for libvirt may look like this:
https://github.com/daynix/libvirt/tree/RSS_eBPF (WIP)

On Fri, May 12, 2023 at 3:47=E2=80=AFPM Andrew Melnychenko <andrew@daynix.c=
om> wrote:
>
> This series of patches provides the ability to retrieve eBPF program
> through qmp, so management application may load bpf blob with proper capa=
bilities.
> Now, virtio-net devices can accept eBPF programs and maps through propert=
ies
> as external file descriptors. Access to the eBPF map is direct through mm=
ap()
> call, so it should not require additional capabilities to bpf* calls.
> eBPF file descriptors can be passed to QEMU from parent process or by uni=
x
> socket with sendfd() qmp command.
>
> Changes since v1:
>  * refactored code.
>  * eBPF program ids implemented as enums
>
> Andrew Melnychenko (6):
>   ebpf: Added eBPF map update through mmap.
>   ebpf: Added eBPF initialization by fds.
>   virtio-net: Added property to load eBPF RSS with fds.
>   ebpf: Added declaration/initialization routines.
>   qmp: Added new command to retrieve eBPF blob.
>   ebpf: Updated eBPF program and skeleton.
>
>  ebpf/ebpf.c                    |   54 ++
>  ebpf/ebpf.h                    |   31 +
>  ebpf/ebpf_rss-stub.c           |    6 +
>  ebpf/ebpf_rss.c                |  149 +++-
>  ebpf/ebpf_rss.h                |   10 +
>  ebpf/meson.build               |    1 +
>  ebpf/rss.bpf.skeleton.h        | 1469 ++++++++++++++++----------------
>  hw/net/virtio-net.c            |   55 +-
>  include/hw/virtio/virtio-net.h |    1 +
>  monitor/qmp-cmds.c             |   16 +
>  qapi/misc.json                 |   38 +
>  tools/ebpf/rss.bpf.c           |    2 +-
>  12 files changed, 1073 insertions(+), 759 deletions(-)
>  create mode 100644 ebpf/ebpf.c
>  create mode 100644 ebpf/ebpf.h
>
> --
> 2.39.1
>

