Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6989401AC0
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Sep 2021 13:48:38 +0200 (CEST)
Received: from localhost ([::1]:44948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mND77-0006Dy-OE
	for lists+qemu-devel@lfdr.de; Mon, 06 Sep 2021 07:48:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1mNCz5-0004Gj-MD; Mon, 06 Sep 2021 07:40:24 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:41145)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1mNCz3-0004W7-Cy; Mon, 06 Sep 2021 07:40:19 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 8133E4011E;
 Mon,  6 Sep 2021 14:40:10 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id CE3094C;
 Mon,  6 Sep 2021 14:39:55 +0300 (MSK)
Subject: Re: [PATCH v3] qemu-sockets: fix unix socket path copy (again)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>
References: <20210901131624.46171-1-mjt@msgid.tls.msk.ru>
 <CAJ+F1CLcSZ_zE8oMZz3k_WCSOvf50hapGCu-dfSd9RxzzVhumA@mail.gmail.com>
 <165d60fd-c91e-7b03-3ec1-21f50760ec05@msgid.tls.msk.ru>
 <8929531a-c763-f01b-4a3a-70c1a0dd97cd@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <e93958d0-3015-c490-64e9-261dabc6b301@msgid.tls.msk.ru>
Date: Mon, 6 Sep 2021 14:39:55 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <8929531a-c763-f01b-4a3a-70c1a0dd97cd@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -91
X-Spam_score: -9.2
X-Spam_bar: ---------
X-Spam_report: (-9.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-2.332,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Daniel_P_=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 QEMU <qemu-devel@nongnu.org>, qemu-stable <qemu-stable@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

06.09.2021 14:34, Philippe Mathieu-Daudé wrote:

> Certainly, but you could also pick the latest patches
> sent to qemu-trivial@ already reviewed ;)

I haven't done this in years..

