Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E0CD373E02
	for <lists+qemu-devel@lfdr.de>; Wed,  5 May 2021 16:56:55 +0200 (CEST)
Received: from localhost ([::1]:58516 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1leIxK-00077D-5v
	for lists+qemu-devel@lfdr.de; Wed, 05 May 2021 10:56:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1leIvJ-0006Mw-T9
 for qemu-devel@nongnu.org; Wed, 05 May 2021 10:54:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44711)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1leIvG-0005nN-UP
 for qemu-devel@nongnu.org; Wed, 05 May 2021 10:54:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620226485;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jdFW5K4KxtBrlqLLs1AbeSDL3S44F2qJDp2zDKXU7oE=;
 b=AMGlCdMX2UccIpvtPKKFdxbvO5SwN087rqJDdxeLgQ8y5enQHIUbLCg+aS5OJ1k+iwbgRK
 yUhMi76dgfF5VCLF9sGnlqzccGlPW2IIr6uJ57M9dfTRjIrcumfGzSxd/w9fEWC8dzFYZv
 qN4DgkT88NOh0N34/anfZ0pJZtUHVp0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-47-DFyy2GUrOVidgUKsO1ThJQ-1; Wed, 05 May 2021 10:54:44 -0400
X-MC-Unique: DFyy2GUrOVidgUKsO1ThJQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 l2-20020adf9f020000b029010d6bb7f1cbso805508wrf.7
 for <qemu-devel@nongnu.org>; Wed, 05 May 2021 07:54:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=jdFW5K4KxtBrlqLLs1AbeSDL3S44F2qJDp2zDKXU7oE=;
 b=tN1W8T3hq+QTXt6czwo+7XW//fWIwW/NaEK/1JL3F7UBVB3UWvvuWNXfU2PVNfwuph
 e/ckQQAWrLPBl33vXejS894qBtKElJpgCBfKqX052zOOeiuyqQEQpx7c/EmZeRxhzxnM
 BxCXGVtMbYrxnas8WG8il8loHqKjp6nYOzrE0B+IE7UqT8nD5ZV1DC53aMpa5hfcqfDV
 TOOsvHdMCne5EBT6OlOjXvkotqaHdVDGAEqXHzDKClcUVIjllO78zA6objKjapJQ1bao
 9eIiNRmP4IOat+ChX6wOT/72gsp5Ua9zakn1zfCilIZtQybCh2grPQtB1t0Y+1qI3bNY
 laxA==
X-Gm-Message-State: AOAM530Cty7gSoQgolTGbdy5iRu6/ssJxo8o5eK6wOA9S8zNRXcfBxL1
 Q9vt5lT4yBxaB/uMsejRwWMMpdryZV2fNSDGoBG8508ytRAYV3Z58UJZiWqy94+QBSU8NRhlE6c
 QKssyTahAjnonsZ4=
X-Received: by 2002:adf:e7c2:: with SMTP id e2mr37468077wrn.180.1620226482867; 
 Wed, 05 May 2021 07:54:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAk2ICl1QR3Rlq8iMaDOReYGnyZe0ANK5oxQbyFiFxdWui6oehvDxkpzAW9A9qSJmWhM3wAA==
X-Received: by 2002:adf:e7c2:: with SMTP id e2mr37468040wrn.180.1620226482500; 
 Wed, 05 May 2021 07:54:42 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c63bc.dip0.t-ipconnect.de. [91.12.99.188])
 by smtp.gmail.com with ESMTPSA id
 y14sm19572310wrs.64.2021.05.05.07.54.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 05 May 2021 07:54:42 -0700 (PDT)
Subject: Re: [PATCH v1 01/20] softfloat: Implement
 float128_(min|minnum|minnummag|max|maxnum|maxnummag)
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20200930145523.71087-1-david@redhat.com>
 <20200930145523.71087-2-david@redhat.com> <87o8lnnt3m.fsf@linaro.org>
 <1294d810-64a7-7e4d-fb73-238378e2197c@redhat.com> <87a6x6nl3q.fsf@linaro.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <8ba9536d-dec1-54a2-d3e1-157beff16502@redhat.com>
Date: Wed, 5 May 2021 16:54:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <87a6x6nl3q.fsf@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.693,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Cornelia Huck <cohuck@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org,
 qemu-s390x@nongnu.org, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 01.10.20 15:15, Alex Bennée wrote:
