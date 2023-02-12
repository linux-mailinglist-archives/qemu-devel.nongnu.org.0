Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2741693600
	for <lists+qemu-devel@lfdr.de>; Sun, 12 Feb 2023 05:24:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pR3uA-0002kS-1c; Sat, 11 Feb 2023 23:23:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1pR3u7-0002kK-0r
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 23:23:55 -0500
Received: from mx2.freebsd.org ([2610:1c1:1:606c::19:2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kevans@freebsd.org>)
 id 1pR3u5-0005TC-4e
 for qemu-devel@nongnu.org; Sat, 11 Feb 2023 23:23:54 -0500
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 4PDvVZ15pcz3q1J
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 04:23:50 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4PDvVZ0Kzfz4J2n
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 04:23:50 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org; s=dkim;
 t=1676175830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fX+oEk8MukzD25yhT4Rrz2+8KeHgK4hqC9MYMUCXQ0I=;
 b=yE+7u/F9bvbLI/hGVy4eBkj784/plrt86b/YKLku/umEI9pSg30V7CAu+Fve8ykIdiIR22
 5PVOzPc6HJ/ZLjDsglvLuY5TFusrXDCfjmy3q+Qcv/1BNf6IDst/3smovR/Gj5PX5bCX1w
 m1NFrw2LlgR4i5kKCOzsg8dpVXK8c9O+Q/VK3IxiMzvlR749sKVKrjlHKEDd9FTKPBU5bN
 qKmlOG1BfWPxfFvCOwTw8v7XndAru3FmhsfDsLy3suEzxl1GPIWiz8GuKWedkr3aKOFHNS
 HUlOEU5A1Iei0+sH3pOl/4zFKM4CzfMxHgYx1APOaEoYuQPbQ9a7MD3TfzVNmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=freebsd.org;
 s=dkim; t=1676175830;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=fX+oEk8MukzD25yhT4Rrz2+8KeHgK4hqC9MYMUCXQ0I=;
 b=e37ANmgjoOQlI4VC5R5GtEvCNeWG/JuujdsB4qrSsB4d2ZNRMu4k/DrrFyRIpvzoaVwKnQ
 8eL0ACRbBHPZFpnxGHWjEMoxUf3dKO4p3wdqZj31jQBmjzlynoRq3I5+hASCrw3ovp3E8r
 sNvGm3kM9h0DRZI6mSWWfiqli51XZ4tVWrimneZ1eayIlFcAGzlVkptuvQmXEvcYseLNX9
 ZK9J0x6I13m2iISMK2XIed0s2ZFjTn0ElbhFaC3uXdw/BLvHmT6ADVRiW0GFYPB6fJNfD/
 fpZ0E8fvrOVONwehXaO/A3OlTKjriDISaaSa8YHRBRZiED7UymrUJ2j30pvr9g==
ARC-Authentication-Results: i=1;
	mx1.freebsd.org;
	none
ARC-Seal: i=1; s=dkim; d=freebsd.org; t=1676175830; a=rsa-sha256; cv=none;
 b=dTLbxrSKXxC1Ic+SBLxEozW8qo4rMt7RO+1qmykKWUaVIJHoCFcyFuYhdhhpihKYcg495E
 NpXnWlUlxqfnl+JcTuHTtxlomIBNzp6CfBeXctcD+I5faHOoK/XMMrYjOUY5YVUSkqY9ya
 OO5tmA2SVkgDsoL7AdziPwxUBD4+ICMCstYQ8nNGT+YacabNI202VJe1DF2ggmJSux+S5c
 taUIcFP7+0fe9yjlNbHS/JFdb7jIIujOZUAbjBOPModMt7MxNOMv7T2v/2Badx3NDf50CN
 GtqvZ/yDuLCA3Zwvx5hd2mxoX6XH9g0kqfQ4uWh0I6RoxUvWP/epyCabXdGfQg==
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (2048 bits) client-digest SHA256)
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1D4" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 4PDvVY6PYkzZJ7
 for <qemu-devel@nongnu.org>; Sun, 12 Feb 2023 04:23:49 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qt1-f171.google.com with SMTP id ch10so9429247qtb.11
 for <qemu-devel@nongnu.org>; Sat, 11 Feb 2023 20:23:49 -0800 (PST)
