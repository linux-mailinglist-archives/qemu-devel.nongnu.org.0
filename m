Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 309B4D2C07
	for <lists+qemu-devel@lfdr.de>; Thu, 10 Oct 2019 16:03:53 +0200 (CEST)
Received: from localhost ([::1]:39958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iIZ2l-0003By-Ow
	for lists+qemu-devel@lfdr.de; Thu, 10 Oct 2019 10:03:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47682)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iIZ11-0002HD-3l
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 10:02:05 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iIZ10-0006Aa-0n
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 10:02:03 -0400
Received: from mx1.redhat.com ([209.132.183.28]:38664)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>) id 1iIZ0z-0006AD-RL
 for qemu-devel@nongnu.org; Thu, 10 Oct 2019 10:02:01 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A5CBA10DCC95
 for <qemu-devel@nongnu.org>; Thu, 10 Oct 2019 14:02:00 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.118.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id DA82610018FF;
 Thu, 10 Oct 2019 14:01:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 5DBBE11384A8; Thu, 10 Oct 2019 16:01:46 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Peter Krempa <pkrempa@redhat.com>
Subject: Re: [PATCH v3 0/3] qapi: Add detection for the 'savevm' fix for
 blockdev
References: <cover.1570705279.git.pkrempa@redhat.com>
Date: Thu, 10 Oct 2019 16:01:46 +0200
In-Reply-To: <cover.1570705279.git.pkrempa@redhat.com> (Peter Krempa's message
 of "Thu, 10 Oct 2019 13:05:21 +0200")
Message-ID: <87d0f4og1h.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Thu, 10 Oct 2019 14:02:00 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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

I have two simple question on PATCH 2, two straightforward refactorings
to reduce code duplication, and one commit message tweak.

Answer my questions, and then we can decide whether we want a respin or
touch-ups in my tree.

Thanks!

