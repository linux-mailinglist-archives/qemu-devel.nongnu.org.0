Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2CC11B4ACF
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Apr 2020 18:46:54 +0200 (CEST)
Received: from localhost ([::1]:54322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jRIWT-0006yT-LU
	for lists+qemu-devel@lfdr.de; Wed, 22 Apr 2020 12:46:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46950)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kbusch@kernel.org>) id 1jRIVM-0006IC-8b
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 12:45:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <kbusch@kernel.org>) id 1jRIVK-0005nl-8C
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 12:45:43 -0400
Received: from mail.kernel.org ([198.145.29.99]:33612)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kbusch@kernel.org>) id 1jRIVJ-0005Rp-Pa
 for qemu-devel@nongnu.org; Wed, 22 Apr 2020 12:45:41 -0400
Received: from redsun51.ssa.fujisawa.hgst.com (unknown [199.255.47.7])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C0A3620706;
 Wed, 22 Apr 2020 16:45:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587573939;
 bh=CY75XTo+auMbA1hDLj6HQY7AeOqPJkhfNR89TtyvoK4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Yty05lDPg+GaE7MPoqtBDamr5rQ2KXdxkSUA4Sn7zr5bgTdNSF2kEHO5wPCpr/QSF
 Nzf3YyaJ6/mKBR92Q3T8OHgg/oPMlxkqC674UlkppcbS7ifLzXIjncjXD1xP0RJoG+
 /geiK49i6cLDNBSL1nVpV8LusaYijl2yiIV1IVaU=
Date: Thu, 23 Apr 2020 01:45:31 +0900
From: Keith Busch <kbusch@kernel.org>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Subject: Re: [PATCH] MAINTAINERS: Update Keith Busch's email address
Message-ID: <20200422164531.GA14788@redsun51.ssa.fujisawa.hgst.com>
References: <20200421122236.24867-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200421122236.24867-1-f4bug@amsat.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
Received-SPF: pass client-ip=198.145.29.99; envelope-from=kbusch@kernel.org;
 helo=mail.kernel.org
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/04/22 12:45:39
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue, Apr 21, 2020 at 02:22:36PM +0200, Philippe Mathieu-Daud� wrote:
> keith.busch@intel.com address is being rejected.
> Replace by the email address Keith is actively using.
> 
> Signed-off-by: Philippe Mathieu-Daud� <f4bug@amsat.org>

Thank you for sending the correction.

Acked-by: Keith Busch <kbusch@kernel.org>

