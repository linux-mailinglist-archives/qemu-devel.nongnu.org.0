Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 769AD3B1505
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Jun 2021 09:43:43 +0200 (CEST)
Received: from localhost ([::1]:49956 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvxXx-00083r-SB
	for lists+qemu-devel@lfdr.de; Wed, 23 Jun 2021 03:43:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lvxVk-0007Lw-QD
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 03:41:24 -0400
Received: from forward4-smtp.messagingengine.com ([66.111.4.238]:53703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dme@dme.org>) id 1lvxVO-0000S5-Cu
 for qemu-devel@nongnu.org; Wed, 23 Jun 2021 03:41:23 -0400
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
 by mailforward.nyi.internal (Postfix) with ESMTP id 7845D1940103;
 Wed, 23 Jun 2021 03:41:00 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute6.internal (MEProxy); Wed, 23 Jun 2021 03:41:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=jKOUFs
 bKIVhOYWb3QMgMw9Xa5cRcHv5EON5binuPcB0=; b=P2ENYL/0VvxLS8gRKjGuQQ
 6Akcrqm+akO8XOUqH2cDjFUuX+Ov+TmuLVfJyVcVw0zjdp0Rtdtkt9egvLfcsCjo
 pdQaDrlYqYlceMNYODUGTRTTknwZAX7ncsWuGg5Eq8eBKlrxvunvcDGOVr23JAC5
 LTT07Nt5+HuJZRdcoKskjf6KILL/P6EWGUtLd/HOATLRfZ81cqcbvWsNFQevp5/l
 ufelRd8QXrWsz7CP7aaROoeybFQbQhcQrwJgEtyvl7nGwyuXOrd6wzuPFdOV5tYU
 lXJDUT0a9BgoSkdSuBA1R+dlwP/CnHZmH1aTecJ3Al67+rXdHzSDcUvgfXL8WYBA
 ==
X-ME-Sender: <xms:jOXSYEYT8hc67napigIpkx1A5WO8PQOkTcLpVX_lDqHLGKQRZBP-cw>
 <xme:jOXSYPY04W97LOs0zKIws0WglDN7rzM2qjK9VZJlX-87HHx-NAUEVJtaRsQJWTsZz
 4azu2oLtn6-aF7YTNY>
X-ME-Received: <xmr:jOXSYO_ooBZTVADVVa8QeH-F8mUHVFpM2FNm8g8_byW63_TtX25eN39DwKXTZwCQoVg8lOGG5vgI8vJB3u9_Ubb-RghYxO_glXpbO8pZZp0>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrfeegvddguddugecutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefvufgjfhfhfffkgggtsehttdertddttddtnecuhfhrohhmpeffrghvihgu
 ucfgughmohhnughsohhnuceoughmvgesughmvgdrohhrgheqnecuggftrfgrthhtvghrnh
 ephfekgeeutddvgeffffetheejvdejieetgfefgfffudegffffgeduheegteegleeknecu
 vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepughmvgesug
 hmvgdrohhrgh
X-ME-Proxy: <xmx:jOXSYOpTAXdUKi3LEYZFSx--bWwMbjOBFsXCGphJhIfei9gREVXn0A>
 <xmx:jOXSYPq68GA5gWz_QAuWkFYOyReTCk7njXZ80Dae3ZsVjuhVxEFKGg>
 <xmx:jOXSYMTU2jmHCsEuVJRHEiopa2qZl1zk3tvsMk1FUbg0j5FhLab8bA>
 <xmx:jOXSYC1DGx2x-289qUzMMv9gk-iRcRCQON9MYesHwuBmcnNIv5X1yA>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 23 Jun 2021 03:40:59 -0400 (EDT)
Received: from localhost (disaster-area.hh.sledj.net [local])
 by disaster-area.hh.sledj.net (OpenSMTPD) with ESMTPA id 98472098;
 Wed, 23 Jun 2021 07:40:55 +0000 (UTC)
To: Alex Williamson <alex.williamson@redhat.com>, Joao Martins
 <joao.m.martins@oracle.com>
Subject: Re: [PATCH RFC 0/6] i386/pc: Fix creation of >= 1Tb guests on AMD
 systems with IOMMU
In-Reply-To: <20210622151629.6c75427c.alex.williamson@redhat.com>
References: <20210622154905.30858-1-joao.m.martins@oracle.com>
 <20210622151629.6c75427c.alex.williamson@redhat.com>
X-HGTTG: fertle
From: David Edmondson <dme@dme.org>
Date: Wed, 23 Jun 2021 08:40:56 +0100
Message-ID: <cunv965ni47.fsf@dme.org>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: neutral client-ip=66.111.4.238; envelope-from=dme@dme.org;
 helo=forward4-smtp.messagingengine.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_PASS=-0.001,
 SPF_NEUTRAL=0.779,
 UNPARSEABLE_RELAY=0.001 autolearn=unavailable autolearn_force=no
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, "Michael S
 . Tsirkin" <mst@redhat.com>, Richard Henderson <richard.henderson@linaro.org>,
 qemu-devel@nongnu.org, Daniel Jordan <daniel.m.jordan@oracle.com>,
 Auger Eric <eric.auger@redhat.com>,
 Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tuesday, 2021-06-22 at 15:16:29 -06, Alex Williamson wrote:

>> 	   Additionally, an alternative to hardcoded ranges as we do today,
>> 	   VFIO could advertise the platform valid IOVA ranges without necessarily
>> 	   requiring to have a PCI device added in the vfio container. That would
>> 	   fetching the valid IOVA ranges from VFIO, rather than hardcoded IOVA
>> 	   ranges as we do today. But sadly, wouldn't work for older hypervisors.
>
>
> $ grep -h . /sys/kernel/iommu_groups/*/reserved_regions | sort -u
> 0x00000000fee00000 0x00000000feefffff msi
> 0x000000fd00000000 0x000000ffffffffff reserved
>
> Ideally we might take that into account on all hosts, but of course
> then we run into massive compatibility issues when we consider
> migration.  We run into similar problems when people try to assign
> devices to non-x86 TCG hosts, where the arch doesn't have a natural
> memory hole overlapping the msi range.
>
> The issue here is similar to trying to find a set of supported CPU
> flags across hosts, QEMU only has visibility to the host where it runs,
> an upper level tool needs to be able to pass through information about
> compatibility to all possible migration targets.  Towards that end, we
> should probably have command line options that either allow to specify
> specific usable or reserved GPA address ranges.  For example something
> like:
> 	--reserved-mem-ranges=host
>
> Or explicitly:
>
> 	--reserved-mem-ranges=13G@1010G,1M@4078M

Would this not naturally be a property of a machine model?

dme.
-- 
Seems I'm not alone at being alone.

