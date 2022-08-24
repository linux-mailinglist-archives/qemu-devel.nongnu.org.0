Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B9A6B59F3AD
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Aug 2022 08:40:50 +0200 (CEST)
Received: from localhost ([::1]:54638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oQk4H-0000Sq-4e
	for lists+qemu-devel@lfdr.de; Wed, 24 Aug 2022 02:40:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33152)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <k.jensen@samsung.com>)
 id 1oQk0N-0006vb-UM
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 02:36:48 -0400
Received: from mailout2.w1.samsung.com ([210.118.77.12]:55511)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <k.jensen@samsung.com>)
 id 1oQk0J-0005lP-NP
 for qemu-devel@nongnu.org; Wed, 24 Aug 2022 02:36:46 -0400
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220824063630euoutp02be2d28e0ea8ad192e2d862fddbc39800~ONHU81oyH1927319273euoutp02E
 for <qemu-devel@nongnu.org>; Wed, 24 Aug 2022 06:36:30 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220824063630euoutp02be2d28e0ea8ad192e2d862fddbc39800~ONHU81oyH1927319273euoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1661322990;
 bh=o6JP9nHNmnQ61nXmU+8U5bSBusKjJW3VFfsWMStZVA0=;
 h=Date:From:To:CC:Subject:In-Reply-To:References:From;
 b=kyjZlCw4xvKtI4Q+LynA0Hk35J7zjEQGDD1OX9WY4xvAxZyn54PGeMH3JLDl1GSLm
 rG0WCoUKcuTt+3ol2X1AHopsmP7P0vUumNFBUF7Y9mSJnni6ZbAQWuXuzD0EaqMlZj
 +LctOKWL9uGhZ+CA3n0dS1fXNI9bapCXh1WoLoe0=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220824063630eucas1p138baa97ae2a8c4f3bc4433dd0a0892cc~ONHU0WPff0990609906eucas1p1z;
 Wed, 24 Aug 2022 06:36:30 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 95.69.19378.EE6C5036; Wed, 24
 Aug 2022 07:36:30 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220824063630eucas1p1f079b5c21d093952e58614940b880371~ONHUX1rad1682616826eucas1p1T;
 Wed, 24 Aug 2022 06:36:30 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220824063630eusmtrp24127ad0f31f39e896025b0d62ef6546f~ONHUW_BPL2560425604eusmtrp2n;
 Wed, 24 Aug 2022 06:36:30 +0000 (GMT)
X-AuditID: cbfec7f5-a35ff70000014bb2-99-6305c6eef461
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id F6.A4.07473.DE6C5036; Wed, 24
 Aug 2022 07:36:30 +0100 (BST)
