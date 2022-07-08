Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C74FD56AF7A
	for <lists+qemu-devel@lfdr.de>; Fri,  8 Jul 2022 02:48:24 +0200 (CEST)
Received: from localhost ([::1]:41770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9cAR-0001Ov-On
	for lists+qemu-devel@lfdr.de; Thu, 07 Jul 2022 20:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9c8K-0000b0-GT
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 20:46:12 -0400
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630]:41823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9c8I-0003kd-Gv
 for qemu-devel@nongnu.org; Thu, 07 Jul 2022 20:46:12 -0400
Received: by mail-pl1-x630.google.com with SMTP id j12so8283392plj.8
 for <qemu-devel@nongnu.org>; Thu, 07 Jul 2022 17:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=+nRDci7hrIyqcRctMHGjkNfqN0AJnjgUOq3R3w3vuOo=;
 b=WGZwLOmZLKe8V2fzmKmTrYtvuPEe7oqgHG56yCxh7TgO2r0Hpzg7+9gZrg1TWmCcJT
 sHY2DlFg5XjUCeA3zxhDjq/ISSxzhH11xgOrUPDLWLrG4utYm7UpNDiR6r9LjOvT+7ht
 +S8nDuaXxj47jloqE/rGaDYncSmCkcUuNnKn+e7QMBBbvPVT/PtIn7EzzQpqXAeaEPdf
 eMN9J90SNDNtXT8iQmHeD35S2EjLRrAmOd4Rn1UBh3602SXqDWy3CEecEWIgapHTEPrT
 ZsZEjFsrp9OBmtnedfS22VJwrwbK6/UoVqsG4tQLG8TxwMXNA1JEgiCASOKDX/+XfuZR
 Bamw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=+nRDci7hrIyqcRctMHGjkNfqN0AJnjgUOq3R3w3vuOo=;
 b=PR4d1z60iF2jyuolCbbULxAruQemiNib72dA0Q3j8ZfluuziK8PXCyropv4Gp0izEg
 TTBbBGs72xni1z80FAFrpIt8B01JAvxqq7BF2/AS5cPlwMcNJUGW1DtN2ixit2UfsNiT
 mtHQwuvYKKbjxx8sXho63B+pJ7SSAFjWY1sVCratXJhenMvO26Dm8CjrnmAh5kEfE4sO
 +xhFU1mLVlxqoH5bJwpqf8/g3JjK9Wfou6cT2QioOQT+PXQXfWCM0Z2lFFxKAtY8lLye
 sTHyk4fEuC0IOm3I4UjBicpiEiRZrERbAK9+algLxilVLT34rizyWaz+ipQieZAGv5q0
 lrWw==
X-Gm-Message-State: AJIora9KNszjmuUYET/lOuu463C1ZHTWZebZS1sWxzLoxmyDlmtmsT/6
 UK1nMzZOawaJLxTFn9LeC/3xsw==
X-Google-Smtp-Source: AGRyM1tXmGAEVWi6A1hs21TDWYcuthaPsjQ7jZkPtqvJ/I6yq5rNk0336Jqg8wQ05JQeD7QRZWhcNw==
X-Received: by 2002:a17:902:e84e:b0:16c:773:9daf with SMTP id
 t14-20020a170902e84e00b0016c07739dafmr806083plg.43.1657241168775; 
 Thu, 07 Jul 2022 17:46:08 -0700 (PDT)
Received: from [192.168.138.227] ([122.255.60.245])
 by smtp.gmail.com with ESMTPSA id
 y27-20020aa78f3b000000b0052942bde65bsm725685pfr.30.2022.07.07.17.46.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Jul 2022 17:46:08 -0700 (PDT)
Message-ID: <1419e7e7-78f6-249c-4778-f0645a772eda@linaro.org>
Date: Fri, 8 Jul 2022 06:16:03 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PULL 00/18] s390x updates
Content-Language: en-US
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org
References: <20220707075426.1163210-1-thuth@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220707075426.1163210-1-thuth@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::630;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x630.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

