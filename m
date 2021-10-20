Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7E1434B52
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Oct 2021 14:40:00 +0200 (CEST)
Received: from localhost ([::1]:53044 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdAsx-0004C3-Tp
	for lists+qemu-devel@lfdr.de; Wed, 20 Oct 2021 08:39:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mdAri-0003KQ-DY
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 08:38:42 -0400
Received: from kylie.crudebyte.com ([5.189.157.229]:54319)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <qemu_oss@crudebyte.com>)
 id 1mdArf-0005nH-9y
 for qemu-devel@nongnu.org; Wed, 20 Oct 2021 08:38:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=crudebyte.com; s=kylie; h=Content-Type:Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
 Content-ID:Content-Description;
 bh=PXfZZQrOyrm1W4mb8xcje4yvcBES/NT0d5ziilfMJNA=; b=nELniM2xG93PMQjR3aNP9j3BWN
 8conG+CVqnvM987a8QO2G2MCfAalfM7GrW0+DjbgYbEjdAxBU0YjKUNoH7DbZqxDGHMX9gaAYOqPS
 lfWk8FyQfHPDBZDGCVLRJ7xVBqQqJFTGg7Z6l60gmLJJoK8mZphd8IfWZDdrD+ruqgQlaEm7fUHaK
 L9MaUzjTjGHlOc7yPclCMxvbwu8Eqdgl1aDy6kUc/dioa9wMiMBUsRzdgAG8FkBLOvqcIwhv66mvY
 32dUt6BiXK7iSn3T0e33GTMDDj0CjCxMjaStc3eFAeNTLRufXfpZfQhWOJWqYA3SsKXMRbZnrlnIL
 M9AVBxRimtbXEvINvphWC9rLmdk9L7/OU2nBxlIvjdLW0UvScXSnMh4IQMXLWJ3PzN1qMEaR5nsvC
 0Liw+GEdmiwHyKPWM4PvGtEmU5+nSJ/Xbar+CnwpayLAu9kqqPJPopBJ22nJg3Oo9f5Fw8rjw+atR
 iV/6mgbgHalJMqBvAYaZD0rlByMtnhtxfAUK7GEy/sAMDrEItm9qG2uNvgjU/mXPOv/+vbff2jIhW
 DrHJDWbq9gIGn/Cyv5BLEVx4Ov/AAYBISS6AuKcw4gX873GPeLObLP6TLQzYw0YAAlt7uOpucpWf0
 f3Y/uSK6lXdMbMlUTw+J+gAp7jxV7ZAy4hDIj50us=;
From: Christian Schoenebeck <qemu_oss@crudebyte.com>
To: qemu-devel@nongnu.org
Cc: Will Cohen <wwcohen@gmail.com>, Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 00/11] 9p: Add support for Darwin
Date: Wed, 20 Oct 2021 14:38:35 +0200
Message-ID: <22395312.jNLmHM9Y7u@silver>
In-Reply-To: <CAB26zV1W3EDF9_CpQue3TiskP1VYX4SEkmsCiVG3rfh8XHTUDg@mail.gmail.com>
References: <20211013230405.32170-1-wwcohen@gmail.com>
 <3493661.FTZtrCqsiM@silver>
 <CAB26zV1W3EDF9_CpQue3TiskP1VYX4SEkmsCiVG3rfh8XHTUDg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Received-SPF: pass client-ip=5.189.157.229;
 envelope-from=qemu_oss@crudebyte.com; helo=kylie.crudebyte.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Donnerstag, 14. Oktober 2021 15:23:25 CEST Will Cohen wrote:
> Correct, sorry for the imprecise language. The use case being contemplated
> is limited to Linux as the guest side, specifically for cross-platform
> tools where the macOS implementation consists of integrating a Linux VM via
> QEMU.
> 
> NixOS (updater of the original patch,
> https://github.com/NixOS/nixpkgs/pull/122420) would be able to use this to
> provide macOS support via a VM.
> 
> Lima and Podman as containerization alternatives to Docker would like to
> performantly mount volumes between macOS users and their respective VMs.
> Lima currently accomplishes this via sshfs, but would like to move to 9p
> for stability/performance reasons
> (https://github.com/lima-vm/lima/issues/20). Podman has yet to fully settle
> on an implementation at all due to similar outstanding concerns, but the
> furthest along proposed implementation choice has been 9pfs as well
> (https://github.com/containers/podman/pull/11454), pending adoption of such
> functionality in QEMU upstream.

I only had a glimpse on the patches so far. From what I've seen, I don't 
expect much of a problem to bring this series through. I will have a closer 
look on v2 though. I also have to read the old discussions where I was not 
involved yet.

Soft freeze for QEMU 6.2 is close BTW (November 2nd):
https://wiki.qemu.org/Planning/6.2

Best regards,
Christian Schoenebeck



