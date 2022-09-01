Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8545A92D1
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Sep 2022 11:14:19 +0200 (CEST)
Received: from localhost ([::1]:41198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oTgHC-0004zf-Mr
	for lists+qemu-devel@lfdr.de; Thu, 01 Sep 2022 05:14:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44402)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1oTfnP-0006ca-UO
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 04:43:33 -0400
Received: from mga18.intel.com ([134.134.136.126]:18472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei4.wang@intel.com>)
 id 1oTfnN-0002vo-1k
 for qemu-devel@nongnu.org; Thu, 01 Sep 2022 04:43:31 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1662021809; x=1693557809;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=Gcn7N/oEzOBdODZF7/tNH8KhfZD0olM5v3Y55SHifgg=;
 b=mi/YXNgWzEL/TwIzTBNcDWhqaL3wLLqjitOFzrNnI+UNj/EEjnCHMW1M
 mVb0dHnMg7M1jej41G4PJEglAm12h42vACAGlVNa0T5WvQ5qI6S6Dfz4W
 lfcDkd9qChp090WmmK2BpfBw93yOutjWm4TYLZL8hqs7M/o0UjU3AS/dB
 oJwILsks3oJ6NpwFgKZHqhkdxqAO4xPtqf7mx/NyyriXiGy8CF/M8cJ+l
 JVp2maQUoG6zgdVXjqg9LJah6KCFCo5BVk8Z6bAGjc3a1zoHgXvqVzd6M
 EHwHRk+6/9BfGRgrfUk60cHJON7fjV6EbCeewz6wv0zMdL2v6ZsqdYb0j Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10456"; a="278675040"
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="278675040"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 01:43:21 -0700
X-IronPort-AV: E=Sophos;i="5.93,280,1654585200"; d="scan'208";a="645560499"
Received: from leiwang7-mobl.ccr.corp.intel.com (HELO [10.238.212.139])
 ([10.238.212.139])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Sep 2022 01:43:20 -0700
Message-ID: <2304fd90-b77a-f0ba-8979-61ac37b389b2@intel.com>
Date: Thu, 1 Sep 2022 16:43:18 +0800
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
 <6f4292c6-5f85-f3c7-7b65-e5a59dd71dbc@intel.com>
 <Yw86WjTzwNcALfVJ@redhat.com>
 <d865b7f4-b3bc-9f24-a697-6ff830637133@intel.com>
 <YxBpgeL7yJIkXV/f@redhat.com>
From: "Wang, Lei" <lei4.wang@intel.com>
In-Reply-To: <YxBpgeL7yJIkXV/f@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: permerror client-ip=134.134.136.126;
 envelope-from=lei4.wang@intel.com; helo=mga18.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
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