X-Gm-Message-State: AO0yUKVXMvFTrxdNcF0Vl5uGm7LNmsCwXEmdeBb92Ea7spAsgmi8t81+
 TdxUUea1Fp6pb/7hK9mmHj5xs5Zz0DMkjyM67xY=
X-Google-Smtp-Source: AK7set8qjrBFxzPddz7AszknZbmYQYVCos/lfutKnVbFJSmQyGVmQexkHEtqemkXjfhAOJFTygjQ/GvFBGTcElFwbBQ=
X-Received: by 2002:ac8:5bd6:0:b0:3ba:2138:81d with SMTP id
 b22-20020ac85bd6000000b003ba2138081dmr1727963qtb.278.1676175829168; Sat, 11
 Feb 2023 20:23:49 -0800 (PST)
MIME-Version: 1.0
References: <20230210231829.39476-1-imp@bsdimp.com>
 <20230210231829.39476-9-imp@bsdimp.com>
 <16b47168-39fe-ac65-741d-5786663a7a9d@linaro.org>
In-Reply-To: <16b47168-39fe-ac65-741d-5786663a7a9d@linaro.org>
From: Kyle Evans <kevans@freebsd.org>
Date: Sat, 11 Feb 2023 22:23:42 -0600
X-Gmail-Original-Message-ID: <CACNAnaHx1LD=7ksd_pZ2sPqHj84y-384ZtMJbgcPFcEmy94NhA@mail.gmail.com>
Message-ID: <CACNAnaHx1LD=7ksd_pZ2sPqHj84y-384ZtMJbgcPFcEmy94NhA@mail.gmail.com>
Subject: Re: [PATCH 8/9] bsd-user: implement sysctlbyname(2)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Warner Losh <imp@bsdimp.com>, qemu-devel@nongnu.org,
 Thomas Huth <thuth@redhat.com>, 
 Kyle Evans <kevans@freebsd.org>, f4bug@amsat.org, 
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2610:1c1:1:606c::19:2;
 envelope-from=kevans@freebsd.org; helo=mx2.freebsd.org
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

On Sat, Feb 11, 2023 at 5:13 PM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 2/10/23 13:18, Warner Losh wrote:
> > From: Kyle Evans <kevans@FreeBSD.org>
> >
> > do_freebsd_sysctlbyname needs to translate the 'name' back down to a OID
> > so we can intercept the special ones. Do that and call the common wrapper
> > do_freebsd_sysctl_oid.
> >
> > Signed-off-by: Kyle Evans <kevans@FreeBSD.org>
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >   bsd-user/freebsd/os-sys.c     | 58 +++++++++++++++++++++++++++++++++++
> >   bsd-user/freebsd/os-syscall.c |  4 +++
> >   2 files changed, 62 insertions(+)
> >
> > diff --git a/bsd-user/freebsd/os-sys.c b/bsd-user/freebsd/os-sys.c
> > index 13736936e5f..62c729dfe47 100644
> > --- a/bsd-user/freebsd/os-sys.c
> > +++ b/bsd-user/freebsd/os-sys.c
> > @@ -345,6 +345,64 @@ out:
> >       return ret;
> >   }
> >
> > +/*
> > + * This syscall was created to make sysctlbyname(3) more efficient.
> > + * Unfortunately, because we have to fake some sysctls, we can't do that.
>
> Can't do what?  Directly use sysctlbyname?
>

How about:

/*
 * This syscall was created to make sysctlbyname(3) more efficient, but
 * we can't really provide it in bsd-user.  Notably, we must always translate
 * the names independently since some sysctl values have to be faked
 * for the target environment, so it still has to break down to two syscalls
 * for the underlying implementation.
 */

> > +    if (oldlenp) {
> > +        if (get_user_ual(oldlen, oldlenp)) {
> > +            return -TARGET_EFAULT;
> > +        }
>
> Same comment about verifying write early.
>
> > +    unlock_user(holdp, oldp, holdlen);
>
> And writeback vs error.
>
>
> r~

