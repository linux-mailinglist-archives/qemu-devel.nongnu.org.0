Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A4A3702875
	for <lists+qemu-devel@lfdr.de>; Mon, 15 May 2023 11:27:30 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyUSs-0003tN-Nn; Mon, 15 May 2023 05:25:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pyUSq-0003su-M6
 for qemu-devel@nongnu.org; Mon, 15 May 2023 05:25:56 -0400
Received: from rev.ng ([5.9.113.41])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1pyUSp-0002fK-5n
 for qemu-devel@nongnu.org; Mon, 15 May 2023 05:25:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:
 Cc:To:Subject:Reply-To:MIME-Version:Date:Message-ID:Sender:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oUgve3nguaoCoB2TjZIf1FMmucuGlaPYtydwOM378b8=; b=MVDABxUJsidjaO7uXV/P/Spvip
 +dEV7N2HR3s8wYR3J5tvd02eTqbdAIwmsShOkicfUgRn9PQmA+jlaJrPY7/KJNo5wBFATNXNe8E/i
 uyokfPFKfdZVxwA5XsG7F8zg0Kf+NVkpZDt8KXBgQfN2DMz9uy763BLGk3GViU3g0UFA=;
Message-ID: <24e105f9-6689-cf18-9d17-0235ed19ec45@rev.ng>
Date: Mon, 15 May 2023 11:25:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PULL 00/44] Hexagon update
To: Richard Henderson <richard.henderson@linaro.org>,
 Taylor Simpson <tsimpson@quicinc.com>, qemu-devel@nongnu.org
Cc: philmd@linaro.org, peter.maydell@linaro.org, bcain@quicinc.com,
 quic_mathbern@quicinc.com, stefanha@redhat.com, ale@rev.ng,
 quic_mliebel@quicinc.com
References: <20230512214706.946068-1-tsimpson@quicinc.com>
 <bb4d8b79-6616-44bf-0446-fcabdd85f248@linaro.org>
Content-Language: en-US
Organization: rev.ng
In-Reply-To: <bb4d8b79-6616-44bf-0446-fcabdd85f248@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.93,
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
Reply-to:  anjo@rev.ng
X-ACL-Warn: ,  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org


On 5/13/23 12:22, Richard Henderson wrote:
> On 5/12/23 22:46, Taylor Simpson wrote:
>> The following changes since commit 
>> 278238505d28d292927bff7683f39fb4fbca7fd1:
>>
>>    Merge tag 'pull-tcg-20230511-2' ofhttps://gitlab.com/rth7680/qemu  
>> into staging (2023-05-11 11:44:23 +0100)
>>
>> are available in the Git repository at:
>>
>>    https://github.com/quic/qemu  tags/pull-hex-20230512-1
>>
>> for you to fetch changes up to a1c042e1cc4c1da209f7c3e04aec5e622c7bcdc0:
>>
>>    Hexagon (linux-user/hexagon): handle breakpoints (2023-05-12 
>> 14:43:14 -0700)
>>
>> ----------------------------------------------------------------
>> This PR can be broken down into the following parts
>> - Add support for new architecture versions v68/v69/v71/v73
>> - Short-circuit writes to temporaries when packet semantics permit this
>> - Move bookkeeping items from CPUHexagonState to DisasContext
>> - Correct '-cpu help' output and handling of unknown Hexagon versions
>> - Enable LLDB debugging
>> - Miscellaneous fixes and improvements
>
> Please always test 32-bit host.  You have a CI failure:
>
> https://gitlab.com/qemu-project/qemu/-/jobs/4279656830#L873
>
> /builds/qemu-project/qemu/target/hexagon/idef-parser/idef-parser.lex: 
> In function 'yylex':
> /builds/qemu-project/qemu/target/hexagon/idef-parser/idef-parser.lex:435:38: 
> error: format '%lx' expects argument of type 'long unsigned int', but 
> argument 2 has type 'int64_t' {aka 'long long int'} [-Werror=format=]
>   435 |                               printf("value = 0x%lx\n", value);
>       |                                      ^~~~~~~~~~~~~~~~~ ~~~~~
>       |                                                         |
>       | int64_t {aka long long int}
>
>
>
> r~
>
Agh, right! Let's just remove this printf, we're not printing anything 
on failing to
lex hex values, so why do it for decimal values.

-- 
Anton Johansson,
rev.ng Labs Srl.


