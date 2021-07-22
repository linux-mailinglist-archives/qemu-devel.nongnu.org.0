Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F7713D1E7E
	for <lists+qemu-devel@lfdr.de>; Thu, 22 Jul 2021 08:51:11 +0200 (CEST)
Received: from localhost ([::1]:48058 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6SY2-0006e3-7A
	for lists+qemu-devel@lfdr.de; Thu, 22 Jul 2021 02:51:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1m6SWn-0005vl-8L
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 02:49:53 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:58458
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1m6SWl-0002ht-5e
 for qemu-devel@nongnu.org; Thu, 22 Jul 2021 02:49:52 -0400
Received: from macbook02.fritz.box (p5b1514be.dip0.t-ipconnect.de
 [91.21.20.190])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 9F246DA0FBB;
 Thu, 22 Jul 2021 08:49:47 +0200 (CEST)
To: Nicholas Kyanda <hopefirst@gmail.com>, qemu-devel@nongnu.org
References: <CACtFGYPsB-Wy+qfkX172FxjtMzu7mxgjk1eeYSCpV3HBf95wmg@mail.gmail.com>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: Installation challenges
Message-ID: <210b8e57-7d66-0df5-c852-48fcd48c4ce1@weilnetz.de>
Date: Thu, 22 Jul 2021 08:49:46 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CACtFGYPsB-Wy+qfkX172FxjtMzu7mxgjk1eeYSCpV3HBf95wmg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.117,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Am 22.07.21 um 05:02 schrieb Nicholas Kyanda:

> Hello,
>
> Thank you for your software. I just installed the 64 bit windows exe=20
> unfortunately, I cannot find it on my desktop. How do I start using it?=

> Sincerely,
> Nicholas Kyanda


QEMU is a console application, therefore there is neither an icon on=20
your desktop nor a menu entry to run it.

You have to run cmd.exe or the Windows power shell and start the desired =

QEMU executable from that command line.

Regards

Stefan Weil



