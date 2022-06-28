Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62AA355BFC8
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Jun 2022 11:30:02 +0200 (CEST)
Received: from localhost ([::1]:57792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o67Xl-0001Nk-FO
	for lists+qemu-devel@lfdr.de; Tue, 28 Jun 2022 05:30:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57294)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1714c2d51=damien.lemoal@opensource.wdc.com>)
 id 1o67GS-0004Pf-9F
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 05:12:09 -0400
Received: from esa2.hgst.iphmx.com ([68.232.143.124]:3215)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=1714c2d51=damien.lemoal@opensource.wdc.com>)
 id 1o67GB-0003IQ-ED
 for qemu-devel@nongnu.org; Tue, 28 Jun 2022 05:12:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1656407511; x=1687943511;
 h=message-id:date:mime-version:subject:to:cc:references:
 from:in-reply-to:content-transfer-encoding;
 bh=3dDqRvnPGORfTArdTFaN0a2wNmOCxmiRYgLNJRljoBU=;
 b=VhWKCdAU3OnpKKjCnAO5ENP9BlGqvqoH6DVrIxbnrHDXNkXzOyj14z4l
 YdvnQbdI0a99IDjHAoT9cds2QLLf8zkvq27x7Ju8ieimBJ4HfAxX/22ic
 0EHvnsLtMzXtWH7mlw8QE9lwIX7zQ+dX4a0G/ilHRPOEkJfavgzbSOtAS
 y+I/pi0pu++E+H/FcCKWc0epmjFfYQo4J+7kBDwrMOHnCGXqoj2gj90qs
 0asK1QmUcJM4Qq8FmSmDRP0IQ30boHE12Om/loCljfDrsPJYm+vqwG91g
 HveBElf+cE0W3pibv2T/1e0CCtpQlO8CXOBycHtHIsltFE9xnAyLauD5Y A==;
X-IronPort-AV: E=Sophos;i="5.92,227,1650902400"; d="scan'208";a="308600246"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Jun 2022 17:11:43 +0800
IronPort-SDR: kJ+BHxsk+bUv97bpM0ubSP79Ht4sOTFq8tSEVOyjjlreJjNwcPrWBy+GqeBV6cYWIcXCo7Y4oV
 4GUxNqWNi9eoGwaGVU+GIdtyt64GYQ/0usRK936lbmFAFzs2sKK4BcEZIx9YMMFC+ZrxbWwnBs
 E3V87V+3M+BkyVPy/L8Kj2q1r19ANM2MV9XUUnCxTJsKkvPfOolFjCtpQCpe1Ak8osV5oiBOLC
 nWZjL79wKQ4TrjdIrUJd93C/sWRFpI1RhoMgwibCV5TyS2oiurJUZDF/XlRCKhA2SNrnIQ1IO4
 hucKaMN75NigXNG+OM5OFUDY
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Jun 2022 01:34:05 -0700
IronPort-SDR: s2O7P0MCIMMOn8CZneR8u5q2cztpneegMymMBCleW86v9W7oJeTOobH+bw9MgHQ3Ml5hEOXa57
 G3+2AgJ+ql7OlI0CiPajT1AhA1sMTUbD0jjBJcWSH/DiKJCvvbujO6DBa7MP4kBw49GZjuvAHv
 zYbIQguIbXlBztmj7KeCbSEP0+Rn6sYkcxl5rvaI9uy5Fs6aVeq15vQPPlGo1yieB4LckNbKn1
 nQXcHwaWib7xmdxj3jkLFfviBxaf7satdMJQr3GH/Mu+yQ/0Z21kWw9Lmz43o57V+Hdy8D8+U+
 Q4c=
WDCIronportException: Internal
Received: from usg-ed-osssrv.wdc.com ([10.3.10.180])
 by uls-op-cesaip01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256;
 28 Jun 2022 02:11:43 -0700
