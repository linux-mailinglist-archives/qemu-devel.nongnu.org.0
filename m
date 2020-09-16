Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E7BB826CE60
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 00:08:49 +0200 (CEST)
Received: from localhost ([::1]:48754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIfbc-0004lb-Fb
	for lists+qemu-devel@lfdr.de; Wed, 16 Sep 2020 18:08:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kIfaZ-0004MO-2j
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 18:07:43 -0400
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:41063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1kIfaX-0005ms-7X
 for qemu-devel@nongnu.org; Wed, 16 Sep 2020 18:07:42 -0400
Received: by mail-wr1-x434.google.com with SMTP id w5so8410193wrp.8
 for <qemu-devel@nongnu.org>; Wed, 16 Sep 2020 15:07:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:mime-version:from:to:date:subject;
 bh=PJr7+05uJCMIB6r7PsvUkNPCD5OeoTaRSCiCqv0k1X8=;
 b=HT4+gssYXm2q8QgLH9eIoYxNNNtOYeTgBOg6WMMN1uUcryNXvE4SeySnWzzbFiGIdJ
 /5MnrK3CkPcVZOEfSjLgCv/pr7uGGFeRglZ3st5T4obDfn7p+hbrM0rJfIMQ2Oz8v8Ls
 BXCaZRuNxItCiAsPzw/ghiylnn0x18e8+ChA2eK8a7NB0gpyZwjKcBlwSvGCRgyvWegU
 p69ps5osLo7S7s0pe4gSG+87+rDWZp14yQG5660L6QDjSeT9s9wcv0hfAtZgplzZEGXI
 3et2wCWsxEGarfzx5AcYuDQB8CVZ9aJcz+ZjFKIvUGWvzAyxQNiHNMvmCTYikp1/mSZE
 oz0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version:from:to:date:subject;
 bh=PJr7+05uJCMIB6r7PsvUkNPCD5OeoTaRSCiCqv0k1X8=;
 b=ZI4i/YFUMBOhBFut/VHa3Ek1vCwBmKy8yCTbi4t6/Wmy7gBF6zO54rolkWLbXkif13
 6NPBuc0Qb1ZVfC54khsYAPYQmnrOjpDwa6w0SvB8IKLvFRleaauUnxPD5kedozH/HCt0
 ms27ondMliX8e+6ToJhH8KCfnWlf1LTuro53wrBd7CWEt8Zha4CrLMmX4ADeNZhzbq4l
 Qy8YGBS+JAhvxEwoSOt2nd9w6W+vG+cotcAi60+nr9hVGRzDb3cCqiOOejT7bXHeiToC
 saMWvMdTQybIyYTOvYuB/jFAAbhfgyljcnnWOUdTUuy4ffxeLhuMFRiRP/Fuj2GQwBgP
 Y+/Q==
X-Gm-Message-State: AOAM532DnJU9OBDXHmHiTPfHQoIwtpROkSfwQkMOXYP9FwXlHG+/jGSk
 Q4ocUtNCgOuw5Ruw5ckOkvzb4D0Z7Kw=
X-Google-Smtp-Source: ABdhPJyCocxCFIJ88lR3EKMieQPjIzCBrGTuWsZd+3KhJWko+6PL+f44vdZXxY+7dh7/iL+ZaS5Hgw==
X-Received: by 2002:a5d:6caf:: with SMTP id a15mr29017475wra.344.1600294058700; 
 Wed, 16 Sep 2020 15:07:38 -0700 (PDT)
Received: from [127.0.1.1] ([197.58.52.97])
 by smtp.gmail.com with ESMTPSA id 92sm37670839wra.19.2020.09.16.15.07.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Sep 2020 15:07:37 -0700 (PDT)
Message-ID: <5f628ca9.1c69fb81.a40be.a654@mx.google.com>
Content-Type: multipart/alternative;
 boundary="===============2293978337153399634=="
MIME-Version: 1.0
From: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
To: qemu-devel@nongnu.org
Date: Thu, 17 Sep 2020 00:07:32 +0200
Subject: [REPORT] Nightly Performance Tests - Wednesday, September 16, 2020
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=ahmedkhaledkaraman@gmail.com; helo=mail-wr1-x434.google.com
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

--===============2293978337153399634==
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

<html><body><pre>
Host CPU         : Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
Host Memory      : 15.49 GB

Start Time (UTC) : 2020-09-16 21:35:02
End Time (UTC)   : 2020-09-16 22:07:32
Execution Time   : 0:32:29.941492

Status           : SUCCESS

Note:
Changes denoted by '-----' are less than 0.01%.

--------------------------------------------------------
            SUMMARY REPORT - COMMIT 8ee61272
--------------------------------------------------------
                    AVERAGE RESULTS
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 158 513 150       -----     +1.703%
alpha              1 914 947 541       -----     +3.522%
arm                8 076 527 003       -----     +2.308%
hppa               4 261 673 329       -----     +3.163%
m68k               2 690 293 359       -----     +7.134%
mips               1 861 902 263       -----     +2.484%
mipsel             2 008 240 685       -----     +2.676%
mips64             1 918 624 648       -----     +2.817%
mips64el           2 051 554 799       -----     +3.025%
ppc                2 480 174 328       -----     +3.109%
ppc64              2 576 701 038       -----     +3.142%
ppc64le            2 558 820 807       -----     +3.171%
riscv64            1 406 685 833       -----     +2.648%
s390x              3 158 140 071       -----     +3.119%
sh4                2 364 606 066       -----     +3.341%
sparc64            3 318 698 928       -----     +3.855%
x86_64             1 775 941 661       -----     +2.167%
--------------------------------------------------------

                   DETAILED RESULTS
--------------------------------------------------------
Test Program: dijkstra_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            3 062 745 624       -----     +1.429%
alpha              3 191 842 908       -----     +3.695%
arm               16 357 299 506       -----     +2.348%
hppa               7 228 387 843       -----     +3.086%
m68k               4 294 056 834       -----     +9.693%
mips               3 051 314 790       -----     +2.423%
mipsel             3 231 546 887       -----      +2.87%
mips64             3 245 814 633       -----     +2.596%
mips64el           3 414 215 768       -----     +3.021%
ppc                4 914 556 467       -----      +4.74%
ppc64              5 098 137 458       -----     +4.565%
ppc64le            5 082 383 704       -----     +4.579%
riscv64            2 192 269 006       -----     +1.954%
s390x              4 584 587 692       -----     +2.898%
sh4                3 949 197 667       -----     +3.468%
sparc64            4 586 104 947       -----     +4.235%
x86_64             2 484 245 797       -----     +1.757%
--------------------------------------------------------
--------------------------------------------------------
Test Program: dijkstra_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 210 360 293       -----     +1.501%
alpha              1 494 111 691       -----     +2.149%
arm                8 263 044 506       -----     +2.667%
hppa               5 207 306 045       -----     +3.047%
m68k               1 725 880 564       -----     +2.528%
mips               1 495 110 368       -----     +1.484%
mipsel             1 497 169 328       -----     +1.481%
mips64             1 715 421 334       -----     +1.894%
mips64el           1 695 209 677       -----     +1.909%
ppc                2 014 602 126       -----     +1.822%
ppc64              2 206 256 217       -----     +2.138%
ppc64le            2 197 967 863       -----     +2.145%
riscv64            1 354 884 068       -----     +2.394%
s390x              2 916 098 604       -----     +1.236%
sh4                1 990 693 666       -----     +2.678%
sparc64            2 874 142 164       -----     +3.827%
x86_64             1 554 138 606       -----      +2.13%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            1 412 417 224       -----     +0.312%
alpha              3 233 972 467       -----     +7.473%
arm                8 545 300 144       -----      +1.09%
hppa               3 483 516 785       -----     +4.466%
m68k               3 919 111 292       -----    +18.433%
mips               2 344 644 680       -----     +4.085%
mipsel             3 329 922 415       -----     +5.178%
mips64             2 359 029 035       -----     +4.075%
mips64el           3 343 640 141       -----     +5.166%
ppc                3 209 498 342       -----     +3.247%
ppc64              3 287 492 489       -----     +3.173%
ppc64le            3 287 139 805       -----     +3.172%
riscv64            1 221 606 224       -----     +0.277%
s390x              2 874 163 578       -----     +5.826%
sh4                3 544 104 659       -----      +6.42%
sparc64            3 426 093 790       -----     +7.138%
x86_64             1 249 074 159       -----     +0.335%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64              598 849 290       -----     +0.614%
alpha                372 421 527       -----     +0.673%
arm                  746 701 945       -----     +1.479%
hppa                 674 262 347       -----     +1.181%
m68k                 410 573 125       -----     +0.919%
mips                 499 569 698       -----     +0.505%
mipsel               499 534 043       -----     +0.504%
mips64               481 536 611       -----     +0.595%
mips64el             465 055 187       -----     +0.619%
ppc                  341 373 763       -----     +0.956%
ppc64                393 782 076       -----     +0.962%
ppc64le              393 946 608       -----     +0.957%
riscv64              351 686 870       -----     +0.778%
s390x                494 453 514       -----     +0.604%
sh4                  402 832 141       -----      +0.94%
sparc64              495 859 747       -----     +1.173%
x86_64               403 090 322       -----     +0.874%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 709 844 598       -----     +2.423%
alpha              1 969 441 131       -----     +3.679%
arm                8 323 162 789       -----     +2.589%
hppa               3 188 306 263       -----       +2.9%
m68k               4 953 945 309       -----    +15.153%
mips               2 123 792 134       -----     +3.049%
mipsel             2 124 245 545       -----     +3.049%
mips64             1 999 032 821       -----     +3.404%
mips64el           1 996 422 106       -----     +3.408%
ppc                2 819 292 527       -----     +5.436%
ppc64              2 768 174 645       -----     +5.512%
ppc64le            2 724 770 326       -----     +5.602%
riscv64            1 638 311 731       -----      +4.02%
s390x              2 519 121 025       -----     +3.364%
sh4                2 595 705 920       -----     +3.001%
sparc64            3 988 891 870       -----     +2.744%
x86_64             2 033 622 123       -----     +3.242%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 193 564 781       -----     +2.924%
alpha              1 521 270 291       -----     +4.191%
arm                3 465 576 821       -----     +2.759%
hppa               2 280 027 399       -----     +3.821%
m68k               1 843 184 147       -----     +3.583%
mips               1 557 902 048       -----     +3.854%
mipsel             1 560 659 413       -----     +3.851%
mips64             1 563 400 635       -----     +4.411%
mips64el           1 542 675 391       -----     +4.474%
ppc                1 728 740 551       -----     +3.667%
ppc64              1 842 432 964       -----     +3.555%
ppc64le            1 791 790 880       -----     +3.659%
riscv64            1 348 869 693       -----     +4.654%
s390x              2 184 089 336       -----      +3.32%
sh4                1 946 651 461       -----     +3.632%
sparc64            3 452 122 741       -----     +2.934%
x86_64             1 813 701 223       -----     +3.546%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 592 362 540       -----     +2.473%
alpha              1 855 815 639       -----     +3.486%
arm                7 347 821 471       -----     +2.684%
hppa               4 758 745 598       -----     +3.542%
m68k               2 376 781 988       -----     +3.566%
mips               2 166 448 905       -----     +2.525%
mipsel             2 163 390 872       -----     +2.528%
mips64             2 029 239 289       -----     +3.117%
mips64el           2 011 623 990       -----     +3.144%
ppc                2 492 961 613       -----     +2.674%
ppc64              2 464 688 318       -----     +2.487%
ppc64le            2 445 219 975       -----     +2.504%
riscv64            1 625 026 163       -----     +3.952%
s390x              4 194 618 628       -----     +6.623%
sh4                2 164 283 129       -----     +3.173%
sparc64            4 299 396 665       -----     +4.062%
x86_64             2 940 164 421       -----     +2.639%
--------------------------------------------------------
--------------------------------------------------------
Test Program: search_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 487 960 855       -----     +1.946%
alpha              1 680 704 675       -----     +2.834%
arm               11 563 308 846       -----     +2.849%
hppa               7 272 834 358       -----     +3.263%
m68k               1 998 813 614       -----     +3.198%
mips               1 656 435 485       -----     +1.949%
mipsel             1 659 456 983       -----     +1.947%
mips64             1 955 522 831       -----     +2.446%
mips64el           1 943 596 136       -----     +2.462%
ppc                2 320 369 235       -----     +2.333%
ppc64              2 552 644 142       -----     +2.742%
ppc64le            2 547 347 296       -----     +2.747%
riscv64            1 520 832 915       -----     +3.157%
s390x              5 497 988 198       -----     +1.078%
sh4                2 323 379 889       -----     +3.417%
sparc64            3 426 979 505       -----     +4.726%
x86_64             1 729 496 637       -----     +2.814%
--------------------------------------------------------


</pre></body></html>

--===============2293978337153399634==--

