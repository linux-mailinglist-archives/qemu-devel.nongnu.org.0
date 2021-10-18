Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 224F8431F6A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 16:23:29 +0200 (CEST)
Received: from localhost ([::1]:43092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcTXz-0002ZN-MI
	for lists+qemu-devel@lfdr.de; Mon, 18 Oct 2021 10:23:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1mcPAA-0001ZG-44
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:42:34 -0400
Received: from rev.ng ([5.9.113.41]:54351)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1mcPA8-0000gy-K3
 for qemu-devel@nongnu.org; Mon, 18 Oct 2021 05:42:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=In-Reply-To:From:Reply-To:References:Cc:To:Subject:MIME-Version:
 Date:Message-ID:Content-Type:Sender:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PC3mzyL6VdyPsd+JhuG/jtadbxaJYztvff7rdaGmByc=; b=qcMvEzrL5sjUg26JbmC3jopzwH
 mGrYCgxrmb8xEBVgVcRyUcuAjc3dSUOIVxqrSd0Dcx8cl7rgk1aoTguc7SEiH9CffBVhuuI2idqg1
 CA7jkYn4HHvcGc97P77MtCSDc3a1AbUpSj/1tVEjjc+baTPFhr0Bbo0jUK3EY9rDbNtU=;
Content-Type: multipart/alternative;
 boundary="------------00Lri9xy2wtwov3Liv4wjHT8"
Message-ID: <1fdd3bba-e143-6d0e-51ce-6bf2914124c7@rev.ng>
Date: Mon, 18 Oct 2021 11:42:21 +0000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v6 09/12] target/hexagon: import parser for idef-parser
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>,
 Alessandro Di Federico <ale.qemu@rev.ng>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: Brian Cain <bcain@quicinc.com>, "babush@rev.ng" <babush@rev.ng>,
 "nizzo@rev.ng" <nizzo@rev.ng>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>,
 Alessandro Di Federico <ale@rev.ng>
References: <20210720123031.1101682-1-ale.qemu@rev.ng>
 <20210720123031.1101682-10-ale.qemu@rev.ng>
 <BYAPR02MB48868558D54556AE4C145626DED39@BYAPR02MB4886.namprd02.prod.outlook.com>
Organization: rev.ng
In-Reply-To: <BYAPR02MB48868558D54556AE4C145626DED39@BYAPR02MB4886.namprd02.prod.outlook.com>
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 18 Oct 2021 10:20:51 -0400
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  anjo@rev.ng
X-ACL-Warn: ,  Anton Johansson <anjo@rev.ng>
From:  Anton Johansson via <qemu-devel@nongnu.org>

This is a multi-part message in MIME format.
--------------00Lri9xy2wtwov3Liv4wjHT8
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 9/7/21 18:08, Taylor Simpson wrote:

>> +HexValue gen_round(Context *c,
>> +                   YYLTYPE *locp,
>> +                   HexValue *source,
>> +                   HexValue *position) {
>> +    yyassert(c, locp, source->bit_width <= 32,
>> +             "fRNDN not implemented for bit widths > 32!");
>> +
>> +    HexValue src = *source;
>> +    HexValue pos = *position;
>> +
>> +    HexValue src_width = gen_imm_value(c, locp, src.bit_width, 32);
>> +    HexValue dst_width = gen_imm_value(c, locp, 64, 32);
>> +    HexValue a = gen_extend_op(c, locp, &src_width, &dst_width, &src,
>> SIGNED);
> Are you sure extending is the right thing to do here?

I believe so, the fRNDN definition in macros.h also extends here

   #define fRNDN(A, N) ((((N) == 0) ? (A) : (((fSE32_64(A)) + (1 << ((N) 
- 1))))))

-- 
Anton Johansson,
rev.ng Srls.

--------------00Lri9xy2wtwov3Liv4wjHT8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>On 9/7/21 18:08, Taylor Simpson wrote:<br>
    </p>
    <blockquote type="cite"
cite="mid:BYAPR02MB48868558D54556AE4C145626DED39@BYAPR02MB4886.namprd02.prod.outlook.com">
      <blockquote type="cite" style="color: #007cff;">
        <pre class="moz-quote-pre" wrap="">+HexValue gen_round(Context *c,
+                   YYLTYPE *locp,
+                   HexValue *source,
+                   HexValue *position) {
+    yyassert(c, locp, source-&gt;bit_width &lt;= 32,
+             "fRNDN not implemented for bit widths &gt; 32!");
+
+    HexValue src = *source;
+    HexValue pos = *position;
+
+    HexValue src_width = gen_imm_value(c, locp, src.bit_width, 32);
+    HexValue dst_width = gen_imm_value(c, locp, 64, 32);
+    HexValue a = gen_extend_op(c, locp, &amp;src_width, &amp;dst_width, &amp;src,
SIGNED);
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">Are you sure extending is the right thing to do here?
</pre>
    </blockquote>
    <p>I believe so, the fRNDN definition in macros.h also extends here<br>
    </p>
    <p>  #define fRNDN(A, N) ((((N) == 0) ? (A) : (((fSE32_64(A)) + (1
      &lt;&lt; ((N) - 1)))))) <br>
    </p>
    <pre class="moz-signature" cols="72">-- 
Anton Johansson,
rev.ng Srls.</pre>
  </body>
</html>
--------------00Lri9xy2wtwov3Liv4wjHT8--


