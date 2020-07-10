Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 39E7021BE9E
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jul 2020 22:38:00 +0200 (CEST)
Received: from localhost ([::1]:39746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jtzmR-0002uH-8Q
	for lists+qemu-devel@lfdr.de; Fri, 10 Jul 2020 16:37:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jtzlL-00024Z-Bo; Fri, 10 Jul 2020 16:36:51 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:35937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1jtzlI-000583-Nx; Fri, 10 Jul 2020 16:36:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=aP99ZxBb9RzJDuOJW7K+j1tPSfIP2/AeIe0lVCcDskQ=; 
 b=MV7bS+KAM8uic8qjX3d4yIa9Xo/yQEE5EDsPjh9ECATJBFCxiuZ/Miv0k8sPs0LBJZjGauPoRrFMUL+T7HzJ9VRjlNOecAwvFCsGDotUCHf7m5YA7NlTJim5FuLr8jx4qv9cE3fk0gicAENPth2hAtLdTTNPoFjD/gj4QxSX2/uAuMClZXI2eixS6OWEvbXXwsFOTuSwTX2F3cTtyrj/4aHjug7GIsNFZXCk9lB9iTPZfEq0G4ObAaAw6IT6VR2pjeovP7x7t97wNs7Y2DnzcnoJUzrRw7D8qtYjKET2U8O6DT7BLpRQSvk+hltAZUFhY5V3TRDPkHDqSj3vyRn0bA==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1jtzlD-0007Tq-Ll; Fri, 10 Jul 2020 22:36:43 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1jtzlD-00016G-CG; Fri, 10 Jul 2020 22:36:43 +0200
From: Alberto Garcia <berto@igalia.com>
To: no-reply@patchew.org
Subject: Re: [PATCH v11 00/34] Add subcluster allocation to qcow2
In-Reply-To: <159439943791.29400.15842099914457064806@07a7f0d89f7d>
References: <159439943791.29400.15842099914457064806@07a7f0d89f7d>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Fri, 10 Jul 2020 22:36:43 +0200
Message-ID: <w51ft9zp0o4.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/10 16:36:45
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, URIBL_BLOCKED=0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, vsementsov@virtuozzo.com, qemu-block@nongnu.org,
 dereksu@qnap.com, qemu-devel@nongnu.org, mreitz@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Fri 10 Jul 2020 06:43:59 PM CEST, no-reply@patchew.org wrote:
> /tmp/qemu-test/src/block/qcow2-cluster.c:473:19: error: 'expected_type' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>          } else if (type != expected_type) {
>                    ^
> /tmp/qemu-test/src/block/qcow2-cluster.c:449:25: note: 'expected_type' was declared here
>      QCow2SubclusterType expected_type, type;
>                          ^

Meh, this is a false positive but I forgot to fix it. I'll do it if
there is a new version, otherwise please someone just initialize
expected_type to 0 when committing.

Berto

