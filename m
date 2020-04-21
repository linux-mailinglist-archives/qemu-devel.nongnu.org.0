Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A43C41B1EE4
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Apr 2020 08:39:50 +0200 (CEST)
Received: from localhost ([::1]:51722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQmZR-0000G6-91
	for lists+qemu-devel@lfdr.de; Tue, 21 Apr 2020 02:39:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54024)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jQmYe-0008Bv-DJ
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 02:39:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <its@irrelevant.dk>) id 1jQmYe-0006tg-6Z
 for qemu-devel@nongnu.org; Tue, 21 Apr 2020 02:39:00 -0400
Received: from charlie.dont.surf ([128.199.63.193]:58306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <its@irrelevant.dk>)
 id 1jQmYc-0006rB-8W; Tue, 21 Apr 2020 02:38:58 -0400
Received: from apples.localdomain (80-167-98-190-cable.dk.customer.tdc.net
 [80.167.98.190])
 by charlie.dont.surf (Postfix) with ESMTPSA id 48B67BF5E1;
 Tue, 21 Apr 2020 06:38:54 +0000 (UTC)
Date: Tue, 21 Apr 2020 08:38:50 +0200
From: Klaus Birkelund Jensen <its@irrelevant.dk>
To: Keith Busch <kbusch@kernel.org>
Subject: Re: [PATCH v2 00/16] nvme: refactoring and cleanups
Message-ID: <20200421063850.wayw2eytcywio6tr@apples.localdomain>
References: <20200415130159.611361-1-its@irrelevant.dk>
 <20200420173832.GA10592@redsun51.ssa.fujisawa.hgst.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20200420173832.GA10592@redsun51.ssa.fujisawa.hgst.com>
Received-SPF: pass client-ip=128.199.63.193; envelope-from=its@irrelevant.dk;
 helo=charlie.dont.surf
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/21 02:38:54
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
 Javier Gonzalez <javier.gonz@samsung.com>,
 Maxim Levitsky <mlevitsk@redhat.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Apr 21 02:38, Keith Busch wrote:
> The series looks good to me.
> 
> Reviewed-by: Keith Busch <kbusch@kernel.org>

Thanks for the review Keith!

Kevin, should I rebase this on block-next? I think it might have some
conflicts with the PMR patch that went in previously.

Philippe, then I can also change the *err to *local_err ;)

