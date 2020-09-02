Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 03C6225B727
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Sep 2020 01:11:55 +0200 (CEST)
Received: from localhost ([::1]:59284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kDbv0-00061G-30
	for lists+qemu-devel@lfdr.de; Wed, 02 Sep 2020 19:11:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38494)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kDbmA-0007BB-TH
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 19:02:46 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:55489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kDbm8-00027r-JQ
 for qemu-devel@nongnu.org; Wed, 02 Sep 2020 19:02:46 -0400
Received: by mail-wm1-x32f.google.com with SMTP id a65so921785wme.5
 for <qemu-devel@nongnu.org>; Wed, 02 Sep 2020 16:02:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:mime-version:from:to:date:subject;
 bh=Qb24mO4LTGG+/HgfD8ikhpJ/VJLwIlAggaDsZQac3QE=;
 b=ekbDSbxyXIUr5b8EvouVwWle3V6lSsgqLuThwOc10uM2byh1KDo52ZY1WTgNGq/qyC
 IK2kVUFhObHyfvrZq8LOivKybrDaCzcTMDRO8beVDqsXAWq4RXZJbk9Rfym0hbDIcJEN
 uk1EvicI3z6H31H7wsVzYDix3ZMjXVW/shHgD1E7t8ggjMihi3W7Ia6pg8nWiJ1//7L1
 DIIlw/HusHMDZrV5Up8UfqEkz7Jmp/g+5ZL0WJf9OhxVe25dNNS03H288wJhJUz76u81
 IXg3tXp3V8V64n6A9VvgIbhZrM7fgCflou+/uBlyMbDU0WsL2bNn6uyofLHmzG1MHdVd
 B7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version:from:to:date:subject;
 bh=Qb24mO4LTGG+/HgfD8ikhpJ/VJLwIlAggaDsZQac3QE=;
 b=Q9Cyw8UYRtedYzUYAvx7RPaWtGMBGFgntkKNS59oExozmAWNTrbVz9qMrlOmx+OfYF
 fD30LvLGVq1RjFK3u3liINZSMSb9mLIFabmxtN1pAvUerO1K1B83El7KdttuuYRnIiQm
 OONxr5DW8shVxjBU9Iw/zrPLzoFyU0OLJqJ50n9s7VfwqD29Sv7JdP6d7UAdZSbNoNwH
 MMuEq4ldmC47aLig6lEpmThohxXikoRd4sYponupcqiVskEz3TjM+YkvYlUQEXYsd1wG
 OjE4jeqqqYAcF6WX1FfmKHVRGd3ayOBT5DKHDgnRvsOVA/uePFmme324ulSYjM4h5EyS
 hVjA==
X-Gm-Message-State: AOAM533Pmf/jth6gjsmaK7pbmofS4ACXupLYPmgI1pXK/YIbI/j8yGfX
 uYCtLj4XvNzMM9U0yFoHMJEUd+k1uX8=
X-Google-Smtp-Source: ABdhPJyM9RZS4KPvFHDrf+HBKJpnbL88BKwLVa/pO6U9kUf6X37LiWgk4g4IWOPSrVb3BYL8AC7w9A==
X-Received: by 2002:a1c:a746:: with SMTP id q67mr410680wme.128.1599087761964; 
 Wed, 02 Sep 2020 16:02:41 -0700 (PDT)
Received: from [127.0.1.1] ([197.58.110.125])
 by smtp.gmail.com with ESMTPSA id a11sm1690399wrq.0.2020.09.02.16.02.39
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Sep 2020 16:02:41 -0700 (PDT)
Message-ID: <5f502491.1c69fb81.dbace.564f@mx.google.com>
Content-Type: multipart/alternative;
 boundary="===============7260323371986803525=="
MIME-Version: 1.0
From: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu, 03 Sep 2020 01:02:38 +0200
Subject: [REPORT] Nightly Performance Tests - Wednesday, September 2, 2020
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

--===============7260323371986803525==
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

<html><body><pre>
Host CPU         : Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
Host Memory      : 15.49 GB

Start Time (UTC) : 2020-09-02 22:30:02
End Time (UTC)   : 2020-09-02 23:02:38
Execution Time   : 0:32:36.315663

Status           : SUCCESS

Note:
Changes denoted by '-----' are less than 0.01%.

