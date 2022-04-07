Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48D574F7D5C
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Apr 2022 12:57:44 +0200 (CEST)
Received: from localhost ([::1]:57640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ncPpe-0001lV-VE
	for lists+qemu-devel@lfdr.de; Thu, 07 Apr 2022 06:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47160)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1ncPn4-0000oq-RA; Thu, 07 Apr 2022 06:55:03 -0400
Received: from smtp54.i.mail.ru ([217.69.128.34]:38930)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <v.sementsov-og@mail.ru>)
 id 1ncPn2-0005qi-EP; Thu, 07 Apr 2022 06:55:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
 s=mail4; 
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:From:Subject:Content-Type:Content-Transfer-Encoding:To:Cc;
 bh=xtdvpKLsuKDKfVxB6TxxQog/E/AWVno5Mp21gIqGKdo=; 
 t=1649328900;x=1649934300; 
 b=aDHd4c2QBtJudKOd05HseI8lnv+ysEe3lr22pOG4sXaUbqKHCcIPTmdvNX7OYaEj0Zy3IWVSL/nHm2HUeO2ENEB27/cN8IxCZxGy4JE2qr0VqSLqq4ymmwKw7CfBGW2QslHAgkg7WKNp+bLKxiwag2K4npcdXcGXa9+SKsh6Bi7TEwLQ/cZr8zROyhb9xoOGPZMy5hmKfMDoqxD3sc00BgCEd50Ebo0U1rv3FgDHSicg7nidYVYQxPg/TWrK1szeI5qcNgWqjsMuGMGMefEgsBtL+Dvi6c7/1EEXe5oFAe1ItMRoQok1yt/bKAMrOKCQjWT1qsgf0yidcpd2xT+1Sg==;
Received: by smtp54.i.mail.ru with esmtpa (envelope-from
 <v.sementsov-og@mail.ru>)
 id 1ncPmn-00029t-Ry; Thu, 07 Apr 2022 13:54:46 +0300
Message-ID: <45594a13-ec80-7329-c730-bc89fdafb581@mail.ru>
Date: Thu, 7 Apr 2022 13:54:45 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v3 7/7] iotests: copy-before-write: add cases for
 cbw-timeout option
Content-Language: en-US
To: Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vladimir.sementsov-ogievskiy@openvz.org>,
 qemu-block@nongnu.org
Cc: qemu-devel@nongnu.org, eblake@redhat.com, armbru@redhat.com,
 stefanha@redhat.com, kwolf@redhat.com, jsnow@redhat.com,
 vsementsov@openvz.org
References: <20220406180801.374844-1-vsementsov@openvz.org>
 <20220406180801.374844-8-vsementsov@openvz.org>
 <ef6800dd-d041-0169-6f07-cab3c3dc4045@redhat.com>
From: Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
In-Reply-To: <ef6800dd-d041-0169-6f07-cab3c3dc4045@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp54.i.mail.ru;
 auth=pass smtp.auth=v.sementsov-og@mail.ru
 smtp.mailfrom=v.sementsov-og@mail.ru
