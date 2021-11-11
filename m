Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A504944DAF8
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 18:08:17 +0100 (CET)
Received: from localhost ([::1]:54086 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlDYe-00050H-Cb
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 12:08:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1mlDVV-0003Qh-OP
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 12:05:01 -0500
Received: from [2a00:1450:4864:20::534] (port=33343
 helo=mail-ed1-x534.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1mlDVT-0001Lv-Dk
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 12:05:01 -0500
Received: by mail-ed1-x534.google.com with SMTP id m14so27099187edd.0
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 09:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=yj8x04XlMGJcyZqCdVRk32Ff9/mIwqZahMzALG2V8j8=;
 b=ztd6W2fMaDQhLVsOCVcIHm4nvHEk4R7VDY79zYU/JRMWnxKnsIRGdfM6AZXHc4+ZMI
 xzgR5Av9mJLTR2BMGbhBzZp8C8WLx3ZVS75LdBkAoiTyohKEXAFUYeuC9aPyDh2YaHG2
 xLGUr+JFFKVfCQcG50UYOKUNoIcUXiYFYjLiz/MjCSdCTv/GNmR3kk8/lm1tQam+LrT4
 9nAnLfz19iCEWpECIv7HBKIHtIw7Tk4zsWlIDW5VMNgWYGRMf+nf/GrfGEAm63d0LXrR
 SAIsboAebx+3K4IbO/hZQfylC2qAVhoHqtMpy8446PB1a8zuAU1P24wxafBYPy7GJANq
 GQYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=yj8x04XlMGJcyZqCdVRk32Ff9/mIwqZahMzALG2V8j8=;
 b=YeQ0vgHlYSjN0U7QXtFnT/LTvxFodKMbyDVd5ahWh+jKTtVWwNxsgYKfcEVm3Wx8/6
 j46O598YPY4M/vAY6QZ902p1P6u3ojmrd/3U2GqjPrfTzo4mf0osMVVhfI1oEH4dKjTW
 CBVRfJZHaM1KzVxdC2gGLRfWSjzVYQuasEoh3n0DoTDZMHyjqdlYAqgrzPFqw0eT73ma
 lx8kFcboByt7VVRPQl2EVmp5uQaOtuinqjsK2rxXpCrO3qMAVfShR4AoJnGDzwzL2r51
 o2ZwE41A/VO1NEnb7u32trkzf5F+HnYDWFa2FvE8HnTVOW6d/WusFly6dKfg981HHbkE
 Fv+w==
X-Gm-Message-State: AOAM530sMMKT77oto1iDNL6f1MsZqruxjg1Mr0I8l9W1iDTtYxXs48DP
 TciBhgiar+Jbm7ZZVdbxQefoRg==
X-Google-Smtp-Source: ABdhPJxV2V8nKe99CM7//KuAOngZroQA6KesL6jEQXAH3q8RgsX4ZpEFmRPZdZajsY5YnlUlB9CTEQ==
X-Received: by 2002:aa7:d155:: with SMTP id r21mr11938026edo.341.1636650297298; 
 Thu, 11 Nov 2021 09:04:57 -0800 (PST)
Received: from localhost ([82.44.17.50])
 by smtp.gmail.com with ESMTPSA id e19sm1881048edu.47.2021.11.11.09.04.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 09:04:56 -0800 (PST)
Date: Thu, 11 Nov 2021 17:04:56 +0000
From: Jamie Iles <jamie@nuviainc.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 2/2] hw/core/loader: workaround read() size limit.
Message-ID: <YY1NOIdBgzJLYEiv@hazel>
References: <20211111141141.3295094-1-jamie@nuviainc.com>
 <20211111141141.3295094-3-jamie@nuviainc.com>
 <c9950c92-86c5-ce0d-054e-357db1de851c@redhat.com>
 <YY04ioqviteeKy0c@hazel>
 <bd0f1a0a-1b5e-9800-069c-764cb9cfb5e1@redhat.com>
 <7e490883-b723-1ff6-9191-6ef0c91ccd25@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7e490883-b723-1ff6-9191-6ef0c91ccd25@redhat.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::534
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=jamie@nuviainc.com; helo=mail-ed1-x534.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
Cc: Jamie Iles <jamie@nuviainc.com>, qemu-devel@nongnu.org, lmichel@kalray.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Nov 11, 2021 at 04:55:35PM +0100, Philippe Mathieu-Daudé wrote:
> On 11/11/21 16:43, Philippe Mathieu-Daudé wrote:
> > On 11/11/21 16:36, Jamie Iles wrote:
> >> Hi Philippe,
> >>
> >> On Thu, Nov 11, 2021 at 03:55:48PM +0100, Philippe Mathieu-Daudé wrote:
> >>> Hi Jamie,
> >>>
> >>> On 11/11/21 15:11, Jamie Iles wrote:
> >>>> On Linux, read() will only ever read a maximum of 0x7ffff000 bytes
> >>>> regardless of what is asked.  If the file is larger than 0x7ffff000
> >>>> bytes the read will need to be broken up into multiple chunks.
> >>>>
> >>>> Cc: Luc Michel <lmichel@kalray.eu>
> >>>> Signed-off-by: Jamie Iles <jamie@nuviainc.com>
> >>>> ---
> >>>>  hw/core/loader.c | 40 ++++++++++++++++++++++++++++++++++------
> >>>>  1 file changed, 34 insertions(+), 6 deletions(-)
> >>>>
> >>>> diff --git a/hw/core/loader.c b/hw/core/loader.c
> >>>> index 348bbf535bd9..16ca9b99cf0f 100644
> >>>> --- a/hw/core/loader.c
> >>>> +++ b/hw/core/loader.c
> >>>> @@ -80,6 +80,34 @@ int64_t get_image_size(const char *filename)
> >>>>      return size;
> >>>>  }
> >>>>  
> >>>> +static ssize_t read_large(int fd, void *dst, size_t len)
> >>>> +{
> >>>> +    /*
> >>>> +     * man 2 read says:
> >>>> +     *
> >>>> +     * On Linux, read() (and similar system calls) will transfer at most
> >>>> +     * 0x7ffff000 (2,147,479,552) bytes, returning the number of bytes
> >>>
> >>> Could you mention MAX_RW_COUNT from linux/fs.h?
> >>>
> >>>> +     * actually transferred.  (This is true on both 32-bit and 64-bit
> >>>> +     * systems.)
> >>>
> >>> Maybe "This is true for both ILP32 and LP64 data models used by Linux"?
> >>> (because that would not be the case for the ILP64 model).
> >>>
> >>> Otherwise s/systems/Linux variants/?
> >>>
> >>>> +     *
> >>>> +     * So read in chunks no larger than 0x7ffff000 bytes.
> >>>> +     */
> >>>> +    size_t max_chunk_size = 0x7ffff000;
> >>>
> >>> We can declare it static const.
> >>
> >> Ack, can fix all of those up.
> >>
> >>>> +    size_t offset = 0;
> >>>> +
> >>>> +    while (offset < len) {
> >>>> +        size_t chunk_len = MIN(max_chunk_size, len - offset);
> >>>> +        ssize_t br = read(fd, dst + offset, chunk_len);
> >>>> +
> >>>> +        if (br < 0) {
> >>>> +            return br;
> >>>> +        }
> >>>> +        offset += br;
> >>>> +    }
> >>>> +
> >>>> +    return (ssize_t)len;
> >>>> +}
> >>>
> >>> I see other read()/pread() calls:
> >>>
> >>> hw/9pfs/9p-local.c:472:            tsize = read(fd, (void *)buf, bufsz);
> >>> hw/vfio/common.c:269:    if (pread(vbasedev->fd, &buf, size,
> >>> region->fd_offset + addr) != size) {
> >>> ...
> >>>
> >>> Maybe the read_large() belongs to "sysemu/os-xxx.h"?
> >>
> >> I think util/osdep.c would be a good fit for this.  To make sure we're 
> > 
> > Yes.
> > 
> >> on the same page though are you proposing converting all pread/read 
> >> calls to a qemu variant or auditing for ones that could potentially take 
> >> a larger size?
> > 
> > Yes, I took some time wondering beside loading blob in guest memory,
> > what would be the other issues you might encounter. I couldn't find
> > many cases. Eventually hw/vfio/. I haven't audit much, only noticed
> > hw/9pfs/9p-local.c and qga/commands-*.c (not sure if relevant), but
> > since we want to fix this, I'd rather try to fix it globally.
> 
> Actually what you suggest is simpler, add qemu_read() / qemu_pread()
> in util/osdep.c, convert all uses without caring about any audit.

Okay, this hasn't worked out too badly - I'll do the same for 
write/pwrite too and then switch all of the callers over with a 
coccinelle patch so it'll be a fairly large diff but simple.

We could elect to keep any calls with a compile-time constant length 
with the unwrapped variants but I think that's probably more confusing 
in the long-run.

Thanks,

Jamie

