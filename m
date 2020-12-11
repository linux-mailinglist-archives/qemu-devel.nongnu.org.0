Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCB12D7A7C
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 17:05:31 +0100 (CET)
Received: from localhost ([::1]:54082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knkvC-0004Ip-Oj
	for lists+qemu-devel@lfdr.de; Fri, 11 Dec 2020 11:05:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knksc-0002ol-CS
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:02:52 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534]:39553)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1knksZ-0002hs-AL
 for qemu-devel@nongnu.org; Fri, 11 Dec 2020 11:02:50 -0500
Received: by mail-ed1-x534.google.com with SMTP id c7so9874180edv.6
 for <qemu-devel@nongnu.org>; Fri, 11 Dec 2020 08:02:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YLVx3TkBhrNCns84cwA9GQwdi175gnvJGLP4C2nf8Uo=;
 b=sBBmJH+ahVDvToPjf4XgBDKGBv11A5sL4sk1KA4iZ+2JIfrFSxLe9+BeKJXo5ij4OW
 O1njwx1EBqZcw4TGZkrfoCUSCBsQ+acpDWxQYvWgUpQF8/vZHfJ7Twu+1iyNQ5wsCCWL
 XNl1MicjSXTFzjriKRP/4QJx4eq838VPyiFbD3jeaxfLUH2BNGu9Ymeqa8CREMKkEZKP
 DnOqizqLXJ33bRukgBR5FSt21dQ/ofmSpl4dxktkFZAK5PIjR4lr2I/N48zOcrjPg3aZ
 RdKe70k4CrvOXo2QqiUm/4VB0TjA5+w80xtrUH4HFLkRxfRi984K3Z9LWb2R63ppj8ua
 fCNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YLVx3TkBhrNCns84cwA9GQwdi175gnvJGLP4C2nf8Uo=;
 b=mxxaBWIu0gFJTxBMV44Ok8K9HmrH5XoCxVTimRO1zqlPhu/JXOeam9s2K8Mm60lpti
 W7yYB6DWlPdoygzcSr029ttuBy2JD7q24/g+G8yTlRRAWyTRtj7Nz55NNi/5tJI6hz7T
 o8/RpB0ybeDSGLxiBaBRHPjSmiVI6DKieDvowhZEE+C6hBNpmwlMpkzK0qdqt08xpqAD
 X8NXKiLczGQVi8sB3F2TD/H/VBz1sSCKJ2h9CL4rScn2J2nFU8UH9z1x2F6AVMdywOVa
 HkHp9AcRWhpM9TEtz2SQ+kWUUIMHDvJvBP5yMtrfucZ9ZqPXRJ6WHuNeSxPsH5+5DKot
 vR8A==
X-Gm-Message-State: AOAM533PlX6OKYN5rNYNMSWCts3CrYAtPKuKEabSIQ0vxgoFxqndcme4
 QIWRtIAmMzQYQLPnZZ5clixa43kbD+MoL36vhZCI5g==
X-Google-Smtp-Source: ABdhPJyeZc244On0jPbil3yFraqvuu7vopDrmRqTuDKfX5Yq94oaWaL8GGDduRra3pp0cFCPdNGKCuYmZjE8xkXHx4c=
X-Received: by 2002:aa7:c388:: with SMTP id k8mr12350724edq.36.1607702565516; 
 Fri, 11 Dec 2020 08:02:45 -0800 (PST)
MIME-Version: 1.0
References: <20201210203549.379-1-peter.maydell@linaro.org>
 <fd4a1215-5337-4984-d469-369a26d6a5c2@redhat.com>
In-Reply-To: <fd4a1215-5337-4984-d469-369a26d6a5c2@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Dec 2020 16:02:34 +0000
Message-ID: <CAFEAcA9xAtcMPqP_3yfAZM4BevkeZaQobwdD9mTS_Ctsmr2EiA@mail.gmail.com>
Subject: Re: [PATCH] docs: Build and install all the docs in a single manual
To: Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri, 11 Dec 2020 at 15:48, Paolo Bonzini <pbonzini@redhat.com> wrote:
>
> On 10/12/20 21:35, Peter Maydell wrote:
> > When we first converted our documentation to Sphinx, we split it into
> > multiple manuals (system, interop, tools, etc), which are all built
> > separately.  The primary driver for this was wanting to be able to
> > avoid shipping the 'devel' manual to end-users.  However, this is
> > working against the grain of the way Sphinx wants to be used and
> > causes some annoyances:
> >   * Cross-references between documents become much harder or
> >     possibly impossible
> >   * There is no single index to the whole documentation
> >   * Within one manual there's no links or table-of-contents info
> >     that lets you easily navigate to the others
> >   * The devel manual doesn't get published on the QEMU website
> >     (it would be nice to able to refer to it there)
> >
> > Merely hiding our developer documentation from end users seems like
> > it's not enough benefit for these costs.  Combine all the
> > documentation into a single manual (the same way that the readthedocs
> > site builds it) and install the whole thing.  The previous manual
> > divisions remain as the new top level sections in the manual.
> >
> >   * The per-manual conf.py files are no longer needed
> >   * The man_pages[] specifications previously in each per-manual
> >     conf.py move to the top level conf.py
> >   * docs/meson.build logic is simplified as we now only need to run
> >     Sphinx once for the HTML and then once for the manpages5B
> >   * The old index.html.in that produced the top-level page with
> >     links to each manual is no longer needed
> >
> > Unfortunately this means that we now have to build the HTML
> > documentation into docs/manual in the build tree rather than directly
> > into docs/; otherwise it is too awkward to ensure we install only the
> > built manual and not also the dependency info, stamp file, etc.  The
> > manual still ends up in the same place in the final installed
> > directory, but anybody who was consulting documentation from within
> > the build tree will have to adjust where they're looking.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Sounds good!
>
> I thought I had sent my reviewed-by in November.  If I didn't...

I think you just said it was a good idea and that the meson
stuff didn't have any obvious errors :-)

>
>
> >     man_pages = {
> > -    'interop' : {
> >           'qemu-ga.8': (have_tools ? 'man8' : ''),
> >           'qemu-ga-ref.7': 'man7',
> >           'qemu-qmp-ref.7': 'man7',
> > -    },
> > -    'tools': {
> >           'qemu-img.1': (have_tools ? 'man1' : ''),
> >           'qemu-nbd.8': (have_tools ? 'man8' : ''),
> >           'qemu-pr-helper.8': (have_tools ? 'man8' : ''),
> >           'qemu-trace-stap.1': (config_host.has_key('CONFIG_TRACE_SYSTEMTAP') ? 'man1' : ''),
> >           'virtfs-proxy-helper.1': (have_virtfs_proxy_helper ? 'man1' : ''),
> >           'virtiofsd.1': (have_virtiofsd ? 'man1' : ''),
> > -    },
> > -    'system': {
> >           'qemu.1': 'man1',
> >           'qemu-block-drivers.7': 'man7',
> >           'qemu-cpu-models.7': 'man7'
> > -    },
> >     }
>
> ... perhaps my only suggestion is to sort these by section and
> secondarily by name.  But no need to repost---or even to do it, in fact.

I guess we could as a followup. For this patch I think it's helpful
for review that it's clear that nothing changes except the removal
of the intermediate level of data structure.

> Reviewed-by: Paolo Bonzini <pbonzini@redhat.com>

Thanks!

-- PMM

