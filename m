Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E60BF256AB2
	for <lists+qemu-devel@lfdr.de>; Sun, 30 Aug 2020 01:08:55 +0200 (CEST)
Received: from localhost ([::1]:60268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kC9xu-0007rW-Dn
	for lists+qemu-devel@lfdr.de; Sat, 29 Aug 2020 19:08:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kC9x8-0007Qq-QH
 for qemu-devel@nongnu.org; Sat, 29 Aug 2020 19:08:06 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:39291)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kC9x6-0007pR-RE
 for qemu-devel@nongnu.org; Sat, 29 Aug 2020 19:08:06 -0400
Received: by mail-wm1-x32f.google.com with SMTP id b79so2192487wmb.4
 for <qemu-devel@nongnu.org>; Sat, 29 Aug 2020 16:08:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:mime-version:from:to:date:subject;
 bh=U+zkkxAZ1s3ey5E86jqmV4D9ZXK41qCzhdnnGVcrilQ=;
 b=sO2XYWY3hYB5mrwa1SvkjA6G7E9tI+mXJu0je2udN5Y/lyuqGevCVN/xJC6p5uRRtX
 TM22siIYJhqppWtpEYa7GcX3IHKB/N4pykDIa3mpPFxtlUQM2PAKVtDrmZ1l/ZGaqcMG
 CLkSqmACSLftd5VQyBgdiqRWqXIgPB1MEdmKOHwI5/bP6N+Vc7+3rYrmAV4Rg98TWjJg
 LeGXkPF+5LMWdbyDEy4mo8a+OAdtwtXux0DXDzhBbQotfTybhZ8QrHMbMHALPMpJ+CAq
 u7dvI8PFtqqvxcUunn13sz6k0iM1cVC0X59/5o5c3dahOzukK9kcknJlIv4oZeX2N/1w
 X3xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version:from:to:date:subject;
 bh=U+zkkxAZ1s3ey5E86jqmV4D9ZXK41qCzhdnnGVcrilQ=;
 b=ICAk0fzdxsHJafrXVPx05wLazl+xWCLPE0FFHEi+x/tLo2pK0iEu+E4UXPXuKXtJlR
 hPq01PBZ8vjEyQAJnrZkOsMpvNLGbaSvqqjxfJv6Qo8rCn/qoCVW2q5O7YTqriDKa2Y4
 YeoBXg46nXtPnRQUouSJEREAyRUIKa1ZNFDC7saoFZrTSC/80tAM2rnf9D6sHjqiOCAy
 WTiPcVELojJ3522WVN312QoiW8SONy0Mqb9z7YdF3/LcvvKSEpW/NNhWbxMwLDeNIyqE
 wiyhDmKwKKgg9YiA/gw+UoUcAqOviL5nserwDgcoQb12Eo5qG3j6vS5RQNzTRhdVWlsZ
 iahg==
X-Gm-Message-State: AOAM532uX0LMmeK6XSfUZdb7DRasGmayxsRvJp3Khxq2MTBXTrd+WU9S
 Ay9b9pxUKreSmLRxR65Hc8f5zcrKhXBrIg==
X-Google-Smtp-Source: ABdhPJxzEMsjLZrqMqp5trPGFhKREBtcht7f9O0U8V3LLRDumZ1NKFYK8b/MAqW+GX6igmJvPUXWuw==
X-Received: by 2002:a05:600c:203:: with SMTP id
 3mr4545515wmi.108.1598742481792; 
 Sat, 29 Aug 2020 16:08:01 -0700 (PDT)
Received: from [127.0.1.1] ([197.58.77.158])
 by smtp.gmail.com with ESMTPSA id f19sm4803372wmh.44.2020.08.29.16.08.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Aug 2020 16:08:01 -0700 (PDT)
Message-ID: <5f4adfd1.1c69fb81.21887.f476@mx.google.com>
Content-Type: multipart/alternative;
 boundary="===============0488826604626956376=="
MIME-Version: 1.0
From: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun, 30 Aug 2020 01:07:59 +0200
Subject: [REPORT] Nightly Performance Tests - Saturday, August 29, 2020
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=ahmedkhaledkaraman@gmail.com; helo=mail-wm1-x32f.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, MIME_HTML_ONLY=0.1, MIME_HTML_ONLY_MULTI=0.001,
 MPART_ALT_DIFF=0.79, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--===============0488826604626956376==
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

<html><body><pre>
Host CPU         : Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
Host Memory      : 15.49 GB

