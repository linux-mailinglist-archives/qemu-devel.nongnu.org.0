Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 988852478E4
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Aug 2020 23:34:19 +0200 (CEST)
Received: from localhost ([::1]:39374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k7mlm-0003Di-4e
	for lists+qemu-devel@lfdr.de; Mon, 17 Aug 2020 17:34:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1k7mke-0002kN-C5
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 17:33:08 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:45018)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ahmedkhaledkaraman@gmail.com>)
 id 1k7mkc-0008DG-Ki
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 17:33:08 -0400
Received: by mail-wr1-x435.google.com with SMTP id c15so16306493wrs.11
 for <qemu-devel@nongnu.org>; Mon, 17 Aug 2020 14:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:mime-version:from:to:date:subject;
 bh=WMfGtsf8NwV+MNrj65Au+yOs+j8tojrNnFciV4QFH9g=;
 b=WXOKxMG/p0XNwXhnu4c1V8CtMv22nOeGe1B+kWDviQVyNfeAw84bxiIeyhWVDzzDdQ
 +5bR3/h3HXeFMtGfx0JdVFK98dmtfRoPonQtlZauqgl29CDjo9EcUG8r4KMwHGKEhkPF
 waxk+GTReisVosQY0+mnZk4iljkFTKdFu7g+OoI1c+rRC1JzJ3M1dDyg+DgCgorxQb5E
 3FrqLAz/NsRe9RN+sfvvysbEPcUKu8GiwFXdABy/VDsZGUexh34CYbfymA44p8NUjKGT
 nZ7NpP8nFKIWOcZExXzVUm8xBAIbfBU0ZJvjuOFVvN3RoO1s0VCMNtySndYDuAepZEXx
 FMkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:mime-version:from:to:date:subject;
 bh=WMfGtsf8NwV+MNrj65Au+yOs+j8tojrNnFciV4QFH9g=;
 b=gnK9T2HHR9li6RREz8oGiR6sQroLvRPNyg64+C3GvbSEqdvBGZCYIvkKq4kDsbt50l
 YnwYf5EM06+L1rzCG7UGTG1vog7xIXnd6H+yNqT5NPZQB6DhNlMQyjGvJDgZEVNDBKX3
 z9LSKjWZWlW3ppXA9iU3EyTFmvGEbT05R0nGfwZ8PU1fsRJKmmDD+TFD7S1hameYcA4h
 IYo6kZjcbxHHoePkYCfKDQnADrNzql/h6yWp4xLBqYTqoBuI3dGUV8IlpRDlQ7kmj2Iq
 XD+ZVWGA7l+57cm43MS5zx/zkj8etZ6EX3DX5dto3jI7Ka5gAQEZJSxJAnPDcMjFjlvF
 ojGw==
X-Gm-Message-State: AOAM533KxRHZriIBP3qtDdz+gbTspX3HjIVu8WtZff+6MK4T6HRlA4Lx
 eOJd02nUfUcr1HH6VGx1lToLOZBBEOE=
X-Google-Smtp-Source: ABdhPJy9dqwHb8YE7PBE/7aHI56TWiKYQHyc7gvbGl/gTM8uNgZpd4XRtbW/ei+N+Lt1/UFUZ9DKuA==
X-Received: by 2002:a5d:4942:: with SMTP id r2mr15987628wrs.285.1597699984097; 
 Mon, 17 Aug 2020 14:33:04 -0700 (PDT)
Received: from [127.0.1.1] ([197.58.59.51])
 by smtp.gmail.com with ESMTPSA id e5sm34411198wrc.37.2020.08.17.14.33.00
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Aug 2020 14:33:03 -0700 (PDT)
Message-ID: <5f3af78f.1c69fb81.97a7e.4eea@mx.google.com>
Content-Type: multipart/alternative;
 boundary="===============2016997837605296470=="
MIME-Version: 1.0
From: Ahmed Karaman <ahmedkhaledkaraman@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon, 17 Aug 2020 23:32:56 +0200
Subject: [REPORT] Nightly Performance Tests - Monday, August 17, 2020
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=ahmedkhaledkaraman@gmail.com; helo=mail-wr1-x435.google.com
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

--===============2016997837605296470==
Content-Type: text/html; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

<html><body><pre>
Host CPU         : Intel(R) Core(TM) i7-8750H CPU @ 2.20GHz
Host Memory      : 15.49 GB

Start Time (UTC) : 2020-08-17 21:00:02
End Time (UTC)   : 2020-08-17 21:32:56
Execution Time   : 0:32:54.277771

Status           : SUCCESS

--------------------------------------------------------
            SUMMARY REPORT - COMMIT d0ed6a69
