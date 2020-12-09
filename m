Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EDF9D2D420B
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Dec 2020 13:21:33 +0100 (CET)
Received: from localhost ([::1]:35598 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmyTM-0003W4-W4
	for lists+qemu-devel@lfdr.de; Wed, 09 Dec 2020 07:21:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1kmyS9-00030i-5S
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 07:20:17 -0500
Received: from kerio.kamp.de ([195.62.97.192]:45542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pl@kamp.de>) id 1kmyRc-0002P0-DJ
 for qemu-devel@nongnu.org; Wed, 09 Dec 2020 07:20:16 -0500
X-Footer: a2FtcC5kZQ==
Received: from submission.kamp.de ([195.62.97.28]) by kerio.kamp.de with ESMTPS
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
 for qemu-devel@nongnu.org; Wed, 9 Dec 2020 13:19:40 +0100
Received: (qmail 25619 invoked from network); 9 Dec 2020 12:19:41 -0000
Received: from ac85.vpn.kamp-intra.net (HELO ?172.20.250.85?)
 (pl@kamp.de@::ffff:172.20.250.85)
 by submission.kamp.de with ESMTPS (AES128-SHA encrypted) ESMTPA;
 9 Dec 2020 12:19:41 -0000
Subject: Re: qemu 6.0 rbd driver rewrite
From: Peter Lieven <pl@kamp.de>
To: dillaman@redhat.com, Kevin Wolf <kwolf@redhat.com>,
 Max Reitz <mreitz@redhat.com>
References: <92e0ea53-59e1-7ca0-dd0a-e4f350a6e032@kamp.de>
Message-ID: <db284cf5-b7a8-7cab-29e3-38980c0839b2@kamp.de>
Date: Wed, 9 Dec 2020 13:19:41 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <92e0ea53-59e1-7ca0-dd0a-e4f350a6e032@kamp.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Received-SPF: pass client-ip=195.62.97.192; envelope-from=pl@kamp.de;
 helo=kerio.kamp.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Christian Theune <ct@flyingcircus.io>, qemu block <qemu-block@nongnu.org>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Am 01.12.20 um 13:40 schrieb Peter Lieven:
> Hi,
>
>
> i would like to submit a series for 6.0 which will convert the aio hooks to native coroutine hooks and add write zeroes support.
>
> The aio routines are nowadays just an emulation on top of coroutines which add additional overhead.
>
> For this I would like to lift the minimum librbd requirement to luminous release to get rid of the ifdef'ry in the code.
>
>
> Any objections?
>
>
> Best,
>
> Peter
>

Kindly pinging as the 6.0 dev tree is now open. Also cc'ing qemu-devel which I accidently forgot.


Peter



