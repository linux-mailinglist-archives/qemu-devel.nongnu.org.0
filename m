Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C25E644D998
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 16:53:27 +0100 (CET)
Received: from localhost ([::1]:43410 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mlCOE-0001mw-Ia
	for lists+qemu-devel@lfdr.de; Thu, 11 Nov 2021 10:53:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41180)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1mlC89-0002Td-Kh
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 10:36:51 -0500
Received: from [2a00:1450:4864:20::533] (port=43763
 helo=mail-ed1-x533.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jamie@nuviainc.com>)
 id 1mlC85-0004Vf-Jy
 for qemu-devel@nongnu.org; Thu, 11 Nov 2021 10:36:48 -0500
Received: by mail-ed1-x533.google.com with SMTP id w1so25773629edd.10
 for <qemu-devel@nongnu.org>; Thu, 11 Nov 2021 07:36:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=nuviainc-com.20210112.gappssmtp.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=QYpdmZPEiJ4TjU6FIvG2S/wL1NN9gU5lZ8S0T/L+Xqo=;
 b=RTeL5UTO8MdJGirs0c7sz7Wmuk+Im46mZAqYcuuzMWzzG4jTU5c5wKJvJtVfnOIxWH
 3Ixr+fgcOspnw0TuVnDKDPcMhoTicXwdve6pyea+Zns+z3MNt8KxQhJwr2bSlD6klUiw
 e1zHKUBnr4wW4ZqmOkN3VgPol0GTotS8ym2/eII/E+VQgQkgrF4z2Ix3e8lP0/Kv7Whk
 97KRn/y8GqI1fYnBHoqTPvxl1wdp9Ta2PHEKo/vFRjN9fUF5aQddvgc8TdjCw9XutSP+
 9jw44g2fzqPynOn/NC/3WE+fKf1YtouQ0gpEevj5B/c34YjK6hcnV3+g7VPdz6zTcq5f
 bnug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=QYpdmZPEiJ4TjU6FIvG2S/wL1NN9gU5lZ8S0T/L+Xqo=;
 b=mJKfdvTCNUlAqpxj1DL6tHrYF/gbAPMShj8eIpVN9VpKW7AV7bwv3zAayJKvgBysZj
 P9unnfm4wDbo+vAFmleq7+SFyISHNIzIGRjWruEo6WuJu6gEe7WcvLZpnNQ+Z2Rrefks
 3XADOVdMOgVBGWP9AoB1QZYqndQGAJNgc5ULv13SQd9kpS0IOLaJZREPRCbJaxzVvAWd
 UJgVhukobVj22RZkp3OkWbbf74LbwMwdHRsTzC4u+wZQO7p/pVcjVhv4rggxTeqnnKi8
 FFv/5Hh4rA+i7yx/Ej7LwCCT3Obl5k9pq3p9USDpyrop+p+rfUe34AUXqJp80bf/9dot
 ccag==
X-Gm-Message-State: AOAM532Ey1DU8MPw3Olf7Y2Z870KcmC+MtpWKJLVnKTcjwDS7SemCtIz
 PxGtiMBtOvA/AQ8RPKt6a8Ob7Q==
X-Google-Smtp-Source: ABdhPJz/872VqV5JbcMvu8Sy3MKtaEa9w3c3lRYmxmgq3TUwsYZ/HLeu6t3AiEfdKo+WueKiuTMenw==
X-Received: by 2002:a17:906:9144:: with SMTP id
 y4mr10303042ejw.98.1636645003288; 
 Thu, 11 Nov 2021 07:36:43 -0800 (PST)
Received: from localhost ([82.44.17.50])
 by smtp.gmail.com with ESMTPSA id o14sm1779388edj.15.2021.11.11.07.36.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Nov 2021 07:36:42 -0800 (PST)
Date: Thu, 11 Nov 2021 15:36:42 +0000
From: Jamie Iles <jamie@nuviainc.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Subject: Re: [PATCH 2/2] hw/core/loader: workaround read() size limit.
Message-ID: <YY04ioqviteeKy0c@hazel>
References: <20211111141141.3295094-1-jamie@nuviainc.com>
 <20211111141141.3295094-3-jamie@nuviainc.com>
 <c9950c92-86c5-ce0d-054e-357db1de851c@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c9950c92-86c5-ce0d-054e-357db1de851c@redhat.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::533
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=jamie@nuviainc.com; helo=mail-ed1-x533.google.com
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

Hi Philippe,

On Thu, Nov 11, 2021 at 03:55:48PM +0100, Philippe Mathieu-Daudé wrote:
> Hi Jamie,
> 
> On 11/11/21 15:11, Jamie Iles wrote:
> > On Linux, read() will only ever read a maximum of 0x7ffff000 bytes
> > regardless of what is asked.  If the file is larger than 0x7ffff000
> > bytes the read will need to be broken up into multiple chunks.
> > 
> > Cc: Luc Michel <lmichel@kalray.eu>
> > Signed-off-by: Jamie Iles <jamie@nuviainc.com>
> > ---
> >  hw/core/loader.c | 40 ++++++++++++++++++++++++++++++++++------
> >  1 file changed, 34 insertions(+), 6 deletions(-)
> > 
> > diff --git a/hw/core/loader.c b/hw/core/loader.c
> > index 348bbf535bd9..16ca9b99cf0f 100644
> > --- a/hw/core/loader.c
> > +++ b/hw/core/loader.c
> > @@ -80,6 +80,34 @@ int64_t get_image_size(const char *filename)
> >      return size;
> >  }
> >  
> > +static ssize_t read_large(int fd, void *dst, size_t len)
> > +{
> > +    /*
> > +     * man 2 read says:
> > +     *
> > +     * On Linux, read() (and similar system calls) will transfer at most
> > +     * 0x7ffff000 (2,147,479,552) bytes, returning the number of bytes
> 
> Could you mention MAX_RW_COUNT from linux/fs.h?
> 
> > +     * actually transferred.  (This is true on both 32-bit and 64-bit
> > +     * systems.)
> 
> Maybe "This is true for both ILP32 and LP64 data models used by Linux"?
> (because that would not be the case for the ILP64 model).
> 
> Otherwise s/systems/Linux variants/?
> 
> > +     *
> > +     * So read in chunks no larger than 0x7ffff000 bytes.
> > +     */
> > +    size_t max_chunk_size = 0x7ffff000;
> 
> We can declare it static const.

Ack, can fix all of those up.

> > +    size_t offset = 0;
> > +
> > +    while (offset < len) {
> > +        size_t chunk_len = MIN(max_chunk_size, len - offset);
> > +        ssize_t br = read(fd, dst + offset, chunk_len);
> > +
> > +        if (br < 0) {
> > +            return br;
> > +        }
> > +        offset += br;
> > +    }
> > +
> > +    return (ssize_t)len;
> > +}
> 
> I see other read()/pread() calls:
> 
> hw/9pfs/9p-local.c:472:            tsize = read(fd, (void *)buf, bufsz);
> hw/vfio/common.c:269:    if (pread(vbasedev->fd, &buf, size,
> region->fd_offset + addr) != size) {
> ...
> 
> Maybe the read_large() belongs to "sysemu/os-xxx.h"?

I think util/osdep.c would be a good fit for this.  To make sure we're 
on the same page though are you proposing converting all pread/read 
calls to a qemu variant or auditing for ones that could potentially take 
a larger size?

Thanks,

Jamie