--------------------------------------------------------
                    AVERAGE RESULTS
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 118 484 532     -0.021%     -0.021%
alpha              1 838 408 254     -0.027%     -0.027%
arm                7 887 995 569       -----       -----
hppa               4 124 996 446       -----       -----
m68k               2 453 419 250      -0.02%     -0.021%
mips               1 812 637 396     -0.017%     -0.017%
mipsel             1 947 725 268       -----       -----
mips64             1 862 496 009     -0.019%     -0.018%
mips64el           1 984 212 701     -0.023%     -0.023%
ppc                2 394 318 517     -0.027%     -0.027%
ppc64              2 488 040 654     -0.031%     -0.031%
ppc64le            2 470 197 723     -0.025%     -0.024%
riscv64            1 367 775 048     -0.031%      -0.03%
s390x              3 058 500 465     -0.016%     -0.015%
sh4                2 278 492 108     -0.024%     -0.024%
sparc64            3 187 005 638     -0.029%     -0.028%
x86_64             1 734 476 702     -0.039%     -0.039%
--------------------------------------------------------

                   DETAILED RESULTS
--------------------------------------------------------
Test Program: dijkstra_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            3 019 613 375       -----       -----
alpha              3 078 112 807     -0.011%     -0.011%
arm               15 982 081 632       -----       -----
hppa               7 012 014 478       -----       -----
m68k               3 914 629 819       -----       -----
mips               2 979 141 054     -0.011%     -0.011%
mipsel             3 141 391 180       -----       -----
mips64             3 163 713 165     -0.015%     -0.015%
mips64el           3 314 105 649       -----       -----
ppc                4 692 147 232       -----       -----
ppc64              4 875 585 401       -----       -----
ppc64le            4 859 856 713       -----       -----
riscv64            2 150 267 506     -0.012%     -0.012%
s390x              4 455 509 097       -----       -----
sh4                3 816 843 006       -----       -----
sparc64            4 399 787 202       -----       -----
x86_64             2 441 371 659      -0.03%      -0.03%
--------------------------------------------------------
--------------------------------------------------------
Test Program: dijkstra_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 177 687 572       -----       -----
alpha              1 462 695 833     -0.023%     -0.023%
arm                8 048 442 356       -----       -----
hppa               5 053 364 798       -----       -----
m68k               1 683 344 745      -0.02%     -0.019%
mips               1 473 262 443     -0.018%     -0.018%
mipsel             1 475 326 897     -0.023%     -0.022%
mips64             1 683 560 967     -0.017%     -0.017%
mips64el           1 663 469 676     -0.029%     -0.029%
ppc                1 978 580 290     -0.019%     -0.019%
ppc64              2 160 088 912     -0.013%     -0.012%
ppc64le            2 151 841 073     -0.027%     -0.026%
riscv64            1 323 229 277     -0.029%     -0.029%
s390x              2 880 511 627     -0.012%     -0.012%
sh4                1 938 788 554     -0.017%     -0.017%
sparc64            2 768 224 289     -0.022%     -0.022%
x86_64             1 521 726 637     -0.031%     -0.031%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            1 408 042 239       -----       -----
alpha              3 009 131 606     -0.012%     -0.011%
arm                8 453 191 424       -----       -----
hppa               3 334 593 493       -----       -----
m68k               3 309 164 187       -----     -0.011%
mips               2 252 644 413       -----       -----
mipsel             3 166 010 236     -0.011%     -0.011%
mips64             2 266 660 280     -0.013%     -0.013%
mips64el           3 179 409 047     -0.016%     -0.016%
ppc                3 108 562 496     -0.012%     -0.012%
ppc64              3 186 407 268       -----       -----
ppc64le            3 186 105 564     -0.016%     -0.016%
riscv64            1 218 227 327     -0.033%     -0.033%
s390x              2 715 958 418     -0.016%     -0.015%
sh4                3 330 301 508     -0.014%     -0.014%
sparc64            3 197 867 346     -0.019%     -0.019%
x86_64             1 244 925 540     -0.037%     -0.037%
--------------------------------------------------------
--------------------------------------------------------
Test Program: matmult_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64              595 215 772     -0.112%     -0.112%
alpha                369 955 753     -0.093%     -0.089%
arm                  735 847 070     -0.046%     -0.045%
hppa                 666 411 949     -0.057%     -0.055%
m68k                 406 853 401     -0.092%     -0.092%
mips                 497 080 253     -0.064%     -0.064%
mipsel               497 032 444     +0.031%      +0.03%
mips64               478 688 768     -0.038%     -0.038%
mips64el             462 213 489     -0.075%      -0.08%
ppc                  338 164 189     -0.112%     -0.116%
ppc64                390 044 099      -0.29%      -0.29%
ppc64le              390 235 716     -0.074%     -0.069%
riscv64              348 992 188     -0.095%     -0.091%
s390x                491 498 130     -0.068%     -0.068%
sh4                  399 097 245     -0.084%     -0.087%
sparc64              490 133 825     -0.198%     -0.195%
x86_64               399 616 483     -0.077%     -0.083%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_double
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 645 742 660     -0.014%     -0.014%
alpha              1 899 562 380     -0.017%     -0.018%
arm                8 113 109 063       -----       -----
hppa               3 098 469 712       -----       -----
m68k               4 302 046 990       -----       -----
mips               2 060 965 452       -----       -----
mipsel             2 061 404 227     -0.016%     -0.017%
mips64             1 933 228 800     -0.016%     -0.015%
mips64el           1 930 636 064     -0.012%     -0.012%
ppc                2 673 959 835     -0.014%     -0.015%
ppc64              2 623 577 249     +0.012%     +0.011%
ppc64le            2 580 240 702     -0.044%     -0.043%
riscv64            1 575 021 467     -0.019%     -0.017%
s390x              2 437 149 697     -0.013%     -0.012%
sh4                2 520 103 128     -0.019%     -0.019%
sparc64            3 882 355 918       -----       -----
x86_64             1 969 779 237     -0.028%     -0.027%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_int32
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 131 273 662       -----       -----
alpha              1 460 088 037     -0.022%     -0.022%
arm                3 372 531 122     -0.011%       -----
hppa               2 196 131 760     -0.017%     -0.017%
m68k               1 779 453 300     -0.018%     -0.018%
mips               1 500 100 234     -0.022%     -0.021%
mipsel             1 502 804 039       -----     +0.012%
mips64             1 497 349 736     -0.034%     -0.034%
mips64el           1 476 629 779     -0.017%     -0.018%
ppc                1 667 588 374     -0.023%     -0.023%
ppc64              1 779 200 846     -0.029%     -0.028%
ppc64le            1 728 565 206     +0.017%     +0.019%
riscv64            1 288 899 773      -0.02%     -0.019%
s390x              2 113 931 520     -0.016%     -0.016%
sh4                1 878 437 892     -0.019%     -0.017%
sparc64            3 353 727 341     +0.015%     +0.015%
x86_64             1 751 619 045     -0.054%     -0.053%
--------------------------------------------------------
--------------------------------------------------------
Test Program: qsort_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 529 808 615     -0.014%     -0.014%
alpha              1 793 315 155     -0.019%     -0.019%
arm                7 155 793 785       -----       -----
hppa               4 595 956 434       -----       -----
m68k               2 294 970 438     -0.015%     -0.015%
mips               2 113 124 191       -----       -----
mipsel             2 110 049 451     -0.016%     -0.016%
mips64             1 967 925 432     -0.015%     -0.015%
mips64el           1 950 320 902     -0.013%     -0.012%
ppc                2 428 055 964     -0.016%     -0.015%
ppc64              2 404 893 975     +0.013%     +0.013%
ppc64le            2 385 487 511     -0.044%     -0.045%
riscv64            1 563 271 752     -0.019%     -0.019%
s390x              3 934 077 088       -----       -----
sh4                2 097 733 836     -0.023%     -0.023%
sparc64            4 131 596 670     +0.022%     +0.022%
x86_64             2 864 598 377     -0.034%     -0.034%
--------------------------------------------------------
--------------------------------------------------------
Test Program: search_string
--------------------------------------------------------
Target              Instructions      Latest      v5.1.0
----------  --------------------  ----------  ----------
aarch64            2 440 492 367     -0.027%     -0.027%
alpha              1 634 404 461     -0.021%     -0.021%
arm               11 242 968 106       -----       -----
hppa               7 043 028 948       -----       -----
m68k               1 936 891 123     -0.017%     -0.017%
mips               1 624 781 129     -0.021%      -0.02%
mipsel             1 627 783 674     -0.017%     -0.015%
mips64             1 908 840 924       -----       -----
mips64el           1 896 917 007     -0.019%     -0.017%
ppc                2 267 489 756     -0.018%     -0.018%
ppc64              2 484 527 488     +0.057%     +0.057%
ppc64le            2 479 249 302     -0.012%     -0.012%
riscv64            1 474 291 096     -0.023%     -0.021%
s390x              5 439 368 148       -----       -----
sh4                2 246 631 696     -0.015%     -0.015%
sparc64            3 272 352 518     -0.029%     -0.029%
x86_64             1 682 176 638     -0.019%     -0.019%
--------------------------------------------------------


</pre></body></html>

--===============2016997837605296470==--

