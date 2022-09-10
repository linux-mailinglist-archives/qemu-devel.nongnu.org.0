Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A88B95B460C
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Sep 2022 13:30:03 +0200 (CEST)
Received: from localhost ([::1]:34720 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oWygU-0003X7-CP
	for lists+qemu-devel@lfdr.de; Sat, 10 Sep 2022 07:30:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56150)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oWyeT-00028n-Sc
 for qemu-devel@nongnu.org; Sat, 10 Sep 2022 07:27:57 -0400
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:60384)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1oWyeO-0004dI-Qc
 for qemu-devel@nongnu.org; Sat, 10 Sep 2022 07:27:55 -0400
Received: from iva4-f06c35e68a0a.qloud-c.yandex.net
 (iva4-f06c35e68a0a.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:152e:0:640:f06c:35e6])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id D88052E0A2D;
 Sat, 10 Sep 2022 14:27:44 +0300 (MSK)
Received: from [IPV6:2a02:6b8:b081:1329::1:2d] (unknown
 [2a02:6b8:b081:1329::1:2d])
 by iva4-f06c35e68a0a.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 dyGUdihpuD-RgPidcwl; Sat, 10 Sep 2022 14:27:44 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
Precedence: bulk
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1662809264; bh=hGUz0g8DAgky1svnzCBIVNmCMWrUnYq2So6qSKANjQs=;
 h=From:In-Reply-To:Cc:Date:References:To:Subject:Message-ID;
 b=LRpTHENFhW2GoN4T6PaKV9oCSCIlmrPvhSn44RwasI3km4R4lT9g1lkV0Qv3gNwTp
 IRpB0WOAZKSmjj9AkLEw1FElIQ1/kS5tubrcnTbFhtl1n6MauaXe/oP6WKP7LIua95
 xbi9WbCOh5163i5815wSbZPsL9ZguoUovPYYrE4U=
Authentication-Results: iva4-f06c35e68a0a.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Message-ID: <d226b1e0-8a4f-1f37-314e-6808bb1efe87@yandex-team.ru>
Date: Sat, 10 Sep 2022 14:27:42 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH 2/4] qmp: add dump machine type compatible properties
Content-Language: en-US
To: Maksim Davydov <davydov-max@yandex-team.ru>, qemu-devel@nongnu.org
Cc: yc-core@yandex-team.ru, pbonzini@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, f4bug@amsat.org,
 wangyanan55@huawei.com, armbru@redhat.com, alxndr@bu.edu, bsd@redhat.com,
 stefanha@redhat.com, thuth@redhat.com, darren.kenny@oracle.com,
 Qiuhao.Li@outlook.com, lvivier@redhat.com, jsnow@redhat.com,
 crosa@redhat.com, bleal@redhat.com
References: <20220908103650.9518-1-davydov-max@yandex-team.ru>
 <20220908103650.9518-3-davydov-max@yandex-team.ru>
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
In-Reply-To: <20220908103650.9518-3-davydov-max@yandex-team.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.214,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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

On 9/8/22 13:36, Maksim Davydov wrote:
> To control that creating new machine type doesn't affect the previous
> types (their compat_props) and to check complex compat_props inheritance
> we need qmp command to print machine type compatible properties.
> This patch adds the ability to get list of all the compat_props of the
> corresponding supported machines for their comparison via new optional
> argument of "query-machines" command.
> 
> Signed-off-by: Maksim Davydov<davydov-max@yandex-team.ru>


Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>


-- 
Best regards,
Vladimir

