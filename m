Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DBC69C010
	for <lists+qemu-devel@lfdr.de>; Sun, 19 Feb 2023 12:28:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pThqg-00077X-Dk; Sun, 19 Feb 2023 06:27:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <reinoud@13thmonkey.org>)
 id 1pThqc-00077O-Hq
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 06:27:15 -0500
Received: from 77-173-18-117.fixed.kpn.net ([77.173.18.117]
 helo=dropje.13thmonkey.org) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <reinoud@13thmonkey.org>) id 1pThqa-0007PL-Is
 for qemu-devel@nongnu.org; Sun, 19 Feb 2023 06:27:14 -0500
Received: by dropje.13thmonkey.org (Postfix, from userid 103)
 id A0F27C1F137; Sun, 19 Feb 2023 12:27:09 +0100 (CET)
Date: Sun, 19 Feb 2023 12:27:09 +0100
From: Reinoud Zandijk <reinoud@NetBSD.org>
To: Stefan Weil <sw@weilnetz.de>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 libvir-list@redhat.com, Paolo Bonzini <pbonzini@redhat.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Reinoud Zandijk <reinoud@netbsd.org>,
 Ryo ONODERA <ryoon@netbsd.org>, Brad Smith <brad@comstyle.com>
Subject: Re: [RFC PATCH] docs/about/deprecated: Deprecate 32-bit host systems
Message-ID: <Y/IHjdFuSbovjO1G@dropje.13thmonkey.org>
References: <20230130114428.1297295-1-thuth@redhat.com>
 <87a61cbmti.fsf@pond.sub.org> <Y+9bSHshiNnek31J@redhat.com>
 <39bc9b17-e6f2-ed1b-0d6d-31bbb98842cf@weilnetz.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <39bc9b17-e6f2-ed1b-0d6d-31bbb98842cf@weilnetz.de>
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

On Fri, Feb 17, 2023 at 12:05:46PM +0100, Stefan Weil wrote:
> On Fri, Feb 17, 2023 at 11:36:41AM +0100, Markus Armbruster wrote:
> 
> > Which 32-bit hosts are still useful, and why?
> 
> Citing my previous mail:
> 
>    I now checked all downloads of the latests installers since 2022-12-30.
> 
>    qemu-w32-setup-20221230.exe – 509 different IP addresses
>    qemu-w64-setup-20221230.exe - 5471 different IP addresses
> 
>    339 unique IP addresses are common for 32- and 64-bit, either
>    crawlers or people who simply got both variants. So there remain 170
>    IP addresses which only downloaded the 32-bit variant in the last week.
> 
>    I see 437 different strings for the browser type, but surprisingly
>    none of them looks like a crawler.
> 
> So there still seems to be a certain small need for QEMU installers for
> 32-bit Windows: 170 users für 32 bit only, 339 users for both 32 and 64 bit,
> 5132 users for 64 bit only.

As you seem to have access to download stats could you check generic download
stats too i.e. not only for Windows installers?

Also, how do you account for all 32 bit host downloads from say mirrors or the
source code downloads that are compiled and redistributed by 3rd parties for
32 bit hosts?

Although I am not that happy with dropping support on any platform I don't
think such a decision should be taken that lightly.

Maybe a change in the test setup would be handier? I.e. only test 32 bit hosts
say once a 2 days and the 64 bit hosts each day?

Reinoud


