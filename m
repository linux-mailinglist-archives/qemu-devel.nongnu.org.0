Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C48EB68EA38
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Feb 2023 09:54:36 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pPgD4-0004UH-6q; Wed, 08 Feb 2023 03:53:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pPgCt-0004Tx-IQ; Wed, 08 Feb 2023 03:53:35 -0500
Received: from zuban.uni-paderborn.de ([2001:638:502:c003::17])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbastian@mail.uni-paderborn.de>)
 id 1pPgCr-0004ZK-Ld; Wed, 08 Feb 2023 03:53:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=mail.uni-paderborn.de; s=20170601; h=In-Reply-To:Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
 Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HkpMQQEfWCal40QkmDe9JyS7s8FezQX23s7696YGwFs=; b=cZL3B82m/A/nPioEBs6ZYzy739
 GCG+1OJmGseSNML7b9KycCxvqO9vKlW3eMWmYJCTC5X+7fbJ17whG92rADsW7KHbSC/ZA0Cx6cbNh
 o7tRbK06MXEiq3XPA7j+QDfApZzw5xqG+Krd70rHUYn/83uIxwBipFW3ngMNIrHni0+w=;
Date: Wed, 8 Feb 2023 09:53:07 +0100
From: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Thomas Huth <thuth@redhat.com>,
 Matheus Tavares Bernardino <quic_mathbern@quicinc.com>,
 qemu-devel@nongnu.org, anjo@rev.ng, tsimpson@quicinc.com,
 bcain@quicinc.com, quic_acaggian@quicinc.com,
 Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, QEMU Trivial <qemu-trivial@nongnu.org>
Subject: Re: [PATCH] Hexagon (meson.build): define min bison version
Message-ID: <20230208085307.xigxhuca67gl3ag4@schnipp-desktop>
References: <a6763f9f7b89ea310ab86f9a2b311a05254a1acd.1675779233.git.quic_mathbern@quicinc.com>
 <53dd2acc-0eb7-5e49-e803-2625f0841880@linaro.org>
 <0c85ac6c-0787-ba6f-3e19-5dbbc1619fac@redhat.com>
 <2d3719ee-9144-b9bf-91c2-c3997305f5ba@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2d3719ee-9144-b9bf-91c2-c3997305f5ba@linaro.org>
X-IMT-Source: Extern
X-IMT-Spam-Score: 0.0 ()
X-Sophos-SenderHistory: ip=84.154.177.181, fs=777544, da=163455460, mc=10, sc=0,
 hc=10, sp=0, fso=777544, re=0, sd=0, hd=0
X-PMX-Version: 6.4.9.2830568, Antispam-Engine: 2.7.2.2107409,
 Antispam-Data: 2023.2.8.84216, AntiVirus-Engine: 5.96.0,
 AntiVirus-Data: 2023.1.24.5960001
X-IMT-Authenticated-Sender: uid=kbastian,ou=People,o=upb,c=de
Received-SPF: pass client-ip=2001:638:502:c003::17;
 envelope-from=kbastian@mail.uni-paderborn.de; helo=zuban.uni-paderborn.de
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, RCVD_IN_DNSWL_MED=-2.3,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi Phil,

On Tue, Feb 07, 2023 at 05:11:10PM +0100, Philippe Mathieu-Daudé wrote:
> +Bastian
> 
> On 7/2/23 16:08, Thomas Huth wrote:
> > On 07/02/2023 15.54, Philippe Mathieu-Daudé wrote:
> > > Cc'ing Paolo/Daniel/Thomas
> > > 
> > > On 7/2/23 15:52, Matheus Tavares Bernardino wrote:
> > > > Hexagon's idef-parser machinery uses some bison features that are not
> > > > available at older versions. The most preeminent example (as it can
> > > > be used as a sentinel) is "%define parse.error verbose". This was
> > > > introduced in version 3.0 of the tool, which is able to compile
> > > > qemu-hexagon just fine. However, compilation fails with the previous
> > > > minor bison release, v2.7. So let's assert the minimum version at
> > > > meson.build to give a more comprehensive error message for those trying
> > > > to compile QEMU.
> > > > 
> > > > [1]: https://www.gnu.org/software/bison/manual/html_node/_0025define-Summary.html#index-_0025define-parse_002eerror
> > > > 
> > > > Signed-off-by: Matheus Tavares Bernardino <quic_mathbern@quicinc.com>
> > > > ---
> > > >   target/hexagon/meson.build | 2 +-
> > > >   1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/target/hexagon/meson.build b/target/hexagon/meson.build
> > > > index c9d31d095c..42b03c81e6 100644
> > > > --- a/target/hexagon/meson.build
> > > > +++ b/target/hexagon/meson.build
> > > > @@ -183,7 +183,7 @@ if idef_parser_enabled and
> > > > 'hexagon-linux-user' in target_dirs
> > > >       )
> > > >       bison = generator(
> > > > -        find_program('bison'),
> > > > +        find_program('bison', version: '>=3.0'),
> > > >           output: ['@BASENAME@.tab.c', '@BASENAME@.tab.h'],
> > > >           arguments: ['@INPUT@', '--defines=@OUTPUT1@',
> > > > '--output=@OUTPUT0@']
> > > >       )
> > 
> > Looks reasonable, thus:
> > 
> > Reviewed-by: Thomas Huth <thuth@redhat.com>
> > 
> > Out of curiosity: Where did you encounter this problem? After having a
> > quick look at https://repology.org/project/bison/versions it seems to me
> > that all our supported OS distros should already ship bison 3.0 or
> > newer...
> 
> I suppose this fix the tricore container problem Peter reported last week:
> https://lore.kernel.org/qemu-devel/CAFEAcA-Vr8=br=9jGU1Tr=HTyH6o+S9H79oG=6BqZb8FSp+2Tw@mail.gmail.com/
> 
> https://gitlab.com/qemu-project/qemu/-/jobs/3710561054
> 
> #6 43.63 ldlex.l: In function 'yy_input':
> #6 43.63 ldlex.l:615:7: error: 'yy_current_buffer' undeclared (first
> use in this function); did you mean 'yy_create_buffer'?
> #6 43.63 {
> #6 43.63 ^
> #6 43.63 yy_create_buffer

Thanks, I think this would fix it. However, I want to include tricore-gcc/newlib to the
docker image and created a toolchain release for that, so that we don't have to
compile binutils/gcc/newlib ourself. So I don't think this is relevant for me
anymore.

Cheers,
Bastian