--------------------------------------------------------
            SUMMARY REPORT - COMMIT ed215cec
--------------------------------------------------------
                    AVERAGE RESULTS
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 158 360 930       -----     +1.694%
alpha              1 914 970 396       -----     +3.524%
arm                8 076 521 559       -----     +2.308%
hppa               4 261 655 888       -----     +3.162%
m68k               2 690 291 454       -----     +7.134%
mips               1 862 055 271       -----     +2.495%
mipsel             2 008 237 057       -----     +2.676%
mips64             1 918 627 557       -----     +2.818%
mips64el           2 051 536 272       -----     +3.024%
ppc                2 480 160 545       -----     +3.108%
ppc64              2 576 707 600       -----     +3.142%
ppc64le            2 558 869 865       -----     +3.174%
riscv64            1 406 710 004       -----      +2.65%
s390x              3 158 126 452       -----     +3.118%
sh4                2 364 458 094       -----     +3.331%
sparc64            3 318 800 942       -----      +3.86%
x86_64             1 775 807 445       -----     +2.156%
--------------------------------------------------------

                   DETAILED RESULTS
--------------------------------------------------------
Test Program: dijkstra_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            3 062 596 104       -----     +1.424%
alpha              3 191 868 433       -----     +3.696%
arm               16 357 285 680       -----     +2.348%
hppa               7 228 372 058       -----     +3.086%
m68k               4 294 057 266       -----     +9.693%
mips               3 051 467 316       -----     +2.428%
mipsel             3 231 546 158       -----      +2.87%
mips64             3 245 820 632       -----     +2.596%
mips64el           3 414 198 738       -----     +3.021%
ppc                4 914 545 594       -----      +4.74%
ppc64              5 098 147 494       -----     +4.565%
ppc64le            5 082 438 783       -----      +4.58%
riscv64            2 192 294 741       -----     +1.955%
s390x              4 584 575 668       -----     +2.897%
sh4                3 949 047 124       -----     +3.464%
sparc64            4 586 207 238       -----     +4.237%
x86_64             2 484 112 825       -----     +1.751%
--------------------------------------------------------
--------------------------------------------------------
Test Program: dijkstra_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 210 209 502       -----     +1.494%
alpha              1 494 136 649       -----     +2.151%
arm                8 263 038 159       -----     +2.667%
hppa               5 207 287 269       -----     +3.046%
m68k               1 725 878 249       -----     +2.528%
mips               1 495 262 663       -----     +1.494%
mipsel             1 497 165 654       -----      +1.48%
mips64             1 715 423 109       -----     +1.894%
mips64el           1 695 190 855       -----     +1.908%
ppc                2 014 586 104       -----     +1.821%
ppc64              2 206 261 948       -----     +2.138%
ppc64le            2 198 014 858       -----     +2.147%
riscv64            1 354 904 958       -----     +2.395%
s390x              2 916 083 991       -----     +1.236%
sh4                1 990 545 700       -----      +2.67%
sparc64            2 874 242 969       -----      +3.83%
x86_64             1 554 003 185       -----     +2.121%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            1 412 263 878       -----     +0.301%
alpha              3 233 995 126       -----     +7.473%
arm                8 545 296 938       -----      +1.09%
hppa               3 483 500 827       -----     +4.466%
m68k               3 919 108 993       -----    +18.433%
mips               2 344 799 492       -----     +4.092%
mipsel             3 329 919 049       -----     +5.178%
mips64             2 359 033 307       -----     +4.075%
mips64el           3 343 621 461       -----     +5.165%
ppc                3 209 482 237       -----     +3.247%
ppc64              3 287 498 161       -----     +3.173%
ppc64le            3 287 189 271       -----     +3.173%
riscv64            1 221 630 246       -----     +0.279%
s390x              2 874 149 025       -----     +5.825%
sh4                3 543 956 724       -----     +6.416%
sparc64            3 426 197 351       -----     +7.141%
x86_64             1 248 941 386       -----     +0.324%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64              598 695 966       -----     +0.588%
alpha                372 441 086       -----     +0.678%
arm                  746 695 792       -----     +1.478%
hppa                 674 243 371       -----     +1.178%
m68k                 410 570 905       -----     +0.919%
mips                 499 721 989       -----     +0.536%
mipsel               499 530 390       -----     +0.503%
mips64               481 538 437       -----     +0.596%
mips64el             465 036 400       -----     +0.614%
ppc                  341 360 528       -----     +0.952%
ppc64                393 790 179       -----     +0.964%
ppc64le              393 995 326       -----     +0.969%
riscv64              351 710 943       -----     +0.785%
s390x                494 438 856       -----     +0.601%
sh4                  402 684 133       -----     +0.903%
sparc64              495 963 176       -----     +1.194%
x86_64               402 952 435       -----     +0.839%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 709 691 341       -----     +2.418%
alpha              1 969 463 985       -----     +3.681%
arm                8 323 159 298       -----     +2.589%
hppa               3 188 290 203       -----     +2.899%
m68k               4 953 945 748       -----    +15.153%
mips               2 123 944 603       -----     +3.057%
mipsel             2 124 242 103       -----     +3.049%
mips64             1 999 034 424       -----     +3.405%
mips64el           1 996 406 039       -----     +3.408%
ppc                2 819 279 014       -----     +5.435%
ppc64              2 768 180 357       -----     +5.512%
ppc64le            2 724 820 728       -----     +5.604%
riscv64            1 638 337 683       -----     +4.021%
s390x              2 519 109 080       -----     +3.364%
sh4                2 595 557 996       -----     +2.995%
sparc64            3 988 995 549       -----     +2.747%
x86_64             2 033 491 544       -----     +3.236%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 193 414 005       -----     +2.917%
alpha              1 521 295 371       -----     +4.193%
arm                3 465 573 356       -----     +2.759%
hppa               2 280 005 893       -----      +3.82%
m68k               1 843 184 470       -----     +3.583%
mips               1 558 051 901       -----     +3.864%
mipsel             1 560 652 671       -----      +3.85%
mips64             1 563 402 353       -----     +4.411%
mips64el           1 542 654 195       -----     +4.472%
ppc                1 728 727 142       -----     +3.666%
ppc64              1 842 438 749       -----     +3.555%
ppc64le            1 791 835 754       -----     +3.662%
riscv64            1 348 893 988       -----     +4.656%
s390x              2 184 072 221       -----     +3.319%
sh4                1 946 506 047       -----     +3.625%
sparc64            3 452 220 738       -----     +2.937%
x86_64             1 813 568 162       -----     +3.538%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 592 209 116       -----     +2.467%
alpha              1 855 838 228       -----     +3.487%
arm                7 347 817 962       -----     +2.684%
hppa               4 758 729 337       -----     +3.542%
m68k               2 376 777 183       -----     +3.566%
mips               2 166 603 814       -----     +2.532%
mipsel             2 163 387 186       -----     +2.528%
mips64             2 029 241 029       -----     +3.117%
mips64el           2 011 607 727       -----     +3.143%
ppc                2 492 948 019       -----     +2.673%
ppc64              2 464 696 695       -----     +2.487%
ppc64le            2 445 269 677       -----     +2.506%
riscv64            1 625 047 810       -----     +3.953%
s390x              4 194 606 558       -----     +6.623%
sh4                2 164 135 149       -----     +3.166%
sparc64            4 299 497 695       -----     +4.064%
x86_64             2 940 028 961       -----     +2.634%
--------------------------------------------------------
--------------------------------------------------------
Test Program: search_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 487 807 533       -----      +1.94%
alpha              1 680 724 295       -----     +2.835%
arm               11 563 305 294       -----     +2.849%
hppa               7 272 818 152       -----     +3.263%
m68k               1 998 808 824       -----     +3.198%
mips               1 656 590 390       -----     +1.959%
mipsel             1 659 453 252       -----     +1.947%
mips64             1 955 527 169       -----     +2.447%
mips64el           1 943 574 768       -----     +2.461%
ppc                2 320 355 726       -----     +2.332%
ppc64              2 552 647 223       -----     +2.742%
ppc64le            2 547 394 524       -----     +2.749%
riscv64            1 520 859 667       -----     +3.159%
s390x              5 497 976 223       -----     +1.078%
sh4                2 323 231 881       -----      +3.41%
sparc64            3 427 082 827       -----     +4.729%
x86_64             1 729 361 067       -----     +2.806%
--------------------------------------------------------


</pre></body></html>

--===============7260323371986803525==--

