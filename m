Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BB9B54B2E5
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jun 2022 16:17:17 +0200 (CEST)
Received: from localhost ([::1]:38266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o17M3-00049p-Ro
	for lists+qemu-devel@lfdr.de; Tue, 14 Jun 2022 10:17:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48658)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o17Ja-0002VW-3x
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 10:14:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:25809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgilbert@redhat.com>)
 id 1o17JT-0004KO-Sl
 for qemu-devel@nongnu.org; Tue, 14 Jun 2022 10:14:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1655216074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2p/Wdc3hNU4a08lLCYogJOaOrHvqOyPmM0mXCbwc+uw=;
 b=gElE04HfzmLdGihgjmnj9w+dSO71k4qK4+VLgAndMf053w4pcUVArWR0sW9I87rlGjFIyk
 UQm0B4t4vN3S5fqf0shh1vbopx3jkBFpK4MQyEMrR7hVmku+CJQ7azHtczQU/4jPJNGJGv
 KT6m9Q6J2KHrGUc4y4Ux0U6gL0IB9XM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-526-i25onlb0Nry7auP8jUam5Q-1; Tue, 14 Jun 2022 10:14:30 -0400
X-MC-Unique: i25onlb0Nry7auP8jUam5Q-1
Received: by mail-wm1-f70.google.com with SMTP id
 l17-20020a05600c4f1100b0039c860db521so4535412wmq.5
 for <qemu-devel@nongnu.org>; Tue, 14 Jun 2022 07:14:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to:user-agent;
 bh=2p/Wdc3hNU4a08lLCYogJOaOrHvqOyPmM0mXCbwc+uw=;
 b=7QeqHEyuGaOJDPWm44p4IpZbR5xh6hSjMhIt8eFzAQtgJDUzZ/FKuOnLj7fjQ+Dp5u
 owJ4qEKDcGHG9KC4eQr71uqzUjGdgzaw63cwll/9YN5yHjf2T9sU43fvusaKo+PR2+jh
 tCqaKqg92rWb6FL/p6OfTnRVUgMVaRkz4mIVculTPt8om45/tPaT0T69y6etFzHWRc6z
 d9TUxqLeCBAEpvXyTf30Y2cPKCPFGjwVliNENBdsigjPmnkOr7THoMuGo0nh9NJJcA5B
 QiB11/+JRSSesOZFTj98LCInjNMfyerPEvrQrRlq5rEJMWfVhyIjEHwf0oyy8B6H3IHj
 TV7A==
X-Gm-Message-State: AJIora8byPJQAFJcoqw+fmkihFYcyC+RxDWDlAZ/aeJiIcQUf3z4PswP
 BZQ5VF3KX5RgWZF5AJ1wRxAYv4v8cEtdACPc/7J3o4rZRGPmNBpMkf69U+pnFGNxIpybFAWJJfg
 rd9WyY/8+vceWyEw=
X-Received: by 2002:adf:e902:0:b0:213:a337:92ae with SMTP id
 f2-20020adfe902000000b00213a33792aemr5201529wrm.84.1655216069524; 
 Tue, 14 Jun 2022 07:14:29 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tG7xUJnftQdTYfeokfrb3mCvQFPlpdtWwCLFY4uuqxvOVRZb3agg+J4UPnZGnczdnp/TBNeA==
X-Received: by 2002:adf:e902:0:b0:213:a337:92ae with SMTP id
 f2-20020adfe902000000b00213a33792aemr5201485wrm.84.1655216069252; 
 Tue, 14 Jun 2022 07:14:29 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net.
 [82.30.61.225]) by smtp.gmail.com with ESMTPSA id
 l15-20020a05600c4f0f00b003942a244f39sm22772598wmq.18.2022.06.14.07.14.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Jun 2022 07:14:28 -0700 (PDT)
