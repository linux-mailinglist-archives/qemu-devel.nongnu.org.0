Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE7DF5A7A0C
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Aug 2022 11:21:24 +0200 (CEST)
Received: from localhost ([::1]:49042 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTJuV-0007ZJ-K7
	for lists+qemu-devel@lfdr.de; Wed, 31 Aug 2022 05:21:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1oTJrt-0005pR-Tu
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 05:18:42 -0400
Received: from mga01.intel.com ([192.55.52.88]:56118)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1oTJrr-0004lD-C7
 for qemu-devel@nongnu.org; Wed, 31 Aug 2022 05:18:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1661937519; x=1693473519;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Tl53ZsaaI85qSLvVD6xYWCQaX/sbT5dxWuHKCNvcoWs=;
 b=gT04i0iYIW6TdViCrItyRr+znbZ8DuQcVmoL4VW6KFwbGjCjU8idDy+p
 aAwpThuk6+KaeI0WlfWxvjUc0iKihQIjfHNy2QaacxwhgUyKhWBJ/QcWe
 nnSeuctpOG8dGOqLvwossFfdjv6hHNlrXgwAJZzK2tr6Dth3pZqw+6hSJ
 s5BV8kIeIU/Hk8okZIHPn9rwXoROyPqPxOc8uEM4elj1hUJqFo1feyYua
 aTrxPY1jOryAMNUVyZUz5mAl4ylPBT80NGrfozSKc6QZxHLMHbmvv/HWg
 Vtqb0K/a8+kg/47hMH6bjgQOsGHWdUoGyLUY+1dHRdQA3DXjVklH41f6N A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10455"; a="321548671"
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; d="scan'208";a="321548671"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 02:18:37 -0700
X-IronPort-AV: E=Sophos;i="5.93,277,1654585200"; d="scan'208";a="673275500"
Received: from leiwang7-mobl.ccr.corp.intel.com (HELO [10.238.4.77])
 ([10.238.4.77])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Aug 2022 02:18:36 -0700
Message-ID: <6f4292c6-5f85-f3c7-7b65-e5a59dd71dbc@intel.com>
Date: Wed, 31 Aug 2022 17:18:34 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Firefox/91.0 Thunderbird/91.13.0
Subject: Re: [Qemu-devel] [RFC PATCH] Add qemu .clang-format
Content-Language: en-US
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org
References: <1443720628-16512-1-git-send-email-marcandre.lureau@redhat.com>
 <9cb1a173-c703-1787-90e1-4668710b323b@intel.com>
 <Yw8gpOzspxrcE8rE@redhat.com>
From: "Wang, Lei" <lei4.wang@intel.com>
In-Reply-To: <Yw8gpOzspxrcE8rE@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: permerror client-ip=192.55.52.88;
 envelope-from=lei4.wang@intel.com; helo=mga01.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_PERMERROR=0.01 autolearn=ham autolearn_force=no
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



On 8/31/2022 4:49 PM, Daniel P. Berrangé wrote:
> On Wed, Aug 31, 2022 at 02:23:51PM +0800, Wang, Lei wrote:
>>
>> On 10/2/2015 1:30 AM, marcandre.lureau@redhat.com wrote:
>>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>
>>> clang-format is awesome to reflow your code according to qemu coding
>>> style in an editor (in the region you modify).
>>>
>>> (note: clang-tidy should be able to add missing braces around
>>> statements, but I haven't tried it, it's quite recent)
>>>
>>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>> ---
>>>    .clang-format | 6 ++++++
>>>    1 file changed, 6 insertions(+)
>>>    create mode 100644 .clang-format
>>>
>>> diff --git a/.clang-format b/.clang-format
>>> new file mode 100644
>>> index 0000000..6422547
>>> --- /dev/null
>>> +++ b/.clang-format
>>> @@ -0,0 +1,6 @@
>>> +BasedOnStyle: LLVM
>>> +IndentWidth: 4
>>> +UseTab: Never
>>> +BreakBeforeBraces: Linux
>>> +AllowShortIfStatementsOnASingleLine: false
>>> +IndentCaseLabels: false
>>
>> Hi, any progress on this? I also found a gist on GitHub which can be a
>> reference: https://gist.github.com/elmarco/aa5e0b23567f46fb7f0e73cde586a0c1
> 
> clang-format is a great tool and I'd highly recommend its use on
> any newly started projects, and even retrospectively on existing
> projects which are small scale. Adding it to large existing projects
> is problematic though.
> 
> None of the QEMU code complies with it today and indeed there is
> quite a bit of style variance across different parts of QEMU. If
> we add this config file, and someone makes a 1 line change in a
> file, clang-format will reformat the entire file contents.
> 
> The only practical way to introduce use of clang-format would be
> to do a bulk reformat of the entire codebase. That is something
> that is quite disruptive to both people with patches they're
> working on but not submitted yet, as well as people wanting to
> cherry-pick new commits back to old code branches.
> 
> With regards,
> Daniel

I think the benefits of introducing clang-format mainly for its ability 
to format a code range, which means for any future contributions, we 
could encourage a range format before the patch is generated. This can 
extensively simplify my workflow, especially because I use the Neovim + 
LSP combination, which supports a built-in function "lua 
vim.lsp.buf.range_formatting()".

I have no interest in reformatting the existing code and also think 
using it to reformat an entire file shouldn't be encouraged, but, we can 
leverage this tool to give future contributions a better experience. 
It's also important to note that the kernel already has a 
".clang-format" file, so I think we can give it a try:)

BR,
Lei

