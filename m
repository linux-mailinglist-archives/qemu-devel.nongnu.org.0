Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8415245A705
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 16:57:48 +0100 (CET)
Received: from localhost ([::1]:59294 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpYB1-0003Kw-1e
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 10:57:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mpY9j-0002BB-VD
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 10:56:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:20886)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hreitz@redhat.com>) id 1mpY9f-0007DX-Ql
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 10:56:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1637682982;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fSr2w84CTVYjvcWMZUyLiWX3stWtIO/soQig5tLNoaM=;
 b=PNltIhRT0vxdzJHInwMvABIHSS4Nk5sXGkGwEWhesZrxfZGn2J29jCb/EnJcy3Ao6TQ5Y7
 Z7/AHV23LNa0oZz7PLiVFNFOK1hhzHwmvIWqVA+Y1eUYSPwrngjf1P3lb1scw8eBaXu7WW
 DGV8hFXJPiCZpq8R93ZPb1iWf2/+vlU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-41-icC19L5HND6xi3Nt_w3XHQ-1; Tue, 23 Nov 2021 10:56:21 -0500
X-MC-Unique: icC19L5HND6xi3Nt_w3XHQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 j193-20020a1c23ca000000b003306ae8bfb7so8646092wmj.7
 for <qemu-devel@nongnu.org>; Tue, 23 Nov 2021 07:56:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=fSr2w84CTVYjvcWMZUyLiWX3stWtIO/soQig5tLNoaM=;
 b=LNedjTUVoiXyy65c9v9NH3AFHO3xQU/+cszPANTNNzxGWfTZ/4PMT4BM5ieKpyOd1I
 MBRE6iQXl/xRStmMhV7fP1XUKO1puvb+959kWA6EleTsazKV3TTRdhwlSDuADh583oBn
 hiCILs7zLMVRjG/0UeWmcHo5h8hXp/j7DIxtzhNLL9u8/kxYYTxm5TOx+2jYv5GNsngZ
 ZgYNTMNYS4DKCN0cU0aG/IPlqmdQ1NXHKVR8PqyxC4q8nC8n6yWHc0hyyCyRTYEN6Ioh
 JlltZVet6v2WaOKbrPLm8l7YUEuPjlqv2mPqbDaurbjVwx64BU76eSlcU15/CI+MGz4F
 I7MQ==
X-Gm-Message-State: AOAM531KGO13CXoAR2gtcu9zB4cDeZ2X/fljiAXU7pKheKvVBwvbbKo5
 nSM1k0bEReINKib/XJXsYvF3PCB/MzO/A44m1ElRIZnQKKzruU77CWGdQOqQnlfZJCwnXKymUAu
 DBOHUTjeECOwor80=
X-Received: by 2002:a05:600c:1548:: with SMTP id
 f8mr4392605wmg.67.1637682980136; 
 Tue, 23 Nov 2021 07:56:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzowizBbgO363MvCTzZwwJpMbqRKiXNOZjmZmG0s4W2zWNhx1CdtF0OVg4GLdInz4QSSa1OLQ==
X-Received: by 2002:a05:600c:1548:: with SMTP id
 f8mr4392520wmg.67.1637682979689; 
 Tue, 23 Nov 2021 07:56:19 -0800 (PST)
Received: from ?IPV6:2a02:8071:5055:3f20:7ad9:a400:6d51:83e6?
 ([2a02:8071:5055:3f20:7ad9:a400:6d51:83e6])
 by smtp.gmail.com with ESMTPSA id o4sm16059802wry.80.2021.11.23.07.56.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Nov 2021 07:56:19 -0800 (PST)
Message-ID: <64ddcc01-f0df-9e04-8331-d308d1505c5f@redhat.com>
Date: Tue, 23 Nov 2021 16:56:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH-for-6.2 1/2] hw/block/fdc: Prevent end-of-track overrun
 (CVE-2021-3507)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20211118115733.4038610-1-philmd@redhat.com>
 <20211118115733.4038610-2-philmd@redhat.com>
From: Hanna Reitz <hreitz@redhat.com>
In-Reply-To: <20211118115733.4038610-2-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=hreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=hreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.7,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-3.515, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 qemu-block@nongnu.org, Darren Kenny <darren.kenny@oracle.com>,
 qemu-stable@nongnu.org, Alexander Bulekov <alxndr@bu.edu>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 18.11.21 12:57, Philippe Mathieu-Daudé wrote:
> Per the 82078 datasheet, if the end-of-track (EOT byte in
> the FIFO) is more than the number of sectors per side, the
> command is terminated unsuccessfully:

Patch looks OK to me (can’t believe I’ve looked into the spec...), just 
one question (note from later self: I really believed this, and now I 
ended up with this wall of text...):

Isn’t the problem that the EOT is smaller than the start sector index?  
AFAIU fifo[6] is the EOT, ks (fifo[4]) is the start sector number, and 
so the problem occurs if fifo[6] < fifo[4] - 1 (EOT < start sector index).

