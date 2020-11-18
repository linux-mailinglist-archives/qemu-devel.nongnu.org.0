Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E94BD2B8472
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Nov 2020 20:11:38 +0100 (CET)
Received: from localhost ([::1]:55276 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfSri-0001o2-1W
	for lists+qemu-devel@lfdr.de; Wed, 18 Nov 2020 14:11:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <msys.mizuma@gmail.com>)
 id 1kfSkB-0007CO-B9
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 14:03:52 -0500
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:42712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <msys.mizuma@gmail.com>)
 id 1kfSk4-00087W-Ug
 for qemu-devel@nongnu.org; Wed, 18 Nov 2020 14:03:51 -0500
Received: by mail-qt1-x844.google.com with SMTP id z3so2434656qtw.9
 for <qemu-devel@nongnu.org>; Wed, 18 Nov 2020 11:03:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=10TNro8XWLuaYGh15K/hQdFUYnMgvS31xfRPymMQiFg=;
 b=bZeLbq6HLC6eauPjfWKgTyF4R8NEPgUkX1L+y0yE1RPipopDhegKVLNJaHDP2oGS9/
 ET8ubLGoUdsByYrLc8QjQ3Fl1qGPcR12p1zOt0D8agl9R4SZE4KhR98rBJtm+GAvrBkl
 k5HhePAnt3KOdYTcjQyEReb3Ev9/A/1sVxO5QPvdF4DN9nZnMTI6iWnPtcxptLRxjif7
 LBTSY+d9NL0089puPNZJJRVQTfujqQ4OMo5WKwS8NtS/uch/tUvU9SPbgse3583TLrY3
 Hs7bh/ktTuvwdeux0PbSAamOMJMGrrqcArtk6Z4jfU24CTeW0CjCYGRsY0kxddpBboKq
 Rv5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=10TNro8XWLuaYGh15K/hQdFUYnMgvS31xfRPymMQiFg=;
 b=pjON4okP0b1TFqFbANq9QRFOnC1198F1wh0GxzN7eiWDjYACvzevvrD/HUUdNq7TFq
 zRipSWkmSuknTGFynknaciTTmNwg8JngAlR5ut6NJeUcEtAnkr20B8NtSAoivVqlqtuO
 qtV8n6tbl2rChphtcPcvhrXtGUmr2R21lBX1P6BoTLDT/dKSbhu3p4+Dvi+j0UTDj6m5
 daLGnholT1C8rjLpZS5Y2MfZw3fiybSvlPmG5Z/O6SK+9u4uinj5HAXVJw2shDa3hcui
 qZQ7h96Ja+d2RxkFF77uatzWJEVSVAnqfM+Ss94qSTMD1T6hmJIWmKM72d4D23eENyWK
 2t2Q==
X-Gm-Message-State: AOAM531MZ3tR0jMWsk4QcOZQh85JQL0O0A0Ry4+7yGl5H6SUk3kx0CjP
 6gi+M9Xv+dMdvKKUznRISlcchU2g9w==
X-Google-Smtp-Source: ABdhPJwCOH+PaztUsHvpthBu1rSi6BV6KhuU7N33L7S/BshNuSqdHtPfiw5BM+0lVdv9bkyb+ASApg==
X-Received: by 2002:ac8:4a8c:: with SMTP id l12mr6181037qtq.7.1605726223783;
 Wed, 18 Nov 2020 11:03:43 -0800 (PST)
Received: from gabell
 (209-6-122-159.s2973.c3-0.arl-cbr1.sbo-arl.ma.cable.rcncustomer.com.
 [209.6.122.159])
 by smtp.gmail.com with ESMTPSA id a23sm17100051qtk.82.2020.11.18.11.03.42
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 18 Nov 2020 11:03:42 -0800 (PST)
Date: Wed, 18 Nov 2020 14:03:41 -0500
From: Masayoshi Mizuma <msys.mizuma@gmail.com>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Subject: Re: [PATCH 1/2] file-posix: Use OFD lock only if the filesystem
 supports the lock
Message-ID: <20201118190341.qunlirnmcwx5uiyf@gabell>
References: <20201106040102.13892-1-msys.mizuma@gmail.com>
 <20201118151653.GF229461@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20201118151653.GF229461@redhat.com>
Received-SPF: pass client-ip=2607:f8b0:4864:20::844;
 envelope-from=msys.mizuma@gmail.com; helo=mail-qt1-x844.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Wed, Nov 18, 2020 at 03:16:53PM +0000, Daniel P. Berrangé wrote:
