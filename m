Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D59565DF8
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Jul 2022 21:28:38 +0200 (CEST)
Received: from localhost ([::1]:36638 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o8RkK-00044S-Ta
	for lists+qemu-devel@lfdr.de; Mon, 04 Jul 2022 15:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42088)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <bounce+55f5a6.0b57-qemu-devel=nongnu.org@quantumachine.net>)
 id 1o8Rj3-0003OG-5Z
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 15:27:20 -0400
Received: from m32-12.eu.mailgun.net ([141.193.32.12]:10863)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1)
 (envelope-from <bounce+55f5a6.0b57-qemu-devel=nongnu.org@quantumachine.net>)
 id 1o8Riz-0004zT-Ji
 for qemu-devel@nongnu.org; Mon, 04 Jul 2022 15:27:15 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=quantumachine.net;
 q=dns/txt; 
 s=k1; t=1656962830; x=1657171630; h=Content-Transfer-Encoding:
 Content-Type: Subject: Subject: From: From: To: To: MIME-Version: Date:
 Message-ID: Sender: Sender;
 bh=ZUUNYUF0TsjBA+juwNCwl8yqzTcowF+MV3iHG46wFAg=;
 b=MvR/fZD4N5qtFbAVmsVoupsD1tnAb65/L9HdtcKTAOVUKTSk/vgq0Cor+1SlsWfRc0Bg/RBH
 2rX5XRgv3+78b+/QmGbkN7xS0EZUuEzcckMSKw2nBLGIf2bi3Dyk4NCOjnw0rt5hVk06UJJu
 xYSknZyaylHgLcQpiLf+WjzuMf5ofO32PSOx8gwIPHbKrS5YfrgKO5Hbi5bd9M9QhGVwj0np
 8aasVvd9LBxUOJcJR5k/AGT20LTlTKJKm6eg7luBD/A9Y2T3yTUZGYs6jLagUPcxlOLTOawU
 BnzVIzFBoVnl7Nw8LzakzADb8699U2SpxG5T2wwBfLP4ZHR6Sounsw==
X-Mailgun-Sending-Ip: 141.193.32.12
X-Mailgun-Sid: WyIzN2E0YiIsICJxZW11LWRldmVsQG5vbmdudS5vcmciLCAiMGI1NyJd
Received: from mail-01.sector.int (225.pool90-165-196.dynamic.orange.es
 [90.165.196.225]) by smtp-out-n02.prod.eu-central-1.postgun.com with SMTP
 id 62c33f0ddb1e2bb61ec30f3a (version=TLS1.3,
 cipher=TLS_AES_128_GCM_SHA256); Mon, 04 Jul 2022 19:27:09 GMT
Received: from [192.168.5.136] (revealer.sector.int [192.168.5.1])
 by mail-01.sector.int (Postfix) with ESMTPA id 18C627EDDC
 for <qemu-devel@nongnu.org>; Mon,  4 Jul 2022 19:27:08 +0000 (UTC)
Message-ID: <d566d35a-6aa7-5fa4-76eb-b21ddd95ec8e@quantumachine.net>
Date: Mon, 4 Jul 2022 21:27:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; DragonFly x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Content-Language: en-US
To: qemu-devel@nongnu.org
From: Antonio Huete Jimenez <tuxillo@quantumachine.net>
Subject: Re: [PATCH v8 00/12] qtests: Check accelerator available at runtime
 via QMP 'query-accels'
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=141.193.32.12;
 envelope-from=bounce+55f5a6.0b57-qemu-devel=nongnu.org@quantumachine.net;
 helo=m32-12.eu.mailgun.net
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FAKE_REPLY_A1=0.384,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Are all these changes OK or is there anything else missing? I was 
thinking in adding a QMP 'query-nvmm' command but I got pointed to this 
thread as a better alternative to having a per-accelerator query command.

