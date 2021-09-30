Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E1F5341D821
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 12:54:12 +0200 (CEST)
Received: from localhost ([::1]:56834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVthb-0003Mt-KU
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 06:54:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52032)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1mVta4-0000Tu-Eg; Thu, 30 Sep 2021 06:46:25 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1mVta2-0003Ak-LB; Thu, 30 Sep 2021 06:46:24 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 6AD0C408E1;
 Thu, 30 Sep 2021 13:46:09 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id 3DEA68E;
 Thu, 30 Sep 2021 13:46:09 +0300 (MSK)
Subject: Re: [PATCH] virtio-net : Add check for VIRTIO_NET_F_MAC
To: Cindy Lu <lulu@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
References: <20210929065215.21549-1-lulu@redhat.com>
 <8566c96d-5a61-fec7-f898-e5ac0937fd06@msgid.tls.msk.ru>
 <CACLfguUZ-JrcGenNecUZkaXf7upRiih73QPkhxN+fPKFaEpL8A@mail.gmail.com>
 <20210929093513-mutt-send-email-mst@kernel.org>
 <CACLfguVsjZbDo0JXMHJeNSusOyimajOABBG66T6tm32QN=ihEw@mail.gmail.com>
From: Michael Tokarev <mjt@tls.msk.ru>
Message-ID: <6e7328e3-7cee-a99b-ebe9-dd4d9507495a@msgid.tls.msk.ru>
Date: Thu, 30 Sep 2021 13:46:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <CACLfguVsjZbDo0JXMHJeNSusOyimajOABBG66T6tm32QN=ihEw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -98
X-Spam_score: -9.9
X-Spam_bar: ---------
X-Spam_report: (-9.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-3.03,
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
Cc: Jason Wang <jasowang@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

30.09.2021 04:35, Cindy Lu wrote:
[]
> so here come to the final question. which mac address has the higher priority?
> I think the NET_F_MAC bit means the hw mac address > command-line address.
> if the hw drivers want to change this. they can simply remove this bit.

At the very least, qemu should NEVER silently ignore stuff specified
on the command line. It should either warn the user or error out if
command-line parameter can not be applied for whatever reason.

I don't know the context, what NET_F_MAC is, but the general rule is
this: if the user specified something, it must not be ignored.

/mjt