Received: from usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTP id 4LXJkR0Rqvz1Rws4
 for <qemu-devel@nongnu.org>; Tue, 28 Jun 2022 02:11:43 -0700 (PDT)
Authentication-Results: usg-ed-osssrv.wdc.com (amavisd-new); dkim=pass
 reason="pass (just generated, assumed good)"
 header.d=opensource.wdc.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=
 opensource.wdc.com; h=content-transfer-encoding:content-type
 :in-reply-to:organization:from:references:to:content-language
 :subject:user-agent:mime-version:date:message-id; s=dkim; t=
 1656407502; x=1658999503; bh=3dDqRvnPGORfTArdTFaN0a2wNmOCxmiRYgL
 NJRljoBU=; b=gqVHDzKLuwNjHNMarPJAOW8Xe+ej8xNP0fPA3r88EzXNLi9TSC5
 3UY+iV0T9OS8+It3/2umeRnNHljtaNndLmIxi2Uky5rZadv9NCL1IPmggrlPFKlL
 tmUKB9Ks2ET3tptHmvbEStB3vGwNySw2upH01fLh7JpnNrVDxPibyQS1jr5m3T+V
 ewyyKTdoXdc+iH4qa1W3aazCT6/7ZDesUeDaAmyOSuPq6EO4MCadzJaB3Xoy0/JX
 CNryhyJM3TDRCvsHzeqcHQ9MMktmRY6BaES0Do1kAbDoMKafH3RhGqrdjxTw5rSY
 gvqqyVq+nf2HD1i1EjrB+Mi5rDxGU9j+C9A==
X-Virus-Scanned: amavisd-new at usg-ed-osssrv.wdc.com
Received: from usg-ed-osssrv.wdc.com ([127.0.0.1])
 by usg-ed-osssrv.wdc.com (usg-ed-osssrv.wdc.com [127.0.0.1]) (amavisd-new,
 port 10026) with ESMTP id jIs9cQYiJbFj for <qemu-devel@nongnu.org>;
 Tue, 28 Jun 2022 02:11:42 -0700 (PDT)
Received: from [10.225.163.99] (unknown [10.225.163.99])
 by usg-ed-osssrv.wdc.com (Postfix) with ESMTPSA id 4LXJkN4gJsz1RtVk;
 Tue, 28 Jun 2022 02:11:40 -0700 (PDT)
Message-ID: <d6f0ca3e-2463-5a42-f284-c54b4877cf15@opensource.wdc.com>
Date: Tue, 28 Jun 2022 18:11:39 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [RFC v3 2/5] qemu-io: add zoned block device operations.
Content-Language: en-US
To: Stefan Hajnoczi <stefanha@redhat.com>, Sam Li <faithilikerun@gmail.com>
Cc: qemu-devel@nongnu.org, hare@suse.de, Hanna Reitz <hreitz@redhat.com>,
 dmitry.fomichev@wdc.com, Kevin Wolf <kwolf@redhat.com>,
 Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org
References: <20220627001917.9417-1-faithilikerun@gmail.com>
 <20220627001917.9417-3-faithilikerun@gmail.com>
 <Yrq0QwRahF9wJh1S@stefanha-x1.localdomain>
From: Damien Le Moal <damien.lemoal@opensource.wdc.com>
Organization: Western Digital Research
In-Reply-To: <Yrq0QwRahF9wJh1S@stefanha-x1.localdomain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=68.232.143.124;
 envelope-from=prvs=1714c2d51=damien.lemoal@opensource.wdc.com;
 helo=esa2.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

