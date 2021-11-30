Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 884A3463A4C
	for <lists+qemu-devel@lfdr.de>; Tue, 30 Nov 2021 16:41:11 +0100 (CET)
Received: from localhost ([::1]:57470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ms5Fm-0008Le-5C
	for lists+qemu-devel@lfdr.de; Tue, 30 Nov 2021 10:41:10 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33970)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1ms5D9-0007XS-Ja
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 10:38:27 -0500
Received: from [2a00:1450:4864:20::532] (port=44581
 helo=mail-ed1-x532.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1ms5D7-00040K-AF
 for qemu-devel@nongnu.org; Tue, 30 Nov 2021 10:38:27 -0500
Received: by mail-ed1-x532.google.com with SMTP id l25so88279729eda.11
 for <qemu-devel@nongnu.org>; Tue, 30 Nov 2021 07:38:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=Qf584jFjWNb07yDBC2ZkXE9VxW+y18ZBj1K8J2mx0SI=;
 b=hBTWGDqFElYA+fJL9KbcBdnwRXEMiLCq9l6vvTVSC8moIeaiFZFKT+cq8SfmG3ryqC
 26JaCyzHSJaiHBAToxdJDnbpxaaukuc+4g9daecc/bj9XP6WHZqxzcklAVVH0RO3znWh
 zjOk/saHU4ZflRgr66jfdIdLi8W82YIJSgmcMoR5S+A5lIglCgUDmOf4ta3la/JIbMDi
 Oy7waflkLP3hJdSDzEpbLwXstwUO0ykYeRH7DwC9Wc+z1NI/B1P81Co5tewd5EulEkJZ
 ya7SJ5sw3z2/bz4kfQO/uscPO4QF5N0TffaV7knIdCBiqdpviAguHgjE2M/AUvReGzrO
 Xuhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=Qf584jFjWNb07yDBC2ZkXE9VxW+y18ZBj1K8J2mx0SI=;
 b=ayy0GyKnxg25Qt7TDLHyCJx76Lcw+zVtWvuOgvk1OT5HHxTt0rWVcJ1RdDwri6mMdk
 cok2J9KEvBKjZ0ZzCAnF/dYotBfQvMwNvswHx0lLIBOdZtwq0wEayt4kfoZ7PmfFXAU1
 a952D8uKSefD7dG/OC2NzYHEYwBVlVKz8ld6D5Af5qTVUIpULDbopmJXZNWQ9IZQUCw/
 6mPA0HEcYw6Mzihm6szzh6EcPuKMcaUrdUMAVF30ZrSSAnhKR8jQb7QPlhqhqEOg10Br
 9CdAwoxSSE0o4hgfSyw2HqED7JxXv4O9inONa73Gk+blCwJtNfONaW8g8CEs8JRgY5ZC
 rCKg==
X-Gm-Message-State: AOAM533dJkW44uN9nBd1CrHmpSpB2pWI4BnYMPJn6EDSgJEn6PYU6q4p
 L+HjXNYXNEoPjQ3zyL3vzCFzGw==
X-Google-Smtp-Source: ABdhPJwcOwxnC+/M6QSo/iW+sKropBlJunmYeJviqEZ3FmmkDe4vSV8br73cyei9xru0XWKCaf3luQ==
X-Received: by 2002:a05:6402:42d5:: with SMTP id
 i21mr83263432edc.373.1638286702888; 
 Tue, 30 Nov 2021 07:38:22 -0800 (PST)
Received: from localhost ([82.44.17.50])
 by smtp.gmail.com with ESMTPSA id go10sm9475317ejc.115.2021.11.30.07.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Nov 2021 07:38:22 -0800 (PST)
Date: Tue, 30 Nov 2021 15:38:21 +0000
From: Jamie Iles <jamie@nuviainc.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 2/2] hw/core/loader: workaround read() size limit.
Message-ID: <YaZFbVv5pOO/P9S7@hazel>
References: <20211111141141.3295094-1-jamie@nuviainc.com>
 <20211111141141.3295094-3-jamie@nuviainc.com>
 <c9950c92-86c5-ce0d-054e-357db1de851c@redhat.com>
 <YY04ioqviteeKy0c@hazel>
 <bd0f1a0a-1b5e-9800-069c-764cb9cfb5e1@redhat.com>
 <7e490883-b723-1ff6-9191-6ef0c91ccd25@redhat.com>
 <YY1NOIdBgzJLYEiv@hazel>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <YY1NOIdBgzJLYEiv@hazel>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::532
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=jamie@nuviainc.com; helo=mail-ed1-x532.google.com
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
Cc: qemu-devel@nongnu.org, lmichel@kalray.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On Thu, Nov 11, 2021 at 05:04:56PM +0000, Jamie Iles wrote:
> On Thu, Nov 11, 2021 at 04:55:35PM +0100, Philippe Mathieu-Daudé wrote:
> > On 11/11/21 16:43, Philippe Mathieu-Daudé wrote:
> > > On 11/11/21 16:36, Jamie Iles wrote:
> > >> Hi Philippe,
> > >>
> > >> On Thu, Nov 11, 2021 at 03:55:48PM +0100, Philippe Mathieu-Daudé wrote:
> > >>> Hi Jamie,
> > >>>
> > >>> On 11/11/21 15:11, Jamie Iles wrote:
> > >>>> On Linux, read() will only ever read a maximum of 0x7ffff000 bytes
> > >>>> regardless of what is asked.  If the file is larger than 0x7ffff000
> > >>>> bytes the read will need to be broken up into multiple chunks.
> > >>>>
> > >>>> Cc: Luc Michel <lmichel@kalray.eu>
> > >>>> Signed-off-by: Jamie Iles <jamie@nuviainc.com>
> > >>>> ---
> > >>>>  hw/core/loader.c | 40 ++++++++++++++++++++++++++++++++++------
> > >>>>  1 file changed, 34 insertions(+), 6 deletions(-)
> > >>>>
> > >>>> diff --git a/hw/core/loader.c b/hw/core/loader.c
> > >>>> index 348bbf535bd9..16ca9b99cf0f 100644
> > >>>> --- a/hw/core/loader.c
> > >>>> +++ b/hw/core/loader.c
> > >>>> @@ -80,6 +80,34 @@ int64_t get_image_size(const char *filename)
> > >>>>      return size;
> > >>>>  }
> > >>>>  
> > >>>> +static ssize_t read_large(int fd, void *dst, size_t len)
> > >>>> +{
> > >>>> +    /*
> > >>>> +     * man 2 read says:
> > >>>> +     *
> > >>>> +     * On Linux, read() (and similar system calls) will transfer at most
> > >>>> +     * 0x7ffff000 (2,147,479,552) bytes, returning the number of bytes
> > >>>
> > >>> Could you mention MAX_RW_COUNT from linux/fs.h?
> > >>>
> > >>>> +     * actually transferred.  (This is true on both 32-bit and 64-bit
> > >>>> +     * systems.)
> > >>>
> > >>> Maybe "This is true for both ILP32 and LP64 data models used by Linux"?
> > >>> (because that would not be the case for the ILP64 model).
> > >>>
> > >>> Otherwise s/systems/Linux variants/?
> > >>>
> > >>>> +     *
> > >>>> +     * So read in chunks no larger than 0x7ffff000 bytes.
> > >>>> +     */
> > >>>> +    size_t max_chunk_size = 0x7ffff000;
> > >>>
> > >>> We can declare it static const.
> > >>
> > >> Ack, can fix all of those up.
> > >>
> > >>>> +    size_t offset = 0;
> > >>>> +
> > >>>> +    while (offset < len) {
> > >>>> +        size_t chunk_len = MIN(max_chunk_size, len - offset);
> > >>>> +        ssize_t br = read(fd, dst + offset, chunk_len);
> > >>>> +
> > >>>> +        if (br < 0) {
> > >>>> +            return br;
> > >>>> +        }
> > >>>> +        offset += br;
> > >>>> +    }
> > >>>> +
> > >>>> +    return (ssize_t)len;
> > >>>> +}
> > >>>
> > >>> I see other read()/pread() calls:
> > >>>
> > >>> hw/9pfs/9p-local.c:472:            tsize = read(fd, (void *)buf, bufsz);
> > >>> hw/vfio/common.c:269:    if (pread(vbasedev->fd, &buf, size,
> > >>> region->fd_offset + addr) != size) {
> > >>> ...
> > >>>
> > >>> Maybe the read_large() belongs to "sysemu/os-xxx.h"?
> > >>
> > >> I think util/osdep.c would be a good fit for this.  To make sure we're 
> > > 
> > > Yes.
> > > 
> > >> on the same page though are you proposing converting all pread/read 
> > >> calls to a qemu variant or auditing for ones that could potentially take 
> > >> a larger size?
> > > 
> > > Yes, I took some time wondering beside loading blob in guest memory,
> > > what would be the other issues you might encounter. I couldn't find
> > > many cases. Eventually hw/vfio/. I haven't audit much, only noticed
> > > hw/9pfs/9p-local.c and qga/commands-*.c (not sure if relevant), but
> > > since we want to fix this, I'd rather try to fix it globally.
> > 
> > Actually what you suggest is simpler, add qemu_read() / qemu_pread()
> > in util/osdep.c, convert all uses without caring about any audit.
> 
> Okay, this hasn't worked out too badly - I'll do the same for 
> write/pwrite too and then switch all of the callers over with a 
> coccinelle patch so it'll be a fairly large diff but simple.
> 
> We could elect to keep any calls with a compile-time constant length 
> with the unwrapped variants but I think that's probably more confusing 
> in the long-run.

Coming back to this I think this is probably a non-starter because of 
non-blocking file descriptors.  There is already a qemu_write_full so 
I'm inclined to add qemu_read_full following the same pattern and then 
convert all of the read calls in the loader to use that.

Thanks,

Jamie