Date: Tue, 14 Jun 2022 15:14:26 +0100
From: "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To: chuang xu <xuchuangxclwt@bytedance.com>
Cc: Leonardo Bras <leobras@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>,
 =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Elena Ufimtseva <elena.ufimtseva@oracle.com>,
 Jagannathan Raman <jag.raman@oracle.com>,
 Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 John G Johnson <john.g.johnson@oracle.com>,
 Juan Quintela <quintela@redhat.com>, Eric Blake <eblake@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Fam Zheng <fam@euphon.net>,
 lizefan.x@bytedance.com, zhouyibo@bytedance.com
Subject: Re: [External] [PATCH v13 3/8] QIOChannelSocket: Implement io_writev
 zero copy flag & io_flush for CONFIG_LINUX
Message-ID: <YqiXwhG+TxG7IPY3@work-vm>
References: <20220513062836.965425-1-leobras@redhat.com>
 <20220513062836.965425-4-leobras@redhat.com>
 <c951a606-e306-6f11-0bd9-204a8b0d223a@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c951a606-e306-6f11-0bd9-204a8b0d223a@bytedance.com>
User-Agent: Mutt/2.2.5 (2022-05-16)
Received-SPF: pass client-ip=170.10.133.124; envelope-from=dgilbert@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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

* chuang xu (xuchuangxclwt@bytedance.com) wrote:
> 
> On 2022/5/13 下午2:28, Leonardo Bras wrote:
> > @@ -557,15 +578,31 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
> >           memcpy(CMSG_DATA(cmsg), fds, fdsize);
> >       }
> > +#ifdef QEMU_MSG_ZEROCOPY
> > +    if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
> > +        sflags = MSG_ZEROCOPY;
> > +    }
> > +#endif
> > +
> >    retry:
> > -    ret = sendmsg(sioc->fd, &msg, 0);
> > +    ret = sendmsg(sioc->fd, &msg, sflags);
> >       if (ret <= 0) {
> > -        if (errno == EAGAIN) {
> > +        switch (errno) {
> > +        case EAGAIN:
> >               return QIO_CHANNEL_ERR_BLOCK;
> > -        }
> > -        if (errno == EINTR) {
> > +        case EINTR:
> >               goto retry;
> > +#ifdef QEMU_MSG_ZEROCOPY
> > +        case ENOBUFS:
> > +            if (sflags & MSG_ZEROCOPY) {
> > +                error_setg_errno(errp, errno,
> > +                                 "Process can't lock enough memory for using MSG_ZEROCOPY");
> > +                return -1;
> > +            }
> > +            break;
> > +#endif
> >           }
> > +
> >           error_setg_errno(errp, errno,
> >                            "Unable to write to socket");
> >           return -1;
> 
> Hi, Leo.
> 
> There are some other questions I would like to discuss with you.
> 
> I tested the multifd zero_copy migration and found that sometimes even if
> max locked memory of qemu was set to 16GB（much greater than
> `MULTIFD_PACKET_SIZE`）, the error "Process can't lock enough memory for
> using MSG_ZEROCOPY" would still be reported.
> 
> I noticed that the
> doc(https://www.kernel.org/doc/html/v5.12/networking/msg_zerocopy.html) says
> "A zerocopy failure will return -1 with errno ENOBUFS. This happens if the
> socket option was not set, _the socket exceeds its optmem limit_ or the user
> exceeds its ulimit on locked pages."
> 
> I also found that the RFC(https://lwn.net/Articles/715279/) says _"__The
> change to allocate notification skbuffs from optmem requires__ensuring that
> net.core.optmem is at least a few 100KB."_

Interesting.

> On my host,  optmem was initially set to 20KB, I tried to change it to 100KB
> (echo 102400 > /proc/sys/net/core/optmem_max) as the RFC says.Then I tested
> the multifd zero_copy migration repeatedly，and the error disappeared.
> 
> So when sendmsg returns -1 with errno ENOBUFS, should we distinguish between
> error ''socket exceeds optmem limit" and error "user exceeds ulimit on
> locked pages"? Or is there any better way to avoid this problem?

I don't think we can tell which one of them triggered the error; so the
only thing I can suggest is that we document the need for optmem_max
setting; I wonder how we get a better answer than 'a few 100KB'?
I guess it's something like the number of packets inflight *
sizeof(cmsghdr) ?

Dave

> Best Regards,
> 
> chuang xu
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK


