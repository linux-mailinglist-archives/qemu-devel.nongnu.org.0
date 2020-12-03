Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DDDED2CCD54
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Dec 2020 04:30:32 +0100 (CET)
Received: from localhost ([::1]:36774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kkfKA-0003MI-IH
	for lists+qemu-devel@lfdr.de; Wed, 02 Dec 2020 22:30:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33006)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1kkfIy-0002o7-D6
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 22:29:16 -0500
Received: from mail.kernel.org ([198.145.29.99]:47406)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sstabellini@kernel.org>)
 id 1kkfIv-0002Yy-EL
 for qemu-devel@nongnu.org; Wed, 02 Dec 2020 22:29:15 -0500
Date: Wed, 2 Dec 2020 19:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1606966150;
 bh=HjLppqmlvx2JQ4XyT3VrHPxWzaQDSQ5kPAfaiIgb3p4=;
 h=From:To:cc:Subject:In-Reply-To:References:From;
 b=srkXrEg9PICpPNTXJeux9+lRsp9EkF8EJ6XqKoHYRlVS7letC76Xl6wcfTaDNGcvG
 XhK57XDddAN2ilvZPgpZaSDfj0YyAja+cQBgF8lNq6iDrsZeDm8H/Z5yyZMlfua5UN
 vH8e15IQnSbXepNgFws7Jev2a+1CPX9hjBOn3sgTgdOV5AaURXCSh5ygdpiwTmovMM
 /JsfjdPUSRmu6CmbbNIgdMGUHW9ocg+aVXNmRWvRNY4XxllBqxS+bIicCT28WG6Pv/
 0CYJpKJz7NdmUZeYg5JyM/HEU3TVVfP26EpVmFnS2WifVdCC9LpCVMzYr+oUm5p9YP
 iwYybhTE+Bf+A==
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-T480s
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Subject: Re: [PATCH v1 1/1] security-process: update process information
In-Reply-To: <20201202123418.GH2360260@redhat.com>
Message-ID: <alpine.DEB.2.21.2012021924520.30425@sstabellini-ThinkPad-T480s>
References: <20201130134907.348505-1-ppandit@redhat.com>
 <20201130134907.348505-2-ppandit@redhat.com>
 <20201202123418.GH2360260@redhat.com>
User-Agent: Alpine 2.21 (DEB 202 2017-01-01)
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-1574994644-1606966149=:30425"
Received-SPF: pass client-ip=198.145.29.99;
 envelope-from=sstabellini@kernel.org; helo=mail.kernel.org
X-Spam_score_int: -85
X-Spam_score: -8.6
X-Spam_bar: --------
X-Spam_report: (-8.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.495,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, Stefano Stabellini <sstabellini@kernel.org>,
 Petr Matousek <pmatouse@redhat.com>, Prasad J Pandit <pjp@fedoraproject.org>,
 "Michael S . Tsirkin" <mst@redhat.com>, Stefan Hajnoczi <stefanha@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 QEMU Developers <qemu-devel@nongnu.org>, P J P <ppandit@redhat.com>,
 Darren Kenny <darren.kenny@oracle.com>, Michael Roth <michael.roth@amd.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-1574994644-1606966149=:30425
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 2 Dec 2020, Daniel P. Berrangé wrote:
> On Mon, Nov 30, 2020 at 07:19:07PM +0530, P J P wrote:
> > From: Prasad J Pandit <pjp@fedoraproject.org>
> > 
> > We are about to introduce a qemu-security mailing list to report
> > and triage QEMU security issues.
> > 
> > Update the QEMU security process web page with new mailing list
> > and triage details.
> > 
> > Signed-off-by: Prasad J Pandit <pjp@fedoraproject.org>
> > ---
> >  contribute/security-process.md | 134 ++++++++++++++++++++-------------
> >  1 file changed, 80 insertions(+), 54 deletions(-)
> 
> > +* List members follow a **responsible disclosure** policy. Any non-public
> > +  information you share about security issues, is kept confidential within the
> > +  respective affiliated companies. Such information shall not be passed on to
> > +  any third parties, including Xen Security Project, without your prior
> > +  permission.
> 
> Why this explicit note about the Xen project ?  What if we decide to want
> a member of the Xen security team on the QEMU security mailing list so that
> we can collaborate on triage ?

Hi Daniel,

this is not an issue because the individual (probably me) of course
would not report anything to the Xen security team without prior
permission.

Also note that the Xen case is one of the easiest because the Xen
security policy gives full powers to the discoverer: the discoverer
chooses both when to disclose and to whom and the Xen security team will
abide.


> Perhaps
> 
>      Any non-public information you share about security issues, is kept
>      confidential between members of the QEMU security team, and a minimal
>      number of supporting staff in their affliated companies.  Information
>      will not be disclosed to other third party organizations/individuals
>      without prior permission from the reporter

Sounds good to me
--8323329-1574994644-1606966149=:30425--

