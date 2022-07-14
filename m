Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E36C57450F
	for <lists+qemu-devel@lfdr.de>; Thu, 14 Jul 2022 08:29:24 +0200 (CEST)
Received: from localhost ([::1]:38532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oBsLi-0003xx-8J
	for lists+qemu-devel@lfdr.de; Thu, 14 Jul 2022 02:29:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBsFl-0000ki-La; Thu, 14 Jul 2022 02:23:14 -0400
Received: from mail.ilande.co.uk ([2001:41c9:1:41f::167]:44176)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBsFj-0007hV-Dh; Thu, 14 Jul 2022 02:23:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=ilande.co.uk; s=20220518; h=Subject:Content-Transfer-Encoding:Content-Type:
 In-Reply-To:From:References:Cc:To:MIME-Version:Date:Message-ID:Sender:
 Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
 :Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3uy6JbrLoYBXL/Fdc/I3T0nnhcrfXYN9LdXIIXPfCcs=; b=AyOc0jp9YRI/3TBQxiiMwKG/bd
 dMoUJIX0zjCic4v7jks297YEPyQ2QZWKwRlQh9A0/GG+hdE6MqVE08KkKE/FlOpoHwfLDASkJvN2T
 pjxGF3CUCoYLHDAwGzcgGHpuOQ2p/8S3wwa6OwZ/cDW+5kFnFFzuTbesYm84u01oApqLuea0hKaQK
 wlLqYQGaqAj55u8aq/NGATKhGXvJZRXNP+zSlj67zij4vLoMsIbYfRn2a6gfnqU26hmf+xer69jYo
 NxJF+XajvgS2aNfcXEHuxx6MOMzSDGuZM6oZsSPqeGswt7iMiL/nU0QU5OHGKDsVnzbecfw+tdAj0
 oL8CSwfWu3JZ5cImzO526SbkF4HkQ0soCEn960gd5hY9mpC108gse41Q9aaGlHK42+Nfu815PPQL8
 gyqeO1XvZGHbT7PSMiL7QRoYJP/Z6hryLqGYH75tgpIGM9Nkfwwqb2/1Kcwugf/OjCIKMNiKnz2Vy
 yZwod/Cy2tiQhpd6JKcdykGd2s4NHOsNI8tcgmoBpxwEbNDFvTTqu2kTaySm2D4c2LVWFrDa0HkXO
 uBB+lWCGEAsNYCyEN2l0LZw5V0z+UgEDmShpi4lgwWIXAt7c5jEYZoWqSjK9w0c0YKWyza3hYw4PY
 un3LzgV3gDltFowobbJBDz9oa2LvwABIzxLu4HYAE=;
Received: from [2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576]
 by mail.ilande.co.uk with esmtpsa (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.92) (envelope-from <mark.cave-ayland@ilande.co.uk>)
 id 1oBsEN-0007Kk-4x; Thu, 14 Jul 2022 07:21:47 +0100
Message-ID: <66593842-932e-9224-0e14-c8be38c9248a@ilande.co.uk>
Date: Thu, 14 Jul 2022 07:23:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: laurent@vivier.eu, fam@euphon.net, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
References: <20220712144832.162389-1-pbonzini@redhat.com>
From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220712144832.162389-1-pbonzini@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a00:23c4:8ba5:df00:fd7d:1c3a:1dd0:c576
X-SA-Exim-Mail-From: mark.cave-ayland@ilande.co.uk
Subject: Re: [PATCH v3 00/14] scsi: add quirks and features to support m68k
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

On 12/07/2022 15:48, Paolo Bonzini wrote:

> Queued, thanks (I was on vacation last week).
> 
> I am a bit scared about the mode_select_truncated quirk.  My reading
> of the code is that the MODE SELECT would fail anyway because the
> page length does not match in scsi_disk_check_mode_select:
> 
>      len = mode_sense_page(s, page, &p, 0);
>      if (len < 0 || len != expected_len) {
>          return -1;
>      }
> 
> Is that correct?  If not, I'm not sure where I am wrong.  If so,
> I wonder if it is enough for the quirk to do just a "goto invalid_param;"
> in place of invalid_param_len.

(goes and looks)

The truncated MODE SELECT request in question seems to be only used by the initial 
A/UX installation image and looks like this:

scsi_req_parsed target 3 lun 0 tag 0 command 21 dir 2 length 20
scsi_req_parsed_lba target 3 lun 0 tag 0 command 21 lba 0
scsi_req_alloc target 3 lun 0 tag 0
scsi_disk_new_request Command: lun=0 tag=0x0 data= 0x15 0x00 0x00 0x00 0x14 0x00
scsi_disk_emulate_command_MODE_SELECT Mode Select(6) (len 20)
scsi_req_continue target 3 lun 0 tag 0
scsi_disk_emulate_write_data Write buf_len=20
scsi_req_data target 3 lun 0 tag 0 len 20
scsi_req_continue target 3 lun 0 tag 0

This includes an 8 byte block descriptor which is used to set the CDROM sector size 
to 512 bytes and so the request content looks like:

4 bytes hdr_len for MODE SELECT(6)
8 bytes bd_len for the block descriptor
8 bytes of data for page 0 (MODE_PAGE_R_W_ERROR) data with page_len = 10

Stepping through mode_select_pages() in the debugger shows that since page_len is set 
correctly to 10 bytes (which matches the expected length in mode_sense_page()) the 
above check succeeds.

I suspect what happened is that the original author built the MODE_PAGE_R_W_ERROR 
page data correctly but miscalculated the length of the request in the CDB. Given 
that the truncated request is seemingly accepted on real hardware, no-one actually 
noticed until now :)


ATB,

Mark.