On 9/1/2022 4:12 PM, Daniel P. Berrangé wrote:
> On Thu, Sep 01, 2022 at 09:08:33AM +0800, Wang, Lei wrote:
>> On 8/31/2022 6:39 PM, Daniel P. Berrangé wrote:
>>> On Wed, Aug 31, 2022 at 05:18:34PM +0800, Wang, Lei wrote:
>>>>
>>>>
>>>> On 8/31/2022 4:49 PM, Daniel P. Berrangé wrote:
>>>>> On Wed, Aug 31, 2022 at 02:23:51PM +0800, Wang, Lei wrote:
>>>>>>
>>>>>> On 10/2/2015 1:30 AM, marcandre.lureau@redhat.com wrote:
>>>>>>> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>>>>>
>>>>>>> clang-format is awesome to reflow your code according to qemu coding
>>>>>>> style in an editor (in the region you modify).
>>>>>>>
>>>>>>> (note: clang-tidy should be able to add missing braces around
>>>>>>> statements, but I haven't tried it, it's quite recent)
>>>>>>>
>>>>>>> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>>>>>>> ---
>>>>>>>     .clang-format | 6 ++++++
>>>>>>>     1 file changed, 6 insertions(+)
>>>>>>>     create mode 100644 .clang-format
>>>>>>>
>>>>>>> diff --git a/.clang-format b/.clang-format
>>>>>>> new file mode 100644
>>>>>>> index 0000000..6422547
>>>>>>> --- /dev/null
>>>>>>> +++ b/.clang-format
>>>>>>> @@ -0,0 +1,6 @@
>>>>>>> +BasedOnStyle: LLVM
>>>>>>> +IndentWidth: 4
>>>>>>> +UseTab: Never
>>>>>>> +BreakBeforeBraces: Linux
>>>>>>> +AllowShortIfStatementsOnASingleLine: false
>>>>>>> +IndentCaseLabels: false
>>>>>>
>>>>>> Hi, any progress on this? I also found a gist on GitHub which can be a
>>>>>> reference: https://gist.github.com/elmarco/aa5e0b23567f46fb7f0e73cde586a0c1
>>>>>
>>>>> clang-format is a great tool and I'd highly recommend its use on
>>>>> any newly started projects, and even retrospectively on existing
>>>>> projects which are small scale. Adding it to large existing projects
>>>>> is problematic though.
>>>>>
>>>>> None of the QEMU code complies with it today and indeed there is
>>>>> quite a bit of style variance across different parts of QEMU. If
>>>>> we add this config file, and someone makes a 1 line change in a
>>>>> file, clang-format will reformat the entire file contents.
>>>>>
>>>>> The only practical way to introduce use of clang-format would be
>>>>> to do a bulk reformat of the entire codebase. That is something
>>>>> that is quite disruptive to both people with patches they're
>>>>> working on but not submitted yet, as well as people wanting to
>>>>> cherry-pick new commits back to old code branches.
>>>>>
>>>>> With regards,
>>>>> Daniel
>>>>
>>>> I think the benefits of introducing clang-format mainly for its ability to
>>>> format a code range, which means for any future contributions, we could
>>>> encourage a range format before the patch is generated. This can extensively
>>>> simplify my workflow, especially because I use the Neovim + LSP combination,
>>>> which supports a built-in function "lua vim.lsp.buf.range_formatting()".
>>>
>>> IMHO partial format conversions are even worse than full conversions,
>>> because they would make code inconsistent within the scope of a file.
>>
>> So you mean when we're adding new code in an old file, the coding style
>> should also be the old one? That sounds a bit unreasonable. I thought we are
>> shifting the coding style in an on-demand way, so we can finally achieve to
>> the new style mildly, if each time we're using the old coding style, that
>> could be impossible.
> 
> From my POV as a maintainer, the best situation would be consistency across
> the entire codebase. Since we likely won't get that though, then next best
> is consistency across the subsystem directory, and next best is consistency
> across the whole file.  Mixing code styles within a file is the worst IMHO.
> 
>>
>>>> I have no interest in reformatting the existing code and also think using it
>>>> to reformat an entire file shouldn't be encouraged, but, we can leverage
>>>> this tool to give future contributions a better experience. It's also
>>>> important to note that the kernel already has a ".clang-format" file, so I
>>>> think we can give it a try:)
>>>
>>> The mere action of introducing a .clang-format file in the root of the
>>> repository will cause some contributors' editors to automatically
>>> reformat files every time they are saved. IOW even if you don't want
>>> intend to do reformatting, that will be a net result.
>>
>> I think that depends on developer's configuration, as far as I know, format
>> on save is a feature which can be easily disabled on most of the IDE's, such
>> as VSCode.
> 
> You could disable it, but it requires each developer to know that we're
> shipping a clang-format that should not in fact be used to reformat
> code, which is rather counterintuitive. 
> 
> With regards,
> Daniel

OK, your POV makes sense too. I think we can do a tradeoff, for an example, we
can add an officially suggested ".clang-format" file in the documentation, so it
won't confuse the developers who have no interest in the clang stuffs, and it
will also be more convenient for the developers who don't want to check the
coding style manually each time before they're submitting a patch.

BR,
Lei