Start Time (UTC) : 2020-08-29 22:35:01
End Time (UTC)   : 2020-08-29 23:07:59
Execution Time   : 0:32:57.786998

Status           : SUCCESS

Note:
Changes denoted by '-----' are less than 0.01%.

--------------------------------------------------------
            SUMMARY REPORT - COMMIT 39335fab
--------------------------------------------------------
                    AVERAGE RESULTS
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 158 345 257       -----     +1.693%
alpha              1 914 965 210       -----     +3.524%
arm                8 076 411 724       -----     +2.304%
hppa               4 261 660 282       -----     +3.162%
m68k               2 690 286 019       -----     +7.133%
mips               1 862 042 108       -----     +2.494%
mipsel             2 008 215 481       -----     +2.674%
mips64             1 918 638 076       -----     +2.818%
mips64el           2 051 558 104       -----     +3.026%
ppc                2 480 149 009       -----     +3.107%
ppc64              2 576 685 090       -----      +3.14%
ppc64le            2 558 841 352       -----     +3.172%
riscv64            1 406 710 751       -----      +2.65%
s390x              3 158 131 112       -----     +3.118%
sh4                2 364 461 215       -----     +3.331%
sparc64            3 318 816 026       -----     +3.861%
x86_64             1 775 796 489       -----     +2.155%
--------------------------------------------------------

                   DETAILED RESULTS
