Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05D206099F0
	for <lists+qemu-devel@lfdr.de>; Mon, 24 Oct 2022 07:43:58 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oml2n-000504-B1
	for lists+qemu-devel@lfdr.de; Sun, 23 Oct 2022 20:10:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1omVnt-0002Dz-Tt
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 03:53:55 -0400
Received: from mailout12.t-online.de ([194.25.134.22])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1omVnr-0007dM-Uj
 for qemu-devel@nongnu.org; Sun, 23 Oct 2022 03:53:53 -0400
Received: from fwd79.dcpf.telekom.de (fwd79.aul.t-online.de [10.223.144.105])
 by mailout12.t-online.de (Postfix) with SMTP id 9C882A4D5;
 Sun, 23 Oct 2022 09:53:46 +0200 (CEST)
Received: from [192.168.211.200] ([84.175.228.229]) by fwd79.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1omVnm-19Adof0; Sun, 23 Oct 2022 09:53:46 +0200
Message-ID: <2448bc23-3849-a25b-8e77-f487ae7efb46@t-online.de>
Date: Sun, 23 Oct 2022 09:53:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH v3 2/4] hw/audio: fix tab indentation
To: Amarjargal Gundjalam <amarjargal16@gmail.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <cover.1666371095.git.amarjargal16@gmail.com>
 <5072d17c33b7bdb068f45308961259889ce1fd8a.1666371096.git.amarjargal16@gmail.com>
Content-Language: en-US
In-Reply-To: <5072d17c33b7bdb068f45308961259889ce1fd8a.1666371096.git.amarjargal16@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1666511626-F3FEE417-3C4B5D3C/0/0 CLEAN NORMAL
X-TOI-MSGID: e6002a7a-5887-426a-bba5-4683d59db23d
Received-SPF: none client-ip=194.25.134.22; envelope-from=vr_qemu@t-online.de;
 helo=mailout12.t-online.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

Am 21.10.22 um 18:59 schrieb Amarjargal Gundjalam:

> The TABs should be replaced with spaces, to make sure that we have a
> consistent coding style with an indentation of 4 spaces everywhere.
>
> Resolves:https://gitlab.com/qemu-project/qemu/-/issues/370
> Reviewed-by: Daniel P. Berrangé<berrange@redhat.com>
>
> Signed-off-by: Amarjargal Gundjalam<amarjargal16@gmail.com>
> ---
>   hw/audio/fmopl.c          | 1664 ++++++++++++++++++-------------------
>   hw/audio/fmopl.h          |  138 +--
>   hw/audio/intel-hda-defs.h | 1008 +++++++++++-----------
>   hw/audio/wm8750.c         |  270 +++---
>   4 files changed, 1540 insertions(+), 1540 deletions(-)

Hi Amarjargal,

I had a look at hw/audio/fmopl.c and I think the result doesn't look 
right. A few comments are no longer correctly aligned. I guess you just 
replaced all TABs with four spaces. But this is not how TABs work.

For reference: I used the vim command

:%s/^I/    /g

and the result is identical to your file. The commands

:se ts=4 expandtab
:retab

would have been a much better starting point for the last few manual 
changes.

Here is another example. For the file hw/audio/wm8750.c I would have 
started with the following vim commands

:se ts=8 expandtab
:retab

With best regards,
Volker

