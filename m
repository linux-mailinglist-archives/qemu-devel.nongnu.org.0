Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED1422AC06D
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Nov 2020 17:03:50 +0100 (CET)
Received: from localhost ([::1]:55094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kc9e1-0000MX-J6
	for lists+qemu-devel@lfdr.de; Mon, 09 Nov 2020 11:03:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:41728)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kc9co-0008OE-NK
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 11:02:34 -0500
Received: from mx2.suse.de ([195.135.220.15]:36694)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kc9cn-0000sb-3s
 for qemu-devel@nongnu.org; Mon, 09 Nov 2020 11:02:34 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E74EDABCC;
 Mon,  9 Nov 2020 16:02:31 +0000 (UTC)
Subject: Re: [PATCH v3 0/3] tcg-cpus: split into 3 tcg variants
To: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20201015143217.29337-1-cfontana@suse.de>
 <87ba7ac2-9859-74a6-54d7-b17d0560de98@linaro.org>
From: Claudio Fontana <cfontana@suse.de>
Message-ID: <96ec9a68-8dd5-8dc9-e3a1-bad3242809d1@suse.de>
Date: Mon, 9 Nov 2020 17:02:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <87ba7ac2-9859-74a6-54d7-b17d0560de98@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/08 21:17:38
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x (no timestamps) [generic]
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 10/19/20 5:00 PM, Richard Henderson wrote:
> On 10/15/20 7:32 AM, Claudio Fontana wrote:
>> Claudio Fontana (3):
>>   accel/tcg: split CpusAccel into three TCG variants
>>   accel/tcg: split tcg_start_vcpu_thread
>>   accel/tcg: rename tcg-cpus functions to match module name
> 
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> 
> r~
> 
> 

Hi all, just pinging about the status of this series, is it already in someone's queue?

Otherwise it's fine of course to delay it if there are concerns about tightening up the upcoming release.

Thanks,

Claudio

