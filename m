Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE8952BD86
	for <lists+qemu-devel@lfdr.de>; Wed, 18 May 2022 16:20:32 +0200 (CEST)
Received: from localhost ([::1]:41982 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrKXP-0001Jr-Rk
	for lists+qemu-devel@lfdr.de; Wed, 18 May 2022 10:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nrKU5-0005iB-Ab; Wed, 18 May 2022 10:17:05 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:41216)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nrKU3-0002Hr-G8; Wed, 18 May 2022 10:17:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:References:To:From:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Cc:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EWTm2C63kMTB2UaALRmm9G3RPttLhHi1A6hXBq/Thqg=; b=G2NH5hmb1awmI8nXuKP0vY+KIy
 0faqs1eRVyqVO6QgheLzLpIt7t3KValPgW6wRxLomOaV+0WfVOfQym5OCW8OQgLlw1JTHQ6x4cYQ1
 Ymf2ozCwtoSGFmHyjGbMpXLa39v8vzXlS0+0p06+QvADhlsZOOdv6Dp3qT9gau9Qrh8rMBsNIHony
 nZneVXmc6tKqdhi9RfyVTbnEqsxXgkLC1PcuEmZcZZQ84EaQ/wM4VMdhEsm33/teKYhBIVwUEMQ6H
 18tc97rGEmCHDpQUmDQ0w9NIzvXX8g6DlxghLdQqtHpji/gDwMzj9foQjinDyAczgXY+wtSXV+uH1
 a3F5dJM2c8QDlwO+VJMvMjhiGkUYQz7VceBMRvP/ACRYLh5v8DyrMdAo7oAsqv41ADIJdVVUu6hP8
 hSt5rWX9kip/p2XLOenPidS5/Z9+eF4BCop5K7s+R9z2JxgkUxJd2sEVdFYrfhtewUUDxpHpuA8iF
 vmubL7FvCOHu/fT1Fyn7tH1AcZoFfybj8+w2m6gKWzGh1Srv+irdvP8meBg/YfiaKEz63O/wcJYG8
 WrPhdyWXOYU+aPoJkvRjy1MTN5YDOjKqVNaLosTdjn+M8w9bUbZ0e0TUXuduza9p7/4dkywpP3uBx
 KIwbFGadrJ7dh2oEkBJp+XQnEmVcGqtTXgnlmzG4c=;
Received: from [2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1nrKSx-000C6Z-34; Wed, 18 May 2022 15:15:59 +0100
Message-ID: <7bcd69db-eee5-e67e-275f-1d79d7888f2f@ilande.co.uk>
Date: Wed, 18 May 2022 15:16:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Content-Language: en-US
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
To: pbonzini@redhat.com, laurent@vivier.eu, fam@euphon.net,
 qemu-devel@nongnu.org, qemu-block@nongnu.org
References: <20220424164935.7339-1-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220424164935.7339-1-mark.cave-ayland@ilande.co.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba4:3700:6895:4d68:6f22:ca1c
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v2 00/11] scsi: add quirks and features to support m68k
 Macs
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.ilande.co.uk)
Received-SPF: pass client-ip=2001:41c9:1:41f::167;
 envelope-from=mark.cave-ayland@ilande.co.uk; helo=mail.ilande.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

On 24/04/2022 17:49, Mark Cave-Ayland wrote:

> Here are the next set of patches from my ongoing work to allow the q800
> machine to boot MacOS related to SCSI devices.
> 
> The first patch implements a dummy FORMAT UNIT command which is used by
> the Apple HD SC Setup program when preparing an empty disk to install
> MacOS.
> 
> Patch 2 adds a new quirks bitmap to SCSIDiskState to allow buggy and/or
> legacy features to enabled on an individual device basis. Once the quirks
> bitmap has been added, patch 3 uses the quirks feature to implement an
> Apple-specific mode page which is required to allow the disk to be recognised
> and used by Apple HD SC Setup.
> 
> Patch 4 adds compat_props to the q800 machine which enable the new
> MODE_PAGE_APPLE_VENDOR quirk for all scsi-hd devices attached to the machine.
> 
> Patch 5 adds a new quirk to force SCSI CDROMs to always return the block
> descriptor for a MODE SENSE command which is expected by A/UX, whilst patch 6
> enables the quirk for all scsi-cd devices on the q800 machine.
> 
> Patch 7 adds support for truncated MODE SELECT requests which are sent by
> A/UX (and also MacOS in some circumstances) when enumerating a SCSI CDROM device
> which are shown to be accepted on real hardware as documented in [1].
> 
> Patch 8 allows the MODE_PAGE_R_W_ERROR AWRE bit to be changeable since the A/UX
> MODE SELECT request sets this bit to 0 rather than the QEMU default which is 1.
> 
> Patch 9 adds support for setting the CDROM block size via a MODE SELECT request
> which is supported by older CDROMs to allow the block size to be changed from
> the default of 2048 bytes to 512 bytes for compatibility purposes. This is used
> by A/UX which otherwise fails with SCSI errors if the block size is not set to
> 512 bytes when accessing CDROMs.
> 
> Finally patches 10 and 11 augment the compat_props to set the default vendor,
> product and version information for all scsi-hd and scsi-cd devices attached
> to the q800 machine, taken from real drives. This is because MacOS will only
> allow a known set of SCSI devices to be recognised during the installation
> process.
> 
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> 
> [1] https://68kmla.org/bb/index.php?threads/scsi2sd-project-anyone-interested.29040/page-7#post-316444
> 
> 
> v2:
> - Change patchset title from "scsi: add support for FORMAT UNIT command and quirks"
>    to "scsi: add quirks and features to support m68k Macs"
> - Fix missing shift in patch 2 as pointed out by Fam
> - Rename MODE_PAGE_APPLE to MODE_PAGE_APPLE_VENDOR
> - Add SCSI_DISK_QUIRK_MODE_SENSE_ROM_FORCE_DBD quirk
> - Add support for truncated MODE SELECT requests
> - Allow MODE_PAGE_R_W_ERROR AWRE bit to be changeable for CDROM devices
> - Allow the MODE SELECT block descriptor to set the CDROM block size
> 
> 
> Mark Cave-Ayland (11):
>    scsi-disk: add FORMAT UNIT command
>    scsi-disk: add new quirks bitmap to SCSIDiskState
>    scsi-disk: add MODE_PAGE_APPLE_VENDOR quirk for Macintosh
>    q800: implement compat_props to enable quirk_mode_page_apple_vendor
>      for scsi-hd devices
>    scsi-disk: add SCSI_DISK_QUIRK_MODE_SENSE_ROM_FORCE_DBD quirk for
>      Macintosh
>    q800: implement compat_props to enable quirk_mode_sense_rom_force_dbd
>      for scsi-cd devices
>    scsi-disk: allow truncated MODE SELECT requests
>    scsi-disk: allow the MODE_PAGE_R_W_ERROR AWRE bit to be changeable for
>      CDROM drives
>    scsi-disk: allow MODE SELECT block descriptor to set the ROM device
>      block size
>    q800: add default vendor and product information for scsi-hd devices
>    q800: add default vendor and product information for scsi-cd devices
> 
>   hw/m68k/q800.c           | 13 ++++++++++
>   hw/scsi/scsi-disk.c      | 53 +++++++++++++++++++++++++++++++++++-----
>   hw/scsi/trace-events     |  3 +++
>   include/hw/scsi/scsi.h   |  4 +++
>   include/scsi/constants.h |  1 +
>   5 files changed, 68 insertions(+), 6 deletions(-)

Ping? Anyone have any further thoughts on this?


ATB,

Mark.