--------------------------------------------------------
Test Program: dijkstra_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            3 062 564 802       -----     +1.423%
alpha              3 191 863 094       -----     +3.696%
arm               16 357 176 719       -----     +2.347%
hppa               7 228 376 670       -----     +3.086%
m68k               4 294 055 120       -----     +9.693%
mips               3 051 470 521       -----     +2.428%
mipsel             3 231 521 199       -----     +2.869%
mips64             3 245 828 100       -----     +2.596%
mips64el           3 414 220 121       -----     +3.021%
ppc                4 914 534 259       -----      +4.74%
ppc64              5 098 122 090       -----     +4.565%
ppc64le            5 082 391 080       -----     +4.579%
riscv64            2 192 297 538       -----     +1.956%
s390x              4 584 592 888       -----     +2.898%
sh4                3 949 055 211       -----     +3.464%
sparc64            4 586 220 801       -----     +4.238%
x86_64             2 484 100 236       -----     +1.751%
--------------------------------------------------------
--------------------------------------------------------
Test Program: dijkstra_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 210 194 213       -----     +1.493%
alpha              1 494 131 792       -----      +2.15%
arm                8 262 944 317       -----     +2.665%
hppa               5 207 293 281       -----     +3.046%
m68k               1 725 873 574       -----     +2.528%
mips               1 495 245 241       -----     +1.493%
mipsel             1 497 140 812       -----     +1.479%
mips64             1 715 422 394       -----     +1.894%
mips64el           1 695 211 434       -----     +1.909%
ppc                2 014 572 096       -----      +1.82%
ppc64              2 206 239 628       -----     +2.137%
ppc64le            2 197 989 010       -----     +2.146%
riscv64            1 354 919 707       -----     +2.396%
s390x              2 916 086 767       -----     +1.236%
sh4                1 990 548 527       -----      +2.67%
sparc64            2 874 257 044      +0.07%     +3.831%
x86_64             1 553 996 279       -----     +2.121%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            1 412 251 151       -----       +0.3%
alpha              3 233 987 397       -----     +7.473%
arm                8 545 187 751       -----     +1.088%
hppa               3 483 519 295       -----     +4.466%
m68k               3 919 104 247       -----    +18.432%
mips               2 344 782 089       -----     +4.091%
mipsel             3 329 894 022       -----     +5.177%
mips64             2 359 038 211       -----     +4.076%
mips64el           3 343 644 653       -----     +5.166%
ppc                3 209 470 951       -----     +3.247%
ppc64              3 287 473 512       -----     +3.172%
ppc64le            3 287 160 906       -----     +3.172%
riscv64            1 221 633 321       -----     +0.279%
s390x              2 874 154 523       -----     +5.825%
sh4                3 543 962 208       -----     +6.416%
sparc64            3 426 211 454       -----     +7.141%
x86_64             1 248 931 694       -----     +0.323%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64              598 680 569       -----     +0.585%
alpha                372 431 083       -----     +0.675%
arm                  746 581 120       -----     +1.462%
hppa                 674 240 997       -----     +1.178%
m68k                 410 560 839     +0.017%     +0.916%
mips                 499 709 734       -----     +0.533%
mipsel               499 502 903       -----     +0.498%
mips64               481 560 174       -----       +0.6%
mips64el             465 068 492       -----     +0.621%
ppc                  341 341 104       -----     +0.946%
ppc64                393 757 808       -----     +0.956%
ppc64le              393 964 848       -----     +0.961%
riscv64              351 706 052       -----     +0.784%
s390x                494 439 135       -----     +0.601%
sh4                  402 686 938       -----     +0.904%
sparc64              495 977 156       -----     +1.197%
x86_64               402 940 344       -----     +0.836%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 709 678 620       -----     +2.417%
alpha              1 969 461 232       -----     +3.681%
arm                8 323 033 964       -----     +2.588%
hppa               3 188 294 143       -----     +2.899%
m68k               4 953 943 611       -----    +15.153%
mips               2 123 927 417       -----     +3.056%
mipsel             2 124 217 239       -----     +3.048%
mips64             1 999 041 907       -----     +3.405%
mips64el           1 996 424 374       -----     +3.409%
ppc                2 819 267 846       -----     +5.435%
ppc64              2 768 154 855       -----     +5.511%
ppc64le            2 724 791 424       -----     +5.603%
riscv64            1 638 337 878       -----     +4.021%
s390x              2 519 109 316       -----     +3.364%
sh4                2 595 555 413       -----     +2.995%
sparc64            3 989 009 654       -----     +2.748%
x86_64             2 033 476 441       -----     +3.235%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 193 401 313       -----     +2.916%
alpha              1 521 282 518       -----     +4.192%
arm                3 465 464 405       -----     +2.756%
hppa               2 280 003 848       -----      +3.82%
m68k               1 843 174 466       -----     +3.582%
mips               1 558 039 804       -----     +3.864%
mipsel             1 560 627 794       -----     +3.849%
mips64             1 563 433 267       -----     +4.413%
mips64el           1 542 677 495       -----     +4.474%
ppc                1 728 713 163       -----     +3.666%
ppc64              1 842 411 085       -----     +3.553%
ppc64le            1 791 824 250       -----     +3.661%
riscv64            1 348 888 823       -----     +4.655%
s390x              2 184 077 772       -----     +3.319%
sh4                1 946 511 510       -----     +3.625%
sparc64            3 452 237 261       -----     +2.938%
x86_64             1 813 558 667       -----     +3.537%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 592 196 444       -----     +2.467%
alpha              1 855 845 045       -----     +3.488%
arm                7 347 709 081       -----     +2.682%
hppa               4 758 732 786       -----     +3.542%
m68k               2 376 774 922       -----     +3.565%
mips               2 166 589 188       -----     +2.531%
mipsel             2 163 378 176       -----     +2.527%
mips64             2 029 245 810       -----     +3.117%
mips64el           2 011 620 201       -----     +3.144%
ppc                2 492 936 684       -----     +2.673%
ppc64              2 464 685 585       -----     +2.487%
ppc64le            2 445 240 956       -----     +2.505%
riscv64            1 625 050 659       -----     +3.953%
s390x              4 194 609 530       -----     +6.623%
sh4                2 164 135 232       -----     +3.166%
sparc64            4 299 525 980       -----     +4.065%
x86_64             2 940 013 803     -0.015%     +2.633%
--------------------------------------------------------
--------------------------------------------------------
Test Program: search_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 487 794 950       -----     +1.939%
alpha              1 680 719 526       -----     +2.835%
arm               11 563 196 437       -----     +2.848%
hppa               7 272 821 240       -----     +3.263%
m68k               1 998 801 378       -----     +3.197%
mips               1 656 572 871       -----     +1.958%
mipsel             1 659 441 708       -----     +1.946%
mips64             1 955 534 745       -----     +2.447%
mips64el           1 943 598 063       -----     +2.462%
ppc                2 320 355 976       -----     +2.332%
ppc64              2 552 636 157       -----     +2.741%
ppc64le            2 547 368 347       -----     +2.748%
riscv64            1 520 852 031       -----     +3.158%
s390x              5 497 978 971       -----     +1.078%
sh4                2 323 234 686       -----      +3.41%
sparc64            3 427 088 865       -----     +4.729%
x86_64             1 729 354 450       -----     +2.805%
--------------------------------------------------------


</pre></body></html>

--===============0488826604626956376==--

