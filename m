Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8DC769F493
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 13:31:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUoFZ-0002ph-7k; Wed, 22 Feb 2023 07:29:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reinoud@13thmonkey.org>)
 id 1pUoFW-0002pY-N5
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 07:29:30 -0500
Received: from 77-173-18-117.fixed.kpn.net ([77.173.18.117]
 helo=dropje.13thmonkey.org) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <reinoud@13thmonkey.org>) id 1pUoFU-0000P4-TO
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 07:29:30 -0500
Received: by dropje.13thmonkey.org (Postfix, from userid 103)
 id C779BC1F137; Wed, 22 Feb 2023 13:28:24 +0100 (CET)
Date: Wed, 22 Feb 2023 13:28:24 +0100
From: Reinoud Zandijk <reinoud@NetBSD.org>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 libvir-list@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>,
 Stefan Weil <sw@weilnetz.de>
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
Message-ID: <Y/YKaEgSxUa1Hsp0@dropje.13thmonkey.org>
References: <20230130114428.1297295-1-thuth@redhat.com>
 <CAFEAcA89Onb9Dg4zJXQ0Ys-0kJ2-hz5KYRPXMCE7PWDDxVzDyQ@mail.gmail.com>
 <Y9exrDWT2NUoinu1@redhat.com> <87h6w7694t.fsf@linaro.org>
 <45EE5F9E-B9B8-4DA4-809E-A95FC618E7BE@gmail.com>
 <Y/Xlve3HWhh4QD+u@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Y/Xlve3HWhh4QD+u@redhat.com>
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

On Wed, Feb 22, 2023 at 09:51:57AM +0000, Daniel P. Berrangé wrote:
> On Wed, Feb 22, 2023 at 09:11:13AM +0000, Bernhard Beschow wrote:
> > Are there any plans or ideas to support 128 bit architectures
> > such as CHERI in the future? There is already a QEMU fork
> > implementing CHERI for RISC V [1]. Also ARM has developed an
> > experimental hardware implementation of CHERI within the Morello
> > project where Linaro is involved as well, although the QEMU
> > implementation is performed by the University of Cambridge [2].
> 
> If 128 bit hardware exists and has real world non-toy usage,
> then a request to support it in QEMU is essentially inevitable.
> 
> > I'm asking because once we deeply bake in the assumption that
> > host size >= guest size then adding such architectures will
> > become much harder.
> 
> Yep, that is a risk.

I can second that. Better keep it in the code and deal with it. Maybe those
specific parts can be implemented in such a way that it can easily become a
noop on host size >= guest size.

With regards,
Reinoud

