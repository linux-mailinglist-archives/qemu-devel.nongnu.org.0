Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A224E6A8187
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 12:50:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXhRo-000496-IT; Thu, 02 Mar 2023 06:50:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1pXhRi-00047Y-7A
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:50:02 -0500
Received: from isrv.corpit.ru ([86.62.121.231])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>) id 1pXhRf-00062k-Gw
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 06:50:01 -0500
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id BB12640020;
 Thu,  2 Mar 2023 14:49:57 +0300 (MSK)
Received: from [192.168.177.130] (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with ESMTP id D687E123;
 Thu,  2 Mar 2023 14:49:56 +0300 (MSK)
Message-ID: <fd95f235-b43e-f908-887e-b6b57aa5c4f4@msgid.tls.msk.ru>
Date: Thu, 2 Mar 2023 14:49:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PULL 35/53] chardev/char-socket: set s->listener = NULL in
 char_socket_finalize
Content-Language: en-US
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Yajun Wu <yajunw@nvidia.com>,
 Jiri Pirko <jiri@nvidia.com>, =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?=
 <marcandre.lureau@redhat.com>, Yajun@redhat.com, Wu@redhat.com,
 &lt@redhat.com, Jiri@redhat.com, Pirko@redhat.com,
 Paolo Bonzini <pbonzini@redhat.com>
References: <20230302082343.560446-1-mst@redhat.com>
 <20230302082343.560446-36-mst@redhat.com>
From: Michael Tokarev <mjt@tls.msk.ru>
In-Reply-To: <20230302082343.560446-36-mst@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -69
X-Spam_score: -7.0
X-Spam_bar: -------
X-Spam_report: (-7.0 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.09,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

There are some url'ifications slipped into this one:

02.03.2023 11:26, Michael S. Tsirkin пишет:
..

> Message-Id: <20230214021430.3638579-1-yajunw@nvidia.com>
> Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Signed-off-by: Yajun Wu &lt;<a href="mailto:yajunw@nvidia.com" target="_blank">yajunw@nvidia.com</a>&gt;<br>
> Acked-by: Jiri Pirko &lt;<a href="mailto:jiri@nvidia.com" target="_blank">jiri@nvidia.com</a>&gt;<br></blockquote><div><br></div><div>Reviewed-by: Marc-André Lureau &lt;<a href="mailto:marcandre.lureau@redhat.com">marcandre.lureau@redhat.com</a>&gt;<br><br> </div><blockquote class="gmail_quote" style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">


Thanks,

/mjt

