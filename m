Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A0635344BE
	for <lists+qemu-devel@lfdr.de>; Wed, 25 May 2022 22:16:47 +0200 (CEST)
Received: from localhost ([::1]:39830 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntxQz-0006yT-Un
	for lists+qemu-devel@lfdr.de; Wed, 25 May 2022 16:16:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1ntxOu-0004zY-Ra
 for qemu-devel@nongnu.org; Wed, 25 May 2022 16:14:37 -0400
Received: from rev.ng ([5.9.113.41]:49465)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1ntxOs-0001tj-Sk
 for qemu-devel@nongnu.org; Wed, 25 May 2022 16:14:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9c8MYbAl8BD4FagKZU0UtwicFmtELapTTNOmpu+ryhY=; b=knd0Mss9Bdd1+hSJrFgObS0dlT
 WWgQO7wyczJNsvly5GM0wImzHoMY4xi/tZePbOhfkmY7XYZWXAaYu1GmzcAR1Di69vcwUt3qKhs6S
 vvSuFqflbYF4FXgj/VxQ+e2Vz3C1XaNSLnkaZOXUzXzDW/BJsemsyRp2GHXrn0IsfJxs=;
Message-ID: <67c27109-2bb4-7147-ab7d-215b6b03b4cf@rev.ng>
Date: Wed, 25 May 2022 22:14:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v9 08/12] target/hexagon: import flex/bison to docker files
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Cc: ale@rev.ng, tsimpson@quicinc.com, bcain@quicinc.com,
 mlambert@quicinc.com, babush@rev.ng, nizzo@rev.ng, qemu-devel@nongnu.org,
 =?UTF-8?Q?Daniel_P=2eBerrang=c3=a9?= <berrange@redhat.com>
References: <a430eb4a-20db-8c04-e9ce-0d3e1d4c3c46@linaro.org>
 <87czg11s8w.fsf@linaro.org>
Organization: rev.ng
In-Reply-To: <87czg11s8w.fsf@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Reply-to:  anjo@rev.ng
X-ACL-Warn: ,  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>

On 5/25/22 18:38, Alex Bennée wrote:

> Richard Henderson <richard.henderson@linaro.org> writes:
>
>> On 5/25/22 05:29, Anton Johansson wrote:
>>> For clarity's sake, here are the exact steps taken to produce this patch:
>>>       1. Update QEMU's libvirt-ci to the commit
>>> https://gitlab.com/libvirt/libvirt-ci/-/commit/43927ff508e8ecb1ac225dabbc95b37c890db917
>>>          which adds flex/bison, and a native glib2 (required since
>>> idef-parser
>>>          is a build-time tool.)
>> This must be split out -- submodule updates should be a patch by
>> themselves.  Otherwise it can look like unintentional rebase breakage
>> (which, sadly, happens more often than legitimate submodule updates).
>>
>>>       2. Copy in new `tests/lcitool/projects/qemu.yml` from `libvirt-ci`
>>>       3. run `tests/lcitool/refresh` to generate new docker/cirrus
>>> files
>> And, yes, having one patch that's simply auto-generated is helpful.
> To quote danpb:
>
>     danpb: should our tests/lcitool/projects/qemu.yml match the one in
>        the lcitool repo or are they different use cases?
>    <danpb> the one in libvirt-ci.git should be deleted really
>    <danpb> the one in qemu.git is the source of truth
>
> so please just update the qemu.git qemu.yml for just what you need for
> flex/bison without bringing in all the other (stale?) stuff.
>
>
>>
>> r~
>
I see, thanks!

Just to make sure I understood you correctly, I should:

     1. Make a standalone patch that updates libvirt-ci and runs
         the refresh script, in case any package mappings changed

     2. Change this patch to add flex/bison to QEMU's qemu.yml,
         and run refresh

-- 
Anton Johansson,
rev.ng Labs Srl.


