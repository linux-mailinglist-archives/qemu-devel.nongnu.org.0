Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB961A8441
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Apr 2020 18:11:58 +0200 (CEST)
Received: from localhost ([::1]:33546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jOOAH-0000SP-JC
	for lists+qemu-devel@lfdr.de; Tue, 14 Apr 2020 12:11:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48818)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <berto@igalia.com>) id 1jOO8k-0007mY-8O
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 12:10:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <berto@igalia.com>) id 1jOO8e-000265-Ac
 for qemu-devel@nongnu.org; Tue, 14 Apr 2020 12:10:21 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:39235)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <berto@igalia.com>)
 id 1jOO8d-00024j-OZ; Tue, 14 Apr 2020 12:10:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=XfV7f5n+gVAqz8uyPfGi/qZMLWoQG9WbIgLWzseQJzI=; 
 b=cHayegjRDB4Op7xe5btqZYZxS4Dhk5bgcfN04J8DL/1rCJCgsyCsQu3FlDAeXj+1Gr5un+6zWZfSuDKIU6LWmkaFoUnzsf0aInX2T09z4w7HEaRQKG4s7f0uQCBbfpiACkF6meTK1SVJxaAXJM87vDmgd416xc0SAlJl2UMNXfwfarIA1/GWsY6Hg7SYHOnHdRMqoPxeiOOwifuvfyVjSHj+WgEQ7/kAKeWl3mdPvpHN52ZVzpEA2bE6j9B4sSnYG3Vpe8ilCk2DEGCKBhfl6qD1StGlq3tlpvezhsp2KnZOAVVqcIujziuSHsoCNxmBo3nJGPih/xNDiyP3D0HnSg==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jOO8a-0007Kx-RB; Tue, 14 Apr 2020 18:10:12 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1jOO8a-0004UZ-FR; Tue, 14 Apr 2020 18:10:12 +0200
From: Alberto Garcia <berto@igalia.com>
To: Kevin Wolf <kwolf@redhat.com>
Subject: Re: [PATCH for-5.0] qcow2: Add incompatibility note between backing
 files and raw external data files
In-Reply-To: <20200414153126.GN7747@linux.fritz.box>
References: <20200410121816.8334-1-berto@igalia.com>
 <20200414153126.GN7747@linux.fritz.box>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Tue, 14 Apr 2020 18:10:12 +0200
Message-ID: <w51r1wqrqu3.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x (no
 timestamps) [generic] [fuzzy]
X-Received-From: 178.60.130.6
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
Cc: qemu-devel@nongnu.org, qemu-block@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Tue 14 Apr 2020 05:31:26 PM CEST, Kevin Wolf <kwolf@redhat.com> wrote:

> I don't think this is critical for 5.0, so if I make a pull request
> for other reasons, I'll include it, but if you agree, I won't send one
> just for this patch.

Sure, no problem.

Berto

