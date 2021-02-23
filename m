Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61174322A75
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Feb 2021 13:26:30 +0100 (CET)
Received: from localhost ([::1]:46950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lEWlp-0003w3-DJ
	for lists+qemu-devel@lfdr.de; Tue, 23 Feb 2021 07:26:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lEWkr-0003OM-K0; Tue, 23 Feb 2021 07:25:29 -0500
Received: from kylie.crudebyte.com ([5.189.157.229]:36921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1lEWko-0005w3-TV; Tue, 23 Feb 2021 07:25:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=KlIv50r98oKKKsTVCVEw7CfM8OA3Cr4XlAKZ5WYKFWs=; b=awYen3YLx2Rn56dWMV3KAOOpW+
 WsI742/k7Y4IkJJMeOnlAVsm0PCfzvWWdU97rGZrNBbdD8B0m6WGjo8WNss1fspaE53qhyXshdxDj
 +c1GbCUEi5pnJwLrnmY4GgBOdxjB0ZaWLYYgXAYdf9PloVaIXirfhBBAqgiXhVIw/8QuEScCaD+wO
 X7MagLhCMHYvQgaK1bFBnv/YHachWvuYv4VWnlLIhIrTC1dwPzvkWzd5ej/H3g8wdGU69dWOl+3PD
 fTn66IQFmJZa7GqTI67Cj9u6rB4ru8W5ewOZa7M3qGl7pCIx0e9sQHCQINsS7/ZjzF8GhVBs86XSC
 IlQu2k88bZE5kQnQ1Lma+mC5Rh6PAoZ7Wo1dWThT6TiYs1mOTbCkZCK7c7uG4PK2rivnqERoQTNHU
 ZPdAfD0nDFj7l+bHBbjWd4mbbN//JZ7bdr7D9oi5n/cgZDnMW7oBRw/gXMN5+TvjF7MgPoqlvhaTV
 DEUtVu9pMJuCr7+jiTsddqEu+XP7hN71cvGJ4LsIX2z3QqBGzQnUzbu7WjTLQcyG6H+RqKPXGcs9k
 2+jMF4u1/B+d9ovLQUt+MJnB4MVcx8R74oXVQVb72YZY2y/j6DlmMI3vy1C3y2RRNVLNabc+20zFx
 7RVqD20RkWESdYhq92H9Yh5sjKxK/vWub/hCKK4dk=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Greg Kurz <groug@kaod.org>,
 Thomas Huth <thuth@redhat.com>, Alexey Kardashevskiy <aik@ozlabs.ru>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 David Gibson <david@gibson.dropbear.id.au>
Subject: Re: who's using the ozlabs patchwork install for QEMU patches ?
Date: Tue, 23 Feb 2021 13:24:30 +0100
Message-ID: <2915273.dLz0rCdnKo@silver>
In-Reply-To: <CAFEAcA9mgE5t5KpkGac7ABaVy3gK11PbpNMfO3p-gcVhSN51tQ@mail.gmail.com>
References: <CAFEAcA8h8QVoGsfJCLTYnbk3yzmrtphsWdSsDUrgQkB=vGh3zw@mail.gmail.com>
 <20210223123943.06d23a56@bahia.lan>
 <CAFEAcA9mgE5t5KpkGac7ABaVy3gK11PbpNMfO3p-gcVhSN51tQ@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Dienstag, 23. Februar 2021 12:54:47 CET Peter Maydell wrote:
> On Tue, 23 Feb 2021 at 11:39, Greg Kurz <groug@kaod.org> wrote:
> > On Tue, 23 Feb 2021 11:09:05 +0000
> > 
> > Peter Maydell <peter.maydell@linaro.org> wrote:
> > > On Mon, 22 Feb 2021 at 14:43, Greg Kurz <groug@kaod.org> wrote:
> > > > My understanding is that users must be "maintainer" to edit other's
> > > > patches. Only three 'maintainers' are currently listed at ozlabs for
> > > > QEMU:
> > > > 
> > > > https://patchwork.ozlabs.org/api/1.0/projects/14/
> > > > 
> > > > We had a discussion about that a few months back with Christian
> > > > Schoenebeck
> > > > (9pfs maintainer, Cc'd) who also uses patchworks. It turned out we
> > > > didn't
> > > > quite know how to go further because of lack of documentation, but I'd
> > > > be
> > > > glad to experiment the full patchwork experience if someone knows how
> > > > to
> > > > do it :-)
> > > 
> > > If people want to try that kind of thing out I'm happy to try
> > > to tweak their permissions on the patchwork instance.
> > 
> > Please do for me then. My name is groug :)
> 
> Hmm. Having looked through the UI and docs I can't figure
> out how to do that (or even if 'maintainer' permission is
> sufficient to add other maintainers; maybe one has to ask the
> patchwork instance admins to do that?). If you can tell me what
> I need to do to add you to the maintainer list for QEMU I'll do it :-)
> 
> -- PMM

We were looking into this last year, and from my (poor) understanding this is 
how it works:

https://lists.gnu.org/archive/html/qemu-devel/2020-09/msg02864.html

If somebody knows a more convenient/appropriate way, that would be 
appreciated.

Best regards,
Christian Schoenebeck



