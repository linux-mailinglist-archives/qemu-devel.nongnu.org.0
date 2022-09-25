Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC2D5E91BC
	for <lists+qemu-devel@lfdr.de>; Sun, 25 Sep 2022 11:01:45 +0200 (CEST)
Received: from localhost ([::1]:45322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocNWB-0001Nq-GC
	for lists+qemu-devel@lfdr.de; Sun, 25 Sep 2022 05:01:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1ocNRk-0006Bu-Iw
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 04:57:08 -0400
Received: from relay.yourmailgateway.de ([188.68.63.100]:56622
 helo=mors-relay-2502.netcup.net)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hk@zapateado.de>) id 1ocNRh-0001Jv-VT
 for qemu-devel@nongnu.org; Sun, 25 Sep 2022 04:57:07 -0400
Received: from policy02-mors.netcup.net (unknown [46.38.225.53])
 by mors-relay-2502.netcup.net (Postfix) with ESMTPS id 4Mb0BJ5xTtz4xc2;
 Sun, 25 Sep 2022 10:56:56 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at policy02-mors.netcup.net
X-Spam-Score: -2.901
Received: from mx2f6e.netcup.net (unknown [10.243.12.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by policy02-mors.netcup.net (Postfix) with ESMTPS id 4Mb0BJ2Qfdz8sZQ;
 Sun, 25 Sep 2022 10:56:56 +0200 (CEST)
Received: from [192.168.54.9] (ip-095-223-070-238.um35.pools.vodafone-ip.de
 [95.223.70.238])
 by mx2f6e.netcup.net (Postfix) with ESMTPSA id 8308560610;
 Sun, 25 Sep 2022 10:56:55 +0200 (CEST)
Authentication-Results: mx2f6e;
 spf=pass (sender IP is 95.223.70.238) smtp.mailfrom=hk@zapateado.de
 smtp.helo=[192.168.54.9]
Received-SPF: pass (mx2f6e: connection is authenticated)
Message-ID: <4069fb72-6dee-3db4-f0e5-cfcdde032f76@zapateado.de>
Date: Sun, 25 Sep 2022 10:56:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
From: Helge Konetzka <hk@zapateado.de>
Subject: [PATCH 0/2] Fix audio voices tests
To: qemu-devel <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-PPP-Message-ID: <166409621592.21228.5210803453318777482@mx2f6e.netcup.net>
X-PPP-Vhost: konetzka.de
X-Rspamd-Server: rspamd-worker-8404
X-Spamd-Result: default: False [-5.60 / 15.00]; BAYES_HAM(-5.50)[99.99%];
 MIME_GOOD(-0.10)[text/plain]; MIME_TRACE(0.00)[0:+];
 ASN(0.00)[asn:3209, ipnet:95.223.0.0/16, country:DE];
 FROM_EQ_ENVFROM(0.00)[]; RCVD_COUNT_ZERO(0.00)[0];
 MID_RHS_MATCH_FROM(0.00)[]; NEURAL_HAM(-0.00)[-0.919];
 TO_DN_ALL(0.00)[]; RCPT_COUNT_TWO(0.00)[2];
 FROM_HAS_DN(0.00)[]; TO_MATCH_ENVRCPT_ALL(0.00)[];
 ARC_NA(0.00)[]
X-Rspamd-Queue-Id: 8308560610
X-NC-CID: /y/qeJl7+8+c/fCmmyYdgcau4WY/nxHVEjwh+vKFLgTh
X-MORS-DOMAIN: zapateado.de
X-MORS-HOSTING: hosting115932
X-MORS-USER: hk
X-MORS-HopCount: 2
X-MORS-RelayClass: r2
X-MORS-RelayGroup: default
X-MORS-DKIM: hk@zapateado.de
X-MORS-Verdict: from=hk@zapateado.de dkim=0 spf=0
Received-SPF: pass client-ip=188.68.63.100; envelope-from=hk@zapateado.de;
 helo=mors-relay-2502.netcup.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>


Fix to remove obsolete warning on -audiodev ...,in.voices=0 and
improvement for better readability of audio out.voices test

Helge Konetzka (2):
   audio: fix in.voices test
   audio: improve out.voices test

  audio/audio.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.37.3

