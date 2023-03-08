Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DECA6B139E
	for <lists+qemu-devel@lfdr.de>; Wed,  8 Mar 2023 22:16:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pa18o-0003s8-MM; Wed, 08 Mar 2023 16:16:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pa18k-0003ig-N1
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 16:16:02 -0500
Received: from mailout08.t-online.de ([194.25.134.20])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vr_qemu@t-online.de>)
 id 1pa18U-0008ND-4R
 for qemu-devel@nongnu.org; Wed, 08 Mar 2023 16:16:02 -0500
Received: from fwd70.dcpf.telekom.de (fwd70.aul.t-online.de [10.223.144.96])
 by mailout08.t-online.de (Postfix) with SMTP id 8068B1DEB3;
 Wed,  8 Mar 2023 22:15:40 +0100 (CET)
Received: from [192.168.211.200] ([84.175.228.75]) by fwd70.t-online.de
 with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
 esmtp id 1pa18N-2BXSbp0; Wed, 8 Mar 2023 22:15:39 +0100
Message-ID: <45aebc86-8408-0d2c-1dd2-058faf229a56@t-online.de>
Date: Wed, 8 Mar 2023 22:15:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7] audio/pwaudio.c: Add Pipewire audio backend for QEMU
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@gmail.com>,
 Dorinda Bassey <dbassey@redhat.com>, wtaymans@redhat.com
Cc: qemu-devel@nongnu.org, kraxel@redhat.com, armbru@redhat.com,
 qemu_oss@crudebyte.com, pbonzini@redhat.com
References: <20230306171020.381116-1-dbassey@redhat.com>
 <CAJ+F1C+nnrji13CXDcjGOU-b7_dptanHUcCrjUW2d_WyvG3i_Q@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Volker_R=c3=bcmelin?= <vr_qemu@t-online.de>
In-Reply-To: <CAJ+F1C+nnrji13CXDcjGOU-b7_dptanHUcCrjUW2d_WyvG3i_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TOI-EXPURGATEID: 150726::1678310139-167FD778-D524289A/0/0 CLEAN NORMAL
X-TOI-MSGID: 6b274eff-665d-4bef-8208-9e9bc25c356f
Received-SPF: none client-ip=194.25.134.20; envelope-from=vr_qemu@t-online.de;
 helo=mailout08.t-online.de
X-Spam_score_int: -25
X-Spam_score: -2.6
X-Spam_bar: --
X-Spam_report: (-2.6 / 5.0 requ) BAYES_00=-1.9, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=-0.01,
 RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Am 08.03.23 um 11:39 schrieb Marc-André Lureau:

> Volker, Wim, it would be nice if you could review/comment too!
>
> thanks

Hi,

last weekend I replaced pulseaudio with pipewire on my host computer and 
tested the QEMU pipewire backend. It doesn't work well on my computer, 
but with a few changes it becomes usable. I hope to have some time 
tomorrow evening to write down my suggestions and comments.

With best regards,
Volker

> --
> Marc-André Lureau


