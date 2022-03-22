Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 846654E3B47
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Mar 2022 09:56:05 +0100 (CET)
Received: from localhost ([::1]:40110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWaJA-0002ou-57
	for lists+qemu-devel@lfdr.de; Tue, 22 Mar 2022 04:56:04 -0400
Received: from eggs.gnu.org ([209.51.188.92]:37696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWaHA-0001y0-U1
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 04:54:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:40627)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <david@redhat.com>) id 1nWaH5-0007fy-R6
 for qemu-devel@nongnu.org; Tue, 22 Mar 2022 04:53:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647939234;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0l+XxdppfOcT8Wnqk3AMrd0Ci5fRwesaSraSQpnx85c=;
 b=b4BIuW+Fzc2BafqWnubJRLjPfBQbyuVIl5enZeteaV7VJfHkK2FAV7TUG4BGQXoNECAUpW
 A1iRwTx8AvLM8F1elqDDdgNViHtxs4tt9IL+u8HaBoha6pRQx1zsgdAn7EW/O2DXOr1YyL
 cho1u0G2QHUhqyLdLCA9VFD+kGiOqhI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-321-C7BmWBGKM76nQKo22BIFxw-1; Tue, 22 Mar 2022 04:53:51 -0400
X-MC-Unique: C7BmWBGKM76nQKo22BIFxw-1
Received: by mail-wr1-f71.google.com with SMTP id
 z16-20020adff1d0000000b001ef7dc78b23so3809682wro.12
 for <qemu-devel@nongnu.org>; Tue, 22 Mar 2022 01:53:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:organization:subject
 :in-reply-to:content-transfer-encoding;
 bh=0l+XxdppfOcT8Wnqk3AMrd0Ci5fRwesaSraSQpnx85c=;
 b=Pg9kbsfFyEj1AhoWBVa7goGDAeiE+koukbEzWSerhSunFhsMY2UEMJpXbMaJ7C6C5U
 W2EVXU/lSp7vnz7Ua/MEYiVzjl6NTjAxADJ6C+7T9xyrK+AcDV+IuN3x8B/34KNfyHjf
 TubMnhiMbQNvm/Kzj08LGcwntnJNVbDRJpw2zoBzTqwR1k5veXpPY0NFvSzyd4epSUDj
 6zHPLzRtI48ffI2NK1E0jrLE+i7Rppx9HAujITwTH6fudIvcKG31eGKRNx3pSZuE3J6w
 Mku6BXI4cFgfdaCdbJud83dRmF7uMPw351PHEtR4NVHEx49p5oyhmgjuvTFQaRoGJ4fB
 +yTA==
X-Gm-Message-State: AOAM533Y9x6doZBQSBmf5ZNusKZNBpveOumztl7aGkzwyS7xuWvsa2kK
 fGp9UGPVl6f2xXSRctprRldkH7/bW+N4OlGlR1k5Ee9uZufM9DkJWz4SfkQtmBINAErJcZknEjk
 U7NsCr/E6FHBbM+A=
X-Received: by 2002:a05:6000:18a2:b0:203:d2fa:95c9 with SMTP id
 b2-20020a05600018a200b00203d2fa95c9mr21164947wri.554.1647939230330; 
 Tue, 22 Mar 2022 01:53:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz32j8moVNRhVMkcfmViKFeZF65xVB4TTse5q6dZYSS+a4NvhKiD50spFIj3e8JvPRGtHPqBQ==
X-Received: by 2002:a05:6000:18a2:b0:203:d2fa:95c9 with SMTP id
 b2-20020a05600018a200b00203d2fa95c9mr21164921wri.554.1647939229979; 
 Tue, 22 Mar 2022 01:53:49 -0700 (PDT)
Received: from ?IPV6:2003:cb:c708:de00:549e:e4e4:98df:ff72?
 (p200300cbc708de00549ee4e498dfff72.dip0.t-ipconnect.de.
 [2003:cb:c708:de00:549e:e4e4:98df:ff72])
 by smtp.gmail.com with ESMTPSA id
 a25-20020a5d4579000000b00203ee633c2asm11607703wrc.1.2022.03.22.01.53.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 22 Mar 2022 01:53:49 -0700 (PDT)
