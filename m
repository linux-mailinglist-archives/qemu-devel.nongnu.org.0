Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A8E5503F5
	for <lists+qemu-devel@lfdr.de>; Sat, 18 Jun 2022 12:07:01 +0200 (CEST)
Received: from localhost ([::1]:45930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o2VM4-0005O2-2Z
	for lists+qemu-devel@lfdr.de; Sat, 18 Jun 2022 06:07:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1o2VIN-0003uU-7y
 for qemu-devel@nongnu.org; Sat, 18 Jun 2022 06:03:11 -0400
Received: from fencepost.gnu.org ([2001:470:142:3::e]:60974)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1o2VIM-00043s-3H; Sat, 18 Jun 2022 06:03:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=gnu.org;
 s=fencepost-gnu-org; h=In-Reply-To:MIME-Version:References:Subject:To:From:
 Date; bh=QHouEt69LJwZTCAITRAI8ErVHlaanxdmR0KuCeBTT+8=; b=ZjYFfoLaSmoVrODZRPGu
 RRsCn5r3Jqj2HilxGAZ/t95k0t6/7HJO8RKZEb0kPm21ulAZ0o5FDK3pV9mrZq6uNdEV0x7c7Ugr1
 XE1YtIDRxH31gmXucB/Er5CGGw4n8123LEHh0UKdCEnMxnNF7mCzLGZUTvsY5L7VcOQRkKqQJM0g7
 9ZytW+Zmq4IzJPX2OnNFcpsN19B/gCJR+8fKcG2r697TNNQdwvthP36/KA9Rb6DGwW5rfu5Ffww2A
 RVlqq3mTVPAobj62BgiG7QbETRR38qR8mo4q7mq40kpq3VoImLq80OEMpCIJgVxxobWIOgp/arlK/
 DbX7bMicIU7yDA==;
Received: from 2a02-8440-611c-788e-de41-a9ff-fe47-ec49.rev.sfr.net
 ([2a02:8440:611c:788e:de41:a9ff:fe47:ec49]:42954 helo=begin)
 by fencepost.gnu.org with esmtpsa (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <samuel.thibault@gnu.org>)
 id 1o2VIL-0000XS-So; Sat, 18 Jun 2022 06:03:09 -0400
Received: from samy by begin with local (Exim 4.95)
 (envelope-from <samuel.thibault@gnu.org>) id 1o2VID-00BXRj-Os;
 Sat, 18 Jun 2022 12:03:01 +0200
Date: Sat, 18 Jun 2022 12:03:01 +0200
From: Samuel Thibault <samuel.thibault@gnu.org>
To: Peter Delevoryas <pdel@fb.com>
Cc: jasowang@redhat.com, eblake@redhat.com, armbru@redhat.com,
 qemu-devel@nongnu.org
Subject: Re: [PATCH 2/4] slirp: Update SlirpConfig version to 5
Message-ID: <20220618100301.qdsls3bxugwv7ekm@begin>
References: <20220616010526.1895564-1-pdel@fb.com>
 <20220616010526.1895564-3-pdel@fb.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220616010526.1895564-3-pdel@fb.com>
Organization: I am not organized
User-Agent: NeoMutt/20170609 (1.8.3)
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

Hello,

Peter Delevoryas, le mer. 15 juin 2022 18:05:24 -0700, a ecrit:
> I think we probably need a new Slirp release
> (4.8.0) and a switch statement here instead, right?
> 
> So that we can preserve the behavior for 4.7.0?

Yes, that's the idea.

Samuel

