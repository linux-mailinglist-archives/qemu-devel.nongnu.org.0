Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F1950C094
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 21:59:30 +0200 (CEST)
Received: from localhost ([::1]:52122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhzRA-0007ya-TK
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 15:59:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <asmadeus@codewreck.org>)
 id 1nhzPu-0007CD-Bn
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 15:58:10 -0400
Received: from nautica.notk.org ([91.121.71.147]:53522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <asmadeus@codewreck.org>)
 id 1nhzPs-00013W-2K
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 15:58:09 -0400
Received: by nautica.notk.org (Postfix, from userid 108)
 id E2E86C020; Fri, 22 Apr 2022 21:58:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org; s=2;
 t=1650657483; bh=PKAMLv9q1RRV13PDmQSDI3TEsC6eLazeIeSFa1X2lXo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TuzSSBtXgCEr2am+ZhAMVAxyyuWQhmwQK5tlbiNdmuLv/pEKRXjl8i+18CORA5/f/
 sqSj2syst63jwB2MiIwumseAf+ZP/AQZxzRUlOnmr1av2sMvA1jfStilkRJic/Nc1v
 oHxblbHHEeTjrJy2e9M+s2WwarXU4hUjT/eFOk5t3KPC6GTILAx8FR+fAk9jKk659i
 0h6GzczVuxYnvAdB57tBNOhiJqcipMGznmCtx/Z6s0Ecfej7y9jzPZWSPhKK5v7opm
 PeHIQNpk5BufWHmUCnIs3CEgjEWfhFWzR5+mctH0H++erEATnzkCDe8k2jwaO+zchV
 HH5ipJ9Q2eMtA==
Received: from odin.codewreck.org (localhost [127.0.0.1])
 by nautica.notk.org (Postfix) with ESMTPS id 7145EC009;
 Fri, 22 Apr 2022 21:57:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=codewreck.org; s=2;
 t=1650657482; bh=PKAMLv9q1RRV13PDmQSDI3TEsC6eLazeIeSFa1X2lXo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=EmIljHzZB/Fy6wLeXbjGGhQUEOxVKB35xGzgxlhIvqov4COAORqh9XKZKPJ53iI0f
 Ob8eH9MitR9Od1DSg0L220wxB92rXrMY2qKIJjP67iiQx6AH3bF0k5UHG5aETK/+Vr
 ALR7rd+Ryv7g19MHdlkUNpT7F4OcR9X50dvjcijYKVP+QW9lM4yzQDBRjKa0b8VWub
 3e17yI7JXlkaHKBi6mHrcNQb5F1tAMVC/uAxYh9UqGSqWmZwb6KBr4BNyxlKJvj1su
 qsVEt7hagteN/I7ogsa5sKNZhQNefwOweX5+VTaD22xGCVI9nYTWco6xMWEGouXr+H
 A7H0/pqqN6WCg==
Received: from localhost (odin.codewreck.org [local])
 by odin.codewreck.org (OpenSMTPD) with ESMTPA id d51252ee;
 Fri, 22 Apr 2022 19:57:55 +0000 (UTC)
Date: Sat, 23 Apr 2022 04:57:40 +0900
From: Dominique Martinet <asmadeus@codewreck.org>
To: Christian Schoenebeck <qemu_oss@crudebyte.com>
Subject: Re: [RFC PATCH] 9p: case-insensitive host filesystems
Message-ID: <YmMItCb97KqegQw5@codewreck.org>
References: <1757498.AyhHxzoH2B@silver>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1757498.AyhHxzoH2B@silver>
Received-SPF: pass client-ip=91.121.71.147;
 envelope-from=asmadeus@codewreck.org; helo=nautica.notk.org
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Latchesar Ionkov <lucho@ionkov.net>, Eric Van Hensbergen <ericvh@gmail.com>,
 linux-kernel@vger.kernel.org, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>, Keno Fischer <keno@juliacomputing.com>,
 Michael Roitzsch <reactorcontrol@icloud.com>, Will Cohen <wwcohen@gmail.com>,
 netdev@vger.kernel.org, v9fs-developer@lists.sourceforge.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Christian Schoenebeck wrote on Fri, Apr 22, 2022 at 08:02:46PM +0200:
> So maybe it's better to handle case-insensitivity entirely on client side? 
> I've read that some generic "case fold" code has landed in the Linux kernel 
> recently that might do the trick?

I haven't tried, but settings S_CASEFOLD on every inodes i_flags might do
what you want client-side.
That's easy enough to test and could be a mount option

Even with that it's possible to do a direct open without readdir first
if one knows the path and I that would only be case-insensitive if the
backing server is case insensitive though, so just setting the option
and expecting it to work all the time might be a little bit
optimistic... I believe guess that should be an optimization at best.

Ideally the server should tell the client they are casefolded somehow,
but 9p doesn't have any capability/mount time negotiation besides msize
so that's difficult with the current protocol.

-- 
Dominique | Asmadeus