On 6/28/22 16:56, Stefan Hajnoczi wrote:
> On Mon, Jun 27, 2022 at 08:19:14AM +0800, Sam Li wrote:
>> diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
>> index 2f0d8ac25a..3f2592b9f5 100644
>> --- a/qemu-io-cmds.c
>> +++ b/qemu-io-cmds.c
>> @@ -1706,6 +1706,122 @@ static const cmdinfo_t flush_cmd = {
>>      .oneline    = "flush all in-core file state to disk",
>>  };
>>  
>> +static int zone_report_f(BlockBackend *blk, int argc, char **argv)
>> +{
>> +    int ret;
>> +    int64_t offset, len, nr_zones;
>> +    int i = 0;
>> +
>> +    ++optind;
>> +    offset = cvtnum(argv[optind]);
>> +    ++optind;
>> +    len = cvtnum(argv[optind]);
>> +    ++optind;
>> +    nr_zones = cvtnum(argv[optind]);
>> +
>> +    g_autofree BlockZoneDescriptor *zones = g_new(BlockZoneDescriptor, nr_zones);
>> +    ret = blk_zone_report(blk, offset, len, &nr_zones, zones);
>> +    while (i < nr_zones) {
> 
> Does blk_zone_report() set nr_zones to 0 on failure or do we need to
> check if (ret < 0) here?

ret = 0 means "no zone reported" which happen only if nr_zones is 0 or the
start offset is past the end of the disk capacity. ret < 0 would mean that
a report zone operation was actually attempted and failed (EIO, ENOMEM etc).

> 
>> +        fprintf(stdout, "start: 0x%lx, len 0x%lx, cap 0x%lx, wptr 0x%lx, "
> 
> The rest of the source file uses printf() instead of fprintf(stdout,
> ...). That's usually preferred because it's shorter.
> 
>> +                        "zcond:%u, [type: %u]\n",
> 
> Please use PRIx64 instead of lx format specifiers for portability. On
> 32-bit hosts lx is 32-bit, not 64-bit. You can grep QEMU's code for
> examples of PRIx64.
> 
>> +                zones[i].start, zones[i].length, zones[i].cap, zones[i].wp,
>> +                zones[i].cond, zones[i].type);
>> +        ++i;
>> +    }
> 
> A for loop is more idiomatic:
> 
>   for (int i = 0; i < nr_zones; i++) {
>       ...
>   }
> 
>> +    return ret;
>> +}
>> +
>> +static const cmdinfo_t zone_report_cmd = {
>> +        .name = "zone_report",
>> +        .altname = "f",
>> +        .cfunc = zone_report_f,
>> +        .argmin = 3,
>> +        .argmax = 3,
>> +        .args = "offset [offset..] len [len..] number [num..]",
> 
> The arguments are "offset len number". This command does not accept
> optional offset/len/num arguments.

The arguments should be offset + len OR offset + number of zones. Having
the 3 of them does not make sense to me. The interface would then be:

(1) offset + len -> report all zones in the block range [offset .. offset
+ len - 1]

(2) offset + number of zones -> report at most "number of zones" from the
zone containing the block at "offset".

(2) matches the semantic used at the device command level. So I prefer to
approach (1).

> 
>> +        .oneline = "report a number of zones",
> 
> Maybe "report zone information".
> 
>> +};
>> +
>> +static int zone_open_f(BlockBackend *blk, int argc, char **argv)
>> +{
>> +    int64_t offset, len;
>> +    ++optind;
>> +    offset = cvtnum(argv[optind]);
>> +    ++optind;
>> +    len = cvtnum(argv[optind]);
>> +    return blk_zone_mgmt(blk, zone_open, offset, len);
> 
> Where is the error reported? When I look at read_f() I see:
> 
>     if (ret < 0) {
>         printf("read failed: %s\n", strerror(-ret));
> 
> I think something similar is needed because qemu-io.c does not print an
> error message for us. The same is true for the other commands defined in
> this patch.
> 
>> +}
>> +
>> +static const cmdinfo_t zone_open_cmd = {
>> +        .name = "zone_open",
>> +        .altname = "f",
>> +        .cfunc = zone_open_f,
>> +        .argmin = 2,
>> +        .argmax = 2,
>> +        .args = "offset [offset..] len [len..]",
> 
> There are no optional offset/len args. The same is true for the other
> commands below.


-- 
Damien Le Moal
Western Digital Research

