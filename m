Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BC394FE462
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Apr 2022 17:13:05 +0200 (CEST)
Received: from localhost ([::1]:59256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1neICV-00082g-PC
	for lists+qemu-devel@lfdr.de; Tue, 12 Apr 2022 11:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34162)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1neIAu-0007DR-5J
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 11:11:24 -0400
Received: from rev.ng ([5.9.113.41]:47703)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <anjo@rev.ng>) id 1neIAr-0001hA-U7
 for qemu-devel@nongnu.org; Tue, 12 Apr 2022 11:11:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=rev.ng;
 s=dkim; h=In-Reply-To:From:References:Cc:To:Subject:Reply-To:MIME-Version:
 Date:Message-ID:Content-Type:Sender:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IBWlkWfFee1/fyYfsfJNpJkDlh0Y82yCEWPWw81FoXQ=; b=jeGpqh67UOudEOs24Btrtja6/+
 Hqwwe9PgaO85vs+dG/VuSgSfz+VSCpEBZ4iXWQX+QvrxSM44OzIB3iaFtTBfo7DdPrgskI74WP4ai
 oIMHXk9B9cmL7r78Ba1Kok8/eTkAk4USurfWhl83nOfao8Kbq/+3u/xLkTRlfwE2bSWU=;
Content-Type: multipart/alternative;
 boundary="------------7EmC8hn1u9XU3OEsjurxdwy5"
Message-ID: <3553bdb8-021c-3105-f8d3-4d65fd2bc0b8@rev.ng>
Date: Tue, 12 Apr 2022 17:10:44 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v8 10/12] target/hexagon: import parser for idef-parser
Content-Language: en-US
To: Taylor Simpson <tsimpson@quicinc.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
Cc: "ale@rev.ng" <ale@rev.ng>, Brian Cain <bcain@quicinc.com>,
 Michael Lambert <mlambert@quicinc.com>, "babush@rev.ng" <babush@rev.ng>,
 "nizzo@rev.ng" <nizzo@rev.ng>,
 "richard.henderson@linaro.org" <richard.henderson@linaro.org>
References: <20220209170312.30662-1-anjo@rev.ng>
 <20220209170312.30662-11-anjo@rev.ng>
 <SN4PR0201MB8808765107E51ACC51D89DECDEEA9@SN4PR0201MB8808.namprd02.prod.outlook.com>
Organization: rev.ng
In-Reply-To: <SN4PR0201MB8808765107E51ACC51D89DECDEEA9@SN4PR0201MB8808.namprd02.prod.outlook.com>
Received-SPF: pass client-ip=5.9.113.41; envelope-from=anjo@rev.ng; helo=rev.ng
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, HTML_MESSAGE=0.001,
 NICE_REPLY_A=-0.001, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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

This is a multi-part message in MIME format.
--------------7EmC8hn1u9XU3OEsjurxdwy5
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Very nice catch, this is the bug that plagued us a few weeks ago when 
rebasing,
it has since been fixed. Actually the `gen_set_overflow` fucntion has 
been removed
completely as it was only called when we handled `asl/asr_r_r_sat`.

Current way we handle overflow:

Overflow is now only set by saturates, this assumption holds for the 
instructions
we parse in phase 1. In the parser, all saturates call `gen_rvalue_sat` 
which emits
a call to `gen_set_usr_field_if` in `genptr.c` to set USR_OVF only if 
the value is
non-zero. It does this via OR'ing with the previous value.

See here 
<https://gitlab.com/AntonJohansson/qemu/-/blob/feature/idef-parser/target/hexagon/idef-parser/parser-helpers.c#L2109> 
for `gen_rvalue_sat`
and here 
<https://gitlab.com/AntonJohansson/qemu/-/blob/feature/idef-parser/target/hexagon/genptr.c#L669> 
for `gen_set_usr_field_if`

