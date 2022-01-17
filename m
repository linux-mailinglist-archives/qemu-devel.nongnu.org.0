Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C6F490467
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Jan 2022 09:53:14 +0100 (CET)
Received: from localhost ([::1]:51184 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n9NlJ-0002k2-Ff
	for lists+qemu-devel@lfdr.de; Mon, 17 Jan 2022 03:53:13 -0500
Received: from eggs.gnu.org ([209.51.188.92]:36216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9NhE-0008OY-8l; Mon, 17 Jan 2022 03:49:00 -0500
Received: from 4.mo548.mail-out.ovh.net ([188.165.42.229]:47905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1n9Nh9-0006dt-F9; Mon, 17 Jan 2022 03:48:59 -0500
Received: from mxplan5.mail.ovh.net (unknown [10.109.138.132])
 by mo548.mail-out.ovh.net (Postfix) with ESMTPS id 53B3120CC0;
 Mon, 17 Jan 2022 08:48:52 +0000 (UTC)
Received: from kaod.org (37.59.142.105) by DAG4EX1.mxp5.local (172.16.2.31)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Mon, 17 Jan
 2022 09:48:51 +0100
Authentication-Results: garm.ovh; auth=pass
 (GARM-105G006658e5120-902f-4802-8cc2-ee00beda0913,
 9556A11AC16C5E8FE4FF301E40865CB3D13C347E) smtp.auth=clg@kaod.org
X-OVh-ClientIp: 82.64.250.170
Message-ID: <ad138d6b-2ca9-2aff-1965-fc923188dd65@kaod.org>
Date: Mon, 17 Jan 2022 09:48:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v2 1/2] hw/misc: Supporting AST2600 HACE accumulative mode
Content-Language: en-US
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
To: Troy Lee <troy_lee@aspeedtech.com>, <qemu-devel@nongnu.org>
References: <20220112080937.366835-1-troy_lee@aspeedtech.com>
 <20220112080937.366835-2-troy_lee@aspeedtech.com>
 <9be84f9d-dbfe-d5dc-c570-3df263eb852a@kaod.org>
In-Reply-To: <9be84f9d-dbfe-d5dc-c570-3df263eb852a@kaod.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [37.59.142.105]
X-ClientProxiedBy: DAG4EX2.mxp5.local (172.16.2.32) To DAG4EX1.mxp5.local
 (172.16.2.31)
X-Ovh-Tracer-GUID: e55328f2-0cf2-4bbe-883b-1fdd83dec46a
X-Ovh-Tracer-Id: 3275242831456865132
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvvddruddtgdduvdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhepkfffgggfuffhvfhfjggtgfhisehtkeertddtfeejnecuhfhrohhmpeevrogurhhitggpnfgvpgfiohgrthgvrhcuoegtlhhgsehkrghougdrohhrgheqnecuggftrfgrthhtvghrnhepiefhfeffffegtdekgedtkeffvedugefggefftefhffehhffhvefhtddujefhvdeinecukfhppedtrddtrddtrddtpdefjedrheelrddugedvrddutdehnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpohhuthdphhgvlhhopehmgihplhgrnhehrdhmrghilhdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomheptghlgheskhgrohgurdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtohepqhgvmhhuqdgrrhhmsehnohhnghhnuhdrohhrgh
Received-SPF: pass client-ip=188.165.42.229; envelope-from=clg@kaod.org;
 helo=4.mo548.mail-out.ovh.net
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Andrew Jeffery <andrew@aj.id.au>,
 hailin.wu@aspeedtech.com, leetroy@gmail.com,
 "open list:ASPEED BMCs" <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>



>> -static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode)
>> +static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode,
>> +                              bool acc_mode)
>>   {
>>       struct iovec iov[ASPEED_HACE_MAX_SG];
>>       g_autofree uint8_t *digest_buf;
>> @@ -103,6 +106,7 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode)
>>       if (sg_mode) {
>>           uint32_t len = 0;
>> +        uint32_t total_len = 0;
>>           for (i = 0; !(len & SG_LIST_LEN_LAST); i++) {
>>               uint32_t addr, src;
>> @@ -123,10 +127,26 @@ static void do_hash_operation(AspeedHACEState *s, int algo, bool sg_mode)
>>                                           MEMTXATTRS_UNSPECIFIED, NULL);
>>               addr &= SG_LIST_ADDR_MASK;
>> -            iov[i].iov_len = len & SG_LIST_LEN_MASK;
>> -            plen = iov[i].iov_len;
>> +            plen = len & SG_LIST_LEN_MASK;
>>               iov[i].iov_base = address_space_map(&s->dram_as, addr, &plen, false,
>>                                                   MEMTXATTRS_UNSPECIFIED);
>> +
>> +            if (acc_mode) {
>> +                total_len += plen;
>> +
>> +                if (len & SG_LIST_LEN_LAST) {
>> +                    /*
>> +                     * In the padding message, the last 64/128 bit represents
>> +                     * the total length of bitstream in big endian.
>> +                     * SHA-224, SHA-256 are 64 bit
>> +                     * SHA-384, SHA-512, SHA-512/224, SHA-512/256 are 128 bit
>> +                     * However, we would not process such a huge bit stream.
> 
> If we do not support accumulative mode with SHA-384, SHA-512, SHA-512/224,
> SHA-512/256 algos, we should make sure that do_hash_operation() is not
> called and emit a warning.

I misunderstood the comment. I don't think it is very complex to
extract the total length field correctly. You only need the algo
type to pick the right size. May be add one more parameter to
do_hash_operation() and


>> +                     */
>> +                    plen -= total_len - (ldq_be_p(iov[i].iov_base + plen - 8) / 8);

change the offset in the above ?

Thanks,

C.

