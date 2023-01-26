Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11D6F67CCD0
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 14:53:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL2gH-0003if-FB; Thu, 26 Jan 2023 08:52:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eldon-qemu@eldondev.com>)
 id 1pL2gF-0003hh-LA
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 08:52:43 -0500
Received: from [209.195.0.149] (helo=npcomp.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eldon-qemu@eldondev.com>)
 id 1pL2gD-00046R-Vf
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 08:52:43 -0500
Received: by npcomp.net (Postfix, from userid 1000)
 id 16E4A289D; Thu, 26 Jan 2023 13:52:39 +0000 ()
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=eldondev.com;
 s=eldondev; t=1674741159;
 bh=zOj0cuvbh9D0detDSIa+6otl3x1uAZwNif5Iz7KE3uw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To;
 b=n2cRIIFjgyjF9ODENxepYE1yIm/UDCyJ8JT7idOVYXjLCMLx42r/FXwds6mrxH9jn
 g29dcgK2MRq1HMLiAxQ2qR8zlQi3P7xcJ3VPeFFU+xMEHF6rM0DRAqPyBrVbwIt5u0
 lnriPwGKjbAew6wwn/vxHznmvnzp5H3VNrtLsfA8=
Date: Thu, 26 Jan 2023 13:52:39 +0000
From: Eldon Stegall <eldon-qemu@eldondev.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>,
 Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Kevin Wolf <kwolf@redhat.com>, John Snow <jsnow@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>
Subject: Re: no more pullreq processing til February
Message-ID: <Y9KFp06pp/qohgV1@invalid>
References: <CAFEAcA8v8hrqkFemdT5x_O5_mdps4wpdRCoVAfts+oVJj_qTVw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8v8hrqkFemdT5x_O5_mdps4wpdRCoVAfts+oVJj_qTVw@mail.gmail.com>
X-Host-Lookup-Failed: Reverse DNS lookup failed for 209.195.0.149 (failed)
Received-SPF: pass client-ip=209.195.0.149;
 envelope-from=eldon-qemu@eldondev.com; helo=npcomp.net
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RDNS_NONE=0.793,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

On Thu, Jan 26, 2023 at 01:22:32PM +0000, Peter Maydell wrote:
> Hi; we've run out of gitlab CI pipeline minutes for this month.
> This leaves us the choice of:
>  (a) don't process any more pullreqs til we get more minutes in Feb
>  (b) merge pullreqs blindly without CI testing
>  (c) buy more minutes
> 
> For the moment I propose to take option (a). My mail filter will
> continue to track pullreqs that get sent to the list, but I won't
> do anything with them.
> 
> If anybody has a better suggestion feel free :-)

Would it be possible if (d) were to run self-hosted instances of the
runner? I am not sure how gitlab pricing works, but I believe on github
self-hosted runners are free.

I have several baremetal machines colocated that I could dedicate to
execute these runs, dual processor xeons with a couple hundred gigs of
RAM. I would need approx 48 hours notice to initially provision the
machines. I would be happy to provide root credentials and work out IPMI
access if that becomes necessary.

If this offering isn't suitable, let me know how we can consider
adapting something to the project's needs.

Thanks,
Eldon


