Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EC9415C04
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 12:34:59 +0200 (CEST)
Received: from localhost ([::1]:53350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTM4A-00025p-Bv
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 06:34:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1mTM1l-0007r2-IN
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:32:29 -0400
Received: from mail-io1-xd32.google.com ([2607:f8b0:4864:20::d32]:35368)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pankaj.gupta.linux@gmail.com>)
 id 1mTM1j-0006v6-Ou
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 06:32:29 -0400
Received: by mail-io1-xd32.google.com with SMTP id b78so2103823iof.2
 for <qemu-devel@nongnu.org>; Thu, 23 Sep 2021 03:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9CWqkP2SMoeHYpcA5VJEidC7zpzZBJFf4/eK2lCWwQc=;
 b=n4fhtfxNxp90mLYdvYorPAxeMP/Aqt6UxDPUZ+Mju99P14XdrCo0Ql1AUGNntTxd7j
 NsqSDVqF++F0Ipo4nv8PGrUlyJRCfpeoMwl1WxwmLP7rHA8JrFajohCvoCkdsXQ9wFRp
 +fBEq5Bnlmz9tDl9chkklrxQMeu0Bleuk1XT9N7ehSoF1fgM6hdeunA4KleqFKqpGQIe
 hTC2QvnPoneNcbQ7ecfS9xnrUePHMM3geE7fCFQoVvdR2lRIEjhP/SlQeOUh8aw6Q2ir
 0D1IfEVKptfv4G4XaSYa9nvawd51hVs0FPHoY7gN3zBggFsbZHwn8rk0cLGxrOerYKlQ
 J7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9CWqkP2SMoeHYpcA5VJEidC7zpzZBJFf4/eK2lCWwQc=;
 b=27c0v4aXtTcLW+/Cx8TvsfwmoFyX3kUWL/nv531zijxIrdn8R56F2cRYiSBdioYJQJ
 GUZYGxvwClGNJ080r/FwgpjMWyMrObaeYn+y3kiOUPlSX2s1/xxcdBLsMJVrXRhjlygd
 CexD7VDttyI0QTjRtcjW8MtJR3P170K7hfAtC0alKone90EfhKGTDxAIC4ZkSHKBXwtz
 1VHVyrdTPpye/yT6h5btHCV11fNV7AmqmuLcDbPgdDeMfiG4zb3IfmXNlnwq5Oc4B8cq
 iHoo0myOKIzYKvex+yUiLvIM+8TvjXdIAY9ZjtCX1cT6KoGwa7cDyDwLNiD/A5EhC38y
 MEKQ==
X-Gm-Message-State: AOAM531c3G5UhiQaNMV1lZlbdZAng+3ulgkzkDoxQNMLaGsvAzvBPu2T
 ykWCTBHllPMBOTcu4++Ogw4uT64ibNhBMlkv1eM=
X-Google-Smtp-Source: ABdhPJwLqi+QIpX4BleBxeCeXviFj7T9XLreSEyqs0hcA1ufFygovGOlYDXAgcqXDtXNm5tcmuYj4HqsMoBuZquTYgg=
X-Received: by 2002:a02:7818:: with SMTP id p24mr3381157jac.72.1632393146487; 
 Thu, 23 Sep 2021 03:32:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210726071145.150832-1-pankaj.gupta.linux@gmail.com>
 <CAM9Jb+iukn4hszakOnGEgECpFyi0rZWp4FUx-MU+T_KdYd=GZQ@mail.gmail.com>
 <60e82b5e-4664-6969-0776-d87f73b6527b@vivier.eu>
In-Reply-To: <60e82b5e-4664-6969-0776-d87f73b6527b@vivier.eu>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Thu, 23 Sep 2021 12:32:15 +0200
Message-ID: <CAM9Jb+hKUO_OsMTRA5P2BFY-CSzL2P_D6iphw=78uC1P-2ye2w@mail.gmail.com>
Subject: Re: [PATCH] docs/nvdimm: Update nvdimm option value in machine example
To: Laurent Vivier <laurent@vivier.eu>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::d32;
 envelope-from=pankaj.gupta.linux@gmail.com; helo=mail-io1-xd32.google.com
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
Cc: Laurent Vivier <lvivier@redhat.com>, Pankaj Gupta <pankaj.gupta@ionos.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Qemu Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

> > ping
>
> Could you post your patch with an email address ("From") that is the same as the "Signed-off-by"?

Sure sent a V2.

Thank you,
Pankaj

>
> https://wiki.qemu.org/Contribute/SubmitAPatch#Patch_emails_must_include_a_Signed-off-by:_line
>
> Thanks,
> Laurent
>
> >> Update nvdimm option value in example command from "-machine pc,nvdimm"
> >> to "-machine pc,nvdimm=on" as former complains with the below error:
> >>
> >> "qemu-system-x86_64: -machine pc,nvdimm: Expected '=' after parameter 'nvdimm'"
> >>
> >> Signed-off-by: Pankaj Gupta <pankaj.gupta@ionos.com>
> >> ---
> >>  docs/nvdimm.txt | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/docs/nvdimm.txt b/docs/nvdimm.txt
> >> index 0aae682be3..fd7773dc5a 100644
> >> --- a/docs/nvdimm.txt
> >> +++ b/docs/nvdimm.txt
> >> @@ -15,7 +15,7 @@ backend (i.e. memory-backend-file and memory-backend-ram). A simple
> >>  way to create a vNVDIMM device at startup time is done via the
> >>  following command line options:
> >>
> >> - -machine pc,nvdimm
> >> + -machine pc,nvdimm=on
> >>   -m $RAM_SIZE,slots=$N,maxmem=$MAX_SIZE
> >>   -object memory-backend-file,id=mem1,share=on,mem-path=$PATH,size=$NVDIMM_SIZE,readonly=off
> >>   -device nvdimm,id=nvdimm1,memdev=mem1,unarmed=off
> >> --
> >> 2.25.1
> >>
> >
>