>
>> -----Original Message-----
>> From: Anton Johansson<anjo@rev.ng>
>> Sent: Wednesday, February 9, 2022 11:03 AM
>> To:qemu-devel@nongnu.org
>> Cc:ale@rev.ng; Taylor Simpson<tsimpson@quicinc.com>; Brian Cain
>> <bcain@quicinc.com>; Michael Lambert<mlambert@quicinc.com>;
>> babush@rev.ng;nizzo@rev.ng;richard.henderson@linaro.org
>> Subject: [PATCH v8 10/12] target/hexagon: import parser for idef-parser
>>
>> Signed-off-by: Alessandro Di Federico<ale@rev.ng>
>> Signed-off-by: Paolo Montesel<babush@rev.ng>
>> Signed-off-by: Anton Johansson<anjo@rev.ng>
>
>> diff --git a/target/hexagon/idef-parser/parser-helpers.c
>> b/target/hexagon/idef-parser/parser-helpers.c
>> new file mode 100644
>
>
>> +void gen_set_overflow(Context *c, YYLTYPE *locp, HexValue *value)
>> +{
>> +    HexValue value_m = *value;
>> +
>> +    if (is_inside_ternary(c)) {
>> +        /* Inside ternary operator, need to take care of the side-effect */
>> +        HexValue cond = get_ternary_cond(c, locp);
>> +        HexValue zero = gen_constant(c, locp, "0", cond.bit_width,
>> UNSIGNED);
>> +        bool is_64bit = cond.bit_width == 64;
>> +        unsigned bit_width = cond.bit_width;
>> +        value_m = rvalue_materialize(c, locp, &value_m);
>> +        if (is_64bit) {
>> +            value_m = gen_rvalue_extend(c, locp, &value_m);
>> +        }
>> +        OUT(c, locp, "tcg_gen_movcond_i", &bit_width,
>> +                     "(TCG_COND_NE, ", &value_m, ", ", &cond);
>> +        OUT(c, locp, ", ", &zero, ", ", &value_m, ", ", &zero, ");\n");
> You shouldn't write zero when the condition is false - you should do nothing.  Try a test where OVF is already set.  You can't overwrite the bit with zero when the current instruction doesn't overflow.
>
>
>
>> +        if (is_64bit) {
>> +            value_m = gen_rvalue_truncate(c, locp, &value_m);
>> +        }
>> +        gen_rvalue_free(c, locp, &cond);
>> +    }
>> +
>> +    OUT(c, locp, "SET_USR_FIELD(USR_OVF, ", &value_m, ");\n");
>> +    gen_rvalue_free(c, locp, &value_m);
>> +}
--------------7EmC8hn1u9XU3OEsjurxdwy5
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Very nice catch, this is the bug that plagued us a few weeks ago
      when rebasing,<br>
      it has since been fixed. Actually the `gen_set_overflow` fucntion
      has been removed<br>
      completely as it was only called when we handled
      `asl/asr_r_r_sat`.<br>
    </p>
    <div class="moz-cite-prefix">Current way we handle overflow:<br>
      <br>
      Overflow is now only set by saturates, this assumption holds for
      the instructions<br>
      we parse in phase 1. In the parser, all saturates call
      `gen_rvalue_sat` which emits<br>
      a call to `gen_set_usr_field_if` in `genptr.c` to set USR_OVF only
      if the value is<br>
      non-zero. It does this via OR'ing with the previous value.<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <div class="moz-cite-prefix">See <a moz-do-not-send="true"
href="https://gitlab.com/AntonJohansson/qemu/-/blob/feature/idef-parser/target/hexagon/idef-parser/parser-helpers.c#L2109">here</a>
      for `gen_rvalue_sat`</div>
    <div class="moz-cite-prefix">and <a moz-do-not-send="true"
href="https://gitlab.com/AntonJohansson/qemu/-/blob/feature/idef-parser/target/hexagon/genptr.c#L669">here</a>
      for `gen_set_usr_field_if`<br>
    </div>
    <div class="moz-cite-prefix"><br>
    </div>
    <blockquote type="cite"
