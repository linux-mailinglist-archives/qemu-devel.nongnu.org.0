Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 559E61B3771
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Apr 2020 08:20:14 +0200 (CEST)
Received: from localhost ([::1]:42938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jR8k0-00080i-Uj
	for lists+qemu-devel@lfdr.de; Wed, 22 Apr 2020 02:20:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52902)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jR8j5-0007Uu-Iq
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 02:19:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jR8j5-0001dg-9j
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 02:19:15 -0400
Received: from charlie.dont.surf ([128.199.63.193]:60100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jR8j3-0001QE-J7; Wed, 22 Apr 2020 02:19:13 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 7BDD6BF5A5;
 Wed, 22 Apr 2020 06:19:10 +0000 (UTC)
Date: Wed, 22 Apr 2020 08:19:06 +0200
From: Klaus Birkelund Jensen <its@irrelevant.dk>
To: Maxim Levitsky <mlevitsk@redhat.com>
Subject: Re: [PATCH v2 00/16] nvme: refactoring and cleanups
Message-ID: <20200422061906.tauk56gookljxi36@apples.localdomain>
References: <20200415130159.611361-1-its@irrelevant.dk>
 <62d6f58d5ce0ea62fda8b66e53563449e7ebe7cf.camel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <62d6f58d5ce0ea62fda8b66e53563449e7ebe7cf.camel@redhat.com>
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 02:19:11
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Received-From: 128.199.63.193
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
Cc: Kevin Wolf <kwolf@redhat.com>, Beata Michalska <beata.michalska@linaro.org>,
 qemu-block@nongnu.org, Klaus Jensen <k.jensen@samsung.com>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Keith Busch <kbusch@kernel.org>, Javier Gonzalez <javier.gonz@samsung.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Apr 21 19:24, Maxim Levitsky wrote:
> Should I also review the V7 series or I should wait for V8 which will
> not include these cleanups?
 
Hi Maxim,

Just wait for another series - I don't think I will post a v8, I will
chop op the series into smaller ones instead.

Most patches will hopefully not change too much, so should keep your
Reviewed-by's ;)


Thanks,
Klaus