> On Thu, Nov 05, 2020 at 11:01:01PM -0500, Masayoshi Mizuma wrote:
> > From: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
> > 
> > locking=auto doesn't work if the filesystem doesn't support OFD lock.
> > In that situation, following error happens:
> > 
> >   qemu-system-x86_64: -blockdev driver=qcow2,node-name=disk,file.driver=file,file.filename=/mnt/guest.qcow2,file.locking=auto: Failed to lock byte 100
> > 
> > qemu_probe_lock_ops() judges whether qemu can use OFD lock
> > or not with doing fcntl(F_OFD_GETLK) to /dev/null. So the
> > error happens if /dev/null supports OFD lock, but the filesystem
> > doesn't support the lock.
> > 
> > Lock the actual file, not /dev/null, using F_OFD_SETLK and if that
> > fails, then fallback to F_SETLK.
> > 
> > Signed-off-by: Masayoshi Mizuma <m.mizuma@jp.fujitsu.com>
> > ---
> >  block/file-posix.c   |  56 ++++++++--------
> >  include/qemu/osdep.h |   2 +-
> >  util/osdep.c         | 149 ++++++++++++++++++++++++++++---------------
> >  3 files changed, 125 insertions(+), 82 deletions(-)
> 
> 
> > diff --git a/util/osdep.c b/util/osdep.c
> > index 66d01b9160..454e8ef9f4 100644
> > --- a/util/osdep.c
> > +++ b/util/osdep.c
> > @@ -117,9 +117,6 @@ int qemu_mprotect_none(void *addr, size_t size)
> >  
> >  #ifndef _WIN32
> >  
> > -static int fcntl_op_setlk = -1;
> > -static int fcntl_op_getlk = -1;
> > -
> >  /*
> >   * Dups an fd and sets the flags
> >   */
> > @@ -187,68 +184,87 @@ static int qemu_parse_fdset(const char *param)
> >      return qemu_parse_fd(param);
> >  }
> >  
> > -static void qemu_probe_lock_ops(void)
> > +bool qemu_has_ofd_lock(int orig_fd)
> >  {
> > -    if (fcntl_op_setlk == -1) {
> >  #ifdef F_OFD_SETLK
> > -        int fd;
> > -        int ret;
> > -        struct flock fl = {
> > -            .l_whence = SEEK_SET,
> > -            .l_start  = 0,
> > -            .l_len    = 0,
> > -            .l_type   = F_WRLCK,
> > -        };
> > -
> > -        fd = open("/dev/null", O_RDWR);
> > -        if (fd < 0) {
> > +    int fd;
> > +    int ret;
> > +    struct flock fl = {
> > +        .l_whence = SEEK_SET,
> > +        .l_start  = 0,
> > +        .l_len    = 0,
> > +        .l_type   = F_RDLCK,
> > +    };
> > +
> > +    fd = qemu_dup(orig_fd);
> 
> Consider that we're *not* using  OFD locks, and QEMU already
> has 'foo.qcow2' open for an existing disk backend, and it is
> locked.
> 
> Now someone tries to hot-add 'foo.qcow2' for a second disk
> by mistake.  Doing this qemu_dup + qemu_close will cause
> the existing locks to be removed AFAICT.

Thank you for pointing it out. I'll remove this qemu_dup() and
check orig_fd directly.

> 
> > +    if (fd >= 0) {
> > +        ret = fcntl_setfl(fd, O_RDONLY);
> > +        if (ret) {
> >              fprintf(stderr,
> > -                    "Failed to open /dev/null for OFD lock probing: %s\n",
> > -                    strerror(errno));
> > -            fcntl_op_setlk = F_SETLK;
> > -            fcntl_op_getlk = F_GETLK;
> > -            return;
> > -        }
> > -        ret = fcntl(fd, F_OFD_GETLK, &fl);
> > -        close(fd);
> > -        if (!ret) {
> > -            fcntl_op_setlk = F_OFD_SETLK;
> > -            fcntl_op_getlk = F_OFD_GETLK;
> > -        } else {
> > -            fcntl_op_setlk = F_SETLK;
> > -            fcntl_op_getlk = F_GETLK;
> > +                    "Failed to fcntl for OFD lock probing.\n");
> > +            qemu_close(fd);
> > +            return false;
> >          }
> > +    }
> > +
> > +    ret = fcntl(fd, F_OFD_GETLK, &fl);
> > +    qemu_close(fd);
> > +
> > +    if (ret == 0) {
> > +        return true;
> > +    } else {
> > +        return false;
> > +    }
> >  #else
> > -        fcntl_op_setlk = F_SETLK;
> > -        fcntl_op_getlk = F_GETLK;
> > +    return false;
> >  #endif
> > -    }
> >  }
> >  
> > -bool qemu_has_ofd_lock(void)
> > -{
> > -    qemu_probe_lock_ops();
> >  #ifdef F_OFD_SETLK
> > -    return fcntl_op_setlk == F_OFD_SETLK;
> > +static int _qemu_lock_fcntl(int fd, struct flock *fl)
> > +{
> > +    int ret;
> > +    bool ofd_lock = true;
> > +
> > +    do {
> > +        if (ofd_lock) {
> > +            ret = fcntl(fd, F_OFD_SETLK, fl);
> > +            if ((ret == -1) && (errno == EINVAL)) {
> > +                ofd_lock = false;
> > +            }
> > +        }
> > +
> > +        if (!ofd_lock) {
> > +            /* Fallback to POSIX lock */
> > +            ret = fcntl(fd, F_SETLK, fl);
> > +        }
> > +    } while (ret == -1 && errno == EINTR);
> 
> THis loop is confusing to read. I'd suggest creating a
> wrapper
> 
>   qemu_fcntl()
> 
> that does the while (ret == -1 && errno == EINTR) loop,
> so that this locking code can be clearer without the
> loop.

Great idea. I'll make qemu_fcntl().

Thanks!
Masa

> 
> > +
> > +    return ret == -1 ? -errno : 0;
> > +}
> >  #else
> > -    return false;
> > -#endif
> > +static int _qemu_lock_fcntl(int fd, struct flock *fl)
> > +{
> > +    int ret;
> > +
> > +    do {
> > +        ret = fcntl(fd, F_SETLK, fl);
> > +    } while (ret == -1 && errno == EINTR);
> > +
> > +    return ret == -1 ? -errno : 0;
> >  }
> > +#endif
> 
> 
> Regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 

