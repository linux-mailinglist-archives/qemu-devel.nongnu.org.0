Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 989001B134E
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Apr 2020 19:39:53 +0200 (CEST)
Received: from localhost ([::1]:39798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jQaOe-0007KI-7u
	for lists+qemu-devel@lfdr.de; Mon, 20 Apr 2020 13:39:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34004 helo=eggs1p.gnu.org)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kbusch@kernel.org>) id 1jQaNZ-0006ok-2Q
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 13:38:45 -0400
Received: from Debian-exim by eggs1p.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <kbusch@kernel.org>) id 1jQaNY-0000Va-SE
 for qemu-devel@nongnu.org; Mon, 20 Apr 2020 13:38:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:38652)
 by eggs1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>)
 id 1jQaNW-0000TW-Mf; Mon, 20 Apr 2020 13:38:42 -0400
Received: from redsun51.ssa.fujisawa.hgst.com (unknown [199.255.47.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 82CC4207FC;
 Mon, 20 Apr 2020 17:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587404319;
 bh=UTmM1vrD3fCrgO7QrdeBjIoSlDwZTiFjtrvcdX+gok4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dHgV6ovICQsO/DxtcEwB6hmJM6RaElJc9laVAJM6b+No3ARrwNAuD+AyXV3t0G/Hc
 WHXjXhK1PyKM9j1IEfQgRktpE0IlGTq9FPyAS3OnjldO1jCerADSltpeGsOtsmfCqj
 DUqZCvcyEjcRTrL/FMl2EvrtPpg6of1FAyiabKG4=
Date: Tue, 21 Apr 2020 02:38:32 +0900
From: Keith Busch <kbusch@kernel.org>
To: Klaus Jensen <its@irrelevant.dk>
Subject: Re: [PATCH v2 00/16] nvme: refactoring and cleanups
Message-ID: <20200420173832.GA10592@redsun51.ssa.fujisawa.hgst.com>
References: <20200415130159.611361-1-its@irrelevant.dk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200415130159.611361-1-its@irrelevant.dk>
User-Agent: Mutt/1.12.1 (2019-06-15)
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-detected-operating-system: by eggs1p.gnu.org: First seen = 2020/04/20
 13:38:40
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Received-From: 198.145.29.99
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
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The series looks good to me.

Reviewed-by: Keith Busch <kbusch@kernel.org>