I don’t think there is any problem if the EOT exceeds the number of 
sectors per anything (e.g. sectors per track or per cylinder). Well, the 
spec might say it should cause an error, but in that case tmp (and thus 
data_len) just become very large.  AFAIU fd_seek() checks that the start 
sector is in bounds, so in fact passing an EOT that is larger than 
cur_drv->last_sect would never be negative, and so never trigger the tmp 
< 0 condition.

The explanation below however seems to be precisely for the case where 
EOT would be larger than last_sect (say 18), and so e.g. sector 19 can’t 
be found (“second occurrence of a pulse on the INDX# pin”).  Contrarily, 
the spec doesn’t seem to say anything for the case where EOT is in 
bounds but less than the start sector index. It doesn’t even seem to say 
how the EOT is evaluated; is it a “read until sector >= EOT”?  (I.e. EOT 
< start sector would yield a zero-byte read)  Or is it a “read until 
sector == EOT”?  (I.e. EOT < start sector would yield an error because 
that condition is never reached, and we go beyond last_sect, yielding 
the same error as if EOT were out of bounds.)

Now that raises another question to me.  Say EOT is out of bounds; 
wouldn’t the FDC still read all sectors until the end of the 
track/cylinder?  And only then raise an error that the sector beyond 
doesn’t exist?

I have no idea if any of that made sense and even if it did, whether I’m 
right.  But even if I am, I don’t think it’s a problem.  Our problem at 
hand is the `tmp` underflow, and it’s good to handle that by returning 
some form of error to the guest instead of crashing. It’s just that I’m 
not sure this solution is actually what the spec requires (because I 
have no idea what the spec requires in that case), and the explanation 
given in the commit message to me seems to define an error for a very 
different case (where tmp would not be negative) that we just execute 
without an error.

When I look into this I see many more things that look like they aren’t 
according to spec (like not checking the sector size, or that we honor 
fifo[0] & 0x80 for READ TRACK even though the spec says no multi-track 
operations for READ TRACK), so I don’t personally care.  It’s good that 
this patch handles the `tmp` underflow, because that’s important, 
compliance with the spec isn’t.

(Yes, the entire reason for this wall of text is that I wonder why the 
commit message goes into so much detail quoting the spec, while I can’t 
find it applies.)

Reviewed-by: Hanna Reitz <hreitz@redhat.com>

> * 5.2.5 DATA TRANSFER TERMINATION
>
>    The 82078 supports terminal count explicitly through
>    the TC pin and implicitly through the underrun/over-
>    run and end-of-track (EOT) functions. For full sector
>    transfers, the EOT parameter can define the last
>    sector to be transferred in a single or multisector
>    transfer. If the last sector to be transferred is a par-
>    tial sector, the host can stop transferring the data in
>    mid-sector, and the 82078 will continue to complete
>    the sector as if a hardware TC was received. The
>    only difference between these implicit functions and
>    TC is that they return "abnormal termination" result
>    status. Such status indications can be ignored if they
>    were expected.
>
> * 6.1.3 READ TRACK
>
>    This command terminates when the EOT specified
>    number of sectors have been read. If the 82078
>    does not find an I D Address Mark on the diskette
>    after the second· occurrence of a pulse on the
>    INDX# pin, then it sets the IC code in Status Regis-
>    ter 0 to "01" (Abnormal termination), sets the MA bit
>    in Status Register 1 to "1", and terminates the com-
>    mand.
>
> * 6.1.6 VERIFY
>
>    Refer to Table 6-6 and Table 6-7 for information
>    concerning the values of MT and EC versus SC and
>    EOT value.
>
> * Table 6·6. Result Phase Table
>
> * Table 6-7. Verify Command Result Phase Table
>
> Fix by aborting the transfer when EOT > # Sectors Per Side.
>
> Cc: qemu-stable@nongnu.org
> Cc: Hervé Poussineau <hpoussin@reactos.org>
> Fixes: baca51faff0 ("floppy driver: disk geometry auto detect")
> Reported-by: Alexander Bulekov <alxndr@bu.edu>
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/339
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   hw/block/fdc.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
>
> diff --git a/hw/block/fdc.c b/hw/block/fdc.c
> index fa933cd3263..d21b717b7d6 100644
> --- a/hw/block/fdc.c
> +++ b/hw/block/fdc.c
> @@ -1512,6 +1512,14 @@ static void fdctrl_start_transfer(FDCtrl *fdctrl, int direction)
>           int tmp;
>           fdctrl->data_len = 128 << (fdctrl->fifo[5] > 7 ? 7 : fdctrl->fifo[5]);
>           tmp = (fdctrl->fifo[6] - ks + 1);
> +        if (tmp < 0) {
> +            FLOPPY_DPRINTF("invalid EOT: %d\n", tmp);
> +            fdctrl_stop_transfer(fdctrl, FD_SR0_ABNTERM, FD_SR1_MA, 0x00);
> +            fdctrl->fifo[3] = kt;
> +            fdctrl->fifo[4] = kh;
> +            fdctrl->fifo[5] = ks;
> +            return;
> +        }
>           if (fdctrl->fifo[0] & 0x80)
>               tmp += fdctrl->fifo[6];
>           fdctrl->data_len *= tmp;


