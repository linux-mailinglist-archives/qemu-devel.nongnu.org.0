Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CFD81D3F29
	for <lists+qemu-devel@lfdr.de>; Thu, 14 May 2020 22:48:01 +0200 (CEST)
Received: from localhost ([::1]:39304 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jZKlr-0005BV-S0
	for lists+qemu-devel@lfdr.de; Thu, 14 May 2020 16:47:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1jZKks-0004JO-JJ
 for qemu-devel@nongnu.org; Thu, 14 May 2020 16:46:58 -0400
Received: from mailout07.t-online.de ([194.25.134.83]:49816)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1jZKkr-0002pW-6t
 for qemu-devel@nongnu.org; Thu, 14 May 2020 16:46:58 -0400
Received: from fwd18.aul.t-online.de (fwd18.aul.t-online.de [172.20.26.244])
 by mailout07.t-online.de (Postfix) with SMTP id 9C9FC42C2E52;
 Thu, 14 May 2020 22:46:53 +0200 (CEST)
Received: from [192.168.211.200]
 (TFx12GZYohcD38upvNgESjx3eXhnPggbWtPheBmWmvMuJQBhq7-tYFKQXJPq3JuQzN@[46.86.59.135])
 by fwd18.t-online.de
 with (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384 encrypted)
 esmtp id 1jZKkc-0RyJSS0; Thu, 14 May 2020 22:46:42 +0200
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
Subject: Re: [PATCH 10/10] ui/gtk: use native keyboard scancodes on Windows
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
References: <2393388c-86c3-4d7e-178e-2c7e6d14a8de@t-online.de>
 <20200510184304.9267-10-vr_qemu@t-online.de>
 <20200512113127.GP1191162@redhat.com>
Message-ID: <7c9023d9-e721-4d87-d061-1a44084b319c@t-online.de>
Date: Thu, 14 May 2020 22:46:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200512113127.GP1191162@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-ID: TFx12GZYohcD38upvNgESjx3eXhnPggbWtPheBmWmvMuJQBhq7-tYFKQXJPq3JuQzN
X-TOI-EXPURGATEID: 150726::1589489202-0000FA82-91DF2B3C/0/0 CLEAN NORMAL
X-TOI-MSGID: af40b517-73b0-4505-86a8-6967f32c92f8
Received-SPF: none client-ip=194.25.134.83; envelope-from=vr_qemu@t-online.de;
 helo=mailout07.t-online.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/05/14 16:46:54
X-ACL-Warn: Detected OS   = Linux 3.11 and newer [fuzzy]
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001 autolearn=_AUTOLEARN
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
Cc: Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


> since that time, we no longer support Debian Jessie, since Debian Buster
> is now released. We also no longer support Ubuntu Xenial (16.04), since
> we now only need Ubuntu Bionic (18.04) and Focal (20.04).
>
> So we can justify moving the minium Gtk in QEMU to 3.22 at this time.
>
> This will avoid you needing to do versioned ifdef for this new functionality.

Hi Daniel,

I noticed there are already seven versioned ifdefs in ui/gtk.c. I would prefer to leave my patch as it is at the moment and send in a separate follow up patch which increases the minimum GTK version in configure to 3.22 and removes all versioned code in ui/gtk.c. Just like your patch from 2018. I think this is easier to revert if someone complains about the removal.

With best regards,
Volker

