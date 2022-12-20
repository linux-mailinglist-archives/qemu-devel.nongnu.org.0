Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C0D35651B77
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Dec 2022 08:22:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p7WwS-0005ai-1U; Tue, 20 Dec 2022 02:21:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guoren@kernel.org>) id 1p7WwO-0005aT-Pf
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 02:21:32 -0500
Received: from dfw.source.kernel.org ([139.178.84.217])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <guoren@kernel.org>) id 1p7WwL-0005Kh-Ux
 for qemu-devel@nongnu.org; Tue, 20 Dec 2022 02:21:32 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4666A6120C
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 07:21:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB82FC433D2
 for <qemu-devel@nongnu.org>; Tue, 20 Dec 2022 07:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671520886;
 bh=r2Fkq1QKI9qe483mR1c+doJnNV1J91ebjpeFGZr6w0w=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=k7PhnwwXUZtZUWhcqjddbhZ62yRdOlho55nWIqeIRUiBfJXd8RqnndAbj/D1jeSQE
 2py9EsMuVeOciX4rdbQRYWdvjvmr/AT6IBqlbD4Y3yHsTKTjeFK9iHraSPADl/AXqT
 +7yBTzoYAxi71H2+k6+44UgYtit/Q/JyohMpKAkbnQ+srF1inJJJ6x7Y2mwqJIixpm
 ruNF3i00SWjJa0RhHoyhdVa3RfKa+9HP2OAcllsxVRuVTNfzPjAuLIG3xElnpLadMz
 0GDmldBGluguglHqx+Brj1FmYSmCseCC+TZX6wYUYDoFKO82fDuDlGnBVG2ABbDOo3
 ZTDqb/Z/QpzRw==
Received: by mail-ej1-f47.google.com with SMTP id t17so27161510eju.1
 for <qemu-devel@nongnu.org>; Mon, 19 Dec 2022 23:21:26 -0800 (PST)
X-Gm-Message-State: ANoB5pkJdxMvARU3OGntWFXT+l7ZXEhXZWcI1wHpSvyY83QyjNt6DThD
 PLHr+EkmGu/M0Zraxw6EMvQRE3qj2v4VBhAANGs=
X-Google-Smtp-Source: AA0mqf5o4bSMDDnshl3vdeDt0pPzFJM7xuRC8l27sBODZ4tWk51wvKVMp0NynAHn6d4dXD0RMO0mR/JAJ5IuFWoVhX8=
X-Received: by 2002:a17:906:a18c:b0:7ad:9629:fb96 with SMTP id
 s12-20020a170906a18c00b007ad9629fb96mr35247631ejy.751.1671520884942; Mon, 19
 Dec 2022 23:21:24 -0800 (PST)
MIME-Version: 1.0
References: <20221219121914.851488-1-alex.bennee@linaro.org>
 <20221219121914.851488-2-alex.bennee@linaro.org>
 <b674a0e9-28a7-76b6-d1a1-d34807a803de@linux.alibaba.com>
In-Reply-To: <b674a0e9-28a7-76b6-d1a1-d34807a803de@linux.alibaba.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 20 Dec 2022 15:21:13 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQLqPtSJ7TOrrUrTZuarAkPGuuT3Luchm65msr2WdhdMw@mail.gmail.com>
Message-ID: <CAJF2gTQLqPtSJ7TOrrUrTZuarAkPGuuT3Luchm65msr2WdhdMw@mail.gmail.com>
Subject: Re: [PATCH 01/11] contrib/gitdm: add C-Sky to the domain map
To: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org, Guo Ren <ren_guo@c-sky.com>, 
 Liu Zhiwei <zhiwei_liu@c-sky.com>, guo_ren@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=139.178.84.217; envelope-from=guoren@kernel.org;
 helo=dfw.source.kernel.org
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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

On Tue, Dec 20, 2022 at 9:13 AM LIU Zhiwei <zhiwei_liu@linux.alibaba.com> w=
rote:
>
> The c-sky domain mail is no longer being used for Guo Ren and me.
>
> C-SKY company and C-SKY arch is still existing, but its website domain
> has been moved to https://www.t-head.cn/.
Acked-by: Guo Ren <guoren@kernel.org>

>
> Otherwise,
>
> Reviewed-by: LIU Zhiwei <zhiwei_liu@linux.alibaba.com>
>
>
> Thanks,
> Zhiwei
>
> On 2022/12/19 20:19, Alex Benn=C3=A9e wrote:
> > Although the majority of the recent work has been done by LIU Zhiwei
> > it does appear to be a corporate effort.
> >
> > Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> > Cc: Guo Ren <ren_guo@c-sky.com>
> > Cc: Liu Zhiwei <zhiwei_liu@c-sky.com>
> > ---
> >   contrib/gitdm/domain-map | 1 +
> >   1 file changed, 1 insertion(+)
> >
> > diff --git a/contrib/gitdm/domain-map b/contrib/gitdm/domain-map
> > index 3727918641..6f3a24b399 100644
> > --- a/contrib/gitdm/domain-map
> > +++ b/contrib/gitdm/domain-map
> > @@ -7,6 +7,7 @@
> >   amd.com         AMD
> >   baidu.com       Baidu
> >   bytedance.com   ByteDance
> > +c-sky.com       C-Sky
> >   cmss.chinamobile.com China Mobile
> >   citrix.com      Citrix
> >   crudebyte.com   Crudebyte
>


--=20
Best Regards
 Guo Ren

