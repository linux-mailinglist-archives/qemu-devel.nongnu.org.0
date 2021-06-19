Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FCB23AD894
	for <lists+qemu-devel@lfdr.de>; Sat, 19 Jun 2021 10:18:19 +0200 (CEST)
Received: from localhost ([::1]:45922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1luWBF-0000Q9-TC
	for lists+qemu-devel@lfdr.de; Sat, 19 Jun 2021 04:18:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1luWA3-000890-8E
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 04:17:03 -0400
Received: from mail.weilnetz.de ([37.120.169.71]:43044
 helo=mail.v2201612906741603.powersrv.de)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sw@weilnetz.de>) id 1luWA0-0001MP-PD
 for qemu-devel@nongnu.org; Sat, 19 Jun 2021 04:17:02 -0400
Received: from edv-macbook-pro.fritz.box (p57b42637.dip0.t-ipconnect.de
 [87.180.38.55])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.v2201612906741603.powersrv.de (Postfix) with ESMTPSA id 55302DA06D4;
 Sat, 19 Jun 2021 10:16:56 +0200 (CEST)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 "Daniel P. Berrange" <berrange@redhat.com>
References: <20210619045700.46907-1-richard.henderson@linaro.org>
From: Stefan Weil <sw@weilnetz.de>
Subject: Re: [PATCH 0/2] tcg: Fixes for temp_allocate_frame
Message-ID: <8b50c14a-5db2-977a-faab-1778f42bfaa6@weilnetz.de>
Date: Sat, 19 Jun 2021 10:16:55 +0200
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210619045700.46907-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=37.120.169.71; envelope-from=sw@weilnetz.de;
 helo=mail.v2201612906741603.powersrv.de
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.202,
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

Am 19.06.21 um 06:56 schrieb Richard Henderson:

> Stefan, I think this will resolve #367 for you -- please test.


Tested-by: Stefan Weil <sw@weilnetz.de>


Thank you, yes, it seems to resolve that issue.

I had to make two additional changes for building on Windows:

- Downgrade to support glib 2.54 (that's the version provided by Cygwin=20
for mingw-w64). Daniel, could we go back from 2.56 to 2.54?

- Fix assertion in oslib-win32.c (I already have sent a patch for that,=20
see=20
http://patchwork.ozlabs.org/project/qemu-devel/patch/20210611105846.34795=
4-1-sw@weilnetz.de/)

Stefan




