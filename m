Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8156239E16E
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Jun 2021 18:04:34 +0200 (CEST)
Received: from localhost ([::1]:36850 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqHjt-0006c9-8F
	for lists+qemu-devel@lfdr.de; Mon, 07 Jun 2021 12:04:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1lqHgZ-0002Oy-7P; Mon, 07 Jun 2021 12:01:10 -0400
Received: from esa6.hc3370-68.iphmx.com ([216.71.155.175]:62708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anthony.perard@citrix.com>)
 id 1lqHgN-0008S1-EL; Mon, 07 Jun 2021 12:01:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=citrix.com; s=securemail; t=1623081655;
 h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=+KkwsGrzndxOAS/E3lA6QFfueBllf0d4acF0r8yeGvU=;
 b=bqLg+ni39BOkUQGg2kBd5Fg4lRisKkjv44nFm+daomUgmN6PgFOOv96H
 WQB/MT/EQRV0W5gnYG7sFxmqDv5BbmNHdJ5USmaCYHQjUF6Uj4tPG2JXw
 rwqZErbrue5PRKVS0ZAdME7maXv+pRTsZxq1TSE+sW+H2KSGhtzZDObrP w=;
Authentication-Results: esa6.hc3370-68.iphmx.com;
 dkim=none (message not signed) header.i=none
IronPort-SDR: AxTeQ2jRhwxGIWtJM6V00Zk8gorvYbI2SqDSbDwNKqConrtNd+1/KBZXQjs64TEKHK004RiJEK
 NtCf/JBQwXLY/iT/xgI7MakHx9Z41+dDBz1A5bi1GHyUxa/2NqQt2GaExKeDEu/PnG4RIM71xq
 Zu5dOaNtqf5k6z/uB956PuEjNN7NpEZmcf6sELLZCWZOJt7d2SMkwAfSxpacuRpLEtqrEsmEvB
 vG/cD38kYV47TbFhOlzj41i0b6xm4pcFtuTrWjPJ+BqxmfROJnl0OIVb44LeWc3zRJWFCAwa+X
 /DY=
X-SBRS: 5.1
X-MesageID: 45630884
X-Ironport-Server: esa6.hc3370-68.iphmx.com
X-Remote-IP: 162.221.158.21
X-Policy: $RELAYED
IronPort-HdrOrdr: A9a23:0bFdh67JG9d+jI8tlQPXwY2BI+orL9Y04lQ7vn2ZFiY5TiXIra
 qTdaogviMc6AxxZJhAo6H4BEDkex/hHPFOkO4s1NuZLWzbUQiTXeNfBOnZskXd8kTFn4Yzu9
 YCT0VnMr3N5DBB/L3HCWKDYrAdKbe8gcSVbNPlvg1QpExRGtRdxjY8LjzePlx9RQFAC5Z8Po
 Gb/NB7qz2pfmlSRtinB1EeNtKz7OHjpdbDW1orFhQn4A6BgXeD87jhCSWV2R8YTndm3aoiy2
 7YiAb0j5/T+c1T8iWsmlM70q4m0ecJi+EzcvBks/JlXQkEXzzYLLiIWNW5zUAISa+UmRoXee
 L30msd1vJImgLsl1GO0GbQMjbboUkTAl/ZuCylaCjY0L7ErAxTMbs+uWseSGqs13Yd
X-IronPort-AV: E=Sophos;i="5.83,255,1616472000"; d="scan'208";a="45630884"
Date: Mon, 7 Jun 2021 17:00:46 +0100
To: Thomas Huth <thuth@redhat.com>
CC: Ahmed Abouzied <email@aabouzied.com>, <qemu-devel@nongnu.org>,
 <qemu-trivial@nongnu.org>, Stefano Stabellini <sstabellini@kernel.org>, "Paul
 Durrant" <paul@xen.org>, xen-devel <xen-devel@lists.xenproject.org>
Subject: Re: [PATCH 2/2] Remove leading underscores from Xen defines
Message-ID: <YL5Crh2VlyxGNUlI@perard>
References: <20210605175001.13836-1-email@aabouzied.com>
 <01ba2176-b559-1078-8a9f-39553989d9d3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <01ba2176-b559-1078-8a9f-39553989d9d3@redhat.com>
Received-SPF: pass client-ip=216.71.155.175;
 envelope-from=anthony.perard@citrix.com; helo=esa6.hc3370-68.iphmx.com
X-Spam_score_int: -45
X-Spam_score: -4.6
X-Spam_bar: ----
X-Spam_report: (-4.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reply-to:  Anthony PERARD <anthony.perard@citrix.com>
From:  Anthony PERARD via <qemu-devel@nongnu.org>

On Mon, Jun 07, 2021 at 08:36:07AM +0200, Thomas Huth wrote:
> On 05/06/2021 19.50, Ahmed Abouzied wrote:
> > Identifiers with leading underscores followed by capital letters or
> > underscores are reserved for C standards.
> > 
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/369
> > 
> > Signed-off-by: Ahmed Abouzied <email@aabouzied.com>
> > ---
> >   include/hw/xen/interface/grant_table.h  | 4 ++--
> >   include/hw/xen/interface/io/blkif.h     | 4 ++--
> >   include/hw/xen/interface/io/console.h   | 4 ++--
> >   include/hw/xen/interface/io/fbif.h      | 4 ++--
> >   include/hw/xen/interface/io/kbdif.h     | 4 ++--
> >   include/hw/xen/interface/io/netif.h     | 4 ++--
> >   include/hw/xen/interface/io/protocols.h | 4 ++--
> >   include/hw/xen/interface/io/ring.h      | 4 ++--
> >   include/hw/xen/interface/io/usbif.h     | 4 ++--
> >   9 files changed, 18 insertions(+), 18 deletions(-)
> > 
> 
> I hope the Xen people can comment on whether the underscores had a purpose
> here or whether it's ok to remove them, thus:
> 
> Cc: xen-devel@lists.xenproject.org
> 
> From my QEMU-developer's side of view:
> 
> Reviewed-by: Thomas Huth <thuth@redhat.com>
> 

Nacked-by: Anthony PERARD <anthony.perard@citrix.com>

Please don't change the header guards in include/hw/xen/interface/.
This have been attempted before and result in build failures, see
d1744bd3218daa820744c14572058491e4854399 (Revert xen/io/ring.h of "Clean up a few header guard symbols")

Cheers,

-- 
Anthony PERARD