X-4EC0790: 10
X-7564579A: 646B95376F6C166E
X-77F55803: 4F1203BC0FB41BD90FA8EB11E8F64C56FC2083200DA4A48F3140D195D35BAA8B182A05F538085040C4F619C7711082C5A37D463B17ABE806072FD03D828FA89D80DBD9B9A51F9743
X-7FA49CB5: FF5795518A3D127A4AD6D5ED66289B5278DA827A17800CE7705F446BE41E38A1EA1F7E6F0F101C67BD4B6F7A4D31EC0BCC500DACC3FED6E28638F802B75D45FF8AA50765F790063781BF90BB6B3E56078638F802B75D45FF36EB9D2243A4F8B5A6FCA7DBDB1FC311F39EFFDF887939037866D6147AF826D862AE95EAB54D419A89FA4B15BF74DBD96F9789CCF6C18C3F8528715B7D10C86878DA827A17800CE775D5B3C4A8F9BEC69FA2833FD35BB23D9E625A9149C048EE33AC447995A7AD182CC0D3CB04F14752D2E47CDBA5A96583BD4B6F7A4D31EC0BC014FD901B82EE079FA2833FD35BB23D27C277FBC8AE2E8BECADA55FE5B58BB7A471835C12D1D977C4224003CC836476EB9C4185024447017B076A6E789B0E975F5C1EE8F4F765FC16C62498D88CD4093AA81AA40904B5D9CF19DD082D7633A078D18283394535A93AA81AA40904B5D98AA50765F7900637458D1332A1BF835ED81D268191BDAD3D698AB9A7B718F8C4D1B931868CE1C5781A620F70A64A45A98AA50765F79006372E808ACE2090B5E1725E5C173C3A84C3C5EA940A35A165FF2DBA43225CD8A89F10D407B19AF7F750262FEC7FBD7D1F5BB5C8C57E37DE458BEDA766A37F9254B7
X-8FC586DF: 6EFBBC1D9D64D975
X-C1DE0DAB: 0D63561A33F958A525F4CEB3CE3631E3C1BAC54EC6F125E83FFB7827C5F9FC07D59269BC5F550898D99A6476B3ADF6B47008B74DF8BB9EF7333BD3B22AA88B938A852937E12ACA75B66DA94168EAEAEF8E8E86DC7131B365E7726E8460B7C23C
X-C8649E89: 4E36BF7865823D7055A7F0CF078B5EC49A30900B95165D3416EA6E382A5BB17678EB40701375F57243DFCC7BCD8AB3712BC739D58EE95031DEC6AFC7EAE83E4C1D7E09C32AA3244C5ED35297289B1C2662B48A529F717E79D08D48398F32B4A6ED98077840A144B9
X-D57D3AED: 3ZO7eAau8CL7WIMRKs4sN3D3tLDjz0dLbV79QFUyzQ2Ujvy7cMT6pYYqY16iZVKkSc3dCLJ7zSJH7+u4VD18S7Vl4ZUrpaVfd2+vE6kuoey4m4VkSEu530nj6fImhcD4MUrOEAnl0W826KZ9Q+tr5ycPtXkTV4k65bRjmOUUP8cvGozZ33TWg5HZplvhhXbhDGzqmQDTd6OAevLeAnq3Ra9uf7zvY2zzsIhlcp/Y7m53TZgf2aB4JOg4gkr2biojzDs61/8Pi1G4FMgVPoxiJA==
X-Mailru-Sender: 6C3E74F07C41AE946BC06F16BD5C3913618E80EAA0E0AB309402905A3E22854047D9809064482282E6462B2528CDCABCE234FDC7CE4030BEBA6D275AA6409EB3BDC3C9FB484E02823A35ECB215E68A28E3F6503ABEB32C155FEEDEB644C299C0ED14614B50AE0675
X-Mras: Ok
Received-SPF: pass client-ip=217.69.128.34;
 envelope-from=v.sementsov-og@mail.ru; helo=smtp54.i.mail.ru
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_BL=0.001,
 RCVD_IN_MSPIKE_L3=0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

07.04.2022 12:19, Hanna Reitz wrote:
> On 06.04.22 20:08, Vladimir Sementsov-Ogievskiy wrote:
>> Add two simple test-cases: timeout failure with
>> break-snapshot-on-cbw-error behavior and similar with
>> break-guest-write-on-cbw-error behavior.
>>
>> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@openvz.org>
>> ---
>>   tests/qemu-iotests/tests/copy-before-write    | 78 +++++++++++++++++++
>>   .../qemu-iotests/tests/copy-before-write.out  |  4 +-
>>   2 files changed, 80 insertions(+), 2 deletions(-)
>>
>> diff --git a/tests/qemu-iotests/tests/copy-before-write b/tests/qemu-iotests/tests/copy-before-write
>> index a32608f597..5c90b8cd50 100755
>> --- a/tests/qemu-iotests/tests/copy-before-write
>> +++ b/tests/qemu-iotests/tests/copy-before-write
>> @@ -122,6 +122,84 @@ read 1048576/1048576 bytes at offset 0
>>   1 MiB, X ops; XX:XX:XX.X (XXX YYY/sec and XXX ops/sec)
>>   """)
>> +    def do_cbw_timeout(self, on_cbw_error):
>> +        result = self.vm.qmp('object-add', {
>> +            'qom-type': 'throttle-group',
>> +            'id': 'group0',
>> +            'limits': {'bps-write': 300 * 1024}
> 
> Hm, yes, I can’t find a way to make this work without your other series.  For some reason, not even -accel tcg helps; and using qtest to advance the virtual clock doesn’t really help because the qemu-io commands block while the request is throttled.
> 
> One thing that should work would be to run everything in a qemu-storage-daemon instance, and then having qemu-io access an NBD export...
> 

Simple switch to QEMUMachine helps. I'll resend soon.

-- 
Best regards,
Vladimir