> 
> David Hildenbrand <david@redhat.com> writes:
> 
>> On 30.09.20 18:10, Alex Bennée wrote:
>>>
>>> David Hildenbrand <david@redhat.com> writes:
>>>
>>>> Implementation inspired by minmax_floats(). Unfortuantely, we don't have
>>>> any tests we can simply adjust/unlock.
>>>>
>>>> Cc: Aurelien Jarno <aurelien@aurel32.net>
>>>> Cc: Peter Maydell <peter.maydell@linaro.org>
>>>> Cc: "Alex Bennée" <alex.bennee@linaro.org>
>>>> Signed-off-by: David Hildenbrand <david@redhat.com>
>>>> ---
>>>>   fpu/softfloat.c         | 100 ++++++++++++++++++++++++++++++++++++++++
>>>>   include/fpu/softfloat.h |   6 +++
>>>>   2 files changed, 106 insertions(+)
>>>>
>>>> diff --git a/fpu/softfloat.c b/fpu/softfloat.c
>>>> index 9af75b9146..9463c5ea56 100644
>>>> --- a/fpu/softfloat.c
>>>> +++ b/fpu/softfloat.c
>>>> @@ -621,6 +621,8 @@ static inline FloatParts float64_unpack_raw(float64 f)
>>>>       return unpack_raw(float64_params, f);
>>>>   }
>>>>   
>>>> +static void float128_unpack(FloatParts128 *p, float128 a, float_status *status);
>>>> +
>>>>   /* Pack a float from parts, but do not canonicalize.  */
>>>>   static inline uint64_t pack_raw(FloatFmt fmt, FloatParts p)
>>>>   {
>>>> @@ -3180,6 +3182,89 @@ static FloatParts minmax_floats(FloatParts a, FloatParts b, bool ismin,
>>>>       }
>>>>   }
>>>
>>> It would be desirable to share as much logic for this as possible with
>>> the existing minmax_floats code. I appreciate at some point we end up
>>> having to deal with fractions and we haven't found a good way to
>>> efficiently handle dealing with FloatParts and FloatParts128 in the same
>>> unrolled code, however:
>>>
>>>>   
>>>> +static float128 float128_minmax(float128 a, float128 b, bool ismin, bool ieee,
>>>> +                                bool ismag, float_status *s)
>>>> +{
>>>> +    FloatParts128 pa, pb;
>>>> +    int a_exp, b_exp;
>>>> +    bool a_less;
>>>> +
>>>> +    float128_unpack(&pa, a, s);
>>>> +    float128_unpack(&pb, b, s);
>>>> +
>>>
>>>  From here:
>>>> +    if (unlikely(is_nan(pa.cls) || is_nan(pb.cls))) {
>>>> +        /* See comment in minmax_floats() */
>>>> +        if (ieee && !is_snan(pa.cls) && !is_snan(pb.cls)) {
>>>> +            if (is_nan(pa.cls) && !is_nan(pb.cls)) {
>>>> +                return b;
>>>> +            } else if (is_nan(pb.cls) && !is_nan(pa.cls)) {
>>>> +                return a;
>>>> +            }
>>>> +        }
>>>> +
>>>> +        /* Similar logic to pick_nan(), avoiding re-packing. */
>>>> +        if (is_snan(pa.cls) || is_snan(pb.cls)) {
>>>> +            s->float_exception_flags |= float_flag_invalid;
>>>> +        }
>>>> +        if (s->default_nan_mode) {
>>>> +            return float128_default_nan(s);
>>>> +        }
>>>
>>> to here is common logic - is there anyway we could share it?
>>
>> I can try to factor it out, similar to pickNaN() - passing weird boolean
>> flags and such. It most certainly won't win in a beauty contest, that's
>> for sure.
>>>
>>> Likewise I wonder if there is scope for a float_minmax_exp helper that
>>> could be shared here?
>>
>> I'll try, but I have the feeling that it might make the code harder to
>> read than actually help. Will give it a try.
> 
> Give it a try - if it really does become harder to follow then we'll
> stick with the duplication however if we can have common code you'll
> know at least the nan handling and minmax behaviour for float128 will be
> partially tested by the 16/32/64 float code.

(finally had time to look into this)

What about something like this:



 From dd6cf176c840fc34a095cb2a158032a994aca5ef Mon Sep 17 00:00:00 2001
From: David Hildenbrand <david@redhat.com>
Date: Tue, 29 Sep 2020 14:36:26 +0200
Subject: [PATCH] softfloat: Implement
  float128_(min|minnum|minnummag|max|maxnum|maxnummag)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Implementation inspired by minmax_floats(). Unfortuantely, we don't have
any tests we can simply adjust/unlock.

Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: "Alex Bennée" <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
  fpu/softfloat.c         | 141 ++++++++++++++++++++++++++++++++--------
  include/fpu/softfloat.h |   6 ++
  2 files changed, 120 insertions(+), 27 deletions(-)

diff --git a/fpu/softfloat.c b/fpu/softfloat.c
index db7d3a39db..f1014f6d47 100644
--- a/fpu/softfloat.c
+++ b/fpu/softfloat.c
@@ -525,6 +525,18 @@ typedef struct {
      bool sign;
  } FloatParts128;
  
+static inline FloatParts128 floatparts64_to_128(FloatParts a)
+{
+    FloatParts128 res = {
+        .frac0 = a.frac,
+        .exp = a.exp,
+        .cls = a.cls,
+        .sign = a.sign,
+    };
+
+    return res;
+}
+
  #define DECOMPOSED_BINARY_POINT    (64 - 2)
  #define DECOMPOSED_IMPLICIT_BIT    (1ull << DECOMPOSED_BINARY_POINT)
  #define DECOMPOSED_OVERFLOW_BIT    (DECOMPOSED_IMPLICIT_BIT << 1)
@@ -621,6 +633,8 @@ static inline FloatParts float64_unpack_raw(float64 f)
      return unpack_raw(float64_params, f);
  }
  
+static void float128_unpack(FloatParts128 *p, float128 a, float_status *status);
+
  /* Pack a float from parts, but do not canonicalize.  */
  static inline uint64_t pack_raw(FloatFmt fmt, FloatParts p)
  {
@@ -3093,6 +3107,14 @@ bfloat16 uint16_to_bfloat16(uint16_t a, float_status *status)
      return uint64_to_bfloat16_scalbn(a, 0, status);
  }
  
+typedef enum MinMaxRes {
+    MINMAX_RES_A,
+    MINMAX_RES_B,
+    MINMAX_RES_SILENCE_A,
+    MINMAX_RES_SILENCE_B,
+    MINMAX_RES_DEFAULT_NAN,
+} MinMaxRes;
+
  /* Float Min/Max */
  /* min() and max() functions. These can't be implemented as
   * 'compare and pick one input' because that would mishandle
@@ -3109,27 +3131,36 @@ bfloat16 uint16_to_bfloat16(uint16_t a, float_status *status)
   * minnummag() and maxnummag() functions correspond to minNumMag()
   * and minNumMag() from the IEEE-754 2008.
   */
-static FloatParts minmax_floats(FloatParts a, FloatParts b, bool ismin,
-                                bool ieee, bool ismag, float_status *s)
+static MinMaxRes minmax_floats128(FloatParts128 a, FloatParts128 b, bool ismin,
+                                  bool ieee, bool ismag, float_status *s)
  {
      if (unlikely(is_nan(a.cls) || is_nan(b.cls))) {
-        if (ieee) {
-            /* Takes two floating-point values `a' and `b', one of
-             * which is a NaN, and returns the appropriate NaN
-             * result. If either `a' or `b' is a signaling NaN,
-             * the invalid exception is raised.
-             */
-            if (is_snan(a.cls) || is_snan(b.cls)) {
-                return pick_nan(a, b, s);
-            } else if (is_nan(a.cls) && !is_nan(b.cls)) {
-                return b;
+        if (ieee && !is_snan(a.cls) && !is_snan(b.cls)) {
+            if (is_nan(a.cls) && !is_nan(b.cls)) {
+                return MINMAX_RES_B;
              } else if (is_nan(b.cls) && !is_nan(a.cls)) {
-                return a;
+                return MINMAX_RES_A;
              }
          }
-        return pick_nan(a, b, s);
+
+        /* Similar logic to pick_nan(), avoiding re-packing. */
+        if (is_snan(a.cls) || is_snan(b.cls)) {
+            s->float_exception_flags |= float_flag_invalid;
+        }
+        if (s->default_nan_mode) {
+            return MINMAX_RES_DEFAULT_NAN;
+        }
+        if (pickNaN(a.cls, b.cls,
+                    a.frac0 > b.frac0 ||
+                    (a.frac0 == b.frac0 && a.frac1 > b.frac1) ||
+                    (a.frac0 == b.frac0 && a.frac1 == b.frac1 &&
+                     a.sign < b.sign), s)) {
+            return is_snan(b.cls) ? MINMAX_RES_SILENCE_B : MINMAX_RES_B;
+        }
+        return is_snan(a.cls) ? MINMAX_RES_SILENCE_A : MINMAX_RES_A;
      } else {
          int a_exp, b_exp;
+        bool a_less;
  
          switch (a.cls) {
          case float_class_normal:
@@ -3160,23 +3191,44 @@ static FloatParts minmax_floats(FloatParts a, FloatParts b, bool ismin,
              break;
          }
  
-        if (ismag && (a_exp != b_exp || a.frac != b.frac)) {
-            bool a_less = a_exp < b_exp;
-            if (a_exp == b_exp) {
-                a_less = a.frac < b.frac;
+        a_less = a_exp < b_exp;
+        if (a_exp == b_exp) {
+            a_less = a.frac0 < b.frac0;
+            if (a.frac0 == b.frac0) {
+                a_less = a.frac1 < b.frac1;
              }
-            return a_less ^ ismin ? b : a;
          }
  
-        if (a.sign == b.sign) {
-            bool a_less = a_exp < b_exp;
-            if (a_exp == b_exp) {
-                a_less = a.frac < b.frac;
-            }
-            return a.sign ^ a_less ^ ismin ? b : a;
-        } else {
-            return a.sign ^ ismin ? b : a;
+        if (ismag &&
+            (a_exp != b_exp || a.frac0 != b.frac0 || a.frac1 != b.frac1)) {
+            return a_less ^ ismin ? MINMAX_RES_B : MINMAX_RES_A;
+        } else if (a.sign == b.sign) {
+            return a.sign ^ a_less ^ ismin ? MINMAX_RES_B : MINMAX_RES_A;
          }
+        return a.sign ^ ismin ? MINMAX_RES_B : MINMAX_RES_A;
+    }
+}
+
+static FloatParts minmax_floats(FloatParts a, FloatParts b, bool ismin,
+                                bool ieee, bool ismag, float_status *s)
+{
+    FloatParts128 ta = floatparts64_to_128(a);
+    FloatParts128 tb = floatparts64_to_128(b);
+    MinMaxRes res = minmax_floats128(ta, tb, ismin, ieee, ismag, s);
+
+    switch(res) {
+    case MINMAX_RES_A:
+        return a;
+    case MINMAX_RES_B:
+        return b;
+    case MINMAX_RES_SILENCE_A:
+        return parts_silence_nan(a, s);
+    case MINMAX_RES_SILENCE_B:
+        return parts_silence_nan(b, s);
+    case MINMAX_RES_DEFAULT_NAN:
+        return parts_default_nan(s);
+    default:
+        g_assert_not_reached();
      }
  }
  
@@ -3233,6 +3285,41 @@ BF16_MINMAX(maxnummag, false, true, true)
  
  #undef BF16_MINMAX
  
+#define F128_MINMAX(name, ismin, isiee, ismag)                          \
+float128 float128_ ## name(float128 a, float128 b, float_status *s)     \
+{                                                                       \
+    FloatParts128 pa, pb;                                               \
+    MinMaxRes res;                                                      \
+                                                                        \
+    float128_unpack(&pa, a, s);                                         \
+    float128_unpack(&pb, b, s);                                         \
+    res = minmax_floats128(pa, pb, ismin, isiee, ismag, s);             \
+                                                                        \
+    switch(res) {                                                       \
+    case MINMAX_RES_A:                                                  \
+        return a;                                                       \
+    case MINMAX_RES_B:                                                  \
+        return b;                                                       \
+    case MINMAX_RES_SILENCE_A:                                          \
+        return float128_silence_nan(a, s);                              \
+    case MINMAX_RES_SILENCE_B:                                          \
+        return float128_silence_nan(b, s);                              \
+    case MINMAX_RES_DEFAULT_NAN:                                        \
+        return float128_default_nan(s);                                 \
+    default:                                                            \
+        g_assert_not_reached();                                         \
+    }                                                                   \
+}
+
+F128_MINMAX(min, true, false, false)
+F128_MINMAX(minnum, true, true, false)
+F128_MINMAX(minnummag, true, true, true)
+F128_MINMAX(max, false, false, false)
+F128_MINMAX(maxnum, false, true, false)
+F128_MINMAX(maxnummag, false, true, true)
+
+#undef F128_MINMAX
+
  /* Floating point compare */
  static FloatRelation compare_floats(FloatParts a, FloatParts b, bool is_quiet,
                                      float_status *s)
diff --git a/include/fpu/softfloat.h b/include/fpu/softfloat.h
index a38433deb4..4fab2ef6f4 100644
--- a/include/fpu/softfloat.h
+++ b/include/fpu/softfloat.h
@@ -1201,6 +1201,12 @@ float128 float128_muladd(float128, float128, float128, int,
  float128 float128_sqrt(float128, float_status *status);
  FloatRelation float128_compare(float128, float128, float_status *status);
  FloatRelation float128_compare_quiet(float128, float128, float_status *status);
+float128 float128_min(float128, float128, float_status *status);
+float128 float128_max(float128, float128, float_status *status);
+float128 float128_minnum(float128, float128, float_status *status);
+float128 float128_maxnum(float128, float128, float_status *status);
+float128 float128_minnummag(float128, float128, float_status *status);
+float128 float128_maxnummag(float128, float128, float_status *status);
  bool float128_is_quiet_nan(float128, float_status *status);
  bool float128_is_signaling_nan(float128, float_status *status);
  float128 float128_silence_nan(float128, float_status *status);
-- 
2.30.2



-- 
Thanks,

David / dhildenb


