Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 326B448D5DE
	for <lists+qemu-devel@lfdr.de>; Thu, 13 Jan 2022 11:36:45 +0100 (CET)
Received: from localhost ([::1]:34016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n7xTH-0002Fv-PT
	for lists+qemu-devel@lfdr.de; Thu, 13 Jan 2022 05:36:43 -0500
Received: from eggs.gnu.org ([209.51.188.92]:47654)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n7xR9-0001Uh-OM
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 05:34:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49560)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1n7xR4-0000hv-Vw
 for qemu-devel@nongnu.org; Thu, 13 Jan 2022 05:34:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1642070064;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9wg9KnvaNZzWHgAeEURXIud8T2X0fFH/psTX7tG0fjw=;
 b=TFHR5YIbMcf18hzb4vyuo3Endh+MC/BJXKYC2hhF4qxqe0JDDlzYw6mJrEQnDEQZHH3MbH
 6IQm7D71fX+xq5usuHq/lVflcY+4D/OpOI/xz+fvscRuhkmPVzdhXnTnaNDFcWMInozqm/
 e9Dqcbut4GxHQABpV0b+oArttmkrgQE=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-456-Rv2r34lKOzyjz2_gaHK8ug-1; Thu, 13 Jan 2022 05:34:23 -0500
X-MC-Unique: Rv2r34lKOzyjz2_gaHK8ug-1
Received: by mail-pj1-f72.google.com with SMTP id
 i2-20020a17090a4b8200b001b426d8be4eso1558464pjh.4
 for <qemu-devel@nongnu.org>; Thu, 13 Jan 2022 02:34:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=9wg9KnvaNZzWHgAeEURXIud8T2X0fFH/psTX7tG0fjw=;
 b=bUSGRgyieDA2/InoaZaQg86HEj8pKDr2lubpMM55Dsc4I998RpvrLDatMSHIhWqYXq
 0wivrQzm2XBuQ/Bzr+LVdJRULxIBC6lVCmn5IIeNZCfNamOr1l0tCq1VNr3vQuxQgEOk
 twzBM9hZnL6sTROfDhrJlMkTXhcO+YjHjKqahmBmV5BkB5FIJEaGWaweQ5hGcbsGHoAL
 vzDiR+i/lw8jorxQ7B+Vydy5TI6cihgbrPSTLg0rPuy68dIES/FfvD6aSL7pL3pYXoPW
 uI3RV1Pk0gy5VjKHYj1ffeig8MJyRuYmrGC5PdMUlB+KvmcJEXDN/yWuxTIQyXlqFcQ9
 gFaQ==
X-Gm-Message-State: AOAM533k5EkLIH8gxFs/a+x5vDFAmUof//l0eREbsH900Fb8uzVDUuIF
 zxlVwbk2Gr8ZK2F8pDWeoW1PXpbktWxd/C+g6eX7kde44xgR7glY4iv+CgnpRagbeRHNjwSnY+m
 uBY3zJAhFRtXlRBI=
X-Received: by 2002:a17:902:b414:b0:142:431f:3d1c with SMTP id
 x20-20020a170902b41400b00142431f3d1cmr4086273plr.32.1642070062583; 
 Thu, 13 Jan 2022 02:34:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy16dK0N49vrXX0XMEKLm9gLtnH98hAwLCwkPAoj0GC8553uS7v+dGcTg15enrNkAkLTgTNEw==
X-Received: by 2002:a17:902:b414:b0:142:431f:3d1c with SMTP id
 x20-20020a170902b41400b00142431f3d1cmr4086249plr.32.1642070062247; 
 Thu, 13 Jan 2022 02:34:22 -0800 (PST)
Received: from xz-m1.local ([223.72.82.165])
 by smtp.gmail.com with ESMTPSA id 10sm2540651pjc.6.2022.01.13.02.34.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 02:34:21 -0800 (PST)
Date: Thu, 13 Jan 2022 18:34:12 +0800
From: Peter Xu <peterx@redhat.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Leonardo Bras Soares Passos <lsoaresp@redhat.com>
Subject: Re: [PATCH v7 2/5] QIOChannelSocket: Implement io_writev zero copy
 flag & io_flush for CONFIG_LINUX
Message-ID: <YeAAJLYeImjPwW0f@xz-m1.local>
References: <20220106221341.8779-1-leobras@redhat.com>
 <20220106221341.8779-3-leobras@redhat.com>
 <Yd/LLxNCItAIX3eN@xz-m1.local> <Yd/5lhcW6IHlVOBz@redhat.com>
MIME-Version: 1.0
In-Reply-To: <Yd/5lhcW6IHlVOBz@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.594,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Juan Quintela <quintela@redhat.com>, qemu-devel@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Leonardo Bras <leobras@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu, Jan 13, 2022 at 10:06:14AM +0000, Daniel P. Berrangé wrote:
> On Thu, Jan 13, 2022 at 02:48:15PM +0800, Peter Xu wrote:
> > On Thu, Jan 06, 2022 at 07:13:39PM -0300, Leonardo Bras wrote:
> > > @@ -558,15 +575,26 @@ static ssize_t qio_channel_socket_writev(QIOChannel *ioc,
> > >          memcpy(CMSG_DATA(cmsg), fds, fdsize);
> > >      }
> > >  
> > > +    if (flags & QIO_CHANNEL_WRITE_FLAG_ZERO_COPY) {
> > > +        sflags = MSG_ZEROCOPY;
> > > +    }
> > > +
> > >   retry:
> > > -    ret = sendmsg(sioc->fd, &msg, 0);
> > > +    ret = sendmsg(sioc->fd, &msg, sflags);
> > >      if (ret <= 0) {
> > > -        if (errno == EAGAIN) {
> > > +        switch (errno) {
> > > +        case EAGAIN:
> > >              return QIO_CHANNEL_ERR_BLOCK;
> > > -        }
> > > -        if (errno == EINTR) {
> > > +        case EINTR:
> > >              goto retry;
> > > +        case ENOBUFS:
> > > +            if (sflags & MSG_ZEROCOPY) {
> > > +                error_setg_errno(errp, errno,
> > > +                                 "Process can't lock enough memory for using MSG_ZEROCOPY");
> > > +                return -1;
> > > +            }
> > 
> > I have no idea whether it'll make a real differnece, but - should we better add
> > a "break" here?  If you agree and with that fixed, feel free to add:
> > 
> > Reviewed-by: Peter Xu <peterx@redhat.com>
> > 
> > I also wonder whether you hit ENOBUFS in any of the environments.  On Fedora
> > here it's by default unlimited, but just curious when we should keep an eye.
> 
> Fedora doesn't allow unlimited locked memory by default
> 
> $ grep "locked memory" /proc/self/limits 
> Max locked memory         65536                65536                bytes     
> 
> And  regardless of Fedora defaults, libvirt will set a limit
> for the guest. It will only be unlimited if requiring certain
> things like VFIO.

Thanks, I obviously checked up the wrong host..

Leo, do you know how much locked memory will be needed by zero copy?  Will
there be a limit?  Is it linear to the number of sockets/channels?

It'll be better if we can fail at enabling the feature when we detected that
the specified locked memory limit may not be suffice.

-- 
Peter Xu


