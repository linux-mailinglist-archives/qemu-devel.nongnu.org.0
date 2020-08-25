Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 517F0252345
	for <lists+qemu-devel@lfdr.de>; Wed, 26 Aug 2020 00:04:01 +0200 (CEST)
Received: from localhost ([::1]:42110 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kAh2b-0000Xd-2y
	for lists+qemu-devel@lfdr.de; Tue, 25 Aug 2020 18:03:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kAh1k-0008W0-Fl
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 18:02:48 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:54911)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kAh1i-0001Gs-JC
 for qemu-devel@nongnu.org; Tue, 25 Aug 2020 18:02:48 -0400
Received: by mail-wm1-x32f.google.com with SMTP id s13so136075wmh.4
 for <qemu-devel@nongnu.org>; Tue, 25 Aug 2020 15:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:mime-version:from:to:date:subject;
 bh=d/YxWag1dkN1y1X124P1IHaGuPiMb8c23km7y+PLUho=;
 b=e8y+4lBFlLvrIdUBTTZEVge64lUnHdCIPupwOp6M6IDDGBo+LgqqAnsDk9X8h4PUpq
 37Mw9Zw1mNrXPUZIGJitgqZtVdQgMOMFpv2OHEwey4anACOxge1IotWNm25x0+yb0T7P
 dNzSdUzHvh79QXfMYqA0Nv7mWPbj4jMHyfW70IYw8dcOZ/ktZ1OrskTbFRoJHfde20Mf
 Chyzj1KEGyvy+/tYy1awCPoOIHYZsX+aOgkv+cewyxQYNefPmDJyUSvKGmXRadUzGFVy
 qsXOND+aXg3cpbUDBudWkV+Zokqvpz8RB7ANEk0LwzvuEsdxvedkPhb151/cRhzNUD4D
 eklQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version:from:to:date:subject;
 bh=d/YxWag1dkN1y1X124P1IHaGuPiMb8c23km7y+PLUho=;
 b=PKmA63LDKiZ3b/66g9pw+g8xT/81IiT7llsvhcD3v/1caTtzCvCedsLolKaTAHhzlN
 gBJeD5Kd6Zp2vdiNdmHfOlD4y2F2lSHuGrHqOI68cPDpqrODZFWykIKig0M3EVST3eFW
 46TaDLxiUWrBe+WVFweGuD+xjByDyB16jpT1olQUs0lkuA1/IX60/om8SnCVLu8gAUTb
 OcYf5s4a66tOb7j1AVXUnPSLkyWcj+k5Cl+xb9wVun7625yQp9YVzNMQL4rWMhjmy9+U
 UtYrAUHlW7HxBrkJkZe13agv1i3icFuJuNqG4cpZfvUQuDU5BevNDYh49Q+rV2CktV4W
 WKpg==
X-Gm-Message-State: AOAM531asZ1n0o89U8WudjM/s9YwwnFvoGnUvowePk+jl8AtetoZSRKT
 1u6RgKaNT5eU8Qi7Eq6m61SNiG//y/o=
X-Google-Smtp-Source: ABdhPJwFPFNq0CKBS/hInezb8JrZDp1hSiA5Gaqt7Kt4TFDm9EQ0yEPbRW+Z3qISjHa8h4HrHmGtyg==
X-Received: by 2002:a05:600c:214e:: with SMTP id
 v14mr3929161wml.118.1598392963798; 
 Tue, 25 Aug 2020 15:02:43 -0700 (PDT)
Received: from [127.0.1.1] ([197.58.67.125])
 by smtp.gmail.com with ESMTPSA id x133sm77397wmg.39.2020.08.25.15.02.42
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Aug 2020 15:02:43 -0700 (PDT)
Message-ID: <5f458a83.1c69fb81.8ee7d.01bd@mx.google.com>
Content-Type: multipart/alternative;
 boundary="===============5648243765428175282=="
MIME-Version: 1.0
From: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
To: qemu-devel@nongnu.org
Date: Wed, 26 Aug 2020 00:02:37 +0200
Subject: [REPORT] Nightly Performance Tests - Tuesday, August 25, 2020
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

--===============5648243765428175282==
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

<html><body><pre>
Host CPU         : Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
Host Memory      : 15.49 GB

Start Time (UTC) : 2020-08-25 21:30:01
End Time (UTC)   : 2020-08-25 22:02:37
Execution Time   : 0:32:35.896990

