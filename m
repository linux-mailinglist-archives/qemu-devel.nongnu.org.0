Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67BC72721D2
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Sep 2020 13:07:58 +0200 (CEST)
Received: from localhost ([::1]:55844 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kKJfp-0007Yv-GB
	for lists+qemu-devel@lfdr.de; Mon, 21 Sep 2020 07:07:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kKJeb-0006pI-NA; Mon, 21 Sep 2020 07:06:41 -0400
Received: from fanzine.igalia.com ([178.60.130.6]:49905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kKJeX-00065Q-Cs; Mon, 21 Sep 2020 07:06:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=Oqs0EEChIDa1c2jLCpt0uOYFg354tHomPDn7YHhy1mM=; 
 b=jJb/3a51U8JOudgkSiqmXw0eT9E1zEhdCiC9edS6bMByhLRIYDR+2AYhA6/1LAhFzU6KAybiAT5FLzDpI5jc4EwAMBus+IjJyxmzYFhk+3oYNC1NgdBA1jvIpQ7vvPnV/HtQ8ubCIviZdL8rq7eowb4pzavW7KSUsXxP8AX7AAudcQtg2W8atN3Vdjrsc5Fv8JCy9aL3hqY70ROoRpELYhGpzIbC66zvsNpdwV1tCgUOWJh9guQuUPzm9agBu+MgIZE7oPK5BnN1/sGUMSMmATQ1dACGsx7C5ZJ9m4TyRg9JQqFlP+8ntTbnkrWS41By201pUGLuoz30U4r73rH4/A==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1kKJe9-0008C2-2u; Mon, 21 Sep 2020 13:06:13 +0200
Received: from berto by mail.igalia.com with local (Exim)
 id 1kKJe8-0007MA-Op; Mon, 21 Sep 2020 13:06:12 +0200
From: Alberto Garcia <berto@igalia.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Subject: Re: [PATCH] block/sheepdog: Replace magic val by
 NANOSECONDS_PER_SECOND definition
In-Reply-To: <20200921110145.520944-1-philmd@redhat.com>
References: <20200921110145.520944-1-philmd@redhat.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Mon, 21 Sep 2020 13:06:12 +0200
Message-ID: <w51v9g7crtn.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/09/21 07:06:14
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, sheepdog@lists.wpkg.org,
 qemu-block@nongnu.org, qemu-trivial@nongnu.org, Max Reitz <mreitz@redhat.com>,
 Liu Yuan <namei.unix@gmail.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Mon 21 Sep 2020 01:01:45 PM CEST, Philippe Mathieu-Daud=C3=A9 wrote:
> Use self-explicit NANOSECONDS_PER_SECOND definition instead
> of magic value.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alberto Garcia <berto@igalia.com>

Berto