Received: from CAMSVWEXC01.scsc.local (unknown [106.1.227.71]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20220824063629eusmtip2e363934cdc28198f778faf8d9eb07ef0~ONHUOdJCg2934229342eusmtip2e;
 Wed, 24 Aug 2022 06:36:29 +0000 (GMT)
Received: from apples (106.210.248.180) by CAMSVWEXC01.scsc.local
 (2002:6a01:e347::6a01:e347) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 24 Aug 2022 07:36:28 +0100
Date: Wed, 24 Aug 2022 08:36:26 +0200
From: Klaus Jensen <k.jensen@samsung.com>
To: Michael Kropaczek <michael.kropaczek@solidigm.com>
CC: <qemu-devel@nongnu.org>, <qemu-block@nongnu.org>,
 <jonathan.derrick@solidigm.com>, <francis.michael@solidigm.com>, Naveen
 Nagar <naveen.n1@samsung.com>, Keith Busch <kbusch@kernel.org>, Klaus Jensen
 <its@irrelevant.dk>
Subject: Re: [PATCH v2] hw/nvme: Support for Namespaces Management from
 guest OS - create-ns
Message-ID: <YwXG0sVajqJhl6ta@apples>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220824003042.824761-1-michael.kropaczek@solidigm.com>
X-Originating-IP: [106.210.248.180]
X-ClientProxiedBy: CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347) To
 CAMSVWEXC01.scsc.local (2002:6a01:e347::6a01:e347)
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkleLIzCtJLcpLzFFi42LZduzned13x1iTDX78lbH4++gNk8X+g99Y
 LW7e72S0mHToGqPFz8NH2SxmvWtnszjeu4PFgd3j3I7z7B6bVnWyeTy5tpnJo/fUB5YAligu
 m5TUnMyy1CJ9uwSujJkP57AVnNWvuPPpO1sD43K1LkZODgkBE4n/qw6wdDFycQgJrGCUeHR8
 KyOE84VR4s/ky6wQzmdGiUWrrrDAtFz+2MkOYgsJLGeU2DsrGK5o7vPvbBDOJkaJTc2NbCBV
 LAKqEmueT2IFsdkENCW2//kPNklEwEzi/7RmdpAGZoEnjBJvT58HSnBwCAvESbw76g5SwwvU
 u29xKxuELShxcuYTsBJmoDnrd+lDmNISy/9xgJicAq4SC7b4QpypLLF29muok2sl1h47A7ZI
 QuAGh8TF/x1QCReJx/eb2CBsYYlXx7ewQ9gyEv93zmeCsIslPk1qgKqvkbi2ejEryC4JAWuJ
 vjM5EGFHiRczt0OF+SRuvBUECTMDmZO2TWeGCPNKdLQJQVSrSexo2so4gVF5FpKvZiF8NQvh
 qwWMzKsYxVNLi3PTU4uN81LL9YoTc4tL89L1kvNzNzECU8vpf8e/7mBc8eqj3iFGJg7GQ4wS
 HMxKIrxWx1iShXhTEiurUovy44tKc1KLDzFKc7AoifMmZ25IFBJITyxJzU5NLUgtgskycXBK
 NTBNNFot+j3R8Jtp/tE5xzblxcfPeHn+dN9eUx+xrKvz7eNrtXtu3P2ZukihvWJ3YeFL95So
 VSp7EgW6zG7W5qj+cHo57V/NBaFFVXJd6z+F+3UL+GnKviloflEdM/Gw5d7tXtyPJ94Lqn44
 N11BQke6M+j+uoxHRxQkAm7ySVQIKn5nT5KR4KoMn2d56G32EtX5PPt8fDY4GBzc+ESRj8Wr
 Z8+zWUtyYmLn1VpvjiyxWeLKLFDdw/R1+hKJP3/+NL7TvlyxdvHZ95P97ZXrbN/e33TOb+Pc
 nfUq3XOOWE+5t31N9RX3d666G+V3nmBe9+Khrc/cOK8JJlKb992Ps9418+cLrYeaya/bNScc
 /f1ViaU4I9FQi7moOBEAEhhusJwDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrBIsWRmVeSWpSXmKPExsVy+t/xe7rvjrEmG5yps/j76A2Txf6D31gt
 bt7vZLSYdOgao8XPw0fZLGa9a2ezON67g8WB3ePcjvPsHptWdbJ5PLm2mcmj99QHlgCWKD2b
 ovzSklSFjPziElulaEMLIz1DSws9IxNLPUNj81grI1MlfTublNSczLLUIn27BL2MmQ/nsBWc
 1a+48+k7WwPjcrUuRk4OCQETicsfO9m7GLk4hASWMkrM23mGDSIhI/Hpykd2CFtY4s+1LjaI
 oo+MErtmnGeFcDYxSnQdXc8EUsUioCqx5vkkVhCbTUBTYvuf/ywgtoiAmcT/ac1gK5gFnjBK
 7J7WAJTg4BAWiJPY888KpIYXqHff4laoDTMYJV52H2WFSAhKnJz5BKyeGWjo+l36EKa0xPJ/
 HCAmp4CrxIItvhB3Kkusnf2aBcKulXh1fzfjBEbhWUjmzEKYMwthzgJG5lWMIqmlxbnpucWG
 esWJucWleel6yfm5mxiBUbbt2M/NOxjnvfqod4iRiYPxEKMEB7OSCK/VMZZkId6UxMqq1KL8
 +KLSnNTiQ4ymwHCYyCwlmpwPjPO8knhDMwNTQxMzSwNTSzNjJXFez4KORCGB9MSS1OzU1ILU
 Ipg+Jg5OqQYmxhv7Np30+cijHD7LKqRo6rSUTKfy3kltVTV3X/SFTG7NmaPz4Pdeh3mtNlfT
 J/V+68uMe+O1e2tv3O9LadwHNQSsHq68V7FColxuUc75EneD6y7FmYulvj6duPhMqq/6hBup
 vrzX3Q482WKfHv71R0rtjON3tZob365++qlK+OD3+w/PxO9/s8LQLi+hYpN78BO+er2ky+c+
 2atmLVTOCfax0paPX7CG2/THlBqXWdPs9Xby7/0YskRFnXHi2xWSySENG/ZGX+bQCzso8dso
 5NdZgbIHNQeWlCoITjMQVNsZeCb29C+myAvLmdYyLuT/Nb2tX4VjEuci/7szFWYdZNj7a8dZ
 o1ed8je1LsdwKrEUZyQaajEXFScCACRs+4A7AwAA
X-CMS-MailID: 20220824063630eucas1p1f079b5c21d093952e58614940b880371
X-Msg-Generator: CA
X-RootMTR: 20220824003345eucas1p1d78597f87a072e51f03927b9737e0502
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220824003345eucas1p1d78597f87a072e51f03927b9737e0502
References: <CGME20220824003345eucas1p1d78597f87a072e51f03927b9737e0502@eucas1p1.samsung.com>
 <20220824003042.824761-1-michael.kropaczek@solidigm.com>
Received-SPF: pass client-ip=210.118.77.12; envelope-from=k.jensen@samsung.com;
 helo=mailout2.w1.samsung.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001, TVD_PH_BODY_ACCOUNTS_PRE=0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Michael,

Thanks for your interest in contributing this!