Message-ID: <c3bb72da-c390-f9b5-5254-f8c16df21427@redhat.com>
Date: Tue, 22 Mar 2022 09:53:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.6.2
To: David Miller <dmiller423@gmail.com>, qemu-s390x@nongnu.org,
 qemu-devel@nongnu.org, thuth@redhat.com
References: <20220322000441.26495-1-dmiller423@gmail.com>
 <20220322000441.26495-11-dmiller423@gmail.com>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Subject: Re: [PATCH v4 10/11] tests/tcg/s390x: Tests for Vector Enhancements
 Facility 2
In-Reply-To: <20220322000441.26495-11-dmiller423@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=david@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: pasic@linux.ibm.com, borntraeger@linux.ibm.com, farman@linux.ibm.com,
 cohuck@redhat.com, richard.henderson@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

On 22.03.22 01:04, David Miller wrote:
> Signed-off-by: David Miller <dmiller423@gmail.com>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Checkpatch complains about three things:

ERROR: space prohibited between function name and open parenthesis '('
#262: FILE: tests/tcg/s390x/vxeh2_vlstr.c:115:
+    vler (&vd, &vs, ES16);  vtst(vd, vt_v_er16);

ERROR: space prohibited between function name and open parenthesis '('
#265: FILE: tests/tcg/s390x/vxeh2_vlstr.c:118:
+    vlbr (&vd, &vs, ES16);  vtst(vd, vt_v_br16);

ERROR: space prohibited between function name and open parenthesis '('
#383: FILE: tests/tcg/s390x/vxeh2_vs.c:84:
+    vsl (&vd, &vs, &vsi);       vtst(vd, vt_vsl);

total: 3 errors, 1 warnings, 348 lines checked


> ---
>  tests/tcg/s390x/Makefile.target |   8 ++
>  tests/tcg/s390x/vxeh2_vcvt.c    |  97 +++++++++++++++++++++
>  tests/tcg/s390x/vxeh2_vlstr.c   | 146 ++++++++++++++++++++++++++++++++
>  tests/tcg/s390x/vxeh2_vs.c      |  91 ++++++++++++++++++++
>  4 files changed, 342 insertions(+)
>  create mode 100644 tests/tcg/s390x/vxeh2_vcvt.c
>  create mode 100644 tests/tcg/s390x/vxeh2_vlstr.c
>  create mode 100644 tests/tcg/s390x/vxeh2_vs.c
> 
> diff --git a/tests/tcg/s390x/Makefile.target b/tests/tcg/s390x/Makefile.target
> index 8c9b6a13ce..921a056dd1 100644
> --- a/tests/tcg/s390x/Makefile.target
> +++ b/tests/tcg/s390x/Makefile.target
> @@ -16,6 +16,14 @@ TESTS+=shift
>  TESTS+=trap
>  TESTS+=signals-s390x
>  
> +VECTOR_TESTS=vxeh2_vs
> +VECTOR_TESTS+=vxeh2_vcvt
> +VECTOR_TESTS+=vxeh2_vlstr
> +
> +TESTS+=$(VECTOR_TESTS)
> +
> +$(VECTOR_TESTS): CFLAGS+=-march=z15 -O2


@Thomas, will that survive our test framework already, or do we have to
wait for the debain11 changes?

> +
>  ifneq ($(HAVE_GDB_BIN),)
>  GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
>  
> diff --git a/tests/tcg/s390x/vxeh2_vcvt.c b/tests/tcg/s390x/vxeh2_vcvt.c
> new file mode 100644
> index 0000000000..71ecbd77b0
> --- /dev/null
> +++ b/tests/tcg/s390x/vxeh2_vcvt.c
> @@ -0,0 +1,97 @@
> +/*
> + * vxeh2_vcvt: vector-enhancements facility 2 vector convert *
> + */
> +#include <stdint.h>
> +
> +typedef union S390Vector {
> +    uint64_t d[2];  /* doubleword */
> +    uint32_t w[4];  /* word */
> +    uint16_t h[8];  /* halfword */
> +    uint8_t  b[16]; /* byte */
> +    float    f[4];
> +    double   fd[2];
> +    __uint128_t v;
> +} S390Vector;

Let's move that into a separate header (vx.h?) so we can reuse it.

> +
> +#define M_S 8
> +#define M4_XxC 4
> +#define M4_def M4_XxC
[...]

