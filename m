Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A85D3321A5F
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Feb 2021 15:32:08 +0100 (CET)
Received: from localhost ([::1]:35062 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lECFr-0008L1-ON
	for lists+qemu-devel@lfdr.de; Mon, 22 Feb 2021 09:32:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47990)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lECEy-0007hu-0Q
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 09:31:12 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:34917)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lECEv-0007o6-NT
 for qemu-devel@nongnu.org; Mon, 22 Feb 2021 09:31:11 -0500
Received: by mail-wr1-x433.google.com with SMTP id l12so19305633wry.2
 for <qemu-devel@nongnu.org>; Mon, 22 Feb 2021 06:31:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dme-org.20150623.gappssmtp.com; s=20150623;
 h=to:cc:subject:in-reply-to:references:from:date:message-id
 :mime-version:content-transfer-encoding;
 bh=WAzYnNI34/hACyG3M2i5zRRziXIyzO+10bey5F98dIg=;
 b=x6aydmSQGYSrvXnAgIvxNgDXAYbOo5QjP1nh/RCP/ulREEFKM+fAEIC5F4k7RqOt4u
 uovF98zbGafILH0rR6yEuSJv9SnA9suk14/pSV7sYEUy68CLvm5/6WM/hC7cqiWf02uO
 P194IhPWCqdPOvrAnp9zCdnSumhsHHhyBGwZmzf+fEFLDa7f+loEEbA2wQb9jO5nLcrP
 qhtgzRCpmaUBqFWjKM02fQKDcJcATcpl8l5N7EuESrMs3N5n1Fr/jNoolz0QTZgnAeaf
 ozuTMmnoOdGkytPFx5kMIDnHWpUxpH7N0ZQujzxHJPW4k5gp2V0ko0uEdCc1ttmn6Yn9
 NWyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:subject:in-reply-to:references:from:date
 :message-id:mime-version:content-transfer-encoding;
 bh=WAzYnNI34/hACyG3M2i5zRRziXIyzO+10bey5F98dIg=;
 b=RLHfnlO5ZMCCW4kY9jE4CtlVp3rtwDusDZ0mG1Zn7djKC8r4fJgiaTnZP1w76rfbQS
 clTVU5WPPkHI6/ot7DD6ZK171Yuocpg/PNtt+OGnRITpbFHG2Rw79zTRzEGIWU19tcj6
 bP1PRmgEsyzYLP3qdHKaxfJmSfRZeVIbrmsbh/xpnFX7CkVjf2jkgDjX1Vk5keTOvOEJ
 7SBT3nmkCRCF77DaHgRkji0/TK6Ppi3/6L5lrATt0FYPCCl9Re96ib89MUS3OpSao0PY
 dRIey7QdV7LUQ7YVzSRh0tmEkck/JdVXxtCOfdz3vInc/+NhDQC1S84ZUkOEBma87KB5
 wjYQ==
X-Gm-Message-State: AOAM533U5rWPE2gWJG3qmXrfpK8NX7uCja/gEIMAZXWlIj8TyP/Mb/LY
 b+KTnMTcJESbyHx7XOEB8BnZug==
X-Google-Smtp-Source: ABdhPJy9yeLnzcRm7FjYinAPz8lyUYxT8C8fdB6ggl+ujwdOV3tcLV/mFryFh4KOzaDHcmF3/rb0dA==
X-Received: by 2002:a05:6000:1841:: with SMTP id
 c1mr21316449wri.278.1614004267059; 
 Mon, 22 Feb 2021 06:31:07 -0800 (PST)
Received: from disaster-area.hh.sledj.net (disaster-area.hh.sledj.net.
 [2001:8b0:bb71:7140:64::1])
 by smtp.gmail.com with ESMTPSA id y12sm17142621wrm.33.2021.02.22.06.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Feb 2021 06:31:06 -0800 (PST)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id db019096;
 Mon, 22 Feb 2021 14:31:05 +0000 (UTC)
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [RFC PATCH v2 3/3] hw/pflash_cfi01: Allow devices to have a
 smaller backing device
In-Reply-To: <012fce58-9543-eb63-0358-a0b3f135f6c2@redhat.com>
References: <20210222090747.2310104-1-david.edmondson@oracle.com>
 <20210222090747.2310104-4-david.edmondson@oracle.com>
 <012fce58-9543-eb63-0358-a0b3f135f6c2@redhat.com>
X-HGTTG: zarquon
From: David Edmondson <dme@dme.org>
Date: Mon, 22 Feb 2021 14:31:05 +0000
Message-ID: <cunblccw4wm.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: neutral client-ip=2a00:1450:4864:20::433;
 envelope-from=dme@dme.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_NEUTRAL=0.779, UNPARSEABLE_RELAY=0.001 autolearn=no autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Monday, 2021-02-22 at 15:06:35 +01, Philippe Mathieu-Daud=C3=A9 wrote:

> Hi David,
>
> On 2/22/21 10:07 AM, David Edmondson wrote:
>> Allow the backing device to be smaller than the extent of the flash
>> device by mapping it as a subregion of the flash device region.
>>=20
>> Return zeroes for all reads of the flash device beyond the extent of
>> the backing device.
>>=20
>> For writes beyond the extent of the underlying device, fail on
>> read-only devices and discard them for writable devices.
>
> This looks much simpler now.

Thanks for looking at it.

>> Signed-off-by: David Edmondson <david.edmondson@oracle.com>
>> ---
>>  hw/block/pflash_cfi01.c | 108 ++++++++++++++++++++++++++++++----------
>>  hw/block/trace-events   |   3 ++
>>  2 files changed, 86 insertions(+), 25 deletions(-)
>
>>      if (pfl->blk) {
>>          uint64_t perm;
>> +
>>          pfl->ro =3D !blk_supports_write_perm(pfl->blk);
>>          perm =3D BLK_PERM_CONSISTENT_READ | (pfl->ro ? 0 : BLK_PERM_WRI=
TE);
>>          ret =3D blk_set_perm(pfl->blk, perm, BLK_PERM_ALL, errp);
>>          if (ret < 0) {
>>              return;
>>          }
>> +
>> +        inner_len =3D blk_getlength(pfl->blk);
>> +
>> +        if (inner_len > outer_len) {
>> +            error_setg(errp,
>> +                       "block backend provides %" HWADDR_PRIu " bytes, "
>> +                       "device limited to %" PRIu64 " bytes",
>> +                       inner_len, outer_len);
>> +            return;
>> +        }
>
> Do you mind extracting this change in a previous patch?

Before this change that test was performed by
blk_check_size_and_read_all(), which insisted that the block device was
exactly the same size as the region (because it was told to read enough
bytes to fill the region).

Now that we pass the size of the backing device to that function, rather
than the size of the region, it's necessary to add the extra check
before the call.

Hence, I don't think that it's useful to add this as an earlier patch.

It would perhaps make sense to switch away from
blk_check_size_and_read_all(), preferring to just call blk_pread() now,
which would be cleaner?

dme.
--=20
Do I have to tell the story, of a thousand rainy days since we first met?