(CC: +Naveen, +Keith, -linux-nvme)

Some observations and commets on your patch submission below.

Firstly, your mail delivery is broken - this is not getting through to
qemu-devel. Also, I don't think kernel developers have that much
interest in this, so no need to CC linux-nvme.

Also, please CC all maintainers (see ./scripts/get_maintainer.pl).

On Aug 23 17:30, Michael Kropaczek wrote:
>      Added support for NVMEe NameSpaces Mangement allowing the guest OS to
>      create, delete namespaces by issuing create-ns and delet-ns commands.
>      It is an extension to currently implemented Qemu nvme virtual device.
>      Virtual devices representing namespaces will be created and/or deleted
>      during Qemu's running session, at anytime.
> 
>       The implementation of the Namespaces Management consists of two patches:
>        First:  create-ns (this patch)
>        Second: delete-ns (a patch will follow)
> 

  1. Please format the commit message without the indendations.
  2. You do not need to state the patches belonging to the series (that
     goes into the cover letter - see below).

> Signed-off-by: Michael Kropaczek <michael.kropaczek@solidigm.com>
> 
> Description:
> 
> Currently namespaces could be defined as follows:
> 1. Legacy Namespace - just one namespace within Nvme controller's
>    where the back-end was specified for nvme device by -drive parameter
>    pointing directly to the image file.
> 2. Additional Namespaces - specified by nvme-ns devices each having its
>    own back-end. To have multiple namespaces each needed to be specified
>    at Qemu's command line being associated with the most recently defined
>    nvme-bus from nvme device.
>    If a such additional namespace should be attached and/or detached by the
>    guest OS, nvme controller has to be linked with another device nvme-subsys.
> 
> All that have a static behavior, all need to be specified at the Qemu's command
> line, all specified virtual nvme entities will be processed during Qemu's
> start-up created and provided to the guest OS.
> 
> To have a support for nvme create-ns and delete-ns commands with specified
> parameters, as the NVMe specification defines, a different approach is needed.
> Virtual devices representing namespaces need to be created and/or deleted 
> during Qemu's running session, at anytime. The back-end image sizes for a
> namespace must accommodate the payload size and size of metadata resulted
> from specified parameters. And the total capacity of the nvme controller
> together with un-allocated capacity needs to be taken into account and updated
> following the commands nvme create-ns and delete-ns respectively.
> 
> Here is the approach:
> The nvme device will get new parameters:
>  - auto-ns-path, specifies the path to to image and necessary
>    configuration files.
>  - auto-ns-purge, controls behavior when delete-ns command is issued.
>    If set to 'on' the associated back-end images will be deleted,
>    otherwise such will be preserved as backup files (not Qemu backup files)
>  - auto-ns-tnvmcap, specifies total controller's space pool in bytes that
>    can be allocated for namespaces, usually when nvme device is created
>    first time. When Qemu restarted this parameter could be omitted.
> 
> The virtual devices representing namespace will be created during the Qemu
> running session dynamically. QOM classes and instances will be created
> utilizing existing configuration scheme already used for Qemu's start-up.
> Back-end images will be created and associated with QOM namespaces (virtual
> instances) or disassociated deleted or renamed. Also it is assured that all
> settings will remain persistent over Qemu start-ups and shutdowns.
> The implementation makes it possible to combine the existing
> "Additional Namespace" implementation with the new "Managed Namespaces",
> those will coexist with obvious restrictions, like both will share the same
> NsIds space, "static" namespaces will not be deleted etc..
> 

This should go into your "cover letter". See `git format-patch
--cover-letter`.

Your two patches should be sent as a series with the above as the cover
letter. Each patch should carry a commit message explaining why it is
being done and why it is being done in a particular way, but the cover
letter should (if required) elaborate on your motivation and approach
for the series as a whole.

`git format-patch` and `git send-email` can do this properly for you.
Alternatively, you can use git-publish which is a nice frontend for
working with patch series.

Now, as for the patches themselves. There is actually already a patch
for namespace management on the list - see[1] for a 7.1-based tree with
this applied. The approach there is to pre-add a set of namespaces with
zero sized images (indicating that they are "unallocated") and then
resize them on namespace create (using blk_truncate). This limits the
number of creatable namespaces, but this
is indicated in the MN field.

The core issue with that patch is that it blocks the QEMU main thread
while the truncation is going on, which is not good and which is why
this has never been merged. However, I just peeked into
block/block-backend.c and it looks like truncate could be used with AIO
(though currently not wired up).

The same core blocking issues exist in your approach. Also, doing
filesystem stuff is a layering violation. The emulated devices really
should not break out of their "bubble", even though they can.

However! I'm a little intrigued by your approach to storing persistent
state by writing out a config file and auto loading it. I have been
considering various ways of doing that for some time since there are
other areas where we need persistent state like that (format nvm is one
example, zone state another).


  [1]: https://github.com/OpenMPDK/qemu/commit/a7357a4c553f4106e76e3ec052205659bcc5d741


Cheers,
Klaus