> diff --git a/tests/tcg/s390x/vxeh2_vlstr.c b/tests/tcg/s390x/vxeh2_vlstr.c
> new file mode 100644
> index 0000000000..bf2954e86d
> --- /dev/null
> +++ b/tests/tcg/s390x/vxeh2_vlstr.c
> @@ -0,0 +1,146 @@
> +/*
> + * vxeh2_vlstr: vector-enhancements facility 2 vector load/store reversed *
> + */
> +#include <stdint.h>
> +
> +typedef union S390Vector {
> +    uint64_t d[2];  /* doubleword */
> +    uint32_t w[4];  /* word */
> +    uint16_t h[8];  /* halfword */
> +    uint8_t  b[16]; /* byte */
> +    __uint128_t v;
> +} S390Vector;
> +
> +#define ES8  0
> +#define ES16 1
> +#define ES32 2
> +#define ES64 3

These should probably also go to the new header.

> +
> +#define vtst(v1, v2) \
> +    if (v1.d[0] != v2.d[0] || v1.d[1] != v2.d[1]) { \
> +        return 1;     \
> +    }
> +
> +static inline void vler(S390Vector *v1, const void *va, uint8_t m3)
> +{
> +    asm volatile("vler %[v1], 0(%[va]), %[m3]\n"
> +                : [v1] "+v" (v1->v)
> +                : [va]  "d" (va)
> +                , [m3]  "i" (m3)
> +                : "memory");
> +}
> +
> +static inline void vster(S390Vector *v1, const void *va, uint8_t m3)
> +{
> +    asm volatile("vster %[v1], 0(%[va]), %[m3]\n"
> +                : [va] "+d" (va)
> +                : [v1]  "v" (v1->v)
> +                , [m3]  "i" (m3)
> +                : "memory");
> +}
> +
> +static inline void vlbr(S390Vector *v1, void *va, const uint8_t m3)
> +{
> +    asm volatile("vlbr %[v1], 0(%[va]), %[m3]\n"
> +                : [v1] "+v" (v1->v)
> +                : [va]  "d" (va)
> +                , [m3]  "i" (m3)
> +                : "memory");
> +}
> +
> +static inline void vstbr(S390Vector *v1, void *va, const uint8_t m3)
> +{
> +    asm volatile("vstbr %[v1], 0(%[va]), %[m3]\n"
> +                : [va] "+d" (va)
> +                : [v1]  "v" (v1->v)
> +                , [m3]  "i" (m3)
> +                : "memory");
> +}
> +
> +
> +static inline void vlebrh(S390Vector *v1, void *va, const uint8_t m3)
> +{
> +    asm volatile("vlebrh %[v1], 0(%[va]), %[m3]\n"
> +                : [v1] "+v" (v1->v)
> +                : [va]  "d" (va)
> +                , [m3]  "i" (m3)
> +                : "memory");
> +}
> +
> +static inline void vstebrh(S390Vector *v1, void *va, const uint8_t m3)
> +{
> +    asm volatile("vstebrh %[v1], 0(%[va]), %[m3]\n"
> +                : [va] "+d" (va)
> +                : [v1]  "v" (v1->v)
> +                , [m3]  "i" (m3)
> +                : "memory");
> +}
> +
> +static inline void vllebrz(S390Vector *v1, void *va, const uint8_t m3)
> +{
> +    asm volatile("vllebrz %[v1], 0(%[va]), %[m3]\n"
> +                : [v1] "+v" (v1->v)
> +                : [va]  "d" (va)
> +                , [m3]  "i" (m3)
> +                : "memory");
> +}
> +
> +static inline void vlbrrep(S390Vector *v1, void *va, const uint8_t m3)
> +{
> +    asm volatile("vlbrrep %[v1], 0(%[va]), %[m3]\n"
> +                : [v1] "+v" (v1->v)
> +                : [va]  "d" (va)
> +                , [m3]  "i" (m3)
> +                : "memory");
> +}
> +
> +

Superfluous empty line.

