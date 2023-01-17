Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8685C66E7E8
	for <lists+qemu-devel@lfdr.de>; Tue, 17 Jan 2023 21:45:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHsoB-0008OP-Ae; Tue, 17 Jan 2023 15:43:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pHso8-0008O8-IR
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 15:43:48 -0500
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <stefanha@gmail.com>)
 id 1pHso6-0002QP-HY
 for qemu-devel@nongnu.org; Tue, 17 Jan 2023 15:43:47 -0500
Received: by mail-yb1-xb32.google.com with SMTP id p188so35652908yba.5
 for <qemu-devel@nongnu.org>; Tue, 17 Jan 2023 12:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=pDOeHdbBDP80OR7Ssy3nFr0cpM69HmwdrTQDL+NnqS4=;
 b=HVDq/Nu0+VzI/LRPx9Xi0/4CpyLo5YghcepBVPYwooXwsQKIaPAkYWMQd5tCdMIuZK
 rG1ULrwiC9YNCuz05okCPfCMQ9xKXtm5N8ERZUagkf+pqjySq9D4MCC/hTGlZYmaq/Gb
 gld+L2wFznzgzdS27e1ERkQRLVfTcoWwMWgCbkVBa9v/Ai8Cw+8OTAqK1Le9W1I6o/ET
 mki3GdzDMaf3fPCfo9rpJCPsNvDTCs1ysUfG9iQYZVeLsboMK/tf41/nhtnEbLJzlhbB
 lbKBykxD1KM+o5Rb4K0e+bN8Tx7xIXj7yw8RNtIQRwVsnp+kXijk8jAODDPqCGkq+Qed
 SF4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pDOeHdbBDP80OR7Ssy3nFr0cpM69HmwdrTQDL+NnqS4=;
 b=Z9iPB6HfsOfT7ng2Rufv+HTbZ/CsLj0k1zmIsnuZQ6fVFAjKQ1om1Us2G+p6IPSLGN
 4CT18RnGt8QzdZpyEUxfG6vEgigSBbBbY3MNPMmxGUj7f5a1nzun3jraKJpDTFTp7myq
 rV49Wh5wP+o6F1VYxnOLz3wNGr+cgQcDd+y6q6Q3JNdZ461/uOH+f4EdY3Xpy7hDpMdQ
 do5OFlaLFpp3ZhnTf3S2dgWiuJ45mcch02jh/qAqsSpIJfBbKlZ9EhOJXKdpVMJvxxTj
 /di/sPefu4BqSsWfPT9LCM3E0NVXaPexkpOaq/WFjeLOnT5/Fee41P6kLTxie9qjNeOF
 48cw==
X-Gm-Message-State: AFqh2kpM37CFvUG78Ph4ZvirKxtxIimRboIwCVFEPOtBIGrYcuKh6onh
 7djo6IWVAYF5Gqllbx0PWH/rd4GEr9h0aGLcx5E=
X-Google-Smtp-Source: AMrXdXt6qJCv3O3y78+wVzcxH6moSLXd40B2BO+GarbaASHskKSY6Assuoju7zeXEaEqNZwmTMxlwwAHLX9XFw+FdhA=
X-Received: by 2002:a25:bfca:0:b0:7d7:1668:3045 with SMTP id
 q10-20020a25bfca000000b007d716683045mr657266ybm.118.1673988225172; Tue, 17
 Jan 2023 12:43:45 -0800 (PST)
MIME-Version: 1.0
References: <20230117135203.3049709-1-eesposit@redhat.com>
 <20230117135203.3049709-3-eesposit@redhat.com>
 <CANCZdfq=F9HJnjX9sGq6w9tzVx2C8e9jOfk2Lfer_mm2bDRP0A@mail.gmail.com>
 <Y8bMBZFqVP+EFzA8@redhat.com>
 <CANCZdfrg+S-EsjzcJe78aWr3pBaESv1+MUkLa-H6i=o-S0LaqQ@mail.gmail.com>
 <Y8bYI4RgV4F5b1ht@redhat.com>
In-Reply-To: <Y8bYI4RgV4F5b1ht@redhat.com>
From: Stefan Hajnoczi <stefanha@gmail.com>
Date: Tue, 17 Jan 2023 15:43:33 -0500
Message-ID: <CAJSP0QUedwNbm1cXdU90TSgCmdiV4=Fi0THXg7u6yVhDegtQEA@mail.gmail.com>
Subject: Re: [PATCH 2/3] bsd-user/mmap: use TSA_NO_TSA to suppress clang TSA
 warnings
To: Kevin Wolf <kwolf@redhat.com>
Cc: Warner Losh <imp@bsdimp.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>, qemu-devel@nongnu.org, 
 Kyle Evans <kevans@freebsd.org>, Stefan Hajnoczi <stefanha@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b32;
 envelope-from=stefanha@gmail.com; helo=mail-yb1-xb32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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

On Tue, 17 Jan 2023 at 12:17, Kevin Wolf <kwolf@redhat.com> wrote:
>
> Am 17.01.2023 um 17:43 hat Warner Losh geschrieben:
> > On Tue, Jan 17, 2023 at 9:25 AM Kevin Wolf <kwolf@redhat.com> wrote:
> >
> > > Am 17.01.2023 um 17:16 hat Warner Losh geschrieben:
> > > > On Tue, Jan 17, 2023 at 6:52 AM Emanuele Giuseppe Esposito <
> > > > eesposit@redhat.com> wrote:
> > > >
> > > > > QEMU does not compile when enabling clang's thread safety analysis
> > > > > (TSA),
> > > > > because some functions create wrappers for pthread mutexes but do
> > > > > not use any TSA macro. Therefore the compiler fails.
> > > > >
> > > > > In order to make the compiler happy and avoid adding all the
> > > > > necessary macros to all callers (lock functions should use
> > > > > TSA_ACQUIRE, while unlock TSA_RELEASE, and this applies to allusers of
> > > > > pthread_mutex_lock/pthread_mutex_unlock),
> > > > > simply use TSA_NO_TSA to supppress such warnings.
> > > >
> > > > I'm not sure I understand this quite right. Maybe a clarifying question
> > > > will help me understand: Why is this needed for bsd-user but not
> > > > linux-user? How are they different here?
> > >
> > > FreeBSD's pthread headers include TSA annotations for some functions
> > > that force us to do something about them (for now: suppress the warnings
> > > in their callers) before we can enable -Wthread-safety for the purposes
> > > where we really want it. Without this, calling functions like
> > > pthread_mutex_lock() would cause compiler errors.
> > >
> > > glibc's headers don't contain such annotations, so the same is not
> > > necessary on Linux
> > >
> >
> > Thanks Kevin. With that explanation, these patches and their explanation
> > make perfect sense now. Often when there's a patch to bsd-user but not
> > linux-user, it's because bsd-user needs to do more in some way (which I try
> > to keep up on).
> >
> > In this case, it's because FreeBSD's libc is a bit ahead of the curve. So I
> > understand why it's needed, and what I need to do next (though I think that
> > I may have to wait for the rest of qemu to be annotated)...
>
> I assume that the bsd-user part is actually sufficiently independent
> that you could do proper annotations there if you want.
>
> However, be aware that TSA has some serious limitations with C, so you
> can't express certain things, and it isn't as strict as it could be (in
> particular, function pointers bypass it). As long as you have global
> locks (as opposed to locks in structs), it kind of works, though.
> Certainly better than nothing.

What are the limitations on locks in structs (a common case)?

Stefan