On 7/7/22 13:24, Thomas Huth wrote:
>   Hi Richard!
> 
> The following changes since commit 39e19f5f67d925c60278a6156fd1776d04495a93:
> 
>    Merge tag 'pull-xen-20220705' of https://xenbits.xen.org/git-http/people/aperard/qemu-dm into staging (2022-07-05 22:13:51 +0530)
> 
> are available in the Git repository at:
> 
>    https://gitlab.com/thuth/qemu.git tags/pull-request-2022-07-07
> 
> for you to fetch changes up to 3d8111fd3bf7298486bcf1a72013b44c9044104e:
> 
>    target/s390x: Exit tb after executing ex_value (2022-07-06 19:04:57 +0200)
> 
> ----------------------------------------------------------------
> * Check validity of the address in the SET PREFIX instruction
> * Fix booting from devices that use 4k sectors, but are not like DASDs
> * Re-evaluate pending interrupts after EXECUTE of certain instructions

Applied, thanks.  Please update https://wiki.qemu.org/ChangeLog/7.1 as appropriate.


r~


> 
> ----------------------------------------------------------------
> Janis Schoetterl-Glausch (1):
>    target/s390x/tcg: SPX: check validity of new prefix
> 
> Richard Henderson (4):
>    target/s390x: Remove DISAS_GOTO_TB
>    target/s390x: Remove DISAS_PC_STALE
>    target/s390x: Remove DISAS_PC_STALE_NOCHAIN
>    target/s390x: Exit tb after executing ex_value
> 
> Thomas Huth (13):
>    pc-bios/s390-ccw: Add a proper prototype for main()
>    pc-bios/s390-ccw/virtio: Introduce a macro for the DASD block size
>    pc-bios/s390-ccw/bootmap: Improve the guessing logic in
>      zipl_load_vblk()
>    pc-bios/s390-ccw/virtio-blkdev: Simplify/fix
>      virtio_ipl_disk_is_valid()
>    pc-bios/s390-ccw/virtio-blkdev: Remove virtio_assume_scsi()
>    pc-bios/s390-ccw/virtio: Set missing status bits while initializing
>    pc-bios/s390-ccw/virtio: Read device config after feature negotiation
>    pc-bios/s390-ccw/virtio: Beautify the code for reading virtqueue
>      configuration
>    pc-bios/s390-ccw: Split virtio-scsi code from
>      virtio_blk_setup_device()
>    pc-bios/s390-ccw/virtio-blkdev: Request the right feature bits
>    pc-bios/s390-ccw/virtio: Remove "extern" keyword from prototypes
>    pc-bios/s390-ccw/netboot.mak: Ignore Clang's warnings about GNU
>      extensions
>    pc-bios/s390-ccw: Update the s390-ccw bios binaries with the
>      virtio-blk fixes
> 
>   pc-bios/s390-ccw/netboot.mak     |   7 ++-
>   pc-bios/s390-ccw/s390-ccw.h      |   1 +
>   pc-bios/s390-ccw/virtio-scsi.h   |   2 +-
>   pc-bios/s390-ccw/virtio.h        |  16 +++---
>   pc-bios/s390-ccw/bootmap.c       |  27 +++++++--
>   pc-bios/s390-ccw/main.c          |  27 ++++++---
>   pc-bios/s390-ccw/virtio-blkdev.c |  91 +++++--------------------------
>   pc-bios/s390-ccw/virtio-scsi.c   |  19 ++++++-
>   pc-bios/s390-ccw/virtio.c        |  28 ++++++----
>   target/s390x/tcg/misc_helper.c   |   7 +++
>   target/s390x/tcg/translate.c     |  42 ++++++--------
>   pc-bios/s390-ccw.img             | Bin 50936 -> 42608 bytes
>   pc-bios/s390-netboot.img         | Bin 79688 -> 67232 bytes
>   13 files changed, 129 insertions(+), 138 deletions(-)
> 


