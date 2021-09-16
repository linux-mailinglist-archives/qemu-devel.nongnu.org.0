Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1554B40D797
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Sep 2021 12:40:43 +0200 (CEST)
Received: from localhost ([::1]:40946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQoor-0003no-QI
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 06:40:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48228)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQom2-0000wv-Pl; Thu, 16 Sep 2021 06:37:46 -0400
Received: from mout.kundenserver.de ([212.227.126.133]:53175)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQom1-0003wY-7f; Thu, 16 Sep 2021 06:37:46 -0400
Received: from [192.168.100.1] ([82.142.27.6]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1N62mG-1my2Rr1Dqq-016MId; Thu, 16 Sep 2021 11:58:23 +0200
Subject: Re: [PATCH] hw/vfio: Fix typo in comments
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Cai Huoqing <caihuoqing@baidu.com>, alex.williamson@redhat.com
References: <20210730012613.2198-1-caihuoqing@baidu.com>
 <ebb42d43-f3b8-f55c-b0d5-55e60a881747@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <ea4bfccc-1293-dad2-0209-91d4b39188a2@vivier.eu>
Date: Thu, 16 Sep 2021 11:58:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <ebb42d43-f3b8-f55c-b0d5-55e60a881747@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:H2Nt1+ucJJE7WvXeLOZujm+jIb9uTJBBuRnzBGQhOXsNt9aFZhd
 f+zghGPBfz5Fp0UK5hfiJe0MuGVnlaA0TazCJ11WJuK6Mc8SIgAggp1/xxSyVNrs8cfzHAX
 VYwLF0HpqHZX6eGZmmnKOg/oNVLcT0EA7wXLcDVhOT7Tiqh9cVHudCwhYmoAlU342MvNZ7f
 3HtlKY0amklxdXB5zcbzQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:rx9kGhBWkuo=:TL5n5rJO7TVx7yjdEtR5Dr
 ZGq+77ZLua+bk6P6ul3PHlD5FzZvMhES+SDaxz2aXhiATulNEMO+GxRvcMuOo/GX3QhYM2EVQ
 KpknfsFEwlDU30q80mqp77W6J7iqkh17/EJ73IJrJmjQV5m4fjbWj5UbMNk6z3DRi6WqZH5mW
 14VuX9eIkF75NQ49okncuH3Y5DjzZfKc+sJUh4eyjjXzQ0DHIc63I8JnVlCThivQC8QfNPKhJ
 ofrOlQcd40K2kSQus3T9fnUEiaO8aiKjI/CwqL8bSLC1TC8awnsC+O1AHfBOZuJ89tgIY4n/f
 Ebt3tJX1oI5uVH02QgnbTq3N6wg0tex+ZtlpzHBfvoAerXgkyrFF9zzVAl+IJerpqaLpDJ7lR
 THbCokPqVQcJyTvl7dAqAJ80iDKI9ajLjxj0aZfoNIjho62jQ7QHI3qnOE9G+JEwo+etuau55
 T+Jq/4SM/7daCsvMTm4jl1pXy3cyPkxCLEymb/bJEX16UsE7mHRyrhzjNTF5XPYTPiVLOggFA
 Z1d4JzXX6UcEAM10f9CcV3wkfkyiYBgRzrnOSDVMJKhOzXMFifWUMdcp53YCydDmwXfKrEd9H
 rMDjeTqu5yWJsSYUNRgrtmxAUUVWcmsoPnI5vr7pgY7EY8mu5tFU6ZURRAYBPBhXOSyZVPdty
 xRfih2wglmxS4wVXUF2pHb34uSlwXkvAziEhFauV/XpDbl+1NNmHPL6kTYeoAAAKm3PeDhcpv
 YjRY50Jen6fOmbpE1cbgGl0X0u6eJR+spWPSyoRCL+4cVWoYO/Axbcjia87nBllYyAy2WLZ2I
 wl5bleb
Received-SPF: none client-ip=212.227.126.133; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.698,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Le 30/07/2021 à 13:26, Philippe Mathieu-Daudé a écrit :
> On 7/30/21 3:26 AM, Cai Huoqing wrote:
>> Fix typo in comments:
>> *programatically  ==> programmatically
>> *disconecting  ==> disconnecting
>> *mulitple  ==> multiple
>> *timout  ==> timeout
>> *regsiter  ==> register
>> *forumula  ==> formula
>>
>> Signed-off-by: Cai Huoqing <caihuoqing@baidu.com>
>> ---
>>  hw/vfio/igd.c        | 2 +-
>>  hw/vfio/pci-quirks.c | 2 +-
>>  hw/vfio/pci.c        | 6 +++---
>>  hw/vfio/platform.c   | 2 +-
>>  4 files changed, 6 insertions(+), 6 deletions(-)
> 
> Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> 
> 


Applied to my trivial-patches branch.

Thanks,
Laurent