> +int main(int argc, char *argv[])
> +{
> +    S390Vector vd = { .d[0] = 0, .d[1] = 0 };
> +    S390Vector vs = { .d[0] = 0x8FEEDDCCBBAA9988ull,
> +                      .d[1] = 0x7766554433221107ull };
> +
> +    const S390Vector vt_v_er16 = {
> +        .h[0] = 0x1107, .h[1] = 0x3322, .h[2] = 0x5544, .h[3] = 0x7766,
> +        .h[4] = 0x9988, .h[5] = 0xBBAA, .h[6] = 0xDDCC, .h[7] = 0x8FEE };
> +
> +    const S390Vector vt_v_br16 = {
> +        .h[0] = 0xEE8F, .h[1] = 0xCCDD, .h[2] = 0xAABB, .h[3] = 0x8899,
> +        .h[4] = 0x6677, .h[5] = 0x4455, .h[6] = 0x2233, .h[7] = 0x0711 };
> +
> +    int ix;
> +    uint64_t ss64 = 0xFEEDFACE0BADBEEFull, sd64 = 0;
> +
> +    vler (&vd, &vs, ES16);  vtst(vd, vt_v_er16);
> +    vster(&vs, &vd, ES16);  vtst(vd, vt_v_er16);
> +
> +    vlbr (&vd, &vs, ES16);  vtst(vd, vt_v_br16);
> +    vstbr(&vs, &vd, ES16);  vtst(vd, vt_v_br16);
> +

Please put each statement on a new line.

> +    vlebrh(&vd, &ss64, 5);
> +    if (0xEDFE != vd.h[5]) {
> +        return 1;
> +    }
> +
> +    vstebrh(&vs, (uint8_t *)&sd64 + 4, 7);
> +    if (0x0000000007110000ull != sd64) {
> +        return 1;
> +    }
> +
> +    vllebrz(&vd, (uint8_t *)&ss64 + 3, 2);
> +    for (ix = 0; ix < 4; ix++) {
> +        if (vd.w[ix] != (ix != 1 ? 0 : 0xBEAD0BCE)) {
> +            return 1;
> +        }
> +    }
> +
> +    vlbrrep(&vd, (uint8_t *)&ss64 + 4, 1);
> +    for (ix = 0; ix < 8; ix++) {
> +        if (0xAD0B != vd.h[ix]) {
> +            return 1;
> +        }
> +    }
> +
> +    return 0;
> +}
> diff --git a/tests/tcg/s390x/vxeh2_vs.c b/tests/tcg/s390x/vxeh2_vs.c
> new file mode 100644
> index 0000000000..04a3d4d7bb
> --- /dev/null
> +++ b/tests/tcg/s390x/vxeh2_vs.c

[...]

> +int main(int argc, char *argv[])
> +{
> +    const S390Vector vt_vsl  = { .d[0] = 0x7FEDBB32D5AA311Dull,
> +                                 .d[1] = 0xBB65AA10912220C0ull };
> +    const S390Vector vt_vsra = { .d[0] = 0xF1FE6E7399AA5466ull,
> +                                 .d[1] = 0x0E762A5188221044ull };
> +    const S390Vector vt_vsrl = { .d[0] = 0x11FE6E7399AA5466ull,
> +                                 .d[1] = 0x0E762A5188221044ull };
> +    const S390Vector vt_vsld = { .d[0] = 0x7F76EE65DD54CC43ull,
> +                                 .d[1] = 0xBB32AA2199108838ull };
> +    const S390Vector vt_vsrd = { .d[0] = 0x0E060802040E000Aull,
> +                                 .d[1] = 0x0C060802040E000Aull };
> +    S390Vector vs  = { .d[0] = 0x8FEEDDCCBBAA9988ull,
> +                       .d[1] = 0x7766554433221107ull };
> +    S390Vector  vd = { .d[0] = 0, .d[1] = 0 };
> +    S390Vector vsi = { .d[0] = 0, .d[1] = 0 };
> +
> +    for (int ix = 0; ix < 16; ix++) {
> +        vsi.b[ix] = (1 + (5 ^ ~ix)) & 7;
> +    }
> +
> +    vsl (&vd, &vs, &vsi);       vtst(vd, vt_vsl);
> +    vsra(&vd, &vs, &vsi);       vtst(vd, vt_vsra);
> +    vsrl(&vd, &vs, &vsi);       vtst(vd, vt_vsrl);
> +    vsld(&vd, &vs, &vsi, 3);  vtst(vd, vt_vsld);
> +    vsrd(&vd, &vs, &vsi, 15); vtst(vd, vt_vsrd);

Dito. Please put each statement on a new line.

> +
> +    return 0;
> +}


-- 
Thanks,

David / dhildenb


