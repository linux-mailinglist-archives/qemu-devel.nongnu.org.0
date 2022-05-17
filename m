Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B39CB52A064
	for <lists+qemu-devel@lfdr.de>; Tue, 17 May 2022 13:27:28 +0200 (CEST)
Received: from localhost ([::1]:39384 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nqvMN-0000I1-F6
	for lists+qemu-devel@lfdr.de; Tue, 17 May 2022 07:27:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38052)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nqvHQ-000605-Il; Tue, 17 May 2022 07:22:21 -0400
Received: from smtp54.i.mail.ru ([217.69.128.34]:51966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1nqvHN-00007D-Rs; Tue, 17 May 2022 07:22:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=m/k9CWhS016/C+o9Hrh0I3MrK3ebKHh2jD3jFwF6nYE=; 
 t=1652786537;x=1653391937; 
 b=w0UDIWhC9fp0c+zzjJKkV3HcG1pq6TcZ997HqhPR/0H6hJ/ftN7km0YKtbskggpfPFZbykljpp/TBjetQVp+FzVYtzwQk+snKc220XFKU4FZwxPc6NcqsZk8+z+dvDCC/6U2p3pnnapYBcFcIFFNpG+jjm55xkfBEV63+48PI8/L2AxHyRFvpVNA0JIOsv/TlatZNJBvAC7pq1SeNgt1TvZzCiIL+WuYVbZzdwlliVNMjqu93gjdHY8WzsmDZvDaPeL2KffDb1WNfHlZnzaUIR9KW6HQnpuJ3YIXgxM0mlsua/jgzcXdcl0crMQiXKTFmhdjUhT+kDa3xM0OzbhI3A==;
Received: by smtp54.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1nqvHK-0007t1-4g; Tue, 17 May 2022 14:22:14 +0300
Message-ID: <cc6d2306-9578-19e2-adb8-9eb29d642779@mail.ru>
Date: Tue, 17 May 2022 14:22:13 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [RFC 0/2] introduce QEMUMachind.cmd()
Content-Language: en-US
To: John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>
Cc: Qemu-block <qemu-block@nongnu.org>, qemu-devel <qemu-devel@nongnu.org>,
 Hanna Reitz <hreitz@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Beraldo Leal <bleal@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 vsementsov@openvz.org
References: <20220408170214.45585-1-vsementsov@openvz.org>
 <CAFn=p-Zn-L+vBF34v1BNK9i8VuSPH0J9D9Vx0+zLjip0iD2JqQ@mail.gmail.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <CAFn=p-Zn-L+vBF34v1BNK9i8VuSPH0J9D9Vx0+zLjip0iD2JqQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Authentication-Results: smtp54.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: EEAE043A70213CC8
X-77F55803: 4F1203BC0FB41BD9F33B3806BF114D159E7BD6746107077164F3C96AD71A0548182A05F5380850404C228DA9ACA6FE27237FDBFDFBAC671A14FFBC18FA5747E6E5F73BBF2FDF72B4C40BBD1A0C9ED416
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE75DF2B1F23425CAE5EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F79006379F6495389D012EA98638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D8876F3AC6EF3D637131F0479908FF4D5C6F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE7C26CFBAC0749D213D2E47CDBA5A96583C09775C1D3CA48CFE3800B164E348C91117882F4460429724CE54428C33FAD30A8DF7F3B2552694AC26CFBAC0749D213D2E47CDBA5A9658378DA827A17800CE77FFCE1C639F4728C9FA2833FD35BB23DF004C90652538430302FCEF25BFAB3454AD6D5ED66289B5278DA827A17800CE7E7BE9ADC23C0FA30D32BA5DBAC0009BE395957E7521B51C20BC6067A898B09E4090A508E0FED6299176DF2183F8FC7C05BA2E4CC9113A626CD04E86FAF290E2D7E9C4E3C761E06A71DD303D21008E29813377AFFFEAFD269A417C69337E82CC2E827F84554CEF50127C277FBC8AE2E8BA83251EDC214901ED5E8D9A59859A8B6B4612C9E9B341BF4089D37D7C0E48F6C5571747095F342E88FB05168BE4CE3AF
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A51C66E934C81D7B974DAA3FFAE70CEE68DA6276C53346E7E3D59269BC5F550898D99A6476B3ADF6B4886A5961035A09600383DAD389E261318FB05168BE4CE3AF
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3480A9008907CB2FD052A9C437E9F2BF22961E146AD9C793899E6979FB7FD38E6DDE1A3ED70D059D0C1D7E09C32AA3244C9A38D0F2A907ADAECEB2A7EFCD7398417C0C08F7987826B927AC49D2B05FCCD8
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2bioj3fsA429394NPVT4RVTct5g==
X-Mailru-Sender: 6C3E74F07C41AE9425C26D04B7325D44DC1560E079E4784285A3F4829087E4806C3CB3B31809DA4FE6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=217.69.128.34;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp54.i.mail.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

27.04.2022 22:29, John Snow wrote:
> On Fri, Apr 8, 2022 at 1:02 PM Vladimir Sementsov-Ogievskiy
> <vladimir.sementsov-ogievskiy@openvz.org> wrote:
>>
>> Hi all!
>>
>> I always dreamed about getting rid of pattern
>>
>>      result = self.vm.qmp(...)
>>      self.assert_qmp(result, 'return', {})
>>
>> Here is a suggestion to switch to
>>
>>      self.vm.cmd(...)
>>
>> pattern instead.
> 
> Yeah, I am absolutely on board for this!
> 
>>
>> I'm not sure we really want to update so many tests. May be just commit
>> patch 01, and use new interface for new code. On the other hand, old
>> code always used as an example to write the new one.
> 
> I think it's worth updating all the old tests ... especially if you've
> already done it here. We could even do something like what I did with
> qemu_img() and qemu_io() and have the uncaught exception print a bunch
> of information to the screen to help make it extremely obvious as to
> what failed and why.
> 
> If you can rebase this, I'd love to review it more carefully - it
> aligns with my own selfish goals and interests :) The Python branch
> was merged recently and so we should be all set.
> 
>>
>> The series is based on John's python branch.
>>
>> Vladimir Sementsov-Ogievskiy (2):
>>    python/machine.py: upgrade vm.command() method
>>    iotests: use vm.cmd() instead of vm.qmp() where appropriate
>>
>>   python/qemu/machine/machine.py                |  16 +-
>>   tests/qemu-iotests/030                        | 168 +++----
>>   tests/qemu-iotests/040                        | 167 +++---
>>   tests/qemu-iotests/041                        | 474 ++++++++----------
>>   tests/qemu-iotests/045                        |  15 +-
>>   tests/qemu-iotests/055                        |  61 +--
>>   tests/qemu-iotests/056                        |  23 +-
>>   tests/qemu-iotests/093                        |  41 +-
>>   tests/qemu-iotests/118                        | 221 ++++----
>>   tests/qemu-iotests/124                        |  69 ++-
>>   tests/qemu-iotests/129                        |  13 +-
>>   tests/qemu-iotests/132                        |   5 +-
>>   tests/qemu-iotests/139                        |  43 +-
>>   tests/qemu-iotests/147                        |  30 +-
>>   tests/qemu-iotests/151                        |  40 +-
>>   tests/qemu-iotests/155                        |  53 +-
>>   tests/qemu-iotests/165                        |   7 +-
>>   tests/qemu-iotests/196                        |   3 +-
>>   tests/qemu-iotests/205                        |   6 +-
>>   tests/qemu-iotests/245                        | 245 ++++-----
>>   tests/qemu-iotests/256                        |  34 +-
>>   tests/qemu-iotests/257                        |  36 +-
>>   tests/qemu-iotests/264                        |  31 +-
>>   tests/qemu-iotests/281                        |  21 +-
>>   tests/qemu-iotests/295                        |  27 +-
>>   tests/qemu-iotests/296                        |  14 +-
>>   tests/qemu-iotests/298                        |  13 +-
>>   tests/qemu-iotests/300                        |  50 +-
>>   tests/qemu-iotests/iotests.py                 |   6 +-
>>   .../tests/migrate-bitmaps-postcopy-test       |  31 +-
>>   tests/qemu-iotests/tests/migrate-bitmaps-test |  37 +-
>>   .../qemu-iotests/tests/migrate-during-backup  |  40 +-
>>   .../qemu-iotests/tests/migration-permissions  |   9 +-
>>   tests/qemu-iotests/tests/mirror-top-perms     |  15 +-
>>   34 files changed, 821 insertions(+), 1243 deletions(-)
> 
> Is there anything missing, to your knowledge?
> 

Don't remember) I hope, I'd write in commit message, if there was something :) Will rebase soon.

-- 
Best regards,
Vladimir

