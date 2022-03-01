Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EFADD4C94C7
	for <lists+qemu-devel@lfdr.de>; Tue,  1 Mar 2022 20:46:53 +0100 (CET)
Received: from localhost ([::1]:34048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nP8SS-0005eI-JY
	for lists+qemu-devel@lfdr.de; Tue, 01 Mar 2022 14:46:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46302)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nP87n-0000EH-VH
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 14:25:33 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:42987)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1nP87l-00071O-0a
 for qemu-devel@nongnu.org; Tue, 01 Mar 2022 14:25:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=Eul+z6OJIoq/iX3ovrrWIE9mEFaELMyIMurVzfutReU=; b=dThpSFcadjya7oGpG2qL4VCfle
 ENmZ+vuR3aaWU/c/rhJXuHsA33Dta3m6Gfu2RvkTmkSMz/Tgh8WEcwrmWIkp38IhwEph4PBDKTIwp
 /0CSoA/klLsaybMZqM5MsIcvJIiqWHix0trLvkr1I5YpAfZzz3SKNoxXx80g2iteMMb8hsX8sySSZ
 oDnXS1RQj8mlBPaMfp7V9sYbt4JuG3RVnz7wrDwSsktRyVVOnQ+O1WmdVilVgdwjbPeXKzGeNlKbW
 qvDtFPjZnOqywYWor7NOnbtR+KSjhIs8eya28Zo/TG9pySnCv2jQOp3U504K7SDliXjTdzSTBpPqp
 qOBfux2eHEOoQheQOFp4A2BTbAAzW8V3fAU859UcDe73OdvSqDcZv6j/rv6pJp5/R0Cih27L6xqiT
 5iyjccaPxPRkgDNVH0wwnwh5exYOr9KSkFMje4j+vgp8+4mnGxZRNmyelR7z6zWNpyhGl4t7YvFvN
 ZKZwCEnaB7TIoAeki51Z9aEnz0XpzUc7m8ZyZZRtzfdn69ApfGaq9BidrFNf2GEnfEFHHKn+JX76g
 lgWpb/19nlhLC/eVDsx2ZPNni2pSMg6VRF6QW9jNZkMxxIO/isXKXHXBC59bg3WWyr7GnFcep07XI
 /RzakXGahxJTncdITIr+o9QLMM40EpYXF9ha0Dx84=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Greg Kurz <groug@kaod.org>,
 Philippe =?ISO-8859-1?Q?Mathieu=2DDaud=E9?= <f4bug@amsat.org>, hi@alyssa.is,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v9 00/11] 9p: Add support for darwin
Date: Tue, 01 Mar 2022 20:25:24 +0100
Message-ID: <3049778.kzlV3qucMN@silver>
In-Reply-To: <20220227223522.91937-1-wwcohen@gmail.com>
References: <20220227223522.91937-1-wwcohen@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Sonntag, 27. Februar 2022 23:35:11 CET Will Cohen wrote:
> This is a followup to
> https://lists.gnu.org/archive/html/qemu-devel/2022-02/msg04391.html, adding
> 9p server support for Darwin.
> 
> Since v8, the following changes have been made:
> 
> Patch 4/11 (9p: darwin: Handle struct dirent differences)
> - Declare qemu_dirent_off as static to prevent linker error
> - Move qemu_dirent_off above the end-of-file endif to fix compilation
> 
> Patch 9/11 (9p: darwin: Implement compatibility for mknodat)
> - Fix line over 90 characters formatting error
> - Move qemu_mknodat back from osdep to 9p-util and adjust patch notes
> accordingly
> 
> Patch 11/11 (9p: darwin: meson: Allow VirtFS on Darwin)
> - Rebase to master
> 
> With these changes, this patch set builds and passes 9p synth tests on both
> linux and darwin.
> 
> Keno Fischer (10):
>   9p: linux: Fix a couple Linux assumptions
>   9p: Rename 9p-util -> 9p-util-linux
>   9p: darwin: Handle struct stat(fs) differences
>   9p: darwin: Handle struct dirent differences
>   9p: darwin: Ignore O_{NOATIME, DIRECT}
>   9p: darwin: Move XATTR_SIZE_MAX->P9_XATTR_SIZE_MAX
>   9p: darwin: *xattr_nofollow implementations
>   9p: darwin: Compatibility for f/l*xattr
>   9p: darwin: Implement compatibility for mknodat
>   9p: darwin: meson: Allow VirtFS on Darwin
> 
> Will Cohen (1):
>   9p: darwin: Adjust assumption on virtio-9p-test
> 
>  fsdev/file-op-9p.h                     |  9 ++-
>  fsdev/meson.build                      |  1 +
>  hw/9pfs/9p-local.c                     | 27 +++++--
>  hw/9pfs/9p-proxy.c                     | 38 +++++++++-
>  hw/9pfs/9p-synth.c                     |  6 ++
>  hw/9pfs/9p-util-darwin.c               | 97 ++++++++++++++++++++++++++
>  hw/9pfs/{9p-util.c => 9p-util-linux.c} |  8 ++-
>  hw/9pfs/9p-util.h                      | 46 ++++++++++++
>  hw/9pfs/9p.c                           | 42 +++++++++--
>  hw/9pfs/9p.h                           | 18 +++++
>  hw/9pfs/codir.c                        |  4 +-
>  hw/9pfs/meson.build                    |  3 +-
>  include/qemu/xattr.h                   |  4 +-
>  meson.build                            | 13 ++--
>  tests/qtest/virtio-9p-test.c           |  2 +-
>  15 files changed, 292 insertions(+), 26 deletions(-)
>  create mode 100644 hw/9pfs/9p-util-darwin.c
>  rename hw/9pfs/{9p-util.c => 9p-util-linux.c} (90%)

Queued on 9p.next:
https://github.com/cschoenebeck/qemu/commits/9p.next

Thanks!

Best regards,
Christian Schoenebeck



