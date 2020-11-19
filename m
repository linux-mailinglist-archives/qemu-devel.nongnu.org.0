Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C6262B9A7B
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 19:19:10 +0100 (CET)
Received: from localhost ([::1]:54278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfoWS-0001yt-T2
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 13:19:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kfoV8-0001VX-64; Thu, 19 Nov 2020 13:17:46 -0500
Received: from fanzine.igalia.com ([178.60.130.6]:40438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berto@igalia.com>)
 id 1kfoV3-0000O8-Ke; Thu, 19 Nov 2020 13:17:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
 s=20170329; 
 h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:To:From;
 bh=m521xGHgwJHtavVh5rQJzG70sjvJ+b3EvD+JQ9aM1r0=; 
 b=r4KWabJwPq9YTF9aKoaNLNo5VMbL5AyL2IgnNWwO0NFF41PeEK9H4zVb2nWt81kCvZQyIRUbwmE+GAkTgR/ur2lun/gFBXjahppVeAUWd0dcRS/WU51+wP5rzr3bILszk+FTtZ1dPWEksll0N+8YkGRDQXNR0KCu8gJbxlqW6lS6T1QZat5WGZLdiw1fpPucfmulQ0QzYo6HMiemWEdm7fVp5X8v/acamDFXFoYrTEKGCGvHWVW0d9BnoODqcBJx9KfMHqwY7tBJAbBndZguz4UXundwg2XbevR1GkiyMsfbB0HV/InF26HBvTCmBk5Vk0SxiYX0M32VlhkWTwWb3w==;
Received: from maestria.local.igalia.com ([192.168.10.14] helo=mail.igalia.com)
 by fanzine.igalia.com with esmtps 
 (Cipher TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim)
 id 1kfoUe-0007mt-0y; Thu, 19 Nov 2020 19:17:16 +0100
Received: from berto by mail.igalia.com with local (Exim)
 id 1kfoUd-0002Tp-Na; Thu, 19 Nov 2020 19:17:15 +0100
From: Alberto Garcia <berto@igalia.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: iotest 030 still occasionally intermittently failing
In-Reply-To: <a058f32e-402b-d269-a6a2-5c30e28abc4f@virtuozzo.com>
References: <CAFEAcA8OqZe9MYmp=B023bTqatP-KcoGsh_vQ4OZ=a=jh09wcQ@mail.gmail.com>
 <w51tutpp5nr.fsf@maestria.local.igalia.com>
 <CAFEAcA-Me4jw5TPYCHkJSX=9bAw0kzTMadyMM3YabGFNu+swkg@mail.gmail.com>
 <a058f32e-402b-d269-a6a2-5c30e28abc4f@virtuozzo.com>
User-Agent: Notmuch/0.18.2 (http://notmuchmail.org) Emacs/24.4.1
 (i586-pc-linux-gnu)
Date: Thu, 19 Nov 2020 19:17:15 +0100
Message-ID: <w51pn49xlck.fsf@maestria.local.igalia.com>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=178.60.130.6; envelope-from=berto@igalia.com;
 helo=fanzine.igalia.com
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
Cc: QEMU Developers <qemu-devel@nongnu.org>, Qemu-block <qemu-block@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On Thu 19 Nov 2020 05:11:38 PM CET, Vladimir Sementsov-Ogievskiy wrote:

> After some iterations I've reproduced on SIGABRT:

Great !

I'm however confused about whether this is the same problem that has
been reported in the past, e.g. in this one from August I doesn't see
any crash:

   https://lists.gnu.org/archive/html/qemu-devel/2020-08/msg00136.html

Berto

