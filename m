Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E52D24A6A97
	for <lists+qemu-devel@lfdr.de>; Wed,  2 Feb 2022 04:42:20 +0100 (CET)
Received: from localhost ([::1]:52596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nF6XD-0007hd-GF
	for lists+qemu-devel@lfdr.de; Tue, 01 Feb 2022 22:42:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nF2LU-0002KH-OX
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 18:13:57 -0500
Received: from [2607:f8b0:4864:20::92f] (port=42930
 helo=mail-ua1-x92f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <wlosh@bsdimp.com>) id 1nF2LR-00029D-2D
 for qemu-devel@nongnu.org; Tue, 01 Feb 2022 18:13:56 -0500
Received: by mail-ua1-x92f.google.com with SMTP id e17so16005300uad.9
 for <qemu-devel@nongnu.org>; Tue, 01 Feb 2022 15:13:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bsdimp-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=C/A7bGhLf1xF7kX1AA03kJ5eZlFxneEhOsUjkty1Wa8=;
 b=x5SPwLsoqwT4Ty1TQOsgcSVCTOmthMigMEJIg1kSM+mjj8wQbJM4cN0MADSeXMTnBl
 Y7Rmw1NdxEGI5D7JJ68CG1HLUXL0rMCYA4YXoNjC1KrrK/2TQjN60rn+dDwbIRO99IJA
 5sEwrmKbeHWO6z1MSKHt29bsDGahGsYIBWzyGK4hizp3cWgEx+MTWYlngEunjTImZnkE
 t/MyjJuXkTl0oRbyI7OK7dLdFMDzvFo0+XDf1fAkhZ7w3msFASgBbe5RXv8m2HLeMcVe
 vj8n8wzIeVvMN1kq/rGnsw9S/s7+XKOd95Chs9GXspqtZR0G+dg1t/oXcCLCacHDFgCS
 PdjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=C/A7bGhLf1xF7kX1AA03kJ5eZlFxneEhOsUjkty1Wa8=;
 b=mVAaMYnPYAbFZXTnIoRPya8HezhS5p6Hm3wXeBbzKMNd4JNC+4dOT59jB53IXU2Sv/
 3YwCzaR4tJUg0oCg9r25bbU2EGIcwzV9GE8V1m9eN0clqi/yJgTVsBa523vpfhTaI0FE
 pogh4CHWMa7nJLve+rNSpeNKZzmuA2t0DfFmgZAfI7fdx2MZhTpjCgV6vg4IK7kYeqGG
 KNk5PidecCRNrzSM5PMQM2HkFwug4z3NJsIUb2caeXpnu2DfW6qXQjP31jnTRLfzzJ2+
 aCNJNYB3/YwQeW3Xc1fMWEQpreRNtO97aDttFk09EOiUxLiTIgYyxKxRgAZOXSkGi3aB
 ycUQ==
X-Gm-Message-State: AOAM532aprb2EwjYFosBiZU/3ejnrmvDeE87Gh0z8SmhJT7GBY9hPFyf
 2JwyslUt8IL0iMVjbgluEV9RHD6hvL03pMyCtEae7A==
X-Google-Smtp-Source: ABdhPJwLcf5c70tO22Vs+B0NZx31hUH7UbacNbBKANsBnW1/TMezH5qIcPsRY9BEKIjFkx5xDDBLfsv2YtmJVFw/MK8=
X-Received: by 2002:ab0:2042:: with SMTP id g2mr10861441ual.77.1643757213578; 
 Tue, 01 Feb 2022 15:13:33 -0800 (PST)
MIME-Version: 1.0
References: <20220201111455.52511-1-imp@bsdimp.com>
 <20220201111455.52511-4-imp@bsdimp.com>
 <CACNAnaF_-sicXeHC_+wU9AQ0u8NUq17HJXt2GvPcxZo2NC-4sg@mail.gmail.com>
In-Reply-To: <CACNAnaF_-sicXeHC_+wU9AQ0u8NUq17HJXt2GvPcxZo2NC-4sg@mail.gmail.com>
From: Warner Losh <imp@bsdimp.com>
Date: Tue, 1 Feb 2022 16:13:22 -0700
Message-ID: <CANCZdfojStaOoq0=HfRp2HxDUTZGF=0yP=TyBEp2M7JUfhDQ9A@mail.gmail.com>
Subject: Re: [PATCH 03/22] bsd-user/x86_64/target_arch_cpu.h: Remove openbsd
 syscall
To: Kyle Evans <kevans@freebsd.org>
Content-Type: multipart/alternative; boundary="000000000000d0067605d6fd0ca5"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::92f
 (failed)
Received-SPF: none client-ip=2607:f8b0:4864:20::92f;
 envelope-from=wlosh@bsdimp.com; helo=mail-ua1-x92f.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Gleb Popov <arrowd@freebsd.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Konrad Witaszczyk <def@freebsd.org>,
 Jessica Clarke <jrtc27@freebsd.org>, Brad Smith <brad@comstyle.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000d0067605d6fd0ca5
Content-Type: text/plain; charset="UTF-8"

On Tue, Feb 1, 2022 at 9:23 AM Kyle Evans <kevans@freebsd.org> wrote:

> On Tue, Feb 1, 2022 at 5:14 AM Warner Losh <imp@bsdimp.com> wrote:
> >
> > This doesn't build on openbsd at the moment, and this could
> > should arguably be in bsd-user/*bsd/x86_64 somewhere. Until
> > we refactor to support OpenBSD/NetBSD again, drop it here.
> >
> > Signed-off-by: Warner Losh <imp@bsdimp.com>
> > ---
> >  bsd-user/x86_64/target_arch_cpu.h | 27 ++++++++-------------------
> >  1 file changed, 8 insertions(+), 19 deletions(-)
> >
>
> Reviewed-by: Kyle Evans <kevans@FreeBSD.org>
>
> As a general comment, I'd like to reach out to the others at some
> point and gauge interest/ability to participate, but I definitely
> agree that it would be better to drop !FreeBSD for now to simplify
> upcoming improvements to the common core. I'm not aware of any other
> forks that have tried to maintain bsd-user on their platforms.
>

I did this exercise about 2 years ago now. Neither NetBSD nor
OpenBSD communities were using bsd-user because of its super
primitive state. There was one person in NetBSD land who was
thinking about updating things, and I pointed them at the bsd-user
fork, but then heard nothing more from them.

I plan on generally dropping not FreeBSD, but in a way that's easy
to add back later. I plan on trying to have a reasonable split where
it already exists, but I don't plan on rewriting the current code too
much when FreeBSD specific things are noted during the review
process (like in the signals series of patches). I do commit in the
future to working with others that want to do the heavy lifting of
making this work with ${OTHER}BSD, should they show up. There
are a few more things in the bsd-user fork that I know are FreeBSD
specific that aren't in FreeBSD specific files, and I plan on upstreaming
them as is given the risk reshufflings represent. To that end, when
I do move things to freebsd/, I've also move the netbsd/openbsd code
to their respective directories as well, but since that code has been
decaying for some number of years now, it will be at best the least
imperfect starting point we can have.

I also had a bit of a plan to see if people want to update to
${OTHER}BSD once upstreaming is complete. I worry, a bit,
that trying to accomodate them during the upstreaming process
will slow down the upstreaming process. However, if someone
shows up with code, enthusiasm and a clue, I'm happy to
reevaluate.

Warner


> > diff --git a/bsd-user/x86_64/target_arch_cpu.h
> b/bsd-user/x86_64/target_arch_cpu.h
> > index 9dc52d5afc4..5be2f02416e 100644
> > --- a/bsd-user/x86_64/target_arch_cpu.h
> > +++ b/bsd-user/x86_64/target_arch_cpu.h
> > @@ -126,25 +126,14 @@ static inline void target_cpu_loop(CPUX86State
> *env)
> >          switch (trapnr) {
> >          case EXCP_SYSCALL:
> >              /* syscall from syscall instruction */
> > -            if (bsd_type == target_freebsd) {
> > -                env->regs[R_EAX] = do_freebsd_syscall(env,
> > -                                                      env->regs[R_EAX],
> > -                                                      env->regs[R_EDI],
> > -                                                      env->regs[R_ESI],
> > -                                                      env->regs[R_EDX],
> > -                                                      env->regs[R_ECX],
> > -                                                      env->regs[8],
> > -                                                      env->regs[9], 0,
> 0);
> > -            } else { /* if (bsd_type == target_openbsd) */
> > -                env->regs[R_EAX] = do_openbsd_syscall(env,
> > -                                                      env->regs[R_EAX],
> > -                                                      env->regs[R_EDI],
> > -                                                      env->regs[R_ESI],
> > -                                                      env->regs[R_EDX],
> > -                                                      env->regs[10],
> > -                                                      env->regs[8],
> > -                                                      env->regs[9]);
> > -            }
> > +            env->regs[R_EAX] = do_freebsd_syscall(env,
> > +                                                  env->regs[R_EAX],
> > +                                                  env->regs[R_EDI],
> > +                                                  env->regs[R_ESI],
> > +                                                  env->regs[R_EDX],
> > +                                                  env->regs[R_ECX],
> > +                                                  env->regs[8],
> > +                                                  env->regs[9], 0, 0);
> >              env->eip = env->exception_next_eip;
> >              if (((abi_ulong)env->regs[R_EAX]) >= (abi_ulong)(-515)) {
> >                  env->regs[R_EAX] = -env->regs[R_EAX];
> > --
> > 2.33.1
> >
>

--000000000000d0067605d6fd0ca5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGJyPjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFR1ZSwgRmVi
IDEsIDIwMjIgYXQgOToyMyBBTSBLeWxlIEV2YW5zICZsdDs8YSBocmVmPSJtYWlsdG86a2V2YW5z
QGZyZWVic2Qub3JnIj5rZXZhbnNAZnJlZWJzZC5vcmc8L2E+Jmd0OyB3cm90ZTo8YnI+PC9kaXY+
PGJsb2NrcXVvdGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4
IDAuOGV4O2JvcmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVm
dDoxZXgiPk9uIFR1ZSwgRmViIDEsIDIwMjIgYXQgNToxNCBBTSBXYXJuZXIgTG9zaCAmbHQ7PGEg
aHJlZj0ibWFpbHRvOmltcEBic2RpbXAuY29tIiB0YXJnZXQ9Il9ibGFuayI+aW1wQGJzZGltcC5j
b208L2E+Jmd0OyB3cm90ZTo8YnI+DQomZ3Q7PGJyPg0KJmd0OyBUaGlzIGRvZXNuJiMzOTt0IGJ1
aWxkIG9uIG9wZW5ic2QgYXQgdGhlIG1vbWVudCwgYW5kIHRoaXMgY291bGQ8YnI+DQomZ3Q7IHNo
b3VsZCBhcmd1YWJseSBiZSBpbiBic2QtdXNlci8qYnNkL3g4Nl82NCBzb21ld2hlcmUuIFVudGls
PGJyPg0KJmd0OyB3ZSByZWZhY3RvciB0byBzdXBwb3J0IE9wZW5CU0QvTmV0QlNEIGFnYWluLCBk
cm9wIGl0IGhlcmUuPGJyPg0KJmd0Ozxicj4NCiZndDsgU2lnbmVkLW9mZi1ieTogV2FybmVyIExv
c2ggJmx0OzxhIGhyZWY9Im1haWx0bzppbXBAYnNkaW1wLmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmlt
cEBic2RpbXAuY29tPC9hPiZndDs8YnI+DQomZ3Q7IC0tLTxicj4NCiZndDvCoCBic2QtdXNlci94
ODZfNjQvdGFyZ2V0X2FyY2hfY3B1LmggfCAyNyArKysrKysrKy0tLS0tLS0tLS0tLS0tLS0tLS08
YnI+DQomZ3Q7wqAgMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgMTkgZGVsZXRpb25z
KC0pPGJyPg0KJmd0Ozxicj4NCjxicj4NClJldmlld2VkLWJ5OiBLeWxlIEV2YW5zICZsdDtrZXZh
bnNARnJlZUJTRC5vcmcmZ3Q7PGJyPg0KPGJyPg0KQXMgYSBnZW5lcmFsIGNvbW1lbnQsIEkmIzM5
O2QgbGlrZSB0byByZWFjaCBvdXQgdG8gdGhlIG90aGVycyBhdCBzb21lPGJyPg0KcG9pbnQgYW5k
IGdhdWdlIGludGVyZXN0L2FiaWxpdHkgdG8gcGFydGljaXBhdGUsIGJ1dCBJIGRlZmluaXRlbHk8
YnI+DQphZ3JlZSB0aGF0IGl0IHdvdWxkIGJlIGJldHRlciB0byBkcm9wICFGcmVlQlNEIGZvciBu
b3cgdG8gc2ltcGxpZnk8YnI+DQp1cGNvbWluZyBpbXByb3ZlbWVudHMgdG8gdGhlIGNvbW1vbiBj
b3JlLiBJJiMzOTttIG5vdCBhd2FyZSBvZiBhbnkgb3RoZXI8YnI+DQpmb3JrcyB0aGF0IGhhdmUg
dHJpZWQgdG8gbWFpbnRhaW4gYnNkLXVzZXIgb24gdGhlaXIgcGxhdGZvcm1zLjxicj48L2Jsb2Nr
cXVvdGU+PGRpdj48YnI+PC9kaXY+PGRpdj5JIGRpZCB0aGlzIGV4ZXJjaXNlwqBhYm91dCAyIHll
YXJzIGFnbyBub3cuIE5laXRoZXIgTmV0QlNEIG5vcjwvZGl2PjxkaXY+T3BlbkJTRCBjb21tdW5p
dGllcyB3ZXJlIHVzaW5nIGJzZC11c2VyIGJlY2F1c2Ugb2YgaXRzIHN1cGVyPC9kaXY+PGRpdj5w
cmltaXRpdmUgc3RhdGUuIFRoZXJlIHdhcyBvbmUgcGVyc29uIGluIE5ldEJTRCBsYW5kIHdobyB3
YXM8L2Rpdj48ZGl2PnRoaW5raW5nIGFib3V0IHVwZGF0aW5nIHRoaW5ncywgYW5kIEkgcG9pbnRl
ZCB0aGVtIGF0IHRoZSBic2QtdXNlcjwvZGl2PjxkaXY+Zm9yaywgYnV0IHRoZW4gaGVhcmQgbm90
aGluZyBtb3JlIGZyb20gdGhlbS48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PkkgcGxhbiBvbiBn
ZW5lcmFsbHkgZHJvcHBpbmcgbm90IEZyZWVCU0QsIGJ1dCBpbiBhIHdheSB0aGF0JiMzOTtzIGVh
c3k8L2Rpdj48ZGl2PnRvIGFkZCBiYWNrIGxhdGVyLiBJIHBsYW4gb24gdHJ5aW5nIHRvIGhhdmUg
YSByZWFzb25hYmxlIHNwbGl0IHdoZXJlPC9kaXY+PGRpdj5pdCBhbHJlYWR5IGV4aXN0cywgYnV0
IEkgZG9uJiMzOTt0IHBsYW4gb24gcmV3cml0aW5nIHRoZSBjdXJyZW50IGNvZGUgdG9vPC9kaXY+
PGRpdj5tdWNoIHdoZW4gRnJlZUJTRCBzcGVjaWZpYyB0aGluZ3MgYXJlIG5vdGVkIGR1cmluZyB0
aGUgcmV2aWV3PC9kaXY+PGRpdj5wcm9jZXNzIChsaWtlIGluIHRoZSBzaWduYWxzIHNlcmllcyBv
ZiBwYXRjaGVzKS4gSSBkbyBjb21taXQgaW4gdGhlPC9kaXY+PGRpdj5mdXR1cmUgdG8gd29ya2lu
ZyB3aXRoIG90aGVycyB0aGF0IHdhbnQgdG8gZG8gdGhlIGhlYXZ5IGxpZnRpbmcgb2Y8L2Rpdj48
ZGl2Pm1ha2luZyB0aGlzIHdvcmsgd2l0aCAke09USEVSfUJTRCwgc2hvdWxkIHRoZXkgc2hvdyB1
cC4gVGhlcmU8L2Rpdj48ZGl2PmFyZSBhIGZldyBtb3JlIHRoaW5ncyBpbiB0aGUgYnNkLXVzZXIg
Zm9yayB0aGF0IEkga25vdyBhcmUgRnJlZUJTRDwvZGl2PjxkaXY+c3BlY2lmaWMgdGhhdCBhcmVu
JiMzOTt0IGluIEZyZWVCU0Qgc3BlY2lmaWMgZmlsZXMsIGFuZCBJIHBsYW4gb24gdXBzdHJlYW1p
bmc8L2Rpdj48ZGl2PnRoZW0gYXMgaXMgZ2l2ZW4gdGhlIHJpc2sgcmVzaHVmZmxpbmdzIHJlcHJl
c2VudC4gVG8gdGhhdCBlbmQsIHdoZW48L2Rpdj48ZGl2PkkgZG8gbW92ZSB0aGluZ3MgdG8gZnJl
ZWJzZC8sIEkmIzM5O3ZlIGFsc28gbW92ZSB0aGUgbmV0YnNkL29wZW5ic2QgY29kZTwvZGl2Pjxk
aXY+dG8gdGhlaXIgcmVzcGVjdGl2ZcKgZGlyZWN0b3JpZXMgYXMgd2VsbCwgYnV0IHNpbmNlIHRo
YXQgY29kZSBoYXMgYmVlbjwvZGl2PjxkaXY+ZGVjYXlpbmcgZm9yIHNvbWUgbnVtYmVyIG9mIHll
YXJzIG5vdywgaXQgd2lsbCBiZSBhdCBiZXN0IHRoZSBsZWFzdDwvZGl2PjxkaXY+aW1wZXJmZWN0
IHN0YXJ0aW5nIHBvaW50IHdlIGNhbiBoYXZlLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+SSBh
bHNvIGhhZCBhIGJpdCBvZiBhIHBsYW4gdG8gc2VlIGlmIHBlb3BsZSB3YW50IHRvIHVwZGF0ZSB0
bzwvZGl2PjxkaXY+JHtPVEhFUn1CU0Qgb25jZSB1cHN0cmVhbWluZyBpcyBjb21wbGV0ZS4gSSB3
b3JyeSwgYSBiaXQsPC9kaXY+PGRpdj50aGF0IHRyeWluZyB0byBhY2NvbW9kYXRlIHRoZW0gZHVy
aW5nIHRoZSB1cHN0cmVhbWluZyBwcm9jZXNzPC9kaXY+PGRpdj53aWxsIHNsb3cgZG93biB0aGUg
dXBzdHJlYW1pbmcgcHJvY2Vzcy4gSG93ZXZlciwgaWYgc29tZW9uZTwvZGl2PjxkaXY+c2hvd3Mg
dXAgd2l0aCBjb2RlLCBlbnRodXNpYXNtwqBhbmQgYSBjbHVlLCBJJiMzOTttIGhhcHB5IHRvPC9k
aXY+PGRpdj5yZWV2YWx1YXRlLjwvZGl2PjxkaXY+PGJyPjwvZGl2PjxkaXY+V2FybmVyPC9kaXY+
PGRpdj7CoDwvZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdp
bjowcHggMHB4IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0
KTtwYWRkaW5nLWxlZnQ6MWV4Ij4NCiZndDsgZGlmZiAtLWdpdCBhL2JzZC11c2VyL3g4Nl82NC90
YXJnZXRfYXJjaF9jcHUuaCBiL2JzZC11c2VyL3g4Nl82NC90YXJnZXRfYXJjaF9jcHUuaDxicj4N
CiZndDsgaW5kZXggOWRjNTJkNWFmYzQuLjViZTJmMDI0MTZlIDEwMDY0NDxicj4NCiZndDsgLS0t
IGEvYnNkLXVzZXIveDg2XzY0L3RhcmdldF9hcmNoX2NwdS5oPGJyPg0KJmd0OyArKysgYi9ic2Qt
dXNlci94ODZfNjQvdGFyZ2V0X2FyY2hfY3B1Lmg8YnI+DQomZ3Q7IEBAIC0xMjYsMjUgKzEyNiwx
NCBAQCBzdGF0aWMgaW5saW5lIHZvaWQgdGFyZ2V0X2NwdV9sb29wKENQVVg4NlN0YXRlICplbnYp
PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIHN3aXRjaCAodHJhcG5yKSB7PGJyPg0KJmd0O8KgIMKg
IMKgIMKgIMKgIGNhc2UgRVhDUF9TWVNDQUxMOjxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDC
oCAvKiBzeXNjYWxsIGZyb20gc3lzY2FsbCBpbnN0cnVjdGlvbiAqLzxicj4NCiZndDsgLcKgIMKg
IMKgIMKgIMKgIMKgIGlmIChic2RfdHlwZSA9PSB0YXJnZXRfZnJlZWJzZCkgezxicj4NCiZndDsg
LcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGVudi0mZ3Q7cmVnc1tSX0VBWF0gPSBkb19mcmVlYnNk
X3N5c2NhbGwoZW52LDxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGVudi0mZ3Q7
cmVnc1tSX0VBWF0sPGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZW52LSZndDty
ZWdzW1JfRURJXSw8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBlbnYtJmd0O3Jl
Z3NbUl9FU0ldLDxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGVudi0mZ3Q7cmVn
c1tSX0VEWF0sPGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZW52LSZndDtyZWdz
W1JfRUNYXSw8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBlbnYtJmd0O3JlZ3Nb
OF0sPGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZW52LSZndDtyZWdzWzldLCAw
LCAwKTs8YnI+DQomZ3Q7IC3CoCDCoCDCoCDCoCDCoCDCoCB9IGVsc2UgeyAvKiBpZiAoYnNkX3R5
cGUgPT0gdGFyZ2V0X29wZW5ic2QpICovPGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgZW52LSZndDtyZWdzW1JfRUFYXSA9IGRvX29wZW5ic2Rfc3lzY2FsbChlbnYsPGJyPg0KJmd0
OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZW52LSZndDtyZWdzW1JfRUFYXSw8YnI+DQomZ3Q7
IC3CoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBlbnYtJmd0O3JlZ3NbUl9FREldLDxicj4NCiZndDsg
LcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGVudi0mZ3Q7cmVnc1tSX0VTSV0sPGJyPg0KJmd0OyAt
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZW52LSZndDtyZWdzW1JfRURYXSw8YnI+DQomZ3Q7IC3C
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBlbnYtJmd0O3JlZ3NbMTBdLDxicj4NCiZndDsgLcKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIGVudi0mZ3Q7cmVnc1s4XSw8YnI+DQomZ3Q7IC3CoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBlbnYtJmd0O3JlZ3NbOV0pOzxicj4NCiZndDsgLcKgIMKgIMKgIMKgIMKg
IMKgIH08YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCBlbnYtJmd0O3JlZ3NbUl9FQVhdID0g
ZG9fZnJlZWJzZF9zeXNjYWxsKGVudiw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBlbnYt
Jmd0O3JlZ3NbUl9FQVhdLDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGVudi0mZ3Q7cmVn
c1tSX0VESV0sPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgZW52LSZndDtyZWdzW1JfRVNJ
XSw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBlbnYtJmd0O3JlZ3NbUl9FRFhdLDxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIGVudi0mZ3Q7cmVnc1tSX0VDWF0sPGJyPg0KJmd0OyAr
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgZW52LSZndDtyZWdzWzhdLDxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIGVudi0mZ3Q7cmVnc1s5XSwgMCwgMCk7PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgIGVudi0mZ3Q7ZWlwID0gZW52LSZndDtleGNlcHRpb25fbmV4dF9laXA7PGJyPg0KJmd0O8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIGlmICgoKGFiaV91bG9uZyllbnYtJmd0O3JlZ3NbUl9FQVhdKSAm
Z3Q7PSAoYWJpX3Vsb25nKSgtNTE1KSkgezxicj4NCiZndDvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCBlbnYtJmd0O3JlZ3NbUl9FQVhdID0gLWVudi0mZ3Q7cmVnc1tSX0VBWF07PGJyPg0KJmd0
OyAtLTxicj4NCiZndDsgMi4zMy4xPGJyPg0KJmd0Ozxicj4NCjwvYmxvY2txdW90ZT48L2Rpdj48
L2Rpdj4NCg==
--000000000000d0067605d6fd0ca5--