cite="mid:SN4PR0201MB8808765107E51ACC51D89DECDEEA9@SN4PR0201MB8808.namprd02.prod.outlook.com">
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">-----Original Message-----
From: Anton Johansson <a class="moz-txt-link-rfc2396E" href="mailto:anjo@rev.ng">&lt;anjo@rev.ng&gt;</a>
Sent: Wednesday, February 9, 2022 11:03 AM
To: <a class="moz-txt-link-abbreviated" href="mailto:qemu-devel@nongnu.org">qemu-devel@nongnu.org</a>
Cc: <a class="moz-txt-link-abbreviated" href="mailto:ale@rev.ng">ale@rev.ng</a>; Taylor Simpson <a class="moz-txt-link-rfc2396E" href="mailto:tsimpson@quicinc.com">&lt;tsimpson@quicinc.com&gt;</a>; Brian Cain
<a class="moz-txt-link-rfc2396E" href="mailto:bcain@quicinc.com">&lt;bcain@quicinc.com&gt;</a>; Michael Lambert <a class="moz-txt-link-rfc2396E" href="mailto:mlambert@quicinc.com">&lt;mlambert@quicinc.com&gt;</a>;
<a class="moz-txt-link-abbreviated" href="mailto:babush@rev.ng">babush@rev.ng</a>; <a class="moz-txt-link-abbreviated" href="mailto:nizzo@rev.ng">nizzo@rev.ng</a>; <a class="moz-txt-link-abbreviated" href="mailto:richard.henderson@linaro.org">richard.henderson@linaro.org</a>
Subject: [PATCH v8 10/12] target/hexagon: import parser for idef-parser

Signed-off-by: Alessandro Di Federico <a class="moz-txt-link-rfc2396E" href="mailto:ale@rev.ng">&lt;ale@rev.ng&gt;</a>
Signed-off-by: Paolo Montesel <a class="moz-txt-link-rfc2396E" href="mailto:babush@rev.ng">&lt;babush@rev.ng&gt;</a>
Signed-off-by: Anton Johansson <a class="moz-txt-link-rfc2396E" href="mailto:anjo@rev.ng">&lt;anjo@rev.ng&gt;</a>
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">

</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">diff --git a/target/hexagon/idef-parser/parser-helpers.c
b/target/hexagon/idef-parser/parser-helpers.c
new file mode 100644
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">


</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+void gen_set_overflow(Context *c, YYLTYPE *locp, HexValue *value)
+{
+    HexValue value_m = *value;
+
+    if (is_inside_ternary(c)) {
+        /* Inside ternary operator, need to take care of the side-effect */
+        HexValue cond = get_ternary_cond(c, locp);
+        HexValue zero = gen_constant(c, locp, "0", cond.bit_width,
UNSIGNED);
+        bool is_64bit = cond.bit_width == 64;
+        unsigned bit_width = cond.bit_width;
+        value_m = rvalue_materialize(c, locp, &amp;value_m);
+        if (is_64bit) {
+            value_m = gen_rvalue_extend(c, locp, &amp;value_m);
+        }
+        OUT(c, locp, "tcg_gen_movcond_i", &amp;bit_width,
+                     "(TCG_COND_NE, ", &amp;value_m, ", ", &amp;cond);
+        OUT(c, locp, ", ", &amp;zero, ", ", &amp;value_m, ", ", &amp;zero, ");\n");
</pre>
      </blockquote>
      <pre class="moz-quote-pre" wrap="">
You shouldn't write zero when the condition is false - you should do nothing.  Try a test where OVF is already set.  You can't overwrite the bit with zero when the current instruction doesn't overflow.



</pre>
      <blockquote type="cite">
        <pre class="moz-quote-pre" wrap="">+        if (is_64bit) {
+            value_m = gen_rvalue_truncate(c, locp, &amp;value_m);
+        }
+        gen_rvalue_free(c, locp, &amp;cond);
+    }
+
+    OUT(c, locp, "SET_USR_FIELD(USR_OVF, ", &amp;value_m, ");\n");
+    gen_rvalue_free(c, locp, &amp;value_m);
+}
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------7EmC8hn1u9XU3OEsjurxdwy5--

