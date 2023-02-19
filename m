Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B9D69C003
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Feb 2023 12:10:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pThYo-0001y8-Ud; Sun, 19 Feb 2023 06:08:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reinoud@13thmonkey.org>)
 id 1pThYm-0001xu-40
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 06:08:48 -0500
Received: from 77-173-18-117.fixed.kpn.net ([77.173.18.117]
 helo=dropje.13thmonkey.org) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <reinoud@13thmonkey.org>) id 1pThYk-0001Tb-At
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 06:08:47 -0500
Received: by dropje.13thmonkey.org (Postfix, from userid 103)
 id 659B9C1F137; Sun, 19 Feb 2023 12:07:42 +0100 (CET)
Date: Sun, 19 Feb 2023 12:07:42 +0100
From: Reinoud Zandijk <reinoud@NetBSD.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: Reinoud Zandijk <reinoud@NetBSD.org>,
 Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, libvir-list@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>, Daniel Berrange <berrange@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>,
 Stefan Weil <sw@weilnetz.de>
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
Message-ID: <Y/IC/hvPnF5+paF8@dropje.13thmonkey.org>
References: <20230130114428.1297295-1-thuth@redhat.com>
 <87a61cbmti.fsf@pond.sub.org>
 <Y++mEtUSmWYPTkPN@gorilla.13thmonkey.org>
 <ace645e6-ace0-6ecf-baef-f5ae1700fbf4@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ace645e6-ace0-6ecf-baef-f5ae1700fbf4@linaro.org>
Received-SPF: pass client-ip=77.173.18.117;
 envelope-from=reinoud@13thmonkey.org; helo=dropje.13thmonkey.org
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 TVD_RCVD_IP=0.001 autolearn=no autolearn_force=no
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

On Fri, Feb 17, 2023 at 08:22:43AM -1000, Richard Henderson wrote:
> On 2/17/23 06:06, Reinoud Zandijk wrote:
> > On Fri, Feb 17, 2023 at 11:36:41AM +0100, Markus Armbruster wrote:
> > > I feel the discussion petered out without a conclusion.
> > > 
> > > I don't think letting the status quo win by inertia is a good outcome
> > > here.
> > > 
> > > Which 32-bit hosts are still useful, and why?
> > 
> > NetBSD runs on a bunch of 32 bit-only hosts (sparc32, ppc32, armv7, vax,
> > mips32 etc.) that all run Qemu fine. They are all actively maintained and
> > released as part of the main releases.
> 
> Are you sure about that?  TCG doesn't support sparc32 or vax.
> I suppose you could be using TCI, but I can't even imagine how
> slow that would be on vax.

I've asked around amongst active developers and they steted that they had used
it in the past but not ianymore recently. I doubt normal users would use them
often though since most hardware is 64 bit capable anyways.

Reinoud


