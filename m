Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1AF2B8E92
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Nov 2020 10:20:04 +0100 (CET)
Received: from localhost ([::1]:60776 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kfg6l-0007An-F5
	for lists+qemu-devel@lfdr.de; Thu, 19 Nov 2020 04:20:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60594)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kfg61-0006f1-IL; Thu, 19 Nov 2020 04:19:17 -0500
Received: from szxga04-in.huawei.com ([45.249.212.190]:2798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.chen@huawei.com>)
 id 1kfg5x-000685-U4; Thu, 19 Nov 2020 04:19:17 -0500
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CcDd13323zkYv5;
 Thu, 19 Nov 2020 17:18:45 +0800 (CST)
Received: from [10.174.187.138] (10.174.187.138) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Thu, 19 Nov 2020 17:18:55 +0800
Message-ID: <5FB6387E.9090407@huawei.com>
Date: Thu, 19 Nov 2020 17:18:54 +0800
From: Alex Chen <alex.chen@huawei.com>
User-Agent: Mozilla/5.0 (Windows NT 6.2; WOW64;
 rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: =?UTF-8?B?UGhpbGlwcGUgTWF0aGlldS1EYXVkw6k=?= <philmd@redhat.com>
Subject: Re: [PATCH] display/vmware_vga: Fix bad printf format specifiers
References: <20201119030151.87393-1-alex.chen@huawei.com>
 <7eca99aa-54c9-de70-cb72-25cd6f805128@redhat.com>
In-Reply-To: <7eca99aa-54c9-de70-cb72-25cd6f805128@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.187.138]
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.190; envelope-from=alex.chen@huawei.com;
 helo=szxga04-in.huawei.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/19 04:19:06
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, zhang.zhanghailiang@huawei.com,
 quintela@redhat.com, qemu-trivial@nongnu.org, qemu-devel@nongnu.org,
 pbonzini@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Philippe,

On 2020/11/19 14:16, Philippe Mathieu-Daudé wrote:
> Hi Alex,
> 
> On 11/19/20 4:01 AM, Alex Chen wrote:
>> We should use printf format specifier "%u" instead of "%d" for
>> argument of type "unsigned int".
>>
>> Reported-by: Euler Robot <euler.robot@huawei.com>
>> Signed-off-by: Alex Chen <alex.chen@huawei.com>
>> ---
>>  hw/display/vmware_vga.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/display/vmware_vga.c b/hw/display/vmware_vga.c
>> index bef0d7d69a..f93bbe15c2 100644
>> --- a/hw/display/vmware_vga.c
>> +++ b/hw/display/vmware_vga.c
>> @@ -534,7 +534,7 @@ static inline void vmsvga_cursor_define(struct vmsvga_state_s *s,
>>  #endif
>>          break;
>>      default:
>> -        fprintf(stderr, "%s: unhandled bpp %d, using fallback cursor\n",
>> +        fprintf(stderr, "%s: unhandled bpp %u, using fallback cursor\n",
>>                  __func__, c->bpp);
> 
> The format fix is correct, but since you change that line,
> "fprintf(stderr)" is old code, nowadays we prefer get rid of it
> by using warn_report() in place (see "qemu/error-report.h").
> 

Thanks for your review, since fprintf() is used elsewhere in vmware_vga.c,
I will send a new patch to replace all fprintf() with warn_report() in vmware_vga.c.
In addition, is there better to use error_report() instead of warn_report() here?

Thanks,
Alex