Status           : SUCCESS

Note:
Changes denoted by '-----' are less than 0.01%.

--------------------------------------------------------
            SUMMARY REPORT - COMMIT d1a2b51f
--------------------------------------------------------
                    AVERAGE RESULTS
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 158 355 274       -----     +1.693%
alpha              1 914 967 171       -----     +3.524%
arm                8 076 402 940       -----     +2.304%
hppa               4 261 685 987     -0.182%     +3.164%
m68k               2 690 273 044       -----     +7.131%
mips               1 862 033 667       -----     +2.494%
mipsel             2 008 211 069       -----     +2.674%
mips64             1 918 635 565       -----     +2.818%
mips64el           2 051 565 677       -----     +3.026%
ppc                2 480 141 217       -----     +3.107%
ppc64              2 576 713 959       -----     +3.143%
ppc64le            2 558 853 539       -----     +3.173%
riscv64            1 406 704 050       -----      +2.65%
s390x              3 158 140 046       -----     +3.118%
sh4                2 364 449 748       -----      +3.33%
sparc64            3 318 544 783       -----     +3.851%
x86_64             1 775 844 158       -----     +2.156%
--------------------------------------------------------

                   DETAILED RESULTS
--------------------------------------------------------
Test Program: dijkstra_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            3 062 583 464       -----     +1.424%
alpha              3 191 864 698       -----     +3.696%
arm               16 357 157 526       -----     +2.347%
hppa               7 228 376 315     -0.139%     +3.086%
m68k               4 294 016 587       -----     +9.692%
mips               3 051 419 166       -----     +2.427%
mipsel             3 231 509 618       -----     +2.869%
mips64             3 245 837 754       -----     +2.596%
mips64el           3 414 195 796       -----     +3.021%
ppc                4 914 520 972     -0.041%      +4.74%
ppc64              5 098 154 311       -----     +4.565%
ppc64le            5 082 419 054       -----      +4.58%
riscv64            2 192 294 915       -----     +1.955%
s390x              4 584 503 977       -----     +2.896%
sh4                3 949 036 447       -----     +3.464%
sparc64            4 586 203 546       -----     +4.237%
x86_64             2 484 092 105       -----      +1.75%
--------------------------------------------------------
--------------------------------------------------------
Test Program: dijkstra_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 210 194 577       -----     +1.493%
alpha              1 494 133 274       -----      +2.15%
arm                8 262 935 967       -----     +2.665%
hppa               5 207 318 306       -----     +3.047%
m68k               1 725 856 962       -----     +2.527%
mips               1 495 227 032       -----     +1.492%
mipsel             1 497 147 869       -----     +1.479%
mips64             1 715 388 570       -----     +1.892%
mips64el           1 695 276 864       -----     +1.913%
ppc                2 014 557 389       -----     +1.819%
ppc64              2 206 267 901       -----     +2.139%
ppc64le            2 197 998 781       -----     +2.146%
riscv64            1 354 912 745       -----     +2.396%
s390x              2 916 247 062       -----     +1.241%
sh4                1 990 532 533       -----     +2.669%
sparc64            2 872 231 051       -----     +3.758%
x86_64             1 553 981 241       -----      +2.12%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            1 412 273 223       -----     +0.302%
alpha              3 233 991 649       -----     +7.473%
arm                8 545 173 979       -----     +1.088%
hppa               3 483 597 802     -1.267%     +4.468%
m68k               3 919 065 529       -----    +18.431%
mips               2 344 774 894       -----     +4.091%
mipsel             3 329 886 464       -----     +5.177%
mips64             2 359 046 988       -----     +4.076%
mips64el           3 343 664 785       -----     +5.167%
ppc                3 209 457 051       -----     +3.246%
ppc64              3 287 503 981       -----     +3.173%
ppc64le            3 287 189 065       -----     +3.173%
riscv64            1 221 603 682       -----     +0.277%
s390x              2 874 199 923       -----     +5.827%
sh4                3 543 943 634       -----     +6.416%
sparc64            3 426 150 004       -----     +7.139%
x86_64             1 248 917 276       -----     +0.322%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64              598 681 621       -----     +0.585%
alpha                372 437 418       -----     +0.677%
arm                  746 583 193       -----     +1.462%
hppa                 674 278 359       -----     +1.183%
m68k                 410 495 553       -----       +0.9%
mips                 499 698 837       -----     +0.531%
mipsel               499 500 429       -----     +0.497%
mips64               481 554 664       -----     +0.599%
mips64el             465 057 054       -----     +0.619%
ppc                  341 334 603       -----     +0.944%
ppc64                393 796 203       -----     +0.966%
ppc64le              393 977 298       -----     +0.965%
riscv64              351 709 769       -----     +0.785%
s390x                494 427 384       -----     +0.599%
sh4                  402 668 444       -----     +0.899%
sparc64              495 952 959       -----     +1.192%
x86_64               402 928 461       -----     +0.833%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 709 683 624       -----     +2.417%
alpha              1 969 460 172       -----      +3.68%
arm                8 322 998 390       -----     +2.587%
hppa               3 188 301 995     -0.047%       +2.9%
m68k               4 953 930 065       -----    +15.153%
mips               2 123 919 587       -----     +3.055%
mipsel             2 124 212 187       -----     +3.048%
mips64             1 999 047 826       -----     +3.405%
mips64el           1 996 426 772       -----     +3.409%
ppc                2 819 267 902     -0.021%     +5.435%
ppc64              2 768 186 548       -----     +5.513%
ppc64le            2 724 803 772     -0.011%     +5.603%
riscv64            1 638 328 937       -----     +4.021%
s390x              2 519 081 708       -----     +3.362%
sh4                2 595 545 154       -----     +2.994%
sparc64            3 988 986 587       -----     +2.747%
x86_64             2 033 468 588       -----     +3.234%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 193 392 565       -----     +2.916%
alpha              1 521 291 933       -----     +4.193%
arm                3 465 445 043       -----     +2.756%
hppa               2 280 034 340       -----     +3.821%
m68k               1 843 189 041       -----     +3.583%
mips               1 558 024 873       -----     +3.863%
mipsel             1 560 583 980       -----     +3.846%
mips64             1 563 415 749       -----     +4.412%
mips64el           1 542 677 320       -----     +4.474%
ppc                1 728 698 880       -----     +3.665%
ppc64              1 842 444 545       -----     +3.555%
ppc64le            1 791 822 067       -----     +3.661%
riscv64            1 348 866 430       -----     +4.654%
s390x              2 184 073 151       -----     +3.319%
sh4                1 946 492 539       -----     +3.624%
sparc64            3 452 215 585       -----     +2.937%
x86_64             1 813 544 414       -----     +3.537%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 592 218 418       -----     +2.468%
alpha              1 855 834 626       -----     +3.487%
arm                7 347 721 165       -----     +2.682%
hppa               4 758 753 926       -----     +3.543%
m68k               2 376 811 462       -----     +3.567%
mips               2 166 608 045       -----     +2.532%
mipsel             2 163 392 541       -----     +2.528%
mips64             2 029 251 969       -----     +3.117%
mips64el           2 011 628 621       -----     +3.145%
ppc                2 492 942 463       -----     +2.673%
ppc64              2 464 702 554       -----     +2.488%
ppc64le            2 445 253 307       -----     +2.505%
riscv64            1 625 053 328       -----     +3.953%
s390x              4 194 608 798       -----     +6.623%
sh4                2 164 142 539       -----     +3.166%
sparc64            4 299 516 539       -----     +4.065%
x86_64             2 940 456 780       -----     +2.649%
--------------------------------------------------------
--------------------------------------------------------
Test Program: search_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 487 814 704       -----      +1.94%
alpha              1 680 723 605       -----     +2.835%
arm               11 563 208 260       -----     +2.848%
hppa               7 272 826 858       -----     +3.263%
m68k               1 998 819 159       -----     +3.198%
mips               1 656 596 909       -----     +1.959%
mipsel             1 659 455 464       -----     +1.947%
mips64             1 955 541 001       -----     +2.447%
mips64el           1 943 598 207       -----     +2.462%
ppc                2 320 350 477       -----     +2.332%
ppc64              2 552 655 634       -----     +2.742%
ppc64le            2 547 364 971       -----     +2.748%
riscv64            1 520 862 601       -----     +3.159%
s390x              5 497 978 370       -----     +1.078%
sh4                2 323 236 696       -----      +3.41%
sparc64            3 427 101 999       -----      +4.73%
x86_64             1 729 364 402       -----     +2.806%
--------------------------------------------------------


</pre></body></html>

--===============5648243765428175282==--

